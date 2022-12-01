Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E263F42E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34C510E12D;
	Thu,  1 Dec 2022 15:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC7710E12D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:37:55 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id s12so2860560edd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 07:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qs63CknEsiv/WVfdwhEf+CjJpYFuCYS7MFFgd+vKinI=;
 b=S5Cph6OJnAgWEqs4wshrH9YtIgA9gzbuit6FFWjRz5kQkGt/lnkopP+J02/qQQf6N/
 I8Rg81mjT6pSpWVksuoQEc7iStoxnWkcplJhRXI+4UjVA9A6yboKWZX/vvcS7W8GxPnn
 o/lcQs66XO4njeb4jo90uhC/oe6GRw0VCvzH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qs63CknEsiv/WVfdwhEf+CjJpYFuCYS7MFFgd+vKinI=;
 b=iFwENlS/B9N1ACKHWbhCgUbppb8/EeGkqy1zv103shebZ3GTXs7nKf9J8pvDt0LAPP
 NKy98ErLcBnA2RBNV94dISI0n8Tnr7QmYJo1XLb/66wkSaEt4NnuLVT+VPJqohhg4wqC
 wiIx3K5ZUEuKJMBRkVCfnfyK1Fw3LvsvujigqKhiilFjP3zta85tzDZF7gEtIoRoYVi1
 KneI0Xx/g4rJ7yPwSQ59McEHNbMT9Cm5SagZQTlIsGZ+f8agNPeuNC7bYyRbRxyl1whV
 Y7S0MjfaTnZda0V5f2731MsIuPgaCSR0t6V2JO2PMA34Yh+l/0EHUfC06c7ssch2Accz
 CI3g==
X-Gm-Message-State: ANoB5pmTYwooEN1SRtXM2H9eZ9t1IBHtaTK4MvHSMRUZpGkU0xNuim3O
 /wa02y4atsdh13/IrbDFyE2puGEg0bTaDzrt
X-Google-Smtp-Source: AA0mqf5Ooi2EMQypCKAx3IRALR0TIcn0n4z8LSRQ35KIKy9yNEh2HmGre2I2K1dMqkuiDv/WJueR2A==
X-Received: by 2002:a05:6402:146:b0:46a:c132:3e23 with SMTP id
 s6-20020a056402014600b0046ac1323e23mr6287155edu.133.1669909073439; 
 Thu, 01 Dec 2022 07:37:53 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 km9-20020a1709079a8900b0078b83968ad4sm1910080ejc.24.2022.12.01.07.37.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 07:37:52 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so4199412wmb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 07:37:52 -0800 (PST)
X-Received: by 2002:a05:600c:1e12:b0:3cf:9ad3:a20e with SMTP id
 ay18-20020a05600c1e1200b003cf9ad3a20emr38995897wmb.151.1669909071906; Thu, 01
 Dec 2022 07:37:51 -0800 (PST)
MIME-Version: 1.0
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-4-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221130152148.2769768-4-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Dec 2022 07:37:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uoy6fg2qDeU-Zz+3UhVdWEQzf9XWFrZzmoUyJ4=_U3VA@mail.gmail.com>
Message-ID: <CAD=FV=Uoy6fg2qDeU-Zz+3UhVdWEQzf9XWFrZzmoUyJ4=_U3VA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] drm/bridge: ti-sn65dsi86: Propagate errors in
 .get_state() to the caller
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Nov 30, 2022 at 7:22 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> .get_state() can return an error indication. Make use of it to propagate
> failing hardware accesses.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Douglas Anderson <dianders@chromium.org>
