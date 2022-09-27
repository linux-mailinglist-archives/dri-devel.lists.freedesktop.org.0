Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4955EC037
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 12:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E4D8926D;
	Tue, 27 Sep 2022 10:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022F98926D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 10:56:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id l8so6277549wmi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=1XJBHcRSEVBdxRCScP707zcT8rSQCT7edZ1g0/htxRk=;
 b=pUS7QhQP5cGrbm+nUH5FSnKhNCujyXuMhhShWL/GXe7/y8hsTA2yD0l07pfEilsXwY
 D2E/qI4Hh6MhK8RxYBSvzCtLV6O2KYW/o7xU6lU4JWCVOm3w/VBFvJbNTIUGEX96UNNB
 1zWrZRH1m8NJ2UhncUcZT2dNM6okW/WWR0hrjoobCokk1CLaamCdQdQ30oA3MhvQZ60X
 yuFNEBXrqlXwB438Y2yWklHga0yCObRxSS6cTUWIFXZSxLH8DD2J69EYG5iQ/CHgqnWu
 faCth5OdDcNliBPvC2qWCWGtC/zFTV4wajw+SH9aonyg7Xhl3mq/DVX0eQPZG/Bqo24t
 n9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=1XJBHcRSEVBdxRCScP707zcT8rSQCT7edZ1g0/htxRk=;
 b=NwSI0WnJPoQTNEI3ygTPNoVZUIrbp70LhnRNyzCZ1NOrOwBaLptc6Pn0ztr57geyMi
 s84tBdm5QIkn8EJJZg9ChdMfDsK8enhxtcakfn80KCgBI3vEWmg1+YxY3nc2SFDrGNAk
 52ejKmuxp3MrDXX86spdJBIg9VMOALbADrN0bAgnF4JEgmdkTNaxG48oKTaHNfs+R4Kf
 ro4QA3iF7E4qft6GOq/NikCBZkGiH1qBbMzIaKGd6QCOUaArwwqO0A+6rtuNTKevjxJB
 lLOKiPQzhB1RxuTna6X4+cpc5gBhUdeKxXyaeQvozQrc9kVDVJ4sUOcv5LW+qyDnwdMz
 Hiaw==
X-Gm-Message-State: ACrzQf1GTPBukBhBdGm/E+vUVNVhbdfg+HctEgatDjqAdGv0NFiL+tJ6
 MUZ5Rfm5MsN9YN9tJCrrPMY3LQ==
X-Google-Smtp-Source: AMsMyM50bBpGMcDLl8sfoP8lyLAdXtndWpMAyjMfquaKgWaxjFjP7Iq9XI59b7VH2Uz8ITGZgDijBg==
X-Received: by 2002:a05:600c:1d2a:b0:3b4:6e31:92da with SMTP id
 l42-20020a05600c1d2a00b003b46e3192damr2047894wms.103.1664276206416; 
 Tue, 27 Sep 2022 03:56:46 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 q12-20020a7bce8c000000b003b5054c6cd2sm15926716wmj.36.2022.09.27.03.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:56:45 -0700 (PDT)
Date: Tue, 27 Sep 2022 11:56:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next v3] backlight: gpio_backlight: Switch to use
 dev_err_probe() helper
Message-ID: <YzLW6zo/7k031jzi@maple.lan>
References: <20220927033138.1945842-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927033138.1945842-1-yangyingliang@huawei.com>
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
Cc: jingoohan1@gmail.com, linux-fbdev@vger.kernel.org, lee@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 11:31:38AM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
