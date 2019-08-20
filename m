Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD1795C4B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 12:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583C26E63B;
	Tue, 20 Aug 2019 10:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91606E63B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 10:32:15 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A63DF2006A;
 Tue, 20 Aug 2019 12:32:11 +0200 (CEST)
Date: Tue, 20 Aug 2019 12:32:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] video: omapfb2: Make standard and custom panel
 drivers mutually exclusive
Message-ID: <20190820103210.GA9745@ravnborg.org>
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
 <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
 <20190816173105.GA9934@ravnborg.org>
 <20190816183905.GA17858@pendragon.ideasonboard.com>
 <20190816191131.GA29151@ravnborg.org>
 <20190820085959.GD11147@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820085959.GD11147@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=QsLMy8rRNWN0At7GVnUA:9 a=CjuIK1q_8ugA:10
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsCgo+ID4gCj4gPiBPaGgsIGFuZCBkaW0gY2FtZSB0byBteSByZXNjdWUuIE15IEZp
eGVzOiBzeW50YXggd2FzIHdyb25nIGJ1dCBpdCB3YXMKPiA+IGNhdWdodCBpbiBteSAiZGltIHB1
c2giIC0gbmljZS4KPiAKPiBBc2lkZTogZGltIGZpeGVzIGFuZCBkaW0gY2l0ZSBzaG91bGQgZ2Vu
ZXJhdGUgY29uZm9ybWFudCBjb21taXQgY2l0YXRpb25zLgoKTWF5YmUgSSBzaG91bGQgaW52ZXN0
IG1vcmUgdGltZSBpbiB0aGUgd29uZGVycyBvZiBkaW0uClNvIGZhciBteSB1c2UgaXMgbGltaXRl
ZCB0bzoKCiAgICBkaW0gdXBkYXRlLWJyYW5jaGVzCiAgICBkaW0gcHVzaAogICAgZGltIGFwcGx5
CiAgICBkaW0gYWRkLW1pc3NpbmctY2MKCkJ1dCBJIGNhbiBzZWUgZGltIGhhcyBhIGJpdCBtb3Jl
IHBvc3NpYmlsaXRpZXMuCldlbGwsIHRpbWUgdG8gcmVhZCBzb21lIG9mIHRoZSBkb2N1bWVudGF0
aW9uLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
