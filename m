Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DDD631E25
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 11:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C1B10E298;
	Mon, 21 Nov 2022 10:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC8F10E298
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 10:22:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b12so5317132wrn.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 02:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iTOHRzceQYVbSDGQhGLsG3F76+dMRPGYLu5KqgSSAiM=;
 b=LZ0IPSCDo80aHrpFHT2RbRfDhrEM8HzMSN1EyZP/Tb3gPrJ1qucGYmhr3Z97MBwJjb
 HLcUq7b56VOCopXtILEmmsotshAJyTeCJJwPKS7hOww4zyhg+xtCOHWeWSMfDdQhVW67
 s2KdqyT//VhTNhG7F2lytEKXx2jdITXPZ/PNxsUB3CxAT9XDTwPfXifiIhMzMeOF83eM
 ciiGNI7r+7dUNzjZNsHTwlfzaLLMXr+fjalYsSXpK039uMO59MGK1gm8HO1A56vkpW/2
 465WplN1OHOw2pmtawR0/RLuJsQlBhyMwVa16+njzup3ADQkjT6UkkSaXFblRxWJZmzI
 Q4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iTOHRzceQYVbSDGQhGLsG3F76+dMRPGYLu5KqgSSAiM=;
 b=IGtP5/JHU9ZT1MkcHPAHTS8+hqSlwiJhTQsR0XEACRKii8NTry0okiPOgRs5uiAwAf
 HXnXNbriod1h4TtJzPY0CuZWpa7HKv9O9sqUtq1oF1Q5etM+o8u9eqwVXNGPJUIns1Q9
 j1Ysdaf/nBfk9nANFkO30M/+L9Bw5f71LGJfG5SeQBdop7CYsdbSniTiRyNszILy8SFH
 trkKuGJ5dSzuNy9qPz9vR1ZhCvfx1v2kzrCRvyHRmvQhKXvxsD9NbxBy+RuyGgtLNkhj
 fHq0eOFjBJSGrDYV1qqf7kG5c5G3QBw9j1g2NP7ZdilMgZ6jKYWSN4/F/gJoF4e1aRMR
 LHNg==
X-Gm-Message-State: ANoB5pmq1PHtHSNiiT92x56m8DNEEnNZb69RcwRo5dKeLnMfE0KxuKKA
 4wdFNIYjAYyBiznN9s5NBHkBNQ==
X-Google-Smtp-Source: AA0mqf67/fMDHSu3j27cQjDIa1ZpZopwDRvpBD/uQs/oea0QTn+saXwNsfAKQLZBdoagr1e7hek2Bw==
X-Received: by 2002:adf:e347:0:b0:236:76de:7280 with SMTP id
 n7-20020adfe347000000b0023676de7280mr10897544wrj.194.1669026163781; 
 Mon, 21 Nov 2022 02:22:43 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 a6-20020adffb86000000b0022cdeba3f83sm10864175wrr.84.2022.11.21.02.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 02:22:43 -0800 (PST)
Date: Mon, 21 Nov 2022 10:22:41 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 587/606] backlight: arcxcnn: Convert to i2c's .probe_new()
Message-ID: <Y3tRcRJoURo/NTgt@maple.lan>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-588-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-588-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:45:21PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
