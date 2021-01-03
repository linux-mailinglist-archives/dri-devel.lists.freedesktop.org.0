Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31792E91ED
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1AC89CD9;
	Mon,  4 Jan 2021 08:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps5.brixit.nl (vps5.brixit.nl [192.81.221.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D2589B48
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jan 2021 06:09:13 +0000 (UTC)
Received: from [192.168.20.102] (unknown [77.239.252.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by vps5.brixit.nl (Postfix) with ESMTPSA id CAF20607F1;
 Sun,  3 Jan 2021 06:09:09 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/msm: Call msm_init_vram before binding the gpu
To: Iskren Chernev <iskren.chernev@gmail.com>, Rob Clark <robdclark@gmail.com>
References: <20201230152944.3635488-1-iskren.chernev@gmail.com>
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <ed665a03-27e4-11fd-edce-7520e0d2fd61@postmarketos.org>
Date: Sun, 3 Jan 2021 09:09:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201230152944.3635488-1-iskren.chernev@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: Sean Paul <sean@poorly.run>, Wambui Karuga <wambui.karugax@gmail.com>,
 Craig Tatlor <ctatlor97@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@onstation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested these patches on Samsung Galaxy S5 along with other patches that 
add panel driver and enable GPU support on this device.

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

On 12/30/20 6:29 PM, Iskren Chernev wrote:
> From: Craig Tatlor <ctatlor97@gmail.com>
> 
> vram.size is needed when binding a gpu without an iommu and is defined
> in msm_init_vram(), so run that before binding it.
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
