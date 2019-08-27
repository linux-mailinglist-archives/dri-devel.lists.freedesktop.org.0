Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DCA9DD0A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 07:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED9B89AB3;
	Tue, 27 Aug 2019 05:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13FE89AC2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 05:13:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6BDBEA4D3E5;
 Tue, 27 Aug 2019 05:13:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E22B5D6B7;
 Tue, 27 Aug 2019 05:13:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2AC6692F; Tue, 27 Aug 2019 07:13:41 +0200 (CEST)
Date: Tue, 27 Aug 2019 07:13:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 00/17] drm: add gem ttm helpers, rework mmap workflow.
Message-ID: <20190827051341.tjnjhfih7noqaijl@sirius.home.kraxel.org>
References: <20190808134417.10610-1-kraxel@redhat.com>
 <510b8714-2b9a-ee1d-3b03-f2704c69637e@suse.de>
 <CAKMK7uFWbmxrTbh21fL6iW9de0cRyDsnUMa5rvFLg_0a-BidXg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFWbmxrTbh21fL6iW9de0cRyDsnUMa5rvFLg_0a-BidXg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Tue, 27 Aug 2019 05:13:42 +0000 (UTC)
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gQWxzbyB0aGlzIHBhdGNoIHNlcmllcyBhbHNvIGFkanVzdCB2cmFtIGhlbHBlcnMs
IGFuZCBJIHRoaW5rIGl0IGhhcyBhCj4gc2xpZ2h0bHkgZGlmZmVyZW50IGdvYWw6IEp1c3QgYWxp
Z25pbmcgbW1hcCBwYXRocyBhIGJpdCBtb3JlIGJldHdlZW4KPiB0dG0gYW5kIG5vdC10dG0gYmFz
ZWQgZHJpdmVycy4KCk5vdCBqdXN0IHR0bS9ub3QtdHRtLiAgZ2VtX2RyaXZlci0+Zm9wcy0+bW1h
cCBpcyB0aGUgb25seSBmb3BzIGNhbGxiYWNrCndoZXJlIHdlIGNhbid0IHVzZSBhIGdlbmVyaWMg
Z2VtIGNhbGxiYWNrIHRvZGF5LiAgVGhpcyBzZXJpZXMgdHJpZXMgdG8KZml4IHRoYXQgd2l0aCB0
aGUgbmV3IGRybV9nZW1fb2JqZWN0X2Z1bmNzLT5tbWFwIGhvb2ssIHNvIHRoZSBtbWFwKCkKY29k
ZSBwYXRoIGlzbid0IHRoZSBvZGQgb25lIHdoaWNoIHdvcmtzIGRpZmZlcmVudCB0aGFuIGV2ZXJ5
IG90aGVyCmRybV9nZW1fb2JqZWN0IG9wZXJhdGlvbi4KCj4gU2VlbXMgbGlrZSBhIGdvb2QgZ29h
bCwgZGV0YWlscyBtaWdodCBuZWVkIGFkanVzdG1lbnQuCgpXaGljaCBkZXRhaWxzPwoKY2hlZXJz
LAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
