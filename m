Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEKFLa59pGl5iQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 18:55:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C671D0FEA
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 18:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB65010E3E9;
	Sun,  1 Mar 2026 17:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZjBsZGWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5132B10E3E9
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 17:55:54 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-8c9f6b78ca4so507120985a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 09:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1772387753; x=1772992553; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YCd8bTN0yDfsSyi6ZA8FG9Faz13YGXHzhnf02MTH1b8=;
 b=ZjBsZGWIfko9NOApUpFzpRZhanIuMMBr1+BdgVKer9FVSXHk3X4QdQq/PHkw5mOmlB
 3NxEl4CZe/5iY+0M7Y9QMi/CtL05aZxwozTItNIN65oQNvTVGyB3ITy34aqSyrIVNgYo
 x9EYmDkRqZ00N+ILR0UPvwxILZhR02GVB4VUYQkCqG7KPEtLXa2kOhqyyoftOt4b70BJ
 9beh0bJ37E3cZOh1E9bGWvHlExbnYjG0ueVP7ArWK5sEW8iYle5sPT+F/C7aD3kGEVV6
 5taBBbthPCH3Jctva7SoixyialvEYhum3naeqW5IEsXWoq4CI5wAADzR50uTyyXZ1G+5
 GrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772387753; x=1772992553;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCd8bTN0yDfsSyi6ZA8FG9Faz13YGXHzhnf02MTH1b8=;
 b=sVzzXyclWpJe4JS6dIx03O7lltO9+VblxoIaT/XqMvaDoTs5mPo2qCxJxsqKGsfdWN
 3sulthIf9jEtjcCNLLy+frYYuhmy5SQHuZ4zPndqMd+aaSQ0A2gWvfwPdj+tBL0hmd4n
 l1K8YcXrlZkvQVnnbqV+ldprH7YblsmL8ZdP/YERpMkY2lps2STSAje32AwyMdBMnkcg
 wOwtwaWKGqIUZRoJUBCaMM7dUdhS12uRw/ngELcaa51m8MvC8SvcwEa+j58Mq5rdlAp/
 eRv3smgh6lUjeKTqAycQgoIPmDQxUTWt4JOS7IChICtPVRpZ6YncF0CmFIUq37/WmJV3
 NCGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwTaXGsMdMBatDmV+jwEdx8JKMECImaNlI6CVAitVpjN516N2tQcZPsl7COndB1f5gH4s0j3HpJEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxloRKGK6m7xjJYt2OGXtiOOhfCgIN0w1KVT4pdkd9iASq0/dD2
 oMdHzV1FrT9rFQprfeNTBBULCXxQoZd3wBNcadlCJV8pDtkbDRexWxlu3CJCmW24zeY=
X-Gm-Gg: ATEYQzwD8uxGQl7kGCnRMWpJXsHkD/JzXaDF3NeWKJR6TfbMA0SnekKgU9fDWj6lnqm
 ufeXAAI7rFHUcGrTvnhAaFRGC7v8NMECxwtxmtW+tE6YJBolKHWrzWtDf1xkymjG5n0b5EU8x3X
 dg1gD+Wpqc4MiZMQ+jNNq0GnanDKac9wREWLmP6L7mahloTsmZ3x4EGGQuAae9khPE6zjvbwC70
 9V6NosU5lldUvq+KRbsy8QjbD3j4KrziEyPJQopTyweVcP2daU+t8TGlilkj8mtPUEOGABn97pb
 6890pOnwf/q+ej/mmMIbbAxsYLF+Naw0QyoNNYIrMklsnhAZcSZJ1yejXtuRGQ4Zr8v1opq72Kb
 yZB/j7US3JoJeZmYafkefXtRsQVSfo/VIuA1p7wp0bQ1OsBhD/dNYih1asvz9iKyRMq0O4259ts
 vBjvuR3eaEnJluuANohGcZCyfKt2Y7MRLYkWTm4YgfhsczRha/t485UDM8R79eYOp4D9HQlLTcs
 osG+pq/V0U4dYflSbA=
X-Received: by 2002:a05:620a:2802:b0:8c7:155a:6d04 with SMTP id
 af79cd13be357-8cbc8e6817cmr1277844485a.54.1772387752963; 
 Sun, 01 Mar 2026 09:55:52 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cbbf6f873dsm1033539385a.25.2026.03.01.09.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 09:55:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vwl1D-00000002dJu-0Hxd;
 Sun, 01 Mar 2026 13:55:51 -0400
Date: Sun, 1 Mar 2026 13:55:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Keith Busch <kbusch@kernel.org>
Cc: Zhiping Zhang <zhipingz@meta.com>, Leon Romanovsky <leon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-rdma@vger.kernel.org,
 linux-pci@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yochai Cohen <yochai@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC 2/2] RMDA MLX5: get tph for p2p access when registering
 dmabuf mr
Message-ID: <20260301175551.GT44359@ziepe.ca>
References: <20260210194014.2147481-1-zhipingz@meta.com>
 <20260210194014.2147481-3-zhipingz@meta.com>
 <aaDxmGoqpjnvmVs9@kbusch-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaDxmGoqpjnvmVs9@kbusch-mbp>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kbusch@kernel.org,m:zhipingz@meta.com,m:leon@kernel.org,m:bhelgaas@google.com,m:linux-rdma@vger.kernel.org,m:linux-pci@vger.kernel.org,m:netdev@vger.kernel.org,m:yochai@nvidia.com,m:yishaih@nvidia.com,m:helgaas@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: E4C671D0FEA
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 06:21:28PM -0700, Keith Busch wrote:
> On Tue, Feb 10, 2026 at 11:39:55AM -0800, Zhiping Zhang wrote:
> > +static void get_tph_mr_dmabuf(struct mlx5_ib_dev *dev, int fd, u16 *st_index,
> > +							  u8 *ph)
> > +{
> > +	int ret;
> > +	struct dma_buf *dmabuf;
> > +
> > +	dmabuf = dma_buf_get(fd);
> > +	if (IS_ERR(dmabuf))
> > +		return;
> > +
> > +	if (!dif there's any implication mabuf->ops->get_tph)
> > +		goto end_dbuf_put;
> > +
> > +	ret = dmabuf->ops->get_tph(dmabuf, st_index, ph);
> 
> You defined the "get_tph" function to take a pointer to a raw steering
> tag value, but you're passing in the steering index to it's table.

Yeah that's weird, there should be one TPH for a DMABUF, not many.

> But in general, since you're letting the user put whatever they want in
> the vfio private area, should there be some validation that it's in the
> valid range? I'm also not quite sure how user space comes to know what
> steering tag to use, or what harm might happen if the wrong one is used.

If the device is VFIO compatible then it needs to ensure that whatever
it does with its steering tags fit the security model of VFIO. You
can't harm the device - you can't reach outside the VFIO sandbox (eg
into another VF or something) and so on.

Under these conditions the kernel doesn't care what TPH is used, just
let userspace specify the raw bits on the wire.

Jason
