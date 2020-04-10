Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EAA1A496A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 19:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFFB6ED2D;
	Fri, 10 Apr 2020 17:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC196ED2D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 17:41:57 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id o25so1952198oic.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 10:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0iuTTuHAKQBLl6wYTyl9B3rSSI6V9IdcCwjtYPwLnRg=;
 b=AaJss45NLnfAXviXlUQUoj1jsiLmT4XZ+8CZbcCTP8u3jfnItEI8/JBgQ/Xns+RnVW
 XNxVtX7hhs5E8rbKJHUz5XkwbgAab80b6OpJbro+lCkYHHyh1/vaNzxmynzM2/b6w3+P
 2W1iEb6LV+iOb3kON6/CAJq/eRZVsXaospIFqrcnYuNuTH7m5hhD3bXPzQdhrBXtWDsa
 eKvTO4wF067tadQ26BFZYU/DqGwx7tt7q5E7UtFqOTASiBWJm45dVXcoDu9FgLbHnHVB
 6JPAJV5C9ZV1lNX78d5iIEcOPDDCq7MQNQBXHeAq75c/erpptvrgN729O63cQ51v6LSz
 eYEw==
X-Gm-Message-State: AGi0PuYWzKQEPZVkwuQtkf4MkQkTXFL+MUYiEdN1TjmNVBAhEIX/tuFL
 eCIpcr9siODGLfvpa0yeJw==
X-Google-Smtp-Source: APiQypJG6wzg7b39i/tEaYyjfDn8nBkJ24exIHhxeEzgkKcAtLcxB+Cs60pyg4ubvZSd15mI/BYhPw==
X-Received: by 2002:aca:7251:: with SMTP id p78mr4240717oic.32.1586540516474; 
 Fri, 10 Apr 2020 10:41:56 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.cgn.spcsdns.net.
 [99.203.29.27])
 by smtp.gmail.com with ESMTPSA id h10sm1489399otq.47.2020.04.10.10.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:41:55 -0700 (PDT)
Received: (nullmailer pid 6756 invoked by uid 1000);
 Fri, 10 Apr 2020 17:10:44 -0000
Date: Fri, 10 Apr 2020 12:10:44 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 07/22] dt-bindings: memory: tegra30: Add memory client
 IDs
Message-ID: <20200410171044.GA6675@bogus>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330010904.27643-8-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Mar 2020 04:08:49 +0300, Dmitry Osipenko wrote:
> Each memory client have a unique hardware ID, this patch adds these IDs.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/memory/tegra30-mc.h | 67 +++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
