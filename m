Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3714729A712
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 09:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E846EB29;
	Tue, 27 Oct 2020 08:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9696EB29
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 08:55:53 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id dn5so576194edb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 01:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8h35Fp3KGPJbdlP2u/VcAhTjbKZxy2MlAj+dFH66N4U=;
 b=ZsNw/aje9jvbDOhnSGi4v8XiuFU0EL22s+chXMmbZ1kZQuTIOWR507ri0+dJNqfkSe
 Wko8xeRqUuxXlhB63NvWRhI804JTRckpoYGvLTObSHpZnViVDO/LIzlmLZwtJICct8Yq
 dH/c47voAB22ZaaCdPI7AZyrw9cFG1hWIbcYg44Ak6GUkLE79Wj/2KAZtskT+e118Sd2
 RTNzCUYZXZjvjM0uTjfFC6NxT/aqUbwN7iI31vMAfzEfy7iUQympr24ikZ/8PsNqLxDt
 Mxe8XsNAozG3/IpWUN6ap6zuc8n05/I/dXCQM1tlCutMdXsgcPSMUmvAPNj0/UctYkuc
 Jd8w==
X-Gm-Message-State: AOAM530LfT9o0B6phAKEmMTNacyq70g0I7cVJltqlz7ag6fXRX8CIyf/
 hMSS9GKPTu7kaxPWqP0ehMI=
X-Google-Smtp-Source: ABdhPJyxkG4tQYebevVwUfr5tpTrVVR5vWiNFfd4BicVUd+tfnGH6GSr02QqZUC9VLRFzIbgcKMDXA==
X-Received: by 2002:aa7:c6d9:: with SMTP id b25mr1071873eds.27.1603788952482; 
 Tue, 27 Oct 2020 01:55:52 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id d11sm506794eds.83.2020.10.27.01.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 01:55:51 -0700 (PDT)
Date: Tue, 27 Oct 2020 09:55:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 05/52] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
Message-ID: <20201027085548.GE4244@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-6-digetx@gmail.com>
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

On Mon, Oct 26, 2020 at 01:16:48AM +0300, Dmitry Osipenko wrote:
> Memory controller is interconnected with memory clients and with the
> External Memory Controller. Document new interconnect property which
> turns memory controller into interconnect provider.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-mc.txt          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
> index e55328237df4..739b7c6f2e26 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
> @@ -16,6 +16,8 @@ Required properties:
>    IOMMU specifier needed to encode an address. GART supports only a single
>    address space that is shared by all devices, therefore no additional
>    information needed for the address encoding.
> +- #interconnect-cells : Should be 1. This cell represents memory client.
> +  The assignments may be found in header file <dt-bindings/memory/tegra20-mc.h>.

This is a list of required properties so you break the ABI. All existing
DTBs will be affected.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
