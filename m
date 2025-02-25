Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBA7A43295
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 02:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78F110E0EF;
	Tue, 25 Feb 2025 01:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="k+h682+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D08610E0EF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 01:46:50 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5462a2b9dedso6070541e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1740448008; x=1741052808;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5BIxNZpAxXmgtUZVoY5Vf5YilI6JIk11YmgayAzmSTM=;
 b=k+h682+FfiuIITjdEtAvmJVc9c2gpo9MhJKJqocdNuW/4xdl1cTjOliOPI7JFMolgD
 61z1Qa7dcexfIq+XsyrK0+NTcdRrFJ1zz284CvN6xX11S8HvIEABb7qxxBu+jfW5SOoi
 0ktU9HGBwyEd+t8o4XOemwsLJXLJZ9ggMTHk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740448008; x=1741052808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5BIxNZpAxXmgtUZVoY5Vf5YilI6JIk11YmgayAzmSTM=;
 b=Ip9SaIh2fVV0Ow3iC7C6CKGRad12wDp6owOQK9HGudNMia1D0jbwNyY88gT/o4zWVR
 grgqVWe4wMaLaaHRRKOc6AB/t1tiVUgkq1YSnEfpkctfFbEqSOQEPnFjdeq4cvX4Blwz
 wdEq0pD2K0x1bCfTlR6l3aaVOn3Fi6pl29uvG/SEofpRfs7atBIB0Byl3sVIMtgouBSf
 pAMO98KAGd8PC4RBdD5kP3Pst3OOkQ/lOQS9WjX5Kp10HupTu9Zg0d9e6BjbxmPPhXEY
 S03yO1i13LGRuP02JEAxBWLb9XmGhCf3sH6jnCr3YaKXRO97rUGi3Jksr9aMX9zaBwS2
 7fqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkoL9Ha8TUDi2uQLMebqgEXXn9MraSqs3cBVlXcRAJ48dsmGWQjLOTYAmED29cOYgvEZY6Hv2VTWQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpzqFDYFvmo9EUmoTsjFy+ya0A6kYYlkDxdhPFUAS2Qq90NJOz
 8inA/viR8Wy6izXNvwC3GPYAt5qg/cKEkwiOs7W6ZNN8A4yNFQ89GRYaXeZFrNH7IxWK2HsDrfp
 LoQ==
X-Gm-Gg: ASbGncuc6Hd+MQxAXZ2+3mshPwncABaOuSoefEpHyqAYRfKJ6ukzxMjPaIkzkkE6ii8
 QMzuZoxG3ApWj2+SD61gfEhaSIe59WZM9CO1u8zy+Rgw0hytt/KFyUr7w/7Id31IKRT1pNuigkY
 N0IsbnYTk5Uv02aAV7bCg4KmTaTrJyEiaDgi5gMyuPdwmdBWta2FbvIPaJmBeP32YgDT/gr3IeE
 YhL/gvxiqRl3YxbuYtnI8NMsrPAonZW0mCjZVPY/P8jZvGCsVPOzHucP8OyEX/mvq7Ucl2vf8Qb
 OLVqBOiLwqKE62XQhc+mj0JM1M+Ik9a33oALz0JHMiliqQVO3Ie2c2jYAPdibGZ+2t+beg==
X-Google-Smtp-Source: AGHT+IFyGQHsj3a6+aJcDhRlbzTIC7fnuxkVi4VLQurdBhc71YE1vzJb8NRbV7xQKm2vWy41dCiHsA==
X-Received: by 2002:a05:6512:3c99:b0:545:944:aaf4 with SMTP id
 2adb3069b0e04-54839129a67mr6126432e87.11.1740448007669; 
 Mon, 24 Feb 2025 17:46:47 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514ba1absm52176e87.102.2025.02.24.17.46.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 17:46:46 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3078fb1fa28so38985011fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:46:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUm3ioUCKktzdE4J2jdX4msARshFZfpgc2UsNkYjP8zm87dsOTMYkMmTf+6Smn1rKTUtzMn8uSRDnA=@lists.freedesktop.org
X-Received: by 2002:a05:6512:10c6:b0:540:1f7d:8bce with SMTP id
 2adb3069b0e04-54839268617mr4611865e87.38.1740447670508; Mon, 24 Feb 2025
 17:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
 <20250224081325.96724-6-damon.ding@rock-chips.com>
In-Reply-To: <20250224081325.96724-6-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 17:40:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uu+EvZzuFmCvq5qJ=FeBjmLTtfGT4Aq6QBSoH=Sen8PA@mail.gmail.com>
X-Gm-Features: AWEUYZkhmeaAQLOMDj5xS_yarIgfu2NVlCE358kcuOa-b55Ak-RhS879p-uOQpk
Message-ID: <CAD=FV=Uu+EvZzuFmCvq5qJ=FeBjmLTtfGT4Aq6QBSoH=Sen8PA@mail.gmail.com>
Subject: Re: [PATCH v7 05/15] drm/bridge: analogix_dp: Remove CONFIG_PM
 related check in analogix_dp_bind()/analogix_dp_unbind()
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 dmitry.baryshkov@linaro.org, sebastian.reichel@collabora.com, 
 cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com, 
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, Feb 24, 2025 at 12:14=E2=80=AFAM Damon Ding <damon.ding@rock-chips.=
com> wrote:
>
> Remove the check related to CONFIG_PM in order to make the code more
> concise, as the CONFIG_PM should be a required option for many drivers.
>
> In addition, it is preferable to use devm_pm_runtime_enable() instead of
> manually invoking pm_runtime_enable() followed by pm_runtime_disable().
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 30 ++++---------------
>  1 file changed, 6 insertions(+), 24 deletions(-)

If someone really has a reason to run this driver without CONFIG_PM
then happy to hear about it. Until then, I'd say this is fine and
matches what most drivers assume.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
