Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F14711EA4DF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 15:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DF989FAD;
	Mon,  1 Jun 2020 13:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4440089FAD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:25:07 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200601132505euoutp017399d17bbf349fe72f351017d96289d5~Ublr19u_P2513225132euoutp01U
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:25:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200601132505euoutp017399d17bbf349fe72f351017d96289d5~Ublr19u_P2513225132euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591017905;
 bh=WDoFslnoBh4NFH5LxebC/l/9rNxykmi1JmVWDnec9NU=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=cD1cN3D1e+Nh7jTXsLqqpT0yDWpTd0ZULiUNMLo3S6r/pH/aqFVm4qrAsau0lTLHY
 ENS2lNyiQhzeOUDdMHO7+92HNFOJoFh3ysiVnR5VYk/CrwjkFNl83yYJyJAa79P+7K
 iMpJ3ynypXHODTihrjeEYb3bVzDvAOoR2T4ApzHs=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200601132505eucas1p18e3a7e6740ebae768a8f4da8c9a9ece3~UblrkZ79k1098310983eucas1p1T;
 Mon,  1 Jun 2020 13:25:05 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 51.33.60679.0B105DE5; Mon,  1
 Jun 2020 14:25:04 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200601132504eucas1p1065ae1c2c68bb149a0505cd521452c15~UblrMu8g12556225562eucas1p18;
 Mon,  1 Jun 2020 13:25:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200601132504eusmtrp111ff227a9c0cd8a8e126eb12a77f4b3a~UblrMG_lB2270722707eusmtrp1H;
 Mon,  1 Jun 2020 13:25:04 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-1c-5ed501b010ea
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B7.DB.08375.0B105DE5; Mon,  1
 Jun 2020 14:25:04 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200601132504eusmtip10bef19bb4da24abb7f5138822552b060~Ublq27nnW1048610486eusmtip1m;
 Mon,  1 Jun 2020 13:25:04 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] omapfb/dss: fix comparison to bool warning
To: Jason Yan <yanaijie@huawei.com>
Message-ID: <266bc2e0-c2bf-1c0c-a5ac-58941ff38f5f@samsung.com>
Date: Mon, 1 Jun 2020 15:25:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200422071903.637-1-yanaijie@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsWy7djP87obGK/GGfR3WVm8PzWR3eLK1/ds
 Fif6PrBaXN41h81i9pJ+Fov182+xWSza08nswO7RcuQtq8f97uNMHsdvbGfy+LxJLoAlissm
 JTUnsyy1SN8ugStjc8NL5oLF/BVNR9vYGxi/8HQxcnJICJhIrHk0g72LkYtDSGAFo8T/+Xeh
 nC+MEm/vfmGFcD4zSnya8ZwJpuVGzzSoxHJGiWW7mlkgnLeMEpPWXWQEqWITsJKY2L4KzBYW
 sJdou/sbrFtEQFmi8f50sG5mgYWMEgc3rQdayMHBK2AncWKvH0gNi4CKRPedbjYQW1QgQuLT
 g8OsIDavgKDEyZlPWEBsTgFziea1/8FmMguIS9x6Mh/KlpfY/nYOM8h8CYFt7BKXrs6GOttF
 YtmEs2wQtrDEq+Nb2CFsGYnTk3tYIBrWMUr87XgB1b2dUWL55H9QHdYSd879YgO5lFlAU2L9
 Ln2IsKPE3W3PwR6QEOCTuPFWEOIIPolJ26YzQ4R5JTrahCCq1SQ2LNvABrO2a+dK5gmMSrOQ
 vDYLyTuzkLwzC2HvAkaWVYziqaXFuempxUZ5qeV6xYm5xaV56XrJ+bmbGIHJ5/S/4192MO76
 k3SIUYCDUYmHl+PRlTgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQWH2KU5mBR
 Euc1XvQyVkggPbEkNTs1tSC1CCbLxMEp1cDI7bDKTkTR/O3n3dqf9Btm2+y56LPk+RlHTeUW
 yY83Tnw74qH9XMxm5dbsKfFHeN04Ih5MfrpR93qz4eSME7u3rJVlPhfzQdauX+PGJ5+224bL
 +Q5+Fpp1d7/i2U0uU5a1SX1aVvs6l/Nvq4M09+1Z+/vKOWcoKpUcmmTsFXK1nt3DwSwwqzlP
 iaU4I9FQi7moOBEAcc8G9DoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xu7obGK/GGUz7pmTx/tREdosrX9+z
 WZzo+8BqcXnXHDaL2Uv6WSzWz7/FZrFoTyezA7tHy5G3rB73u48zeRy/sZ3J4/MmuQCWKD2b
 ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MzQ0vmQsW
 81c0HW1jb2D8wtPFyMkhIWAicaNnGmsXIxeHkMBSRokVX1vZuhg5gBIyEsfXl0HUCEv8udbF
 BlHzmlFi3rReZpAEm4CVxMT2VYwgtrCAvUTb3d9MILaIgLJE4/3pYEOZBRYySmyY+JcdoruL
 UeL+zXcsIBt4BewkTuz1A2lgEVCR6L7TzQZiiwpESBzeMQtsKK+AoMTJmU9YQGxOAXOJ5rX/
 wRYwC6hL/Jl3iRnCFpe49WQ+VFxeYvvbOcwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3P
 LTbUK07MLS7NS9dLzs/dxAiMtW3Hfm7ewXhpY/AhRgEORiUe3g33r8QJsSaWFVfmHmKU4GBW
 EuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdBzE5mlRJPzgWkgryTe0NTQ3MLS0NzY3NjMQkmc
 t0PgYIyQQHpiSWp2ampBahFMHxMHp1QDY79emF3X1dbZO0y7P+neWrm6jkO89/LWE812MyZy
 r18R1zvj2IdFv/Lc1m2wXxeQKPbh47p/nAqTe97NnPv/ufryyfNfLq90W3xL33nObdYH2vt7
 Pe9t/5DaJ/hVW7+js3p6pKinxSI5vpwgf/2n6ponGDubPD0XP7r5zjNB9eS+4NTVBx7eD1Vi
 Kc5INNRiLipOBAAdEM/mywIAAA==
X-CMS-MailID: 20200601132504eucas1p1065ae1c2c68bb149a0505cd521452c15
X-Msg-Generator: CA
X-RootMTR: 20200422072450eucas1p106befe0a06fe20557d7ea4297525878a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200422072450eucas1p106befe0a06fe20557d7ea4297525878a
References: <CGME20200422072450eucas1p106befe0a06fe20557d7ea4297525878a@eucas1p1.samsung.com>
 <20200422071903.637-1-yanaijie@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, afd@ti.com, tomi.valkeinen@ti.com,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/22/20 9:19 AM, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c:461:15-32: WARNING:
> Comparison to bool
> drivers/video/fbdev/omap2/omapfb/dss/dispc.c:891:5-35: WARNING:
> Comparison of 0/1 to bool variable
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Applied to drm-misc-next tree (patch should show up in v5.9), thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 2 +-
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> index 4a16798b2ecd..3bb951eb29c7 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> @@ -888,7 +888,7 @@ static void dispc_ovl_set_color_mode(enum omap_plane plane,
>  static void dispc_ovl_configure_burst_type(enum omap_plane plane,
>  		enum omap_dss_rotation_type rotation_type)
>  {
> -	if (dss_has_feature(FEAT_BURST_2D) == 0)
> +	if (!dss_has_feature(FEAT_BURST_2D))
>  		return;
>  
>  	if (rotation_type == OMAP_DSS_ROT_TILER)
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> index 7060ae56c062..ef659c89ba58 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> @@ -455,11 +455,9 @@ static void hdmi_disconnect(struct omap_dss_device *dssdev,
>  static int hdmi_read_edid(struct omap_dss_device *dssdev,
>  		u8 *edid, int len)
>  {
> -	bool need_enable;
> +	bool need_enable = !hdmi.core_enabled;
>  	int r;
>  
> -	need_enable = hdmi.core_enabled == false;
> -
>  	if (need_enable) {
>  		r = hdmi_core_enable(dssdev);
>  		if (r)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
