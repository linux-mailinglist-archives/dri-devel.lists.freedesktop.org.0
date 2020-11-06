Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C362A9CD4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 20:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38506E1F7;
	Fri,  6 Nov 2020 19:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EAD6E1F7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 19:02:39 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id gn41so3383364ejc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 11:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T8fJ6aT95U2Kr2dF0nwO3w//9X26eAmb1JExBHrLZmo=;
 b=qribvX4P8XAAyw5A05VHjepQAvCM7QJRWAQu4NDgV8HM4OjKtD3IiRECGqnoOJSMkT
 mzLnDY2tXXkg66ra+FOCkM4kEywlKOM/VUF2Jefke6Bbt8HyYu39gPKXsh2iXW1Ovt7b
 VA4Is6/8c8xBzpsmcvMZ13CuxmhtkagKmswqN069mCXmHbrlsMiX0A19M10yZA+H5GOa
 uPWsGRbV14fRJSMRnFHthv8yUTVVbitXeSGi2HNJtEXZYErqmVM4RVODY/lcB2L3Cnud
 BOiAnU7QZ6F4B39sgD/piIYZ0ambEuyoM3H+zhJZm80tuFMUIf1k+V3TnjAZH9t5KeJu
 1qFg==
X-Gm-Message-State: AOAM533Wt8AcqbV3NXFAOr4jcurfgDENRAIoFXTTeIoX8VKxmruPHKXg
 MqWcO6HspJm5KEIO5gvNeig=
X-Google-Smtp-Source: ABdhPJwqfVAOUVIAC5jm3/QiJARCUlh+nQ9bk1fbmTNCT4ukaRUQooVXOHfg0xXjKColincTj8d/Tg==
X-Received: by 2002:a17:906:c0d1:: with SMTP id
 bn17mr3610847ejb.114.1604689358401; 
 Fri, 06 Nov 2020 11:02:38 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id rp13sm1529896ejb.79.2020.11.06.11.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 11:02:35 -0800 (PST)
Date: Fri, 6 Nov 2020 20:02:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 28/47] memory: tegra: Add and use
 devm_tegra_memory_controller_get()
Message-ID: <20201106190234.GT65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-29-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-29-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:49:04PM +0300, Dmitry Osipenko wrote:
> Multiple Tegra drivers need to retrieve Memory Controller and there is
> duplication of the retrieval code among the drivers.
> 
> Add new devm_tegra_memory_controller_get() helper to remove the code's
> duplication and to fix put_device() which was missed in the duplicated
> code. Make EMC drivers to use the new helper.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/mc.c                | 48 ++++++++++++++++++++++++
>  drivers/memory/tegra/tegra124-emc.c      | 18 ++-------
>  drivers/memory/tegra/tegra210-emc-core.c | 39 +++++--------------
>  drivers/memory/tegra/tegra30-emc.c       | 18 ++-------
>  include/soc/tegra/mc.h                   | 10 +++++
>  5 files changed, 74 insertions(+), 59 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
