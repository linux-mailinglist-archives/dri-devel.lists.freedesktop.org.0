Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFC22A9C3C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAA06EACA;
	Fri,  6 Nov 2020 18:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610EE6EACA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:31:55 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id j20so2238788edt.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ksREXILjDbgZ4Gen6Qp8nquIOlE9XtM49f933fBtxc8=;
 b=aPatUx0aO9ZhXnC9ZZoHvaHkGv2bxEeYQPLvBzIowaxWHm0wV0GmsiiXJuZMK92Oiz
 NiO6BTuacs22T0D82mVyQzdyQCMRW9IUj27ei5D0mVcWS8RdFNXmHzwzXjpSgzuvv/3P
 RSbjBBUDtNHPnu8ochXqRjnRQz6o/8szIxlG/nhnpBynZPYm2Z1DQDFj0btwHIekg67g
 2dGfzFPPnh4vMGvjTzujrUctBWPOwiGFsRD5LmGTyyqBMPF4+RfEO0cjQ0j+vTGmAIbe
 5wJgSqa32kRczN+x4E9PAyu+z8SyFrscD4EgdJZfrk2uBNAJyoWwRCpGUd0y6e9M29ef
 rs7w==
X-Gm-Message-State: AOAM531pOIDZnHmQH7298xzkzD99gcbmw2O+FRCBpisx3YvdYbYwMQyt
 jNvGxj/9nNIszEADs9U99KM=
X-Google-Smtp-Source: ABdhPJytVUHuz7iwUNDClUjPiESutNNy9BlIv4ZaWJMy8XF5HVAcYZoy8MtjogURRGcIAxPciYleQg==
X-Received: by 2002:aa7:de86:: with SMTP id j6mr3564915edv.353.1604687514023; 
 Fri, 06 Nov 2020 10:31:54 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id x2sm1470514ejb.86.2020.11.06.10.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:31:52 -0800 (PST)
Date: Fri, 6 Nov 2020 19:31:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 10/47] dt-bindings: memory: tegra30: emc: Document new
 interconnect property
Message-ID: <20201106183150.GJ65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-11-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-11-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 07:48:46PM +0300, Dmitry Osipenko wrote:
> External memory controller is interconnected with memory controller and
> with external memory. Document new interconnect property which turns
> External Memory Controller into interconnect provider.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra30-emc.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
