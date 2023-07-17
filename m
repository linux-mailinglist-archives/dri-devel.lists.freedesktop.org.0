Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0089755EA3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D08A10E20F;
	Mon, 17 Jul 2023 08:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1350B10E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:39:41 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5746cso43033685e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 01:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689583180; x=1692175180;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GvXy/QD/Pk1wVQOh6YjaEGgI2E+g61IPu7wSGMnkliU=;
 b=L7QarnmjyFnGGDP+dtzUQ+m9EkC03vr9oMUyRD+RKckUnMK92aQ+1hzqssBvr/VS8t
 ybG4szpchIROTfFkul5BgUelxLI6lLkqBdpxAQTRPETqHAP2NehvpjUXL880COyw6pqw
 3Npn5/xMcQn/CD7SxVZqrG+u3uioULXDPh/wgUR4bvGzos0vymTWM4kwgTixw3kFmGA1
 LnOlykAitHhn2wyaqgUP7mMN2CpUB7Hg6K3uG/SfXntBPe+F9LUl5u6h9FbOzIyd2OeN
 HyUlKZTruFFbwELpiucIaKZpq4Ix7WZds0o+xJ6g6/XO6mrgq7EfL+I6fjLY0ID2mdUc
 Z0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689583180; x=1692175180;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvXy/QD/Pk1wVQOh6YjaEGgI2E+g61IPu7wSGMnkliU=;
 b=Vy2WaSsMlXjYMA/WM48dgcm78WBoRvvUDhXVJF4AlZnEDFjZr0d1T883S78nNPFKzq
 TRrwxhD2pxsUOxfAqf0eOrGphPF+OC1+UubxPcp1hLMZQD9s2i9XWeUzJMc8F0SUO3bT
 1KacWi8sC0h78sPicxObnjxp8oIFJE4xOPcnlY+xzQE57Jgvs4cK20DWnYhOF8EV6Dch
 /h59SERb88WtxnKpbzogRe4r7YqmMdy5YR6UcM8srehV12oRFKGmjME8ONzJKbFrISjr
 V0S66Y1nZ9QUxvVnXHf3HsB67wU2VfV/COjHj4g1sQNEydA1O21S1GnDfYQP452u6bFG
 UVXg==
X-Gm-Message-State: ABy/qLa675AhKt2n0Xu+KEpId4WC7cc5BFTKNn5+AUra8CKBehzdB8Hi
 NwbtmwkKwB8a8q6aDhMz+gusyA==
X-Google-Smtp-Source: APBJJlHgZ4E1mKTLXPhXfFVpcxT5qb27bMkUkVf2TsNNUrMgy5l8jHfpRhxNmjMn8BqDmr9/iS7uzQ==
X-Received: by 2002:a7b:c4c7:0:b0:3fb:40ff:1cba with SMTP id
 g7-20020a7bc4c7000000b003fb40ff1cbamr9475089wmk.6.1689583180223; 
 Mon, 17 Jul 2023 01:39:40 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a5d55c6000000b003145521f4e5sm18523160wrw.116.2023.07.17.01.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 01:39:39 -0700 (PDT)
Date: Mon, 17 Jul 2023 09:39:38 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH 2/2] backlight: lp855x: Catch errors when changing
 brightness
Message-ID: <20230717083938.GB3448956@aspen.lan>
References: <20230714121440.7717-1-aweber.kernel@gmail.com>
 <20230714121440.7717-3-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714121440.7717-3-aweber.kernel@gmail.com>
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
 ~postmarketos/upstreaming@lists.sr.ht,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 02:14:40PM +0200, Artur Weber wrote:
> The lp855x_bl_update_status function's return type is int, but
> it always returns 0, without checking for the results of the
> write_byte/pwm_ctrl functions called within.
>
> Make this function return the return values of the functions it
> calls, and modify the lp855x_pwm_ctrl function to return errors.
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
