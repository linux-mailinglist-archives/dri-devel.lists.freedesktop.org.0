Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773022DBA6
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5087A6E2D4;
	Wed, 29 May 2019 11:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DD2895C4;
 Wed, 29 May 2019 01:17:07 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id DC95F3E93F;
 Wed, 29 May 2019 01:17:05 +0000 (UTC)
Date: Tue, 28 May 2019 21:17:05 -0400
From: Brian Masney <masneyb@onstation.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
Message-ID: <20190529011705.GA12977@basecamp>
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1559092626;
 bh=624x27QESSEqdHdt8jzd0ud8U0qgsoYwZR247KGLs0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bhY0pU6QI6vSQUXwTbKMMbwo2QHJ971xqn7eUiLTyXSQeUKqVNIqC7ifzFhdxZgNT
 l98hUA5Uw9EK3nVmwFcPc4oFA+11WCN0M2L59LyFp97/pKisUVlzaN6JGOMNdO/Kcd
 OzcTKkDDlXjjeGCT/xTywIbT0MNrBbaAZ2MZWuz4=
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Dave Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDM6NDY6MTRQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBUaHUsIE1heSA5LCAyMDE5IGF0IDQ6MDQgQU0gQnJpYW4gTWFzbmV5IDxtYXNu
ZXliQG9uc3RhdGlvbi5vcmc+IHdyb3RlOgo+IAo+ID4gSGVyZSBpcyBhIHBhdGNoIHNlcmllcyB0
aGF0IGFkZHMgaW5pdGlhbCBkaXNwbGF5IHN1cHBvcnQgZm9yIHRoZSBMRwo+ID4gTmV4dXMgNSAo
aGFtbWVyaGVhZCkgcGhvbmUuIEl0J3Mgbm90IGZ1bGx5IHdvcmtpbmcgc28gdGhhdCdzIHdoeSBz
b21lCj4gPiBvZiB0aGVzZSBwYXRjaGVzIGFyZSBSRkMgdW50aWwgd2UgY2FuIGdldCBpdCBmdWxs
eSB3b3JraW5nLgo+ID4KPiA+IFRoZSBwaG9uZXMgYm9vdHMgaW50byB0ZXJtaW5hbCBtb2RlLCBo
b3dldmVyIHRoZXJlIGlzIGEgc2V2ZXJhbCBzZWNvbmQKPiA+IChvciBtb3JlKSBkZWxheSB3aGVu
IHdyaXRpbmcgdG8gdHR5MSBjb21wYXJlZCB0byB3aGVuIHRoZSBjaGFuZ2VzIGFyZQo+ID4gYWN0
dWFsbHkgc2hvd24gb24gdGhlIHNjcmVlbi4gVGhlIGZvbGxvd2luZyBlcnJvcnMgYXJlIGluIGRt
ZXNnOgo+IAo+IEkgdGVzdGVkIHRvIGFwcGx5IHBhdGNoZXMgMi02IGFuZCBnb3QgdGhlIGNvbnNv
bGUgdXAgb24gdGhlIHBob25lIGFzIHdlbGwuCj4gSSBzZWUgdGhlIHNhbWUgdGltb3V0cywgYW5k
IEkgYWxzbyBub3RpY2UgdGhlIHVwZGF0ZSBpcyBzbG93IGluIHRoZQo+IGRpc3BsYXksIGFzIGlm
IHRoZSBEU0kgcGFuZWwgd2FzIHJ1bm5pbmcgaW4gbG93IHBvd2VyIChMUCkgbW9kZS4KPiAKPiBX
YXMgYm9vdGluZyB0aGlzIHRvIGRvIHNvbWUgb3RoZXIgd29yaywgYnV0IGhhcHB5IHRvIHNlZSB0
aGUgcHJvZ3Jlc3MhCgpUaGFua3MhCgpJJ3ZlIGhhZCB0aHJlZSBwZW9wbGUgZW1haWwgbWUgb2Zm
IGxpc3QgcmVnYXJkaW5nIHRoZSBkaXNwbGF5IHdvcmtpbmcgb24KNC4xNyBiZWZvcmUgdGhlIG1z
bSBrbXMvZHJtIGRyaXZlciB3YXMgY29udmVydGVkIHRvIHRoZSBEUk0gYXRvbWljIEFQSSBzbwp0
aGlzIGVtYWlsIGlzIHRvIGdldCBzb21lIG1vcmUgaW5mb3JtYXRpb24gb3V0IHB1YmxpY2x5LgoK
SSBwdXNoZWQgdXAgYSBicmFuY2ggdG8gbXkgZ2l0aHViIHdpdGggMTUgcGF0Y2hlcyBhcHBsaWVk
IGFnYWluc3QgNC4xNwp0aGF0IGhhcyBhIHdvcmtpbmcgZGlzcGxheToKCmh0dHBzOi8vZ2l0aHVi
LmNvbS9tYXNuZXliL2xpbnV4L2NvbW1pdHMvZGlzcGxheS13b3Jrcy00LjE3CgpJdCdzIGluIGxv
dyBzcGVlZCBtb2RlIGJ1dCBpdHMgdXNhYmxlLiBUaGUgZmlyc3QgMTAgcGF0Y2hlcyBhcmUgaW4K
bWFpbmxpbmUgbm93IGFuZCB0aGUgbGFzdCA1IGFyZSBpbiBlc3NlbmNlIHRoaXMgcGF0Y2ggc2Vy
aWVzIHdpdGggdGhlCmV4Y2VwdGlvbiBvZiAnZHJtL2F0b21pYyttc206IGFkZCBoZWxwZXIgdG8g
aW1wbGVtZW50IGxlZ2FjeSBkaXJ0eWZiJy4KVGhlcmUncyBhIHNsaWdodGx5IGRpZmZlcmVudCB2
ZXJzaW9uIG9mIHRoYXQgcGF0Y2ggaW4gbWFpbmxpbmUgbm93LgoKSSdtIHBsYW5uaW5nIHRvIHdv
cmsgb24gdGhlIG1zbTg5NzQgaW50ZXJjb25uZWN0IHN1cHBvcnQgb25jZSBzb21lIG9mCnRoZSBv
dXRzdGFuZGluZyBpbnRlcmNvbm5lY3QgcGF0Y2hlcyBmb3IgdGhlIG1zbSBrbXMvZHJtIGRyaXZl
ciBhcnJpdmUKaW4gbWFpbmxpbmUuIEknZCByZWFsbHkgbGlrZSB0byB1bmRlcnN0YW5kIHdoeSB0
aGUgZGlzcGxheSB3b3JrcyBvbgo0LjE3IHdpdGggdGhvc2UgcGF0Y2hlcyB0aG91Z2guIEkgYXNz
dW1lIHRoYXQgaXQncyByZWxhdGVkIHRvIHRoZQp2YmxhbmsgZXZlbnRzIG5vdCB3b3JraW5nIHBy
b3Blcmx5PyBMZXQgbWUgcHJlZmFjZSB0aGlzIHdpdGggSSdtIGEKdG90YWwgRFJNIG5ld2JpZSwg
YnV0IGl0IGxvb2tlZCBsaWtlIHRoZSBwcmUtRFJNLWF0b21pYyBkcml2ZXIgd2Fzbid0Cmxvb2tp
bmcgZm9yIHRoZXNlIGV2ZW50cyBpbiB0aGUgYXRvbWljIGNvbW1pdHMgYmVmb3JlIHRoZSBtaWdy
YXRpb24/ClNlZSBjb21taXQgNzBkYjE4ZGNhNGUwICgiZHJtL21zbTogUmVtb3ZlIG1zbV9jb21t
aXQvd29ya2VyLCB1c2UgYXRvbWljCmhlbHBlciBjb21taXQiKSwgc3BlY2lmaWNhbGx5IHRoZSBk
cm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92YmxhbmtzKCkKY2FsbCB0aGF0IHdhcyBhZGRlZC4K
CkJyaWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
