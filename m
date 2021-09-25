Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1840541826C
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 15:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F966E406;
	Sat, 25 Sep 2021 13:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61516E406
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 13:40:02 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 0f1d868a-1e06-11ec-a02a-0050568c148b;
 Sat, 25 Sep 2021 13:39:51 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 78B58194C14;
 Sat, 25 Sep 2021 15:39:50 +0200 (CEST)
Date: Sat, 25 Sep 2021 15:39:55 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Raffaele Tranquillini <raffaele.tranquillini@gmail.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 y.oudjana@protonmail.com, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/panel: Add JDI R63452 MIPI DSI panel driver
Message-ID: <YU8mqx2vRzjkd9hb@ravnborg.org>
References: <20210925102911.518038-1-raffaele.tranquillini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210925102911.518038-1-raffaele.tranquillini@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Raffaele,
On Sat, Sep 25, 2021 at 12:29:09PM +0200, Raffaele Tranquillini wrote:
> This adds support for the JDI R63452 Full HD LCD panel used on the
> Xiaomi Mi 5 smartphone, in MIPI DSI command mode.

We already have plenty of very similar panel drivers.

> + * Generated using linux-mdss-dsi-panel-driver-generator from Lineage OS device tree:
> + * https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage-18.1/arch/arm/boot/dts/qcom/a1-msm8996-mtp.dtsi

This gives a good indication that we have similar panel drivers in the
tree.

Could you try to verify if we could extend one of the existing drivers
rather than creating a new panel driver.

If for example only the power-on sequence differs we can select one
using the compatible, no need for a dedicated driver.

Please let us know what you conclude.

	Sam
