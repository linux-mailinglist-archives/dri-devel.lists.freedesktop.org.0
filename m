Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC39597D781
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 17:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4640010E839;
	Fri, 20 Sep 2024 15:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jz/EuoHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E1E10E839
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 15:33:57 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5365b6bd901so2626993e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726846436; x=1727451236; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nfRSdEyyPP0dQ0p5xGwwdjhrzJv+SRRAK8F5od/ccqQ=;
 b=jz/EuoHrCdlxIZWqGDg7Pp4KVyD/uvqQCue29QhvPep8DNI3FDjv4jLvU5SagbZ+3R
 60PYJmYXcAAv2DB46WtGWsx+NQ2IxJBi8qhFHgZRfUotbw++0BLaNrm9oR82GnCOGFGh
 hN2YY+Va7Fgx3KY3z+QT++d0sr4cPraHbZG65FeSrxgOBrIHKSyWERT8w15e74U1JeyW
 sUAGTAwTr8iET1b4xS3PAjAtrVj6IYJnCQwaFX7Be54Qp9FH4i+E5HC/EREDtwNP9fJR
 TAbBTjiRB8N+JXVCCT8xQT6nT+7mgULqeedQI1MfQ9LIgpKOLPzjbbK84DMBI4SYL2It
 KwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726846436; x=1727451236;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nfRSdEyyPP0dQ0p5xGwwdjhrzJv+SRRAK8F5od/ccqQ=;
 b=NLTbVQ+2qd//pCwsKwQXHiXGnF2UfxcWN+2h0DCoUETUPfuaxOCVSU1vr6iuTSjZMD
 zgTTTJKpAFhCaIvr4h+rxaf2xhSKlDfpiw0FVVFP/ZwQt0clgg5Bx/HDe2oGxvvskS10
 wxvdMi3uQ3V0yzxzwodBFq12BrthdJwRWmSL5GmFPbXI0eFrTNNjYQce9csp8hIknK5c
 itg3UkBJuTaJ3Zbag2BuBHzQlOtG2E66+vYppd2+VG6Naa/OqDfiRM1z1x5pEC0aWokB
 0WoxDfu/uCz6WRq/zfrBSkv+Jaw7oFHS0lG1l/iM9fltKt3FxwRjWyZU+JeoXkq8kUPG
 DKkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOlqffjzTtrJsUQN1LOSsDmmRc5U3o16TKTZvL9dPEhWrVdH0IiQ6CuGdQ1UoGiQBUV33MplL2fLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1bnqsB7MavjfaLt9zizIgYHfTWhhrYGj7dp+tufCThGY9lRsP
 ufhD5phw6uXK3HEugWi/JF22CtgsekeKYJbLgbwiGtcWKFSmM0j9qYSS2JspgH8=
X-Google-Smtp-Source: AGHT+IGr0TDWtOdEFGU71FmO+FDqpRt6RiquTpfeC5Qvxd6F7KCQOX2rz5F7/wD3huV4BCuu3doStg==
X-Received: by 2002:a05:6512:220f:b0:530:aa4b:81c7 with SMTP id
 2adb3069b0e04-536ad3d5526mr1683832e87.59.1726846435720; 
 Fri, 20 Sep 2024 08:33:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a89f2sm2188989e87.240.2024.09.20.08.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 08:33:54 -0700 (PDT)
Date: Fri, 20 Sep 2024 18:33:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>
Subject: Re: [PATCH v2 2/2] drm/bridge: it6505: Add MCCS support
Message-ID: <zdfbyhr4td3blv4bnofrihjorah6n3aroy75uwwonhlrvimpl6@2dlrlbhficbi>
References: <20240920082451.9240-1-Hermes.Wu@ite.com.tw>
 <20240920082451.9240-7-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920082451.9240-7-Hermes.Wu@ite.com.tw>
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

On Fri, Sep 20, 2024 at 04:24:51PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> add AUX-I2C functionality to support MCCS
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 209 ++++++++++++++++++++++++++--
>  1 file changed, 200 insertions(+), 9 deletions(-)
> 
All my comments from v1 (except for the Changes-Id trailers) seem to
apply as well.

-- 
With best wishes
Dmitry
