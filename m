Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8D9175B8B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 14:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7191D6E3EC;
	Mon,  2 Mar 2020 13:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E4D6E3EC;
 Mon,  2 Mar 2020 13:27:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AE529D0;
 Mon,  2 Mar 2020 14:27:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583155654;
 bh=0emwsHp+d43WQsbi4VSX7XA1OnErJJHxgkYWvrximDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MsxzPjdPnKlPA4KILzORNTcRJEyrkysPpVvr7kr9Uh79UtngzduYMJvShZBdwhx5M
 GizO9pzH8edvfZJzWHjoZEwdqnT792U7EQvK+3NTeJ7csa9eGWl1U+j4aZSq0aEZCK
 cRw7GAJ/ZbXnjMJkLsmdf4CVCRYcRtFjLg3cjtVI=
Date: Mon, 2 Mar 2020 15:27:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH 7/9] drm/bridge: remove unused variable warning in
 tc358764_detach
Message-ID: <20200302132709.GN11960@pendragon.ideasonboard.com>
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200302125649.61443-8-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302125649.61443-8-pankaj.laxminarayan.bharadiya@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGFua2FqLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpZb3UgY2FuIHNxdWFzaCB0aGlz
IHdpdGggdGhlIHBhdGNoIHRoYXQgaW50cm9kdWNlZCB0aGUgaXNzdWUgaW4gdGhlIHNhbWUKc2Vy
aWVzLiBPdGhlcndpc2Ugd2Ugd2lsbCBiZSBsZWZ0IHdpdGggYSBjb21waWxhdGlvbiBicmVha2Fn
ZSBpbiB0aGUKaGlzdG9yeSwgd2hpY2ggY291bGQgYmUgYW5ub3lpbmcgd2hlbiBiaXNlY3Rpbmcg
aXNzdWVzLgoKT24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMDY6MjY6NDdQTSArMDUzMCwgUGFua2Fq
IEJoYXJhZGl5YSB3cm90ZToKPiBkcm1fZGV2aWNlIHBvaW50ZXIgaXMgbm90IGdldHRpbmcgdXNl
ZCBpbiB0YzM1ODc2NF9kZXRhY2goKSBhbnltb3JlLAo+IGhlbmNlIHJlbW92ZSBpdC4KPiAKPiBU
aGlzIGZpeGVzIGJlbG93IHdhcm5pbmcuCj4gCj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1
ODc2NC5jOiBJbiBmdW5jdGlvbiDigJh0YzM1ODc2NF9kZXRhY2jigJk6Cj4gZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90YzM1ODc2NC5jOjM4NjoyMTogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKA
mGRybeKAmSBbLVd1bnVzZWQtdmFyaWFibGVdCj4gICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0g
YnJpZGdlLT5kZXY7Cj4gICAgICAgICAgICAgICAgICAgICAgXn5+Cj4gCj4gU2lnbmVkLW9mZi1i
eTogUGFua2FqIEJoYXJhZGl5YSA8cGFua2FqLmxheG1pbmFyYXlhbi5iaGFyYWRpeWFAaW50ZWwu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY0LmMgfCAxIC0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90YzM1ODc2NC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
NC5jCj4gaW5kZXggNTMwMzQyZGQ0YTM0Li41YWMxNDMwZmFiMDQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90YzM1ODc2NC5jCj4gQEAgLTM4Myw3ICszODMsNiBAQCBzdGF0aWMgaW50IHRjMzU4NzY0
X2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ICBzdGF0aWMgdm9pZCB0YzM1ODc2
NF9kZXRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAgewo+ICAJc3RydWN0IHRjMzU4
NzY0ICpjdHggPSBicmlkZ2VfdG9fdGMzNTg3NjQoYnJpZGdlKTsKPiAtCXN0cnVjdCBkcm1fZGV2
aWNlICpkcm0gPSBicmlkZ2UtPmRldjsKPiAgCj4gIAlkcm1fY29ubmVjdG9yX3VucmVnaXN0ZXIo
JmN0eC0+Y29ubmVjdG9yKTsKPiAgCWRybV9wYW5lbF9kZXRhY2goY3R4LT5wYW5lbCk7CgotLSAK
UmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
