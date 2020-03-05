Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCE017B7E1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094826EC72;
	Fri,  6 Mar 2020 08:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs15.siol.net [185.57.226.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770A36E364
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 17:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id 87E02521A71;
 Thu,  5 Mar 2020 18:14:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id Uu7iizrBYcEZ; Thu,  5 Mar 2020 18:14:29 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 482BE5232A3;
 Thu,  5 Mar 2020 18:14:29 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id 7D13B521A71;
 Thu,  5 Mar 2020 18:14:28 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: a.hajda@samsung.com, narmstrong@baylibre.com
Subject: Re: [PATCH v2 1/4] drm/bridge: dw-hdmi: fix AVI frame colorimetry
Date: Thu, 05 Mar 2020 18:14:27 +0100
Message-ID: <5332114.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20200304232512.51616-2-jernej.skrabec@siol.net>
References: <20200304232512.51616-1-jernej.skrabec@siol.net>
 <20200304232512.51616-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: jonas@kwiboo.se, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG5lIMSNZXRydGVrLCAwNS4gbWFyZWMgMjAyMCBvYiAwMDoyNTowOSBDRVQgamUgSmVybmVqIFNr
cmFiZWMgbmFwaXNhbChhKToKPiBDVEEtODYxLUYgZXhwbGljaXRseSBzdGF0ZXMgdGhhdCBmb3Ig
UkdCIGNvbG9yc3BhY2UgY29sb3JpbWV0cnkgc2hvdWxkCj4gYmUgc2V0IHRvICJub25lIi4gRml4
IHRoYXQuCj4gCj4gQWNrZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4KPiBGaXhlczogZGVmMjNhYTdlOTgyICgiZHJtOiBicmlkZ2U6IGR3
LWhkbWk6IFN3aXRjaCB0byBWNEwgYnVzIGZvcm1hdCBhbmQKPiBlbmNvZGluZ3MiKSBTaWduZWQt
b2ZmLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+CgpBcHBsaWVk
IHRvIGRybS1uZXh0LWZpeGVzLgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
