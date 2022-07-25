Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A9C580005
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 15:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478DC1137F8;
	Mon, 25 Jul 2022 13:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AD314B543
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 13:35:56 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w5so1533635edd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 06:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=GFusXoam6wya2VWS9PJXuW3DvInAdEJ9//t9Bee21e0=;
 b=DHxGefFHTRv38ajY2FtkbXABq2lehE27Y6J4I4YP1q/gCf1BUjLwa/CzWdHYq9ky8W
 XiekGUCiEBu7VCY+yPnaX6gbG1DdOanziafwfDueep+B0alDKEth6xWtDjymUGK1//Oh
 YSSeHQu5vnEpxcflkic8YZzNHZjH/ZAJyY4C9OySp979POdziZTIq0W/krsJX3UVohbr
 AhrEMg69BejDE+gKzn9crpUvDdWnb9w3Tf50KRsoJr3On7kxLC1MJoFRojFEoW9+bqmR
 md4Lzpzdq2hh0K27fsRMa4ojnOWOR21HpIEQp8ij/AB8YSzbHiY7GdfcbOv/e2JdmqLm
 Nzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GFusXoam6wya2VWS9PJXuW3DvInAdEJ9//t9Bee21e0=;
 b=dsJ8tCYLqq3k8bIf5Zx7MvvjDaqLsZm5s0+X0iG2IpItgadqT9GT/LVCd47qOGxrU2
 PulEjr6wF8GfdvfPF3hYKKBPjYqQxCa0sbix8S9cAenEIOXrcYvYQxh1Xg38Hlj8BwPI
 6NrwOLBroXwwlySy2cy68M05dQp5+fed+TRoV7eOVnDl8owJ9Rthy02RTMzumLlkaGFF
 gH95QqgwKKpo5iJftmNbL4F+SJNXoKmZTSGYNDOR6tEICAVM+ydM6v98o9BC0qBK7qkJ
 qWErf2AmNsgBcOmVJxG5E0aaaLKvtLO6IQ329qenLutc0HTQ98RQVb3aiLNA+nyR04f7
 SCew==
X-Gm-Message-State: AJIora9ChNFeFX7CY+nDpp3lFCQy7LzewSxCGvaTn/DbZ8gy635Hn43h
 w8t8sdt+KnxXRW7n6OXVvi/JBHJOhC8=
X-Google-Smtp-Source: AGRyM1ujBwFeoM84g0CSfJMEgCS/HzjSDa85FHFeBOZZN7cTBNrH45rH5Jfd+3U8RRr+sAj37XzOjg==
X-Received: by 2002:a05:6402:3492:b0:43a:d1f0:978e with SMTP id
 v18-20020a056402349200b0043ad1f0978emr13622758edc.306.1658756154918; 
 Mon, 25 Jul 2022 06:35:54 -0700 (PDT)
Received: from [192.168.2.181] (46-10-149-62.ip.btc-net.bg. [46.10.149.62])
 by smtp.gmail.com with ESMTPSA id
 11-20020a170906310b00b0072b3391193dsm5316555ejx.154.2022.07.25.06.35.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 06:35:54 -0700 (PDT)
Message-ID: <4fc8a5cf-749d-0011-a223-027a354c05e0@gmail.com>
Date: Mon, 25 Jul 2022 16:35:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/8] drm/vmwgfx: Use the hotspot properties from cursor
 planes
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-4-zack@kde.org>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20220712033246.1148476-4-zack@kde.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


On 12.07.22 г. 6:32 ч., Zack Rusin wrote:
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
> index ff2f735bbe7a..3d3f73109199 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -652,13 +652,8 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
>   	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
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


LGTM.
Reviewed-by: Martin Krastev <krastevm@vmware.com>

Regards,
Martin
