Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D6A631DF6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 11:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCF510E1A8;
	Mon, 21 Nov 2022 10:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD0510E1A8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 10:14:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id x5so15017888wrt.7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 02:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NGp51oyhKN+C50Ky2rZ8/aNL2masc43yeuijWFHSU50=;
 b=XMyAfQ+bFmr+L9mCWAV9dfC0veCnWGzc0V7vrySwfdBeZ60Nh8F5gd6xBn+1eq/48C
 aZRwSpXAzBrfjhd6ky9N3lf/3fXyd4uB7Ykv5pQkTo7PPymDJIz/4W3y3Qgng8BTe8yj
 iq3ejY6/vhiSUvBAytVyrS6WUEuTWVwexXNE5SxzRGFOQrfbQfOMrcfVg+ML4Cj56YN9
 fPm4mjyPyrNug1cRSPPWbCUFacgw56qlBflI36WcAnFD5wLD/diW3w0/sUxV9GZLQ7dj
 OhlbxuEXWxpC8JS+WPq2LhciT4zSyeRZOeN/4kctK2/m88aM2EO7UTmJM+hzIiicT/g4
 1gLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NGp51oyhKN+C50Ky2rZ8/aNL2masc43yeuijWFHSU50=;
 b=KFH3dxngyd8bF3ECzPkWMauZ4CgLwoFbT6Wyps/O1zp1Cauy/8P469lCAzqAzLHWps
 vErW2xK7Gi/tvH7UgdyVwH4lIU3mc/qtb+GwF9F7QYN+yn4X+hrAXjI8XYK1c9wrzPuU
 x+pqTPerqxUvnKe7dof59uZskm/4eZJ4rH/nrgnQiaYofEDmq0NdXLaPlJ0rWob7kI13
 pMv0H3Rl+Utr3Rv7AXnXocFw22C/IaCeDAxCKqlucPWyIQtlxMdHydnh7K3nVIAw4Amm
 EcN2VHSSXt2pfHOv6xM3I+Z4VX6f0zxBUaPvELffTORUjRK1wRy61IPerYOVnlqo+iok
 vn7Q==
X-Gm-Message-State: ANoB5pnfzoGNlI0he+ym/VMY5hGlJG+yG+10Pp5wxvb/4/t95R6Wghed
 Eus8+bxRUJjifHm5hk5ZWdT4Mw==
X-Google-Smtp-Source: AA0mqf6LxOnj7sRCPNn925ZmqDMfzLYPjKnqzEIZoA74SSnSE80opEBz9sbIik28wWr5VNxELLyI3g==
X-Received: by 2002:a5d:538b:0:b0:241:c3c2:24cf with SMTP id
 d11-20020a5d538b000000b00241c3c224cfmr1960700wrv.587.1669025695580; 
 Mon, 21 Nov 2022 02:14:55 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b003c6f3f6675bsm19260536wmq.26.2022.11.21.02.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 02:14:55 -0800 (PST)
Date: Mon, 21 Nov 2022 10:14:53 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 586/606] backlight: adp8870: Convert to i2c's .probe_new()
Message-ID: <Y3tPnd6xKu1bAIEd@maple.lan>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-587-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-587-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:45:20PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
