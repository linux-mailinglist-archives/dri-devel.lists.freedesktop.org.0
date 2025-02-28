Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BE2A4A5EB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 23:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA7E10ED6D;
	Fri, 28 Feb 2025 22:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dOkhtavX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1779310ED70
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 22:30:10 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5462ea9691cso2868198e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 14:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1740781805; x=1741386605;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRYH/DqwOrqprt4Hy5jDneelAnanR7z2qpvPIfRcpyU=;
 b=dOkhtavXXt7V6gI2Rlao/R0J95/MS6hHM688q5pSe/augblhyWZr4fTlAUIgONg+BE
 epXgRCaHQGRA4BKYStbFVizM9RBlOb1cSaojLhObvUMJB1Irr4CKktDMgmTAeUVKYF2z
 KMMzQOhTpDUTRFao2LSAqPY6gczMZEae3UTAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740781805; x=1741386605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MRYH/DqwOrqprt4Hy5jDneelAnanR7z2qpvPIfRcpyU=;
 b=i61sGBAvHvzvs9a/sDH1xDGTDurozdUL1gYWxzD4Fk7tAjU+LM+WQVGIEJjAn/FKFM
 oxAZemyaUgQqDbLGnwEVzl7/tEkBbYWntWSUcrgPYY8EsSKV729i18TT2+3hD0Takctg
 Rx5bNGwSvargaCp1CYx7pJTImsXGslmDXo4zeuCDoIqkFoo+0ZBO1hf6PRHIHwRWCyV0
 nUYN6ZzraPqKtA33H/IsJI79UT2Q34Ikml3zw2a1jrVhLWNQn2Z/l1dLPyWKKkY+PHJm
 KJlf/AKmLL5BxTRs/MDdLhIJXMVzspgdzv0/YzNQF9FSotRIhXPXHIvl1ci4jqCytaEU
 Qomg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFR9mSxw9H5TS84HOn2JFY/kNIZvVCoNr6Hab/BYbnzDK2t65c1984qilrjViSWLYXBRmbDvrxG1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypX6jDgmuj72U1cBunDtyCEL10VP1/5GFtGjhDem2gx5r/1DR0
 vr+N14dMC6jEwe5hYjE7S/DWpKe9mmnyd4LQS0r4/Jy+H9njC+ZfFjwXSyBHbPbH5CIVT0s4tfA
 =
X-Gm-Gg: ASbGnctWO8WHB1Zj7oHohuepZSgaVyR7gPNZIrbuEgEGVgNzlZfCXwA/96PQnHAjSkl
 44ZDqxjr0UZTXWfv53dYxbnE3YqZ01sIH1gPVqJ8iciOgKQwHMaU7Oca6HdbWX3UEyKTCzQnvsq
 LucFT11GJxB8arxHpdXOmi9s/FnIvRckL36t4SYjJva7dEbwEFQukHu1s/TmytdPE5vU631btXj
 W6CWu3Y93YwWFcH6qA2jN3ktIBhjpKru/GPFBkh4Bmqi+sHyA+ggPTYofvhzXP+bfQ99x040qm0
 eSCwf8gNbKn/NYcNI/9TugRaLIpe+6DRPWZxi6fmyougeEcKMJkF4+SvrKzEKKQ/LLWSCw==
X-Google-Smtp-Source: AGHT+IE3hy7zGoK1LnepybdMSa7Reda7tecll6c8MVGnxx88uMvZcA52ldnsdGIdOOs0i4aPnm7rZg==
X-Received: by 2002:a05:6512:114c:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-5494c31c81bmr2219921e87.16.1740781804726; 
 Fri, 28 Feb 2025 14:30:04 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549579424e4sm181384e87.118.2025.02.28.14.30.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 14:30:04 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-309311e7b39so26098311fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 14:30:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU9d3FbVv/CN0n46hBvIf9wqgzCnVMoRx2TFYgsN7aPnszoHoAucqieERGs4NDc8W1iAKPLusgG5FU=@lists.freedesktop.org
X-Received: by 2002:a2e:be03:0:b0:309:1d7b:f027 with SMTP id
 38308e7fff4ca-30b9320f37bmr19835331fa.9.1740781801791; Fri, 28 Feb 2025
 14:30:01 -0800 (PST)
MIME-Version: 1.0
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250225-bridge-connector-v4-15-7ecb07b09cad@kernel.org>
In-Reply-To: <20250225-bridge-connector-v4-15-7ecb07b09cad@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 28 Feb 2025 14:29:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XSoANcWJEB13xmP0HjMS9dSF-LFsXG-1DS-UPbbeOxig@mail.gmail.com>
X-Gm-Features: AQ5f1Jqp-7Ry1Gg8ZKOqY3HRbtGi61kp0H-KrgGIBh7MRLyPJ5mDvINcqx1JO8Q
Message-ID: <CAD=FV=XSoANcWJEB13xmP0HjMS9dSF-LFsXG-1DS-UPbbeOxig@mail.gmail.com>
Subject: Re: [PATCH v4 15/15] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Feb 25, 2025 at 8:44=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
>
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 58 +++++++++++++++++++++++------=
------
>  1 file changed, 39 insertions(+), 19 deletions(-)

Booted this up on my coachz with ti-sn65dsi86 and the display came up:

Tested-by: Douglas Anderson <dianders@chromium.org>

I haven't followed all of the refactorings, but assuming all the
previous patches are good w/ folks then this one seems fine to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
