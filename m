Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96276D8207
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 17:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84E410E9FA;
	Wed,  5 Apr 2023 15:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A039910E9FA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 15:35:39 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id r19so7728548ilj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 08:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680708937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKnTFDSh5KLl3KY8dpcpi2E0lqVs3mKwEEZacKEMPkc=;
 b=YvUfLYjXQBINemiSc08O3T8yOMl9wLbp33njBiQk/KsFCL2rvZWEqsSdtVsDUmRBLj
 lDD9voXgxKhpjl8XwTUZZsr7V/1QlYYnxn/GGaBuT5vHMBmqXH/HwT8tC6/fz7qaSS9i
 f6cD0pmLz9h6Y08QuLzlRS9ZmK6U41c7S3Vvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680708937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PKnTFDSh5KLl3KY8dpcpi2E0lqVs3mKwEEZacKEMPkc=;
 b=WPl7s6bw3uy/ICUKJBTwnni7yAKQIbd2VUkVyqjYq6ivuPdNaTIOxApT1H0ZuByh5P
 X1JtRI7sND61Qlvi2fcpjm2Z8n6hcj38WiX4EmvppNQHVobZWjacPoeN46QqRJZNVuVp
 1fmYFfji93y638OUwENdcSYb6pC6lWSSxFtVpXu4lJaqH/TB/fD00bUepzse4GslUZT1
 ubhH53HPyWZ1iou+LiLtAIwp4cOvxEBlO9EG0AQiG+0QxO2xD9GQqfIbvgL8cS/iL83X
 5uWhbyjLhKmk7hwJ7T931ihjf49QD386XKejApya0Vec21IcjH6Y662Joi1XfpPZuP46
 NsKg==
X-Gm-Message-State: AAQBX9cwqPi3kmgaYIN+xxAys5JWXv7Ga5RhlfZaMaoJpVo60LYLlwRB
 Q8Gkl4HiLmeFPfJZZbRXsZnc3nlGFCImflH5MpA=
X-Google-Smtp-Source: AKy350Z0V13eTHpgrDyt3tofNNYHZG9DaDXA4JdafkEQ9GulCY+kUsdJ0tcDrhbjlu1KQjz2QX1NJA==
X-Received: by 2002:a92:d48f:0:b0:315:375c:dc5a with SMTP id
 p15-20020a92d48f000000b00315375cdc5amr4860128ilg.20.1680708937188; 
 Wed, 05 Apr 2023 08:35:37 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181]) by smtp.gmail.com with ESMTPSA id
 y14-20020a056e02118e00b003232362a4c2sm3960165ili.8.2023.04.05.08.35.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 08:35:36 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id j6so18964797ilr.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 08:35:36 -0700 (PDT)
X-Received: by 2002:a05:6e02:12e2:b0:326:bcc3:f394 with SMTP id
 l2-20020a056e0212e200b00326bcc3f394mr3443369iln.1.1680708935677; Wed, 05 Apr
 2023 08:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230405135127.769665-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230405135127.769665-1-alexander.stein@ew.tq-group.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Apr 2023 08:35:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VG+H5YYbkVs5fBvUOEYfhaofGCnJ-p2bTcZsGNmWv=PQ@mail.gmail.com>
Message-ID: <CAD=FV=VG+H5YYbkVs5fBvUOEYfhaofGCnJ-p2bTcZsGNmWv=PQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/bridge: ti-sn65dsi86: Allow GPIO operations to
 sleep
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Apr 5, 2023 at 6:51=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> There is no need to require non-sleeping GPIO access. Silence the
> WARN_ON() if GPIO is using e.g. I2C expanders.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> This is the TI SN65DSI86 equivalent to 805245071240 ("drm/bridge:
> ti-sn65dsi83: Allow GPIO operations to sleep")
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Trivial / straightforward change. Sending it to drm-misc-next.

77d08a2de6a4 drm/bridge: ti-sn65dsi86: Allow GPIO operations to sleep
