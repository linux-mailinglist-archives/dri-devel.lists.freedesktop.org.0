Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD942B3C8C7
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 09:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B2410E238;
	Sat, 30 Aug 2025 07:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="XgCCygt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A94810E238
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 07:34:39 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4b109c58e29so45890711cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756539278; x=1757144078;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/XKolNdOG4rWtnm/Z1Xm//IS1jzblLqTcVqQ5IMS/rM=;
 b=XgCCygt1+ceeQo9FSytavHM0RPVoeBDY3xoEo4LofhTttbrel1EEyEWUAgZDO2quzZ
 aGvAKL+TrZ9hKQ4c6ZM6qaSRY0eSKUrBAbJF9HWXYa+F1xavcvm//YG3x+4kIGjMZEec
 lgw3wjZhDxhFwyr5Hpz5FNxTrXKUNOvpcO9DMsHUAA0a4SM+SFGAG3PTh1QFKQ/8YtVC
 dSG5NSNdfFgNGChl4t5RLPcSNXJ3nJ7l1fDBlfS7HebvH8Ev1wmMjgA/CCmiATcCezjX
 8jZLrJoU7pc7h7TxD0LkU/bHaoQGpeN2gPZpFFFvuTU15h/87Erwewlsdjz2plcC5+8i
 0HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756539278; x=1757144078;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/XKolNdOG4rWtnm/Z1Xm//IS1jzblLqTcVqQ5IMS/rM=;
 b=R7QxT4KpvM2+ScIcr0/DBfN935EcbhlGf4qcyNOQyNFB/66KEwEtOKizIPZo8P5xeu
 E0rsdMwaSc8wsgKauFnE/7Y57KC1v5Tzgoo1WnVN6irgLPPzpEEu4ZvNDaMf1kn+jXYc
 p/FdcZR5/wGbSCfHo7Z23/6Hyn+NJ3yrnzYmFLp88rbzj7xyzRhMK/pnZ1S1dJqN4wVJ
 0cdiwGv+CY9bD2FBxx7GWsuOerjfiZPcIdMZsknQMtgtm/yKgdzcBtX748JkffPbjwlY
 QxdeIqHituIq0+tA+8wCy4f1/Txg/fSNvLaqqAt6dUHgaRZBpdFTJQe/ulYhDVF5uyVF
 F/+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJpYtYLIjj5I32WwoT9EKVw7UH808gx16yEPy7PAKb2FoB0xu5J5suKbf3R+4uXQ+9P0gKDonBeAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuPvBJTLGxzMdX3apEgClGBwRHxIuGd3qrFr9p7Jg+JfW+4obq
 j09j+ua81DflDt/Hk/bwDVCG5sl0nxiM/Du3zRX9OiDKy/iLvcJY0ksjXwEgqcovtRp7j1UI22W
 T7s19OGXJ/AsFnFnbWV58ZvQRlcBAAPbTWrhZ6UuzmA==
X-Gm-Gg: ASbGncscwQ1Jx25bI7juzif4KdVekpflfx16/kBwokVUw3R+JDRkd0h+HlzKptTHu9z
 UESBuF5oMwJV1pkQtdMgQJpjqBkD1W3ryPeU+g8/jd9KiMk/gbEjN9bclEvahRA1/5RcDSlqV+6
 L0pqnXlO3uWu9EHgpuK8kt61hRIihH8kNcsB1oYXn7clZbQKDysbxwTFogjRuVF3/TwFUujwlc8
 memow==
X-Google-Smtp-Source: AGHT+IF+RtT0nHcRaStCokPpIqIxLujpZpjFFgu9P7ssG1Dbp9cdTPQGJvkbcXDD3qNhvrdS/Kj2NXgLvHLELse+VQw=
X-Received: by 2002:a05:622a:4116:b0:4b2:ec43:3de4 with SMTP id
 d75a77b69052e-4b31dcb27f5mr15037901cf.75.1756539278311; Sat, 30 Aug 2025
 00:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:34:26 +0200
X-Gm-Features: Ac12FXz1p7iZOdEEQR_vXRtXiF18jyko9t937NCSmf3jeVcnUDmrfFo9HX_W5zM
Message-ID: <CAPj87rNMr-2ZeZ2Pqb5qG4Z-xtUyOVxbY635pw_PDEjVpd5-OQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
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

On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> +       if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
> +               drm_info(dev, "HDMI conneector with no support for Vendor-Specific InfoFrame\n");

'conneector'
