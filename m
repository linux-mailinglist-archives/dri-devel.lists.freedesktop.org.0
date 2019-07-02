Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C740A5D107
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 15:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB5B89E35;
	Tue,  2 Jul 2019 13:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4596689E35;
 Tue,  2 Jul 2019 13:53:22 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z25so27357182edq.9;
 Tue, 02 Jul 2019 06:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AoEb1XK5dWnAb/XBdu/lZ2XdsXhNA2v9oOFATUDjbD0=;
 b=Mf+GPhWj9e/hlEHmeEj3HafYMEVBluX5l7OtmX2di/HETxir++VfydokCW2URloN/P
 ASsW445HkS3QdzI+4WJwvad/94LR6RJp5O5sUu8uANAiXYyRXvuabpbPsZJjNoQski2Z
 5aird1nFfcaP5jwpAqm2AmoE2v1p/6l7zUOdDxLkVcdeg/lttsVftYUMNJxHkzagk0iQ
 2F4UgYQbypLNG01liO7XkKLiG9XG6W2H1at790v3kvkp7UiPqBxqNdewLCYe4EmLn0Ly
 YKIPGcR1gHGpl48okInsZaURmTf6on4+M4RoKSt3a/DMeXGpAbS+wBV1p7wnR4ecTzXY
 h/Mg==
X-Gm-Message-State: APjAAAWA/VBblCtT6gqtPB3JursopSoQc6AhIiX8rUV1AWJniMbouDsa
 8crrDa4lVIm411wWL86ofly5PEc82lQvj0DBUy0=
X-Google-Smtp-Source: APXvYqyI5MP1Q8XIiLRjo4pLVTzxgZBBN8zypGreqic/xheUF0/IxxIdEzjsWYjgmlEDl7MpPt0LDnPWwQX2r7zymnI=
X-Received: by 2002:a17:906:3f87:: with SMTP id
 b7mr28163648ejj.164.1562075600813; 
 Tue, 02 Jul 2019 06:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190630150230.7878-1-robdclark@gmail.com>
 <20190630150230.7878-5-robdclark@gmail.com>
 <75a2921d-bf1a-c4c1-6d9a-122474eface4@codeaurora.org>
 <CAF6AEGufiSU_sFZFdLH=KT5iCQGwccszURqAQCHd=dhuZafvZg@mail.gmail.com>
 <9fbf9226-578a-90aa-693d-9ea4fcda8281@codeaurora.org>
In-Reply-To: <9fbf9226-578a-90aa-693d-9ea4fcda8281@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 2 Jul 2019 06:53:05 -0700
Message-ID: <CAF6AEGuze-mnUQy36UvB-JCp3KUASgTa+0dh4i_AFdmYX0tzuw@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dsi: get the clocks into OFF state at init
To: Jeffrey Hugo <jhugo@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AoEb1XK5dWnAb/XBdu/lZ2XdsXhNA2v9oOFATUDjbD0=;
 b=rRQSPxyTMuRnQn9dQ6uPjqvkwKpDvf2xgxGrMy0XuEWVzfk3IEvNkguAVRY9nRJYfo
 gZah0iQhsaCPAwpjLSCemmq8gLLTpII+ti5c6I6TUMrtAzYuZhTP0K1rp+4RCDDgpWzE
 bZc0osHIzLMqxhMLGZhWF899HZ4WnRIySFcnFDj5Ms0T0D+3dNcKCDkMzSF5SWga0uyP
 VpYLcBDsXv2y3SSGlYyIshk4eC28J6M+XEqfASKd8VFtHF2FBaPTuCruVMppchbac3Ax
 AEP45WNtQ+9COLmubIsqWyYzl1QLchUtPfD4LccbjDoAwgxuqOVjD3OBBIag2Lf/5D08
 PWFg==
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
 Rajesh Yadav <ryadav@codeaurora.org>, Linux PM <linux-pm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
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
IGluIGV4YWN0aW5nIGRldGFpbD8KPgoKU28sIEkgd2VudCBiYWNrIHRvIGNoZWNrIHNvbWUgb2Yg
dGhlIGtlcm5lbCBsb2dzLCBhbmQgYWN0dWFsbHkgdGhlCmNhc2Ugd2hlcmUgd2Ugd2VyZSBoaXR0
aW5nIHRoZSBQTEwgbG9jayBmYWlsIHdhcyAtRVBST0JFX0RFRkVSIGNhc2VzLApzbyB3aGF0IHdh
cyBoYXBwZW5pbmcgaXMgdGhlIGVuYWJsZS9kaXNhYmxlIGN5Y2xlIHdvdWxkIHN1Y2NlZWQgdGhl
CmZpcnN0IHRpbWUsIGJ1dCB0aGVuIHdlJ2QgLUVQUk9CRV9ERUZFUi4gIFRoZW4gYWZ0ZXIgYSBz
dXNwZW5kL3Jlc3VtZQpjeWNsZSwgd2UnZCB0cnkgYWdhaW4sIGJ1dCB0aGlzIHRpbWUgcGxsJ3Mg
d2VyZSByZXNldCB0byBwb3dlciBvbgpzdGF0ZSwgYW5kIHdlIHdlcmVuJ3Qgc2V0dGluZyByYXRl
LgoKV2l0aCB0aGUgb3RoZXIgcGF0Y2hzZXRbMV0gSSBzZW50IG92ZXIgdGhlIHdlZWtlbmQsIHRo
aXMgc2hvdWxkIG5vCmxvbmdlciBiZSBhIHByb2JsZW0gc28gSSBjYW4gZHJvcCB0aGUgaGFjay4K
CkJSLAotUgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjMw
MDAvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
