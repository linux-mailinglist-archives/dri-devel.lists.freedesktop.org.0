Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B8597D77C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 17:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB7110E850;
	Fri, 20 Sep 2024 15:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yCSdUy6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D71910E84D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 15:32:31 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f74b6e1810so19335241fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726846350; x=1727451150; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GVvBt4ITf3Izwk7cN6igXz55uEITPGN8VqBf+wAkebA=;
 b=yCSdUy6eS1PmXhdMZ7e9J3Thnd2XMIuL6kTXJx3XG0R/xvhwvMzvjcvWGDLbmO2dHZ
 WP1BbYzONRmD9y4pyRQYZNalYp+Y+3FqkJbJnXuKheAB6H6svO9lG3eQWlygDRhpLKdo
 r7JBps4nHmPYxkS7SRfvooWzQ7YwCdHBzDKCwnCgsVkqlLjBCZ7/1GYc9Mz9O5hVMFME
 zfnInzwcUMTdEOPTuWnJHhxXSzwHtHl1QGWNvCvXE3XGQYxH9IDzVvVXonQ8Hw9Xk5rc
 RdL8Gly6WNTqVTM7AelcFtv8ZAMK/+CzoKvXlOP5vjoC9NaSnr0wbtTKo6HdhMAV7zCY
 tPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726846350; x=1727451150;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GVvBt4ITf3Izwk7cN6igXz55uEITPGN8VqBf+wAkebA=;
 b=XGyIaEt+LR3LS3Nn4V/pAC6DU0Q0daSRitfECNLr8aLMZNNj2bS18OU/IlIO5EgHlO
 g3+dltPwlkvjlFfDXrfqEle5K/0WHKfXTe7/lNi6dhp/73ODHyWQiroslpmR/iPz6fvR
 fr/KcQSsMRVME0erTS8jykAEia16pofBDQPHElW+1icNyMKKLew95+kAv9gpox3PRcK9
 JZRIjoHcvTt0TuL1bF4Y+nFfkLYMzsTa0J+eUeQEYE0X5xKhYiGeg+6FspE3ijnKeUZ7
 s9zemj29Vgn2gV194GE6IT7l9Tsv5bzzvUyCML4gBM71lioEehpGMnzxkSYhy9KMMHIJ
 bgUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOTMRheZbPp4MohY2FQb+ee26xd3zb0W17BcahL4HprRBufz1VecEtwvF2V0eXM16o92+68Z4TDBs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGc0NyDsGCbot7njVCyZpabIFg1/G+leKttGakcX6NLEV3QKXM
 B9iPlmelUH9qtaDC/lwhOXuRkQaaVuwFS0KGa5qctbuH94iosOu6t/2TmZJllRA=
X-Google-Smtp-Source: AGHT+IF//uVEr2Zd+OvykaAJPU+E3Yc/1OLJs3/DZxpLPCqo0XwH6DBwqDEvCzEaB/5XFcbFSFXmqA==
X-Received: by 2002:a2e:a593:0:b0:2f7:5980:78ca with SMTP id
 38308e7fff4ca-2f7cb360495mr20703281fa.32.1726846349554; 
 Fri, 20 Sep 2024 08:32:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d37f8d8sm18808801fa.92.2024.09.20.08.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 08:32:28 -0700 (PDT)
Date: Fri, 20 Sep 2024 18:32:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 open list <linux-kernel@vger.kernel.org>,
 Kenneth Hung <Kenneth.hung@ite.com.tw>
Subject: Re: [PATCH v2 0/2] drm/bridge: it6505: update dp aux function
Message-ID: <vxs3eklfifsnaq5rn6kppegfv3plsviqaq5nvlzo3fgazwj6y7@od4atbvf5ep3>
References: <20240920082451.9240-1-Hermes.Wu@ite.com.tw>
 <20240920082451.9240-5-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920082451.9240-5-Hermes.Wu@ite.com.tw>
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

On Fri, Sep 20, 2024 at 04:24:49PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> This series change aux function to support MCCS and fix HDCP CTS

It is v2, but where is the changelog?

Also please give reviewers some time and don't next revisions too
quickly.

Last, but not least, new series = new thread. Don't send new revisions
as a response to the previous one.

> 
> Hermes Wu (2):
>   drm/bridge: it6505: HDCP CTS fail on repeater
>   drm/bridge: it6505: Add MCCS support
> 
>  drivers/gpu/drm/bridge/ite-it6505.c | 343 +++++++++++++++++++++++-----
>  1 file changed, 292 insertions(+), 51 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
