Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017E1132E46
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 19:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACC16E122;
	Tue,  7 Jan 2020 18:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3016E122
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 18:21:29 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C5AF020033;
 Tue,  7 Jan 2020 19:21:25 +0100 (CET)
Date: Tue, 7 Jan 2020 19:21:24 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [GIT PULL] Immutable branch between MFD and DRM due for the v5.6
 merge window
Message-ID: <20200107182124.GB20555@ravnborg.org>
References: <1576672109-22707-1-git-send-email-claudiu.beznea@microchip.com>
 <20200107101748.GC14821@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107101748.GC14821@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
 a=htO-QbRAU_hgi8wv2wEA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 dri-devel@lists.freedesktop.org, peda@axentia.se, boris.brezillon@bootlin.com,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maarten.

On Tue, Jan 07, 2020 at 10:17:48AM +0000, Lee Jones wrote:
> The MFD parts for testing:
> 
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:
> 
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-drm-v5.6
> 
> for you to fetch changes up to 10f9167664362bac6f44813687cf52fec9d15845:
> 
>   mfd: atmel-hlcdc: Return in case of error (2020-01-07 10:08:58 +0000)
> 
> ----------------------------------------------------------------
> Immutable branch between MFD and DRM due for the v5.6 merge window
> 
> ----------------------------------------------------------------
> Claudiu Beznea (2):
>       mfd: atmel-hlcdc: Add struct device member to struct atmel_hlcdc_regmap
>       mfd: atmel-hlcdc: Return in case of error
> 
>  drivers/mfd/atmel-hlcdc.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)

Can we get this into drm-misc-next?

I am not familiar with the process how to do this, and hope you can
help.

Thanks in advance,

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
