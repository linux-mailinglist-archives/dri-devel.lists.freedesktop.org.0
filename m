Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5592E74F
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 23:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A756E120;
	Wed, 29 May 2019 21:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB016E111
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 21:19:08 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id D752D60DB3; Wed, 29 May 2019 21:19:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id 1796A60769;
 Wed, 29 May 2019 21:19:06 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 29 May 2019 14:19:05 -0700
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dsi: add protection against NULL dsi device
In-Reply-To: <5ae613db-092c-f93d-dd96-a79a4e1eff3a@codeaurora.org>
References: <1551922134-22518-1-git-send-email-abhinavk@codeaurora.org>
 <20190307215947.GG114153@art_vandelay>
 <cd4c2e25f2785bc09da77e715a3d6c30@codeaurora.org>
 <5ae613db-092c-f93d-dd96-a79a4e1eff3a@codeaurora.org>
Message-ID: <455f4e431f1b984e53113d24701a4e05@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559164747;
 bh=JZCzZFiPCIsa7wae1cbLVZYKt6Ct56+YdloLzObbKL8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ewf6Ifhc8dKZ5jvRROzA+yb8Cjzj1e+ln9lY3ROQ7hyJ0cqv88md2cmoqtcQSi70/
 yxbrtOlak9rmUtkCXk2ICNKIqZ7XpSNna/AaskfFasVDjg/F/NJi4R+NJE0xAL/Cg7
 64TowcbRVD8FSHWeQI64T/AeHxHogCCT1vvuOUSk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559164746;
 bh=JZCzZFiPCIsa7wae1cbLVZYKt6Ct56+YdloLzObbKL8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RKpQzki1zcqhO4bg9uZcwrrb2TMhggb6ctXaG8Gz8ZSriTqkxjZhTn1W7JT++5Fp2
 PsTxERRAdL4HmquvctwrBdesWUg9KuiRya8JM+R/bA32xzSMI2TiAxGIBcXvBmhJdQ
 23UaZ7MI6Eh9PozFfhbhFzZ1TMS6vmz4oZUexn84=
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, hoegsberg@google.com, Sean Paul <sean@poorly.run>,
 chandanu@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yOSAxMzo0MywgSmVmZnJleSBIdWdvIHdyb3RlOgo+IE9uIDMvNy8yMDE5IDM6
MDIgUE0sIEFiaGluYXYgS3VtYXIgd3JvdGU6Cj4+IE9uIDIwMTktMDMtMDcgMTM6NTksIFNlYW4g
UGF1bCB3cm90ZToKPj4+IE9uIFdlZCwgTWFyIDA2LCAyMDE5IGF0IDA1OjI4OjU0UE0gLTA4MDAs
IEFiaGluYXYgS3VtYXIgd3JvdGU6Cj4+Pj4gV2hlbiBwYW5lbCBwcm9iZSBoYXBwZW5zIGFmdGVy
IERTSSBwcm9iZSwgdGhlIERTSSBwcm9iZQo+Pj4+IGlzIGRlZmVycmVkIGFzIHBlciBjdXJyZW50
IGRlc2lnbi4gSW4gdGhlIHByb2JlIGRlZmVyIHBhdGgKPj4+PiBkc2kgZGV2aWNlIGlzIGRlc3Ry
b3llZC4gVGhpcyBOVUxMIGRzaSBkZXZpY2UgY291bGQgYmUKPj4+PiBkZWZlcmVuY2VkIGJ5IHRo
ZSBwYW5lbCBwcm9iZSBpbiB0aGUgbWlwaV9kc2lfYXR0YWNoIHBhdGguCj4+Pj4gCj4+Pj4gQ2hl
Y2sgZm9yIE5VTEwgZHNpIGRldmljZSBiZWZvcmUgYWNjZXNzaW5nIGl0Lgo+Pj4gCj4+PiBJdCB3
b3VsZCBiZSByZWFsbHkgbmljZSB0byBzb3J0IGFsbCBvZiB0aGlzIG91dCBpbiBhIG1hbm5lciB0
aGF0J3MgCj4+PiBub3QKPj4+IHNwcmlua2xpbmcgTlVMTCBjaGVja3MgYXJvdW5kIHRoZSBkcml2
ZXIuIEkgc3BlbnQgNSBtaW51dGVzIGxvb2tpbmcgCj4+PiBhcm91bmQgYW5kCj4+PiBjb3VsZG4n
dCByZWFsbHkgbWFrZSBzZW5zZSBvZiBob3cgYWxsIG9mIHRoZXNlIHBpZWNlcyBpbnRlcmFjdCwg
YnV0IAo+Pj4gdGhpcyBzZWVtcwo+Pj4gbGlrZSBpdCBtaWdodCBiZSBhbiBhcmNoaXRlY3R1cmFs
IHByb2JsZW0gKHBlcmhhcHMgc2luY2UgZHB1IHdhcyAKPj4+IHVzaW5nIGl0cyBvd24KPj4+IHBh
bmVsIHN0dWZmIGluc3RlYWQgb2YgZHJtX3BhbmVsPykuCj4+PiAKPj4+IEFueXdheXMsIGl0J2Qg
YmUgbmljZSB0byBmaXggdGhhdC4KPj4+IAo+Pj4gSW4gdGhlIG1lYW50aW1lLCBjb3VsZCB5b3Ug
cGxlYXNlIGFkZCBhIGJpZyBjb21tZW50IGxpa2UgdGhlICFkZXYgCj4+PiBjaGVjayBpbiB0aGlz
Cj4+PiBmdW5jdGlvbiBleHBsYWluaW5nIGhvdyB0aGlzIHNpdHVhdGlvbiBjYW4gY29tZSB0byBw
YXNzPyBUaGF0IHdheSB0aGUgCj4+PiBrbm93bGVkZ2UKPj4+IGlzbid0IGxvc3QgYW5kIHdob2V2
ZXIgY29tZXMgYWxvbmcgdG8gY2xlYW4gdXAgYWxsIG9mIHRoZXNlIHByb2JlIAo+Pj4gY2hlY2tz
IHdpbGwKPj4+IGhhdmUgc29tZSBjbHVlIGFzIHRvIHdoYXQncyBnb2luZyBvbi4KPj4+IAo+Pj4g
U2Vhbgo+PiBbQWJoaW5hdl0gU3VyZSBTZWFuLCB3aWxsIGFkZCBhIGRldGFpbGVkIGNvbW1lbnQg
dG8gZXhwbGFpbiB0aGUgCj4+IHNjZW5hcmlvCj4gCj4gQWJoaW5hdiwgaXQgbG9va3MgbGlrZSB0
aGlzIG1heSBoYXZlIGRyb3BwZWQgb2ZmIHlvdXIgcmFkYXIuICBEbyB5b3UKPiBrbm93IHdoZW4g
eW91J2xsIGNvbWUgYmFjayB0byBpdD8KSGkgSmVmZiwgWWVzIGkgd2lsbCB1cGxvYWQgYSB2MiB3
aXRoIGEgZGV0YWlsZWQgY29tbWVudCBhcyBzZWFuIApyZXF1ZXN0ZWQgd2l0aGluIHRoaXMgd2Vl
ay4KPiAKPj4+IAo+Pj4+IAo+Pj4+IFJlcG9ydGVkLWJ5OiBKZWZmcmV5IEh1Z28gPGpodWdvQGNv
ZGVhdXJvcmEub3JnPgo+Pj4+IFRlc3RlZC1ieTogSmVmZnJleSBIdWdvIDxqaHVnb0Bjb2RlYXVy
b3JhLm9yZz4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBYmhpbmF2IEt1bWFyIDxhYmhpbmF2a0Bjb2Rl
YXVyb3JhLm9yZz4KPj4+PiAtLS0KPj4+PiDCoGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9t
YW5hZ2VyLmMgfCAyICstCj4+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPj4+PiAKPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9k
c2kvZHNpX21hbmFnZXIuYyAKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9tYW5h
Z2VyLmMKPj4+PiBpbmRleCA4MGFhNjM0Li5jYzI1NjlkIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL2RzaV9tYW5hZ2VyLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jCj4+Pj4gQEAgLTc2OSw3ICs3NjksNyBAQCBib29sIG1z
bV9kc2lfbWFuYWdlcl9jbWRfeGZlcl90cmlnZ2VyKGludCBpZCwgCj4+Pj4gdTMyIGRtYV9iYXNl
LCB1MzIgbGVuKQo+Pj4+IMKgdm9pZCBtc21fZHNpX21hbmFnZXJfYXR0YWNoX2RzaV9kZXZpY2Uo
aW50IGlkLCB1MzIgZGV2aWNlX2ZsYWdzKQo+Pj4+IMKgewo+Pj4+IMKgwqDCoMKgIHN0cnVjdCBt
c21fZHNpICptc21fZHNpID0gZHNpX21ncl9nZXRfZHNpKGlkKTsKPj4+PiAtwqDCoMKgIHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYgPSBtc21fZHNpLT5kZXY7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2ID0gbXNtX2RzaSA/IG1zbV9kc2ktPmRldiA6IE5VTEw7Cj4+Pj4gwqDCoMKg
wqAgc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdjsKPj4+PiDCoMKgwqDCoCBzdHJ1Y3QgbXNt
X2ttcyAqa21zOwo+Pj4+IMKgwqDCoMKgIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKPj4+
PiAtLSBUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2Yg
dGhlIENvZGUgCj4+Pj4gQXVyb3JhIEZvcnVtLAo+Pj4+IGEgTGludXggRm91bmRhdGlvbiBDb2xs
YWJvcmF0aXZlIFByb2plY3QKPj4+PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
