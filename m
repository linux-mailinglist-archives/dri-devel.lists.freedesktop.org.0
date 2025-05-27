Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59906AC5248
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 17:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCEB10E513;
	Tue, 27 May 2025 15:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Wg3aXlJy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAA910E512
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 15:44:58 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-231c86bffc1so35031085ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 08:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1748360695; x=1748965495;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PakHKMJ8Xs6xyzsoFyIyRKOjGH16e9E/47uHjvou8JI=;
 b=Wg3aXlJy+dUu+7s41ZgN4pOEuDcyGPqy3J8JvS0CWt+azaX2UxndXUnKDaRP6I5udg
 JKFdZ9ybd9sIQ+6SCGhEWgftnjTVRi/eo63fsphNKMHZAUdWclWBDa4kVXYReGjcmL7E
 XDvdcckVYpEjzthz1XV1LUhnvlXtXQ8+siDcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748360695; x=1748965495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PakHKMJ8Xs6xyzsoFyIyRKOjGH16e9E/47uHjvou8JI=;
 b=W5wpHv8C5ThrxwHhIoFOsntF9W9yxP/+fQLMtbCVZWhZoZJ8nd9MNH5HGJi/jd5kAJ
 KRKuQckba9iPQFsUyXx8VmYYZ6rnTBJfFkNsLfKoVaIFBS4hJO1ITZnxHib/S4px3Uvh
 brUjwKqC7WrJdGO6IxzhDp6SEqw66JovTJlSVwrRIcO3vKiLYYzOwF+lTT1jil+8o7B8
 IS9wgP9+54a8t6E/Evw7KislJVErrFpQ/jpXw8xxnqw0cGEmG8VdGiSeWu/ITFKokZj6
 w/DfBp5db4PyMaJzPt20WJhaaGaLd8xc28Kl7cQTB87VQu+L3DiVeLbo1YjEZ5uYBrbG
 N/6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQkFBzpCdRb2B+WRbSnEzZ+dCj6sH/aCRgwJPqld0UQVG3rTMQMn4eoKNigbpN1gS6Bm0e92CDL8Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzP8se+poCRRrf1cRXSl0bT3o1VpWuTiFmPOlxvGvc4HEFCI587
 AaDih2x1se6glnsfx/SBXBA7f/Cg94iS7EPFJYkYxXjK6hot39shdCJo6lnuc8RuMca8ciu2JqR
 nRHw=
X-Gm-Gg: ASbGncvnVN6n/GXftAPpa0O1tgeaTazYFPgJnn/r/O0CZqRUCS/T2smD2GF+J+PqpAd
 9n0i6RPQkgUGWm18d/CLKUo6su4H3BxUi/qoOUrI4gM+sHX36Xi19QYRPNi/OrhV2n20hW0x3GL
 uhmxDIHp0HfHVDyHElyZk8nT//P14zerapwYTJOTwppXCU2Wc/rS8llC6NGD2Bt/l+6G3ZXs8jR
 ccAk9YFwZSsLUycrg7Zf6a/Kkg+BQ8I9qC1skZYhDv6Q6bxEe9oR3b+E6CKE9/iLQ1hPFrvIJ6H
 DjhofgRXKPMz2xarz3aXHQTWfGqw7tFW8/eCtK2kexx9RAlXPJHxv7jBubaY3WLpjGmzmunxjB7
 oGYBg9BLwYZYLamXBHFg=
X-Google-Smtp-Source: AGHT+IHB/IOOFSTG0Y91jZBzVJrg6PnxY7NYtQi+++tPkQhmXZpz+U8MDR/XhSKK0ka6MLd8CnQuiQ==
X-Received: by 2002:a17:902:fc46:b0:234:8eeb:d833 with SMTP id
 d9443c01a7336-2348eebd941mr72285115ad.41.1748360695566; 
 Tue, 27 May 2025 08:44:55 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com.
 [209.85.215.179]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-234a0ed02bfsm12613875ad.27.2025.05.27.08.44.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 08:44:51 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-af6a315b491so2726732a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 08:44:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUvmkyUeixoPttTb5WxujdHdBLovjOLHuLCNljfdF8O7witsASTZURs+Nn8elLPTLI8iI1YS8Pi2SI=@lists.freedesktop.org
X-Received: by 2002:a17:90b:574c:b0:30e:3718:e9d with SMTP id
 98e67ed59e1d1-31110d99815mr22019929a91.35.1748360690534; Tue, 27 May 2025
 08:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250508115433.449102-1-j-choudhary@ti.com>
 <mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq>
In-Reply-To: <mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 May 2025 08:44:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U7XJZg4Vh4xMKEiAuaJHNA1H11SiD19KLBazPmMEVduw@mail.gmail.com>
X-Gm-Features: AX0GCFt2eGdb16tbpEFBJdqrS8eXhJRx6Q2nyER391D4cCLrL_PlO5GkVH2JRNQ
Message-ID: <CAD=FV=U7XJZg4Vh4xMKEiAuaJHNA1H11SiD19KLBazPmMEVduw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Jayesh Choudhary <j-choudhary@ti.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, 
 max.krummenacher@toradex.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
 linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com, 
 dmitry.baryshkov@oss.qualcomm.com, ernest.vanhoecke@toradex.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, May 26, 2025 at 1:41=E2=80=AFAM Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:
>
> Hi Jayesh,
>
> First of all, thanks for your patch. I applied it to our 6.6-based
> downstream kernel supporting a board I have here, and noticed some
> strange behaviour with eDP now.
>
> On Thu, May 08, 2025 at 05:24:33PM +0530, Jayesh Choudhary wrote:
> > +     if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_eDP)
> > +             regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD=
_DISABLE,
> > +                                HPD_DISABLE);
> >
>
> On my setup it seems that `pdata->bridge.type` is not yet set here,
> because it executes before `ti_sn_bridge_probe`. For the DP use case,
> this is not a problem because the type field is 0 (i.e., not
> DRM_MODE_CONNECTOR_eDP) in that case. But for eDP, it means that we are
> unexpectedly not disabling HDP.
>
> With working HDP, everything is fine in the end for both DP and eDP. But
> when the HDP line is not connected, eDP no longer works. So I wonder if
> this breaks some functionality for weird eDP panels or board
> implementations.
>
> I could certainly be missing something; from my understanding it looks
> like without a good HPD signal, the `ti_sn_bridge_probe` and quoted code
> are stuck in a loop. `ti_sn65dsi86_enable_comms` runs but does not
> disable HDP, after which the probe runs but fails and does not set the
> type field, so the next `enable_comms` run fails to disable HDP again,
> etc.

This does sound like a real problem.

I'm not sure I'll have the time to analyze it and come up with a
proposal myself right now, but Jayesh: you should make sure you
consider and address this issue before you send your next version.

Thanks!
