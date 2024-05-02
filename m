Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536B48B963B
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 10:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898CE10EEAA;
	Thu,  2 May 2024 08:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZDz20YGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE20C10EEAA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 08:15:22 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-61be4b98766so36287897b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 01:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714637722; x=1715242522; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ksrXWA++hq4uo5b14CGOhlwMbP35YcH8qiFN3VUhLdo=;
 b=ZDz20YGdz/mvDxcMuxXui59fJGTTCvr3x35oQ9/OLIsnbo0ES1R/m9/E4NSWEaCA02
 bf0zqIuFqQALpq6RNsmRsDZnnSDTKYoR87RAtQ3Wljiw+meT0xdPIiN5iuhCXFyitVW3
 ZlIZ022hcDGLXDy2JC8qizM0Ry7pR+ftvu6G1Wx9nTygp8MJh2YW5dUKtajPgwwqtXtY
 worq/BJzAKA2XHY8cF1QFtMltK8hD/b8RtO9tWQz31rceIlrxve1mqLJjjSsc58f8Cbp
 okQ/b+v1qBvGBkVi/6//znHk/8MH6jYQMqlkhGirH+o1d/cCEQmP0YULB/kO1qvkx63O
 aN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714637722; x=1715242522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ksrXWA++hq4uo5b14CGOhlwMbP35YcH8qiFN3VUhLdo=;
 b=w356x/uWyTnREBzeBANF+r7if4j3DGl47bsfHn4b1G6AwhsaAtIt+k2SwWxFGcyJrc
 b0lu0b+hP2xjrzmhAxJRMNaGOXTNKOB7pTIC3bDqJen3t5RDKKvmTGDkYZBvDVjwsLVr
 IYvWfQfAVmQjrzodqyM9pPkJ4GN5WXZrmvPTXYcZKVvx1UfFJoDWJPre1M+t73Ci7wMU
 H0gE4YMhGKfWNLOSgOssc32D5jSHcOKHsQv24+9fH9AB14kr6IcvgUMvIb+YTL3CnOzL
 GIxhbNguntbBe9XypubftTxzQ3U8lLxe/diX6HrDJXKqMsuPc7MZci1UEvQJ96IfRCts
 Mlgw==
X-Gm-Message-State: AOJu0YzBwgoypsdCWkl/J1f/TjaTkJ1l5P90Tml5d4QmNk2oOr0HYn16
 4IUr8rMJUswMSko41LaHFjqkXkvewSQs87BHG+TPSx+haGmgQLtXo1Sw4BF4oSEGXtBAdRaHcaH
 hq8bqJlVi2Tea2pkEipbRVpMDB59CITZn8H6lWw==
X-Google-Smtp-Source: AGHT+IGX8v+8VmddJzrDHjwUwXISt1o62/4S2TF455DujQU9cLxV5tMcWCQoLUuneneXH3ceSHMKHYls/F7UcN1WCOo=
X-Received: by 2002:a05:690c:6d93:b0:61a:c4a3:8a5c with SMTP id
 iw19-20020a05690c6d9300b0061ac4a38a5cmr5471921ywb.44.1714637719772; Thu, 02
 May 2024 01:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.1.I30fa4c8348ea316c886ef8a522a52fed617f930d@changeid>
In-Reply-To: <20240501084109.v3.1.I30fa4c8348ea316c886ef8a522a52fed617f930d@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 May 2024 10:15:08 +0200
Message-ID: <CACRpkdZOyK=CSG2C64ELXXiieHUd_BaHBBR=iLrG6moYDUTC4w@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] drm/mipi-dsi: Fix theoretical int overflow in
 mipi_dsi_dcs_write_seq()
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, 
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Joel Selvaraj <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Wed, May 1, 2024 at 5:43=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:

> The mipi_dsi_dcs_write_seq() macro makes a call to
> mipi_dsi_dcs_write_buffer() which returns a type ssize_t. The macro
> then stores it in an int and checks to see if it's negative. This
> could theoretically be a problem if "ssize_t" is larger than "int".
>
> To see the issue, imagine that "ssize_t" is 32-bits and "int" is
> 16-bits, you could see a problem if there was some code out there that
> looked like:
>
>   mipi_dsi_dcs_write_seq(dsi, cmd, <32767 bytes as arguments>);
>
> ...since we'd get back that 32768 bytes were transferred and 32768
> stored in a 16-bit int would look negative.
>
> Though there are no callsites where we'd actually hit this (even if
> "int" was only 16-bit), it's cleaner to make the types match so let's
> fix it.
>
> Fixes: 2a9e9daf7523 ("drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macr=
o")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

All right! Nice work.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
