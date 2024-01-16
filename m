Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317BC82EC3C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6390710E1C2;
	Tue, 16 Jan 2024 09:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3564 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jan 2024 09:53:47 UTC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C0610E1C2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:53:47 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40G8rnI3085499;
 Tue, 16 Jan 2024 02:53:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1705395229;
 bh=/TxJuUOK3G5m1UBXBU6b8/y2wEEjYxog1vL4Y27HcsI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=soRGZlXG+CVVIOQvYLYAlWV90/agHHMAzOUDlNNEKakwb1N/6dgSHRXotTDe+9wD3
 P0QD7KntOcYMP0J8t1P/J6aSLjW++jgMKsk5lGFIWjVxFzC4xWhbkrjWFVx1ZJbnqg
 9+QFVxNadyBtLTFurM2D9mXtHtEIjrbtQrkScLaw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40G8rnSR017133
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jan 2024 02:53:49 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jan 2024 02:53:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jan 2024 02:53:49 -0600
Received: from [10.24.69.150] (uda0496377.dhcp.ti.com [10.24.69.150])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40G8rgZe113471;
 Tue, 16 Jan 2024 02:53:43 -0600
Message-ID: <2c4474a6-3e66-42a8-b0a8-a944486e118a@ti.com>
Date: Tue, 16 Jan 2024 14:23:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/bridge: sii902x: Crash fixes
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <bbrezillon@kernel.org>, Peter Rosin <peda@axentia.se>,
 Linus Walleij <linus.walleij@linaro.org>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Jyri Sarha <jsarha@ti.com>
References: <20240103-si902x-fixes-v1-0-b9fd3e448411@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20240103-si902x-fixes-v1-0-b9fd3e448411@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03/01/24 19:01, Tomi Valkeinen wrote:
> Two small fixes to sii902x for crashes.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Tomi Valkeinen (2):
>       drm/bridge: sii902x: Fix probing race issue
>       drm/bridge: sii902x: Fix audio codec unregistration

Stress-tested kernel boot on SK-AM62, SK-AM62-LP, SK-AM62A, and I
couldn't reproduce the issue. The kernel booted fine every time.

For the series,

Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>

> 
>  drivers/gpu/drm/bridge/sii902x.c | 42 +++++++++++++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 13 deletions(-)
> ---
> base-commit: 0c75d52190b8bfa22cdb66e07148aea599c4535d
> change-id: 20240103-si902x-fixes-468d7153b8ee
> 
> Best regards,
