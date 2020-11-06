Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D42A32A9DAC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 20:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93246EAE3;
	Fri,  6 Nov 2020 19:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2D86EAE3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 19:13:25 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id e18so2364014edy.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 11:13:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9EZhY8MX2ORnPTYlgHuLdEC9xYXRcHwFhL5jilyHyBk=;
 b=cRp422QEgKXtYmzStbKw9s7XU7e0b3teuagOTCs/7HcI93r58YVgd9MyGl002hvg2n
 p7s61kDTMXimBEe3ZNhO4YfiBzH+ZrCYGD+q+MNjaZdcLlRyfej7Cu0MUlV/M3XPYAIE
 eRmmqqKQXNOduHT3E2l4d7HL9kS61yb8Tro89tleiUex1l1L6KYpKjThpk2664jf21gU
 Ar/3o5Ie9ZWPLmBXKYyfVhv1+LnB6tRUjd2advBpSTrpDFUrFqSm503l6g4dgZYysS4k
 xXVWfQiwp/R9NsJXZoxJ0qePTPtm5MHTV1Gk400T8t85TGuYewmQPdpWdEJU75l+ZAOA
 qS/A==
X-Gm-Message-State: AOAM532b306gSrNPTIWuoZdB9t2TYopINz7c2e919NmruOvLw1lR8rBa
 2ca6NuBFz08UxsCrG2rPb7kHy09iO8I=
X-Google-Smtp-Source: ABdhPJy7Qz/mYqSzbcnBR4NZTFT5VYfhsIq8GGjSYs73p0hgywJkMPbiryDfg2BYkIp0DwxRJWQNUA==
X-Received: by 2002:aa7:d801:: with SMTP id v1mr3516842edq.250.1604690003690; 
 Fri, 06 Nov 2020 11:13:23 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id b1sm1635774edw.27.2020.11.06.11.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 11:13:21 -0800 (PST)
Date: Fri, 6 Nov 2020 20:13:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 36/47] memory: tegra20-emc: Add devfreq support
Message-ID: <20201106191319.GB65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-37-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-37-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:49:12PM +0300, Dmitry Osipenko wrote:
> Add devfreq support to the Tegra20 EMC driver. Memory utilization
> statistics will be periodically polled from the memory controller and
> appropriate minimum clock rate will be selected by the devfreq governor.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig       |  2 +
>  drivers/memory/tegra/tegra20-emc.c | 92 ++++++++++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
> 

I see this one still received comments. I skipped the DTS patches and
applied everything till patch #35. I understand you will send v8, so in
such case please skip the applied ones (you can rebase on my for-next or
on Monday's linux-next).

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
