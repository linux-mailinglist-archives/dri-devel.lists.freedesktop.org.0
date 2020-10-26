Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67228298D2B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 13:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CAD6E134;
	Mon, 26 Oct 2020 12:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1CC6E134
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 12:51:45 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id e20so7825194otj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 05:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7vcZvKgWj3tvpCdWw11KvF34FDIuvpLAkBuN1aheOyE=;
 b=JU40kRMQ0ij50Ui8wpIGYXbJrUaVVWxGe0ugA/baK4x9RAqSnCt9algt0e5bIJqdaV
 gWvErLQN0QCU7v77QxbYETh7cgf4YIqxJHe0ORFAhmP9EhOwMRNioGaKGJwsYppA4fGS
 /7QBcZQB7BOuia79BNaXfS7ePYtQ6ulKvLIdik23/IWqjEOGOgn2hPy2nc2+ta2IEMCj
 whejqXFo8JzKGTJ2otnLqs6NP6hKose+xn2nDvT5/zL4xI834YwLjJIbXSzLVXVkrwXY
 FdfSMUaXfTkk7lBKVPxQgxvBrVqkT92J8XrRw4mHag+hCt+gCDKNYMgPZD6GIaYRv56D
 o2WA==
X-Gm-Message-State: AOAM530p9hN0GdB3WXNqcjKT5RsUTuIC6JQ2IxZYpViNBD3J87fYsJru
 y2rzYqrV0XLlv/xImdAx9A==
X-Google-Smtp-Source: ABdhPJwtQ8qXPYNncRhuW2K59WC9pM4KV3qQo7AARhnKaGe2bwX3DRc0S3phoNePbEXYmvRskbucJw==
X-Received: by 2002:a05:6830:448:: with SMTP id
 d8mr8698533otc.318.1603716705097; 
 Mon, 26 Oct 2020 05:51:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a16sm3524919otk.39.2020.10.26.05.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 05:51:44 -0700 (PDT)
Received: (nullmailer pid 4170335 invoked by uid 1000);
 Mon, 26 Oct 2020 12:51:43 -0000
Date: Mon, 26 Oct 2020 07:51:43 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 13/52] dt-bindings: memory: tegra124: emc: Document
 new interconnect property
Message-ID: <20201026125143.GA4170168@bogus>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-14-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-14-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 Rob Herring <robh+dt@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Oct 2020 01:16:56 +0300, Dmitry Osipenko wrote:
> External memory controller is interconnected with memory controller and
> with external memory. Document new interconnect property which turns
> External Memory Controller into interconnect provider.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra124-emc.yaml   | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
