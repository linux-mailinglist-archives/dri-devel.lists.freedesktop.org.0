Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E40A88508
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 16:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCF010E092;
	Mon, 14 Apr 2025 14:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Wxt3N45E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34E910E092
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 14:32:47 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-22928d629faso42709385ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1744641163; x=1745245963;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hEwbITKXTRWO3igClAwf6QVpWecwQU37EfC9bLpZ+hI=;
 b=Wxt3N45EbywEwHKi/dEW7PGnM5iYuNQMoxO3MchufekJ+r4qs0GuyLNFKW8wbCWPlJ
 0YQ4dtHqElehiEY/WZD/J8ZhQhNd67ROXt8jeMJTnbq4XvxjkE06sdnksPaLDs3N6hcT
 algI5XXACmogdg1wZ5FxD2qTf3Vt9viZhsi8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744641163; x=1745245963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hEwbITKXTRWO3igClAwf6QVpWecwQU37EfC9bLpZ+hI=;
 b=MZC6pR8jmALEcNDRXJ7pAAu99BNY4JMoR8PnWTJhzv/jtQPo44KgpDiWEPgYvaNG9k
 v72h7ttlyOiouSgNxryGZzF/jPiO72u3sHkyR1+ODoId2Upe5bkh09GizznWmNtwfiZw
 sA+u04s2aCr+ZOwvYMC2VlW7b5SKXUSCEfJczwbf0QIdJ+baix8fIMSy3UMXBbLzOoje
 UHAaoAhj1RNuUhyPcekobdvxmGQkFPJR8RhsnV26vsdg9IKwyRf9Pgx2is4Sgw1kcWzh
 CY+FJxzbV1ha1eDJz5S18ulS0F/wJxpK3bpcgTLNRO7EQ2HiaAQqHQ5HJcxaAs9goDZ2
 jTpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtrq/ROsrZmH1k917V1CaGUCALV6mw3iPnyOFYYfoCGi+tf5YicBc79DiENix9gKP6LYeY3pMh3oI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+kMjOXrKF8suj/Yvc88gT3Wzvy9uJLKHM/N3/pB/V/MJYqUC9
 1P+voEkP94XShgy6Jkkw6eIBkg4uzXVO47tbb1RiLgOhy+fiSti8B0xoZf4du2Xm6ps+YAxzUW0
 =
X-Gm-Gg: ASbGncvg/6nisAFV2kItVd+dYECBVOqcglehwpNMw+4WBFcvv8zDjsiH93tt9W4zJB5
 bL8lpzYfWC7mQARYEoOk8lYWyICo3nKHQtlPc1kk2Ag+PxhTQiRN4ci2vcU/zsf+dlXMnBIO5jF
 mjUczlzrPjRt+WFevYodZ5sNUFtwkzE9Hlj4QucGX+Dmu3OXC08p/L4dl7+OzVvHrCSQfXmTFkN
 T/rUQ6uZTrpVnK/m24n1++Wxs4suPlB8fXmII/4wGw3kG0NW/RdabgcObZB46NVZkFmMRjILDm+
 4VfEFN6ZFnNLZrBQ9VE4kKFvlzwnWEF9oqGBTkRQnAIJ/Xlli8dtJ1m9sYYAssx0z1O7CA0iXpC
 GMp8p
X-Google-Smtp-Source: AGHT+IFLR/tDjj0QUyPeUZM5EjkmL6N/CvhnvHIgvtBESC6wWcXSDHN6Z0BC00+YKgb13l71QNHwNA==
X-Received: by 2002:a17:902:d4ca:b0:221:7e36:b13e with SMTP id
 d9443c01a7336-22bea4aaba3mr188388395ad.12.1744641162752; 
 Mon, 14 Apr 2025 07:32:42 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com.
 [209.85.216.47]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd21c2102sm6634327b3a.46.2025.04.14.07.32.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 07:32:40 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2ff64550991so3585504a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:32:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWFwWVP/vJbtatvtHHlg1XpoOvj2PpVY97d7IX+cX0cMRSYIC9OtrMVAbZf971iurI1dYROY5cd9ak=@lists.freedesktop.org
X-Received: by 2002:a17:90b:538f:b0:2fe:d766:ad8e with SMTP id
 98e67ed59e1d1-30823624780mr18884993a91.4.1744641159979; Mon, 14 Apr 2025
 07:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250413035959.255842-1-tejasvipin76@gmail.com>
In-Reply-To: <20250413035959.255842-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Apr 2025 07:32:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V5bfaBA-ZOyG2UCpCwE=5bGP4GFDTW3qQ671raTVnq=Q@mail.gmail.com>
X-Gm-Features: ATxdqUEtNjRWho83CnY45CQBEgIpB6T8M8gcQk2GkqBNaYtQ6vGZNkbRYOrJfPQ
Message-ID: <CAD=FV=V5bfaBA-ZOyG2UCpCwE=5bGP4GFDTW3qQ671raTVnq=Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, asrivats@redhat.com
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

On Sat, Apr 12, 2025 at 9:00=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the boe-bf060y8m-aj0 panel to use multi style functions for
> improved error handling. Additionally the MIPI_DSI_MODE_LPM flag is set
> after the off commands are run in boe_bf060y8m_aj0_off regardless of any
> failures, and regulators are disabled if the boe_bf060y8m_aj0_on call in
> boe_bf060y8m_aj0_prepare fails.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v3:
>     - Disable regulators in boe_bf060y8m_aj0_prepare if
>       boe_bf060y8m_aj0_on fails.
> Changes in v2:
>     - Always set MIPI_DSI_MODE_LPM in boe_bf060y8m_aj0_off
>
> Link to v2: https://lore.kernel.org/all/20250331061838.167781-1-tejasvipi=
n76@gmail.com/
> Link to v1: https://lore.kernel.org/all/20250330151304.128417-1-tejasvipi=
n76@gmail.com/
> ---
>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 114 +++++++-----------
>  1 file changed, 44 insertions(+), 70 deletions(-)

Not worth resending for, but for future reference this probably should
have been marked as "v4". Now there are two versions both marked "v3"
that are not identical.

In any case, looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
