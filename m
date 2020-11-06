Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 567862A9C76
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8637D6EAD2;
	Fri,  6 Nov 2020 18:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E406EAD2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:39:01 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id za3so3296499ejb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kS8UGMj8u7kmdp82DQZoU8AThXuv2qMeUIUJVXpPFg0=;
 b=oCnjzydhBh90bRRW7J34+DIqwDIUq+J9lWCtxtM00Pr7KTW8uReaHrbJwubu47QPAs
 ryeT5hOokzmW1kcYikcrp20TdrVoWN0pEhuZrkvolv4u7FmTRHW9GHBawASVMHNqBteA
 VL4okQ+vpwYAeXOUNBCo0SQVfXCzBhjYTFaogmaObA3b2jt0ODXZFWmlygSvhxFBYCBZ
 Wnm5PGDBQhfty9rYh+gmmOopA31MQQKomO2soPtK0MSbEgJrJ1zIJe9t4twdWqnMLf7U
 QjmWF+VB7554Fj4Bz9A39CQeDfa4wIi4wvtJK8nt+GMxmtpGFM/OM3bt0LfbhFbP7QLc
 SSsQ==
X-Gm-Message-State: AOAM530+KSE2cRrAGY/CaFo4BEJTRgeoIZzqSxN31xsiqReQI/Py/vtE
 Y34eE/MMi/PAZxqenmmHfwY=
X-Google-Smtp-Source: ABdhPJzcC1h3f6tV7eDIDeRR9kukru5SAGG3SVamlaZS7gKvC+aj5wNwyPVX1PaEI66NBMNPgbM//g==
X-Received: by 2002:a17:906:7f10:: with SMTP id
 d16mr3376737ejr.104.1604687940019; 
 Fri, 06 Nov 2020 10:39:00 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id l8sm1545278ejr.106.2020.11.06.10.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:38:59 -0800 (PST)
Date: Fri, 6 Nov 2020 19:38:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 18/47] dt-bindings: memory: tegra30: Add memory client
 IDs
Message-ID: <20201106183857.GR65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-19-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-19-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:48:54PM +0300, Dmitry Osipenko wrote:
> Each memory client has unique hardware ID, add these IDs.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/memory/tegra30-mc.h | 67 +++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
