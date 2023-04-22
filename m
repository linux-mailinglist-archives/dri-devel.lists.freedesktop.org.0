Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 160376EBD7E
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 08:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61D210E382;
	Sun, 23 Apr 2023 06:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 552 seconds by postgrey-1.36 at gabe;
 Sat, 22 Apr 2023 17:04:45 UTC
Received: from ci74p00im-qukt09081502.me.com (ci74p00im-qukt09081502.me.com
 [17.57.156.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA25710E03D
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 17:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1682182532; bh=VhFLrA+d2aKrIjliSBbYgiED+r3PLQiHzzxqd19QVsM=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=wgNeyJlBAKEX/zNIJLOcX2yDywmvoOhV5soWO958vqq4HgxyOqbLk4v8h78b7/eB1
 KCc+ZPoj0Y4DGMpCO5JuowThDOeDPfF8P+ksPYZu2wK3s/eGyyKDOEYNpgLne7Y6aQ
 PhQeZO2FDpwaUesaIg0uWMy4wgZrCj4ikMzS5EWhdmXyuxOsxsCLluSOVZdulG/4ld
 vT/md9Spj/1pmWF9jLOaegeHWt9CZyOHCLvysz3nGkf6NQEzZGuwejtH2ECOsXI70n
 HWewLJ4sIHXdyuiGSWjQBgvu6ikhT23KyOYMfeizaCWImbCXUaivhxKCZKffnVvjGV
 Ehc7n6xMzZb6A==
Received: from imac101 (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
 by ci74p00im-qukt09081502.me.com (Postfix) with ESMTPSA id CCAAF28403B6;
 Sat, 22 Apr 2023 16:55:30 +0000 (UTC)
Date: Sat, 22 Apr 2023 18:55:27 +0200
From: Alain Volmat <avolmat@me.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH 4/5] drm/sti: Drop of_gpio header
Message-ID: <ZEQRf6zUpHfiGzJr@imac101>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20220812205746.609107-1-mairacanal@riseup.net>
 <20220812205746.609107-5-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220812205746.609107-5-mairacanal@riseup.net>
X-Proofpoint-GUID: ilJhIr25HD8eDnmmqFuzHaxem7sKuxC6
X-Proofpoint-ORIG-GUID: ilJhIr25HD8eDnmmqFuzHaxem7sKuxC6
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-11=5F01:2022-01-11=5F01,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=428
 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2304220155
X-Mailman-Approved-At: Sun, 23 Apr 2023 06:47:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Alain Volmat <alain.volmat@foss.st.com>, Alain Volmat <avolmat@me.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maira,

thanks for the patch.

On Fri, Aug 12, 2022 at 05:57:45PM -0300, Maíra Canal wrote:
> This driver includes the deprecated OF GPIO header <linux/of_gpio.h>
> yet fail to use symbols from it, so drop this include.
> 
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
> ---
>  drivers/gpu/drm/sti/sti_dvo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
> index b6ee8a82e656..0fc7710b054a 100644
> --- a/drivers/gpu/drm/sti/sti_dvo.c
> +++ b/drivers/gpu/drm/sti/sti_dvo.c
> @@ -8,7 +8,7 @@
>  #include <linux/component.h>
>  #include <linux/debugfs.h>
>  #include <linux/module.h>
> -#include <linux/of_gpio.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  
>  #include <drm/drm_atomic_helper.h>
> -- 

Acked-by: Alain Volmat <avolmat@me.com>

> 2.37.1
> 
