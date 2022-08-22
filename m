Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D868F59BDAE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 12:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E9510E0AA;
	Mon, 22 Aug 2022 10:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBA610E0AA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 10:37:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 47BA984242;
 Mon, 22 Aug 2022 12:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1661164672;
 bh=TcZZiGeGDpCewop5BN1MpgE+YRkVKzCBoaF8D30e7TI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YXR16EsSa+BIj14xXPFI/1Wv0pH9ZnEfkQIRjCxXOvEfKVkXTaYdxM2++gLDhwGf9
 PRc/RIWDww4qJ0kivci8IaiDY0BF0Xi7BEv3mce9/vlvLz/BXdERuDR0MebZR+rbwm
 X5FdkTiJmzi7ki9KB0PtsRIY8n5+BhJZIM+pyw5T4oYq5Yst/xfLvrfc085q6ASF4r
 iHMPFHnUHnQJDv1H+rxPPGTEz2stkT27zE+oQFrJHnxIDkfW2ee5b4lQhF2iX+RyP6
 +Qqi5lAkMdb8q62UUpEFEMN23knWjgkabXK5foda5EGO1ZNFCnn9UTTBOYTC6fIfAE
 2TLsp9PFgaqrw==
Message-ID: <a5d7f35b-d11b-ea62-7564-91f184acd0f0@denx.de>
Date: Mon, 22 Aug 2022 12:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v5 3/4] drm/lcdif: Clean up debug prints and comments
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20220819140852.255187-1-marex@denx.de>
 <20220819140852.255187-3-marex@denx.de> <2254228.ElGaqSPkdT@steina-w>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2254228.ElGaqSPkdT@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
 robert.foss@linaro.org, Liu Ying <victor.liu@oss.nxp.com>,
 Martyn Welch <martyn.welch@collabora.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/22/22 08:24, Alexander Stein wrote:

Hi,

[...]

>> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
>> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
>> @@ -203,7 +203,7 @@ static void lcdif_crtc_mode_set_nofb(struct
>> lcdif_drm_private *lcdif, DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock:
>> %dkHz (actual: %dkHz)\n", m->crtc_clock,
>>   			     (int)(clk_get_rate(lcdif->clk) / 1000));
>> -	DRM_DEV_DEBUG_DRIVER(drm->dev, "Connector bus_flags: 0x%08X\n",
>> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Bridge bus_flags: 0x%08X\n",
>>   			     bus_flags);
>>   	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
> 
> Is there any benefit to explicitly state it is the bridge input flags?

I don't think so, since it cannot be any other flags (you cannot link 
bridge output to crtc output for example).

[...]
