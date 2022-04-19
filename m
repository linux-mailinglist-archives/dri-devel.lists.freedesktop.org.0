Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDC1506C2C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 14:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD3810E281;
	Tue, 19 Apr 2022 12:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1108D10E281
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 12:19:29 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4D0B25B;
 Tue, 19 Apr 2022 14:19:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650370767;
 bh=asb053ePNHSoO5X2MGY+KrnehLTOpLIt9thiLRtfkbQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T5WyU+wo2wpZze3wYc0MDkCEUm0xbsVHM6DQkXL0qHAPr0ArBAXEdar3dEkosKeWn
 80xKkAdkgwn14UpzgXUmIG5U4na19IwWHbX8AeVoUNAgiL1gitiptWw9g7ygs85RAP
 kZKQtMCRgMtwki85chRsTm7Im8yLt97oCqptLBFA=
Message-ID: <28e229e4-c4d1-e7ae-5150-84a4b45e14ef@ideasonboard.com>
Date: Tue, 19 Apr 2022 15:19:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/tidss: Soft Reset DISPC on startup
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, linux-kernel@vger.kernel.org,
 jyri.sarha@iki.fi, tomba@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <20220314113739.18000-1-devarsht@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220314113739.18000-1-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 laurent.pinchart@ideasonboard.com, nikhil.nd@ti.com,
 linux-arm-kernel@lists.infradead.org, r-ravikumar@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2022 13:37, Devarsh Thakkar wrote:
> Soft reset the display subsystem controller on startup and wait for
> the reset to complete. This helps the scenario where display was
> already in use by some other core before the linux was booted.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 

Thanks, I have pushed this to drm-misc-next.

  Tomi

