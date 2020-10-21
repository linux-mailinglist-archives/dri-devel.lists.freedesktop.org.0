Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65029591B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D716F3EB;
	Thu, 22 Oct 2020 07:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs38.siol.net [185.57.226.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8836E15A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 17:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id C5FDC5274E2;
 Wed, 21 Oct 2020 19:11:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id k6JwuQwIQTSJ; Wed, 21 Oct 2020 19:11:25 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 8425D5274F1;
 Wed, 21 Oct 2020 19:11:25 +0200 (CEST)
Received: from kista.localnet (cpe1-5-97.cable.triera.net [213.161.5.97])
 (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id 3117A5274E2;
 Wed, 21 Oct 2020 19:11:25 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 3/3] drm/sun4i: frontend: Fix the scaler phase on A33
Date: Wed, 21 Oct 2020 19:16:52 +0200
Message-ID: <5606996.mc5IMTkvpr@kista>
In-Reply-To: <20201015093642.261440-3-maxime@cerno.tech>
References: <20201015093642.261440-1-maxime@cerno.tech>
 <20201015093642.261440-3-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: Taras Galchenko <tpgalchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpEbmUgxI1ldHJ0ZWssIDE1LiBva3RvYmVyIDIwMjAgb2IgMTE6MzY6NDIgQ0VTVCBqZSBN
YXhpbWUgUmlwYXJkIG5hcGlzYWwoYSk6Cj4gVGhlIEEzMyBoYXMgYSBkaWZmZXJlbnQgcGhhc2Ug
cGFyYW1ldGVyIGluIHRoZSBBbGx3aW5uZXIgQlNQIG9uIHRoZQo+IGNoYW5uZWwxIHRoYW4gdGhl
IG9uZSBjdXJyZW50bHkgYXBwbGllZC4gRml4IHRoaXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF4
aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+CgpBY2tlZC1ieTogSmVybmVqIFNrcmFiZWMg
PGplcm5lai5za3JhYmVjQHNpb2wubmV0PgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
