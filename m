Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOS6JEHGb2mgMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 19:15:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE90B493FA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 19:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFA310E646;
	Tue, 20 Jan 2026 18:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="kl6yMMgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB0D10E646
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 18:15:23 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-501469b598fso39426181cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768932922; x=1769537722; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u+h0EX6bJ4UpFAOqOLmeekiIIdrOYR0BoNDz6Hm/Icw=;
 b=kl6yMMgcKNY4mP1p9s07HMJ4H0SSSIjZRWG4g/jTPUU+qmAZDnTJNk5CrvMEKSVvqC
 x8G7WHX8ugo8D65vUa6z91WlOit5f30oa1V6x0YHzbjgkVD8Z82yA1hpFufut0T85U3G
 +4IK85BsNXOmLOBgLTgVSJ7qG0cKttAG3RO0FpqoXKbeIImak4f0Id3hQ+Eu64ip6EvM
 37x5Y6HWJC0s315ehCqzCl34vZa4OAr5rKy7/AniAWQC+Al//ULEHphbxqHFwpbRx/64
 hE+meK316ze8D9t7dyiUqd3c4y99Ob/1DbLVENXviGkuvgY/ltmk7xUcjhIvbqKphrz2
 QKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768932922; x=1769537722;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+h0EX6bJ4UpFAOqOLmeekiIIdrOYR0BoNDz6Hm/Icw=;
 b=L7bbgSjo6+6nQbns6cgWS13a5C75hY70tCFv9grjo+CwwEnrZ09drU/Z+aNhrxMRFY
 dijR1ATYmt7v7/F2Zv+i2mY85QF1ul8Bz2c6BWwVkCm3DuISAHltlq1lyqbrXuZlToNT
 5LRGK+B1DXULi1HzA5n14soiv+RQdQO22apzx6DC665QeK+irx7ansWCe47QpL8LIHmK
 +wNPMW+fEtXSaMVSeE3wqjsCvrD4uaxe3KoyDaZp92gdZudUXIJLIBgUmBUoQeVvVgA3
 bV22jf/YOre6P9Y0Im7X5x+U770vq5RUISved95CtGgR9TWYXI6fC+Pr8W0c3F1A+b0t
 nrFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc4ErOcQEn8lcwPYtPaoeTgkhv/tnDAc5jil9EJ0qvxmZSCgNNMbtOFc5iz8ATW2h9uD189EumbFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3bkhgg5fPlInbgPixu0zLOu3KOpprDl32agPBGFdWEBUsnxwt
 6ctoQIt3rUGClS5pJ4iauV+sEnVzIL2sJw3lKhU2EZm0ZfyOCUpZbXwlmATPDz/Ahgk=
X-Gm-Gg: AY/fxX5hs/ZyBOe+s6c2T9RLXhXiHt8P3DwtTe3jSQaSXTJXqq/bXKKjHs17Xv4fiB+
 ozHx4agOQiyG29fvzVuY/1Ami559NXzhM3cMKGmvgESAvTc8AO4nu3gkQ1d0QhtLSUgEOd8Ao0J
 utthSKyaKsL/WAksaCKvYgSAZab5OymJB4YYBx4KhZAQ9zOv5cXv1SYpa3TazshWyhhJw76mpD5
 UXZAf7dBJeFqYBvNBpHIxCDFceoTd0Ay85kqsWECZ1dp6kV+zEz1YgVwsMnlI9RIkvKxaBe4DlL
 XAdzHrvNiX4S5UlvYRyLqVpypzSFHNIJMSGumwyvclOSpg+gf46mgCU8adXgDvcfFV3d/kVJqGR
 8BYZe2TRTelOipXG+W0SuUM0iZ8Ke/srrIU8bhapm3va63mr1LNiszfSVY29RRIEhUty8vrP5w5
 F7NRYY6prNxgnlycy1YsUuJgVbhh3UrnLGTV4sqwlsmjNNcGu6Qm/T
X-Received: by 2002:a05:622a:1447:b0:501:3ccd:cb3e with SMTP id
 d75a77b69052e-502a1f7105fmr227831511cf.66.1768932921973; 
 Tue, 20 Jan 2026 10:15:21 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-502a1d6e670sm99756901cf.1.2026.01.20.10.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 10:15:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1viGG8-00000005aY4-3tNU;
 Tue, 20 Jan 2026 14:15:20 -0400
Date: Tue, 20 Jan 2026 14:15:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Edward Srouji <edwards@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [PATCH rdma-next 1/2] RDMA/uverbs: Add DMABUF object type and
 operations
Message-ID: <20260120181520.GS961572@ziepe.ca>
References: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
 <20260108-dmabuf-export-v1-1-6d47d46580d3@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-dmabuf-export-v1-1-6d47d46580d3@nvidia.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:edwards@nvidia.com,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:yishaih@nvidia.com,s:lists@lfdr.de];
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
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: DE90B493FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Jan 08, 2026 at 01:11:14PM +0200, Edward Srouji wrote:
>  void rdma_user_mmap_entry_remove(struct rdma_user_mmap_entry *entry)
>  {
> +	struct ib_uverbs_dmabuf_file *uverbs_dmabuf, *tmp;
> +
>  	if (!entry)
>  		return;
>  
> +	mutex_lock(&entry->dmabufs_lock);
>  	xa_lock(&entry->ucontext->mmap_xa);
>  	entry->driver_removed = true;
>  	xa_unlock(&entry->ucontext->mmap_xa);
> +	list_for_each_entry_safe(uverbs_dmabuf, tmp, &entry->dmabufs, dmabufs_elm) {
> +		dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
> +		list_del(&uverbs_dmabuf->dmabufs_elm);
> +		uverbs_dmabuf->revoked = true;
> +		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
> +		dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);

This will need the same wait that Christian pointed out for VFIO..


> diff --git a/drivers/infiniband/core/rdma_core.c b/drivers/infiniband/core/rdma_core.c
> index 18918f463361..3e0a8b9cd288 100644
> --- a/drivers/infiniband/core/rdma_core.c
> +++ b/drivers/infiniband/core/rdma_core.c
> @@ -465,7 +465,7 @@ alloc_begin_fd_uobject(const struct uverbs_api_object *obj,
>  
>  	fd_type =
>  		container_of(obj->type_attrs, struct uverbs_obj_fd_type, type);
> -	if (WARN_ON(fd_type->fops->release != &uverbs_uobject_fd_release &&
> +	if (WARN_ON(fd_type->fops && fd_type->fops->release != &uverbs_uobject_fd_release &&
>  		    fd_type->fops->release != &uverbs_async_event_release)) {
>  		ret = ERR_PTR(-EINVAL);
>  		goto err_fd;
> @@ -477,14 +477,16 @@ alloc_begin_fd_uobject(const struct uverbs_api_object *obj,
>  		goto err_fd;
>  	}
>  
> -	/* Note that uverbs_uobject_fd_release() is called during abort */
> -	filp = anon_inode_getfile(fd_type->name, fd_type->fops, NULL,
> -				  fd_type->flags);
> -	if (IS_ERR(filp)) {
> -		ret = ERR_CAST(filp);
> -		goto err_getfile;
> +	if (fd_type->fops) {
> +		/* Note that uverbs_uobject_fd_release() is called during abort */
> +		filp = anon_inode_getfile(fd_type->name, fd_type->fops, NULL,
> +					  fd_type->flags);
> +		if (IS_ERR(filp)) {
> +			ret = ERR_CAST(filp);
> +			goto err_getfile;
> +		}
> +		uobj->object = filp;
>  	}
> -	uobj->object = filp;
>  
>  	uobj->id = new_fd;
>  	return uobj;
> @@ -561,7 +563,9 @@ static void alloc_abort_fd_uobject(struct ib_uobject *uobj)
>  {
>  	struct file *filp = uobj->object;
>  
> -	fput(filp);
> +	if (filp)
> +		fput(filp);
> +
>  	put_unused_fd(uobj->id);

This stuff changing hw the uobjects work should probably be in its own
patch with its own explanation about creating a uobject that wrappers
an externally allocated file descriptor vs this automatic internal
allocation.

> index 797e2fcc8072..66287e8e7ad7 100644
> --- a/drivers/infiniband/core/uverbs.h
> +++ b/drivers/infiniband/core/uverbs.h
> @@ -133,6 +133,16 @@ struct ib_uverbs_completion_event_file {
>  	struct ib_uverbs_event_queue		ev_queue;
>  };
>  
> +struct ib_uverbs_dmabuf_file {
> +	struct ib_uobject uobj;
> +	struct dma_buf *dmabuf;
> +	struct list_head dmabufs_elm;
> +	struct rdma_user_mmap_entry *mmap_entry;
> +	struct dma_buf_phys_vec phys_vec;

Oh, are we going to have weird merge conflicts with this Leon?

> +static int uverbs_dmabuf_attach(struct dma_buf *dmabuf,
> +				struct dma_buf_attachment *attachment)
> +{
> +	struct ib_uverbs_dmabuf_file *priv = dmabuf->priv;
> +
> +	if (!attachment->peer2peer)
> +		return -EOPNOTSUPP;
> +
> +	if (priv->revoked)
> +		return -ENODEV;

This should only be checked in map

This should also eventually call the new revoke testing function Leon
is adding

Jason
