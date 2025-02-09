Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B62A2DB15
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF4310E479;
	Sun,  9 Feb 2025 05:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uEUNJbJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9996910E479
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:08:29 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5450622b325so739536e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077708; x=1739682508; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xxe6b3I5l+DMAomwokzE2boxLKYMF2Wz1rXmU/foweY=;
 b=uEUNJbJeGW8sAiKRVb0XpIScAUkk8QhbXY6NDvAIwcD+nNt1G+fnILt6J+ViOpJ1Jh
 SUVuA5svOS2gpPyBtMkdTRMdRXaGe08Y/P3ERuQSUPBEgfJy8oPNHlhETdu9qSvqml4Q
 uN+QseKT0A/+BbQiDWI5Jx88CNQVmICaqOpw+kPe4p2p4I93tIRTZMf+D20fyOfEN504
 KqPxXh0bH9/uTp01w8AvOJ5DtOC943/QQn8Ul46RAUbHHKN4xDGz89eZV1WiHwcI3dJB
 MyhvM0nb7zdZQOi602Q2BHBQrmUX/SWsLdc+k4J0Pn0DTOW4ZDTi0JfuG91SKZe4jYck
 MZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077708; x=1739682508;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xxe6b3I5l+DMAomwokzE2boxLKYMF2Wz1rXmU/foweY=;
 b=Xg2U1iaq5CALCsC5F58H8ZLeH4xF3gWk8ktu0q6n1gX1OnNgiroYcs4x/Dyl/m+1K2
 eS20QBxXGDCLE85px/8UbSSUM6TclhiZayaRmOva9cWScywT41TKoo5TKf3r51jV//8B
 XcJqjab1125lJEBTIO7oKPeNPkT9FsJJMIcf8MPyA8V4D77T/vNRc6uAl+kxLND8R1nz
 WOjv0pycFK4zWidTWoV5s2FS3VFVJYtU9llXRpVEmtnce+mAejIh9dcOyN0v3Y4WScQV
 hZGJC+2lrNDw6FEOdPR8+zBUBSZXy5Eez3GcrD95EXgt8jjtfskRrdR0xbJVcxZV8wPZ
 eC6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVykEZays7mR+rRZwti4jEkW5n+wBzflK+n5i3NfDpPl+mk+ITEpLzaf/TXe2uOUj6qGuB68gFHOfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEQhfJqNEooQCYSd8U0shsF+zrP4+MFJ/Jzw4bJA+tJX/tzA7M
 vYEKQpfOBbb1nB+gu4gEnKOX+hIkFPzOjmSVMK2cRsP347sidklyulCV7HhGMhY=
X-Gm-Gg: ASbGncs+u5ZgQD3fEz8gZ4FNr/W/q75q1WP5u2n/6vE8IzupDd/B9B/mqXlwGy22w0o
 i8+EpE4+vt87JU1Dusz2fNQ9ghftI6a2JPMksNV3XfHrTmoJjAcllI9OGenYhYk5AQ7kYw9Cif5
 fGAggXPAT3JUCt3vH38jkGik/pt+wUZMJjZCL/fENk5wpK5kqXfco4Ln+5Bh9wmsUlZtGqEbhka
 haiFzwc6tVg85phHru64aENlcIwSDFbBcmk1uirT8yQGPrAls6N+M9wFTnP7OKtruqAK7ucT21M
 hmI2jAI1pcVIpMWCW8E+6yQJm/O5r5L1ovmueBhPDv7isqsLBRG7GSwayj1U7G7x7C2jGbg=
X-Google-Smtp-Source: AGHT+IEXroy9c9pG6Ok2Lw1EWFli5Ioo0Vjplntbo9wbjLdEIs0OWoeOfoRcX2MaSHiH8TCvuS+kSA==
X-Received: by 2002:a05:6512:1192:b0:545:4f1:5bc6 with SMTP id
 2adb3069b0e04-54504f15dafmr1309852e87.16.1739077707960; 
 Sat, 08 Feb 2025 21:08:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544ffbc5827sm490054e87.227.2025.02.08.21.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:08:26 -0800 (PST)
Date: Sun, 9 Feb 2025 07:08:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_update_legacy_modeset_state()
Message-ID: <zrw62skvprwygmcde7d3sdjpwzgm72jjvr7njkyidtnwosviop@p63cqie2hdj3>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-14-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-14-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:42PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_update_legacy_modeset_state() updates all the legacy
> modeset pointers a connector, encoder or CRTC might have with the ones
> being setup by a given commit. It takes the drm_atomic_state being
> committed as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
