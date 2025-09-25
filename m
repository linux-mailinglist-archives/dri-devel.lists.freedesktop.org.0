Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAEBBA06E8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C68010E97F;
	Thu, 25 Sep 2025 15:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKG5FPMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8B710E2AB;
 Thu, 25 Sep 2025 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758815322; x=1790351322;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6uOfs14Aqkmh7ZhIZTYtj1qjeAot/m+urOPf5j3/fJA=;
 b=UKG5FPMxD1FUDpj0o+RDLLXvViVevVPRhJHALDyPN9MCEWgSttoZkHL6
 HwfOaa6XkWSZ5h8B0fE8hCJL7WVWFRLB8lZmv15q6UI01HXdMP50uK6uf
 vmj+ZvlQcus7Hpebr2udVlyCGkHzhNtc3FI/K/PKZWtYVMOc6U5IVZOLd
 ECqy5gj8LlhhKITL2k3HN+h1vCtvLStY+LWKULuMjLqwjsWHdhAf9eIKA
 o3csz/RCRVv7xYIuUOJirNY+vjrjqwLs3N2pJtwDCk0Sds7qL0lanViyf
 4l82Lnehy5vBpsACkT3nF7OhJ+9A8DDBHaLvEQ8d4IW4mF3RTmG46uV08 w==;
X-CSE-ConnectionGUID: 961kyEXoSsyEwHDSA342ZQ==
X-CSE-MsgGUID: qs3Y2AjHSE6+PfCzblRZug==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61088465"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61088465"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 08:48:41 -0700
X-CSE-ConnectionGUID: kaVxsxiqS3qF5W5Lh4zMRQ==
X-CSE-MsgGUID: efH8+4EbSHG6IaAlrtAbQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="177209888"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.100])
 ([10.245.244.100])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 08:48:39 -0700
Message-ID: <2e518022d743762fc0c5bde8c0918ee47a18b0aa.camel@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] dma-buf: Add support for private interconnects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Kasireddy Vivek <vivek.kasireddy@intel.com>, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 25 Sep 2025 17:48:36 +0200
In-Reply-To: <20250925130849.12021-2-thomas.hellstrom@linux.intel.com>
References: <20250925130849.12021-1-thomas.hellstrom@linux.intel.com>
 <20250925130849.12021-2-thomas.hellstrom@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Thu, 2025-09-25 at 15:08 +0200, Thomas Hellstr=C3=B6m wrote:
> Add a function to the dma_buf_attach_ops to indicate whether the
> connection is a private interconnect. If so the function returns
> the address to an interconnect-defined structure that can be
> used for further negotiating.
>=20
> Also add a field to the dma_buf_attachment that indicates whether
> a private interconnect is used by the attachment.
>=20
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0include/linux/dma-buf.h | 15 +++++++++++++++
> =C2=A01 file changed, 15 insertions(+)
>=20
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d58e329ac0e7..e7191edb2125 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -475,6 +475,19 @@ struct dma_buf_attach_ops {
> =C2=A0	 * point to the new location of the DMA-buf.
> =C2=A0	 */
> =C2=A0	void (*move_notify)(struct dma_buf_attachment *attach);
> +
> +	/**
> +	 * @supports_interconnect: [optional] - Does the driver
> support a local interconnect?
> +	 *
> +	 * Does the importer support a private interconnect? The
> interconnect is
> +	 * identified using a unique address defined by the exporter
> and declared
> +	 * in a protocol header.

Actually we'd probably want to use something like a

struct dma_buf_interconnect {
	const char *name;
};

Here, and for globally known interconnects have them
instantiated somewhere common since there could be multiple exporters.

>  (RFC: Should this be a struct instead).
> +	 *
> +	 * Return: A pointer to the interconnect-private attach_ops
> structure if supported,
> +	 * %NULL otherwise.
> +	 */
> +	const void *(*supports_interconnect)(struct
> dma_buf_attachment *attach,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 const void
> *interconnect);

And similarly for stricter type-checking the return value could be a
struct dma_buf_interconnect_attach_ops {
};

which is subclassed for each interconnect-private attach ops.

> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -484,6 +497,7 @@ struct dma_buf_attach_ops {
> =C2=A0 * @node: list of dma_buf_attachment, protected by dma_resv lock of
> the dmabuf.
> =C2=A0 * @peer2peer: true if the importer can handle peer resources
> without pages.
> =C2=A0 * @priv: exporter specific attachment data.
> + * @interconnect: Private interconnect to use if any, NULL
> otherwise.
> =C2=A0 * @importer_ops: importer operations for this attachment, if
> provided
> =C2=A0 * dma_buf_map/unmap_attachment() must be called with the dma_resv
> lock held.
> =C2=A0 * @importer_priv: importer specific attachment data.
> @@ -503,6 +517,7 @@ struct dma_buf_attachment {
> =C2=A0	struct list_head node;
> =C2=A0	bool peer2peer;
> =C2=A0	const struct dma_buf_attach_ops *importer_ops;
> +	const void *interconnect;

const struct dma_buf_interconnect *interconnect;

> =C2=A0	void *importer_priv;
> =C2=A0	void *priv;
> =C2=A0};

/Thomas

