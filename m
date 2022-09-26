Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C4A5EA715
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 15:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E503D10E6A5;
	Mon, 26 Sep 2022 13:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1588C10E6A5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 13:26:12 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id y5so10233535wrh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 06:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=X/u3aGJCrbkEF/LSnrxfR5RsWBFDbfL2F5GZoEHQi8Y=;
 b=HFRSaNDSXe/IPWDRdSnalB/Djq1JReM3c5LxDtVPZmVL4Sg3Qto1PqRPhVK/O0+IaV
 FkIkWDniefzUs3O3qL0vC8P6McDxYq+QkZtszEJXQTrnQ3waKQGTMfIqN3e1ezxAgbBz
 YXmAGLouSYiXVQTNPUzVoN1oMdePXpI5ed5nN1lsET+6xuE8C1FxX/rVEfCTnMaYkEz0
 RXd4L7zzJUWOIT9rjRT9L/rKw5qyi6tFx6X/zAfIgXNWEj6LYHDxDG01oiHh9ZOCO+M5
 ZN2wdkX5UaRFpJWASR9vE7BqmT+O4jHbMptqccVV4OSEd+NLRW1slYLYh2A1g8nMXOoj
 zkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=X/u3aGJCrbkEF/LSnrxfR5RsWBFDbfL2F5GZoEHQi8Y=;
 b=meKy4Jvr8mwtGSzhu1jCd5Iusp4ep5lDZGGNRtzp+mZYvUFDuppMwq8A7KDmGiBpeo
 r1cELNuD6H2l636cDJ02O03reclVro+L2OIDzdyAuvRW0GVpOTbuvZCAd3HrB2P9G0dK
 hBGqTS25+4agVZkTJTWYozT+DKigj0nG8iCY8CoUTxdy2F46zlhtrjxwLbfiK5LR2tpl
 kimUrzX2NySMHM2NR4sb6LJUEi5YVseR6mAxXsAo0rODG+iyrCB/bp+DFjLDMAoAF55c
 Jy7pvGTw27uG5x7cHQSNEQYyNvtXzGNpaeYIKCxP+pxg/vsPb0Sjtu+kENZ1dgnyMX66
 eV0Q==
X-Gm-Message-State: ACrzQf3QoXqn5ZMw1eRUXdzSE+NNxvOmfWYHdS7TijGUIWE+ZDYs5Uuf
 /hYjzJtiQuuRTS/OIKmGypvsjQ==
X-Google-Smtp-Source: AMsMyM7bdSH4MyMF/cAXzQhTpAYfJdBsDU+kNXp/imo+o4zN/aIMYHRa1VbumeSNQYJ6cILehPuMnw==
X-Received: by 2002:a05:6000:1849:b0:228:c87d:2578 with SMTP id
 c9-20020a056000184900b00228c87d2578mr13552933wri.274.1664198770388; 
 Mon, 26 Sep 2022 06:26:10 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c19cf00b003a2f2bb72d5sm13904956wmq.45.2022.09.26.06.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:26:09 -0700 (PDT)
Date: Mon, 26 Sep 2022 14:26:07 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: cgel.zte@gmail.com
Subject: Re: [PATCH linux-next] backlight: use sysfs_emit() to instead of
 scnprintf()
Message-ID: <YzGob83cBFfuxOXQ@maple.lan>
References: <20220923063448.239259-1-ye.xingchen@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923063448.239259-1-ye.xingchen@zte.com.cn>
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
Cc: linux-fbdev@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 lee@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ye xingchen <ye.xingchen@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 23, 2022 at 06:34:48AM +0000, cgel.zte@gmail.com wrote:
> Subject: [PATCH linux-next] backlight: use sysfs_emit() to instead of
> scnprintf()
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Replace the open-code with sysfs_emit() to simplify the code.
>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/video/backlight/lm3533_bl.c | 10 +++++-----

Looks like a good change but the topic tag ('backlight:') looks a bit
generic for something that only impacts the lm3533_bl.c driver.

Also it would be good if this patchset included the same fix
for *all* drivers that a grep shows contain this code pattern
(e.g. git grep 'return scnprintf.*PAGE_SIZE').


Daniel.
