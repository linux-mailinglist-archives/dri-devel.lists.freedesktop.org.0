Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C71D8BA43F
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 01:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0021120D1;
	Thu,  2 May 2024 23:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="R4zQGqWE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E7B1120D1
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 23:55:40 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6ee2fb4ec57so2938347a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 16:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714694139; x=1715298939;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+MHWuPJaqDhO89L9XgtzGeKdwZ07KcerlIPh46wVx1U=;
 b=R4zQGqWEvMq87FRvPgPW09TH6ELsQoI5yNEA96HKdaD4laW+YvFP04b5U9J1mPjpaQ
 /8wJpSti69qluAHhtK0TxovBe6M8a+yr0ObpaAH8GwjdBt2xnWcQW4jw7/frnaZtT31c
 1JXl4TwKIz4X1kkBNa8b7NBUzgm+8qpGdCxzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714694139; x=1715298939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MHWuPJaqDhO89L9XgtzGeKdwZ07KcerlIPh46wVx1U=;
 b=w9Ja9z+6Auk86EVEqRtMEar0Sxlkq1Rjy2AIEgVS09gN8boQ9geJ1b7Y7MTIOUdzj/
 /AvshCVYhlt3a9Z42j9G42S+xS+NMwxTGR3/v4PBjJtl5cglXsc5qcyjSNuL26v/M5yN
 6xRQlTTA9tkSFUWWmbfhPqqfZdRd+EPH7XvFWWas8BSgJEPSW+tY7LSJCSQMiYAxrBe7
 XLrgK6+kXK64EDZTEboJG/p9V4Bg8iHkQxGLjppBCcW9BlIsn6zoWiWMQgrgTl645DgY
 X2F3bYs07V9XJpy5TlzbqeV0Xu0+QtmcxW8N9N0FWCoB+w6fGM7ZnXmj3A3xqtHbRd2V
 CN8g==
X-Gm-Message-State: AOJu0Yyf/w38feyFjhoW4r6uHGm7tGf9unfgxbVg4G/gyBnCeOuPjss2
 cLDtr5SZKWIsCFOctYu6zxmjdRAv5xB1iH6Q1JvH9K8Ll+oKOyLU3qKVMoL1kft+gGI4Jy2IX7f
 YZtPTqNCFXtQocBLq5d0SqyiW9diCSyjgXuHd
X-Google-Smtp-Source: AGHT+IGyCxHV28Dg21fvPd5sjHZ7KhAUqE2uO+gL3ofkHFj9jXN9KaEpVVpZug4C3MFxRV+i3b5mcbdpzvWf2Io+5NM=
X-Received: by 2002:a9d:6e89:0:b0:6ee:2d1e:f4f with SMTP id
 a9-20020a9d6e89000000b006ee2d1e0f4fmr1511449otr.9.1714694139352; Thu, 02 May
 2024 16:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240502164746.1.Ia32fc630e5ba41b3fdd3666d9e343568e03c4f3a@changeid>
In-Reply-To: <20240502164746.1.Ia32fc630e5ba41b3fdd3666d9e343568e03c4f3a@changeid>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 2 May 2024 16:55:13 -0700
Message-ID: <CAJMQK-h24xoO6jsYu4NK8ENoA6nsidcF8aN2pCzNMPgmu1NxEw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add ID for KD KD116N09-30NH-A016
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Thu, May 2, 2024 at 4:48=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> As evidenced by in-field reports, this panel shipped on pompom but we
> never added the ID and thus we're stuck w/ conservative timings. The
> panel was part of early patches but somehow got left off in the
> end. :( Add it in now.
>
> For future reference, EDID from this panel is:
>         00ffffffffffff002c82121200000000
>         321e0104951a0e780ae511965e55932c
>         19505400000001010101010101010101
>         010101010101a41f5686500084302820
>         55000090100000180000000000000000
>         00000000000000000000000000000000
>         000000000000000000000000000000fe
>         004b443131364e3039333041313600f6
>
> We use the ASCII string from decoding the EDID ("KD116N0930A16") as
> the panel name.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 6db277efcbb7..9cfa05c7d193 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2094,6 +2094,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv=
_a010.delay, "116N21-30NV-A010"),
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1118, &delay_200_500_e50, "KD116=
N29-30NK-A005"),
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "1=
16N29-30NK-C007"),
> +       EDP_PANEL_ENTRY('K', 'D', 'B', 0x1212, &delay_200_500_e50, "KD116=
N0930A16"),
>
>         EDP_PANEL_ENTRY('K', 'D', 'C', 0x044f, &delay_200_500_e50, "KD116=
N9-30NH-F3"),
>         EDP_PANEL_ENTRY('K', 'D', 'C', 0x05f1, &delay_200_500_e80_d50, "K=
D116N5-30NV-G7"),
> --
> 2.45.0.rc1.225.g2a3ae87e7f-goog
>
