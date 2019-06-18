Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DF749AB1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739F189F2E;
	Tue, 18 Jun 2019 07:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5286689F2E;
 Tue, 18 Jun 2019 07:35:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE1FCD5;
 Tue, 18 Jun 2019 09:35:46 +0200 (CEST)
Date: Tue, 18 Jun 2019 10:35:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 28/59] drm/shmob: Drop drm_gem_prime_export/import
Message-ID: <20190618073530.GE4800@pendragon.ideasonboard.com>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-29-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-29-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560843347;
 bh=9B6lsHamppvchomwWGBfoo1wRcyGvNZz1UhrpVEu6CQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nFmVTr6N1sb+HqTOChRrMimD7xIrvo0KDJ2Fh1k/NUTGlpO1Y/ubzo0DZpDE8pWrq
 VyJ5U5ffYnI5GFt+9et19JJ3htfRbfkrEXbtfizkle8Bva3j1aNW/R/WSNw+X8mIXg
 BBcTG7KqpS76WK5E5qCD68O9onoMfYYEa/RqXJ9Y=
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
Cc: linux-renesas-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBGcmksIEp1biAxNCwgMjAx
OSBhdCAxMDozNTo0NFBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFRoZXkncmUgdGhl
IGRlZmF1bHQuCj4gCj4gQXNpZGU6IFdvdWxkIGJlIHJlYWxseSBuaWNlIHRvIHN3aXRjaCB0aGUg
b3RoZXJzIG92ZXIgdG8KPiBkcm1fZ2VtX29iamVjdF9mdW5jcy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IENjOiBLaWVyYW4g
QmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+IENjOiBs
aW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcKClJldmlld2VkLWJ5OiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgpGZWVsIGZyZWUgdG8g
bWVyZ2VkIHRoaXMgYXMgcGFydCBvZiB0aGUgc2VyaWVzLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3NobW9iaWxlL3NobW9iX2RybV9kcnYuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zaG1vYmlsZS9z
aG1vYl9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vc2htb2JpbGUvc2htb2JfZHJtX2Rydi5j
Cj4gaW5kZXggOTA0N2E0OWZmMzVlLi42YzEwNmI3YTNiZmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3NobW9iaWxlL3NobW9iX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zaG1vYmlsZS9zaG1vYl9kcm1fZHJ2LmMKPiBAQCAtMTMzLDggKzEzMyw2IEBAIHN0YXRpYyBz
dHJ1Y3QgZHJtX2RyaXZlciBzaG1vYl9kcm1fZHJpdmVyID0gewo+ICAJLmdlbV92bV9vcHMJCT0g
JmRybV9nZW1fY21hX3ZtX29wcywKPiAgCS5wcmltZV9oYW5kbGVfdG9fZmQJPSBkcm1fZ2VtX3By
aW1lX2hhbmRsZV90b19mZCwKPiAgCS5wcmltZV9mZF90b19oYW5kbGUJPSBkcm1fZ2VtX3ByaW1l
X2ZkX3RvX2hhbmRsZSwKPiAtCS5nZW1fcHJpbWVfaW1wb3J0CT0gZHJtX2dlbV9wcmltZV9pbXBv
cnQsCj4gLQkuZ2VtX3ByaW1lX2V4cG9ydAk9IGRybV9nZW1fcHJpbWVfZXhwb3J0LAo+ICAJLmdl
bV9wcmltZV9nZXRfc2dfdGFibGUJPSBkcm1fZ2VtX2NtYV9wcmltZV9nZXRfc2dfdGFibGUsCj4g
IAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1lX2ltcG9ydF9z
Z190YWJsZSwKPiAgCS5nZW1fcHJpbWVfdm1hcAkJPSBkcm1fZ2VtX2NtYV9wcmltZV92bWFwLAoK
LS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
