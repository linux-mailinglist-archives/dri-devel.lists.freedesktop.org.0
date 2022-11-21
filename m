Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515A631FA5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 12:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0148A10E2AB;
	Mon, 21 Nov 2022 11:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F61910E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 11:09:41 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d1so7189622wrs.12
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 03:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DnxhI2K7v7qSJ3sei2vOI6evZb4ItU20SUWGl/JrUF8=;
 b=q+btIZnN7fy5J2xJ9mJzj7EjnGonxfALuWx62cKq/iaekn3WWksEUvaL7oLiCn9x2I
 v792N8rZUV9546bvPIfp/ukOKFLDbRcx5JQaGcQaD5PRvU9aZydTw8lWFfxaCZDWUkeB
 6u7gyHQt5wJGpBoqA4lePWbcVPqPU5agMXPV126jkXRoyHojYOv5aTRfkNYb5IGm448E
 cJ7DikilGO47coKGCONOwrT71/XRZLx9rrZf2Ja/t7dVLkn2OA7KvgPRYrRnhqMEFbWT
 bUxw288qvNy8sp+qY5UwtP7j61eeQ2QmMU+VFXm/pz0JMo85OLg2UdJoDOk7wBGouOfc
 +IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DnxhI2K7v7qSJ3sei2vOI6evZb4ItU20SUWGl/JrUF8=;
 b=nGswoKOso9ul5qc/EaRNo44DDalcToJsnz4M1kYOkGrFqkWq8ZVamdf/gYoyzVViWj
 oO39IA2Opx1M1C+wLyK40ygU2FhUkJAT0sunOb1Vz/OMbqYBcJUfGUx/OEfVMPkq+LRI
 QysFHxQeC6uLej/QthvXTA8NIPB2FCeo6pMZnk+zKfVaeELDgoDKy6AqgFRuTyWRQh8Y
 pl2Prv51/ydkDYR17yV4xLuzXNTP/xHH38Dv4NOcCOA2YP36/QPSpD+HazvcHOIH8MnW
 zLedYmb9mlHpaEsx3U2KifRzrye1qVXvF3LWTA9oGQb7NuShgoSGj/ofWpRfM0fboCws
 vrjQ==
X-Gm-Message-State: ANoB5pky/kKbl1xefLKxas4+t1wNISzSpM5hXZptBqfB/x3/dSb3NsEI
 xUTjownqLl7oeWUfah6j9ZlREA==
X-Google-Smtp-Source: AA0mqf5w+ji8vVQVFaaNoYdKQv16v0TqzZgCN32rFI32gp0Hh6iCyQ+D0Qy72UOYWXd+3t7vLQumgA==
X-Received: by 2002:a5d:458c:0:b0:241:d40a:bb50 with SMTP id
 p12-20020a5d458c000000b00241d40abb50mr2169169wrq.39.1669028979525; 
 Mon, 21 Nov 2022 03:09:39 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4cc1000000b002365b759b65sm10913763wrt.86.2022.11.21.03.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 03:09:38 -0800 (PST)
Date: Mon, 21 Nov 2022 11:09:37 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 591/606] backlight: lp855x: Convert to i2c's .probe_new()
Message-ID: <Y3tccSZrm+DRVA24@maple.lan>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-592-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-592-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:45:25PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
