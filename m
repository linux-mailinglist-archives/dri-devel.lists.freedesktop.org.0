Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3B7A363C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A008F10ED18;
	Fri, 14 Feb 2025 17:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HqmkB6gv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0A110ED18
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:01:01 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso2406196e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739552457; x=1740157257;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eGqfS78pmJ/bj5BPsCQeo9hU2Hyn6ObIUQO0AmB2+Co=;
 b=HqmkB6gvKkwk48+Z60/u5VZ4H7SaOk+uN/tl9PTJT3VomlrEk/n8PBPrX5EpfSt37l
 mo2n4gy66ipk0V5eAIlHQewKxuzd6OQI4WOOB0WzOw1GYDdIHv6MlufE47ZxqZb81wBO
 lCqjqv+N3FJfl9F0oeWw4kUUQmlWB5E70xnQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739552457; x=1740157257;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eGqfS78pmJ/bj5BPsCQeo9hU2Hyn6ObIUQO0AmB2+Co=;
 b=QUnOBvv5rSpaGj3DcTIQEuF3OBNVGAPOTKBp9ybOgK8kbJujU9blFQ/N5P/romy6Yk
 rb2fIEap5Fbu6cxDNYxRb4wBSMq7DrOhFseZK5l1dET9riG1MMQUbcmuya45TPijqjpb
 OZFGEfopc8knmg/+G4BUAIS+M4CmWeA/G2K8xgcklnpoKsTKZDfZ9pKFI2XV9WUM69WF
 SA2oFnzkApF+FF17AD4yUEiVdUEu4APogxI1Q93OtPzU08HZTsVG5zsU5e0VzNNhEg8q
 MECVqMHflAKcCE0m4k5t6atOsB3dWmv3z8HUyGgmbO8mj7WEXBPrnDW/MUFaZAI1XFO3
 d2gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFEz9R0BIpLy+7Zo2okptF43j2gYeNANmXZq9SZsh0mjIOsxvi92tc/ucMpCUZHEuXJ0apntZrJKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsZXbUzsJ8rh8L9q7zfxlMba4rczh+jrVnWS9Mp0rwazc853Pw
 qrDbThTKQiJ9jg6fL/mZcBzFx4S68w16tBdd/wCYxSuTmP/RlrXKcNEEWUSV6aLGuQ7fopkRkXx
 rHniW
X-Gm-Gg: ASbGncuA2Ra+oSMGgWMFa291EeFcbFaAbTPqW4oTamluMUzzeYoVPAnKKXenohAosys
 ziyzQ3BsB/RrIpMQmdteV/9vYSzo7JqMIXkRuxRIbGolGJfn/NjYuP1aluktmV3V9YF4ojW7uGO
 pcRn2pUt1vP3zL10PSArn25JPn21EaR//GEe/7WyaDJZ6I3QWIDSjqiFfgA1t5gCWZlKQZRPnJM
 3UkN6Af7VNSfOPZ0PFyPRKLSWBRbaF3Tbi0ZP8iyWBuA3UA2kjHL5i2Ks4kuVAn6vJCmVWagBBr
 PldjZDLRM+cqI6OuuLMl7l9aXP7EWYfZh3qdzrQnckP9FUZsad/oPiGC+B4=
X-Google-Smtp-Source: AGHT+IGwQ0g8FhqleV0mDDT1J+zX/EpJxBmBrBpaMC4U/C8zkYeoDN7K4rvxsfGI7brd25uJHZxF6A==
X-Received: by 2002:a05:6512:1189:b0:545:3dd:aa5f with SMTP id
 2adb3069b0e04-5452fe92491mr10363e87.36.1739552456529; 
 Fri, 14 Feb 2025 09:00:56 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f120dd9sm575039e87.259.2025.02.14.09.00.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 09:00:54 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30615661f98so23918601fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:00:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU69/gf8Vzj02k/enbefEIFnYsNL9ynQw6/U4id0vgdy4xldF0+SDW1YuThtdGAph9UdlffiEW1e+Q=@lists.freedesktop.org
X-Received: by 2002:a2e:b2d0:0:b0:308:efdd:b184 with SMTP id
 38308e7fff4ca-30927a6fa08mr801931fa.10.1739552444566; Fri, 14 Feb 2025
 09:00:44 -0800 (PST)
MIME-Version: 1.0
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-5-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-5-e71598f49c8f@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 09:00:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U30w51nXWzmqMjimKXEXN1iGCGy+FgvPQJio8nUJwsSw@mail.gmail.com>
X-Gm-Features: AWEUYZmgW7gsdTTn4UdK692jYlJBK_pdnm3uhZfmTNqc94knOyyM8gyi7aEc-f4
Message-ID: <CAD=FV=U30w51nXWzmqMjimKXEXN1iGCGy+FgvPQJio8nUJwsSw@mail.gmail.com>
Subject: Re: [PATCH v3 05/37] drm/bridge: Pass full state to
 atomic_post_disable
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Thu, Feb 13, 2025 at 6:44=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> It's pretty inconvenient to access the full atomic state from
> drm_bridges, so let's change the atomic_post_disable hook prototype to
> pass it directly.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

From the point of view of ti-sn65dsi86 and parade-ps8640:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
