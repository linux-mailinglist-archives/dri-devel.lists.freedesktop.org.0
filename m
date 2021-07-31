Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 889DF3DC587
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 12:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88E96E566;
	Sat, 31 Jul 2021 10:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DC96E566
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 10:13:19 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id l4so16328908ljq.4
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 03:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OZPudOm1n3Y0XK4jpf40ZUtCnIltLVwQU7PwAg/PlfY=;
 b=DRZznyy8033aJy2PoYq1zVwec5R6Eceg1j5V48MBWbNB0iv7w7ORqdtrgcv2QjX+V6
 Rvia4WqY0iJvNvsVcXOBk1t1TkUQWAlDoP3RQJGlc2kRUdxSAf84hmkUAQNFShMPuq27
 eS9BN6ie7iwx334d4wKMQGi+ybdC9EoU9+kXmLM2/NCtIojOirgxY5mfAEjCKiAVGzIE
 4frtasTQw/Kgi3REZzYXx0/Phgm79S27UcWUKph8t4JEljjkj8ZirEg2egWmd2NEQF2l
 57lolTAXyQYaYHP5WvfPSdjY1655PKC15xhDpaunlERKBX9c74aRxCO29KO+KZYcMFot
 B5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OZPudOm1n3Y0XK4jpf40ZUtCnIltLVwQU7PwAg/PlfY=;
 b=IJnyJRtcFoPsBaF6VXeRUQXZoi3q2R6LL1aqXyDIDSwXg0pw3zCbZYzxLaO9ZlD384
 1LS29o1MS6y+QE/ZCrjGzKgpf+NDPq1aMQHTAhS2pavvoGiurPMyFxtv4sB+BRkolrAj
 IiA6euTodgfzhRQhPL5HmWlpA4I2xv370WkoxN5XMi6druyzxdO+8vTpmTlkarEUlPFc
 U3HZuctmIz19n1pnrRhiW9rIX5jCa8n2CuOnn0zNRwdVX7LZL5ax4MFUSfPCYWLPxJ3C
 ZSBIAlL0t9XY8P5BE+d0Op/ZHDMU/uLioTroPZb0xLUmdA35eyzHEAmKYWdD3rNw5zHe
 zvfA==
X-Gm-Message-State: AOAM533ioqlfJj2ybKwdE+D4q1TU/y0j5c2EYVpChgDOMWcR/2abE4om
 7o/BmS7Z2hNJLFbIvVFQ6lQ=
X-Google-Smtp-Source: ABdhPJz32IHR5BKnLNNi9FksHxGMzGdjnjiBqp7uquONQESyGp5t0qF7c6FPEGC/L09TJGPVjkiaRA==
X-Received: by 2002:a2e:a712:: with SMTP id s18mr4775392lje.161.1627726397082; 
 Sat, 31 Jul 2021 03:13:17 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.77.134])
 by smtp.gmail.com with ESMTPSA id w26sm301595ljd.89.2021.07.31.03.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Jul 2021 03:13:16 -0700 (PDT)
Subject: Re: [PATCH v2 2/9] drm/omap: Cast pointer to integer without
 generating warning
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Tomi Valkeinen <tomba@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-renesas-soc@vger.kernel.org, Thierry Reding
 <thierry.reding@gmail.com>, linux-imx@nxp.com,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Alain VOLMAT-SCND-01 <alain.volmat@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210731013954.11926-3-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <32ff5167-01f3-3af4-9075-f61a659c35eb@gmail.com>
Date: Sat, 31 Jul 2021 13:12:58 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210731013954.11926-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hello

On 31.07.2021 4:39, Laurent Pinchart wrote:

> On 64-bit platforms, the compiler complains that casting a void pointer
> to an unsigned int loses data. Cast the pointer to a uintptr_t unsigned

    Is "unsigned" really needed here?

> to fix this.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index f86e20578143..c05d3975cb31 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -572,7 +572,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>   	priv->dss->mgr_ops_priv = priv;
>   
>   	soc = soc_device_match(omapdrm_soc_devices);
> -	priv->omaprev = soc ? (unsigned int)soc->data : 0;
> +	priv->omaprev = soc ? (uintptr_t)soc->data : 0;
>   	priv->wq = alloc_ordered_workqueue("omapdrm", 0);
>   
>   	mutex_init(&priv->list_lock);

MBR, Sergei
