Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D400663F7E1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 20:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBF010E670;
	Thu,  1 Dec 2022 19:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F86D10E670
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 19:05:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d1so4301440wrs.12
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 11:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6V3FwqR5iCf2UN4UZ3wFnb949PdvgvarxKmxO6Zx540=;
 b=lCjKjAZu6y5jG1L4ETQJnPBJAKBGmn5rNWu0GmxseC7UrOrDvEnZMcEPUvfDW3Mop1
 TfidPs6G5tBgYDdNhbAyut8rm/5I/oa9oqPB2QWUCM8tegxljTbGfw77o/kGoPiTLdkt
 9UdfsJ+mBHjqKgVO4RIJJEb7N0le10+0YpTrfTbBfRGXDmUptyf/1oMBvku3rHRCp66g
 CYmQnaGTx9+/LL9803+zG7DNiPmyHm3anx5jZbukPjuaxRPUGAoKxIBI+NOnc6q/1qbx
 PJeUIur4FrNgO7Jsw+aZNPKksC4f/ie0S44G88hWfPmtFPdZk44GZzf0rzbtx3nV1EDu
 qXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6V3FwqR5iCf2UN4UZ3wFnb949PdvgvarxKmxO6Zx540=;
 b=OXrFL7+vypvSE5NeE42i0o36B9/wLqohfHRmEARjpiqz56GeynEftGekRNi01zXRr9
 46VcyPVVqBzCs9vJSkvz73o5/s1W0r2uwEMboMGsDjTqPuEdSeIA4utnbVeOeN4eykep
 1Q1O7U+YlbX7GxpwOTwPINzMAQoXBTwkOyQEjFCEqAHL/TmuvPQggVGSO+qRUhuhqNpY
 U/GazX7F2sbGRWu65Ut4EvZI0mAUF0ZhWA57aztkBQzg3CoHfot3I51J5HdMyZEqbgxs
 o8IhVklwXExVEuBmpW/4vCNEjk8fU4776d5aiOJWJ/unTF2lucbLeEeQZuhN1NSNcRz+
 QCvQ==
X-Gm-Message-State: ANoB5pmSbFhVo/2DeaXT5yu7YH7PjikIAIQ0srAXLJWFDgilLoJpwQVo
 oRUQpXBWVVFyyug6Kxnxmnk=
X-Google-Smtp-Source: AA0mqf4q9Q0L4DDyMtuU4dDrQuzjv0PPF033WVUdPdQhBisMLQqq8vPfpdv51aj7HfeOsvgra9SQ/A==
X-Received: by 2002:a05:6000:a01:b0:241:e856:e441 with SMTP id
 co1-20020a0560000a0100b00241e856e441mr27422196wrb.493.1669921514261; 
 Thu, 01 Dec 2022 11:05:14 -0800 (PST)
Received: from [192.168.2.181] (46-10-148-194.ip.btc-net.bg. [46.10.148.194])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c315100b003cfd64b6be1sm13711162wmo.27.2022.12.01.11.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 11:05:13 -0800 (PST)
Message-ID: <5fa3d069-e0dc-ebdc-2cac-76c41ab54283@gmail.com>
Date: Thu, 1 Dec 2022 21:05:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/vmwgfx: Don't use screen objects when SEV is active
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20221201175341.491884-1-zack@kde.org>
Content-Language: en-US
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20221201175341.491884-1-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com,
 Nicholas Hunt <nhunt@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


LGTM!


Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin


On 1.12.22 г. 19:53 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> When SEV is enabled gmr's and mob's are explicitly disabled because
> the encrypted system memory can not be used by the hypervisor.
>
> The driver was disabling GMR's but the presentation code, which depends
> on GMR's, wasn't honoring it which lead to black screen on hosts
> with SEV enabled.
>
> Make sure screen objects presentation is not used when guest memory
> regions have been disabled to fix presentation on SEV enabled hosts.
>
> Fixes: 3b0d6458c705 ("drm/vmwgfx: Refuse DMA operation when SEV encryption is active")
> Cc: <stable@vger.kernel.org> # v5.7+
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reported-by: Nicholas Hunt <nhunt@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> index 8db61c541a80..e1f36a09c59c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> @@ -926,6 +926,10 @@ int vmw_kms_sou_init_display(struct vmw_private *dev_priv)
>   	struct drm_device *dev = &dev_priv->drm;
>   	int i;
>   
> +	/* Screen objects won't work if GMR's aren't available */
> +	if (!dev_priv->has_gmr)
> +		return -ENOSYS;
> +
>   	if (!(dev_priv->capabilities & SVGA_CAP_SCREEN_OBJECT_2)) {
>   		return -ENOSYS;
>   	}
