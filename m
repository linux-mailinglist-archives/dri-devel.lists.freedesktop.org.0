Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76692D4B64
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 21:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE2D6E193;
	Wed,  9 Dec 2020 20:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7CF6E193
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 20:17:13 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id o11so2675231ote.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 12:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LQJE8H8jL0GuVk4uta0YS9al3HMoyg6NYYR824t9oo4=;
 b=HV0x/w3LqodlPhoYZdERbGDgUUaTEhLLuz9rMpsQ8hblVfiEVLETkPr15mGDxGNIzk
 VcoqoW3KAV+vUTc4Rp9EpmMi2BN01/WbNNBJb/QuJCMhOtEIw4XIb/yoLX8u6XNgyIAi
 Xt462fqqNME9REGnWozbIjLHZpjqm+a+4ePHT+PsmXi8MJ5Yq+bwPUubdOHqaZPs3bZ+
 QHmmXO9ds6VsKcWB3C89Gjv/Gcvv0O07QctMSxbSIUF7KWOEzuCWUqA6xLAoq1Iux8jq
 W9oRGt//Om2OmpX3qYPS6wdgha0B21HorimTBvQcDDQERwvKes6rwhIKPWzVRHlTihty
 bv2A==
X-Gm-Message-State: AOAM530xh2qMu0GnLe1DB/+jrzo0cGicSjWES9oSQCsadwGAy7UppZBE
 LOx3eaUvXHJYEPFEIodE6A==
X-Google-Smtp-Source: ABdhPJzdsQhV4dln150sXm2W8SFoCWPsrRVllQ2LeGuEnPn5uQhzfTQIRRsvSJDo1MvP2BtF8BbYew==
X-Received: by 2002:a05:6830:3151:: with SMTP id
 c17mr3317872ots.336.1607545032918; 
 Wed, 09 Dec 2020 12:17:12 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 11sm595360otg.34.2020.12.09.12.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 12:17:12 -0800 (PST)
Received: (nullmailer pid 869734 invoked by uid 1000);
 Wed, 09 Dec 2020 20:17:09 -0000
Date: Wed, 9 Dec 2020 14:17:09 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v11 01/10] dt-bindings: memory: tegra20: emc: Document
 opp-supported-hw property
Message-ID: <20201209201709.GA869677@robh.at.kernel.org>
References: <20201203192439.16177-1-digetx@gmail.com>
 <20201203192439.16177-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203192439.16177-2-digetx@gmail.com>
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
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
 Nicolas Chauvet <kwizart@gmail.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Dec 2020 22:24:30 +0300, Dmitry Osipenko wrote:
> Document opp-supported-hw property, which is not strictly necessary to
> have on Tegra20, but it's very convenient to have because all other SoC
> core devices will use hardware versioning, and thus, it's good to maintain
> the consistency.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt      | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
