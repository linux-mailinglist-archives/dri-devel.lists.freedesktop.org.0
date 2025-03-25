Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB43DA70A1D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6CF10E5DF;
	Tue, 25 Mar 2025 19:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HavjAWzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C8C10E5DF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 19:17:27 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6ff1814102aso1511357b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 12:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1742930246; x=1743535046;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KkzfLl2EELX81s45FDKPbh4PpckbL/4ObSjBAqQDCSs=;
 b=HavjAWzoytVOt3iHgk2Gd6Oq+8k0zR4Ac1iXwwU6/9R7i+yOgZjeVtXYbOZn5cLMW7
 2sQ1kThQE2ZQRQHq07+g4bE59Vx3drWEbf6hX/sTvFvH61Ka8R3ZoNEOCkE+bSokNlG9
 2W+N8/1kkE5I+BkgixHRZLlLckHmc8v+nDWNvFr3ODf4dGYAmkhlbdTDSs4NK7nFHfN+
 F1HTPMazmbRaBamX2YcqgUNm/RqX4SsN6JJTw1ki3jVQYradQ1Ve/l75C1FV/OHetyy7
 5XEOIs+K4I4w0/BJ3ws3LMcCj18xpgWIPhw1UbdrDuf+vEgJylQVkd7fxtoiRujgGKdH
 Q5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742930246; x=1743535046;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KkzfLl2EELX81s45FDKPbh4PpckbL/4ObSjBAqQDCSs=;
 b=dUp4TQHXYesT6IzGNgdNcB1rM+MokKtYDV0CCTESRyuhRS40uZFY4CWGp78OoDGHX7
 zg1DMKejGPGhzzXa8vvcevhtzJw57Tmd1MfC89iH7jmNnIiDWNO9avEejZi9f5JlyjoH
 P4gN5LRIS9nQ5phTu2f3HxyCAApKQt29xIiWWTHFdd8ml33wWPOCCRoogPuqB/Hdb98f
 7Qp7kq0JNqU7MeL1IMlKOMD67ZY3Xi16TXJnlvI07Z5jjZotg4JIKJSUN/C8v3ZQ2vCV
 yYzBtClBCrC58GJjL1OqekstEDEE4k4mvmInbHhDbSavNzBSTAtFw+Pbm7luA2b94lcE
 fG1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtfFHAc/xoaBtGm3CIbxLa6kSl0/4HU0BxaOGfkL/aPCWhg0YvShhtYnn/clkwXFaFe13oepezAPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyjf+YdRmuTU9dW25INMkQsI6SoOHJibNTcPZ086XciCx8/32oN
 NfckIaQip8iqQhZ5o7aAIG+HTZuX3wBMvkU93ZMRkrGujBtq5In//HJ1MVNTOQ2vSlYlRswGil4
 vTABRQ4snCvq8mB/juatR/Czpkpt0wwwgPgzPLg==
X-Gm-Gg: ASbGncuN0/EhnbEQ1C8RGjcbaz2A6SUGwtC1owp2ZrrAve6AsLGhgaYCqbUpKryPPlV
 J3UNPEm8JwRwp3M3z56d03IWyDqwiWc9zQqyDQktzl1p5UWAhYdSmJhyKh7ksmVVR/QyDhC/wZC
 xueiH8EuGr2lmTyq5EuHEJgH42WV7/0kZt5VQ5MR6fLA8eAZXaDzFV7h5E
X-Google-Smtp-Source: AGHT+IF9QHoEqtScb0DxWu6P+2GXBQXj0+qQ0MB7yo7y54LdVO+9b3BgxBQ/u8rPx1CuXA9HK00F4fXj8rgkVom3WVc=
X-Received: by 2002:a05:690c:24a:b0:6fa:fd85:a2b6 with SMTP id
 00721157ae682-7020fe83e1fmr12603657b3.13.1742930245803; Tue, 25 Mar 2025
 12:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250317-vc4_hotplug-v4-0-2af625629186@raspberrypi.com>
In-Reply-To: <20250317-vc4_hotplug-v4-0-2af625629186@raspberrypi.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 25 Mar 2025 19:17:06 +0000
X-Gm-Features: AQ5f1JrGBIAhqvbJ3tPqRrxYHVSuuX_SUuj7ocebvIQPJh6kl8Mwb1WieT6LqkE
Message-ID: <CAPY8ntD8uD-PqGMVRxgWS=_JE7v35CUWtzTr_HHV__wSHtvCNA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm/vc4: hdmi: Add jack detection to HDMI audio
 driver
To: David Turner <david.turner@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
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

On Mon, 17 Mar 2025 at 17:13, David Turner <david.turner@raspberrypi.com> wrote:
>
> This series enables jack detection for HDMI audio on vc4 devices.  This
> means that userspace audio applications can detect when HDMI devices are
> connected or disconnected, for example to play/pause or switch to
> another audio device.

Thanks.
Series merged to drm-misc-next.

> Changes in v4:
> - Split the update of the comment on
>   drm_atomic_helper_connector_hdmi_hotplug() into a separate patch
> - Update the wording of the comment
> - Add Reviewed-by tags
> - Link to v3:
>   https://lore.kernel.org/r/20250312-vc4_hotplug-v3-0-d75878677de8@raspberrypi.com
>
> Changes in V3:
> - Update comment on drm_atomic_helper_connector_hdmi_hotplug() to
>   clarify that it must be called for disconnets too
>
> Changes in V2:
> - split initial patch into fix and jack detection feature as
>   suggested by Dmitry
>
> Signed-off-by: David Turner <david.turner@raspberrypi.com>
> ---
> David Turner (2):
>       drm/display: Update comment on hdmi hotplug helper
>       drm/vc4: hdmi: Add jack detection to HDMI audio driver
>
> Stefan Wahren (1):
>       drm/vc4: hdmi: Call HDMI hotplug helper on disconnect
>
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c |  2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                  | 22 ++++++++++++++++++++--
>  drivers/gpu/drm/vc4/vc4_hdmi.h                  |  7 +++++++
>  3 files changed, 28 insertions(+), 3 deletions(-)
> ---
> base-commit: eff0347e7c228335e9ff64aaf02c66957803af6a
> change-id: 20250312-vc4_hotplug-3ae4e783484a
>
> Best regards,
> --
> David Turner <david.turner@raspberrypi.com>
>
