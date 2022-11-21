Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982B631FC7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 12:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE84310E2AC;
	Mon, 21 Nov 2022 11:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E6D10E2AF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 11:10:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id l14so423577wrw.13
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 03:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bovRlaV+W5pxvhors/w9N6j//qWxcZTo0qg8XUozrUg=;
 b=Mq3lZGUFJvV2db5ccYAI3CTBXzUz18HyYkrHGH4ZjxfwsJjGhJQS8ioXSjg+mfaDEZ
 YlRTCEiwVtGuuUPRKsWMewBS75dGwa934vPNmalnoXfJUFAJWEBzEPylO48LNxu86ULj
 +ofRqY0hpLZOa+bBzVtb1D7TNfSXqVOuECGWE8wb62kOcVoUXHXtHTROfG5lovou9ifp
 3GEz2j+ZaxwhM+cl823HbyQtlJ9k31CUnoEIX30LQOwS/r6iHSCbM81h5VAwVm1ufSir
 H/XZRfWKVnxKxPeny7/UJh63vmqtLyqxIkunN72klDvLX0vNbj6W+i4d6mJGNqn2C9Va
 7yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bovRlaV+W5pxvhors/w9N6j//qWxcZTo0qg8XUozrUg=;
 b=EMfQkPs51Q/nXtjQeRuRQ/U9Xb07+s8cl2LWL9MmROJ3H8lumpraSSRXVYhWBsLd17
 zx4uRo/o+MCzc+dM8m8xFeBaJD1pp1yS3eFXayS3VS9lXz4rhcyRX/1JXvKTRjPklV6o
 UFDFv1UdS6YIZRfZiA6GQAIU83iOuWnd2GpgeWxsX1NxCAJMnTa+FJWOmVykRyab//Dy
 eKTTZ5gFTP0YS9b42O9ZL3LVIE19Og4CEinfaR2hRcvLpy98rk4oSbrrQcnmgq2+GhH1
 Qrjhg8zZFJMjs2HRdzMygLko1yghJn5qOAH6dMfFkFdWQL6Jh6OsaYlf78gSmA4X7TT1
 kYwQ==
X-Gm-Message-State: ANoB5pkKSkyvSHheGZ1V8DuIR7xU65e+vgYnsiZtDX1uBf0qV/M5Xgs5
 8woTPbRVcnQnIo1vex5R8VBVEA==
X-Google-Smtp-Source: AA0mqf4V3ZLnNNPcGkGa84Iox1i5ExYxfBP5BDriqNKkkM4OyvZF0Q6WAV8GEafnYO+omjGoAwSdkA==
X-Received: by 2002:adf:fd10:0:b0:241:b42c:2e4e with SMTP id
 e16-20020adffd10000000b00241b42c2e4emr10868331wrr.482.1669029021492; 
 Mon, 21 Nov 2022 03:10:21 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 b14-20020a5d4d8e000000b0022cbf4cda62sm12947381wru.27.2022.11.21.03.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 03:10:21 -0800 (PST)
Date: Mon, 21 Nov 2022 11:10:19 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 592/606] backlight: lv5207lp: Convert to i2c's .probe_new()
Message-ID: <Y3tcm9FGB/UCRbuC@maple.lan>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-593-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-593-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:45:26PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
