Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37D06B9C9C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 18:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805D010E055;
	Tue, 14 Mar 2023 17:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6469510E055
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 17:12:18 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id b16so6684823iof.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 10:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678813936;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WErv31ByjL+Y5MoYqCnIOK9sNV/kGFFl+v+OJaK+Hw=;
 b=fwgtKfujDZT03JfvBhH17H4E0WnKpCSqvzpMWw1Ay+iJ6bNTu8osC4fSHj0EikKZNi
 l+Rzl4glwPW0WoKXYxbrJjW8ciXPh+hcwug3ovIs+RRrJp1PcmnRtVTsMD0qNDju+hxN
 Wt+PmOe3hD88G3VZZ2ABBbVDG2Hnj+6pCYS6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678813936;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4WErv31ByjL+Y5MoYqCnIOK9sNV/kGFFl+v+OJaK+Hw=;
 b=la5pBSFabR+QR1ssX+fPm5MRI5i181lTXTf4fzORKHURQvGFMrC37uv9sNFiE00KPu
 lCNLv85ag5QA/BuXqHXKyANJoqPvmQ8ZK4qmX2XFS7WRbG5MoAJz5GGIDAQuQHAvwA12
 7F5QKmUPo6mo5UXGash69MdO0K5OhEKwSivsd9kiEykU9ryyaApvaF9srY5IOnCoSuFz
 CqajnBD5ufhkd8NP68sl+UvTHKe/pID0hRZlMK532CE19mMKhyZYMMVUyzSkJqHvEhG6
 /jdNBHRhlaze0zbr4N2RxsNN7O14Y9Avx91l6mMbIraYlaECM0mg48ejv2qC9ZSrQruu
 a6Xw==
X-Gm-Message-State: AO0yUKWzStC/ET+nA+1DV0eUv7j5v5S6iy0TDdFCJeWaEHOjbU86vwxK
 DLbKygiuIRRfXL6BnwjkKVqCmcfUWuVM1exrvYg=
X-Google-Smtp-Source: AK7set+QohquujgjjF3xOwfbQybtnK7gfWwm7NMfw4ipzOwm4Hl0aqfZbBcmEg/rEhwwk5W+yTVvlQ==
X-Received: by 2002:a05:6602:3288:b0:751:d1a9:964f with SMTP id
 d8-20020a056602328800b00751d1a9964fmr1567903ioz.17.1678813935833; 
 Tue, 14 Mar 2023 10:12:15 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45]) by smtp.gmail.com with ESMTPSA id
 h4-20020a6b7a04000000b0074c8a021d4csm969902iom.44.2023.03.14.10.12.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 10:12:15 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id q6so6696393iot.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 10:12:14 -0700 (PDT)
X-Received: by 2002:a05:6638:3489:b0:404:140b:55e3 with SMTP id
 t9-20020a056638348900b00404140b55e3mr4999457jal.0.1678813934494; Tue, 14 Mar
 2023 10:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230314114451.8872-1-lujianhua000@gmail.com>
In-Reply-To: <20230314114451.8872-1-lujianhua000@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 Mar 2023 10:12:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X7K2KQoRCsr17kj-DWiPs7h_zfcYxK_cdBVnC0wR1NwA@mail.gmail.com>
Message-ID: <CAD=FV=X7K2KQoRCsr17kj-DWiPs7h_zfcYxK_cdBVnC0wR1NwA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Fix panel mode type setting logic
To: Jianhua Lu <lujianhua000@gmail.com>
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

On Tue, Mar 14, 2023 at 4:45=E2=80=AFAM Jianhua Lu <lujianhua000@gmail.com>=
 wrote:
>
> Some panels set mode type to DRM_MODE_TYPE_PREFERRED by the number
> of modes. It isn't reasonable, so set the first mode type to
> DRM_MODE_TYPE_PREFERRED. This should be more reasonable.
>
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-abt-y030xx067a.c     | 2 +-
>  drivers/gpu/drm/panel/panel-auo-a030jtn01.c      | 2 +-
>  drivers/gpu/drm/panel/panel-edp.c                | 4 ++--
>  drivers/gpu/drm/panel/panel-innolux-ej030na.c    | 2 +-
>  drivers/gpu/drm/panel/panel-newvision-nv3051d.c  | 2 +-
>  drivers/gpu/drm/panel/panel-newvision-nv3052c.c  | 2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35950.c    | 2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt39016.c    | 2 +-
>  drivers/gpu/drm/panel/panel-orisetech-ota5601a.c | 2 +-
>  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c      | 4 ++--
>  drivers/gpu/drm/panel/panel-simple.c             | 4 ++--
>  11 files changed, 14 insertions(+), 14 deletions(-)

Can you explain more about your motivation here? At least for
panel-edp and panel-simple it seems like it would be better to leave
the logic alone and manually add DRM_MODE_TYPE_PREFERRED to the right
mode for the rare panel that actually has more than one mode listed.
That feels more explicit to me.

-Doug
