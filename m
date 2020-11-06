Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9650F2A9C36
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1196EAC3;
	Fri,  6 Nov 2020 18:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819BF6EAC3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:31:39 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id e18so2250318edy.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m3JWw/czlUscK3v/4x+B2bi2sLrcQuLQAHZQ7qhezhc=;
 b=EvzhUm0qw8Jdix6RNYwRX/j+Hpyqxl3lwTUZLTuAY/f0iO5tEeGcrNrNJXxZ8hzc+m
 4H7arRBDfU6LJiwPy8jFku/aFUFSWfk8C4u8vgeqfW1zJCtdmTyJ5hVcwulalfWsJbsL
 eIwnFLsInjjqXgLGACsTT2HinYcRMuROkcM4H5qbi2ubQolsiEIIXk+Y5Kwh+odti2MS
 z5+dbDS7guC88Ksd/PudU5aVUU3U3tW9Z+kBCU+qCsWWAtr2o11+LP8bKX62mRkIB0OZ
 801iG1CI6g+T09jw9S2akmGYuREiYWzFSv7lDYF46Ei5+YAEqS4Nrg2odwdlGCgLXi9N
 NCaw==
X-Gm-Message-State: AOAM5336UVHhx945NmgYSMEfZiKL2Bx5D0OQPTXUSoxewPdoRPDam7h5
 sP0paRIQzoTL3dLakAm8pi4=
X-Google-Smtp-Source: ABdhPJyPCnCNyqQEGMYqe6aJV5PmuafkDpPyxmHMBtBR3WyFPPgLZQFHhyXhGi5TtzLjvkxw+Fwlwg==
X-Received: by 2002:aa7:d1d8:: with SMTP id g24mr3483957edp.324.1604687498112; 
 Fri, 06 Nov 2020 10:31:38 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id fx1sm1481160ejb.12.2020.11.06.10.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:31:37 -0800 (PST)
Date: Fri, 6 Nov 2020 19:31:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 09/47] dt-bindings: memory: tegra30: mc: Document new
 interconnect property
Message-ID: <20201106183135.GI65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-10-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-10-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:48:45PM +0300, Dmitry Osipenko wrote:
> Memory controller is interconnected with memory clients and with the
> External Memory Controller. Document new interconnect property which
> turns memory controller into interconnect provider.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra30-mc.yaml       | 5 +++++
>  1 file changed, 5 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
