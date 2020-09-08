Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F602627DD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962306E9D3;
	Wed,  9 Sep 2020 07:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs3.siol.net [185.57.226.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239216E888
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 16:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id D70145261C6;
 Tue,  8 Sep 2020 18:13:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id ojy5au4NP2nS; Tue,  8 Sep 2020 18:13:55 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 97A1952625E;
 Tue,  8 Sep 2020 18:13:55 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe1-5-97.cable.triera.net
 [213.161.5.97]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 0B6EC5261C6;
 Tue,  8 Sep 2020 18:13:53 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <mripard@kernel.org>, Martin Cerveny <m.cerveny@computer.org>
Subject: Re: [PATCH 1/2] drm/sun4i: sun8i-csc: Secondary CSC register
 correction
Date: Tue, 08 Sep 2020 18:13:53 +0200
Message-ID: <2725694.hAE4Gzk0mI@jernej-laptop>
In-Reply-To: <20200906162140.5584-2-m.cerveny@computer.org>
References: <20200906162140.5584-1-m.cerveny@computer.org>
 <20200906162140.5584-2-m.cerveny@computer.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: Martin Cerveny <m.cerveny@computer.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>"Allwinner V3s" has secondary video layer (VI).
>Decoded video is displayed in wrong colors until
>secondary CSC registers are programmed correctly.
>
>Signed-off-by: Martin Cerveny <m.cerveny@computer.org>

Following tag should be added:
Fixes: 883029390550 ("drm/sun4i: Add DE2 CSC library")

Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
