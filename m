Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA090756F0E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 23:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD0110E01F;
	Mon, 17 Jul 2023 21:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABF510E01F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 21:40:29 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51ff0e3d8c1so6691119a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 14:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689630025; x=1692222025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYk2j/SRza18eE5VYpPrRQIWdMxdJwDfSSkNCndN4e8=;
 b=Sq+k1Btci9oHaEBVvPwPPPY0+mIl6Sv3FIAU/QWlqBb34XP8S0lw4qbbzHGM6Gdtsq
 g1fvh1LveanU6xxGj1kn4M1CPa8YZ9cTVkY7YB28pwc/jJKj53NIxOAX6/TA+G+cnzmm
 SG4oS9WCOpB7qzGuJ5GCKihkpVYwokuYcl84o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689630025; x=1692222025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WYk2j/SRza18eE5VYpPrRQIWdMxdJwDfSSkNCndN4e8=;
 b=TuDRiCwRNbMMHY0E3b7jUc/NtD7axsdT8w/PrIFMOM36FBDTD6RvalSZ9LIpR8ngvK
 yMgIFpJt6C66D9f6nf7tmvci7tRwpqP9og/a8ge3CitNvco1lhBXBlZtzojKuZLzYnHt
 nHpT0eA3Mn76vTOQyN0hCY2gJ/8EOhVjAHV/clswJL2sr3GI3+fJUMk53WvmYOyf5YIg
 6uz8oZ8sK3dfGccJmv18wbO6nc/Zg56ciaxCrp+zrx0TGyJ13OcoIYyvWXCur6oYICNi
 D+mp9nZ01M+6ug1ZeQoLgsse0+74UcVy6jZz3Y5ut+9IEHsqR0AZmxHvhDIAHTqsUItH
 AQsA==
X-Gm-Message-State: ABy/qLYvOzRnyokeJomL+1c0oteXDOBPD5jQA6jCIm5h1aNqVKQFIdLy
 qvPA197x+0r7Z507QXWRj/6fgZANyCh+F+WvpaFTZ72y
X-Google-Smtp-Source: APBJJlFS0cUW6xwjU1b8CwY6bNNqumTSsqjMhaySN0aUGRUud/ia9n9AJxzSP89TAmlEqEZlVPxz3Q==
X-Received: by 2002:aa7:df82:0:b0:51d:a488:3b3d with SMTP id
 b2-20020aa7df82000000b0051da4883b3dmr11072428edy.35.1689630024302; 
 Mon, 17 Jul 2023 14:40:24 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 v5-20020aa7cd45000000b0051e069ebee3sm188369edw.14.2023.07.17.14.40.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 14:40:23 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-3fbd33a1819so9285e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 14:40:23 -0700 (PDT)
X-Received: by 2002:a05:600c:5129:b0:3f1:9a3d:4f7f with SMTP id
 o41-20020a05600c512900b003f19a3d4f7fmr10147wms.1.1689630023411; Mon, 17 Jul
 2023 14:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230711091155.2216848-1-wenst@chromium.org>
In-Reply-To: <20230711091155.2216848-1-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Jul 2023 14:40:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UW=VrrCB8Ko7ysWTia--hG6t+4BmRwodY=nkL=DyP6CQ@mail.gmail.com>
Message-ID: <CAD=FV=UW=VrrCB8Ko7ysWTia--hG6t+4BmRwodY=nkL=DyP6CQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add AUO B116XAB01.4 (HW:0A) panel entry
To: Chen-Yu Tsai <wenst@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 11, 2023 at 2:12=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> This panel is found at least on the MT8183-based Juniper Chromebook,
> also known as the Acer Chromebook Spin 311. It matches the common
> delay_200_500_e50 set of delay timings.
>
> Add an entry for it.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index fbd114b4f0be..df7e3cff004c 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1866,6 +1866,7 @@ static const struct panel_delay delay_200_500_e200 =
=3D {
>   */
>  static const struct edp_panel_entry edp_panels[] =3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120X=
AN01.0"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116X=
AB01.4"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133U=
AN02.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116X=
AK01.6"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B11=
6XAK01"),

You're about 1 month too late. ;-) This landed in drm-misc-next as
commit 1ebc9f0365ef ("drm/panel-edp: Add AUO B116XAB01.4 edp panel
entry").

You can find it on drm-misc-next: https://cgit.freedesktop.org/drm/drm-misc=
/log/

Specifically see:
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D1ebc9f0365ef

-Doug
