Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF27FC9BC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 23:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF81610E357;
	Tue, 28 Nov 2023 22:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A0410E5B0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 22:43:16 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54a945861c6so8374862a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 14:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701211394; x=1701816194;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d6v70Jfc8nqkrgav4bbcQA6HZL6P4J2VUNvwOzUy5eU=;
 b=i5MMmqoA1S/a3+HnfRZgLVIO51sJlh6c8tCIXEnqfwOhzJC3Pjf30ZEXpPUoIhwsAw
 Cnte7vamZKVs1O3XFb/WVCOnNAj30rJYcLFyXPJgf85MQkaW/jDC5TOZ3AzvB1YmVOI+
 Iy6oX32UfIv6zFvPqQYbR9BMamn/MzdhM45xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701211394; x=1701816194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d6v70Jfc8nqkrgav4bbcQA6HZL6P4J2VUNvwOzUy5eU=;
 b=tDRGkNmpwPqoyHbBUa/E48LkUpPDOu30+msDhmQwBeqV7vj2/8D7j+4QXWdZdYjzX4
 jvXQOM3HqcVTudy3xms9TckFUu92m9iKRMTgxs0PTY3TWTNU5QNtv/JNw6xmcwn89xsN
 a0JtAT5hCMvCgVidcMC3IX0ETapzhx3WrP1Qj3qc+UXF3OSbqs+fZf6br7XRLR1FkX3V
 7dq8gguflvSRp0p9wG5iMqndZ8wA6lVAODUBG95dHNeALma83CzO+Ja8QAnTQEEHYrzp
 Vms3RnbZ+K5skGmnW3U3a2/SWdL6gH1n41lPfIHCuEgjZM9Ryp4b4DhT9hIl3EJuME6R
 rcYQ==
X-Gm-Message-State: AOJu0YwNkXLKiWPFCqtn/6GeLzjpPt4BK9XWEKAopDcUjvfk9XFCoPyN
 rmxZVMBJKP60PGQJ7szCeXPfM7PGUQ5ilUM7dB1pGL1H
X-Google-Smtp-Source: AGHT+IFtcHG91pIdnDJAuyWYbzl9kdTo4FxVOWWuNXe5+x5skApD6kpWj0AnCe4kM27FPUZA8Giq2g==
X-Received: by 2002:a50:a693:0:b0:54a:8e8c:80a8 with SMTP id
 e19-20020a50a693000000b0054a8e8c80a8mr12549351edc.29.1701211394186; 
 Tue, 28 Nov 2023 14:43:14 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056402354b00b0054b59096da4sm2995200edd.13.2023.11.28.14.43.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 14:43:13 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-40b51e26a7aso8645e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 14:43:12 -0800 (PST)
X-Received: by 2002:a05:600c:206:b0:40b:443d:9b78 with SMTP id
 6-20020a05600c020600b0040b443d9b78mr400913wmi.0.1701211392581; Tue, 28 Nov
 2023 14:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20231117215056.1883314-1-hsinyi@chromium.org>
 <20231117215056.1883314-4-hsinyi@chromium.org>
In-Reply-To: <20231117215056.1883314-4-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Nov 2023 14:43:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V33tTjKYvaqUayNh81ksFf2SkUsS0oB0SrfsFe38triQ@mail.gmail.com>
Message-ID: <CAD=FV=V33tTjKYvaqUayNh81ksFf2SkUsS0oB0SrfsFe38triQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] drm/panel-edp: Avoid adding multiple preferred
 modes
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 17, 2023 at 1:51=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> If a non generic edp-panel is under aux-bus, the mode read from edid woul=
d
> still be selected as preferred and results in multiple preferred modes,
> which is ambiguous.
>
> If both hard-coded mode and edid exists, only add mode from hard-coded.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> v6->v7: no change
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Pushed to drm-misc-next:

fb3f43d50d9b drm/panel-edp: Avoid adding multiple preferred modes
