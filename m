Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1235A910536
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 15:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0399910E9BB;
	Thu, 20 Jun 2024 13:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="uxUWtCfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 20 Jun 2024 13:04:22 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C303F10E9BF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 13:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1718888662; x=1750424662;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/kJ1Twhq0c3VLeIy80ABE2e4kQ5O1ifTyfThn1FYtb8=;
 b=uxUWtCfxVrDGt3ePSmUmULwzEQ3eubpGM3y+y96fId/Hlt4fxtjERxSm
 aqkhXHRnfQsoCaBYo4e2O+Tdnee6MErGPyWVSSfjtLQoLsmlIVwfQKDSv
 jj9kH7c50QSdSdQms4SUPN8cJPJN+HuHH2i/X8Eu2/Px1SsrwJRXJN59Q
 jW6VEAG2aK7buTV5vujl1PLUgTEmvDgPFsnZSIxuj/adpJZfn34nzF9pw
 eLRcSTF5UKmjmBuUA39ywptjdQi3kcNsBAy03awy7k44La0zdtQg6OKSA
 lI8S7ozLSMAXssORejfPiO1SewcApHi/vtzwbmquWLGWlCfvDlXhsWOjv w==;
X-CSE-ConnectionGUID: +1QWA2btSLaG39LyRA/spA==
X-CSE-MsgGUID: Hqq+slJXTj2ra7Znb9UTcA==
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="28917768"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2024 05:57:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 20 Jun 2024 05:56:45 -0700
Received: from [10.180.117.30] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 20 Jun 2024 05:56:43 -0700
Message-ID: <9b7c09b6-24a5-419f-b361-6c0dddbbb0d0@microchip.com>
Date: Thu, 20 Jun 2024 14:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: update Microchip's Atmel-HLCDC driver
 maintainers
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC: <Hari.PrasathGE@microchip.com>, <Dharma.B@microchip.com>,
 <sam@ravnborg.org>, <bbrezillon@kernel.org>
References: <20240620095856.777390-1-manikandan.m@microchip.com>
Content-Language: en-US, fr-FR
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240620095856.777390-1-manikandan.m@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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

On 20/06/2024 at 11:58, Manikandan Muralidharan wrote:
> Drop Sam Ravnborg and Boris Brezillon as they are no longer interested in
> maintaining the drivers. Add myself and Dharma Balasubiramani as the
> Maintainer and co-maintainer for Microchip's Atmel-HLCDC driver.
> Thanks for their work.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Thanks Sam and Boris,
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Best regards,
   Nicolas

> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1566c647a50..8f2a40285544 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7290,8 +7290,8 @@ F:	drivers/gpu/drm/ci/xfails/meson*
>   F:	drivers/gpu/drm/meson/
>   
>   DRM DRIVERS FOR ATMEL HLCDC
> -M:	Sam Ravnborg <sam@ravnborg.org>
> -M:	Boris Brezillon <bbrezillon@kernel.org>
> +M:	Manikandan Muralidharan <manikandan.m@microchip.com>
> +M:	Dharma Balasubiramani <dharma.b@microchip.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Supported
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

