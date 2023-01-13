Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89048669D88
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A2610EA28;
	Fri, 13 Jan 2023 16:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5036310EA28
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 16:20:38 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso12636883wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=06yrgHLtubzlVTv8ZMuuqpVVcPSwyPWQD3kou2AtPjE=;
 b=zrFZvqQmSdfN3TP96rg+qCC38kwG2a2tGbIWZCtwPBWu8b5rqlJQvUvwbz0absrUWq
 f2+HygAJ12mlVvFSqx5TBpNtotqYmdNXLnWPsyUwqDE4juqk6dOAqUAhRGf5GL0e94KH
 uzEZ3POXerO0a+xZDIfgQWArn/AsWjsYAtu1sIIUgH6/kNROx4bjNPrfb7N+hpQoyKlD
 SERj4Nc4CMz1D2EZoS9m/34CnijnEtcMHAuuqvQJSu3FKT7sfu7K7pWtby2Jr1l+P2Aa
 zq1w9VM80VOnZ2aN+htvT+5myf2YfzmqW1g4jKu7mfbIMZlsNXgN9wv2uplydNx6tZ8S
 jbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=06yrgHLtubzlVTv8ZMuuqpVVcPSwyPWQD3kou2AtPjE=;
 b=SWWYkgsYF3MVlw/fGFP19ApLmzxcNptZ5t9JHUXXuvAZY5It8PwK7eJCP1cfailSyb
 cmygKzA6nOFiK2Y9tfPfuoFyvUwBj07gbpYY/u4dU1FYYNKIKaN++ANLEYjzmPsbN9qY
 ofdtDfeN2PiIkYMhSu4rjc0KMLAgyxx8q6jqqs/0QIfFKTux2dxBf8bs10U10lAapBTx
 fcJHRVh4XxADzLEK0QX2qD+YUMrD0ojxVRb5/veqMX48RbrdzRnFUwdyxiBe4FseqxGV
 +LNKcJCo6ZC3xs7JSpjeFCHfADMY3nhWn0qF65DGOLei8KGUrFssFXFzzo2trzXG+v7b
 Nskw==
X-Gm-Message-State: AFqh2kqSMMDhG3NNMy7nRa6BddDDdm7yf5daAD3q3XpCn2mmWmMEpbdj
 yfTHvlw/823QhFIh1W9jqbgh7w0b4tTDnH1Bvuw=
X-Google-Smtp-Source: AMrXdXv/fkkqVwAy0FAec0vYcCM6E9mSl/Oq7DvCSvQ2RbgiZMu2Av6NkgVtbj85zzZkDZtaY/excg==
X-Received: by 2002:a05:600c:1d10:b0:3d9:ef75:ea6e with SMTP id
 l16-20020a05600c1d1000b003d9ef75ea6emr188418wms.38.1673626836588; 
 Fri, 13 Jan 2023 08:20:36 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c444a00b003d998412db6sm32412208wmn.28.2023.01.13.08.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 08:20:36 -0800 (PST)
Date: Fri, 13 Jan 2023 16:20:34 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] backlight: sky81452: fix sky81452_bl_platform_data
 kernel-doc
Message-ID: <Y8GE0kEJdQpM9M4L@aspen.lan>
References: <20230113064118.30169-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113064118.30169-1-rdunlap@infradead.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 10:41:18PM -0800, Randy Dunlap wrote:
> Correct the struct name and add a short struct description to fix the
> kernel-doc notation.
>
> Prevents this kernel-doc warning:
> drivers/video/backlight/sky81452-backlight.c:64: warning: expecting prototype for struct sky81452_platform_data. Prototype was for struct sky81452_bl_platform_data instead
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
