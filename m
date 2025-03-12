Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F24BA5E0C2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 16:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BDD10E149;
	Wed, 12 Mar 2025 15:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fSITVOTV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE4710E149
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 15:42:55 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5497e7bf2e0so6827666e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741794172; x=1742398972;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vw0KUaZ0b+JsqMU9c0Y3CKPGy3vo4F+iJFxyks2AXEc=;
 b=fSITVOTVlqsob/HUUmhPrO+BmXtkUEItxTdHbfKgrEBZ3w7OzOfwwOf5iSR8X0Tm8O
 iiPb8Ev6zwxjIPrceO+DZrR5/GCEgli/xEn7h0yidbfWmyCXq0jju12X9qSmn7Gp42vL
 U+E0/1OmTfbM8t6lsMtbj73766+LW8DbdbHTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741794172; x=1742398972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vw0KUaZ0b+JsqMU9c0Y3CKPGy3vo4F+iJFxyks2AXEc=;
 b=C6iGH+llOb944pygFziIBl5WcicDvuIhnY98oVhHaqPd42pCZfSfua3AL9/Dik3sq7
 B9T21J0ice05dgwGTKMLXc1/9mvYR3x472hmpkgRE07Pedc0NmIva9apO20fGMq8VdWF
 yzVtVmzlgbGMM1ykH+vrO6TdYdjKOUDFxkxAUrXBTjy4slefp44wVRa4P6NB4hOaymHV
 HTwWcfOF6DusIsjD0YRkWOwmVzuIPneItaI3lPnaTI2BKiQY2ne0/lnKal7lXiDZt1dj
 1MEeSu+83LZaYZGK2d5Oo3CLoKwD+3ceWfjG3fqMUbGQYNTDlZPgtmg9VrNZgYELd19z
 6inQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHHzrBJNQIo0opGeo8+KeT4gqkOn4m7CQgAuUF5Z32FWQx19TROdpzVW2MebARd4dumdZlxDrphKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaZkcWM9gVqdR/UnPhDZCcdJ+9PGxIkJ5Xf8OVOuYdJiUwapaY
 NYzouEUhh/YHHtIT5+ysYX+zIpICiwrKTBci0qFWB1bD32dZKLJz4gbrEqjm+kvSRDjXUB4sVy3
 y4IlQ
X-Gm-Gg: ASbGncv/+Rw2AIsWUOR16ml09EXpbftSXbPQdzkHI76GOj/fBoIUJ2WDg3754/AQQBE
 GRecolcESlre2IRO/NGY1mJFSUpYtBufqDJ8Q9EpeGfJkZaYw7zsaOAlVJdppdWRMKuVF05KnlW
 o54nFOHHJ35or1r7CeZS5nBE0pw4aycoQT9VHaP0x25OcaP8sFgnwAP2mwH4SChdqNtKB9olmo+
 wx/23grEIuu9dCf9pwLwcMa41XosIiM5nWg7E0fBYF1PKITMNBwCuTW2BWzOs9Bu9HmPUBtavb8
 zEOeQs20lleVoi6jqIqeml+q6Pg5xxueDnLJb0s1TECM0IqfmmhfwEVq695gUiVayLsPGobHA5s
 A5miU7hNV
X-Google-Smtp-Source: AGHT+IEWhE6cas01dTJLs7IHPs59QY/nJDHH7jbEaNzFI+j0zUCDKDmw1/5/r7Mgl0qRhUIQxQa3+A==
X-Received: by 2002:a05:6512:3996:b0:545:f70:8aa7 with SMTP id
 2adb3069b0e04-549abae7c06mr3024160e87.32.1741794171506; 
 Wed, 12 Mar 2025 08:42:51 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae5904esm2132776e87.76.2025.03.12.08.42.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 08:42:51 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5497e7bf2e0so6827531e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 08:42:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUFo6yOskeXmtEAg/esNnrjkkaLMFXOYeh2J3h1BSTKnu5xLQ2EmwAQZ/u9nA9dDhnpyc8q3mvA5x0=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3d19:b0:549:4d78:2418 with SMTP id
 2adb3069b0e04-549abacd211mr2905563e87.27.1741794168636; Wed, 12 Mar 2025
 08:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com>
 <CAD=FV=WW1ak-_MEBVks==Yr1tUdfFZ3K16_gcdJQ9rwE4ZduNg@mail.gmail.com>
 <CAN9Xe3RYgnELGymau=EoZQy54sM-WfnR-6dr-wmNaBr4ZLnROg@mail.gmail.com>
In-Reply-To: <CAN9Xe3RYgnELGymau=EoZQy54sM-WfnR-6dr-wmNaBr4ZLnROg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Mar 2025 08:42:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XubjtTV70MMPBm2EwoLzoQPHKv6RzHXJgf44mu-h2o=w@mail.gmail.com>
X-Gm-Features: AQ5f1JqXMzAvNqm-GDk-AEL8mokEJ4SfWD3DkXGx_CXDjIlY6tZpWWWd-O4t1JM
Message-ID: <CAD=FV=XubjtTV70MMPBm2EwoLzoQPHKv6RzHXJgf44mu-h2o=w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/synaptics-r63353: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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

On Wed, Mar 12, 2025 at 7:54=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:
>
>> > @@ -78,7 +79,7 @@ static int r63353_panel_power_on(struct r63353_panel=
 *rpanel)
>> >                 return ret;
>> >         }
>> >
>> > -       usleep_range(15000, 25000);
>> > +       mipi_dsi_usleep_range(&dsi_ctx, 15000, 25000);
>>
>> No. None of the conversions in this function are correct.
>> mipi_dsi_usleep_range() is only for use when you're in the middle of a
>> bunch of other "multi" calls and want the sleep to be conditional upon
>> there being no error. Here there is no chance of an error because no
>> _multi() are used. Go back to the normal usleep_range().
>>
>
> OK. Then the approach to prefer mipi_dsi_usleep_range() over the previous=
ly used usleep_range() everywhere is out the window. Sounds good. Is replac=
ing msleep() with mipi_dsi_msleep() preferable?

Same rules there. If you're in the middle of a sequence of "multi"
commands and only want the sleep if there is no error then use
mipi_dsi_msleep(). If you're not then use a regular msleep().


-Doug
