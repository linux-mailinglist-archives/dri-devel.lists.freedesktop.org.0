Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E851988066
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C3A10EC5B;
	Fri, 27 Sep 2024 08:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="et/EOOHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF0B10EC54
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 08:36:33 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6dbb24ee2ebso18749407b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 01:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727426192; x=1728030992; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NW990c4pKIgSUwRw9627ylvvkk5w5XELih7UcFss2WY=;
 b=et/EOOHtvkfI6Hj7XEyjEr5Bu8fvRK+6EvJZ6UqqJUGxvNN6J8lPduPqeGUxsxLQ/M
 wWwn21JM7N2UmlPyBSEKX5qGD88j5cp2O8rvWMug3CKRq40ZUFZdeLZ/uin72OEoorhu
 TlRSky871p3mcFCTXG31vpvmQR0swW8yq0I1Up+03fJYxfDUa/sZJdDKjXgSfu7lthfz
 w+8RHQOIULWP7OQSC83WxUEFKKDAdjQqeqF6Ls8qf/zTuaNu3RFrINbNOECWCGlFVW3d
 Y1x2HnoRTVs2QSkI23KHTTkbHbzgfKNaLOOfNb3OXjM6pxtdT84jTs3v6Vmi80ArElk4
 LtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727426192; x=1728030992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NW990c4pKIgSUwRw9627ylvvkk5w5XELih7UcFss2WY=;
 b=SEHZ2kTCAdZBGw+l/p6I9+1WMnLM+99darLRiiKsmjfGTX7vUi2+BXhpi8ZhUxF6Uu
 O2thzQVzwQUK5H9J7qvvhAZe0jsYqZcaQ08TghtetjkMdNe7jLrLrXhUCgi8WwFlI+kC
 XYbo4Q26NLpFhesE7atzkP1V1Ras7PhIufo9rghKQ4t1Z8e2BbGu0x+NgCdjgJXPOxW3
 zG7hflh4dlYnPhXE6TMwgU1Zd0szZFabdXf/8zsC6Vh28Dlin8D8aAGbtc8vUe2evxLI
 7BlMDeqQFA7YsW76kspAZE3ROpzzWTHLxVbX6RjTP11ea20sKGRfuRRG+ob8M1V60rax
 6c5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl9D6GJGHp4mbeDYfRRRMse7uCkZX1Ce/5hE8I70CSk27fMKK5zKsEbBnxe2e3SJzreFvYB997NB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc7bPv5KoLTZw5HHPXxhiIgmkgs8PGAWKqhRkVd7D4/f63JlNb
 I2BobSOvlhPmct5EVacFq08GhcA1SDpgqFBgYDBbqbLfO/XrimPxjnHSSk7nZRcA3AO8DCnc1QJ
 v3w0QqaWKeyAALeP9SkmMgMBhjIBoMAbeE8fHyg==
X-Google-Smtp-Source: AGHT+IGl+8O6l/tpJLDnrP1hqZHzdAe8d1uuNodgKIZ1SsfYNlsEQYeZwwdlmgUzciDUtd6QzdNTFBGG8PuX6Au55nM=
X-Received: by 2002:a05:690c:112:b0:6e2:985:f4df with SMTP id
 00721157ae682-6e24dc9c710mr7236477b3.44.1727426192209; Fri, 27 Sep 2024
 01:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240926075134.22394-1-Hermes.Wu@ite.com.tw>
 <20240926075134.22394-2-Hermes.Wu@ite.com.tw>
 <loulf3p74x3p6dinublo6xenwjoyssm2f5rk5g3env54abhath@37i4vlvxjn3f>
 <4360d5a8c4e54540831eca77ca9156f5@ite.com.tw>
In-Reply-To: <4360d5a8c4e54540831eca77ca9156f5@ite.com.tw>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Sep 2024 10:36:23 +0200
Message-ID: <CAA8EJpq0Q-TRh6MW70sHkWGo3Sz1j1Ep15LFjXCnXK0pdHfhKg@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] drm/bridge: it6505: Add aux i2c functionality
To: Hermes.Wu@ite.com.tw
Cc: Kenneth.Hung@ite.com.tw, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, angelogioacchino.delregno@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, 27 Sept 2024 at 04:43, <Hermes.Wu@ite.com.tw> wrote:
>
>
> >-----Original Message-----
> >From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >Sent: Thursday, September 26, 2024 8:58 PM
> >To: Hermes Wu (=E5=90=B3=E4=BD=B3=E5=AE=8F) <Hermes.Wu@ite.com.tw>
> >Cc: Kenneth Hung (=E6=B4=AA=E5=AE=B6=E5=80=AB) <Kenneth.Hung@ite.com.tw>=
; Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@l=
inaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart <Laurent.pinch=
art@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec <jer=
nej.skrabec@gmail.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.co=
m>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse=
.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; An=
geloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>; Allen C=
hen <allen.chen@ite.com.tw>; open list:DRM DRIVERS <dri-devel@lists.freedes=
ktop.org>; open list <linux-kernel@vger.kernel.org>
> >Subject: Re: [PATCH v4 11/11] drm/bridge: it6505: Add aux i2c functional=
ity
> >
> >On Thu, Sep 26, 2024 at 03:51:34PM GMT, Hermes Wu wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >>
> >> Add aux-i2c operaction in order to support the MCCS function.
> >
> >Brevity is the soul of wit. However in the commit message we appreciate =
more details. Is it enough to get monitor control to work? Or is there anyt=
hing left to be implemented?
>
> In drm_dp_helper, drm_dp_i2c_xfer() pack I2C request into sequence of AUX=
 request.
> it6505_aux_i2c_operation() is implement to match drm_dp_i2c_xfer() behavi=
or

Commit message, please.

>
> >>
> >>
> >> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> >
> >This is definitely not a fix.
>
> will remove.
>
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 177
> >> +++++++++++++++++++++++++++-
> >>  1 file changed, 175 insertions(+), 2 deletions(-)
> >
> >--
> >With best wishes
> >Dmitry
> >
> BR,
> Hermes



--=20
With best wishes
Dmitry
