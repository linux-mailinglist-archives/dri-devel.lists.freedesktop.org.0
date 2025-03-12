Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1826FA5E0F0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 16:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C90F10E173;
	Wed, 12 Mar 2025 15:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UOKnxiqV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B652010E053
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 15:48:23 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30bae572157so67003491fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741794497; x=1742399297;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LdZ/KsjENSBssp+v/dxb+PBQzOCtXKmGBKQGm6xeShA=;
 b=UOKnxiqVXrJCwLgYp8I9r1kyWRirwY2B2Sq4Dn5QJbqCxrIM+3+KNOumXfyVnECaFx
 caX0SbTrJ67x4ZCwpQjIiAfqrS6EWF8ydPIYzq5hwoIGId9eY4vdsPz+4l+m7gSTHA9T
 Z+NALUL1ZL8GQZq8susYkk1FcnuWgX6QtfT+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741794497; x=1742399297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LdZ/KsjENSBssp+v/dxb+PBQzOCtXKmGBKQGm6xeShA=;
 b=W8f8ZAZZHK5KliHQj9Vyp2yacnpz968r4pMq1/xLu0bXV/sOfHlH6Am6ZKCu5KVB5Z
 i6nF2DXhdmoEI3pmkQmlU7fQ7Dy1LojqAKYpEtoMmKgOd5h+T6Zbx+wxouqQ8v1z+ID5
 3QDWHcXyFoKeAyN2KhhCQ/11FIIj2HgO/Ef5jNks4hGmXBJHpb9rGADSjz05V7bi3SiW
 L2glZFH8c/WqnI1lKgp+kQvMMhPfwwHNyzxY1TDqK79Akr/1hEqJQPDNlmV6JA1G+ui2
 6+/vb9Qqh+wbv5An04FpcrsN3TzM8jEaDYz/PAHOlrVk1D45DdnlciUK2imsLP/Fzp0U
 FpUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0Sjumnsnv5ydFhyx2UnIc+JonK63E6oaqT61Rzi7Hk0GGRvYzdZg2EORuJvHIZ0jLFYfo/LxUr8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCtwKSf8+EjrtYOPlK29pSj7pUKoPAe4AU5GYKc2brG9zsQ8mE
 6S5t5JxThN/IpUsWKgBoMBqleeuyw81JZzJ0XxlKQn1MwqZV3CYUC0j056rJa133i19vQ/NSLqY
 Bmebe
X-Gm-Gg: ASbGncvCpsqaScLrvemR4CzXQo8ib9fWCJrhBNSfO4jL3ays8iHowJnXH7qQP1V+G7K
 1Y0oRDS8xT4pMLBEn1N9V8+MW5MaVhwmznWOSH1cbl2NRdgWYqpGGXCRqPXCGH5Q4swQ3h/bLGe
 vHJ32a3AIS4ptoUWdTvguNTcQ/fYanZcvZpLS93tLY8mVTft3pPItyTsQoo/OR9PHbmx6V5QGDu
 IzLKtBlvnb8q15tPdKbdhRYefuPugTar0KPH9Uzq/LkGg0uTk1fdjMk6KCyPWXLjpJhJI822jJe
 zUCpS1J+Er8LAjeEVTwO6bENmwCpkfBakTARVvLKGEJZPFG6dt4cgNa1pr4xVRU14DKMtpDfYas
 5ZGobY/vX
X-Google-Smtp-Source: AGHT+IH7fYARpzfUKwTwmMGnVg19STp58taVmEmnByGo9pNAnFgIoJa/FUkDoHTmDoxBL7GUyMD5dQ==
X-Received: by 2002:a2e:be27:0:b0:30c:7a7:e872 with SMTP id
 38308e7fff4ca-30c207543d8mr39930271fa.34.1741794497538; 
 Wed, 12 Mar 2025 08:48:17 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be98d0800sm24675881fa.5.2025.03.12.08.48.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 08:48:15 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-547bcef2f96so6822492e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 08:48:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV5MJDWlCCXUXjNgLqM6YmA4nl8Kk1089qBZ99wGk19a4RRSMUu3PVMfoe0N8NZsqetdPVvvLr2HYQ=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3b25:b0:549:7394:2ce5 with SMTP id
 2adb3069b0e04-549abae9732mr3014845e87.41.1741794492068; Wed, 12 Mar 2025
 08:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com>
 <20250311-warm-icy-rottweiler-cefcdd@houat>
 <CAN9Xe3Qwu=E=VVZZ_8EHPF7Xsk6Zcbp=R_b=cRgF=9SWCkmsqA@mail.gmail.com>
In-Reply-To: <CAN9Xe3Qwu=E=VVZZ_8EHPF7Xsk6Zcbp=R_b=cRgF=9SWCkmsqA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Mar 2025 08:47:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdngrNhUn8jQ3FGitkBCkiQO1dXnPhCKj+S5Jo8_WUrQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqKOeCFnqz9t-GQAqcT1m-g7AXhkRBMViQRSMxzjFeOfKb4IuUc4Kxm3n4
Message-ID: <CAD=FV=XdngrNhUn8jQ3FGitkBCkiQO1dXnPhCKj+S5Jo8_WUrQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/synaptics-r63353: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>
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

On Wed, Mar 12, 2025 at 8:06=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:
>
>> > @@ -106,53 +107,46 @@ static int r63353_panel_power_off(struct r63353_=
panel *rpanel)
>> >  static int r63353_panel_activate(struct r63353_panel *rpanel)
>> >  {
>> >       struct mipi_dsi_device *dsi =3D rpanel->dsi;
>> > -     struct device *dev =3D &dsi->dev;
>> > -     int i, ret;
>> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>> > +     int i;
>> >
>> > -     ret =3D mipi_dsi_dcs_soft_reset(dsi);
>> > -     if (ret < 0) {
>> > -             dev_err(dev, "Failed to do Software Reset (%d)\n", ret);
>> > +     mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
>> > +     if (dsi_ctx.accum_err)
>> >               goto fail;
>> > -     }
>>
>> This changes was definitely not what the script is doing.
>
>
> It isnt. Using coccinelle for the major part of pattern matching and repl=
acing the newer _multi variant API. Some handling (including a newline that=
 it introduces) and  the returns depend on a case by case basis, which had =
to be done manually.

...and now you're getting to see why I didn't think a coccinelle
script could fully handle this task. ;-) IMO instead of trying to get
a coccinelle script to do the full conversion, the right approach
would be to use a coccinelle script (or equivalent) to get the basics
done (just so you don't make any typos) and then cleanup the result
manually. Spending more time on the coccinelle script than it would
take to do the conversion manually is probably not the right approach.

If your patch wasn't fully generated by a coccinelle script you should
document that in the commit message. Something like "Initial patch was
generated by a coccinelle script and the result was cleaned up
manually." If the script is too long to fit in the commit message,
it's fine to put it somewhere online and provide a link. "Somewhere
online" could easily be a mailing list post.

-Doug
