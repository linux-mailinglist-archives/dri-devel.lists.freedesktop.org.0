Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16E55C3B2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 21:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0295589B7B;
	Mon,  1 Jul 2019 19:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427C089B7B;
 Mon,  1 Jul 2019 19:34:43 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id s49so24960841edb.1;
 Mon, 01 Jul 2019 12:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dH5otBSqw0uMng1APE66eD1anh4AuRLCKS7/pcECOGs=;
 b=oCfvB1GnfXgKwmwjsE+/VBxW8jw1gucjkaXwuhfZMdkub48yEWjz4Ix8VyfIFY7Qlm
 brIlpbFHWMmrk0uus5IHWpGBAMDY3PmfOdgfUx1DB6HknIrt+g7xRbG3H0c4vNrIbcif
 vE/hjzyo6kOCZsYnMAOeR8l9+K2zQEM4xKexqw1nFTPSpMOuO/jfvq5ZaLA30wZjtQ3L
 flHuShDW1hV1gUeFe/RHyu/cVKES6GPArHcMuE1AB1Tg5CTST8kSATdWV/xAN8DrUz1C
 zR70OXrO6WfUucSdQcE6n266wn/51OghbGmx3Hp1l17Sv7cd7xJQ4i4ynpnttDjqrpA8
 7Ohw==
X-Gm-Message-State: APjAAAUPPpEQFKx+zUOt/ZHQ7UwUIfQUn+NCaWcca4a8FFhysNzfls82
 fVCfGpfpFpS9MX1kYx4Pmobm5qzNjz09QnoGXpo=
X-Google-Smtp-Source: APXvYqysxgbCV5yDkdPFITNx3D9f1KGE0bjCekTf0dCIujzKvdxbtbeNQl49lrfoNKh2HZcftMIfUkLE0X4i8q1MDys=
X-Received: by 2002:a50:9203:: with SMTP id i3mr31774148eda.302.1562009681812; 
 Mon, 01 Jul 2019 12:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190630150230.7878-1-robdclark@gmail.com>
 <20190630150230.7878-5-robdclark@gmail.com>
 <75a2921d-bf1a-c4c1-6d9a-122474eface4@codeaurora.org>
 <CAF6AEGufiSU_sFZFdLH=KT5iCQGwccszURqAQCHd=dhuZafvZg@mail.gmail.com>
 <9fbf9226-578a-90aa-693d-9ea4fcda8281@codeaurora.org>
In-Reply-To: <9fbf9226-578a-90aa-693d-9ea4fcda8281@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 Jul 2019 12:34:25 -0700
Message-ID: <CAF6AEGtcyvhpAwsD+ykn5HYhBeHtW2kSgE6OA+d142O9AKx+CQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dsi: get the clocks into OFF state at init
To: Jeffrey Hugo <jhugo@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dH5otBSqw0uMng1APE66eD1anh4AuRLCKS7/pcECOGs=;
 b=u7jbcH+p2X/tuzpDREWK/E3T+1TETi5H4y9z15tTyth0yWW8unULF7SDv5GKf3DXu/
 iKw7O+9OOt+LVWTreNgtYn6G1fnh0saB/4NfUK3j5hdjCeNYneqIY75sSwgyrvjasHg6
 h2cei3CapWFLk5ZciJnKCkVHXP9xry8BglnSjQiB2VZBFVX1C/0BPsSp9wgQsuI4ZnYi
 pU2qxJByqB0lSFIV+06rZQIsmOCfK9NORvwIUQeB06OihVkVQ/HAsH5ljUoUczHA3QJr
 vHqtyckhkailRVUQCShN2cEVVY1zOQ5fC4mk2zqIMVv0ZpmH27vwVTt/T+LlrtykT4s4
 ZV7A==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Linux PM <linux-pm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMSwgMjAxOSBhdCAxMjowNyBQTSBKZWZmcmV5IEh1Z28gPGpodWdvQGNvZGVh
dXJvcmEub3JnPiB3cm90ZToKPgo+IE9uIDcvMS8yMDE5IDEyOjU4IFBNLCBSb2IgQ2xhcmsgd3Jv
dGU6Cj4gPiBPbiBNb24sIEp1bCAxLCAyMDE5IGF0IDExOjM3IEFNIEplZmZyZXkgSHVnbyA8amh1
Z29AY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gNi8zMC8yMDE5IDk6MDEgQU0s
IFJvYiBDbGFyayB3cm90ZToKPiA+Pj4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21p
dW0ub3JnPgo+ID4+Pgo+ID4+PiBEbyBhbiBleHRyYSBlbmFibGUvZGlzYWJsZSBjeWNsZSBhdCBp
bml0LCB0byBnZXQgdGhlIGNsa3MgaW50byBkaXNhYmxlZAo+ID4+PiBzdGF0ZSBpbiBjYXNlIGJv
b3Rsb2FkZXIgbGVmdCB0aGVtIGVuYWJsZWQuCj4gPj4+Cj4gPj4+IEluIGNhc2UgdGhleSB3ZXJl
IGFscmVhZHkgZW5hYmxlZCwgdGhlIGNsa19wcmVwYXJlX2VuYWJsZSgpIGhhcyBubyByZWFsCj4g
Pj4+IGVmZmVjdCwgb3RoZXIgdGhhbiBnZXR0aW5nIHRoZSBlbmFibGVfY291bnQvcHJlcGFyZV9j
b3VudCBpbnRvIHRoZSByaWdodAo+ID4+PiBzdGF0ZSBzbyB0aGF0IHdlIGNhbiBkaXNhYmxlIGNs
b2NrcyBpbiB0aGUgY29ycmVjdCBvcmRlci4gIFRoaXMgd2F5IHdlCj4gPj4+IGF2b2lkIGhhdmlu
ZyBzdHVjayBjbG9ja3Mgd2hlbiB3ZSBsYXRlciB3YW50IHRvIGRvIGEgbW9kZXNldCBhbmQgc2V0
IHRoZQo+ID4+PiBjbG9jayByYXRlcy4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUm9iIENs
YXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+ID4+PiAtLS0KPiA+Pj4gICAgZHJpdmVycy9n
cHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyAgICAgICAgIHwgMTggKysrKysrKysrKysrKysrLS0t
Cj4gPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BsbC9kc2lfcGxsXzEwbm0uYyB8ICAx
ICsKPiA+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGxs
L2RzaV9wbGxfMTBubS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGxsL2RzaV9wbGxfMTBu
bS5jCj4gPj4+IGluZGV4IGFhYmFiNjMxMTA0My4uZDAxNzJkOGRiODgyIDEwMDY0NAo+ID4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwvZHNpX3BsbF8xMG5tLmMKPiA+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGxsL2RzaV9wbGxfMTBubS5jCj4gPj4+IEBAIC0z
NTQsNiArMzU0LDcgQEAgc3RhdGljIGludCBkc2lfcGxsXzEwbm1fbG9ja19zdGF0dXMoc3RydWN0
IGRzaV9wbGxfMTBubSAqcGxsKQo+ID4+PiAgICAgICAgaWYgKHJjKQo+ID4+PiAgICAgICAgICAg
ICAgICBwcl9lcnIoIkRTSSBQTEwoJWQpIGxvY2sgZmFpbGVkLCBzdGF0dXM9MHglMDh4XG4iLAo+
ID4+PiAgICAgICAgICAgICAgICAgICAgICAgcGxsLT5pZCwgc3RhdHVzKTsKPiA+Pj4gK3JjID0g
MDsgLy8gSEFDSywgdGhpcyB3aWxsIGZhaWwgaWYgUExMIGFscmVhZHkgcnVubmluZy4uCj4gPj4K
PiA+PiBVbW0sIHdoeT8gIElzIHRoaXMgaW50ZW50aW9uYWw/Cj4gPj4KPiA+Cj4gPiBJIG5lZWQg
dG8gc29ydCBvdXQgYSBwcm9wZXIgc29sdXRpb24gZm9yIHRoaXMuLiBidXQgUExMIGxvY2sgd2ls
bCBmYWlsCj4gPiBpZiB0aGUgY2xrIGlzIGFscmVhZHkgcnVubmluZyAod2hpY2gsIGluIHRoYXQg
Y2FzZSwgaXMgZmluZSBzaW5jZSBpdAo+ID4gaXMgYWxyZWFkeSBydW5uaW5nIGFuZCBsb2NrZWQp
LCB3aGljaCB3aWxsIGNhdXNlIHRoZSBjbGtfZW5hYmxlIHRvCj4gPiBmYWlsLi4KPiA+Cj4gPiBJ
IGd1ZXNzIHRoZXJlIGlzIHNvbWUgd2F5IHRoYXQgSSBjYW4gY2hlY2sgdGhhdCBjbGsgaXMgYWxy
ZWFkeSBydW5uaW5nCj4gPiBhbmQgc2tpcCB0aGlzIGNoZWNrLi4KPgo+Cj4gSSdtIHNvcnJ5LCBi
dXQgdGhpcyBtYWtlcyBubyBzZW5zZSB0byBtZS4gIFdoYXQgY2xvY2sgYXJlIHdlIHRhbGtpbmcK
PiBhYm91dCBoZXJlPwo+Cj4gSWYgdGhlIHBsbCBpcyBsb2NrZWQsIHRoZSB0aGUgbG9jayBjaGVj
ayBzaG91bGQganVzdCBkcm9wIHRocm91Z2guICBJZgo+IHRoZSBwbGwgY2Fubm90IGxvY2ssIHlv
dSBoYXZlIGFuIGlzc3VlLiAgSSdtIGNvbmZ1c2VkIGFzIHRvIGhvdyBhbnkgb2YKPiB0aGUgZG93
bnN0cmVhbSBjbG9ja3MgY2FuIGFjdHVhbGx5IGJlIHJ1bm5pbmcgaWYgdGhlIHBsbCBpc24ndCBs
b2NrZWQuCj4KPiBJIGZlZWwgbGlrZSB3ZSBhcmUgbm90IHlldCBvbiB0aGUgc2FtZSBwYWdlIGFi
b3V0IHdoYXQgc2l0dWF0aW9uIHlvdQo+IHNlZW0gdG8gYmUgaW4uICBDYW4geW91IGRlc2NyaWJl
IGluIGV4YWN0aW5nIGRldGFpbD8KCnllYWgsIEknZCBleHBlY3QgdGhlIGxvY2sgYml0IHRvIHN0
aWxsIGJlIHNldCAoc2luY2UgdGhlIGRpc3BsYXkgaXMKb2J2aW91c2x5IHJ1bm5pbmcgYXQgdGhh
dCBwb2ludCkuLiAgYnV0IEkgZGlkbid0IHJlYWxseSBkZWJ1ZyBpdCB5ZXQsCkkganVzdCBoYWNr
ZWQgdGhhdCBpbiBzbyB0aGUgY2xrX2VuYWJsZSBkaWRuJ3QgZmFpbCwgc28gdGhhdCB3ZSBjb3Vs
ZApnZXQgY29ycmVjdCBlbmFibGUvcHJlcGFyZV9jb3VudHMgaW4gb3JkZXIgdG8gZG8gdGhlCmNs
a19kaXNhYmxlX3VucHJlcGFyZSgpLi4KCkJSLAotUgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
