Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D810874442
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 00:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0921113284;
	Wed,  6 Mar 2024 23:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HyoGqJhu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9162210FC17
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 23:36:51 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7c883b95249so5620639f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 15:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709768210; x=1710373010;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8uphQrob++9Iti6sZOTD0y0JTDAZhZm8PP0VwpFINJk=;
 b=HyoGqJhuLw1jf9TyW3cczRhQPk0MvVmudLUuJ4UDjgMfqHR62jsKnJyUr2OumJ2YXg
 Nhymu96ETn4xGkMdSRKigahrLwVoCzPlxVCve19lYlrViknd83WeWc753lDX8W04hGZ3
 lqXseOLDlI4PJ6xpQPpd0H2Pnq1SOiJuTqNT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709768210; x=1710373010;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8uphQrob++9Iti6sZOTD0y0JTDAZhZm8PP0VwpFINJk=;
 b=HV2t+4MwN/YjEBqt07bb5SfMzX9hXa0GQMn2PMNI011JQJaKEaNGmpQK04R7JMO/ci
 3D7iz77p4PGeB0PbHX+uDhLmOpvdSDGgcptRUyv9E7EwkykrE5SmJ8myiWkInGzogI/Y
 s5SgqPoZxaNcGzlAgNCZbWkdWDhOFdyGLJ+YgoQgKXh61x1JHOm/upPDgSTSaGKA9WHJ
 XcorttW9QI6E4XEcIyPP73W+STM13UTfrl+i1M7vr1v/GxQcKBMex2y5mDwj5UoMrjc4
 V+CJjEJAbWEY3csuE9iGslStgvC1je7BsnGVyZ9/E5yDMUeMRywIo43XiqDVjJtkMJHz
 E4mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrxkpc9AiI/mq+91tpXIsf0GK9eoYx87dz+jVbLyC/88+dCqa2iKb/55O5B2LVH4oFaLfuIiGyS5EH/OgqhdQbRfQOkFu4nn6OPGnKYGyT
X-Gm-Message-State: AOJu0YzmpxEl/ai60loBpw16capvHgK62n+u2s66gNl4EP8CvfHDLguT
 clziOW2bCrzG/QD/YDT7UjF1g1GCVL12rWYT047Van9aJAXxMAPXCtwHhbJWuCv5e9hAiBb4Te4
 =
X-Google-Smtp-Source: AGHT+IE9Lt3hiYxZI4u0e0FNlGxYjGtEqWTJy/RnhiPadGUE1MVytN6okyJqlIY1z3A5H5CDOA/lnw==
X-Received: by 2002:a6b:c94f:0:b0:7c8:45d4:6313 with SMTP id
 z76-20020a6bc94f000000b007c845d46313mr11056621iof.10.1709768209914; 
 Wed, 06 Mar 2024 15:36:49 -0800 (PST)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173]) by smtp.gmail.com with ESMTPSA id
 y93-20020a029566000000b00474baab3deasm3719111jah.30.2024.03.06.15.36.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 15:36:49 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3653aaeb380so15255ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 15:36:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW7MwE9g+ZeXAZ8zNqXCD9aD3ZOWgq6lgTtD0dojpAaWgEdCCfQCUBO5Vp9EWKFhHelq6UIGrI4rHy/9SJnZG28QUZJCDMfLyPWrFsTsRE+
X-Received: by 2002:a05:622a:590:b0:42e:e077:3ee1 with SMTP id
 c16-20020a05622a059000b0042ee0773ee1mr104034qtb.3.1709767809742; Wed, 06 Mar
 2024 15:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-5-hsinyi@chromium.org>
In-Reply-To: <20240306200353.1436198-5-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Mar 2024 15:29:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X66sW-zcnZbv1ecnZ733AKJh1LbjGNVWLjggT_x1sxGw@mail.gmail.com>
Message-ID: <CAD=FV=X66sW-zcnZbv1ecnZ733AKJh1LbjGNVWLjggT_x1sxGw@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] drm/edid: Match edid quirks with identity
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Currently edid quirks are matched by panel id only.
>
> Modify it to match with identity so it's easier to be extended
> for more complex matching if required.
>
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> ---
> v5: no change
> ---
>  drivers/gpu/drm/drm_edid.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
