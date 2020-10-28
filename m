Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F57F29D0B9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695A16E125;
	Wed, 28 Oct 2020 15:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99FF6E125
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:30:58 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id z23so5368697oic.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6CzfvnivIEtvj6xKXXqKUjstXdtKoBRAAdit4qN1a2I=;
 b=OXyAprYAPEUL1XlRwpfUgCVjA5bEQdkDu+Y4lDys32B2UFVQ2HMN53JvYlEdKW+Weh
 d1FJ0MG82d5IxaSyUHOjsXZkMn/qpNC6x6bV8YgnqjnLfEDK0Yc6o2QnUv910lD8hNWP
 cT37NOXEieTAkeOSrKCTvsOFy5bhgleWtZab6QZ1iGi9aP8h+FcJTQfYnqzv4U4Ws2aQ
 kE5tivZ8yFQLMd9VGvaA3ySTPNNRw4vNB8q3+vSelR5UIU+cubiho2y6EwyyPhHASVlo
 Myyhyvn4Bq+wTROwXiJ70he7M7LDp3/mhtRTBi9hl24mJNSn086zZgn7I49dqQleFYMS
 QY/w==
X-Gm-Message-State: AOAM533HKdYTx3QCtzpgRloxyKHByVAuheHyaHTK+CsTUzOXAbes83oq
 nI9bd/tYx33/lQZSKnBTmQ==
X-Google-Smtp-Source: ABdhPJxE9oU+7OVIoCWc40SC7yS+EHHKpQBId3YfoudCOvuyyuURrzX+lBd6EBrH1r3aDJcLC8qKgw==
X-Received: by 2002:aca:bfc2:: with SMTP id p185mr5868175oif.60.1603899057838; 
 Wed, 28 Oct 2020 08:30:57 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h14sm2078172otl.0.2020.10.28.08.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:30:57 -0700 (PDT)
Received: (nullmailer pid 4060952 invoked by uid 1000);
 Wed, 28 Oct 2020 15:30:56 -0000
Date: Wed, 28 Oct 2020 10:30:56 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 15/52] dt-bindings: tegra30-actmon: Document OPP and
 interconnect properties
Message-ID: <20201028153056.GA4060899@bogus>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-16-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-16-digetx@gmail.com>
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
 Chanwoo Choi <cw00.choi@samsung.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Oct 2020 01:16:58 +0300, Dmitry Osipenko wrote:
> Document EMC DFS OPP table and interconnect paths that will be used
> for scaling of system's memory bandwidth based on memory utilization
> statistics. Previously ACTMON was supposed to drive EMC clock rate
> directly, but now it should do it using interconnect framework in order
> to support shared voltage scaling in addition to the frequency scaling.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../arm/tegra/nvidia,tegra30-actmon.txt       | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
