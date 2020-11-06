Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F74C2A9C1E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE246EAC4;
	Fri,  6 Nov 2020 18:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6FD6EAC4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:29:20 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id 7so3266373ejm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wp1Q6KNiL9YKZH7bSvi2WyVUJFnoIVwyd49z4fxloYA=;
 b=J2EoWVOH+952O1BnTOrpA2qZvaCYL742v/w6pzyPbICIv52IFtFR5ehbOQNbmNLQoq
 ezc523g0AgmJ5gtZMa3fxVNkAUBWfj/Cuq0NsC5Rv6CpGWPg8KfoCuRvFTi7Qo2+lkdp
 LEhACuYCSh3k1YZnUwZ3z8Yo/xUGdhxIo4O1AeI00TcKGTTNc7AYJPlAw3Q6pvK5Hhof
 e2DuH5stgZTsoRAxlBANG7KacMYQ01GlMbjiO2SGm212UA7XyhOQvQizTAkIskl9mYUu
 DH/sSfU3cr0mzdEEmyXXkKeGZmMoD00worAyUnHdpEkUMiMO2DqI1QRA/DH4Eny3rLUL
 rJQg==
X-Gm-Message-State: AOAM533THL5HxL2ITkHIXnRz86hkID50JPDLp4p84uoCJBTN+veot1MF
 xuQFlygcXMdnEkehiZ8rwr0=
X-Google-Smtp-Source: ABdhPJwKB3kkwuN91Iv9ZSc+KN8sH7TKYii9j8H0M+uTpYlKqNSgp81NFCnF8WEz3Paw4KtpAx5EdQ==
X-Received: by 2002:a17:906:4712:: with SMTP id
 y18mr3306818ejq.51.1604687359083; 
 Fri, 06 Nov 2020 10:29:19 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id x8sm1589921edv.43.2020.11.06.10.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:29:17 -0800 (PST)
Date: Fri, 6 Nov 2020 19:29:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 05/47] dt-bindings: memory: tegra20: emc: Document
 nvidia,memory-controller property
Message-ID: <20201106182916.GE65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-6-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:48:41PM +0300, Dmitry Osipenko wrote:
> Tegra20 External Memory Controller talks to DRAM chips and it needs to be
> reprogrammed when memory frequency changes. Tegra Memory Controller sits
> behind EMC and these controllers are tightly coupled. This patch adds the
> new phandle property which allows to properly express connection of EMC
> and MC hardware in a device-tree, it also put the Tegra20 EMC binding on
> par with Tegra30+ EMC bindings, which is handy to have.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
