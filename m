Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF62631FEC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 12:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA1610E2AF;
	Mon, 21 Nov 2022 11:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C5710E2AF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 11:11:22 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso12474083wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 03:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TuaUGDgXnCpLOv12BMouwM4UOCrJ0ikAuiiKIwp8g1U=;
 b=y4KKgF18QaAgNAnvvwKab5m1wkiwC3e9zcNV+IuK9OXZe+tNbuQVNvFGLR4hRWX5He
 kB8iilZFgVaUe51BA4yROJ+kSvO3TYp62m4Fi9vZP6iuY5L08/QGWmeYsS9KS06TBiyK
 xJVmf43xN07AFD6OfFPOjkwx6tKDLdqqmYhxZ4L4iV1SSXUPl8+8N3OvWTVLweEKE/dg
 WT7p2W2GB6/GwA+jfV/ntSwClAxsAsCBxWJqfpo/hE+jveKblZA36/wI+VBEvAOxZniO
 pcJYS48iUDDNVei51d8CXtKJ6k2IhRFr9E9vHlge/THdkwFO+PUXVuIbkx3JAXFkam0e
 5vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TuaUGDgXnCpLOv12BMouwM4UOCrJ0ikAuiiKIwp8g1U=;
 b=Ws4LnOF/kT6/JL+EqIB/JbfoflQrIMTpCDGyOqHyUBzITxiJZCdvasqQ+dM/ZDIh99
 QQDtKvcB/ZopCkBCXt5lIUqUDvFloRKDrdU4pnljVsJCwJGz3VF7h0rizxBL5PtKIRUs
 aX2/3c49qzupIh2XiVenKnwJgIEufyNzex9mkdBMaWC15TuGy421NV7ejkhMK+IVyfgn
 QOpzroewfxwpzyALV+vpyi49mH9cTCHV7tbxCyWB+avt0M1lvruFAcFne3DGE84Hi0U0
 5imk3umD6RbnhXjDdpuQhP4W78L6EDN++lM+ymwg0RJtPBjSJttuSjOAo3ntlnaIRfY3
 6mcQ==
X-Gm-Message-State: ANoB5plPKCndsrLOhy3bpucZD2X2crAydNdVujkt1J4JabolQgmqWJxW
 D60bFUyd/R0+5beGhMoRYEtRQw==
X-Google-Smtp-Source: AA0mqf4/URPwCl5Oy5aMSPG2azSdKyv87pmdAci9Q7T+z+ChDsE+5kzfd4s0Mo+L2g5DpI8nlo8S4Q==
X-Received: by 2002:a05:600c:348d:b0:3cf:88d3:5685 with SMTP id
 a13-20020a05600c348d00b003cf88d35685mr5655901wmq.38.1669029080500; 
 Mon, 21 Nov 2022 03:11:20 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b003c5571c27a1sm16645135wmo.32.2022.11.21.03.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 03:11:20 -0800 (PST)
Date: Mon, 21 Nov 2022 11:11:18 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 593/606] backlight: tosa: Convert to i2c's .probe_new()
Message-ID: <Y3tc1hfTpZ0uTLjY@maple.lan>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-594-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-594-uwe@kleine-koenig.org>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:45:27PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
