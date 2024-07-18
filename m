Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082F9934C44
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 13:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC5810E76E;
	Thu, 18 Jul 2024 11:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="OmwXMokc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA8410E76E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 11:15:12 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-65f880c56b1so6321657b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 04:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1721301311; x=1721906111;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fvLtlvVLIc2uX9Mv4C24Hw1TFHGs1i0AqLl5Tk1HA1I=;
 b=OmwXMokcf5zBxHsYLSLY3UiC3S/R67TgQB0W+tx/NUiEcChAgdNn36S5SEZvNS6w/3
 NKvXS3ZAkMBGI2pZHrEGcOR8fGwN5VKCFfXmvjmJ5jYYH/UEydj69znLpLoUjUCVKPwB
 ud4fQxfnhCEMkC9ew263S979RDAPooK783sY5ACe1sjtdOZJhrFjl0LaJa2EB0IhJRf+
 2+HGwshoUpHnviGQwYjDabYGd+70mEm9KClrQHbnhs/O7anMxLF2tIL8m90VhmM9+IIs
 G3LWpE1wSTQ8hREQDs8uLW7f6oj5zICihnIIbJ0YaLrrbOVLKWwka8Q1Pv2iLxHLfbmj
 g7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721301311; x=1721906111;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fvLtlvVLIc2uX9Mv4C24Hw1TFHGs1i0AqLl5Tk1HA1I=;
 b=enDrGCm1fC63FvmoAfMfEgBllcKTWBwSLl3ZwBZbQASOKS4hzDRXCWVWvNgTSgFMEo
 qQMSAe3Suufzqyj4OrPgwAYBBjLirBSZpRPCb7y0uJ8/1aX/sbVEY/4RkR+/WjCcm2kc
 Q/KCKitFxYYbECu/6qaeIOCTO17MqxSVs3KCa59x+KwT8HLMRFEIcB+cqDki1QUhJhp7
 subkJxSSaD5kXU1QM6QJnyUWZQB183GPoELWMduKqMRAsUkvgbqrUsP0tEmoFbuX/44e
 GXCHZduRCoBu8yPQzXlaJVVaN22M2GptbDRB2zuqpSSa8thzqkOXAlA0HLvHX4e/kx3C
 3XHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlQuXgrmmb/+NhL+8TjT0mmRmPEylVMMGUx616mabKsCVoRrMgj9bXUaUoamCP2qEqyiKmuDxWkJt5zufG+sIXkp5o3uWw80NEiiQ6nvAX
X-Gm-Message-State: AOJu0YwdnHTkupqd/7PgAiMuac0BYINWnoi+UxvWxmDiVwfo77m+Msm8
 7piYOOKsakS1fW+7N/j+8WPLUto9eUB8CJB1oyT5TyU965c4Zi4Bp0zvQLNmYe5CcTPFMmd/lE+
 edPWJi21Wt/ob0x8m2qxLWhT7fQXsXhrXYoB6NA==
X-Google-Smtp-Source: AGHT+IHg27/h28x8cH6RNystKqwtN9ObuunzW9wLXPCT62zkr9oqTMXzH3ODAVfWE0/MOqv8X7Ek5YsHXkLmGxcCKWA=
X-Received: by 2002:a0d:da07:0:b0:64b:630f:9f85 with SMTP id
 00721157ae682-664fe45113fmr49718207b3.12.1721301311396; Thu, 18 Jul 2024
 04:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 18 Jul 2024 12:15:00 +0100
Message-ID: <CAPj87rM1dbawwtRnMzDRLLCt6FuOU+851hcJhKDsg1ioRM2Pqw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Declare Z Position for all planes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 daniel@ffwll.ch, matthias.bgg@gmail.com, shawn.sung@mediatek.com, 
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 18 Jul 2024 at 09:25, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> MediaTek SoCs support multiple planes, one of which is the primary
> and all the others are overlays (and CURSOR is the last overlay).
>
> In all currently supported SoCs, the Z order of the overlays can't
> be changed with any fast muxing action, and can only be changed by
> swapping the contents of the entire register set of one overlay
> with the other to internally reorder the layer properties, which
> is indeed feasible, but probably more expensive than desired.
>
> Declare the Z position for all planes with an immutable property
> at least for now, so that the userspace can take its decisions
> accordingly.

Thanks a lot for this fix!

If I understand your middle paragraph correctly, please don't ever do
that though. I think what you're suggesting by 'swapping the contents
of the entire register set' is:
* plane ID 40 (normally) controls OVL1
* plane ID 41 controls OVL2
* userspace configures planes 40 & 41 with a zpos suggesting that 41
should be below 40
* the DRM driver 'swaps the contents of the entire register set' by
making plane 40 control OVL2 instead and plane 41 control OVL1 instead

If so - please no. Just declare an immutable zpos, because that
actually matches the hardware, and then leave userspace to configure
the planes in a way which makes sense. Looking at the zpos property is
already required in order to handle overlapping overlay planes, and
any userspace which supports overlays (including Weston) already looks
at zpos, handles immutable properties, and will dtrt.

Anyway, this is:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
