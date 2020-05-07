Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBF51C9B7D
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 21:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB36D6EA5C;
	Thu,  7 May 2020 19:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9706EA5D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 19:58:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 32D9380520;
 Thu,  7 May 2020 21:58:14 +0200 (CEST)
Date: Thu, 7 May 2020 21:58:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [v4 PATCH 0/2] Add support for ASUS Z00T TM5P5 NT35596 panel
Message-ID: <20200507195812.GB17398@ravnborg.org>
References: <20200506210957.344590-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506210957.344590-1-konradybcio@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=m4rRuWqDM7RkiSaC_YMA:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Konrad.

On Wed, May 06, 2020 at 11:09:54PM +0200, Konrad Dybcio wrote:
> changes since v3:
> - fix dt-bindings issue
> 
> changes since v2:
> - fix Kconfig indentation
> 
> changes since v1:
> - make `backlight_properties props` constant
> - a couple of line breaks
> - change name and compatible to reflect ASUS being the vendor
> - remove a redundant TODO
> 
> Konrad Dybcio (2):
>   drivers: drm: panel: Add ASUS TM5P5 NT35596 panel driver
>   dt-bindings: display: Document ASUS Z00T TM5P5 NT35596 panel
>     compatible

Thanks, applied in the reverse order to have the binding before the
driver.
Fixed a few checkpatch warnings while applying.
We use --strict for code in drivers/gpu/*

	Sam

> 
>  .../panel/asus,z00t-tm5p5-nt35596.yaml        |  56 +++
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 367 ++++++++++++++++++
>  4 files changed, 434 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/asus,z00t-tm5p5-nt35596.yaml
>  create mode 100644 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> 
> -- 
> 2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
