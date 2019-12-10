Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA48011900A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 19:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E5F89C3B;
	Tue, 10 Dec 2019 18:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2522C89C3B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 18:54:43 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 67B43200D1;
 Tue, 10 Dec 2019 19:54:39 +0100 (CET)
Date: Tue, 10 Dec 2019 19:54:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC 0/8] Add Unisoc's drm kms module
Message-ID: <20191210185438.GA13884@ravnborg.org>
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=VvfsPnTBGurI0KqpiJ4A:9 a=CjuIK1q_8ugA:10
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
Cc: baolin.wang@linaro.org, airlied@linux.ie, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 orsonzhai@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin.

Thanks for this new driver.
A few somments triggered alone from the diffstat.
> Kevin Tang (8):
>   dt-bindings: display: add Unisoc's drm master bindings
>   drm/sprd: add Unisoc's drm kms master
>   dt-bindings: display: add Unisoc's dpu bindings
>   drm/sprd: add Unisoc's drm display controller driver
>   dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
>   drm/sprd: add Unisoc's drm mipi dsi&dphy driver
>   dt-bindings: display: add Unisoc's generic mipi panel bindings
>   drm/sprd: add Unisoc's drm generic mipi panel driver
> 
>  .../devicetree/bindings/display/sprd/dphy.txt      |   49 +
>  .../devicetree/bindings/display/sprd/dpu.txt       |   55 +
>  .../devicetree/bindings/display/sprd/drm.txt       |   18 +
>  .../devicetree/bindings/display/sprd/dsi.txt       |   68 +
>  .../devicetree/bindings/display/sprd/panel.txt     |  110 ++

New bindings in metaschema format (.yaml).
And panel bindings in display/panel/

>  drivers/gpu/drm/Kconfig                            |    2 +
>  drivers/gpu/drm/Makefile                           |    1 +
>  drivers/gpu/drm/sprd/Kconfig                       |   14 +
>  drivers/gpu/drm/sprd/Makefile                      |   17 +
>  drivers/gpu/drm/sprd/disp_lib.c                    |  290 ++++
>  drivers/gpu/drm/sprd/disp_lib.h                    |   40 +
>  drivers/gpu/drm/sprd/dphy/Makefile                 |    7 +
>  drivers/gpu/drm/sprd/dphy/pll/Makefile             |    3 +
>  drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c  |  640 +++++++++
>  drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c          |  254 ++++
>  drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h          |  329 +++++
>  drivers/gpu/drm/sprd/dpu/Makefile                  |    8 +
>  drivers/gpu/drm/sprd/dpu/dpu_r2p0.c                | 1464 ++++++++++++++++++++
>  drivers/gpu/drm/sprd/dsi/Makefile                  |    7 +
>  drivers/gpu/drm/sprd/dsi/core/Makefile             |    3 +
>  drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c      | 1186 ++++++++++++++++
>  drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h      | 1417 +++++++++++++++++++
>  drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c  |  392 ++++++
>  drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c            |  544 ++++++++
>  drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h            |   28 +
>  drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h            | 1102 +++++++++++++++
>  drivers/gpu/drm/sprd/sprd_dphy.c                   |  235 ++++
>  drivers/gpu/drm/sprd/sprd_dphy.h                   |  121 ++
>  drivers/gpu/drm/sprd/sprd_dpu.c                    | 1152 +++++++++++++++
>  drivers/gpu/drm/sprd/sprd_dpu.h                    |  217 +++
>  drivers/gpu/drm/sprd/sprd_drm.c                    |  287 ++++
>  drivers/gpu/drm/sprd/sprd_drm.h                    |   19 +
>  drivers/gpu/drm/sprd/sprd_dsi.c                    |  722 ++++++++++
>  drivers/gpu/drm/sprd/sprd_dsi.h                    |  210 +++
>  drivers/gpu/drm/sprd/sprd_gem.c                    |  178 +++
>  drivers/gpu/drm/sprd/sprd_gem.h                    |   30 +

>  drivers/gpu/drm/sprd/sprd_panel.c                  |  778 +++++++++++
>  drivers/gpu/drm/sprd/sprd_panel.h                  |  114 ++
Please move panels to drivers/gpu/drm/panel/ and make sure to utilize
the drm_panel infrastructure.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
