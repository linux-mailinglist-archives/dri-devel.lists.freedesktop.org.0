Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBFF8D4E0E
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 16:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3624510E088;
	Thu, 30 May 2024 14:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LAXbH6aH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84BE10E088
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 14:34:20 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-43fe2d17834so4910961cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 07:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717079658; x=1717684458;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SC6nWvS6ksIVK7SPyvfcXHHq7DHpEEdDXC/BUNLhAHQ=;
 b=LAXbH6aHZkjS9W1/o5kF7Rq45n6Fq4p8uSq1axouYEinC9mTCjWTkaJ8trBElsw7Pm
 e8JLlpQD2rTHBtEIfCWkRrYdTRc6NueSF/S4pFHydsFwLE13wHDm/4cbUscXeB3wAWzs
 mD10WW348ulzxc8pEaa1Kc027xVKbuaAXxNWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717079658; x=1717684458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SC6nWvS6ksIVK7SPyvfcXHHq7DHpEEdDXC/BUNLhAHQ=;
 b=BnG8ZWZQSoFee0FN9RKxSv49d5wTsaHyHe3Y19U/etXjjBO5pLsYg1nDPlFQYTsMNe
 2GeKw6y31V587esvhNY7j+zEgwHToZamaC6l8f42fYwyYBAFvL/1jXRpsFo6gNY50Gl6
 n5QXOndETU0d0Avv8yvtAMQDOenJnOEw53enzwaO8Jn7r+Ula4dVnPKygoFpz04ebqBt
 i0RxBqafVSfqnN0Eshsd08H9l8ItZtkqJ09Bu5PaPH61yPItnIa1mMkSEIM/SKsy6bMF
 6zYvH1h3nJ702lOFPb6bprhwZUzSmeedCLXX+fFugppt7c5kYFEF6nc+wC3OENVGTmw2
 PmzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCkeZZXfR+kh6VT6JZ9i1k9oV475wYyRODxi5PIj8ueojkCjREPO+N5E5XDNouC2Zsumqe3++vyxyFC6CockPt2bQXLYiTs5oAkzNJWSrn
X-Gm-Message-State: AOJu0YxEfs8Ly2RWYIocXUM7IlfYtfBJb7hgYyrAHBti3Jf+rjlVrl+9
 omw68+zTu7CXQMWEax9s3ccMuKG3EgWjt+kVFF/IRm2gI442Wf0O57P/LEdx9TO4KEjOxxhoRt8
 =
X-Google-Smtp-Source: AGHT+IGz6ErWb1LUG7mlPXdbD+sM4Q7AezdgaOEWEZIEH1k0/48uWTqEtCNP9wK/DHfkt+vYJkuOLQ==
X-Received: by 2002:ac8:5e07:0:b0:43a:b542:d1dd with SMTP id
 d75a77b69052e-43fe92cd2e3mr25430971cf.36.1717079658048; 
 Thu, 30 May 2024 07:34:18 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43fb16bed16sm65713991cf.17.2024.05.30.07.34.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 07:34:16 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-43fe3289fc5so306021cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 07:34:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXntSq7IGMRN9zVDbKOqC0OuQ3si4WK8I+E1RqBVEtM4rvJ5z2p45ma3La6nPzl88HRcO0M5m7hZea2gS/LFsxjzOo8baI41OonMa0EcB9n
X-Received: by 2002:a05:622a:544e:b0:43a:b51c:46ca with SMTP id
 d75a77b69052e-43feb5182fdmr2765661cf.29.1717079656252; Thu, 30 May 2024
 07:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org>
 <20240529-edp-panel-drop-v2-1-fcfc457fc8dd@linaro.org>
In-Reply-To: <20240529-edp-panel-drop-v2-1-fcfc457fc8dd@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 May 2024 07:33:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uw+KYQQ2xFLhNdWSW0sNX9uV_zSAVO2uBWY4JEcaO2bA@mail.gmail.com>
Message-ID: <CAD=FV=Uw+KYQQ2xFLhNdWSW0sNX9uV_zSAVO2uBWY4JEcaO2bA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel-edp: add fat warning against adding new
 panel compatibles
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
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

On Tue, May 28, 2024 at 4:52=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add a fat warning against adding new panel compatibles to the panel-edp
> driver. All new users of the eDP panels are supposed to use the generic
> "edp-panel" compatible device on the AUX bus. The remaining compatibles
> are either used by the existing DT or were used previously and are
> retained for backwards compatibility.
>
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 6db277efcbb7..95b25ec67168 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1776,7 +1776,23 @@ static const struct of_device_id platform_of_match=
[] =3D {
>         {
>                 /* Must be first */
>                 .compatible =3D "edp-panel",
> -       }, {
> +       },
> +       /*
> +        * Do not add panels to the list below unless they cannot be hand=
led by
> +        * the generic edp-panel compatible.
> +        *
> +        * The only two valid reasons are:
> +        * - because of the panel issues (e.g. broken EDID or broken
> +        *   identification),
> +        * - because the platform which uses the panel didn't wire up the=
 AUX
> +        *   bus properly.
> +        *
> +        * In all other cases the platform should use the aux-bus and dec=
lare
> +        * the panel using the 'edp-panel' compatible as a device on the =
AUX
> +        * bus. The lack of the aux-bus support is not a valid case. Plat=
forms
> +        * are urged to be converted to declaring panels in a proper way.

I'm still at least slightly confused by the wording. What is "the lack
of the aux-bus support". I guess this is different from the valid
reason of "the platform which uses the panel didn't wire up the AUX
bus properly" but I'm not sure how. Maybe you can explain?

I guess I'd write it like this:

    /*
     * Do not add panels to the list below unless they cannot be handled by
     * the generic edp-panel compatible.
     *
     * The only two valid reasons are:
     * - because of the panel issues (e.g. broken EDID or broken
     *   identification).
     * - because the platform which uses the panel didn't wire up the AUX
     *   bus properly. NOTE that, though this is a marginally valid reason,
     *   some justification needs to be made for why the platform can't
     *   wire up the AUX bus properly.
     *
     * In all other cases the platform should use the aux-bus and declare
     * the panel using the 'edp-panel' compatible as a device on the AUX
     * bus.
     */

What do you think? In any case, it probably doesn't matter much. The
important thing is some sort of warning here telling people not to add
to the table. In that sense:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
