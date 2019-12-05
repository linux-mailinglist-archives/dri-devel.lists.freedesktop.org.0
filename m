Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FA411417C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 14:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB896F601;
	Thu,  5 Dec 2019 13:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DDB6F601
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 13:31:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4C2A2E5;
 Thu,  5 Dec 2019 14:31:51 +0100 (CET)
Date: Thu, 5 Dec 2019 15:31:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 25/28] drm: rcar-du: lvds: Use drm_bridge_init()
Message-ID: <20191205133144.GD16034@pendragon.ideasonboard.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-26-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204114732.28514-26-mihail.atanassov@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575552712;
 bh=OlzJQeXceRJgsnnh77/SjoLKrK5XCVPM7Hy9RbqiHdw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CKTeE0NQKD4ShPu2jMegLlRN8NZ2Qc30giL23qsV/HqkNxN/YTrB2XvHTcoCFqev0
 CCSZUP9t2snzW6bXKoGDrx5OIiooulNkJg7jj6rgKU1dVjwBOcDx3Hb21cTvM7HfBr
 TlT+2JlwdjOxiwrBpM0IRBQicYG4U/5Zex3vU7rY=
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWloYWlsLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBXZWQsIERlYyAwNCwgMjAx
OSBhdCAxMTo0ODoyM0FNICswMDAwLCBNaWhhaWwgQXRhbmFzc292IHdyb3RlOgo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFp
bC5hdGFuYXNzb3ZAYXJtLmNvbT4KCklmIHlvdSBzcXVhc2ggdGhpcyB3aXRoIDI2LzI4LAoKUmV2
aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgNSAr
Ky0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCj4gaW5kZXggOGM2YzE3MmJiZjJlLi5h
YzFmMjliYWNmY2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9s
dmRzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwo+IEBAIC04
ODEsOSArODgxLDggQEAgc3RhdGljIGludCByY2FyX2x2ZHNfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiAgCWlmIChyZXQgPCAwKQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IC0J
bHZkcy0+YnJpZGdlLmRyaXZlcl9wcml2YXRlID0gbHZkczsKPiAtCWx2ZHMtPmJyaWRnZS5mdW5j
cyA9ICZyY2FyX2x2ZHNfYnJpZGdlX29wczsKPiAtCWx2ZHMtPmJyaWRnZS5vZl9ub2RlID0gcGRl
di0+ZGV2Lm9mX25vZGU7Cj4gKwlkcm1fYnJpZGdlX2luaXQoJmx2ZHMtPmJyaWRnZSwgJnBkZXYt
PmRldiwgJnJjYXJfbHZkc19icmlkZ2Vfb3BzLAo+ICsJCQlOVUxMLCBsdmRzKTsKPiAgCj4gIAlt
ZW0gPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwo+ICAJ
bHZkcy0+bW1pbyA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCBtZW0pOwoKLS0g
ClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
