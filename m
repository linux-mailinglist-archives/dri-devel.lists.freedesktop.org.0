Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9696A8884
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 19:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AB410E541;
	Thu,  2 Mar 2023 18:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8546F10E53B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 18:29:43 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id l2so223051ilg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Mar 2023 10:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpWolHBTfv1e/s85d7Nor58l6lqGaWFhdL+nTiGGVic=;
 b=QI7gz/LeygpGxrmWN08W2VKhqopzlDmPIMqoxGEz9VFAjmlDg199kMccbeLiAyrhdi
 H/Yvc2c5UwqTGdwX9DOSblo6pvnc5iN/NV+8j+BuYzA7+Utu8lpFc+rE87A9QqEFCqbj
 glnz67pYLBz+umPSkDBuPlZ+iiqngAtoKnn7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpWolHBTfv1e/s85d7Nor58l6lqGaWFhdL+nTiGGVic=;
 b=t5VXfKIkcCgydZB4k3InnZ5IBvzcZYiYhjo71geyWqdYbkD4x/I8rJDKKsElCjc4Iv
 GjUPEUpefbxZUYtZ9boP4an2/5YXE4Cm+PoZ62yEg9JwlDrY4hhWuZe3REKoet2ltcHU
 VHvNAm27rwgJ3WqgLNeZinZpOCjfNg28nsMN6FM3f/N4nV+hkkMe3LveszRdy6Am0SgN
 +sop6glYO2To9GKeQTh8Xgc2bqN3k/tjOGJKlZtfKDrDm4LpJFdaAREcZWqBfNO3Iq1s
 jrhFd+uLWPBZ75Jf9Y/O+QMAQyp7sBjekXlvdHTcdbrth4ALS+Q/NtBbWGjiY0kkNjZa
 n8JQ==
X-Gm-Message-State: AO0yUKVkUHGoYyj3fRgSiDfY9/nYCuFkpOlKWWzug3YFGFI4DflVlyH8
 xb6gFNjls8St7qqBfTOGhC12wtauydu/yC72
X-Google-Smtp-Source: AK7set975GGJkzP2E83LgGaD8RdGcKE7blah9MXuFbdyoevqS/N/1RaWoDnKnmR9oIbjbrMGHvrhUw==
X-Received: by 2002:a05:6e02:1a82:b0:319:23c7:5559 with SMTP id
 k2-20020a056e021a8200b0031923c75559mr932511ilv.3.1677781782044; 
 Thu, 02 Mar 2023 10:29:42 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43]) by smtp.gmail.com with ESMTPSA id
 a5-20020a056638018500b003ebb74da18fsm48466jaq.151.2023.03.02.10.29.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 10:29:41 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id 76so4386iou.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Mar 2023 10:29:41 -0800 (PST)
X-Received: by 2002:a02:8545:0:b0:3e5:a7d9:27db with SMTP id
 g63-20020a028545000000b003e5a7d927dbmr4740334jai.6.1677781780914; Thu, 02 Mar
 2023 10:29:40 -0800 (PST)
MIME-Version: 1.0
References: <20230302074704.11371-1-johan+linaro@kernel.org>
In-Reply-To: <20230302074704.11371-1-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Mar 2023 10:29:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WK2yxWqAro6k4N2kr-HeNZLNxi6tuq=_uL0tbSjGVEAg@mail.gmail.com>
Message-ID: <CAD=FV=WK2yxWqAro6k4N2kr-HeNZLNxi6tuq=_uL0tbSjGVEAg@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: fix info leak when failing to get panel id
To: Johan Hovold <johan+linaro@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 1, 2023 at 11:49=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> Make sure to clear the transfer buffer before fetching the EDID to
> avoid leaking slab data to the logs on errors that leave the buffer
> unchanged.
>
> Fixes: 69c7717c20cc ("drm/edid: Dump the EDID when drm_edid_get_panel_id(=
) has an error")
> Cc: stable@vger.kernel.org      # 6.2
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 3841aba17abd..8707fe72a028 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2797,7 +2797,7 @@ u32 drm_edid_get_panel_id(struct i2c_adapter *adapt=
er)
>          * the EDID then we'll just return 0.
>          */
>
> -       base_block =3D kmalloc(EDID_LENGTH, GFP_KERNEL);
> +       base_block =3D kzalloc(EDID_LENGTH, GFP_KERNEL);

Good catch! I'm landing this to drm-misc-fixes right away.

4d8457fe0eb9 drm/edid: fix info leak when failing to get panel id

I'm sure I copied the kmalloc() from _drm_do_get_edid(), but it looks
like in _that_ case if the read fails we never print the buffer so
that one is OK.

-Doug
