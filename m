Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C722A9D85
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 20:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BD16EADF;
	Fri,  6 Nov 2020 19:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035AC6EADF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 19:08:00 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id s25so3396935ejy.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 11:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JSRlYHuywdWRpC+6sKjWuShna66ePHGcqQt+y1/po+0=;
 b=sn2Wi9YrAcmUUQe7l890hmL1LSozH2XYzv033oAuZPj3B8AE6XirRuw4ZNs+XnEXqG
 YBJmlNKqP63npaQLUoAB3LDfq42dW7Vb728vhoRkuIwRZDJSs2PhYmolLPBJljNn6x95
 69ZpqFCjFiYSMrcTN90SyHIG/BCl8ZxHH0Zkpi31N+BH5QCyGXtq6PHlQOITTqO2Fj9U
 DdhxDTntGcvxSQOfJDhPjPJA9dBlMZSp2A1/8uVfXQhJ3ESs3QnZVYcM9BlQURCQA3m2
 1rQhTDzOoVQNmvwZtzVyOSlBtUGmDQt50koFwqtJbFOByCDX7hCgG/9MUQxH+jVvP57z
 Kmrw==
X-Gm-Message-State: AOAM531Z2Ojvr0CveNm4H6QEQhZKQpyJVlVuokrbyGRcIUfi+RR7fHit
 wT+f5EzGjEu7/FYN55Z8ZIfxJ/EG+28=
X-Google-Smtp-Source: ABdhPJzFa68ebDwk5lalVoltFD4aMGkh6HgSZordIoLzyIQ6wpTge+Rgk+a9czQkI4VGwM2RcAkE5w==
X-Received: by 2002:a17:906:d94:: with SMTP id
 m20mr3492001eji.279.1604689678622; 
 Fri, 06 Nov 2020 11:07:58 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id n1sm1676128edt.66.2020.11.06.11.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 11:07:57 -0800 (PST)
Date: Fri, 6 Nov 2020 20:07:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 33/47] memory: tegra20-emc: Make driver modular
Message-ID: <20201106190755.GY65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-34-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-34-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:49:09PM +0300, Dmitry Osipenko wrote:
> Add modularization support to the Tegra20 EMC driver, which now can be
> compiled as a loadable kernel module.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig       |  2 +-
>  drivers/memory/tegra/tegra20-emc.c | 17 ++++++++++++-----
>  2 files changed, 13 insertions(+), 6 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
