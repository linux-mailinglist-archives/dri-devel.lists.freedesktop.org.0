Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1216B0691
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 13:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6927410E121;
	Wed,  8 Mar 2023 12:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C82E10E121
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 12:04:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so1123739wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 04:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678277069;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=amflx+MPu/55qREv7D1gpSWbJ6NWDsdR+AZRDR7ovnE=;
 b=MXXuoAJ25BhikwDMJMbsOMMSMTpkbh236/a+M7b/jvA/yI2WL8SKcnJseSiiTCATdv
 ygqlltiWCufIHuCEJMDnUjiNuXT+L46Bjff6zQncWfRMPoJRqeq88lx1I7fznBoo9f/C
 5i+6ag5xC/vwCsuF5Llp00jNeH+zhHkBKjfiDq4sBIWepdUjQrCx9R1Y7oD5NklTCbmJ
 uu9IEi6ZiZGowy4ePxMiVGKFpRPZwOhe8F5App/XMXzVlJkaC8zDAigwkr4vtC/8q2OT
 54Gj6NJp2shY2QwYlupJrlElYNiF9bzE5fPZf015nbNbfc7C+vs4RmM1/yFmN77Rg97r
 aZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678277069;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=amflx+MPu/55qREv7D1gpSWbJ6NWDsdR+AZRDR7ovnE=;
 b=qkU7caBGnGIaPOYWq7G1xi3xcLHOVg8jit+pYSw+BDBMI90ryWFKgxyE77kHnLx+FP
 r86h2nbmlUYUuUOq+Zi/8QNa7yu8Jbt1s5AvZKx+qNBljoaGD+7jJ9NkACCzEQ6G3Dd+
 85nxhlxzfqI8A93CEjtmVUe5Z4rdJEa2p7V5cYyRwp1lI4bAKpo3mDtXj6OSiWfcs1Eu
 giGgEjLPJi+MeqLVFzzQZ5X+J40oq1odi/qJibJeVbrzhvgRc7H3nU/u5+ynQ6eXjtUO
 3AAWCYtTS4isjCaFjB2+aQHwJfzKOAiFEASNKRUeylPC34SED628vlBUt26XBpbI8sEV
 krVA==
X-Gm-Message-State: AO0yUKXOm+lTf6j+UWMgFIocUN+nBKoH8D6QBCqbJem5apSX4Eute8We
 qSMXwWIo1zS9CG4IEhkYFZl1gQ==
X-Google-Smtp-Source: AK7set+BQHFboi4QXgAYqrYtuSpR1zmoAeIuRNLA1tt4tiD/NZOIeUje28/bcJ5vKzbXewtLlkt13Q==
X-Received: by 2002:a05:600c:3512:b0:3ea:e554:7815 with SMTP id
 h18-20020a05600c351200b003eae5547815mr16957712wmq.9.1678277068004; 
 Wed, 08 Mar 2023 04:04:28 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 x21-20020a05600c189500b003e71a6be279sm15336997wmp.37.2023.03.08.04.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 04:04:27 -0800 (PST)
Date: Wed, 8 Mar 2023 12:04:25 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/13] backlight: Convert to platform remove callback
 returning void
Message-ID: <20230308120425.GA6174@aspen.lan>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 08:39:32AM +0100, Uwe Kleine-König wrote:
> Uwe Kleine-König (13):
>   backlight: aat2870_bl: Convert to platform remove callback returning
>     void
>   backlight: adp5520_bl: Convert to platform remove callback returning
>     void
>   backlight: cr_bllcd: Convert to platform remove callback returning
>     void
>   backlight: da9052_bl: Convert to platform remove callback returning
>     void
>   backlight: hp680_bl: Convert to platform remove callback returning
>     void
>   backlight: led_bl: Convert to platform remove callback returning void
>   backlight: lm3533_bl: Convert to platform remove callback returning
>     void
>   backlight: lp8788_bl: Convert to platform remove callback returning
>     void
>   backlight: mt6370-backlight: Convert to platform remove callback
>     returning void
>   backlight: pwm_bl: Convert to platform remove callback returning void
>   backlight: qcom-wled: Convert to platform remove callback returning
>     void
>   backlight: rt4831-backlight: Convert to platform remove callback
>     returning void
>   backlight: sky81452-backlight: Convert to platform remove callback
>     returning void

Whole series is:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Thanks!
