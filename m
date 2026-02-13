Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDl8MrQ7j2mtNgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:56:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28522137588
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E5210E816;
	Fri, 13 Feb 2026 14:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="hTn4ahnu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F57E10E819
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:56:49 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-89549b2f538so25453146d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 06:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1770994608; x=1771599408; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/0TF9FUYO9IdKkMyrGbneGNSmeyPMgfALsEIsHc6THU=;
 b=hTn4ahnuowggBpVPbBwyeAU6cGAAj+c6MpdBOCmAKf1UOT3boFG2GoAsT5Mfa/f6Op
 dUiJ0sZ88S7uhygHi3wPxm4JbNoKcaI1nAaeuUKqF514VcML+Wjv80xfab+IPzjT9x9x
 9y74wCCTFULl6hu3+UcZocHjsGliQz8VML5ynNncaX+EUDB0Xle9mQ4GbdJG/TY41U7T
 LVjV5afnYb1qDKnOoCgFmaBE2SM3eyB6TYOCJtqTi1a3GDjjB/ytxqBSOKEuqGwRRRc3
 qHG0ZjdWgKOouttKd4GGzzjk0gkwUYxvxcH30SHCpBMxCuzJJz0X2ECMM/gIZE6PE8aK
 L3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770994608; x=1771599408;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/0TF9FUYO9IdKkMyrGbneGNSmeyPMgfALsEIsHc6THU=;
 b=FD1pDF1hEeFfK8cx7MnMyxgapclBonZqDU1ZSO1+wFanscptU/Xp2VfGba+tAPJHGN
 3S7H1cLouEFSsrzAw2bLwYs7Prqos373QOENGmjx2ms9/ZCelrSLfIKdeJjgi6/7K2H4
 mVYzGKcmUd/jyHTejhPSuxlhWIsbTQsG9WE+8YGA1h9vQrh2rqad4myXeK9x9hBj81bZ
 iZ2MaIWheVHWiWbXuV/Tnpw1NSF3MW8XhKbpcv0k7ypKO/tZ77klCQO21vLEu3UYZnf4
 4MfrUAub8ZpRqDNOHf6QCDreMYy9bpgMOH7DQzrpzEiNhudIciLv3FMAMPCujhqyKyUh
 gG8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCURUkp3csjaL+ylcXGSOwOF9MW8Ho+Y5rfQiBVnCYD6bj9mFXBvV0b65KO7SGqlmI5oaIVv31c0Xe4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZgwalc/PPFEKIYdinhxxLClkGXiI5xZreWf4h67n+2/AIbMaP
 vcXdtnkm4hA5gyYr74zk+pkYdPNwIv6wdhmzgB1VDtw3a/II9YnEHo5v/2IhHcaYLLM=
X-Gm-Gg: AZuq6aIdFIPvxteO4LU9JXawuY85sShDjvrcUCFY/wvtWNov5dq2JJeSFD2iJAoG7GD
 XctbCVTubJEx/IJ8AUAciOenQZ9V9KAt8DsZ8eDFYlVwrhLTH+v3vBbmIVF/oLnaCV5UJ1IkQHh
 DHHt3Zr9ydpbHD9b+dofOCqgKLIznCqRx7ULFrNEEJkFUbqHt1O91VtYsVerdWTC3x9483RgL6u
 M/92/4r8lUMMQxn8XCCYQkYQ2nPUIVpNdvJn2SrCHWM3+8sCfEl4ZnD4gNTzY32fLXDqcnqApAc
 a+JD7jGm8GQ5yp0Q9PWpFIzCjqkJ1fzj5UX7W9sjZ92jbJZv2iSeeBcwrYHthMf+l2imF1MP4OJ
 wxqzUul31IPldsn9+g8nx3eTFEcJi5/aejPBh2B9xu9/BvimqpNoKkx0szdQ3cJ1ELTqrwFtHbH
 t9Z2Qlb5+66/8BcST8eUY4I+wWUfolZpsaw+hCk4KqQ+4bc9XYiVSvBs9vnJr7+yQfS1po9+xRV
 oCyAi4=
X-Received: by 2002:a05:6214:c49:b0:894:6e2f:f963 with SMTP id
 6a1803df08f44-89736263377mr28036386d6.62.1770994607931; 
 Fri, 13 Feb 2026 06:56:47 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971cd899b1sm68116876d6.32.2026.02.13.06.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 06:56:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vqub8-00000008ulw-2Ps7;
 Fri, 13 Feb 2026 10:56:46 -0400
Date: Fri, 13 Feb 2026 10:56:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 leonro@nvidia.com, francois.dugast@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: Re: [PATCH v4 4/4] drm/pagemap: Use dma-map IOVA alloc, link, and
 sync API for DRM pagemap
Message-ID: <20260213145646.GO750753@ziepe.ca>
References: <20260205041921.3781292-1-matthew.brost@intel.com>
 <20260205041921.3781292-5-matthew.brost@intel.com>
 <6289525edef2a1dca5d9de325ad0efbc1cb79a38.camel@linux.intel.com>
 <aYyiHQ0avcRcti8l@lstrano-desk.jf.intel.com>
 <1215d2ec94ecf13944d01bd4de29bf29bd4f8bf7.camel@linux.intel.com>
 <aYzPtCisUdv6FPEC@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYzPtCisUdv6FPEC@lstrano-desk.jf.intel.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:intel-xe@lists.freedesktop.org,m:leonro@nvidia.com,m:francois.dugast@intel.com,m:himal.prasad.ghimiray@intel.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_PBL(0.00)[142.162.112.119:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: 28522137588
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:51:32AM -0800, Matthew Brost wrote:
> > So to be a little nicer on the IOVA allocator we could use the below?
> > 
> > 		dma_iova_try_alloc(dev, &state->dma_state,
> > 					   (npages - i) * PAGE_SIZE >=
> > 					   HPAGE_PMD_SIZE ?
> > 					   HPAGE_PMD_SIZE : 0,
> > 					   (npages - i) * PAGE_SIZE);
> > 
> 
> Yes, we can do that. No reason to force alignment if our copy code isn't
> going to try to use 2M GPU pages.

When it comes to this I prefer we try to add alignment information
down to the iova allocator because I have other use cases for this
alignment optimization.

Jason
