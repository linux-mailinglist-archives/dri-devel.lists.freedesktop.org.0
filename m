Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576B34C92A0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 19:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F6489E05;
	Tue,  1 Mar 2022 18:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1835C89F31
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 18:12:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3931D1042;
 Tue,  1 Mar 2022 10:12:15 -0800 (PST)
Received: from [10.57.39.47] (unknown [10.57.39.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4019E3F73D;
 Tue,  1 Mar 2022 10:12:12 -0800 (PST)
Message-ID: <4a748c85-4fdb-0c10-19d8-0379b9e42ab5@arm.com>
Date: Tue, 1 Mar 2022 18:12:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 1/9] dt-bindings: host1x: Add iommu-map property
Content-Language: en-GB
To: cyndis@kapsi.fi, thierry.reding@gmail.com, jonathanh@nvidia.com,
 joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com
References: <20220301161455.4037062-1-cyndis@kapsi.fi>
 <20220301161455.4037062-2-cyndis@kapsi.fi>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220301161455.4037062-2-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-01 16:14, cyndis@kapsi.fi wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Add schema information for specifying context stream IDs. This uses
> the standard iommu-map property.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v3:
> * New patch
> v4:
> * Remove memory-contexts subnode.
> ---
>   .../bindings/display/tegra/nvidia,tegra20-host1x.yaml        | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> index 4fd513efb0f7..0adeb03b9e3a 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> @@ -144,6 +144,11 @@ allOf:
>           reset-names:
>             maxItems: 1
>   
> +        iommu-map:
> +          description: Specification of stream IDs available for memory context device
> +            use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to

Nit: maybe "context IDs 0..n" for maximum possible clarity?

Either way, though, I'm happy that if the simplest and most 
straightforward approach works, then it's the best choice.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Cheers,
Robin.

> +            usable stream IDs.
> +
>         required:
>           - reg-names
>   
