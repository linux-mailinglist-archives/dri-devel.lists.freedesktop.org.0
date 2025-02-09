Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D394A2DA5E
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 03:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF5F10E1FD;
	Sun,  9 Feb 2025 02:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UsQDvihM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FB810E1FD
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 02:13:01 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54504f29000so880706e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 18:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739067179; x=1739671979; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AalceiQZrK1g37TK/NrL9Qv/T7IdCcj8oK+SI0is+p4=;
 b=UsQDvihMlFKoJLE0QsC+7TMMPzvJchREQbT3DIlAOrkn9UDPUVkcF5WJ19Gs5sF1V0
 me1oALGZQc060RnVAHyF+SzovtTIgZPyooLqkcbPeutJ8538A5+mRy4R+TDRhzqjl+ST
 dFhCwDWffrMtAi+16oMme9AZIo6AjNWAMICWQ7zl95owBSluRa294lJMA/BdDob52dky
 mYDrED8bUuk5HNpaLNBni8FSJ+u2vZGJT2x/XVS7P4CcSnXWvHkBQ563gYwePrz0Y4vT
 qS6zga4gIbAmWOku7EW+mk8P8qhIe5oxP3XS4PFMOG3iCuoxm+hu3Zy/qpBW2y2vWZor
 bxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739067179; x=1739671979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AalceiQZrK1g37TK/NrL9Qv/T7IdCcj8oK+SI0is+p4=;
 b=H7ekBTbFCqFtryGabz/9s6Orh4A0AVnkmRVI/sBobMMHgGnia2oX7Wy8fECW3jaVcT
 T8xSTmRaMNIFOfELREKTgrDo++FgzkkZg0Nmt0z1fj4Pcq0aIw+UIenrf8HSn43dKVq6
 TKzg66z6C2PK4V1HbSECkLlM23qGnPzop/z4ccZk34inYNraOK08kvjRENWiNrSX0uB1
 VDcJVmCK3OpHRL1tjJ9E2wtXlB+S47PtKRx5sNX1d5R3+i/zLp7AepYEnCECwLEt+fOP
 BwrF/ZA4IJ3jpqVZ+dRfrqhSvZCGRqh8HdEVULPWBPAJleQ3np06v2PK49HAuaxuqaVV
 JD2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxSPGXwtVYkNJm0+5rS5ccMBAbrCrDsfzcipxguL+8egxfjhJOz79wo536i3UrbiguAP6E1dM01Is=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTLQz+8502hgHqSRZHtLdJZvoM5n2qFf659EWAxIjgrj3LLwPZ
 E7C29istLrnmDWT5bZ9nMv1WzFVIPHtYTJNiUx9KD1oOWIGEz5W4yNchXJoEk5Y=
X-Gm-Gg: ASbGncvezTIY8SBX7RYYmddBZ9fZto7xDjd6dTVriSf+IcrCsLzkNV3sV72e3clsxKK
 QtRwxIc5xaowTFKVLVjSo+NNrudxtXgxEpPxSUnv1LuBvZJv3Iy8tN1kaulo5GgkAMwYxlVVd37
 5qpHxaYKvhF4CL2MZ2I8TFunwoiyFbAJfj8+cMecjA/M4DVNzz4vp0+xg2yEg45F9FYKm6FDldM
 R87/MjvqfIMxYlpiEcNQwplAJ46AIz9ZGj8oFcnHMSQPipIhMCmdc8VL+fkJKbqtKaWITkEquRX
 Z+pCRvvJiDjLV13G9gOI7NpqJNTgcQH//w3oplNR5Wpt6h1Ywb0Wqf9MyeN/WAn9fkhw50U=
X-Google-Smtp-Source: AGHT+IGIzcCA0nFOVu73TILu83WflT1xWvuP7Qdk13bmuvhLtO8irRyNlKPlWULFpKUgZsCsaNjclA==
X-Received: by 2002:a05:6512:159b:b0:541:3587:9d45 with SMTP id
 2adb3069b0e04-54414a96460mr2763506e87.4.1739067179437; 
 Sat, 08 Feb 2025 18:12:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506abb5fasm234745e87.25.2025.02.08.18.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 18:12:58 -0800 (PST)
Date: Sun, 9 Feb 2025 04:12:55 +0200
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
Subject: Re: [PATCH v2 11/35] drm/atomic-helper: Change parameter name of
 disable_outputs()
Message-ID: <qmy6xmdl34u7ejdenri4foz5ksfypp52uvckkqgqsuczw3mvd6@ivdzm55hehqp>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-11-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-11-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:39PM +0100, Maxime Ripard wrote:
> disable_outputs() disables all connectors and CRTCs affected by a
> commit. It takes the drm_atomic_state being committed as a parameter.
> 
> However, that parameter name is called as old_state, which is pretty
> confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
