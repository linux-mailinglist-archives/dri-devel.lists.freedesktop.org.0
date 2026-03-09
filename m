Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPYxDOrkrmmsJwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:19:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317EE23B851
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00B010E52F;
	Mon,  9 Mar 2026 15:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="gxjdQsNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1FC10E52F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 15:19:00 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-899a9f445cbso144100986d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1773069538; x=1773674338; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oQoTcBcgSknYFDDhFBTqv/EpNp1AB8jH1zi0Ovpsfro=;
 b=gxjdQsNnVR/u3im1hrskBx9axjc/ZaeqOni2cohYoe0YSuJR12P0UeTc4TR8zkbBkf
 1DCeUAeee7iLvulYrW67TZjBsBD8NE4XtLaOCsy6dwdNXBcxGLGUk6Jqsg6RawJnmAvV
 xsM70tkPeYJUYRV4s7ijhL4oTG4LEIAqnvv5XxIwoeh3M2mwcn1knWw3/VI1GTM82VoG
 q59OG33mr6Vi2NLPCeEIq6McKyFjsNHeK5b/E0PK7WfcGTMv8bsozTehdM4sExlt28oT
 KvO2Ppq4GXlxxvDF2MegTQ0aBhEWrirfHVCiNcXxLUnh4GVyX86wx475PEr5KOKoGJse
 YZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773069538; x=1773674338;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oQoTcBcgSknYFDDhFBTqv/EpNp1AB8jH1zi0Ovpsfro=;
 b=LJsYitSqgADSodUYBq1nvgFr4agUPPqQ6yii83qEr9olaYD59unFohjpe4uFF4Q5sq
 J+FExiwc2F275mUEStYZMPfAbflj9WkjhXIAx/YaUj7cCqZq1eEeq1Dc0TrouMq1aSxi
 8Zk5FKfniAcbzdEAgZLvQHJimHZCp2Fo/LdOwvo8taSbNRyX+KSh0zmfskRvEk75FyoS
 7FidvjhVJidmWoglSiLgqPfqWoNM+quZc4p/l7v56eL4FOtONjOaZu3ll3c6LFcIDXXH
 WBigp9R0IC6NSPKgcTGWAKL2LGlJ4GoBNvkbR9qcu0xOnpYDX+wjRod8/dnY4+Zmf0hc
 Hz1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/T96I8/HFMuo/AKIJ+cQw8QP0qITuqOtkMEo476z5Fc9aB131ZAaDL5QhTJRAA9wlpO79lgJd/S4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLVUShjcnCIYQahH4WJ1u0ARoaT75EM2jdkg2Xv6o1y5IfOEsg
 yYdh8xnmBQpmn+izQOLljDJaEIHE2aR1bQaPu/exy6PAFoeocUAoiFCan3Ry0KQSs8M=
X-Gm-Gg: ATEYQzxsdpTQgHvj6kWVLIwNI+prGj8fHo/ay2QfYGzncchenonsWiznpDhksEps29n
 QmUf/uajBct8CtHY1/r/Qt9Sl4Q5nUcdD3U/bxWqTHxg7lIvzeaDqIJFEDr91abWKH8wJZtyh+l
 thLvchIBoTbsOIe4E4ulz7sA5Bc6TBsVd2QnlqdurpP8Z2sZ+7oG6p+CQDzfJIsAfauqUJcsMJU
 bPmY9izZo1e/8lE3dXAp054ulVaYMNiCXtPydGe1/DcRp+NGizuKEovoNrTyZ3ZN8+N2VLPyap8
 pY/3Uw/iTsZD/64DFWyxTFdELiDwR2xrCWmqsXfkz5V72FfgqcBeJ6qVXSKoVnBiJjRO8EyFaF7
 UZkOyJG0uBZWH+OJXeYpZz3P4y615AhDhy7qvmYHxsB1XKOzrgGJU/mFCLSoz+/7jSRu+6E8hzo
 QihS9CnM6LuhksDh4wZwmgwhRKBQSNR9uYezmP1EYjForBckrXHjFcA+rthERpSjSycFV7jgodY
 xlQWT9h
X-Received: by 2002:a05:6214:3019:b0:89a:502:6054 with SMTP id
 6a1803df08f44-89a30a2b5c5mr162839796d6.8.1773069538417; 
 Mon, 09 Mar 2026 08:18:58 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a316ec570sm80067436d6.39.2026.03.09.08.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 08:18:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vzcNl-0000000Giv6-151p;
 Mon, 09 Mar 2026 12:18:57 -0300
Date: Mon, 9 Mar 2026 12:18:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
 m.szyprowski@samsung.com, robin.murphy@arm.com,
 sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
 aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260309151857.GO1687929@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal> <20260309131530.GJ1687929@ziepe.ca>
 <20260309140233.GW12611@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309140233.GW12611@unreal>
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
X-Rspamd-Queue-Id: 317EE23B851
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:jiri@resnulli.us,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:dkim,ziepe.ca:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 04:02:33PM +0200, Leon Romanovsky wrote:
> On Mon, Mar 09, 2026 at 10:15:30AM -0300, Jason Gunthorpe wrote:
> > On Sun, Mar 08, 2026 at 12:19:48PM +0200, Leon Romanovsky wrote:
> > 
> > > > +/*
> > > > + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
> > > > + * (shared) for confidential computing guests. The caller must have
> > > > + * called set_memory_decrypted(). A struct page is required.
> > > > + */
> > > > +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
> > > 
> > > While adding the new attribute is fine, I would expect additional checks in
> > > dma_map_phys() to ensure the attribute cannot be misused. For example,
> > > WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
> > > that we are taking the direct path only.
> > 
> > DECRYPYED and MMIO is something that needs to work, VFIO (inside a
> > TVM) should be using that combination.
> 
> So this sentence "A struct page is required" from the comment above is
> not accurate.

It would be clearer to say "Unless DMA_ATTR_MMIO is provided a struct
page is required"

We need to audit if that works properly, IIRC it does, but I don't
remember.. Jiri?

Jason
