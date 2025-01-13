Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB9A0BDAF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 17:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799FA10E71B;
	Mon, 13 Jan 2025 16:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nqzEsTUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A14410E71B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 16:37:46 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3061513d3a6so16713561fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736786203; x=1737391003;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7RBWERBbv5vebKCnvLcc5fPq1Xt6pOwPPdqpzEvl7R4=;
 b=nqzEsTUH0yRIyan9Y9NPWDaebQJwbXDdORIgQt+Zn03JuhzyiveklrEfZb8D7cLQ1G
 MDwJ6VmJfzmLXZulHQGVWV0jTytHCv9H3bSzNswsITYe5t6WxJJoIFDSltCnP4y1PfGL
 R/LJayMHadUNJvglhrszi5OYZvDHd02aFy4Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736786203; x=1737391003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7RBWERBbv5vebKCnvLcc5fPq1Xt6pOwPPdqpzEvl7R4=;
 b=HZs2PQgLMhJRVT05z4FaI6YZ7KnnUet00rSAW2G8ad1K9ufNoKzUlhoGuU2yIBYv5Q
 Cta60UhgDVfuXVDIvaPedgW0cSJldNK34jilLD7xV76ZKlpnl+tpTHRPot766iTlCzfb
 IdW6VjEWXhJST4afLVt1sy6CbIxxTC9uwr9gATvbiwAan9j0e33gR43SjUI8HSRAmUVZ
 C74/9uVx9dFflXw6YYCBH8GqWe9P0TjVn29EotSuX9PW06ENhB8mTCwQLxdGxz2KR0Fi
 Y9+o2+I6qhJxzIrJkYchrUBRi6OEt7tEBiRMCJv4IjpJ+HdzFmMQFwk8cqw87AcPBcUO
 usvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI2sSvs46umxdy8je1YDAYE8h5Qvehnts8LLW+j/4eQP45PSqfOCSufPZJ1n6g0ighdsEBhv3fAN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywcwuB0RlpjBmDDGsQiBZNiOgBhuWSKAjjkMn5pxs6TcwcyjMz
 Zp53Owb+pDDZ0Dm7bGzLplZTAxlnee5SIBF9CwqHh5YAD6Et1lEY8AyyNJAwfjR3MeaAQfICUtd
 0BQ==
X-Gm-Gg: ASbGnctlXNsxSh5DXUjd5fn1m7tmCMlLBRJaPoBbsxCDuNB2lCt5c79J9lLaLWbbVqy
 NtYUZtiFQNPUtv/I0G81pNKKigUuCk1TTxBP/h4hz396aE06A/SnWAJMxE8SdSU1KIs3I84zKTQ
 51wgHi6Q5Od8c3QTotKBUvIhetKYS8jyI0EZQt+A5OjEYXB9501wn5DbBCY2k+KchvuqDBsB2hX
 TFd2FZnpscm+HxOBr/Q5sP3fzSb8HmfzTBWMioCaCPG8nTviFMfSp7agDUuJMQK46cOKQdGyZRe
 KrxN4XYJRXm0Uw3Z0CGj
X-Google-Smtp-Source: AGHT+IH7bp+XxMwVSVDCzZ320BwiZfIKahijIvjYMOAw+alzKODLSsineheAxAh7kIXj8ArsIczSdA==
X-Received: by 2002:a2e:a781:0:b0:302:1d24:8db7 with SMTP id
 38308e7fff4ca-305f4563959mr70789301fa.19.1736786203158; 
 Mon, 13 Jan 2025 08:36:43 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1ebf45sm15145611fa.97.2025.01.13.08.36.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 08:36:42 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54298ec925bso1978316e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:36:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUqU6Ol6VZaLiZbC09gjoaaNCApOJ6w1/NvwlXOg0jYiEGqttDV5qMcxIi+GQMuxcYgwmqiFA5KMMU=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3c8a:b0:542:28dc:b692 with SMTP id
 2adb3069b0e04-542845b9480mr6248018e87.14.1736786202008; Mon, 13 Jan 2025
 08:36:42 -0800 (PST)
MIME-Version: 1.0
References: <20241225020109.1051449-1-yelangyan@huaqin.corp-partner.google.com>
 <CA++9cvr_xcOoFD5sPkXp6eV55+cTWHMRH8RfBiRQBAEezjhQAQ@mail.gmail.com>
In-Reply-To: <CA++9cvr_xcOoFD5sPkXp6eV55+cTWHMRH8RfBiRQBAEezjhQAQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Jan 2025 08:36:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U_xz29co_DTSnvz-svB_xizwUTxZYLDvF6_zV1iGBzKA@mail.gmail.com>
X-Gm-Features: AbW1kvYB73otgK1Lq4u1vurAHADdCALOYULOPWIeKY0DP2ZL6v6FfAJZqcMbwEo
Message-ID: <CAD=FV=U_xz29co_DTSnvz-svB_xizwUTxZYLDvF6_zV1iGBzKA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add B140UAN04.4 and MNE007QS3-7
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Mon, Jan 13, 2025 at 1:42=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
>
>
> ---------- Forwarded message ---------
> From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> Date: Wed, Dec 25, 2024 at 10:01=E2=80=AFAM
> Subject: [PATCH] drm/panel-edp: Add B140UAN04.4 and MNE007QS3-7
> To: <dianders@chromium.org>, <neil.armstrong@linaro.org>, <quic_jesszhan@=
quicinc.com>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <t=
zimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <dri-devel@lis=
ts.freedesktop.org>, <linux-kernel@vger.kernel.org>
> Cc: <dianders@google.com>, Langyan Ye <yelangyan@huaqin.corp-partner.goog=
le.com>
>
>
> The raw edid for B140UAN04.4 panel is:
>
> 00 ff ff ff ff ff ff 00 06 af b3 a7 00 00 00 00
> 0c 22 01 04 a5 1e 13 78 03 cb 55 91 57 5a 91 29
> 1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 f4 3c 80 b8 70 b0 24 40 10 10
> 3e 00 2d bc 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 42 31 34 30 55 41 4e 30 34 2e 34 20 0a 01 46
>
> 70 20 79 02 00 22 00 14 87 61 02 85 7f 07 b7 00
> 0f 80 0f 00 af 04 23 00 02 00 0d 00 25 01 09 87
> 61 02 87 61 02 28 3c 80 81 00 15 74 1a 00 00 03
> 01 28 3c 00 00 53 50 53 50 3c 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0b 90
>
> The raw edid for MNE007QS3-7 panel is:
>
> 00 ff ff ff ff ff ff 00 0e 77 48 14 00 00 00 00
> 34 20 01 04 a5 1e 13 78 03 2c c5 94 5c 59 95 29
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ea 3d 80 c8 70 b0 2e 40 30 20
> 36 00 2e bd 10 00 00 1a 00 00 00 fd 00 28 3c 4b
> 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> 53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
> 00 4d 4e 45 30 30 37 51 53 33 2d 37 0a 20 00 df
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index f8511fe5fb0d..e9434a0cc37a 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1865,6 +1865,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116X=
AT04.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120X=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140X=
TN07.7"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xa7b3, &delay_200_500_e50, "B140U=
AN04.4"),

This is mis-sorted. 0xa7b3 doesn't come after 0xf390. I'll fix it up
while applying so no need to resend, but this is extra work for me.
Please make sure IDs are sorted next time.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add B140UAN04.4 and MNE007QS3-7
      commit: 0ca6d6058852857c628b479f1e7aad3386036bdb
