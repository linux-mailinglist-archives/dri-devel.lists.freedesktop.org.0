Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1605E2A9D8E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 20:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206D16EAE1;
	Fri,  6 Nov 2020 19:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585876EAE1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 19:09:02 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id t11so2326512edj.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 11:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qK37W3xTCJXp7MUelHSeuVBr0ncAlJOu059iUAhSoPQ=;
 b=FO+ZuAG2fWqOnm2/LquL9J5xj/kZbpHnhaaZMQo5QiDnRGXSYrcWFRbYNN/YNT0Bzf
 orum/tPNs9rjzR6YKtHWPTAUNvZrPeI+ohxVvosC+GP5/MPVAnlOMEbWl2IJBhehySiV
 e+qyXUcKeD454vF7kN4nuMTGYPf4nc1/+UQOc28t/7Z/nvjmztYjzqYZg1v5d8w5C8mm
 /i6WhXJ+TeoOD3gljaBOdvBTYUJ06t2z9ItvzJHwRt9DYEZPCPEgzw8WPW38xocNObae
 C2Vz07pXYrHr9phE0H4Jx5ZnxW+C4HWowzUb6+0wSWiJB0VNbbGZfxVpj+hFWg/jzpgY
 nCXQ==
X-Gm-Message-State: AOAM5329na4/Vfwo283GVStn6+eIHm50rgjPpLEx6KpKR7zky2NbhZW9
 9fkS0val3xOu2arKPGTGFxs=
X-Google-Smtp-Source: ABdhPJwdAHZPSXDWTQYtqObDqNkh3xX1JcIZrPeM6I5RcvHVIxwL8vDjKJ29lIgHkpGyN+FLmALthQ==
X-Received: by 2002:aa7:dd4a:: with SMTP id o10mr3580286edw.109.1604689741010; 
 Fri, 06 Nov 2020 11:09:01 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id a10sm1628669edu.78.2020.11.06.11.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 11:08:59 -0800 (PST)
Date: Fri, 6 Nov 2020 20:08:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 34/47] memory: tegra20-emc: Continue probing if
 timings are missing in device-tree
Message-ID: <20201106190858.GZ65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-35-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-35-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:49:10PM +0300, Dmitry Osipenko wrote:
> EMC driver will become mandatory after turning it into interconnect
> provider because interconnect users, like display controller driver, will
> fail to probe using newer device-trees that have interconnect properties.
> Thus make EMC driver to probe even if timings are missing in device-tree.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 34 ++++++++++++++----------------
>  1 file changed, 16 insertions(+), 18 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
