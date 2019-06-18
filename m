Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7034B29C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8928A6E2A2;
	Wed, 19 Jun 2019 07:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD166E25A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 21:17:30 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id w196so8853153oie.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OVaisiOXoE8CbQX92HOyrJL+g6lUDABMWhLy1INrNs8=;
 b=KjUQpvM7q4xW5LPzMMgMsrRTzhS6zrXD+flvwNtUm9sKHEqVdDeHvUKSQBVj21dz5e
 9GMNNxmOKkuJ0bnbFYwC0WpYbBu8/5TeRLZ2KhOW/HVcaOdf29drq+qVlIoVnQzRGMSm
 0CgGEgYy92r+ZcoBXJ2/gOlsXM+UhBJwWz5WdPs13QOtQS59hfpXT8r/DeHSs81XMW5L
 y4cx8Uua7BTMBkCLclmJVWehB/tSYYvyvNo2bEGEh//rp0rWwvjNT/Ml5Lq67JTOd4e8
 xDAru9ZroZMIXgtbBMGMOP4m3wQZzM1nc8esMvQHO30uoYrragZKQv7DG8lx8hjv+RAK
 ZygQ==
X-Gm-Message-State: APjAAAVMjPSQGUp+SrjwuK375lwseWPsam/3k9wS7X97cDPb+s2nAe/a
 fWpEILa8LIlnEw1/4r40Vhx5RVbZrQ5iBPMZSGQSmQ==
X-Google-Smtp-Source: APXvYqwM5rdsu+2tscwSovuh/8/Anb5UmSPJu6tA1nsFIQjp4jCtEseqbfenFAQRa0EWvJ+Wgrw8cDcYjC5BdexcaM0=
X-Received: by 2002:aca:ab13:: with SMTP id u19mr396863oie.127.1560892650121; 
 Tue, 18 Jun 2019 14:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190618202425.15259-1-robdclark@gmail.com>
 <20190618202425.15259-6-robdclark@gmail.com>
 <CAOCk7NoTN6JEo7B=8P=T4C3t_Xr8eQUX=KG9j4N+jXZ8Pw2f4g@mail.gmail.com>
In-Reply-To: <CAOCk7NoTN6JEo7B=8P=T4C3t_Xr8eQUX=KG9j4N+jXZ8Pw2f4g@mail.gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 18 Jun 2019 14:17:16 -0700
Message-ID: <CAJs_Fx4ys6CsgfrLHsU_8DKmgNAB6DbF+AQaHOJzwfzMFKj-Tw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OVaisiOXoE8CbQX92HOyrJL+g6lUDABMWhLy1INrNs8=;
 b=Oz5HV1moPPoMk0SLnChqqtEqzhvfYwLU7u/hCFBWGfivTj/kHAznEvBv4R467lgKUO
 L2o4N+QjgGqsEEMT4nhuu34XkAv6TAvuLPG4rGiFrzyjtN+WuhwAOlydPGmDrk1cHusX
 sQaGvh6JEmDt3/1c+1QEanNN00IfKCa9rHtZo=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <sean@poorly.run>, Rajesh Yadav <ryadav@codeaurora.org>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Mamta Shukla <mamtashukla555@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTo0NCBQTSBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5o
dWdvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAxOCwgMjAxOSBhdCAyOjI1IFBN
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogR2Vv
cmdpIERqYWtvdiA8Z2VvcmdpLmRqYWtvdkBsaW5hcm8ub3JnPgo+ID4KPiA+IFRoZSBpbnRlcmNv
bm5lY3QgQVBJIHByb3ZpZGVzIGFuIGludGVyZmFjZSBmb3IgY29uc3VtZXIgZHJpdmVycyB0bwo+
ID4gZXhwcmVzcyB0aGVpciBiYW5kd2lkdGggbmVlZHMgaW4gdGhlIFNvQy4gVGhpcyBkYXRhIGlz
IGFnZ3JlZ2F0ZWQKPiA+IGFuZCB0aGUgb24tY2hpcCBpbnRlcmNvbm5lY3QgaGFyZHdhcmUgaXMg
Y29uZmlndXJlZCB0byB0aGUgbW9zdAo+ID4gYXBwcm9wcmlhdGUgcG93ZXIvcGVyZm9ybWFuY2Ug
cHJvZmlsZS4KPiA+Cj4gPiBVc2UgdGhlIEFQSSB0byBjb25maWd1cmUgdGhlIGludGVyY29ubmVj
dHMgYW5kIHJlcXVlc3QgYmFuZHdpZHRoCj4gPiBiZXR3ZWVuIEREUiBhbmQgdGhlIGRpc3BsYXkg
aGFyZHdhcmUgKE1EUCBwb3J0KHMpIGFuZCByb3RhdG9yCj4gPiBkb3duc2NhbGVyKS4KPiA+Cj4g
PiB2MjogdXBkYXRlIHRoZSBwYXRoIG5hbWVzIHRvIGJlIGNvbnNpc3RlbnQgd2l0aCBkcHUsIGhh
bmRsZSB0aGUgTlVMTAo+ID4gICAgIHBhdGggY2FzZSwgdXBkYXRlZCBjb21taXQgbXNnIGZyb20g
R2VvcmdpLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEdlb3JnaSBEamFrb3YgPGdlb3JnaS5kamFr
b3ZAbGluYXJvLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNo
cm9taXVtLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21k
cDVfa21zLmMgfCAxNCArKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9t
ZHA1L21kcDVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5j
Cj4gPiBpbmRleCA5NzE3OWJlYzg5MDIuLmVlYWM0MjlhY2Y0MCAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKPiA+IEBAIC0xNiw2ICsxNiw3IEBACj4g
PiAgICogdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNl
bnNlcy8+Lgo+ID4gICAqLwo+ID4KPiA+ICsjaW5jbHVkZSA8bGludXgvaW50ZXJjb25uZWN0Lmg+
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPgo+ID4KPiA+ICAjaW5jbHVkZSAibXNtX2Ry
di5oIgo+ID4gQEAgLTEwNTAsNiArMTA1MSwxOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNvbXBv
bmVudF9vcHMgbWRwNV9vcHMgPSB7Cj4gPgo+ID4gIHN0YXRpYyBpbnQgbWRwNV9kZXZfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICB7Cj4gPiArICAgICAgIHN0cnVjdCBp
Y2NfcGF0aCAqcGF0aDAgPSBvZl9pY2NfZ2V0KCZwZGV2LT5kZXYsICJtZHAwLW1lbSIpOwo+ID4g
KyAgICAgICBzdHJ1Y3QgaWNjX3BhdGggKnBhdGgxID0gb2ZfaWNjX2dldCgmcGRldi0+ZGV2LCAi
bWRwMS1tZW0iKTsKPiA+ICsgICAgICAgc3RydWN0IGljY19wYXRoICpwYXRoX3JvdCA9IG9mX2lj
Y19nZXQoJnBkZXYtPmRldiwgInJvdGF0b3ItbWVtIik7Cj4gPiArCj4gPiArICAgICAgIGlmIChJ
U19FUlJfT1JfTlVMTChwYXRoMCkpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlJf
T1JfWkVSTyhwYXRoMCk7Cj4KPiBVbW0sIGFtIEkgbWlzdW5kZXJzdGFuZGluZyBzb21ldGhpbmc/
ICBJdCBzZWVtcyBsaWtlIG9mX2ljY19nZXQoKQo+IHJldHVybnMgTlVMTCBpZiB0aGUgcHJvcGVy
dHkgZG9lc24ndCBleGlzdC4gIFdvbid0IHRoaXMgYmUgYmFja3dhcmRzCj4gaW5jb21wYXRpYmxl
PyAgRXhpc3RpbmcgRFRzIHdvbid0IHNwZWNpZnkgdGhlIHByb3BlcnR5LCBhbmQgSSBkb24ndAo+
IGJlbGlldmUgdGhlIHByb3BlcnR5IGlzIHN1cHBvcnRlZCBvbiBhbGwgdGFyZ2V0cy4gIFNlZW1z
IGxpa2Ugd2UnbGwKPiBicmVhayB0aGluZ3MgYnkgbm90IGNhbGxpbmcgdGhlIGJlbG93IGNvbXBv
bmVudF9hZGQoKSBpZiB0aGUKPiBpbnRlcmNvbm5lY3QgaXMgbm90IHN1cHBvcnRlZCwgc3BlY2lm
aWVkLCBvciB0aGUgaW50ZXJjb25uZWN0IGRyaXZlcgo+IGlzIG5vdCBjb21waWxlZC4KCmhtbSwg
cmlnaHQsIEkgZ3Vlc3MgSSBzaG91bGQgdGVzdCB0aGlzIHcvb3V0IHRoZSBkdHMgcGF0Y2guLiBw
cm9iYWJseQpzaG91bGQganVzdCByZXZlcnQgYmFjayB0byB0aGUgcHJldmlvdXMgbG9naWMuLgoK
QlIsCi1SCgo+ID4gKyAgICAgICBpY2Nfc2V0X2J3KHBhdGgwLCAwLCBNQnBzX3RvX2ljYyg2NDAw
KSk7Cj4gPiArCj4gPiArICAgICAgIGlmICghSVNfRVJSX09SX05VTEwocGF0aDEpKQo+ID4gKyAg
ICAgICAgICAgICAgIGljY19zZXRfYncocGF0aDEsIDAsIE1CcHNfdG9faWNjKDY0MDApKTsKPiA+
ICsgICAgICAgaWYgKCFJU19FUlJfT1JfTlVMTChwYXRoX3JvdCkpCj4gPiArICAgICAgICAgICAg
ICAgaWNjX3NldF9idyhwYXRoX3JvdCwgMCwgTUJwc190b19pY2MoNjQwMCkpOwo+ID4gKwo+ID4g
ICAgICAgICBEQkcoIiIpOwo+ID4gICAgICAgICByZXR1cm4gY29tcG9uZW50X2FkZCgmcGRldi0+
ZGV2LCAmbWRwNV9vcHMpOwo+ID4gIH0KPiA+IC0tCj4gPiAyLjIwLjEKPiA+Cj4gPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gRnJlZWRyZW5vIG1h
aWxpbmcgbGlzdAo+ID4gRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
