Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D26295927
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01996F51D;
	Thu, 22 Oct 2020 07:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD03A6F3A2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 05:14:56 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id r10so240152pgb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 22:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9N4AwJ1uFCW577znU9D4xEwyN9NsDba4VzTyi1307gQ=;
 b=yOA8f8kva3txVhVULf+6KyqMM6X6M5+Xq4kyU1AaaaeiRmVBHtfho0ndnz7P7+ksgb
 W2XD8LnIqe4xOqonit7kehkgF+JZvgSGPfhjNDzWxpcHS646OOK8Oy/L48/DVwIkJuYO
 UgvmCwGCf28d9+rxPSjbDBdwXk3YJ5o3rHKw8gw5dB3lYEv14YjymPgNjCJsTWFB3bOb
 fPWrK3+Q6/dnEzTjIo15k0gfucqhX08ixAMmzbXz7iLoAnG7g2ClLIDG2i4sATiuDCxq
 TRv2Lnax6EY1hdZkDGSJwIiZvtvt7dWcO60+ED8uAgRt3gWh/GBsdSZn196afU1z76WC
 SW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9N4AwJ1uFCW577znU9D4xEwyN9NsDba4VzTyi1307gQ=;
 b=sUlPFDQgDrZiOGepAw5b4KHbCGHGSeIsfv4Yx8V+Yz69X/8ncnxRpZpvkF6ja+CiHZ
 cd5D4aZxW4XO2xPG7CGw52+KtSJ5T6spv3IpfiuDBYEch22P3WNCjKCf3QUwHpyrZlIn
 LHqFzR1GbyTl9gaOlmUz4nysU4iz1nVanSSZPmetMHHYyfzGep0Y0V4pxqBffQfp73Cm
 ZCGX9YFfKDU72I2A2TRr1uQ9OrzXUXIeQwKoi9l5H1CfNI/hM4HAa5VMJ4UxwHM4YLxA
 FSszF/wwNTiE4pp3jsyt831eMGvrKk+A0Ycdaxj+yrFbCN55eaQOjwOjJ9PEqmlSL5sU
 PciQ==
X-Gm-Message-State: AOAM532E1L2j6z6jhnKEBdBpHjHZqjCOQRXWXqflJzjd+22cxdo+IzFU
 wPezqAKTTV2TX10uKnUqigUdIA==
X-Google-Smtp-Source: ABdhPJy/Aaj8vx5eIZaXacCj6mJYxS7bjf6e3Y9pPqYEIm1OT+kS0t3cdteyul8PjIUtlKAzs3Sbnw==
X-Received: by 2002:a63:3d48:: with SMTP id k69mr880965pga.269.1603343696496; 
 Wed, 21 Oct 2020 22:14:56 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id z18sm482300pfn.158.2020.10.21.22.14.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Oct 2020 22:14:55 -0700 (PDT)
Date: Thu, 22 Oct 2020 10:44:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rnayak@codeaurora.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH V2 2/8] drm/lima: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20201022051453.xufcga7icohm74rg@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <62d944bdac75ec696828daad49fc1ddb6c637bcf.1598594714.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62d944bdac75ec696828daad49fc1ddb6c637bcf.1598594714.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Rafael Wysocki <rjw@rjwysocki.net>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28-08-20, 11:37, Viresh Kumar wrote:
> dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> find the OPP table with error -ENODEV (i.e. OPP table not present for
> the device). And we can call dev_pm_opp_of_remove_table()
> unconditionally here.
> 
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> ---
> V2: Applied Reviewed by tag.
> ---
>  drivers/gpu/drm/lima/lima_devfreq.c | 6 +-----
>  drivers/gpu/drm/lima/lima_devfreq.h | 1 -
>  2 files changed, 1 insertion(+), 6 deletions(-)

Qiang, can you please pick it up ?

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
