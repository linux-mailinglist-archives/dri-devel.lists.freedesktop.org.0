Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3829E600
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703866E898;
	Thu, 29 Oct 2020 08:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2206E4E8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 10:29:46 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id p17so509958pli.13
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1pIhF3Lx72mYJfiMtwf9QoYKy68h8haDkbJMtDNYKEw=;
 b=A5zt5zl/3a+3Lf6ycRXqaL23CVTsmGCVta8hYuuRyWm85jhP7yy4UtsmSZy7osgGO8
 0Htg7p+tSzx943zm1oqpQtVMxsYpCQLWsZR+s3FSJhV1niNcbt8n/UlIJzuYS9jEwutH
 4HJR14Hc9K5YbNBcIm9/PEMAdrMM5Jbw2mq6S0/rIQRPDGoZ//V8RgwDNTuPMxhc7haO
 bfd92SIOiVSQ1+uNr+jLeTMg8hkUo3f36tTcyiGag/PIA1uoT0CXOZcUHjy4HSuRZhEG
 gpNL89nH/JtWad1FLF6I17dXaAvqYJfXtIU22lU5Rld5yfJri5H0Xe134gj9JwAzpov2
 PZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1pIhF3Lx72mYJfiMtwf9QoYKy68h8haDkbJMtDNYKEw=;
 b=WWW2Co3YljfnJuODZ9jOX7z6infG80FWasojYssd9J5CDom5/VYQaHoJ3JyKNFmX4d
 6RTekzPHlTaYPh11SOHhWeL2Caeyo/kEgAzRa11UjvvxGKZOD+yYX1ts/OmbjeFXPhUW
 ZeM1ijz/HCK8/s/d/dw7McOKYQLxkQs+uAL0I7wI1XsHPFe9Y74/4UJm1rjnx0OR25eM
 UeVJcZS+rO7NRpYoRHvuQo+aAmJiSZJXbAs0kNRAoKruP3n85xREsxBNtzMsPL3a4xP7
 pWb1EMMDYnEQZvhHONT1Raf3W9YHUx8otrJJSChaYnW1b1itMmPQJI71t4UnKkD0KTqF
 jzoQ==
X-Gm-Message-State: AOAM533PZg8XLbQd9nmznER/BCOnOlHFuLF78RONNNojEutYSsRU4e6W
 5cLXZlQ7t7/7oxrv7ME4TTlBsA==
X-Google-Smtp-Source: ABdhPJw/lN1Rdn4IAlyuzBmnXHAuWRhy9Jalsrt5qmfXLWggNb6REZMG2RfZFvV2Oa+QU+95iAenSQ==
X-Received: by 2002:a17:902:8a8b:b029:d5:f871:92bd with SMTP id
 p11-20020a1709028a8bb02900d5f87192bdmr6827921plo.10.1603880985833; 
 Wed, 28 Oct 2020 03:29:45 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id p5sm4520672pjz.47.2020.10.28.03.29.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2020 03:29:44 -0700 (PDT)
Date: Wed, 28 Oct 2020 15:59:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Frank Lee <frank@allwinnertech.com>
Subject: Re: [PATCH 2/3] opp: Add devres wrapper for dev_pm_opp_set_prop_name
Message-ID: <20201028102942.zc5hgqpo2bfrn6in@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201012135517.19468-3-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012135517.19468-3-frank@allwinnertech.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: nm@ti.com, freedreno@lists.freedesktop.org, airlied@linux.ie,
 vireshk@kernel.org, tiny.windzz@gmail.com, linux-pm@vger.kernel.org,
 rjw@rjwysocki.net, dri-devel@lists.freedesktop.org, gustavoars@kernel.org,
 sboyd@kernel.org, linux-arm-msm@vger.kernel.org, kholk11@gmail.com,
 sean@poorly.run, linux-kernel@vger.kernel.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12-10-20, 21:55, Frank Lee wrote:
> From: Yangtao Li <tiny.windzz@gmail.com>
> 
> Add devres wrapper for dev_pm_opp_set_prop_name() to simplify driver
> code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> ---
>  drivers/opp/core.c     | 39 +++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_opp.h |  6 ++++++
>  2 files changed, 45 insertions(+)

On a second thought I am looking at dropping this one as you haven't
added any users yet and I am afraid it will stay unused.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
