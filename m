Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8359E8B9BC0
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 15:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6314110F97B;
	Thu,  2 May 2024 13:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fm6Hl7WW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE6D10F0BC
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 13:42:02 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-de5e74939fdso4260228276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714657321; x=1715262121; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iSQ9jjwtyIhReugDAg/DErQbocu2WPTjK2mXdU1pXf0=;
 b=fm6Hl7WW6nY+g5XAKxanyRl+OkQU/VCfkUHmbWnCDg0uXiqOZvLkFU5uZdhGnB5Fvh
 vX6qn9UZnB+DZY337xrez2DmLFW0Wax+hLrv75TdOXF685PfWZy/qIkqB65FQ6GcSjeA
 cW4fwkOd0h0txtOfIHGKe0mm4WJBEdNVvTVMPqbkvKR/ba8jyJrhy9+uqcCcd8s6FSxb
 3AwVCa6EXJOxk0hfxbKmc0u19O6tZsDsT1RRagPtaPPZ3TJt7UskaoL6OjtOPCVWVLKq
 pKrwn7wdXlrIe7ft2DEnHssJ3Jj1rxQeQYg7lPdA2i+Y6vdfPLUDELVmGs8zIHc5rA+V
 ckAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714657321; x=1715262121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iSQ9jjwtyIhReugDAg/DErQbocu2WPTjK2mXdU1pXf0=;
 b=wTBcF7ZzaMyiJSbNcgGzfsIMQxl84TlByYdgyGdg8eiKRswp60n4b5NIqOJpSZoWoi
 QwS1+mnxwsD+ksfZ2W85ExcvF/E01+APgLkcS4OVzoieiqynCcuOa/FSnB32VfNxgwMW
 rzmFED4oH9P+6ar/3W9XeReg+QaUIf1sAg9J8P1277sVpvnJRdcR2VnOjsK36TDQ955o
 WkQg0NFyf4hma5nYo14fqs8MBYvhgoq0c/y1QiglWxIxO7Pw6/pwyzCouFkUcdQG3o1+
 Nel43rHFtDbiCRDiVQL95H0aiOx4iZn3pT/wlj9cZtYWB912i7YpCV+0OSZCZzKjIKPn
 wKNg==
X-Gm-Message-State: AOJu0Yw5U4chhTRwS3hhY4Fpfhk+C9HDHYIRD6Y7pANzurXlxN6bWsvz
 DguRntoyJl69ksqIdzrVTegtMXprRLVBkCmrFn+CECh0QAkkVxe7M2S+cHWDBvDX3m6FhQmhhml
 BoaIXa6DV0qflSBFfVUPJAGPdVyJDabywzcUo7Q==
X-Google-Smtp-Source: AGHT+IFnyaNOlkzEnYx4fySQeWTRVZOBY9XK6ANMyQKfRl+c5CgqI/KpfwGJX+7xZ2lVwZT21nYQ5vgQh0qY2R92CeE=
X-Received: by 2002:a25:dc09:0:b0:de6:12ce:abce with SMTP id
 y9-20020a25dc09000000b00de612ceabcemr5746180ybe.43.1714657320644; Thu, 02 May
 2024 06:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.7.Ib5030ab5cd41b4e08b1958bd7e51571725723008@changeid>
In-Reply-To: <20240501084109.v3.7.Ib5030ab5cd41b4e08b1958bd7e51571725723008@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 May 2024 15:41:49 +0200
Message-ID: <CACRpkdYiND3uLAbFqyGEYgi5+ycOTYoncmSYGTsYtTZ7Ox=4DQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] drm/panel: boe-tv101wum-nl6: Don't use a table for
 initting panels
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, 
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Joel Selvaraj <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
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

On Wed, May 1, 2024 at 5:43=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:

> Consensus on the mailing lists is that panels shouldn't use a table of
> init commands but should instead use init functions. With the recently
> introduced mipi_dsi_dcs_write_seq_multi() this is not only clean/easy
> but also saves space. Measuring before/after this change:
>
> $ scripts/bloat-o-meter \
>   .../before/panel-boe-tv101wum-nl6.ko \
>   .../after/panel-boe-tv101wum-nl6.ko
> add/remove: 14/8 grow/shrink: 0/1 up/down: 27062/-31433 (-4371)
> Function                                     old     new   delta
> inx_hj110iz_init                               -    7040   +7040
> boe_tv110c9m_init                              -    6440   +6440
> boe_init                                       -    5916   +5916
> starry_qfh032011_53g_init                      -    1944   +1944
> starry_himax83102_j02_init                     -    1228   +1228
> inx_hj110iz_init.d                             -    1040   +1040
> boe_tv110c9m_init.d                            -     982    +982
> auo_b101uan08_3_init                           -     944    +944
> boe_init.d                                     -     580    +580
> starry_himax83102_j02_init.d                   -     512    +512
> starry_qfh032011_53g_init.d                    -     180    +180
> auo_kd101n80_45na_init                         -     172    +172
> auo_b101uan08_3_init.d                         -      82     +82
> auo_kd101n80_45na_init.d                       -       2      +2
> auo_kd101n80_45na_init_cmd                   144       -    -144
> boe_panel_prepare                            592     440    -152
> auo_b101uan08_3_init_cmd                    1056       -   -1056
> starry_himax83102_j02_init_cmd              1392       -   -1392
> starry_qfh032011_53g_init_cmd               2256       -   -2256
> .compoundliteral                            3393       -   -3393
> boe_init_cmd                                7008       -   -7008
> boe_tv110c9m_init_cmd                       7656       -   -7656
> inx_hj110iz_init_cmd                        8376       -   -8376
> Total: Before=3D37297, After=3D32926, chg -11.72%
>
> Let's do the conversion.
>
> Since we're touching all the tables, let's also convert hex numbers to
> lower case as per kernel conventions.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Wow that's a *VERY* nice patch.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

The metrics surprisingly reports more compact object code,
I wasn't expecting this, but it's nice.

Yours,
Linus Walleij
