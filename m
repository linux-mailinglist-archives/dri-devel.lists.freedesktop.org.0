Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF88A2AEBB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 18:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A0C10E8F3;
	Thu,  6 Feb 2025 17:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="iqNB+R3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C1F10E1E6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 17:21:12 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5440efe97baso1245965e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738862468; x=1739467268;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmyQQLjc7ihSNeKK+vC8OeDD8oaLS3Nn6NTNSIO758Q=;
 b=iqNB+R3VgBFmtdMlvvQ4UHJSW4R0Cq9RFuH55Gb3kZywdhg0d1QU4IKPyGZ0Bsj+Gx
 rjQ4sMDpv7A9TRQrO0Xe5AS13eQ1NKHHbJNyPbZqin2E4EehJy9hIsWbi3S4vGXJpKpJ
 wj5RV8kTMpfhYqP53OV+PwyUWvTWRMofQrzVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738862468; x=1739467268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xmyQQLjc7ihSNeKK+vC8OeDD8oaLS3Nn6NTNSIO758Q=;
 b=F+/E6tfV7wXjM3/K95NRMvvL4cxWk8N7OZ68ko0XAQgGedVsORSbp5PqbPOqL2//xq
 04IUShxXzaCl+t9wpV8ay3Hi6dlqy5/v912APrGafBwzGi976b6zDVrkh1heCPl2KfvG
 mDs+GnXRaIqpLOuAD9I5okqtDq6GdSbak4aAhZ9yowgWGZutqF05AhXcTCA3yjN22Xpa
 ifnEBm/n8lXEqzpxg8TAPy4U+u/Y+c7wKJcjUN+d7EY/s7rWRyxZNKtoLTNFexO9pZ4f
 pmcgo+KF3bv0AwHc/CGqBp6ip9+jHl8DlDeOVWyj85y/hnDkrc3UAhWTGkLnjEozL+ln
 qzJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6z4cN4HsYduVniQ/d9y3OUIU0hSD0PyHlyMDwq81trNHeOFlhmh9dgz+Mx+UY49R1heOaB4lcAdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd49oZUAfwnu8oV4h3P5BLgHDm4Ti0kWntD0+YPiJlBPugK01r
 FBPSvzUNJ9fwh4l2nSki9FJ1ykbvW7XfL8mJVJ2Kr6e9fEDH+dKPKogWFZOKDSXHVFNEBwQYwnD
 /uwkR
X-Gm-Gg: ASbGncv6fThPPALBhp0W2Te+rWJH6C7vtDJUujEmvm4DTjq1l0oHNUOLqqX2Ajj4tXi
 0KQWH0aXPWV4bVCGHSFo6mRbc+S2ES7WI2qTIZ073CHv6PBhzZ+egpfc03OIwATTgCsU/j8Ekga
 QJqaLl3qPdR/AATwmgsMZwtgDW4xdMyZsmvBkPaoJX59jsz0aX9lejRHrujI3GPpAv6dO5q5u8L
 7+7OBCCcPbGMRxSku2Bi/H7CURU6STKU7SEUHEEPZRot4+jmeSEYw/VmAgwVIBCqM/sUlAJkDSt
 1ZBYw+mqHdESRDYPAKcNUmTaovW/L6DlQm/wc1j7Gv+JlMVI05Voo6k=
X-Google-Smtp-Source: AGHT+IHQ0s7e+Le3EcqNkHZl4MWRvEHZyueL+LzFgj5uZef8N9MmZMlsHtKaTIIfK50kNs0BkwbH2g==
X-Received: by 2002:a05:6512:686:b0:53e:37e4:1457 with SMTP id
 2adb3069b0e04-54405a6c0c4mr3277949e87.33.1738862467664; 
 Thu, 06 Feb 2025 09:21:07 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053ebafsm181871e87.15.2025.02.06.09.21.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 09:21:06 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5440efe97baso1245873e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:21:06 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXgxTB1DwxNgCW+YqrXT1u/1FwmJb4FuXeXt1JWKL/XInsVTfhJbLCRXvZbkxJkHW3DtybdE8AiwZk=@lists.freedesktop.org
X-Received: by 2002:a05:6512:220a:b0:542:8da7:242f with SMTP id
 2adb3069b0e04-54405a10653mr2730027e87.10.1738862465869; Thu, 06 Feb 2025
 09:21:05 -0800 (PST)
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-4-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250206131300.1295111-4-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 09:20:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W8WR4rut47LA=PftG1bdDLkSa97syY8wt=rH4dJa-pLA@mail.gmail.com>
X-Gm-Features: AWEUYZkQjg27CCS9VZJxZrYKj8mLCb6hWyh_QBl79_c9o4gHiKUmfZwJ_3PvYOU
Message-ID: <CAD=FV=W8WR4rut47LA=PftG1bdDLkSa97syY8wt=rH4dJa-pLA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: panel-himax-hx83102: support for
 csot-pna957qt1-1 MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> The csot-pna957qt1-1 is a 10.95" TFT panel. The MIPI controller on this
> panel is the same as the other panels here, so add this panel to this
> driver.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 123 ++++++++++++++++++++
>  1 file changed, 123 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

There's no rocket science here, so assuming that the bindings get DT
acks I probably won't add any real delay before landing...
