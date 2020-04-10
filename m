Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5A81A4933
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 19:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F136ED25;
	Fri, 10 Apr 2020 17:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96396ED25
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 17:38:00 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id g23so2517322otq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 10:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z+n7hy7rFWHZOTxNMWQy7RW9UsHyHmHBslRaPOEtLgo=;
 b=MwA67uflW517CmqWZY1h52vaWysENuHaPL6Prj3wBVfw4KinR82FtbF/YJ8XZXR7M8
 3ZRZ2mV/lROSJnfwUXmE9ItrRu6yvNQdCi52aqjAFiupQLL+vWYJBxE59n8goorqCmpN
 y26R3DX+QtUCZm3IsltJCGeu5FLj2dyaJH0LhcgY8EfkBbj49eMhqvN4wigpqzq8Jlmr
 qWYYQBcmkuVkHlqs8uV8Whi4HgcSvlX6GqquiB2ZdKCV/Yi9A97Ptul5/Y3DQdQvonqR
 n09PtIswOO4cIqCJzcLUXS+wciicBbUdVn3MG2WTtnZ2ZlP2J5TXFUI4svVjJeu4ssxL
 9c0g==
X-Gm-Message-State: AGi0PuYGpmdHlCmjHZz+lRIq9/GYlMPBSvVJqb1PIJxMzPy3qC9dVg4S
 5DNG3oB7f6O0fxXBSU94HA==
X-Google-Smtp-Source: APiQypIg6cdHup3w/mI8veji6zYX9S6G3uLYfY5aoWKwXOo49lGA8L/dhRUfTwcjpE+a5YwlYCuBSA==
X-Received: by 2002:a9d:364b:: with SMTP id w69mr4950447otb.289.1586540280239; 
 Fri, 10 Apr 2020 10:38:00 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.spcsdns.net.
 [99.203.29.27])
 by smtp.gmail.com with ESMTPSA id c7sm1617939ooi.41.2020.04.10.10.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:37:59 -0700 (PDT)
Received: (nullmailer pid 829 invoked by uid 1000);
 Fri, 10 Apr 2020 17:06:57 -0000
Date: Fri, 10 Apr 2020 12:06:57 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 03/22] dt-bindings: memory: tegra30: mc: Document new
 interconnect property
Message-ID: <20200410170657.GA769@bogus>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330010904.27643-4-digetx@gmail.com>
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

On Mon, 30 Mar 2020 04:08:45 +0300, Dmitry Osipenko wrote:
> Memory controller is interconnected with memory clients and with the
> external memory controller. Document new interconnect property which
> turns memory controller into interconnect provider.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra30-mc.yaml       | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
