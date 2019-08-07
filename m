Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC2184EDB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654016E716;
	Wed,  7 Aug 2019 14:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25486E716
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:37:30 +0000 (UTC)
Received: from localhost (lpr83-1-88-168-111-231.fbx.proxad.net
 [88.168.111.231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97E612199C;
 Wed,  7 Aug 2019 14:37:29 +0000 (UTC)
Date: Wed, 7 Aug 2019 16:37:25 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 0/5] drm-misc-next: Revert patches missing reviews
Message-ID: <20190807143725.rdcypgt6ti76r6fq@flea>
References: <20190807142101.251400-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807142101.251400-1-sean@poorly.run>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565188650;
 bh=pyAeJ5gqltjrc2Fv/hfIIPhzxtiXcwNUBCL4EjIrsD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ENqrfkA9zK+h5rHkciLnZbOdfWWpU+veby+9mhhPQ3v8lhlx5MVvRCrbR/wZnQTRQ
 uSy6iSbg0FfBK4TAw5QY8SPB8J6EP9ngH/ORGa/TVF3zn+43x5rluxSpqxaD1GueKA
 zckrI2PqP/FL6DxZ66D0L3fxSxnaI9+znCSIyrCI=
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
Cc: dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAxMDoyMDo1M0FNIC0wNDAwLCBTZWFuIFBhdWwg
d3JvdGU6Cj4gRnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4KPiBIZWxs
b29vLAo+IFRoaXMgaGFzIGJlZW4gY292ZXJlZCBhZCBuYXVzZWFtIG9uIHRoZSBtLWwgYW5kIGly
YywgYnV0IGZvciB0aGUgcmVjb3JkOgo+Cj4gUmV2aWV3cyBhcmUgYSBtYW5kYXRvcnkgcmVxdWly
ZW1lbnQgZm9yIHBhdGNoZXMgaW4gZHJtLW1pc2MtbmV4dCwgaXQncwo+IHdoYXQga2VlcHMgdXMg
YWxsIGhvbmVzdCBpbiB0aGUgY29tbWl0dGVyIG1vZGVsLiBUaGUgbW9zdCByZWNlbnQKPiBkcm0t
bWlzYy1uZXh0IHB1bGwgaW5jbHVkZWQgYSBoYW5kZnVsIG9mIHBhdGNoZXMgdGhhdCB3ZXJlIG1p
c3NpbmcKPiByZXZpZXdzLiBUaGVyZSB3YXMgYWJzb2x1dGVseSB6ZXJvIG5lZmFyaW91cyBpbnRl
bnQsIGJ1dCBydWxlcyBhcmUKPiBydWxlcywgc28gd2UncmUgcmV2ZXJ0aW5nIHRoZW0uCj4KPiBJ
IGZlZWwgY29uZmlkZW50IHJlLWFwcGx5aW5nIGFsbCBvZiB0aGVzZSB3aXRoIG15IFNvQiwgc28g
SSBwbGFuIG9uCj4gZG9pbmcgdGhhdCBpbiB0aGUgc2FtZSBwdXNoLgo+Cj4gVGhhbmtzIHRvIGV2
ZXJ5b25lIGZvciBoYW5kbGluZyB0aGlzIHNvIHdlbGwsIHNlcmlvdXNseSBhd2Vzb21lIHRoYXQK
PiB3ZSBjYW4gc3RheSBjb25zdHJ1Y3RpdmUgYXMgYSBjb21tdW5pdHkgXG8vLgo+Cj4gTGFzdGx5
LCB0aGlzIHdpbGwgYmUgY2F1Z2h0IGJ5IG91ciB0b29saW5nIGluIHRoZSBmdXR1cmUgc28gdGhp
cyBzaG91bGQKPiBiZSB0aGUgbGFzdCB0aW1lIHRoaXMgaGFwcGVucyAob24gYWNjaWRlbnQpLgoK
VGhhbmtzIGZvciB0YWtpbmcgY2FyZSBvZiB0aGlzOgoKQWNrZWQtYnk6IE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CgpNYXhpbWUKCi0tCk1heGltZSBSaXBhcmQsIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
