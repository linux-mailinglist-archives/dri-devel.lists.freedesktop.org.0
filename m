Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA0D7D3071
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 12:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2ED10E1A9;
	Mon, 23 Oct 2023 10:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B8010E1A9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 10:57:57 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d84c24a810dso2777620276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 03:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1698058676; x=1698663476;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NBVZHUuJrpDevxnw+p7Zz/Es9ubblbv4Z4MH6e534qM=;
 b=Alf+nt1iUuV0mxDzyheruU1OB7U6j2XPfB7WSSYnP1YBDHPCfSpMoXH1OW89WnRhFr
 vRql3wp50n57Tb3iUlSEZGhR43L+nJRS2u3cOsKl0dfGASoh6mvutM/GYg92balBjDX4
 1quF0IT5R3GAs7D6cDT6cON5x2JQzFKPfGCEToXV5DBu5mCeYS2mnEpAFdWIvJuTP6Ic
 BqvYAfP6Ir8hS7p3aTqOA4oVOh6FzdktIYbsVumzjfmz8TWOSJzS7j99Y3EWrVnSXTG7
 nCE/Yu3+9W5Fbld9fRMs2EDNiR5aNk2T6IJicMPGXDvTqeg9jZI//2qzEDtILkUF75QN
 DwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698058676; x=1698663476;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NBVZHUuJrpDevxnw+p7Zz/Es9ubblbv4Z4MH6e534qM=;
 b=PEFDwb0/URc6EO46nCns6K7JzJ8EPWVap0BSksKAlA5XCIEfP0gnPmdESddAw7jNJO
 VSe8vLNeYximgUg8FODSQz6DMbTlcy+ll8pCSuZ343B54EHcCDKD0cEsoKkMAHkUS2mv
 oqHydH/Mja16plkzgq/6zbka9FKdfOvC5N9Ha0zYP92/nyTmhLZfriIjjSbn5k+lJc7I
 nWUtJVQKQ4aWdGxfb+k8pmFrOwxjh1gU3kkkku98SBwWqpkv1ItPol9LnFM7M+5ZaQbu
 ChKbJZrn66gbfcTpnO488pJuK9ajcJuYLyXHMm7bjrPCq2/x4GtW8L8IB8sfoRIo/Yhq
 UIUQ==
X-Gm-Message-State: AOJu0Yzwp1qEtEGUhFe8mbgQQJfux0siGKn7tcBk/xZobp6nwAyAz8Yo
 ae0eEJGP0JNFON3iNPo3uWWvuIrv5ccN9tPEc47D5g==
X-Google-Smtp-Source: AGHT+IEA0mIfBUX90i7eWbXQ+g95+jr7ewXHBzIyIfnVUxr8Oxgpbeb2bylTylNReZIDaunfL5i6i7kz5iyvDY391QE=
X-Received: by 2002:a25:8290:0:b0:d9b:fd8a:871c with SMTP id
 r16-20020a258290000000b00d9bfd8a871cmr8096578ybk.16.1698058676397; Mon, 23
 Oct 2023 03:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231023085929.1445594-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231023085929.1445594-1-dario.binacchi@amarulasolutions.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 23 Oct 2023 11:57:40 +0100
Message-ID: <CAPY8ntC8UJCQB8KOvrA7-gJaDqbRPcmzu3Vg3bpT+yuMQkAH2g@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: fix typo
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dario

Thanks for the patch.

On Mon, 23 Oct 2023 at 09:59, Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> Replace 'pack' with 'back'.
>
> Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>
>  drivers/gpu/drm/vc4/vc4_regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
> index f3763bd600f6..8ac9515554f8 100644
> --- a/drivers/gpu/drm/vc4/vc4_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_regs.h
> @@ -588,7 +588,7 @@ enum {
>  # define VC4_HDMI_HORZA_HAP_MASK               VC4_MASK(12, 0)
>  # define VC4_HDMI_HORZA_HAP_SHIFT              0
>
> -/* Horizontal pack porch (htotal - hsync_end). */
> +/* Horizontal back porch (htotal - hsync_end). */
>  # define VC4_HDMI_HORZB_HBP_MASK               VC4_MASK(29, 20)
>  # define VC4_HDMI_HORZB_HBP_SHIFT              20
>  /* Horizontal sync pulse (hsync_end - hsync_start). */
> --
> 2.42.0
>
