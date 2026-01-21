Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIjnKyLbcGnCaQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:56:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C45804C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA2310E7FB;
	Wed, 21 Jan 2026 13:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="HapdrNA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A886C10E7FB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 13:56:45 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8c5389c3d4cso728246685a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 05:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769003804; x=1769608604; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Avz0zhItUvROQy3aeBayHRvtD6/6o32+NQiPJhA08ug=;
 b=HapdrNA7YHpCIwbd8sYEkok0D4HEBrg2pgifZIGPxr80W5kTX4r1SxUn7sSS3tl4ZW
 fAzsgLqG5HgdkmWmt1EsIpxfyuE2QIjJe7JrDmEFerWMG4IyYtj596Qyg8iyuY8/tuhj
 yLX1mbKgf7gojzZbcEuBZ6As2FkLleWCFAAkTeb7uZrxUHXNuR+CiQe5ZZe8dh/sG4nk
 eV0EPiZIHCYP5mA4GCE3NkUUy6ehImBLyo9Lovam4TwiZVQXvZCvBzdi5stZfX3YkEYh
 5vCaV4ShQAVsI0qhxLeB3EhnaSpUpN9vP7zdke8Wzc9B+fhGgQQs9VlRA1xDGyh6sqA/
 b0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769003804; x=1769608604;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Avz0zhItUvROQy3aeBayHRvtD6/6o32+NQiPJhA08ug=;
 b=XHItVh9ssTQIrTId9uioDzfgBzfOOaOKk3oz0IXLSmpFNW2FZW7eQzY51VSsTVOaJp
 Bqme2zUMXmskixXX6G1EH0amb7TjPxjuX/Rb4KyUpl+1lE8yRp//gmMnaT8IwP4bMdPf
 kSw9z26SZ2qIctfp4Ys79s3QzPd5dDomrlps4l+CtubpgI6N39crTvfHYCUhme6au6gM
 608AgDWw7jedWyMd1g5+CkCu3WV8aYioOW6txSDLMonbjipAlUI0HPQrEFADBgKv4PdV
 A1ESAibdIdp1E392H+vbt03q50zLCr/i5gfFS0REIWhoIrwqwIWvQ0ftFiwLz7WohnKs
 qO+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJQ9MJxDf+dZTe0Adm0h/0gUEISOUUapXYr1MricQzkoukJ/zyV9XpBt1DjM/pqmaeso59tDUlLvI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMDskYPZdkPEF8nOYVm8oCFoJHw76BWewMD/48PygDCUq9Qz0N
 svO3KwwiRCLnvXQm05evewOK4FwANO/gWCiSyZKxqhmCHjQKOS7d+EW8lSGu/wqp29g=
X-Gm-Gg: AZuq6aJg6Kw8TtFCaaHE2jy1wy0YNqgyEl2XVvbHxd6CX1B2CmsZ18difeccjxCPx2z
 /EUVfwTlvVsFoYgIs2FuNk8NkrzP9OVARf777fkJH6xErWKnpj1thQl2MdfozdQTfK/hm5akfL5
 QwoC07SqK3hV3ma//YIGHq3Of+G46iex4xc3l3Wi3ZzUSoAsqmSPsa1l4zYStopYp4IW951H4HI
 U/rYkim12vVWzzDM7Zzh50Bb4Kc8Kn+IfLz0ka+b07x/YBwk4qmEVEgFmixPAKbGbfddH1ep2Ql
 Ig9PRLlFyCFwUI+I8i4eH0ap0Jv9MpqFcJ3yvWzkdUukpI67xl9t78GQ/oWVAInXEJ7MWmjh3oU
 ww8fgXqxfeUZnqRK8LqwD3d198h+aozNyLV2uBAJ9B8CZlMcaLuQwBxi/+5Ho+NFBI3fD9W5aSg
 PVz6V9zbTClI5IvtgFYsynsckGcfPsIeMy7dH5yNQm4hyJxnCtOVwPMvpOf+vbeeZrDGQ=
X-Received: by 2002:a05:620a:1013:b0:8c6:a814:726b with SMTP id
 af79cd13be357-8c6a814748dmr1789323485a.75.1769003804452; 
 Wed, 21 Jan 2026 05:56:44 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8942e6a9d97sm125563246d6.34.2026.01.21.05.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 05:56:43 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1viYhP-00000006E7g-1MyT;
 Wed, 21 Jan 2026 09:56:43 -0400
Date: Wed, 21 Jan 2026 09:56:43 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Edward Srouji <edwards@nvidia.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [PATCH rdma-next 1/2] RDMA/uverbs: Add DMABUF object type and
 operations
Message-ID: <20260121135643.GA961572@ziepe.ca>
References: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
 <20260108-dmabuf-export-v1-1-6d47d46580d3@nvidia.com>
 <20260120181520.GS961572@ziepe.ca> <20260121083246.GV13201@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121083246.GV13201@unreal>
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
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:edwards@nvidia.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:yishaih@nvidia.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 101C45804C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 10:32:46AM +0200, Leon Romanovsky wrote:
> > > +static int uverbs_dmabuf_attach(struct dma_buf *dmabuf,
> > > +				struct dma_buf_attachment *attachment)
> > > +{
> > > +	struct ib_uverbs_dmabuf_file *priv = dmabuf->priv;
> > > +
> > > +	if (!attachment->peer2peer)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	if (priv->revoked)
> > > +		return -ENODEV;
> > 
> > This should only be checked in map
> 
> I disagree with word "only", the more accurate word is "too". There is
> no need to allow new importer attach if this exporter is marked as
> revoked.

It must check during map, during attach as well is redundant and a bit
confusing.

> > This should also eventually call the new revoke testing function Leon
> > is adding
> 
> We will add it once my series will be accepted.

It should also refuse pinned importers with an always fail pin op
until we get that done. This is a case like VFIO where the lifecycle
is more general and I don't want to accidently allow things that
shouldn't work.

Jason
