Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C50A377D8
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 22:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80B510E00E;
	Sun, 16 Feb 2025 21:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gKf8aw6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F397710E00E
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 21:38:36 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so784017666b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 13:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739741915; x=1740346715; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vVbH69yDeg9/tEjJ1Ds5nMreKYg1QcxJLlekRGssc1s=;
 b=gKf8aw6yJo19umTvW9T8RNxXcUV59VlkhCjcUAqrT6Kpg4oeP+XZDSHH+5o9pyorOG
 R1l9bUPCkt4y5mvq37fFatDwH2yQHMwbN38axYyuob9IPZ1LAUxLBvCF572XV7ngLNAE
 2CdiX2WhNqip8LPrVRjx77uiOM7NAF+OJScbdk6ZftwEmr+jRGyDgE2v3CSkS31hoytH
 tdEn4FHmc2nk6Eug43GGCxPDnQK3nlk4c3Cd4dD8/copFebDG3HtIawracbwMTzWNu91
 Gak2qCZ6W5JBq202UsH9ih2VnDNWxbRw/SOkyyWIDgJiLxgSQDmbt2yKqu4gJW+lDvfN
 BWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739741915; x=1740346715;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVbH69yDeg9/tEjJ1Ds5nMreKYg1QcxJLlekRGssc1s=;
 b=VOJDkb9NkJKRXa1NolOeYMQzQbC0hL6MoJLuNYWF8ntdFUmdDmqpE+C3pJQXxWJ5tS
 RPRUbaCtyVGy5ngO8IISPQiMpa0mWuiwmIet7BkhHuNDsdwTKaZzp7xqgLsZEi99Wj7k
 ln8hj6lj6fTYlcz0+S+WSybdiHpTFBdPp6/4GUQ81vL++PUXuyLMpWwR4Eg78pPmws1N
 lQALhw0j85yuvFjypOfgmegW14C0mRTPzvikoX0mJcUBZc9q6A+fxHZRtjTV0jtsm85V
 DptxU7cZnIqAhE0FIFXX5tHvFISoddNViAeXvcA6hDUziPM2Z7aO3K42i3oSVQzP88wd
 1YfQ==
X-Gm-Message-State: AOJu0YwoSOQvO+pIrDoylQmGPKPWbOqf3YeNI/WgJliZoZV5aPqstmRB
 LywaJXCvykNRjB8UAeo2CuxDruRU70il6Mo/8s3kbTI1UcgpOeN1KuesqGTWxH5u3zE1HucdgP9
 9Qqw=
X-Gm-Gg: ASbGnctmZCR/PVOMthadiZDfTwSBV34Qtx6vm8sdkzzj7ZCq8UqXZx84YzeMKigxdDV
 kpxagySmXKEQlo8qZSGNhNXVOqrN31bnxX0i7EEJTD/4Dr2/cP7JUqT3pSheyOo//8tVgvcbmX2
 iH6P48wV+KRhjC2q7v1nAo7rUIgFzqU4CmMWoWKobVFRgJDfNkjNY2ccqLDOYgupA4WVAwsQBa3
 G5AhwlePH5xFHY990vtVsLI6G7ecIdu6ZTsnTgglwD6fvwZeJnzbJFds0IoyB2aZ95YiAM6oH9z
 hlvLJ6IMpTBY7OjmBfr8
X-Google-Smtp-Source: AGHT+IGz27CTh6DFn5k3ZjFdIXyGvCJoS8aEYNH8+RxiwcvAn4ulUvJ8euuGm21A7g2f2KelDJg3mA==
X-Received: by 2002:a17:907:7f28:b0:ab7:d10b:e1e6 with SMTP id
 a640c23a62f3a-abb70cc193cmr599235566b.15.1739741915445; 
 Sun, 16 Feb 2025 13:38:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-abb9bc1c667sm78497966b.131.2025.02.16.13.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 13:38:34 -0800 (PST)
Date: Mon, 17 Feb 2025 00:38:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/panthor: Expose size of driver internal BO's
 over fdinfo
Message-ID: <69f90da4-a0f8-4df9-bc38-c19f5aa49cfc@stanley.mountain>
References: <083ef44a-ea8a-4291-b345-c570cc1078f4@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <083ef44a-ea8a-4291-b345-c570cc1078f4@stanley.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar issue in panthor_fdinfo_gather_group_samples()

drivers/gpu/drm/panthor/panthor_sched.c:2883 panthor_fdinfo_gather_group_samples() warn: sleeping in atomic context

regards,
dan carpenter

