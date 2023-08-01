Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF4076B909
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 17:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DA810E40C;
	Tue,  1 Aug 2023 15:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B8110E40C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 15:50:08 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-44768737671so1874258137.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 08:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1690905007; x=1691509807;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b6jJyVf7RUG5Oz1UBUGZYrz9BmcTRwl+hp5AhcDr85A=;
 b=t/j3Xp+L/oMCrVzmKahKyhcP6ITPohLnY9eJUrde1olu7UYhK6AEzD1QALFooNQXW9
 fhsvYTfj4LWhUl+8gxF+dtyWel3Et2fcT/f4TZEQe883DSBb/UxYh50PjbxX98ocuFdO
 MXoSduA8o80HMSGk5wnkNdT3/NMyMtF9nK3tIzXFlWM5EvDFN/MQJTuN5srbO1mdkK7R
 VpnEBB7Hu6xKtcM1iIeBluVsUSzRawj7pq1k8v6cIucsVYjWLWwzDd/45Ko0CXPmwpIl
 eB40UZrh9zl0/kvpjWR5vDtoWpSAOIKD/fGUpKD5lkhu8O0Nb+814AG5g+7gLRZ5UUMT
 WXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690905007; x=1691509807;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b6jJyVf7RUG5Oz1UBUGZYrz9BmcTRwl+hp5AhcDr85A=;
 b=RnnmGzKseRfOc2PW+ekL7vPg6+d5SmxEFVRRVPPK3u8bQWcacIFl3dWEK9Ipi5GUVS
 FpEdhkSnGTAV/wgr8EyFWFuDTKcHJO3U4X7o3QOLxchIZtG6Z7qmGei2j04RBHSW5HVZ
 nDGAU5k2DpSlCAYijOqG+dIqUiuoGPdIz2+JzQDCFh/5OIV6vqfC+nGNN5PRkhlb8XRS
 zSqvP3XAlqcY7Mi7P9S7v/xTRXVQKkgDY3Y23LOP0fdT8isOsJ2ugqzHfy07OgO2kOX2
 Jv2waBFX3po48bY41vmSr83/0JyuZQSjwCrCYdlEbDtQcjscTb0EBuCwarQSQ44HoCXB
 IcjQ==
X-Gm-Message-State: ABy/qLYNkB0JcT5z6YKDnAVNZNhGogMNPtWHvDQwIR+K2e/FwS6CmVDy
 Z4nPTOQq3E/EdyJF3wZbm5vcI3n+A/Hzf5lBUsqKuw==
X-Google-Smtp-Source: APBJJlG4J5GKGOMvIhc+NRtPMigiHwhf99fQO0ZmCtRQTqy4jQrGciPC3WXt44eGvocJB29AWEdBzrct3AI+KXfuO6s=
X-Received: by 2002:a67:f604:0:b0:43d:6660:581b with SMTP id
 k4-20020a67f604000000b0043d6660581bmr2673911vso.5.1690905006861; Tue, 01 Aug
 2023 08:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230328170752.1102347-1-jagan@amarulasolutions.com>
 <20230328170752.1102347-2-jagan@amarulasolutions.com>
In-Reply-To: <20230328170752.1102347-2-jagan@amarulasolutions.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 1 Aug 2023 16:49:51 +0100
Message-ID: <CAPY8ntBa98ptyybiScEW_vjF=rZ4HH9YQdxc=OFpP=qh-pUkjA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: Document bridge init order with
 pre_enable_prev_first
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Mar 2023 at 18:08, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> In order to satisfy the MIPI DSI initialization sequence the bridge
> init order has been altered with the help of pre_enable_prev_first
> in pre_enable and post_disable bridge operations.
>
> Document the affected bridge init order with an example on the
> bridge operations helpers.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> Changes for v2:
> - add missing dri-devel in CC
> - prefix @ for bridge helper names
>
>  drivers/gpu/drm/drm_bridge.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 052a8e6c9961..caf0f341e524 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -654,6 +654,13 @@ static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
>   * bridge will be called before the previous one to reverse the @pre_enable
>   * calling direction.
>   *
> + * Example:
> + * Bridge A ---> Bridge B ---> Bridge C ---> Bridge D ---> Bridge E
> + *
> + * With pre_enable_prev_first flag enable in Bridge B, D, E then the resulting
> + * @post_disable order would be,
> + * Bridge B, Bridge A, Bridge E, Bridge D, Bridge C.
> + *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
>  void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
> @@ -750,6 +757,13 @@ static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
>   * If a bridge sets @pre_enable_prev_first, then the pre_enable for the
>   * prev bridge will be called before pre_enable of this bridge.
>   *
> + * Example:
> + * Bridge A ---> Bridge B ---> Bridge C ---> Bridge D ---> Bridge E
> + *
> + * With pre_enable_prev_first flag enable in Bridge B, D, E then the resulting
> + * @pre_enable order would be,
> + * Bridge C, Bridge D, Bridge E, Bridge A, Bridge B.
> + *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
>  void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
> --
> 2.25.1
>
