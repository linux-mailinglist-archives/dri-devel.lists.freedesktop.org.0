Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA02872D9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 09:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF8B6E1D8;
	Fri,  9 Aug 2019 07:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AC56E1D8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 07:21:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C82148E382;
 Fri,  9 Aug 2019 07:21:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60D075C21A;
 Fri,  9 Aug 2019 07:21:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8A99116E32; Fri,  9 Aug 2019 09:21:33 +0200 (CEST)
Date: Fri, 9 Aug 2019 09:21:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: 1c74ca7a1a9a ("drm/fb-helper: call vga_remove_vgacon
 automatically.")
Message-ID: <20190809072133.2xlafq4qxitgky6l@sirius.home.kraxel.org>
References: <20190808174542.GN20745@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808174542.GN20745@zn.tnic>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 09 Aug 2019 07:21:35 +0000 (UTC)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDc6NDU6NDJQTSArMDIwMCwgQm9yaXNsYXYgUGV0a292
IHdyb3RlOgo+IEhpLAo+IAo+IGZvciBzb21lIHVuZmF0aG9tYWJsZSB0byBtZSByZWFzb24sIHRo
ZSBjb21taXQgaW4gJFN1YmplY3QgYnJlYWtzCj4gYm9vdGluZyBvZiB0aGUgMzItYml0IHBhcnRp
dGlvbiBvZiBvbmUgb2YgbXkgdGVzdCBib3hlcy4gVGhlIGJveCBkb2Vzbid0Cj4gZmluaXNoIGJv
b3RpbmcgKG5vcm1hbGx5IGl0IGJvb3RzIGluIHRleHQgbW9kZSwgdGhlcmUgaXMgbm8gWCBzZXJ2
ZXIKPiBzZXR1cCBvbiBpdCkgYnV0IGl0IGlzIHN0aWxsIHJlc3BvbnNpYmxlIGluIHRoZSBzZW5z
ZSB0aGF0IEkgY2FuIHJlYm9vdAo+IGl0IHdpdGggdGhlIFN5c3JxIGNvbWJpbmF0aW9uLiBObyBv
dGhlciBrZXlzdHJva2VzIGhhdmUgZWZmZWN0LgoKSXMgInRleHQgbW9kZSIgYWN0dWFsIHZnYSB0
ZXh0IG1vZGUgb3IgbGludXggY29uc29sZSBAIGZiY29uPwpXaGF0IGRpc3BsYXkgaGFyZHdhcmUg
ZG8geW91IGhhdmU/CgpDYW4geW91IHNzaCBpbnRvIHRoZSBtYWNoaW5lPyAgSWYgc28sIGNhbiB5
b3UgZ3JhYiBhIGtlcm5lbCBsb2cgcGxlYXNlPwpJZiBub3QgcGxlYXNlIHNlbmQgYSBrZXJuZWwg
bG9nIG9mIGEgYm9vdCB3aXRoIHRoZSBwYXRjaCByZXZlcnRlZC4KCnRoYW5rcywKICBHZXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
