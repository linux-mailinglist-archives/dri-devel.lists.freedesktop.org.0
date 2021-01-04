Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997BB2E91D9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676DC89C8F;
	Mon,  4 Jan 2021 08:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3D089B4D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 07:40:34 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id y8so14090554plp.8
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jan 2021 23:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gkO4wZs2FgdAnD1CSmbghKQqG0ttWfnbDgOBZn/+SK0=;
 b=D6+RF/PzRVYdDbp9mVXRZkgt05lZoa0HdRGJaUPrO11l6JEOewUo9sGrnKJp0JNgxX
 4POzjUouMSaEkJq2p27xDPvg+5ijWyEmdf5pnItczrPqK51OZNq7N5eq6OIoVluRZbjF
 creiG91y37GlocoV+MNhmAx4dcHTrwnsIEG6/A6vysRbuchsfHe7/gGt/dBIgmpS2Wzw
 /e70y98Vovryj6fJVpAteYFt6iBaZlm3OKQOKIEBLSkkk515hA6eKIcl+kncJbYdnATE
 DVyx+eTJWdSzWYY1JNH1ppkIdH3q1uEt2C2YgSlh24A3+oyYw+8NCHxgIKFT1XAj/Cxz
 BZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gkO4wZs2FgdAnD1CSmbghKQqG0ttWfnbDgOBZn/+SK0=;
 b=T10gwZLQUsbX09s8/shcizQtLw+Xo4d5D4isT+BPuAVPZDKlXKDnuu3mnRZxbAR94U
 TACwTYSEoSSbV86+d6C+NBNnaZ98G2UJ7hs/WM6Ifi2s6u3g/ltb1/03tQ7pjtzoy9rq
 DXdPv/YOeP/Qx/SU0X2+2yGCVofgt1Yc++CA1uA2hfJcl+Gme+ZQOl8bijjHKwXyEQc6
 J/kNuFAsJPeH0wJXzkyn7FFbuXVS7LIiwQSkbFeTNr4C++LBVgiJ/jmoN3nir5QIjsVO
 pkc1/xR7HJMwkFr5i70mo1Nj/423jlm6cIEeI32VHqhpR8gn48+S2djAXCylyPaccQra
 gjYA==
X-Gm-Message-State: AOAM533Dy3Ej865opTxxBnD1jogW1146xG85HtMqcw8SauRmZIrWq9jT
 B2Rkf6QvnqbCU1VHQP33vMGFxw==
X-Google-Smtp-Source: ABdhPJyzODUMq/AyS4aF5tDIj0lxzfRVSiJgpUf3lUkc6Hi0IU7ZVuxe+GHkfVxWnfCCseGDVj9amA==
X-Received: by 2002:a17:90a:4817:: with SMTP id
 a23mr28191220pjh.16.1609746034333; 
 Sun, 03 Jan 2021 23:40:34 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id b18sm55749806pfi.173.2021.01.03.23.40.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 23:40:33 -0800 (PST)
Date: Mon, 4 Jan 2021 13:10:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 31/31] PM / devfreq: convert to
 devm_pm_opp_register_notifier and remove unused API
Message-ID: <20210104074031.k7njtbjot4r22flb@vireshk-i7>
References: <20210103035706.24168-1-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210103035706.24168-1-tiny.windzz@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03-01-21, 03:57, Yangtao Li wrote:
>  Use devm_pm_opp_* API to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/devfreq/devfreq.c | 66 +--------------------------------------
>  include/linux/devfreq.h   | 23 --------------
>  2 files changed, 1 insertion(+), 88 deletions(-)

Remove the unused stuff in a separate patch and let this layer keep
doing the devm thing, I don't think others would need it.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
