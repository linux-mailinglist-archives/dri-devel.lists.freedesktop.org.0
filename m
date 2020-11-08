Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A582AAA6E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 10:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B60989C14;
	Sun,  8 Nov 2020 09:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3C489C14
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 09:56:05 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4C5068051F;
 Sun,  8 Nov 2020 10:56:03 +0100 (CET)
Date: Sun, 8 Nov 2020 10:56:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH] drm: panel: simple: add missing
 platform_driver_unregister() in panel_simple_init
Message-ID: <20201108095601.GB1129714@ravnborg.org>
References: <20201031011856.137307-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201031011856.137307-1-miaoqinglang@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=h7ZxxWauLWjVpACnkrQA:9
 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qinglang

On Sat, Oct 31, 2020 at 09:18:56AM +0800, Qinglang Miao wrote:
> Add the missing platform_driver_unregister() before return
> from panel_simple_init in the error handling case when failed
> to register panel_simple_dsi_driver with CONFIG_DRM_MIPI_DSI
> enabled.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Looks relevant, applied to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
