Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D420F29A706
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 09:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFE86EB25;
	Tue, 27 Oct 2020 08:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F956EB25
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 08:54:22 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id d6so1035759ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 01:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pl76InKLYF2UwW9waAthO63zpy2TGEsyyfIicHpInyw=;
 b=RMmxBnOT61RQ4KmoS5z+r6tv0k1mD2LOsgvHcF5w2gFe1vwuGa6YeNFptNWpcXIIGW
 TEO7fybyF+YrLEqlvf4VFTfkVymRGTMNphbcy+KkyWSURjqWLu3C+N50u12NURKS5cFm
 ukZ+p6EhfR0N1GM2KBg5KeNpp29uWenUo54/kDbCApVd+1a7wfOQBK2wvnvjPNCNofY7
 r6oCJuZEMP9IYbx5fpl+7eMtqAIQGQX0O+HdGYEDzpGPxn94s1tW3R+b4gcq2ad6Poqb
 I37vp4vW9PO1m8+Ovr3phcfAiBdZEjTMPQfdnMwxf/5e9GRzq5L7YDe7lx1zK3EJXy3o
 hEkA==
X-Gm-Message-State: AOAM530/DErFjf2FQav8zEZjveM2qr8ee59eioBMtNjfwofqPmNWNj01
 s8Ebk0XikY3VtMxzxKRMIKU=
X-Google-Smtp-Source: ABdhPJzmpTJ+ZcG8BezO09PSRSuSnCiQ/tWevDipQfx8F299/Gs4qAXSPmuMp8sWXOngl8h7jPxqAw==
X-Received: by 2002:a17:906:23f2:: with SMTP id
 j18mr1312596ejg.526.1603788861157; 
 Tue, 27 Oct 2020 01:54:21 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id p9sm574643ejo.75.2020.10.27.01.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 01:54:20 -0700 (PDT)
Date: Tue, 27 Oct 2020 09:54:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 04/52] dt-bindings: memory: tegra20: emc: Document
 nvidia,memory-controller property
Message-ID: <20201027085417.GD4244@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-5-digetx@gmail.com>
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

On Mon, Oct 26, 2020 at 01:16:47AM +0300, Dmitry Osipenko wrote:
> Tegra20 External Memory Controller talks to DRAM chips and it needs to be
> reprogrammed when memory frequency changes. Tegra Memory Controller sits
> behind EMC and these controllers are tightly coupled. This patch adds the
> new phandle property which allows to properly express connection of EMC
> and MC hardware in a device-tree, it also put the Tegra20 EMC binding on
> par with Tegra30+ EMC bindings, which is handy to have.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> index 567cffd37f3f..1b0d4417aad8 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> @@ -12,6 +12,7 @@ Properties:
>    irrespective of ram-code configuration.
>  - interrupts : Should contain EMC General interrupt.
>  - clocks : Should contain EMC clock.
> +- nvidia,memory-controller : Phandle of the Memory Controller node.

It looks like you adding a required property which is an ABI break.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
