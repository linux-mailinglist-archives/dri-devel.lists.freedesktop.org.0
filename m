Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AD81A4917
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 19:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8776A6ED23;
	Fri, 10 Apr 2020 17:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7316ED23
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 17:37:17 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id u20so1969444oic.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 10:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xW8e7XbTL1MjtsBDuTG0LkmWBpzWpAePyK8vKyb+Asc=;
 b=iE0vW69Epg6/9qyXlgulY43rLUImmjSplEHUr8goah+etL2hAKuUbuugmGoU4x564R
 N3kLENvjq7Trhybct/IzhMFXCMhFY/BmeGHQbY9uya/rw3pcncqLVKdkoOLUjQ31kqNs
 lG4YmjTuDlXdc+c2lwqAR75Tg8pOQNXkCgPJrJ5OcAqQBOSI7qZvFvNiyqsrKURNSSVb
 NdJlh4dfkPPP3ZN14ieBRXzsoisV73iy+taPiOoqdmVN3RFrwm8bJs5oANhqpoJsxpe+
 oNDM+gp9pC1+ODN2n3horyLR92Q637R1jtdzZqAZqPsL1hIXf5nOhsIXjJ5vFaeJZ35F
 kBxg==
X-Gm-Message-State: AGi0PuaAkTQjEt8pKIOQmjf+6d2kScTRLkP8+mBrK2gE/jkEvhp+nfXA
 d0dGoVD2k7Red9BDptSmeQ==
X-Google-Smtp-Source: APiQypJmdA1J3nB4xGtREUEBTDio59zX9/RIygF9tZZ99KWP0wkysu/Kl5MeCvmgcKTQBow3llIrtg==
X-Received: by 2002:a54:4f90:: with SMTP id g16mr4030956oiy.150.1586540237288; 
 Fri, 10 Apr 2020 10:37:17 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.cgn.spcsdns.net.
 [99.203.29.27])
 by smtp.gmail.com with ESMTPSA id y8sm1411323otq.76.2020.04.10.10.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:37:16 -0700 (PDT)
Received: (nullmailer pid 1486 invoked by uid 1000);
 Fri, 10 Apr 2020 17:07:15 -0000
Date: Fri, 10 Apr 2020 12:07:15 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 04/22] dt-bindings: memory: tegra30: emc: Document new
 interconnect property
Message-ID: <20200410170715.GA1255@bogus>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330010904.27643-5-digetx@gmail.com>
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

On Mon, 30 Mar 2020 04:08:46 +0300, Dmitry Osipenko wrote:
> External memory controller is interconnected with memory controller and
> with external memory. Document new interconnect property which turns
> external memory controller into interconnect provider.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra30-emc.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
