Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJQMI9UFeWlcugEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 19:37:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F499322
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 19:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B7010E0DF;
	Tue, 27 Jan 2026 18:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="V8U3pq4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14BB10E0DF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 18:37:03 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id
 6a1803df08f44-89473f15ed8so64841126d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 10:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769539023; x=1770143823; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kt+8lgSJxpzEIbXWXTJ272saiYlrc9qiupDqxXcS3H0=;
 b=V8U3pq4FQNu1KpgyHZWNeoZEhopPfR5VcxuhCXs9Zlxh84aEgRdTWZuc6wPTJ64HAY
 vyTH6mSH5VwXua9NUZ5rlnWsCmABVxF9rtNlMXygbmeN6M/qREW0ZJCIgNiLjRuFqbfs
 spV9UFaZbsTULcf0QVofAXtz5gpU2pXN3mXvaTOJ1CyQCHHU3oPUX15Xrew7AU6NO7em
 0nHwt0hPbuVDuu6mSJ1ImNflziQe8y+cJQB41pWZzllcHmaFofiCBUOwYb7rmI6jDFaS
 4I7IDI7E7EJXPU4+OLIaDJY1khYniyyzSJ5BqKfBxnYvwwSKtWJzQxOUMe17/TvQyJLP
 91jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769539023; x=1770143823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kt+8lgSJxpzEIbXWXTJ272saiYlrc9qiupDqxXcS3H0=;
 b=Inl3SXTj5R/petsKjWotQteTSA7U23H64DMyYMBW+7rKyaLNEh6bBGKc0GiJmjrXM2
 UslS9//UG4rxcYbzOLIbsBlbTVSc9vnp6Q9zCsyJUV/1RUHWtrrarDaAgMu9UD5gGsmG
 JEnFX/MBa4AymQCxamyuhrMQNgxAAjKFMV9uQTEpAFFZiNlUStCv4FTxFIhiomNY+0wL
 qZgCdoQC3Y/4dRpI2MOlbwCNOwgUFjf3mpvQfMNOPr1XPYQItJpw1QnRP/N8ZU9Gx9d1
 YD3nzGePirqBgvE+BI9McnaitFUaOeIe8O8rDI/T0CoyRhI8rvH/i0PoMhGuO/tyULJO
 mQ7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSGEwAU1MlLqU6YQK9X/jzc4Oze1U+BCPBqf68IJtE+fr/lwymcX9asnQxyIEXAMIB1YlBOtji2hA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPTl2XXvUWVFGW4EeL5ZX6ADmgEs0iHiseUB8xm02lri92Y/4K
 kqs+mbj6OLkDhjciCcgkxin1X2VvVCT5/1dNnmQuwDNfdtHpWTgaXiQcAYsOkK49Mow=
X-Gm-Gg: AZuq6aJkDhAX5MTiK0Fb9ccpr1yXyntBr8yhfnVmkaa/WdV3S56vYqNxa093/xbNiMM
 n5VoPEn+vmpT/iZoWaPWsv4TmvCphLAqTQKfMrn7VRgkiE/jQPklyeGB17YdX1Vie2F2UFsZ/1S
 c4n8Umkmvw6uY1tmPtywTwOtFw6Uu5S67jI7i5zd7RJMPzuTAGaTsiiksF5H29o2OLmGFAuVoe2
 aYMbV+ir4LPI008pEJ5y7bH8BoL0QRmFDR1ZZBQM3WpTKix5PhCXjAmoMDp9jAViVtcvKjxRilk
 a8WmugeMWkwIsuSUAruWviuRp+jMzPre+1T3hhKICtPTZph/jL53MPkgpsWhx0uKnN9EQAYiRRd
 Yp1qvKvz6sMayuRlrKiNq44MkNNYuHT5mrjr6dPRgxHSWwlfOixe6QvuV3HszlQ+IwxU1wW5Qw9
 5XDCtvY5IYN3V7RTWM3WOtzBikQFUTGsTLdpgHXuabOXXdcY32ii1afGXxftAAUZCY1F0=
X-Received: by 2002:ad4:5bc9:0:b0:894:2d0c:7a1b with SMTP id
 6a1803df08f44-894cc85d3bfmr36304646d6.26.1769539022705; 
 Tue, 27 Jan 2026 10:37:02 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c711d2847asm24465185a.34.2026.01.27.10.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 10:37:02 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vknvx-00000009Cgi-2fGw;
 Tue, 27 Jan 2026 14:37:01 -0400
Date: Tue, 27 Jan 2026 14:37:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: Re: [RFC PATCH v2 0/3] Use new dma-map IOVA alloc, link, and sync
 API in GPU SVM and DRM pagemap
Message-ID: <20260127183701.GI1641016@ziepe.ca>
References: <20260123215907.1643088-1-matthew.brost@intel.com>
 <20260123224146.GB1641016@ziepe.ca>
 <aXP8B/tAuJO1hfx1@lstrano-desk.jf.intel.com>
 <20260124002610.GC1641016@ziepe.ca>
 <aXjtvj/2AZxY1MwO@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXjtvj/2AZxY1MwO@lstrano-desk.jf.intel.com>
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
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:intel-xe@lists.freedesktop.org,m:leonro@nvidia.com,m:francois.dugast@intel.com,m:thomas.hellstrom@linux.intel.com,m:himal.prasad.ghimiray@intel.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:mid,ziepe.ca:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B48F499322
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 08:54:22AM -0800, Matthew Brost wrote:

> That will likely work for dma-buf, let me see if I can convert our
> dma-buf flows to use this helper. But it won't work for things like SVM,
> so it would be desirable to figure out to have an API drivers can use to
> iova alloc/link/sync/unlink/free for multi-device or just agree we trust
> drivers enough to use the existing API.

SVM should be driven with HMM and there is a helper in
hmm_dma_map_pfn() for this.

Yonatan posted a series to expand it to work with ZONE_DEVICE PRIVATE
pages but it needs a refresh

https://lore.kernel.org/linux-rdma/20250718115112.3881129-1-ymaman@nvidia.com/

If there are other cases it would be reasonable to discuss enhancing
hmm_dma_map_pfn().

Jason
