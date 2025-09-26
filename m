Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B0BA3F2C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 15:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB9310EA67;
	Fri, 26 Sep 2025 13:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgB6UtNb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D89D10EA6A;
 Fri, 26 Sep 2025 13:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758894687; x=1790430687;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Pf8dYCye629/6XsQbJXkZE3hVgLXHVcCizzlAfsLlMM=;
 b=OgB6UtNbwChJE1YyT5PpYxV47GzLsp37EI0Vv8ZpRPtSA7Wu/livPmb2
 Tp4rnTN1xk6iyMOO8GcziJbXjL2LK4vD/McrmmHZH+rRY410cy2uOx3vZ
 cbEBjkd6Asfo9VFAFJ80f6GqAj+3DOkqmDYWg+SwkZ3FVfBBA9I/Cf5lb
 NDB1tt5WtebXgaODVwEJycQadeDvX9Ns8rve6BXUgmJCfeIp2cuNE6hoz
 49BIi7zWK0KyFBORRmNBWdYm25a1N9LSrpOqyaRgJDQovNRyQuuG7hfb5
 OTe56e02R/HTQQUX2n8TCSgsCQ+7oZpMe0Cey5SZdAbt8ws0qYGdAZv4m g==;
X-CSE-ConnectionGUID: jR/L+xgHTYyahqnuzQywaQ==
X-CSE-MsgGUID: O5VW9MTPQI2WzBOW7sqrCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72589218"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72589218"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 06:51:27 -0700
X-CSE-ConnectionGUID: NFSRtB/GRxOJXEUXnqbVpg==
X-CSE-MsgGUID: qnhphIVbRCW8H692rKOVLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="176742812"
Received: from opintica-mobl1 (HELO [10.245.244.247]) ([10.245.244.247])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 06:51:25 -0700
Message-ID: <ef9f4fb1c55bf3e5e6423b2accdccee0607b95ef.camel@linux.intel.com>
Subject: Re: [RFC PATCH v2 1/2] dma-buf: Add support for private interconnects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Kasireddy Vivek
 <vivek.kasireddy@intel.com>,  Simona Vetter <simona.vetter@ffwll.ch>, Jason
 Gunthorpe <jgg@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Date: Fri, 26 Sep 2025 15:51:21 +0200
In-Reply-To: <472f27f0-2f54-45dd-b0a6-3a26b5eec301@amd.com>
References: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
 <20250926084624.2288-2-thomas.hellstrom@linux.intel.com>
 <472f27f0-2f54-45dd-b0a6-3a26b5eec301@amd.com>
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

On Fri, 2025-09-26 at 14:56 +0200, Christian K=C3=B6nig wrote:
>=20
>=20
> On 26.09.25 10:46, Thomas Hellstr=C3=B6m wrote:
> > Add a function to the dma_buf_attach_ops to indicate whether the
> > connection is a private interconnect. If so the function returns
> > the address to an interconnect-defined structure that can be
> > used for further negotiating.
> >=20
> > Also add a field to the dma_buf_attachment that indicates whether
> > a private interconnect is used by the attachment.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0include/linux/dma-buf.h | 51
> > +++++++++++++++++++++++++++++++++++++++++
> > =C2=A01 file changed, 51 insertions(+)
> >=20
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index d58e329ac0e7..25dbf1fea09a 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -442,6 +442,39 @@ struct dma_buf {
> > =C2=A0#endif
> > =C2=A0};
> > =C2=A0
> > +/* RFC: Separate header for the interconnect defines? */
> > +
> > +/**
> > + * struct dma_buf_interconnect - Private interconnect
> > + * @name: The name of the interconnect
> > + */
> > +struct dma_buf_interconnect {
> > +	const char *name;
> > +};
> > +
> > +/**
> > + * struct dma_buf_interconnect_attach_ops - Interconnect attach
> > ops base-class
> > + *
> > + * Declared for type-safety. Interconnect implementations should
> > subclass to
> > + * implement negotiation-specific ops.
> > + */
> > +struct dma_buf_interconnect_attach_ops {
> > +};
> > +
> > +/**
> > + * struct dma_buf_interconnect_attach - Interconnect state
> > + * @interconnect: The struct dma_buf_interconnect identifying the
> > interconnect
> > + *
> > + * Interconnect implementations subclass as needed for attachment
> > state
> > + * that can't be stored elsewhere. It could, for example, hold a
> > pointer
> > + * to a replacement of the sg-list after the attachment has been
> > mapped.
> > + * If no additional state is needed, an exporter could define a
> > single
> > + * static instance of this struct.
> > + */
> > +struct dma_buf_interconnect_attach {
> > +	const struct dma_buf_interconnect *interconnect;
> > +};
> > +
> > =C2=A0/**
> > =C2=A0 * struct dma_buf_attach_ops - importer operations for an
> > attachment
> > =C2=A0 *
> > @@ -475,6 +508,21 @@ struct dma_buf_attach_ops {
> > =C2=A0	 * point to the new location of the DMA-buf.
> > =C2=A0	 */
> > =C2=A0	void (*move_notify)(struct dma_buf_attachment *attach);
> > +
> > +	/**
> > +	 * @supports_interconnect: [optional] - Does the driver
> > support a local interconnect?
> > +	 *
> > +	 * Does the importer support a private interconnect? The
> > interconnect is
> > +	 * identified using a unique address defined instantiated
> > either by the driver
> > +	 * if the interconnect is driver-private or globally
> > +	 * (RFC added to the dma-buf-interconnect.c file) if
> > cross-driver.
> > +	 *
> > +	 * Return: A pointer to the interconnect-private
> > attach_ops structure if supported,
> > +	 * %NULL otherwise.
> > +	 */
> > +	const struct dma_buf_interconnect_attach_ops *
> > +	(*supports_interconnect)(struct dma_buf_attachment
> > *attach,
> > +				 const struct dma_buf_interconnect
> > *interconnect);
>=20
> This looks like it sits in the wrong structure. The
> dma_buf_attach_ops are the operations provided by the importer, e.g.
> move notification.
>=20
> When we want to check if using an interconnect is possible we need to
> do that on the exporter, e.g. dma_buf_ops().

Well both exporter and exporter has specific information WRT this. The
ultimate decision is done in the exporter attach() callback, just like
pcie_p2p. And the exporter acknowledges that by setting the
dma_buf_attachment::interconnect_attach field. In analogy with the
dma_buf_attachment::peer2peer member.

So the above function mimics the dma_buf_attach_ops::allow_peer2peer
bool, except it's not a single interconnect so we'd either use a set of
bools, one for each potential interconnect, or a function like this.
A function has the benefit that it can also provide any additional
attach ops the interconnect might need.

So the flow becomes:
1) Importer calls exporter attach() with a non-NULL
supports_interconnect() to signal that it supports some additional
interconnects.
2) exporter calls supports_interconnect(my_interconnect) to figure out
whether the importer supports a specific interconnect it wants to try.
This is similar to the exporter checking "allow_peer2peer" (or rather
the core checking "allow_peer2peer" on the behalf of the exporter).
3) Importer finds it supports the interconnect and provides additional
dma_buf_interconnect_attach_ops.
4) Now the exporter checks that the interconnect is indeed possible.
This is similar to calling pci_p2p_distance(), but interconnect-
specific. This might involve querying the importer, for example if the
importer feels like the exporting device:bar pair does indeed have an
implicit VF_PF connection. This can be done if needed using the
dma_buf_interconnect_attach_ops.
5) Exporter is happy, and sets the
dma_buf_attachment::interconnect_attach field. This is similar to
setting the dma_buf_attachment::peer2peer field.

So basically this is the pcie peer2peer negotiation flow generalized.
It would be trivial to implement the pcie peer2peer negotiation as a
private protocol using the above.

>=20
> I think we should have an map_interconnect(connector type descriptor)
> that the importer can use to establish a mapping for itself.
>=20
> Additional to that we need an unmap_interconnect() to let the
> exporter know that an importer doesn't need a specific mapping any
> more.

Is this to not overload the map_attachment() and unmap_attachment()
functions that otherwise could be used? Is it because they return an
sg_table? Yeah, that could make sense but not for the interconnect
negotiation itself, right? That happens during attach time like
pcie_p2p?


>=20
> > =C2=A0};
> > =C2=A0
> > =C2=A0/**
> > @@ -484,6 +532,8 @@ struct dma_buf_attach_ops {
> > =C2=A0 * @node: list of dma_buf_attachment, protected by dma_resv lock
> > of the dmabuf.
> > =C2=A0 * @peer2peer: true if the importer can handle peer resources
> > without pages.
> > =C2=A0 * @priv: exporter specific attachment data.
> > + * @interconnect_attach: Private interconnect state for the
> > connection if used,
> > + * NULL otherwise.
> > =C2=A0 * @importer_ops: importer operations for this attachment, if
> > provided
> > =C2=A0 * dma_buf_map/unmap_attachment() must be called with the dma_res=
v
> > lock held.
> > =C2=A0 * @importer_priv: importer specific attachment data.
> > @@ -503,6 +553,7 @@ struct dma_buf_attachment {
> > =C2=A0	struct list_head node;
> > =C2=A0	bool peer2peer;
> > =C2=A0	const struct dma_buf_attach_ops *importer_ops;
> > +	struct dma_buf_interconnect_attach *interconnect_attach;
>=20
> We already have an importer and an exporter private void *. Do we
> really need that?

See above. It looks like the exporter private is largely unused in
xekmd at least but the importer would want to inspect that as well, to
find out whether the attachment indeed is an interconnect attachment.
And I'm not sure whether a driver that already uses the exporter priv
would ever want to use a private interconnect like this.

Thanks,
Thomas


>=20
> Regards,
> Christian.
>=20
> > =C2=A0	void *importer_priv;
> > =C2=A0	void *priv;
> > =C2=A0};
>=20

