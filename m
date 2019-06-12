Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C91FB41E35
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A721893BC;
	Wed, 12 Jun 2019 07:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241C5893BC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:48:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3421820024;
 Wed, 12 Jun 2019 09:48:27 +0200 (CEST)
Date: Wed, 12 Jun 2019 09:48:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/9] drm/ast: Pin framebuffer BO during dirty update
Message-ID: <20190612074826.GA31000@ravnborg.org>
References: <20190611130344.18988-1-tzimmermann@suse.de>
 <20190611130344.18988-6-tzimmermann@suse.de>
 <20190611202953.GA18315@ravnborg.org>
 <038d4a58-1980-3b76-ea53-9b354980723a@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <038d4a58-1980-3b76-ea53-9b354980723a@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Vt2AcnKqAAAA:8
 a=VwQbUJbxAAAA:8 a=hHT3lGbO40sb36ngVUYA:9 a=CjuIK1q_8ugA:10
 a=v10HlyRyNeVhbzM4Lqgd:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: maxime.ripard@bootlin.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKPiA+IAo+ID4gV2hpbGUgdG91Y2hpbmcgdGhpcyBjb2RlLCBhbnl3YXkgd2Ug
Y291bGQgZ2V0IHJpZCBvZiBkcm1fY2FuX3NsZWVwKCk/Cj4gPiBJIG9ubHkgYXNrIGJlY2F1c2Ug
RGFuaWVsIFYuIHNhaWQgdGhhdCB3ZSBzaG91bGQgbm90IHVzZSBpdC4KPiA+IFRoaXMgd2FzIHNv
bWUgbW9udGhzIGFnbyBkdXJpbmcgc29tZSBlaGFkZXIgZmlsZSBjbGVhbi11cCwgc28gbm90aGlu
Zwo+ID4gaW4gcGFydGljdWxhciByZWxhdGVkIHRvIHRoZSBhc3QgZHJpdmVyLgo+IAo+IEknbSBh
d2FyZSBvZiB3aGF0IGlzIGNvbW1lbnRlZCBpbiB0aGUgaGVhZGVyIGFuZCB0aGUgdG9kbyBmaWxl
LiBEbyB5b3UKPiBoYXZlIGEgbGluayB0byB0aGlzIGRpc2N1c3Npb24/CkkgbWFuYWdlZCB0byBk
aWcgdXAgdGhpcyBsaW5rOgpodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL2xpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcvbXNnMTg4NzM4OS5odG1sCkJ1dCB0aGF0IGRvZXMgbm90IHByb3Zp
ZGUgYW55IGFkZGl0aW9uYWwgdGVjaG5pY2FsIGRldGFpbHMuCgo+IEluIGFueSBjYXNlLCBJJ2Qg
cHJlZmVyIHRvIGZpeCB0aGlzIGluIGEgc2VwYXJhdGUgcGF0Y2ggc2V0LiBJIGhhdmUKPiBwYXRj
aGVzIHRoYXQgcmVwbGFjZSB0aGUgYXN0IGFuZCBtZ2FnMjAwIGZiZGV2IGNvbnNvbGVzIHdpdGgg
Z2VuZXJpYwo+IGNvZGUuIFRoYXQgbWlnaHQgYmUgdGhlIHJpZ2h0IHBsYWNlLgpVc2luZyBnZW5l
cmljIGNvZGUsIGFuZCB0aHVzIGRlbGV0aW5nIHRoZSBvbGQgY29kZSBzZWVtcyBsaWtlIGEgZ29v
ZApwbGFuLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
