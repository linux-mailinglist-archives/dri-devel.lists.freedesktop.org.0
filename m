Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD251A0EDC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 16:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF976E883;
	Tue,  7 Apr 2020 14:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A72F6E883
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 14:05:48 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id m2so3247825otr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1NdsvHQeHu5QTk7zrN8HxtBhQoh7MwqSb5UgLwBlUkg=;
 b=BoMvFf/VkDwYpMORHYEN6VhZl9zkCF1rwYWePM3AbCC/5ff6rDQ6ThJrNVEODSt+bj
 C9hPTShy6YVufNgRs01+mvvOpfYGjOhTMAVGjrFoHQ/daQJ5oJwp2XokTIqZS1ksJFln
 pU3ISmF/3RY5/iz70Bp+Eer6w1lT14oepTW34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1NdsvHQeHu5QTk7zrN8HxtBhQoh7MwqSb5UgLwBlUkg=;
 b=kNdLIgwVFfht+HXQlCrlAo8b1DBk8pQo4sku3L57Uzu484dT5ksldvhd4yXVCLtJuy
 jrWNVOq+iUFSGQspsXdvrlE/ikT46ZR3Hm7K+sUQmUcVMCeM6gfziOScK1RAvhcKQuJT
 wAjy/gwM3Ec/FVMH4LjPqmchUGZLeuCAbQE5KCbXf51NX1XLErGq6SMzwYDkx+gTnhft
 efRTIZhJMjxxr+VLKCEk0ai0YA7SD2mltASU/GnlWQ7eNGWI3JraphLq8tWTjnajm7o0
 3nC1xufSKLdGc9vLloSf5zh9iF0iA8TrT1rgpVZ/EP8GN2lC/t2qGvJ7JZ9Aa4dLBUwf
 GJRg==
X-Gm-Message-State: AGi0PuYUT7NYHQxQELw4pGnwkmum2bIz4NEbI8/f+Ov8eI5n2rWRN9Zw
 Z2htuPR2jQh0FIaAF2g7gxXm4mOC94vYe1bcAPMfKQ==
X-Google-Smtp-Source: APiQypL/RlVT2i69RdrWi7CstJmXxSmQgsRErYEyJetTK19b3yru1qFqr6NV0uNNQhhnA48y6Mo8ViTg31pruJQoNjs=
X-Received: by 2002:a05:6830:15d4:: with SMTP id
 j20mr1666775otr.303.1586268346055; 
 Tue, 07 Apr 2020 07:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200114134101.159194-1-liumartin@google.com>
 <20200224033941.GB211610@google.com>
 <CAO_48GEPKk64uepCqZEc=6XGiv4tZnPHv=RZdwzKPuUqOxjpow@mail.gmail.com>
In-Reply-To: <CAO_48GEPKk64uepCqZEc=6XGiv4tZnPHv=RZdwzKPuUqOxjpow@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 7 Apr 2020 16:05:34 +0200
Message-ID: <CAKMK7uH9gxp79VPfG+yMp+65_-+=U2iV1UH-SfzRnOc=9T4cPw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: support 32bit DMA_BUF_SET_NAME ioctl
To: Sumit Semwal <sumit.semwal@linaro.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 Minchan Kim <minchan@kernel.org>, jenhaochen@google.com,
 Wei Wang <wvw@google.com>, Martin Liu <liumartin@google.com>,
 surenb@google.com,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgNywgMjAyMCBhdCAzOjI2IFBNIFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2Fs
QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBEYW5pZWwsIHlvdXIgY29tbWVudHMg
aGVyZSwgcGxlYXNlPwoKRG9uJ3QgOi0pCgpJIG1lYW4gcnVsZSBvZiB0aHVtYiB5b3Ugc2hvdWxk
IG5ldmVyIG5lZWQgYSBjb21wYXRfaW9jdGwgZm9yIGEgbmV3CmlvY3RsLCB0aGF0J3MganVzdCBm
YWlsdXJlIHRvIHJlYWQKaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS40LXByZXBy
Yy1jcHUvaW9jdGwvYm90Y2hpbmctdXAtaW9jdGxzLmh0bWwKClNwZWNpZmljYWxseSB0aGUgY2hh
ciAqIHBvaW50ZXIgaW4gdGhlIGlvY3RsIGRlZmluaXRpb24gaXMgdGhlCnByb2JsZW0uIE5vdyB3
ZSdyZSBzb21ld2hhdCBsdWNreSBoZXJlLCBzaW5jZSB0aGUgYWN0dWFsIGxheW91dCBvZiB0aGUK
ZGF0YSBpc24ndCBkaWZmZXJlbnQgYmV0d2VlbiAzMiBhbmQgNjQgYml0LCBpdCdzIG9ubHkgdGhl
IGlvY3RsLiBXaGljaAppcyB0aGUgMm5kIGlzc3VlLCB0aGUgdHlwZSBpbiB0aGVyZSBzaG91bGQg
YmUgdGhlIHR5cGUgb2YgdGhlIGRhdGEgaW4KdXNlcnNwYWNlLCBub3QgdGhlIHR5cGUgb2YgdGhl
IF9wb2ludGVyXyB0byB0aGUgc3R1ZmYgaW4gdXNlcnNwYWNlLiBTbwpoZXJlIGFjdHVhbGx5IHZh
cmlhYmxlLXNpemVkIGNoYXJbXSBhcnJheSwgd2hpY2ggYWxzbyBkb2Vzbid0IHdvcmsKcmVhbGx5
LgoKQW55d2F5IEkndmUgY3JlYXRlZCBhIHF1aWNrIHBhdGNoIHRvIGhhdmUgZGlzdGluY3QgaW9j
dGwgbnVtYmVyCmRlZmluZXMgYW5kIGhhbmRsZSBib3RoIGluIHRoZSBtYWluIGhhbmRsZXIsIHRo
YXQgc2hvdWxkIHdvcmsuIENjJ2VkCmV2ZXJ5b25lIGZyb20gdGhpcyB0aHJlYWQsIHBsZWFzZSB0
ZXN0LgotRGFuaWVsCgo+Cj4gT24gTW9uLCAyNCBGZWIgMjAyMCBhdCAwOTowOSwgTWFydGluIExp
dSA8bGl1bWFydGluQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgSmFuIDE0LCAy
MDIwIGF0IDA5OjQxOjAxUE0gKzA4MDAsIE1hcnRpbiBMaXUgd3JvdGU6Cj4gPgo+ID4gQ0MgbW9y
ZSBNTHMgZm9yIHdpbmRlciByZXZpZXcuCj4gPgo+ID4gPiBUaGlzIGNvbW1pdCBhZGRzIFNFVF9O
QU1FIGlvY3RsIGNvdmVyc2lvbiB0bwo+ID4gPiBzdXBwb3J0IDMyIGJpdCBpb2N0bC4KPiA+ID4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogTWFydGluIExpdSA8bGl1bWFydGluQGdvb2dsZS5jb20+Cj4g
PiA+IC0tLQo+ID4gPiAgZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyB8IDIyICsrKysrKysrKysr
KysrKysrKysrKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1
Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+ID4gPiBpbmRleCBjZTQxY2Q5Yjc1OGEu
LmE3MzA0OGIzNDg0MyAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYu
Ywo+ID4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gPiA+IEBAIC0yNSw2ICsy
NSw3IEBACj4gPiA+ICAjaW5jbHVkZSA8bGludXgvbW0uaD4KPiA+ID4gICNpbmNsdWRlIDxsaW51
eC9tb3VudC5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3BzZXVkb19mcy5oPgo+ID4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2NvbXBhdC5oPgo+ID4gPgo+ID4gPiAgI2luY2x1ZGUgPHVhcGkvbGludXgv
ZG1hLWJ1Zi5oPgo+ID4gPiAgI2luY2x1ZGUgPHVhcGkvbGludXgvbWFnaWMuaD4KPiA+ID4gQEAg
LTQwOSwxMyArNDEwLDMyIEBAIHN0YXRpYyB2b2lkIGRtYV9idWZfc2hvd19mZGluZm8oc3RydWN0
IHNlcV9maWxlICptLCBzdHJ1Y3QgZmlsZSAqZmlsZSkKPiA+ID4gICAgICAgZG1hX3Jlc3ZfdW5s
b2NrKGRtYWJ1Zi0+cmVzdik7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICsjaWZkZWYgQ09ORklHX0NP
TVBBVAo+ID4gPiArc3RhdGljIGxvbmcgZG1hX2J1Zl9pb2N0bF9jb21wYXQoc3RydWN0IGZpbGUg
KmZpbGUsIHVuc2lnbmVkIGludCBjbWQsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIGFyZykKPiA+ID4gK3sKPiA+ID4gKyAgICAgc3dpdGNoIChfSU9D
X05SKGNtZCkpIHsKPiA+ID4gKyAgICAgY2FzZSBfSU9DX05SKERNQV9CVUZfU0VUX05BTUUpOgo+
ID4gPiArICAgICAgICAgICAgIC8qIEZpeCB1cCBwb2ludGVyIHNpemUqLwo+ID4gPiArICAgICAg
ICAgICAgIGlmIChfSU9DX1NJWkUoY21kKSA9PSBzaXplb2YoY29tcGF0X3VwdHJfdCkpIHsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGNtZCAmPSB+SU9DU0laRV9NQVNLOwo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgY21kIHw9IHNpemVvZih2b2lkICopIDw8IElPQ1NJWkVfU0hJRlQ7
Cj4gPiA+ICsgICAgICAgICAgICAgfQo+ID4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiAr
ICAgICB9Cj4gPiA+ICsgICAgIHJldHVybiBkbWFfYnVmX2lvY3RsKGZpbGUsIGNtZCwgKHVuc2ln
bmVkIGxvbmcpY29tcGF0X3B0cihhcmcpKTsKPiA+ID4gK30KPiA+ID4gKyNlbmRpZgo+ID4gPiAr
Cj4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBkbWFfYnVmX2ZvcHMg
PSB7Cj4gPiA+ICAgICAgIC5yZWxlYXNlICAgICAgICA9IGRtYV9idWZfcmVsZWFzZSwKPiA+ID4g
ICAgICAgLm1tYXAgICAgICAgICAgID0gZG1hX2J1Zl9tbWFwX2ludGVybmFsLAo+ID4gPiAgICAg
ICAubGxzZWVrICAgICAgICAgPSBkbWFfYnVmX2xsc2VlaywKPiA+ID4gICAgICAgLnBvbGwgICAg
ICAgICAgID0gZG1hX2J1Zl9wb2xsLAo+ID4gPiAgICAgICAudW5sb2NrZWRfaW9jdGwgPSBkbWFf
YnVmX2lvY3RsLAo+ID4gPiAtICAgICAuY29tcGF0X2lvY3RsICAgPSBjb21wYXRfcHRyX2lvY3Rs
LAo+ID4gPiArI2lmZGVmIENPTkZJR19DT01QQVQKPiA+ID4gKyAgICAgLmNvbXBhdF9pb2N0bCAg
ID0gZG1hX2J1Zl9pb2N0bF9jb21wYXQsCj4gPiA+ICsjZW5kaWYKPiA+ID4gICAgICAgLnNob3df
ZmRpbmZvICAgID0gZG1hX2J1Zl9zaG93X2ZkaW5mbywKPiA+ID4gIH07Cj4gPiA+Cj4gPiA+IC0t
Cj4gPiA+IDIuMjUuMC5yYzEuMjgzLmc4OGRmZGM0MTkzLWdvb2cKPiA+ID4KPgo+Cj4KPiAtLQo+
IFRoYW5rcyBhbmQgcmVnYXJkcywKPgo+IFN1bWl0IFNlbXdhbAo+IExpbmFybyBDb25zdW1lciBH
cm91cCAtIEtlcm5lbCBUZWFtIExlYWQKPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
