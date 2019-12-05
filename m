Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9E114179
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 14:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FEC6F5A9;
	Thu,  5 Dec 2019 13:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02BA6F601
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 13:31:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89BB72E5;
 Thu,  5 Dec 2019 14:31:22 +0100 (CET)
Date: Thu, 5 Dec 2019 15:31:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 26/28] drm: rcar-du: lvds: Don't set drm_bridge
 private pointer
Message-ID: <20191205133115.GC16034@pendragon.ideasonboard.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-27-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204114732.28514-27-mihail.atanassov@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575552682;
 bh=xcgXt5UQtGbiHPz67BkPZ7M96OJxHolQhsjenNkfL8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=efI1kCK5aRPeq9tcnwg9U5YxHGLjSIyEWjWfWjTfI5q65MAZYohq/HgIV89tl3g00
 +3etPp0UGjyyvzot0ymIp2+Tu97Wn87KUpVjvUfRedjw/yaqMb9Weww5+bGK64RjOQ
 /Dkln2nq/Itzr9Oc+5VIkpV+vAd/PByjerEI6vLg=
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
OSBhdCAxMTo0ODoyNEFNICswMDAwLCBNaWhhaWwgQXRhbmFzc292IHdyb3RlOgo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlOiBpdCdzIG5vdCB1c2VkIGFueXdoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfbHZkcy5jCj4gaW5kZXggYWMxZjI5YmFjZmNiLi4xNjhhNzE4Y2JjYmQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwo+IEBAIC04ODIsNyArODgyLDcgQEAgc3RhdGljIGlu
dCByY2FyX2x2ZHNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlyZXR1
cm4gcmV0Owo+ICAKPiAgCWRybV9icmlkZ2VfaW5pdCgmbHZkcy0+YnJpZGdlLCAmcGRldi0+ZGV2
LCAmcmNhcl9sdmRzX2JyaWRnZV9vcHMsCj4gLQkJCU5VTEwsIGx2ZHMpOwo+ICsJCQlOVUxMLCBO
VUxMKTsKCllvdSBjYW4gc3F1YXNoIHRoaXMgd2l0aCAyNS8yOC4KCj4gIAo+ICAJbWVtID0gcGxh
dGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKPiAgCWx2ZHMtPm1t
aW8gPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgbWVtKTsKCi0tIApSZWdhcmRz
LAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
