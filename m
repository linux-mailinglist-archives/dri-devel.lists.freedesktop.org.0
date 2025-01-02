Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF6E9FF814
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 11:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E6410E23A;
	Thu,  2 Jan 2025 10:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="swtrZoMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-71.smtpout.orange.fr
 [80.12.242.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C359A10E23A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 10:32:41 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id TIVDtPSJjTjIXTIVGtoUGd; Thu, 02 Jan 2025 11:32:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1735813960;
 bh=oIy4h6myCE9v5NQp61GRyssTTdt9xYDdFfwRLBqJIDw=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=swtrZoMGepjZWNNAMzAdUpPhr9dMP/Fwu1C5cyI05rm65XfLag7OwPCz6yqWeOyk0
 QlYz9AXoLVNtzhi8M0OqKs4zm5g4eZlJFjPOejgVL4e3CQeSrAmKZue3XQlX3XbgmK
 nRJjEwKYd7n83WhcV7RsIFMQyHp9S2SDoHSKh+tDJ+PZ2j6vM9rgtiIYuG2QGy6AdK
 OrvAL0trVusI+uMq4s6/QuB4Qqh6VTXiLNUHebq9CEDZEHOFfsoBoGn6aMnGdPnjPO
 aHaOUmsTTZGHo0XnGLg382uTD+q8bJuOOziFZeXWlYkWj/c1JuM6clHG32zTSsTw0t
 Dn8lJ4UVRWiYA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 02 Jan 2025 11:32:40 +0100
X-ME-IP: 90.11.132.44
Message-ID: <2c89e56d-26e9-4ef6-9da3-4b0121163b30@wanadoo.fr>
Date: Thu, 2 Jan 2025 11:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] mtd: add driver for intel graphics non-volatile
 memory device
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tomas Winkler <tomasw@gmail.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-3-alexander.usyskin@intel.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250101153925.865703-3-alexander.usyskin@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 01/01/2025 à 16:39, Alexander Usyskin a écrit :
> Add auxiliary driver for intel discrete graphics
> non-volatile memory device.
> 
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Co-developed-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

...

> +struct intel_dg_nvm {
> +	struct kref refcnt;
> +	void __iomem *base;
> +	size_t size;
> +	unsigned int nregions;
> +	struct {
> +		const char *name;
> +		u8 id;
> +		u64 offset;
> +		u64 size;
> +	} regions[];

__counted_by(nregions)?

> +};
> +
> +static void intel_dg_nvm_release(struct kref *kref)
> +{
> +	struct intel_dg_nvm *nvm = container_of(kref, struct intel_dg_nvm, refcnt);
> +	int i;
> +
> +	pr_debug("freeing intel_dg nvm\n");
> +	for (i = 0; i < nvm->nregions; i++)
> +		kfree(nvm->regions[i].name);
> +	kfree(nvm);
> +}
> +
> +static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> +			      const struct auxiliary_device_id *aux_dev_id)
> +{
> +	struct intel_dg_nvm_dev *invm = auxiliary_dev_to_intel_dg_nvm_dev(aux_dev);
> +	struct device *device;
> +	struct intel_dg_nvm *nvm;
> +	unsigned int nregions;
> +	unsigned int i, n;
> +	size_t size;
> +	char *name;
> +	int ret;
> +
> +	device = &aux_dev->dev;
> +
> +	/* count available regions */
> +	for (nregions = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> +		if (invm->regions[i].name)
> +			nregions++;
> +	}
> +
> +	if (!nregions) {
> +		dev_err(device, "no regions defined\n");
> +		return -ENODEV;
> +	}
> +
> +	size = sizeof(*nvm) + sizeof(nvm->regions[0]) * nregions;

struct_size()? (and maybe no need for size)

> +	nvm = kzalloc(size, GFP_KERNEL);
> +	if (!nvm)
> +		return -ENOMEM;
> +
> +	kref_init(&nvm->refcnt);
> +
> +	nvm->nregions = nregions;
> +	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> +		if (!invm->regions[i].name)
> +			continue;
> +
> +		name = kasprintf(GFP_KERNEL, "%s.%s",
> +				 dev_name(&aux_dev->dev), invm->regions[i].name);
> +		if (!name)
> +			continue;
> +		nvm->regions[n].name = name;
> +		nvm->regions[n].id = i;
> +		n++;
> +	}

Should we set the exact number of regions, should a kasprintf() fail?
	nvm->nregions = n;
This would make __counted_by be more accurate in its check.

> +
> +	nvm->base = devm_ioremap_resource(device, &invm->bar);
> +	if (IS_ERR(nvm->base)) {
> +		dev_err(device, "mmio not mapped\n");
> +		ret = PTR_ERR(nvm->base);
> +		goto err;
> +	}
> +
> +	dev_set_drvdata(&aux_dev->dev, nvm);
> +
> +	return 0;
> +
> +err:
> +	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> +	return ret;
> +}

...

CJ

