Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A962D7CB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 11:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD2010E5E1;
	Thu, 17 Nov 2022 10:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCF410E5EC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 10:14:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z14so2968772wrn.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 02:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MaF6TdIwvoDg+ZEHPJVwXdUwTO/7Y9QkB06DBJdBjM8=;
 b=pRuAI1LU+o4rXBUdzTkC7c0hDFbXI/dq1iWDFGOCK2ZQiWLkCd5cKhF64eKxtupmJb
 hb84lewdmBlEld/dJTJVQXRmmY33maZkM2wrd3l8A61gxeLwUV0dPvEvkAbLc6t9wpSN
 fEfGQSqqwnnRFyodhweKmFhxidLx8TwCaGYxE3LHcJ7ISSI6HzvDFaavN5llnDCBf7vF
 SWa4RPjrOjKICU5NBi/SNGn0YpQGFpAwSdmtTPjFR13ZZz/G/GSPAeO/6PFlgznHQZLw
 eC5SHdDKXNBTol5P+UPYfG8EsioWgoXZIUfcQ/tJhoDJ7SuitkiStNlVXhN0ebf2l0TW
 d2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MaF6TdIwvoDg+ZEHPJVwXdUwTO/7Y9QkB06DBJdBjM8=;
 b=eLAEsQvritdWBYQHUQwrJMwP82b1j0/KWqpIPT1lqsriZcBmx6qOBn3GKoBNnCQ+GO
 VD2r5X9MkXvZG42O8Qa/ifKzZiHzrPz3DIFJg8BAhcgyWxpUop4ELnRQ7IcHp5v2RQtM
 CjaPDhMtEyXhSt39aQ1ViDaD1sKyebYPRr1J8JuRqWvFtu3SK3GF3dz7EVDM6oWXX/lw
 ProIfELCMt69oUa8IcOm2RVBhnFGZqK3xmVFEnQEvwHfoJcxU2HLIusJLhuBi00MqLcR
 i1541GZez0y6EYZpqCgbWamqzTOXv4bCa82htP3nyhFKfiUNOCv5603NbfodnxldSxDa
 lOKw==
X-Gm-Message-State: ANoB5pmOP29NqGgiphWvaU3UQjuNmUNQRHVzTbXG/d1rnLrgOFLjkTRl
 rCHPQYAZNfwL5hz2ZZlkepuEuw==
X-Google-Smtp-Source: AA0mqf738mjZ0nMHMQjX6CWSzQAyQe55ylIoQN6dVAjQQr6pMcCqtjt9ZNGz2lB4o0P+ba/ltfPTmA==
X-Received: by 2002:adf:e2ca:0:b0:22e:4ac2:aaa5 with SMTP id
 d10-20020adfe2ca000000b0022e4ac2aaa5mr1006086wrj.455.1668680043661; 
 Thu, 17 Nov 2022 02:14:03 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 t13-20020a05600c198d00b003cf75f56105sm934693wmq.41.2022.11.17.02.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 02:14:03 -0800 (PST)
Date: Thu, 17 Nov 2022 10:14:01 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: Drop support for legacy PWM probing
Message-ID: <Y3YJaYx06Jzrs/Ej@maple.lan>
References: <20221117072151.3789691-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221117072151.3789691-1-u.kleine-koenig@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 08:21:51AM +0100, Uwe Kleine-König wrote:
> There is no in-tree user left which relies on legacy probing. So drop
> support for it which removes another user of the deprecated
> pwm_request() function.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I have to take the "no in-tree user" on faith since I'm not familiar
enough with PWM history to check that. However from a backlight
point-of-view it looks like a nice tidy up:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
