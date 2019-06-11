Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB7C3C935
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 12:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA27289175;
	Tue, 11 Jun 2019 10:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA9189175
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 10:44:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5FC3B803BD;
 Tue, 11 Jun 2019 12:44:37 +0200 (CEST)
Date: Tue, 11 Jun 2019 12:44:35 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/4] drm/mga: drop dependency on drm_os_linux.h
Message-ID: <20190611104435.GA31250@ravnborg.org>
References: <20190608081923.6274-1-sam@ravnborg.org>
 <20190608081923.6274-2-sam@ravnborg.org>
 <2a7f442c-af70-9209-e678-0689469bb308@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a7f442c-af70-9209-e678-0689469bb308@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=xskk7pQaG2PfbjEa70MA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKPiA+ICsjZGVmaW5lIE1HQV9SRUFEOChyZWcpIFwKPiA+ICsJcmVhZGIoKCh2
b2lkIF9faW9tZW0gKilkZXZfcHJpdi0+bW1pby0+aGFuZGxlKSArIChyZWcpKQo+ID4gKyNkZWZp
bmUgTUdBX1JFQUQocmVnKSBcCj4gPiArCXJlYWRsKCgodm9pZCBfX2lvbWVtICopZGV2X3ByaXYt
Pm1taW8tPmhhbmRsZSkgKyAocmVnKSkKPiA+ICsjZGVmaW5lIE1HQV9XUklURTgocmVnLCB2YWwp
IFwKPiA+ICsJd3JpdGViKHZhbCwgKCh2b2lkIF9faW9tZW0gKilkZXZfcHJpdi0+bW1pby0+aGFu
ZGxlKSArIChyZWcpKQo+ID4gKyNkZWZpbmUgTUdBX1dSSVRFKHJlZywgdmFsKSBcCj4gPiArCXdy
aXRlbCh2YWwsICgodm9pZCBfX2lvbWVtICopZGV2X3ByaXYtPm1taW8tPmhhbmRsZSkgKyAocmVn
KSkKPiAKPiBBZGRpdGlvbiBpcyBub3QgZGVmaW5lZCBvciBpbXBsZW1lbnRhdGlvbiBzcGVjaWZp
YyBmb3IgdHlwZSB2b2lkKiBJSVJDLgo+IENvbXBpbGVycyB0ZW5kIHRvIHRyZWF0IGl0IGxpa2Ug
dTgqLiBNYXliZSBjYXN0IG1taW8tPmhhbmRsZSB0byAodTgKPiBfX2lvbWVtICopIGluc3RlYWQ/
CkkgYnJpZWZseSBsb29rZWQgYXQgY2hhbmdpbmcgdGhlIHR5cGUgb2YgbW1pby0+aGFuZGxlCgpU
b2RheToKCgl2b2lkICpoYW5kbGU7ICAgICAgICAgICAgLyoqPCBVc2VyLXNwYWNlOiAiSGFuZGxl
IiB0byBwYXNzIHRvIG1tYXAoKSAqLwoKUHJvcG9zYWw6Cgl2b2lkIF9faW9tZW0gKmhhbmRsZTsg
ICAgICAgICAgICAvKio8IFVzZXItc3BhY2U6ICJIYW5kbGUiIHRvIHBhc3MgdG8gbW1hcCgpICov
CgpUaGlzIHdvdWxkIGFsbG93IG1lIHRvIGRyb3AgdGhlIGNhc3QgaW4gdGhlIGNvZGUgYWJvdmUs
IHRoYXQgaXMgb25seQphZGRlZCB0byBtYWtlIHNwYXJzZSBoYXBweS4KQnV0IHRoZSBhYm92ZSB0
cmlnZ2VyZWQgb3RoZXIgc3BhcnNlIHdhcm5pbmdzIGFuZCBJIGVuZGVkIHVwIGRyb3BwaW5nCnRo
aXMuCgpBcyBmb3IgKHZvaWQgKikgdmVyc3VzICh1OCAqKSwgdGhlbiAodm9pZCAqKSBpcyB3aGF0
IHdlIGRvIHRvZGF5LgpbV2hhdCBEYW5pZWwgYWxzbyBzYXlzIGluIGFub3RoZXIgbWFpbF0uCgpT
aG91bGQgd2UgY2hhbmdlIHRoZSB0eXBlIEkgd291bGQgcHJlcGZlciBhIGZvbGxvdy11cCBwYXRj
aCB0byBkbyBpdC4KCklmIHlvdSBjb3VsZCB0ZXN0IGl0IEkgY2FuIHR5cGUgdGhlIHBhdGNoLCBv
ciB5b3UgY291bGQgZG8gc28gd2hlbgp3b3JraW5nIHdpdGggdGhlIGRyaXZlci4KCglTYW0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
