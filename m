Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE75820F6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 09:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83384BDB25;
	Wed, 27 Jul 2022 07:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DA4A9B8B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 07:21:09 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id b11so29897758eju.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 00:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=inuhxhRgSLiaO/D3+xgLkupotqlEwDt1uyX9xC3yyyg=;
 b=B8jLDhFLUdhz+1fLSo4JRvPspU28WiIRO8GkExKbLJW7gwthWuDVLBkCTqI83/toxl
 rprHv7/tZS7kT/QYUxWnlQCRxXM66V0Qp/7qDfJ9q6O3ESTLUlLyuPSQLX0C/YwlHS/l
 NcDs69qJtJx2iFa6u4odIP6rDA29Fp8mTOhq2AgxlRpqls4JFyFq0sWRYCs+VM4/8gLP
 IaXZhap2xDJg1B4m8Ql2Jk1q4m6yhJfPOjwz4/YfQAZdCI69VETyrTepuEZtf+7rON69
 KhrGYTournT+5YkZDX6uSDzxVN9d/Y20Z+I9DuTn5fHhTpjHfC9CozSd32EiNlN79xOV
 E+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=inuhxhRgSLiaO/D3+xgLkupotqlEwDt1uyX9xC3yyyg=;
 b=4qlErBazh9z+JXR58sCNof7sewOKVwybi0m+4Gl5zwUXEyM9y8wVpKp/SJmQg6JpK9
 QFarRMmyXM0sB1SD53ETntNUhY9lSRazlYn6V13C7tImXLm1FXNSJWAzJUL5UuR7nY02
 3/zubXqKbc7wrOC8Yq5iWrFqqinpz5ciIa3ioiHskecNuNGnYueNlIeV0xhB3l0xt+Yy
 ZDTLt1GrVJZInQ4bx/qYMIpXHXmBShuIt5VOqX3/SZS1vlrWopSY/2mQ/3hAr/OQKwBf
 o7qst6Win/xhX5o0Ru4nsgDDNdIiTxohrPM6W3wdkg5YZUgNnKTHxGKK4+PvymgsUtee
 yzeA==
X-Gm-Message-State: AJIora9Xaljrq3jLG2vwW9XqCP3BXacePBUV+SEK2w9GvT8rd78u+wpJ
 VM+lIpa/sPmZGJIgeMA5wItTECYPrY+6Qbwxri6euw==
X-Google-Smtp-Source: AGRyM1vHHJboE7ofe/wMfmxcvLoP2P7J8TG5IX1QyGI07RVlhMzztC9Vb9LB4jVcL+sdPvNmqwaDl680SrHnomHUZBo=
X-Received: by 2002:a17:906:5a61:b0:72b:1468:7fac with SMTP id
 my33-20020a1709065a6100b0072b14687facmr16585134ejc.440.1658906467832; Wed, 27
 Jul 2022 00:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220725151703.319939-1-marex@denx.de>
 <20220725151703.319939-2-marex@denx.de>
In-Reply-To: <20220725151703.319939-2-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 27 Jul 2022 09:20:56 +0200
Message-ID: <CACRpkdZWD93qvPhUrq+WFTr2uJ04wDQa4Oog9rmphFvJ-2B4iw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel/panel-sitronix-st7701: Add Densitron
 DMT028VGHMCMI-1A TFT
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, robert.foss@linaro.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 25, 2022 at 5:17 PM Marek Vasut <marex@denx.de> wrote:

> Add support for Densitron DMT028VGHMCMI-1A TFT matrix into this driver.
> This is a DSI-attached 480x640 2.83 inch panel.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>

Patch applied to drm-next!

Yours,
Linus Walleij
