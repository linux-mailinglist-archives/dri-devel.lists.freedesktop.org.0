Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ONeBnfIrmlwIwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:17:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E482398DF
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB3B10E4BD;
	Mon,  9 Mar 2026 13:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="apPvIJ9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FF810E4BD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 13:17:39 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8cb5c9ba82bso1870522185a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1773062258; x=1773667058; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0gIWGbCJp5nwkRBHpqTWfAQJnaj/D8oDAfy5HSusAOA=;
 b=apPvIJ9/X3TIcyFaoWerbw7MYomwRQKEW5y+fsQU4n5enqnkh3wunXoxQbY0yB6rJv
 nH0sYtWCjMWDKR+ef4QodZR39HlJtfz+k2UCd0UFLyqup8XgMQqREMJ3rdn4cW8wLVN4
 RGnJAbaIKG4ebiME902yYmTUPYIuyORy8HQcVEcDPv156tk5sLayn0Se/xVNbFIjQ9xB
 64NJYU67fXLkxIKNnvhvIxyQhxKVXBi+gJgTh+VFiXjuCOmBbWMMy3uzaDlHHVIQjs7n
 OKBXnt9w2OTp1Q+fNu5SvCffewaAS82V4F/fyXowZmZi1wcURXCJc1c02ygXvMcO1Lcc
 8QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773062258; x=1773667058;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0gIWGbCJp5nwkRBHpqTWfAQJnaj/D8oDAfy5HSusAOA=;
 b=OyD6IyYKaFGVD0EU5p+8505PDnnxzAWIIsBgx2pbIRbAqdJoUpbCLQBoISAvczlqhI
 Sjqm4i4MeKbSbEiXxj+nNfDTnNNnMvun61ayKhP/EyF38JuJ6RXwxl4cHcErmj+Iy8VR
 VgkF0gKUtUA4zI/VKJ5gytyb52z3+6Umnlzgoa8KLr+h1smWeLGbKLdQSkyJAXgTNtjC
 f4M8fNGnQukMXn9m35U52qLjSWgiJ1bqYczKA+/vL2YiCYN2ZhAx+EViiXidiGXn3um5
 0xVHVYE2r9+SIpIyzS+iz0jQzEfSC7fqx0ShUkSC0achqLc+po36ODe6OChiAVIRq3V3
 4QmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMjQismqyhmQx4Gj8GeMrsOAoGvkpkwq4msXK0je84sEaqAC2IVjgr1vHinjiYjbNZ2VM6jtAdFcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyP9mH8oRzFuZfvRoPPxhs2r96Hj/c6YoIVoRZLxEFMh2qbhneN
 Er4n1Wk/Tjj2pdiXmhc412hGLHj7JQcSfV7gbURhuH6HAhYbqJ0D7PcVjUihVbdqLOSR9MqxUnj
 uCPGB
X-Gm-Gg: ATEYQzxN/0f2YBppFLVWoV2jOAX6KBNpCJkRel91BMPnHflh4TQf/fiIkwExYvkJ/VE
 C/8/ZPkzgsw9qBCYoDkuHwWy4fLrbzp82KIGbGlO3GjoTrl1coJRIh0WdXpeJnkzXDTKcvpgHIo
 UXz+y7yFQbXneAVN6dQiySdIIOpS+octLVSCSil0509QfDPHKWJgqz1oX8mso2Q33V1EVhf3tCQ
 NTjeIWdb006aJtz1HGMytMedoNbMLjRQXaaETYILQ28v8B0hXXI38JlkediIRmCiQMEsu2Z6hd+
 e90vMzocjh39XmEyDV8lFjgsPJmhOaM/sAkkHcBGefDC7jyKVj1yulaGctQQUlXtu8MYTVcNuSY
 hbFefU1LwNnfSBnMgk+iS2XcHErWvfEiFfWg+NWVWZdhpSXT7XPxsbOckoi7ig2s8mt9E47/4W/
 sSBRdxGwUv3K2pkUhTJwifWHWbX81UPUUh6H8QVcHFIVP+j3i99k1zkqt/0iIHoT6cIBwhdk8/V
 wbSwpfH
X-Received: by 2002:a05:620a:4690:b0:8cd:87fc:cf9 with SMTP id
 af79cd13be357-8cd87fc11e4mr446497085a.1.1773062258159; 
 Mon, 09 Mar 2026 06:17:38 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cd6f49649esm668080485a.12.2026.03.09.06.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 06:17:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vzaUK-0000000G6v8-3p9H;
 Mon, 09 Mar 2026 10:17:36 -0300
Date: Mon, 9 Mar 2026 10:17:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Petr Tesarik <ptesarik@suse.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
 m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
 sean.anderson@linux.dev, catalin.marinas@arm.com,
 aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260309131736.GK1687929@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260309135610.1f81d2df@mordecai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309135610.1f81d2df@mordecai>
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
X-Rspamd-Queue-Id: 70E482398DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ptesarik@suse.com,m:jiri@resnulli.us,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:leon@kernel.org,m:sean.anderson@linux.dev,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:dkim,ziepe.ca:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 01:56:10PM +0100, Petr Tesarik wrote:
> I don't want to start a bikeshedding discussion, so if everyone else
> likes this name, let's keep it. But maybe the "_CC" (meaning
> Confidential Comptuing) is not necessary. IIUC it's the same concept as
> set_page_encrypted(), set_page_decrypted(), which does not refer to
> CoCo either.

Frankly I hate that AMD got their "encrypted" "decrypted" naming baked
into the CC related APIs.

I'm not at all convinced that they "do not refer to CoCo" in the way
Linux uses them and other arches absolutely make them 100% tied to coco.

If we are going to bikeshed the name it should be DMA_ATTR_CC_SHARED

Jason
