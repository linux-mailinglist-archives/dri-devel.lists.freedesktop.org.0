Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F92AABAB
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 15:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA64B896B5;
	Sun,  8 Nov 2020 14:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123EC896B5
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 14:46:45 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7CB27804D5;
 Sun,  8 Nov 2020 15:46:42 +0100 (CET)
Date: Sun, 8 Nov 2020 15:46:41 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] drm/bridge: lvds-codec: Use dev_err_probe for error
 handling
Message-ID: <20201108144641.GB1212257@ravnborg.org>
References: <20201020093655.3584-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020093655.3584-1-biju.das.jz@bp.renesas.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=yC-0_ovQAAAA:8 a=8SwYCKEtaBmnh9c4yGEA:9
 a=CjuIK1q_8ugA:10 a=QsnFDINu91a9xkgZirup:22
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju
On Tue, Oct 20, 2020 at 10:36:55AM +0100, Biju Das wrote:
> dev_err_probe function simplifies error handling. So use the same in probe
> function wherever possible.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Thanks, applied to drm-misc-next

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
