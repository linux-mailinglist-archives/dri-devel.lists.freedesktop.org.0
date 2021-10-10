Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161FE4282AB
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 19:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE946E095;
	Sun, 10 Oct 2021 17:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F2B6E095
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 17:33:44 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 2e76b871-29f0-11ec-9c3f-0050568c148b;
 Sun, 10 Oct 2021 17:33:29 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 72898194BA6;
 Sun, 10 Oct 2021 19:33:27 +0200 (CEST)
Date: Sun, 10 Oct 2021 19:33:37 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Add support for Sharp LS060T1SX01 panel
Message-ID: <YWMj8Yj5XM7YUPqs@ravnborg.org>
References: <20211009203806.56821-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211009203806.56821-1-dmitry.baryshkov@linaro.org>
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

Hi Dmitry,

On Sat, Oct 09, 2021 at 11:38:04PM +0300, Dmitry Baryshkov wrote:
> Add driver to support Sharp LS06T1SX01 6.0" FullHD panel found e.g. in
> the kwaek.ca Dragonboard Display Adapter Bundle.
> 
> Changes since v4:
>  - Use MIPI_DSI_MODE_NO_EOT_PACKET instead of the old name
> 
> Changes since v3:
>  - Replaced small msleeps with usleep_range
> 
> Changes since v2:
>  - Add missing power supplies used by the panel according to the
>    datasheet
> 
> Changes since v1:
>  - Fix the id in the schema file
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (2):
>       dt-bindings: add bindings for the Sharp LS060T1SX01 panel
>       drm/panel: Add support for Sharp LS060T1SX01 panel

Applied to drm-misc-next and this time on purpose.
Thanks for the quick fixes.

	Sam
