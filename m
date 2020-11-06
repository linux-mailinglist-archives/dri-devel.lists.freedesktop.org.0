Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E32A9BF5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D0D6EAB2;
	Fri,  6 Nov 2020 18:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233346EAB2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:23:52 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id 7so3245624ejm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VrtMo5QUA/nKWHwa7QShX9sskM8VzXmSoKz6iFABVM4=;
 b=lepwXTGjGzq/0b2U7dV4aD58gCgz4J25y+fUwcbLypjBXPHFCgLT7jNSwJGmiHZDUJ
 e7JGlLLslCU8V4jSWQnoMZb71xOtY0mwQ//zZGD2RpxipdPa/leW71VeiHvzAjNsIhwk
 0h58dBJsLNkTct/x4vQiPoNMpV0Zm6vKuLFJqpnWGxZFYTsp5UtW3hU/EiKsZ7mGAY+Z
 8oVXbKtIFhEah116nsR4YyNAEhgVMkluVUOkXzXu1LmFXZe+qCDdW0LQSGwiRb7/NaAP
 BWQMSjfJVaksIMBKifSV79JipgtjI6SYUiqySPm/XB5hf4CGYwJX7W0ZuSOcg5gJGb9m
 yQ4A==
X-Gm-Message-State: AOAM532+inUu1lQAV4ybXq7kaDg6je/8Ac9n7UU5ych4WVFm9/LO8BgE
 QBS3EKgV0Y6iPb9zWKCnj08=
X-Google-Smtp-Source: ABdhPJz6AB5PsPwDbMjubDY9JAv0hJ/crPkYae53nwFImXuU12ckKjyRf/L3QnKSb1WD92Gg1VLlVw==
X-Received: by 2002:a17:906:e15:: with SMTP id
 l21mr3438494eji.509.1604687030667; 
 Fri, 06 Nov 2020 10:23:50 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id m27sm1476520eji.64.2020.11.06.10.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:23:49 -0800 (PST)
Date: Fri, 6 Nov 2020 19:23:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 01/47] clk: tegra: Export Tegra20 EMC kernel symbols
Message-ID: <20201106182347.GA65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-2-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:48:37PM +0300, Dmitry Osipenko wrote:
> We're going to modularize Tegra EMC drivers and some of the EMC-clock
> driver symbols need to be exported, let's export them.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra20-emc.c | 3 +++
>  1 file changed, 3 insertions(+)

Thanks, applied.

I'll keep all Tegra patches on separate branch and I can provide
a stable tag for other tree. Just let me know.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
