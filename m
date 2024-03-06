Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DD18743E0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 00:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC1F10ED9C;
	Wed,  6 Mar 2024 23:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LibmSJ7G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCFC10ED7C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 23:29:50 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-690105304b4so1550536d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 15:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709767784; x=1710372584;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NaFmd/1u2c5uMjx4A/ChsNo48SDfCVdtCDWwH1LnNag=;
 b=LibmSJ7GsnOF+q/O9fGeBAWjOaYfJyj/AX3PcPja98QM2SEp5S7WRvghp9zYFFWgr+
 iDwKxKeESVnslLq78BZAPgJ98CkdtoaneB5X8jGdbbkzJdLfsDhjJag3BoY2FkMOaRlt
 /yBgruggUBpMUOvKyi4OSsFwg8p9M9OXD/Rwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709767784; x=1710372584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NaFmd/1u2c5uMjx4A/ChsNo48SDfCVdtCDWwH1LnNag=;
 b=ooF2QE3zG78kk3urNNM9QhE2qZ8oFuGxx7ScSvL9+53HwbsN4Kr8ZO2G10p5/rRxP1
 89kWxtDzO3vSweG6vFoQm9ZrFub/IKvgvUOPiaBW17UjOtri1vTH3P2bSUPv5dx8gEjT
 olW94Gsn7TeufnYYDfieSgYSBEHD647S8qbHQhIELjwTckOkEVHbBnKYiMudTPSulTq6
 JuBMt/H9OHGhyhasPaaupK8ombgaPNKlHP1YzXi0YqX74/fMm9m+9CYAp7BFgVNd3otF
 PgSlGcee82jc+1H4g3TZRIsuOXCjN2/8SC1ymUpNs5LJzzEx2PhKafzGfHNnFy1izeG/
 vEUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPtCps/dRkQL/t6McYRBluMDr0E+cF56+EEyYfaGuChJopikvfpJHo1q91lNXxFvE3k8KC0t7iAD/lbxG/X0Y9bpyr31Kk7RLz+FhDvtfI
X-Gm-Message-State: AOJu0YwI8Kaua6wz3DViiG5NBa0sqPojGk0Bme+2wxyMCWS+2sxHeADH
 m5IuoVGOja1vu0AmXMmyv6ghJwEXPSzw4qnekm4S0QpZchSpadgURDSmyicf5OeMeHPhVsCK6/0
 =
X-Google-Smtp-Source: AGHT+IFWzwgumvK7yFYRIRmc6f842mAxs6woXTzuUgB50d+a5PlOrvxN6ly9EcE/o3ugrj/doJJCCQ==
X-Received: by 2002:ad4:4089:0:b0:690:60e3:2f9a with SMTP id
 l9-20020ad44089000000b0069060e32f9amr6604450qvp.32.1709767784713; 
 Wed, 06 Mar 2024 15:29:44 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 lr9-20020a0562145bc900b006904ca1971esm7628285qvb.42.2024.03.06.15.29.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 15:29:40 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-42ee0c326e8so119111cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 15:29:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWLGOlYnVLC5t/KJg5UNrItMd1OkNlRkcjzUTIQ+ShJ2il4r41O8NRMIivCWmhWWTpwcdrRL1piA6RzIpfy7t+wJz+SzlHCjrinWAVB076d
X-Received: by 2002:a05:622a:64c:b0:42f:a3c:2d47 with SMTP id
 a12-20020a05622a064c00b0042f0a3c2d47mr159395qtb.8.1709767780037; Wed, 06 Mar
 2024 15:29:40 -0800 (PST)
MIME-Version: 1.0
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-3-hsinyi@chromium.org>
In-Reply-To: <20240306200353.1436198-3-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Mar 2024 15:29:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WvvLFN4U5-EewpXEcT-gz0qO+2SrYdEQpC-+s0DBeBUw@mail.gmail.com>
Message-ID: <CAD=FV=WvvLFN4U5-EewpXEcT-gz0qO+2SrYdEQpC-+s0DBeBUw@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] drm/edid: Clean up drm_edid_get_panel_id()
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
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

Hi,

On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> drm_edid_get_panel_id() now just directly call edid_extract_panel_id().
>
> Merge them into one function.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v4->v5: new
> ---
>  drivers/gpu/drm/drm_edid.c | 39 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)

Personally I wouldn't have objected to this being squashed into patch
#1, but I'm also OK as you have it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
