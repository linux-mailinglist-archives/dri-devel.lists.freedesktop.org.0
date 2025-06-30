Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1B6AED44A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 08:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AE889CAD;
	Mon, 30 Jun 2025 06:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="NFaZ1cW4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF39B89CAD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 06:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hdpPcH72q71eFKMVk37M5XbLZ4kKadKnisDL++Ydm+w=; b=NFaZ1cW4W6ByCiKmTde1ZePKCJ
 43LK9PnLdTN7kpwb4rGLfvELiphWVDL65ANp8TCqExFHc7WCEd1957r/VbyI8OZ3WgYq/RU+YNqte
 i7uQnJAFDQP3LlicQDfrWk3wyTlCqrYtpsQJqd8HDS+8aXmHjzvcbz1WJuPis4H0DYaOZvJ61d04g
 eA3mrIOQ+N1QhP00S8JaISLfkBa+u1QqZ9nw0YqSStp5g50tHZhWQNdC6MYCpg6zB0Yy6UmoHNnRJ
 lmEehZBIc/JPQle0y7hZ4qVMPXAgdX+7DxYDQM0lwZQDyhiN1Nd1Q1AjsrJnCzJebhwJWwF0ExYxk
 1GwrpFoQ==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1uW7lC-00A4zL-2n;
 Mon, 30 Jun 2025 09:12:59 +0300
Message-ID: <0bed2152-8bf7-4091-8c2d-126f1ec3be5b@kapsi.fi>
Date: Mon, 30 Jun 2025 15:11:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/tegra: Add NVJPG driver
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20250611-diogo-nvjpg-v2-0-01f8c76ea90f@tecnico.ulisboa.pt>
 <20250611-diogo-nvjpg-v2-1-01f8c76ea90f@tecnico.ulisboa.pt>
Content-Language: en-US
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20250611-diogo-nvjpg-v2-1-01f8c76ea90f@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/11/25 9:18 PM, Diogo Ivo wrote:
> ...
> +static int nvjpg_load_falcon_firmware(struct nvjpg *nvjpg)
> +{
> +	struct host1x_client *client = &nvjpg->client.base;
> +	struct tegra_drm *tegra = nvjpg->client.drm;
> +	dma_addr_t iova;
> +	size_t size;
> +	void *virt;
> +	int err;
> +
> +	if (nvjpg->falcon.firmware.virt)
> +		return 0;
> +
> +	err = falcon_read_firmware(&nvjpg->falcon, nvjpg->config->firmware);
> +	if (err < 0)
> +		return err;
> +
> +	size = nvjpg->falcon.firmware.size;
> +
> +	if (!client->group) {
> +		virt = dma_alloc_coherent(nvjpg->dev, size, &iova, GFP_KERNEL);
> +
> +		err = dma_mapping_error(nvjpg->dev, iova);
> +		if (err < 0)
> +			return err;

This needs to check the return value of dma_alloc_coherent. Looks like 
this was fixed in vic.c by Robin 
(5566174cb10a5167d59b0793871cab7990b149b8) but the issue persisted into 
nvdec.c in parallel, so it needs to be fixed there as well. I can send 
out the fix for nvdec.c.

With that fixed,

Acked-by: Mikko Perttunen <mperttunen@nvidia.com>

Thanks!
Mikko

