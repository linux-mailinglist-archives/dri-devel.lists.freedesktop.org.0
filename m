Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73985F0DB2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B005910ED35;
	Fri, 30 Sep 2022 14:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C18110ED34;
 Fri, 30 Sep 2022 14:37:34 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s125so4943061oie.4;
 Fri, 30 Sep 2022 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=0EKYKtDamt6m6L+nsr6b+dVkqG7/Q0rILbWJkS9SPPI=;
 b=VhEaTkvJmfCmAySCbqKnICx5hPGtMJXj6MVvx1d6dhuFM6BQyD6tUXjzQPW0Avaq6r
 ShZTz17o2dBJ84vKDf0fKt9Pl6fjAnFpZLXkU6b31s+lMQ6WGaGXZXl1lGqmtaG6hN0S
 MfuK68Yvp5oIlgVYOlMY0dBKOKDUjGiuxEPhJJiWEnirszUfMNpDUwcG57WMUyXV4dIm
 eYHyL6hxvjTMMqlKlf0tOfeFBOqTiOfRUUJae8/emmZUBjhh9Mi/eZNN9S0p8Je60VwI
 YTvq23Da4531ZcJ3GIVx8M96ZUMYdRscN5RNzTukNr884v4UvO3jctATs8jBHKtS2LkT
 61TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=0EKYKtDamt6m6L+nsr6b+dVkqG7/Q0rILbWJkS9SPPI=;
 b=TIdBKUeseiFMoxeda8y3gw0cXkbS9PSUeW6wSZU9TmzCcl41FpKlrvfo0utyMGDrE6
 cska8mLket0JGeOk3wKjgZ0bt2RvcQTiq0nDeGWfDYzGDKmFAcwNcu1krnJAqIL+kdiY
 smN0/YdfG5g6jsc6SGV1dFEFYYH25dixNnoVgvjLa2TPACTfzJ1qnYjNWYux85j/aPlr
 Cj1bIfe0QORCCzmCgf1j2z7Kdm+qiYNlSZPES923LEx0P5GZ9mlItJWKWgZJ2ceRwEBA
 mAUsqlIcAU9m2gMpHAdlOkgdvIALrDnxmskPo2JBzYA2+W1JXnyS/tYPYqx1XmooXdue
 /OgA==
X-Gm-Message-State: ACrzQf1hFEDslhRdfrBL44b7ylk4MUwWsZ5ZYRKTzoWRWaVnTZ2RrmPD
 wVrkE7cuOo9aOQD5FI38i501XTRzW7fqXI3X8ls=
X-Google-Smtp-Source: AMsMyM4BeOGwS6oExymXYAyzUZTfLr1KYoPz1/85vr6zRGjgWJpmrIwWEOfXHuhMicv5tJO1qjkRqJioVHywDrwalH0=
X-Received: by 2002:a05:6808:2194:b0:350:cb3d:ecd2 with SMTP id
 be20-20020a056808219400b00350cb3decd2mr9913017oib.46.1664548653230; Fri, 30
 Sep 2022 07:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220929090200.2189669-1-yangyingliang@huawei.com>
In-Reply-To: <20220929090200.2189669-1-yangyingliang@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 Sep 2022 10:37:21 -0400
Message-ID: <CADnq5_O3e5=yyAhNO7CShMatc+ZxhvQosUkBdPa+CkJTcqUTNw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: change to
 enc314_stream_encoder_dp_blank static
To: Yang Yingliang <yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Sep 29, 2022 at 4:46 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> enc314_stream_encoder_dp_blank is only used in dcn314_dio_stream_encoder.c now,
> change it to static.
>
> Fixes: c9c2ff53cc20 ("drm/amd/display: Add explicit FIFO disable for DP blank")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  .../gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
> index 0d2ffb692957..7e773bf7b895 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
> @@ -262,7 +262,7 @@ static bool is_two_pixels_per_containter(const struct dc_crtc_timing *timing)
>         return two_pix;
>  }
>
> -void enc314_stream_encoder_dp_blank(
> +static void enc314_stream_encoder_dp_blank(
>         struct dc_link *link,
>         struct stream_encoder *enc)
>  {
> --
> 2.25.1
>
