Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0022631DF1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 11:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A877510E1A4;
	Mon, 21 Nov 2022 10:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56A310E1CD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 10:14:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso8662172wmo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 02:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5Dzbdx+YB/boCMO64dCfkzauhQz7NXTFwUFa4JU5m/I=;
 b=qhVVdWUoLbDIiuG/gwGKsCTx8p5RpzzYtUJp/Bg6xnf6S9Oe2ocd9NEPLVpdpfy9tu
 e4XdLEF6ETSp4sCmqb2KeFldyhvQC9EYRzjzA858QRJWFpgygD5RHYzPcbhgFpemPm4P
 xDPvVr6uctICfBhmjJwJMYBqHiqoDsSJijAZiwaSd6ORt5tckHuXqS2Gf6BKNnHtg8CD
 VOA8mLAF7A7HUrKwAqLU2DV4TEE60NJw4WjryhHuAcqqzkmG0EJlhRBUnxqIOjsPDNn7
 c/poaTMOgAaW9uceXs/2Tcgp22Fa7kyat5nUOuzyIFI5SJll8Kngx2ztNjHwWWUHOukk
 L4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Dzbdx+YB/boCMO64dCfkzauhQz7NXTFwUFa4JU5m/I=;
 b=R0gpu1UNU6zCj/JLM9Lx/lk6dpwRvUDSAH77fUZPFan+u14VgzgGmW9RhF23R6jxAk
 2vwNln7657CeTdfyJqD5xXh6bx1Tm8GMCyj7ILER0c8+hHeZoph2RrWmjY/hozrlTabt
 56quH8gZVeMwCcaUJBlhBPHaXy3RwJGcehpYLVRey+6HNuB0fftKdwwfswKYy10qdeW0
 bFtE/HaiIvZLtrDJaxVj65NmfbGILfOP1pqiy9ICcK3VqmyoqwwPr8IMwwb7O9/Gobfe
 a3pxxOT58WLxw2Si+FQ9o2ldjuhrna06CwG/wDoPtA1s3/wT54+w6RzTQj2YRpxZzwL0
 RTng==
X-Gm-Message-State: ANoB5pnOo9TQQZVZMHTbFu7iEC1VcajbIAdMuskwEIvthT7Rxv37aOqH
 Xdv4D1W/bhbi7vu1l1CbhDwZ/g==
X-Google-Smtp-Source: AA0mqf4mZ3vHBYk5iRMjwVfb91H1TAzjZF28Di5vZlwZDO5WrJ4yqKAzbSCZU0JmtUpvWsi6sqMjZQ==
X-Received: by 2002:a1c:c918:0:b0:3cf:f2aa:3dc2 with SMTP id
 f24-20020a1cc918000000b003cff2aa3dc2mr2879921wmb.175.1669025662121; 
 Mon, 21 Nov 2022 02:14:22 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 l32-20020a05600c1d2000b003cfbbd54178sm27381570wms.2.2022.11.21.02.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 02:14:21 -0800 (PST)
Date: Mon, 21 Nov 2022 10:14:19 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 585/606] backlight: adp8860: Convert to i2c's .probe_new()
Message-ID: <Y3tPe9mAnT9aGnGL@maple.lan>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-586-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-586-uwe@kleine-koenig.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wolfram Sang <wsa@kernel.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
 kernel@pengutronix.de,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:45:19PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
