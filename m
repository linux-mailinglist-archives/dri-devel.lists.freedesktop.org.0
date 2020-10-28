Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474E829D0BA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876A86E4D4;
	Wed, 28 Oct 2020 15:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744DC6E4D4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:31:17 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id o14so4582008otj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z8qRO5fdt5NREdYFOvySAdOEhiWbrwmj4h+0kAQzcnw=;
 b=hy13YcvAbFt797yrQqO1eos/EHZ0LtI3scaeQ4/wIqnrnXFEMKg1cifhfZaG78pebP
 tB4ZbphYyb3+G0/qZiF5afKF15dUw/sW7jHVWGMkWIEdTzSXvTwrlzTu0V1oG9qratFo
 f8CRSQrOCVAE5qiumfaJocGjSgVB3ODGx7UGklogeBEEwmTV6H2F75mAVuolt9jjwLX6
 7re7eAjP+8AYFHwbYPm9Q7YKTj8zfzZ6EK65briB6lHeZyVLdo7hKEhV13df1ynySngg
 hV3OXrack8Sv6FexusaQZISbc7dpvZ+l2c9xDV65gH4zl9FRtTADhT8owcbd+yedDFdM
 ZUMw==
X-Gm-Message-State: AOAM531tegIwopjf1Bw0D/j4r8ekW2Jo2sUbmccM3+eVYxdVCJhKj+p7
 anLF6b+LWalQREMnwyxSDA==
X-Google-Smtp-Source: ABdhPJz4rAItM9Tjr+B041aWkQLcJ4P9I8LjHRMJj9yAlwEt4a/QxGWhvpDv4Tv7mKuo7b3lREU2dg==
X-Received: by 2002:a05:6830:144b:: with SMTP id
 w11mr5358743otp.82.1603899076759; 
 Wed, 28 Oct 2020 08:31:16 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 105sm2094205otf.52.2020.10.28.08.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:31:15 -0700 (PDT)
Received: (nullmailer pid 4061457 invoked by uid 1000);
 Wed, 28 Oct 2020 15:31:14 -0000
Date: Wed, 28 Oct 2020 10:31:14 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 19/52] dt-bindings: memory: tegra124: Add memory
 client IDs
Message-ID: <20201028153114.GA4061412@bogus>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-20-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-20-digetx@gmail.com>
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
 dri-devel@lists.freedesktop.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Oct 2020 01:17:02 +0300, Dmitry Osipenko wrote:
> Each memory client have a unique hardware ID, this patch adds these IDs.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/memory/tegra124-mc.h | 68 ++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
