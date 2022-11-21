Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF14631F0B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 12:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3F010E11A;
	Mon, 21 Nov 2022 11:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE7810E11A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 11:05:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id bs21so19291995wrb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 03:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YaIiikUQITopaZC738kqFEHiw7e57otc7id5Rv4UvzI=;
 b=WJJXwuLReaJtwxy6Bw0sm6p1bzQ1AKkXHJY45SLeDgJCMCJxYJz+YpCRh9F0Co8fwf
 Lc6+dtsYDgb9qBmZShzVW6y22UH4rn3Z5JVYnmiCnd/BM/yW0sU6UsI7iO9TeCpKblH4
 sF0lfkkQoEdKBtNzl5E+Sw0+rvHG8rUVKMkIiQfm4NN7Bu+r/Y2KHiEorQ8TELQY5m+U
 /JrGQOQpnpru26SjhwDnu/MtJrWDziYQJc22N/T/PjW9enYvVPdPyCNBU5DhHRKnxTg8
 ueT0OXpQry4mmuQdCkZ9VVKpjapYhr6lnhfqucd5odf/pyIUTQykKgyP/SIARr7yD0aH
 eMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YaIiikUQITopaZC738kqFEHiw7e57otc7id5Rv4UvzI=;
 b=2FXdptVxuh8GVxxfqzjXUNdr/GiOObunS8SFflinEUNC/akQJVJNy/MYFvuCtspOyL
 I85ErP2bUfikJyV4SvS1VPVBuwe6szg+fVc7HMnRu/k2JXKvy+XTM4EZf89NzTcqDC/v
 io9mBusaOFJNhB1qDUTsgFMsozrWH9fqCiG8yK66nvMYQEg8IYVcaKhw/rmGoFFlSyIa
 zWQzJZV5JNdX92OGKRU07/GQ75xfvd2PyrNQJpQVKnXEdHqSqO9XqcWULY9aTWTwG1Hr
 /YSUbhw9d1IJC0PHPS4s5/8ZXHaj7LiPiLXhfaLbaB3hdaU/A7EGiHbexTl8kZgO6lsG
 i/6g==
X-Gm-Message-State: ANoB5pntxa4MNPyr3in2mOO7B/WKKxubhxv7ov/OBItG3jpYbk3ex7ge
 /KmS7v6xvoke+3xWA0DS9Wxc5g==
X-Google-Smtp-Source: AA0mqf4D21+0QnufM39rLE0tMSVRA8jM5QGBO8Vgd4xHGkTH7YG4WUn7z7t7CB/SUqdrQDVuVtK7lw==
X-Received: by 2002:adf:e303:0:b0:22e:3c66:bda1 with SMTP id
 b3-20020adfe303000000b0022e3c66bda1mr2066072wrj.139.1669028714799; 
 Mon, 21 Nov 2022 03:05:14 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 n27-20020a05600c3b9b00b003cfa81e2eb4sm14716314wms.38.2022.11.21.03.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 03:05:14 -0800 (PST)
Date: Mon, 21 Nov 2022 11:05:11 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 588/606] backlight: bd6107: Convert to i2c's .probe_new()
Message-ID: <Y3tbZ2VN/vtVYLn3@maple.lan>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-589-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-589-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:45:22PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
