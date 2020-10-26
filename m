Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5023298D1A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 13:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030786E10E;
	Mon, 26 Oct 2020 12:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4F96E10E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 12:49:54 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id x1so2547831oic.13
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 05:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oAb942PkprtooTAkcphjHuX+nYeTcTWj5DRWfq1D+/8=;
 b=W3oryulnwuxmmk70RPdzGB31/wJyZoc5ncu/VCf9PBUb+NC5Q7vD/7D7IyyvPwwrdg
 Gl7985EQsVbCR1x4ILzl1ksrBUz8cLnFm5SrABvlEONx4mV5tjvbtc1+pbTc4uAQe970
 RwwbFG59Mly+HgJAWMeeVMuqSnjOunyOS4txp6/9ovn5SyUvpjO9WKbMmSOJHcHadkUm
 1aBsPXwr5cV7fwvbHMm3nVXXa2w1GRIuVFwte1ZvDZjfQzx733YgmMruqewFaNdQVFwM
 Ie0msQ7xUxDsp3CX99ipsDCxNLVpiPtnnlED2zFfSCVMLMFKOKJpOXP+lrESX6K4NTtv
 aTlA==
X-Gm-Message-State: AOAM530PRAldOIW35vxZyL6/0XLwnfZyZifTQeuclUORKEqYbG4/dLWL
 Xy8BtNfvyg+2d6OV2iOs3A==
X-Google-Smtp-Source: ABdhPJyw8X8wHgRmnVOj73HYL5Yt/7SSSmhyblzN5O3WGOsS2MFEvEEq1YMx197Ky6/S+smUlunNeA==
X-Received: by 2002:aca:4e4b:: with SMTP id c72mr969519oib.96.1603716594205;
 Mon, 26 Oct 2020 05:49:54 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b8sm3824400oov.29.2020.10.26.05.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 05:49:53 -0700 (PDT)
Received: (nullmailer pid 4167734 invoked by uid 1000);
 Mon, 26 Oct 2020 12:49:52 -0000
Date: Mon, 26 Oct 2020 07:49:52 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 12/52] dt-bindings: memory: tegra124: mc: Document new
 interconnect property
Message-ID: <20201026124952.GA4166359@bogus>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-13-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-13-digetx@gmail.com>
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
 Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Chauvet <kwizart@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Oct 2020 01:16:55 +0300, Dmitry Osipenko wrote:
> Memory controller is interconnected with memory clients and with the
> External Memory Controller. Document new interconnect property which
> turns memory controller into interconnect provider.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra124-mc.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.example.dt.yaml: memory-controller@70019000: '#interconnect-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml


See https://patchwork.ozlabs.org/patch/1387321

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
