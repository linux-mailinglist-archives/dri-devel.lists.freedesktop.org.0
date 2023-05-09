Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7D26FC7D4
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 15:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A7110E13F;
	Tue,  9 May 2023 13:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC8310E154
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 13:27:41 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f417ea5252so23723265e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 06:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683638858; x=1686230858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YuQ2FBeCRoqgngylaRdOh7aqiqlvdZtnW5rbAbkcgXI=;
 b=AH1IzWoKD1GbxcF9ng7uQsTL872w02GkxK1Q77af/6B74iG8+N4tcxgxkyb7OF7cca
 Un3CHwFvJCOe9jANPaUvgVp3z6qPeSkMv78Q31nEc+DzNcFSqduVfxqpERiiTgbIxEiL
 uYMUNm2pcXy7AVAl7+aOS38etpxSM74rgG1X9Vn2TIAwXNuN0nU4CXYcCbL+WmYruQEi
 apXr7BQg6zkxzn3spKQUkefPlrDVExBq5LPRdpsYJdRwqgi+PMhrS6V0tRCETTl07OO5
 LrlqLsPxnoVZa2FKaXipGlrepsiGlXi0YGBODqPF6rQGfvwQW0ALnAAUm7XW8EftFs0Y
 qQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683638858; x=1686230858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YuQ2FBeCRoqgngylaRdOh7aqiqlvdZtnW5rbAbkcgXI=;
 b=iVz1w+vVWJtWH1kyGKjyautGB36M9hmGlEYIBLtIb3v1FECQ3cdL2vJCC0RaUyYn3B
 /pS6KFPOpG66C8pNOoIEwtHTUkQnM4Pf/3Omo7pw+fEw/I1WUoON+R+0TLa00jM82cMm
 etRVF4Pw/Qd7Y2y3MMbwhDaddg7CGpPSZyQk8ALwvvdafbg0FaJoWyziH9r52VvnbQRy
 2PLN11G7UCrfCCDdHyjqZXOX+APYz9s3VrtAJkd4D739wSnnKSKp5Jdkbc73rHpBnB+T
 gmywnctDuRQooMQv9Th/b1ev9U6MKG2uq1iyFOf6bJvWbK3z6WHiL/waYxuTiyaXSuzj
 rUow==
X-Gm-Message-State: AC+VfDzB2DLsBw8nfS4BE4rEj9o5owrXnpyYOmRj64GrdrUiX58u2dpp
 XdTvpk1771hywc1kCXtegCimjg==
X-Google-Smtp-Source: ACHHUZ60LQ2w7jDdb1KfIt1LYeUDMCEJrCrpzMKg5XLc7SVJ/RpGIRMx0wqXtIAXfShUhg+fn2JRHA==
X-Received: by 2002:adf:f491:0:b0:306:31b7:abe4 with SMTP id
 l17-20020adff491000000b0030631b7abe4mr11390420wro.14.1683638857874; 
 Tue, 09 May 2023 06:27:37 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b00306344eaebfsm14415375wrx.28.2023.05.09.06.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 06:27:37 -0700 (PDT)
Date: Tue, 9 May 2023 14:27:35 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Maximilian Weigand <mweigand2017@gmail.com>
Subject: Re: [PATCH v1] backlight: lm3630a: turn off both led strings when
 display is blank
Message-ID: <20230509132735.GA31274@aspen.lan>
References: <20230505185752.969476-1-mweigand2017@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505185752.969476-1-mweigand2017@gmail.com>
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
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Maximilian Weigand <mweigand@mweigand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 08:57:52PM +0200, Maximilian Weigand wrote:
> From: Maximilian Weigand <mweigand@mweigand.net>
>
> Use display_is_blank() to determine if the led strings should be turned

Shouldn't this be backlight_is_blank()?


> off in the update_status() functions of both strings.

Once the description is fixed this is:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
