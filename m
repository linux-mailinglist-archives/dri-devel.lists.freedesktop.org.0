Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348ED29A996
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 11:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DF96E1FB;
	Tue, 27 Oct 2020 10:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF426E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 10:27:12 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id s15so1427628ejf.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 03:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GA4OG+9SkS1dLHEsjc3Yoh5BLzXMpIvERF6qvUQNUY4=;
 b=SRlu2T9rnYdIQAByqdrqWno0XQLW5cE929q/Ocl+4pO/SRj6LtZVexX+VQrZlh0VyW
 ZzVy7Ilqg0YwxcMqddKyxRvvC96O4VtvbgFe6AMa59Fdl7miud1s45J8abYo9Enytofd
 LVGLjrx5uM6SzGBusENAapGX1DWWSyVbCITgcQlNj9oFLyiSgI6qOcIorYnDIMs1mZNo
 CBwrEkd8zFP5yng2jYu8HNgyfk8+1/Cg6x/rVhGHAK8h+5znG9w5OBlwMsZME5xBoQDO
 9Pw7GKmCl/TQlWuapt2XSDBntCAa+pTtUPRnsqOF0VW+mM47ZKmD43/86x0PazEvq3Q+
 /mdQ==
X-Gm-Message-State: AOAM530yQT6EnjYZqK/d9dVgfuUkCpqT0eL1nLokLpfG/E0+IIs3jCSC
 6QkpvHU2gQeAI4SFHhe1zas=
X-Google-Smtp-Source: ABdhPJwIxxoNhNQ2HMjdRGaVcneAee1se1I+5gUMBtanj7k+CUK0Tcdt0/GUf0w3biz06LUetV9mlw==
X-Received: by 2002:a17:906:1e45:: with SMTP id
 i5mr1606932ejj.203.1603794431491; 
 Tue, 27 Oct 2020 03:27:11 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id u8sm752822ejt.46.2020.10.27.03.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 03:27:10 -0700 (PDT)
Date: Tue, 27 Oct 2020 11:27:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 41/52] memory: tegra124-emc: Use
 devm_platform_ioremap_resource()
Message-ID: <20201027102707.GC17089@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-42-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-42-digetx@gmail.com>
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

On Mon, Oct 26, 2020 at 01:17:24AM +0300, Dmitry Osipenko wrote:
> Use devm_platform_ioremap_resource() helper which makes code a bit
> cleaner.

Such cleanups (and few other in this patchset) should be at beginning of
patchset or even as part of a separate one.  I think there is not much
stopping anyone from applying these... except that you put them in the
middle of big dependency.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
