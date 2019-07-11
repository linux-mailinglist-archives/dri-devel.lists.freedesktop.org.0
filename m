Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180276600D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 21:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F9E6E283;
	Thu, 11 Jul 2019 19:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9328E6E283
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 19:38:59 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DC24D803F1;
 Thu, 11 Jul 2019 21:38:56 +0200 (CEST)
Date: Thu, 11 Jul 2019 21:38:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override
 typical timing
Message-ID: <20190711193855.GB5912@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org>
 <20190630202246.GB15102@ravnborg.org>
 <CAD=FV=V_wTD1xpkXRe-z2HsZ8QXKq7jmq8CsfhMnFxi-5XDJjw@mail.gmail.com>
 <20190708175007.GA3511@ravnborg.org>
 <CAD=FV=XnDTKkscdCwFE1137aX6pTtv=5zqXf=yqcnchpZpt5_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XnDTKkscdCwFE1137aX6pTtv=5zqXf=yqcnchpZpt5_Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=Xl9dLsEvoqQTC_bOKBsA:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Jeffy Chen <jeffy.chen@rock-chips.com>, LKML <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric =?iso-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Zy4KCj4gPiA+ID4gPiBAQCAtOTEsNiArOTIsOCBAQCBzdHJ1Y3QgcGFuZWxfc2ltcGxl
IHsKPiA+ID4gPiA+ICAgICAgIHN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOwo+ID4gPiA+ID4KPiA+
ID4gPiA+ICAgICAgIHN0cnVjdCBncGlvX2Rlc2MgKmVuYWJsZV9ncGlvOwo+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gKyAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgb3ZlcnJpZGVfbW9kZTsKPiA+
ID4gPiBJIGZhaWwgdG8gc2VlIHdoZXJlIHRoaXMgcG9pdGVyIGlzIGFzc2lnbmVkLgo+ID4gPgo+
ID4gPiBJbiBwYW5lbF9zaW1wbGVfcGFyc2Vfb3ZlcnJpZGVfbW9kZSgpLiAgU3BlY2lmaWNhbGx5
Ogo+ID4gPgo+ID4gPiBkcm1fZGlzcGxheV9tb2RlX2Zyb21fdmlkZW9tb2RlKCZ2bSwgJnBhbmVs
LT5vdmVycmlkZV9tb2RlKTsKPiA+Cj4gPiBUaGUgYWJvdmUgY29kZS1zbmlwcGV0IGlzIG9ubHkg
Y2FsbGVkIGluIHRoZSBwYW5lbCBoYXMgc3BlY2lmaWVkIGRpc3BsYXkKPiA+IHRpbWluZ3MgdXNp
bmcgZGlzcGxheV90aW1pbmdzIC0gaXQgaXMgbm90IGNhbGxlZCB3aGVuIGRpc3BsYXlfbW9kZSBp
cwo+ID4gdXNlZC4KPiA+IFNvIG92ZXJyaWRlX21vZGUgaXMgb25seSBhc3NpZ25lZCBpbiBzb21l
IGNhc2VzIGFuZCBub3QgYWxsIGNhc2VzLgo+ID4gVGhpcyBuZWVkcyB0byBiZSBmaXhlZCBzbyB3
ZSBkbyBub3QgcmVmZXJlbmNlIG92ZXJyaWRlX21vZGUgdW5sZXNzCj4gPiBpdCBpcyBzZXQuCj4g
Cj4gSSdtIGFmcmFpZCBJJ20gbm90IGZvbGxvd2luZyB5b3UgaGVyZS4KCj4gCj4gKiBvdmVycmlk
ZV9tb2RlIGlzIGEgc3RydWN0dXJlIHRoYXQncyBkaXJlY3RseSBwYXJ0IG9mICJzdHJ1Y3QgcGFu
ZWxfc2ltcGxlIi4KSSBoYWQgc29tZWhvdyBjb25mdXNlZCBteXNlbGYgdG8gdGhpbmsgdGhpcyB3
YXMgYSBwb2ludGVyLgpBbmQgeW91IGFyZSByaWdodCB0aGF0IG92ZXJyaWRlX21vZGUgaXMgcHJv
cGVybHkgaW5pdGlhbGl6ZWQgd2hlbiB0aGUKc3RydWN0dXJlIGlzIGFsbG9jYXRlZC4KClNvcnJ5
IGZvciBub3QgcmVhZGluZyB0aGUgY29kZSBhbmQgeW91ciByZXBsaWVzIGNhcmVmdWxseSBlbm91
Z2guCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
