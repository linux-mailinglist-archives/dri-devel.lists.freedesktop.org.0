Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F7673FC6F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 15:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A825010E03F;
	Tue, 27 Jun 2023 13:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426A710E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 13:08:24 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fa96fd79f0so29846445e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 06:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687871302; x=1690463302;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RhFLQH19tfLajDmomHsBVwtG5cBv89ujnwcgjmZjJHg=;
 b=GFS/LVb0AJnfsQApsR4pZ4eIfGv3g0kCcqCkQNKxMIRRxCSALwrthFhMXx6T72r6aA
 Co8/EiAK2hNn2ujmvHwisoOgs/UIgqNMG2gCYSIVqZpWrNWITDfFBuyHBKXiOOuL+itj
 7fFIfaWmS3z2x+jYdQoxEeGL2Eljx/fk+QxE0CYTE8EQVzENyRwxKUvDnYeCWJGiMeAw
 mO77mPv3ECThCAGJQbEpgl/FqVLKIe3kKoPYXeY6IFMmceoQriDuIqVt1H51ctHgadQe
 U5iiYHpvoFkoQ37kSIdLpk11c1NhZC/3E1ysHqmJv93nKsdVRqZi8y17DquqQ3fq9G6R
 LnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687871302; x=1690463302;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RhFLQH19tfLajDmomHsBVwtG5cBv89ujnwcgjmZjJHg=;
 b=g08xlRDvh5DSFsGAm57wM+cs+RZqFz7H/3R3Z0hFTMivpuOZ46kg0t7+hIANAjzxXv
 +PmUO6rPnnrTRV6QzZKQaGB7weNvOdXjgkQduor9/4Um+8dIZ3ABwV7SerJ0ODJBZAW4
 fugbXPTN9nDUQNcXI3RjsuglcWw/s+3W59MlRMKgpnpEofTfAvH5Zsr3uSZ/6rhi4P29
 fYK70rt5iIpvBGYp1wOz5DSP/1Lax/yof/wUa8NoEj6X/+neAKRuPeqoW1EkFcOeq7JS
 UkcQGV4RRYQvRBkgC4Dzt5GDnBkCg/9H5Ptxxue/FWlByWmxTRSsp8FEtrZu5sNpAkDG
 H3bA==
X-Gm-Message-State: AC+VfDzBqly9vJnVbWenCeTSbR8FDoOfTvLzzUZB6AGyN3BD5qfgL3F/
 LJpTFbaLLofmGa8IDtgW6q4=
X-Google-Smtp-Source: ACHHUZ7Q8mO/usNDZVBORJyj5Uyi/+Vh0FvSAgaHNZHBIlLU9p197iNNRrTvqT4yGb/MEP4EGWgmIw==
X-Received: by 2002:a05:600c:2944:b0:3fa:48cb:9038 with SMTP id
 n4-20020a05600c294400b003fa48cb9038mr18869319wmd.31.1687871301963; 
 Tue, 27 Jun 2023 06:08:21 -0700 (PDT)
Received: from [192.168.2.181] (46-10-148-26.ip.btc-net.bg. [46.10.148.26])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a7bcb8d000000b003fba97b1252sm801668wmi.1.2023.06.27.06.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 06:08:21 -0700 (PDT)
Message-ID: <1e7aa2c9-9de4-cd14-1068-5b05f081f82e@gmail.com>
Date: Tue, 27 Jun 2023 16:08:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 3/8] drm/vmwgfx: Use the hotspot properties from cursor
 planes
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-4-zack@kde.org>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20230627035839.496399-4-zack@kde.org>
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
Cc: javierm@redhat.com, banackm@vmware.com, krastevm@vmware.com,
 ppaalanen@gmail.com, iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


Looks good.

Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin


On 27.06.23 г. 6:58 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> Atomic modesetting got support for mouse hotspots via the hotspot
> properties. Port the legacy kms hotspot handling to the new properties
> on cursor planes.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Martin Krastev <krastevm@vmware.com>
> Cc: Maaz Mombasawala <mombasawalam@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index b62207be3363..de294dfe05d0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -768,13 +768,8 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
>   	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(old_state);
>   	s32 hotspot_x, hotspot_y;
>   
> -	hotspot_x = du->hotspot_x;
> -	hotspot_y = du->hotspot_y;
> -
> -	if (new_state->fb) {
> -		hotspot_x += new_state->fb->hot_x;
> -		hotspot_y += new_state->fb->hot_y;
> -	}
> +	hotspot_x = du->hotspot_x + new_state->hotspot_x;
> +	hotspot_y = du->hotspot_y + new_state->hotspot_y;
>   
>   	du->cursor_surface = vps->surf;
>   	du->cursor_bo = vps->bo;
