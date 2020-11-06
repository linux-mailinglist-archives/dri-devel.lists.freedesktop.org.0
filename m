Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40BC2A9C32
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB9C6EAC9;
	Fri,  6 Nov 2020 18:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7BA6EAC9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:31:14 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id w13so3228227eju.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:31:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VEft+6XOFbVGdGN5mjfjNtpuHd4aAsAtWuXObA5Y2L8=;
 b=L9+h6eCYw8y6Y7IC9Csm0oZhDxpdF1cXTKG88W14zeiwyPgUUGGcgiPX/UiygpAMPz
 XOZYt0Uh9X758rzP1ms8R5qz7YMJXRMFYZUsoc03SAdi5D9Js51oxbcmkdyepsLj4/Su
 WTJzO7EYutmCg0/0T09b7zPOprmpV1FDdjv2Pk/09KCrAl4PSv0lqkIkq2mVH21gCS9h
 urlQ2ecTH5LliOXs1xtaoop8em5zUvFDpnMLLaP75JUm2WnZqi+rltRxoa1Yoxa11RAp
 4T7qKthLc5QdeLJCZ1WbnSR4AvLVgnIDsLvam1rzZBma3tC341cHlZz5iGD0T3sL/x9I
 K4+g==
X-Gm-Message-State: AOAM531UvcP41yeeYV9NaOrcqdZjep/ClK2s0FWzuvKSHAgukkJmr/JQ
 D9r0XXHwIhUYfFhwcKK0NU8=
X-Google-Smtp-Source: ABdhPJxPIV5PiN7jLWbfWUx3Y5g4rMFf+UvCHU9pX4oEQ+v3q8JGHpKeNO2AvYwjZE6lCCqq1PFpFg==
X-Received: by 2002:a17:906:2490:: with SMTP id
 e16mr3307521ejb.17.1604687472735; 
 Fri, 06 Nov 2020 10:31:12 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id h2sm1465606ejx.55.2020.11.06.10.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:31:11 -0800 (PST)
Date: Fri, 6 Nov 2020 19:31:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 08/47] dt-bindings: memory: tegra20: emc: Document OPP
 table and voltage regulator
Message-ID: <20201106183109.GH65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-9-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-9-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:48:44PM +0300, Dmitry Osipenko wrote:
> The SoC core voltage can't be changed without taking into account the
> clock rate of External Memory Controller. Document OPP table that will
> be used for dynamic voltage frequency scaling, taking into account EMC
> voltage requirement. Document optional core voltage regulator, which is
> optional because some boards may have a fixed core regulator and still
> frequency scaling may be desired to have.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra20-emc.txt    | 16 ++++++++++++++++

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
