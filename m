Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B35C87C060
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 16:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F9B10FAC5;
	Thu, 14 Mar 2024 15:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Um4rAkSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4361510FAC5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 15:35:38 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7884114feb8so42859685a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710430534; x=1711035334;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dd+EVORm9S4/nMKBvY+MY3YVPrA2LiyU3GMnNyIkvV8=;
 b=Um4rAkSRUjGBF/PL0hGDZk+PnnoRsAeKI64cRmly9Ej/RmS3qWlpIeEPcpTPD15Ttl
 CZ1ZcTepi91n6uZ6qLNR1m6OS48jGHZmAWsH2G+mNU5qfpnxW8jDedDLBjFJcBBvPJUJ
 FHixW0OnF7/RJcLtfYb8lhW/DbUO01rM5KXtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710430534; x=1711035334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dd+EVORm9S4/nMKBvY+MY3YVPrA2LiyU3GMnNyIkvV8=;
 b=ZINGFso9EI8SduxLRP475ZKibPYU5rZy/IXVKcOCL3TEZhUZASc8SSZBXqWDGGmjcw
 rPqxnr2XCFiaskZB9xAeL4QnZg0U0ppzP6q65dvToFnHl/JwxH1N9t71GlM0kU8jW/Zw
 VvQkzJtaLISLdMoghdOsNYknC8St+6EftwGircDSouwtgpYPDCvKE+Et2ct3QG8i/1eq
 UyCi1pwdmf7WANQiiX3I1kcfpG9wuE9FdPvL89st204dDTB9YUUrszGF+Xkeu7zWAXDZ
 ocupop1Qpskya0gMgfvvZ9zE3YIojEeuc+VCPugTYy1NoVwL07R43l0VuULc5ebp9brr
 vAPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7snun+KUp3drDcapE3pOtZ9dh3K4SoXDX2OVGWa8rpLS89O4HXeGASXuNdCvmie1lTF2YA5dwEWrPWtdAmpueX7ttbuphdMt2QpY6Z5yV
X-Gm-Message-State: AOJu0Yy5vc/QKNM7U3xGXpEC6YkqIn69emWFBmC8QzZRRkoZIyegDu2E
 24qX8rG+PMuBTB+PWV/TZ7z8cXgDZpH9VGb4f/99Lr/YWrC1pyU91sLrGcsO+w3dNZHm4ubjfJJ
 sAQ==
X-Google-Smtp-Source: AGHT+IEVqgnGLlF13krE1LQKEz61h9WbYzJV3CeJ873GU//AT0LZ0EteqMqrKuMbI3j7MFXQC0FHiQ==
X-Received: by 2002:a05:620a:667:b0:788:7482:ff54 with SMTP id
 a7-20020a05620a066700b007887482ff54mr2147018qkh.72.1710430534146; 
 Thu, 14 Mar 2024 08:35:34 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 o6-20020ac841c6000000b0042ef9768d15sm890508qtm.13.2024.03.14.08.35.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 08:35:33 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-428405a0205so338811cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 08:35:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCULSKJZU3ww7CxMB6mkboZ6oVAp5vmIiuWap0iH+IkMPopjaSqqiloI36fiwA676pfSjBo7rwtKKawgWchaVJOsOzQSD3fUrnM9E8Vx6iyq
X-Received: by 2002:a05:622a:1706:b0:42f:a3c:2d53 with SMTP id
 h6-20020a05622a170600b0042f0a3c2d53mr379616qtk.20.1710430532560; Thu, 14 Mar
 2024 08:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240307230653.1807557-1-hsinyi@chromium.org>
In-Reply-To: <20240307230653.1807557-1-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Mar 2024 08:35:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLs0To3=SKkTdEXyoF=OD55PibpzmEMCvELnrCH+3okw@mail.gmail.com>
Message-ID: <CAD=FV=VLs0To3=SKkTdEXyoF=OD55PibpzmEMCvELnrCH+3okw@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Match panel with identity
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

On Thu, Mar 7, 2024 at 3:07=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> This series is a follow up for 1a5e81de180e ("Revert "drm/panel-edp: Add
> auo_b116xa3_mode""). It's found that 2 different AUO panels use the same
> product id. One of them requires an overridden mode, while the other shou=
ld
> use the mode directly from edid.
>
> Match the panel for identity (id and name). If not found, fallback to mat=
ch
> id.
>
> v1: https://lore.kernel.org/lkml/20240223223958.3887423-1-hsinyi@chromium=
.org
> v2: https://lore.kernel.org/lkml/20240228011133.1238439-1-hsinyi@chromium=
.org
> v3: https://lore.kernel.org/lkml/20240304195214.14563-1-hsinyi@chromium.o=
rg
> v4: https://lore.kernel.org/lkml/20240306004347.974304-1-hsinyi@chromium.=
org/
> v5: https://lore.kernel.org/lkml/20240306200353.1436198-1-hsinyi@chromium=
.org/
>
> Hsin-Yi Wang (5):
>   drm_edid: Add a function to get EDID base block
>   drm/edid: Add a function to match EDID with identity
>   drm/edid: Match edid quirks with identity
>   drm/panel-edp: Match edp_panels with panel identity
>   drm/panel-edp: Fix AUO 0x405c panel naming and add a variant
>
>  drivers/gpu/drm/drm_edid.c        | 147 +++++++++++++++++++++++-------
>  drivers/gpu/drm/panel/panel-edp.c |  73 ++++++++++-----
>  include/drm/drm_edid.h            |  12 ++-
>  3 files changed, 177 insertions(+), 55 deletions(-)

As talked about in response to patch #2 [1], series has been pushed to
drm-misc-next:

ca3c7819499e drm/panel-edp: Fix AUO 0x405c panel naming and add a variant
bf201127c1b8 drm/panel-edp: Match edp_panels with panel identity
7ff53c2f77f2 drm/edid: Match edid quirks with identity
6e3fdedcf0bc drm/edid: Add a function to match EDID with identity
a0b39da11618 drm_edid: Add a function to get EDID base block

[1] https://lore.kernel.org/r/CAD=3DFV=3DVsTq_Yy14n5Ygbxqn4pnguG3wC2AQforP8=
vdX-Wgn0Dw@mail.gmail.com
