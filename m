Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D261826879F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 10:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC5B89D5C;
	Mon, 14 Sep 2020 08:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E97589D5C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 08:53:38 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08E8rY2v075142;
 Mon, 14 Sep 2020 03:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600073614;
 bh=fnNqZ8zu/yRcpPcmy3d4N3mhHW8/Ay6KiJLxGYWR7I4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=GeEuaITMTo1C+uSGlzeEMI/UMDVO12QrhnVZLfJ0v32dET7D1JAWgYqwChKKnLC+8
 XDFF2tqNap6X0qnYJljmaI9/cTUQsiS66vgoQkuivsm6DYvPjdftTKbQ4PmCeILOqF
 MQ2spzs+tEapBxIKCKEggflAB4X44U9ez0/+Pi58=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08E8rXks109843
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Sep 2020 03:53:33 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 14
 Sep 2020 03:53:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Sep 2020 03:53:33 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08E8rWbx118245;
 Mon, 14 Sep 2020 03:53:32 -0500
Subject: Re: [PATCH 0/2] drm/tilcdc: Couple of minor feature improvements
To: Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1600072407.git.jsarha@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <fac9133b-b95e-db77-cba6-a24502547788@ti.com>
Date: Mon, 14 Sep 2020 11:53:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1600072407.git.jsarha@ti.com>
Content-Language: en-US
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
Cc: laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/09/2020 11:34, Jyri Sarha wrote:
> The vblank interrupts have been always on when the display is on for a
> very long time, so I decided that it is about time to fix it. Then the
> following patch is just a cleanup.
> 
> BR,
> Jyri
> 
> Jyri Sarha (2):
>   drm/tilcdc: Do not keep vblank interrupts enabled all the time
>   drm/tilcdc: Remove tilcdc_crtc_max_width(), use private data
> 
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 52 ++++++++++++++++++----------
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c  | 38 +++++++++++---------
>  drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  7 ++--
>  3 files changed, 59 insertions(+), 38 deletions(-)
> 

For both patches:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
