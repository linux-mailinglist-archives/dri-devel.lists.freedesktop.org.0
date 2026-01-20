Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBP5B/HGb2mgMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 19:18:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6F7494E9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 19:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802BC10E1DC;
	Tue, 20 Jan 2026 18:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="mg19lN11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31CE10E1DC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 18:18:21 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-8946e32e534so4134426d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768933101; x=1769537901; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UjKhtF6uFrGGz9QpG86rUrUwPRn2VxIJfZmcip97T7s=;
 b=mg19lN11yEiH9e3SaDW3Ol44YX+4y7uWDvq7kEQq3rX4U05MvIdKR47nrVYLfgbKYx
 LaARWtPsacqv8q/xRsb1YUU9zcpYcqBqKLTAi9BswTaFOqPR0iTl08wmo56BRge0Axwn
 jqfl7mCFNi/XgNxsKUvyqwUwsJaEgK9jOltdxNV7/6nORbBzZzOcC77FEl/Exi26+f8M
 zjvDJ3i1epChFC8DeEgyr3UDS+vV4ZZEpfVyISkkqsR4VGd6gTs9hfQqU6n8LrR7Onu2
 iFX70Mk/6dP7FW2m1FqTu7u5hgf7RjM4HW2shlCcLjHpeq32xE1sd4T3JRjNDjiES0zX
 L+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768933101; x=1769537901;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UjKhtF6uFrGGz9QpG86rUrUwPRn2VxIJfZmcip97T7s=;
 b=I77fJLHG57Ly6ZTO7H+tD+cq34uvq83+o/yXYRtW3xh5SJd449a8DnfS5IreNGplTL
 jWjCi/sAgSNk+iBLQ49JLKZ2pkBO98YmjTIMTFo3X25rMP9X8X9mV4Qak+cZVEQFFHEw
 GtCUhOpebSZgeZunqnkIkQDKPheey8IKNbfuPBzNU0ng0bE187khN452+NI2+bFXyS1k
 aMxinn9ca3EsJAb2sD03XG2pc+Xm1moRLgoCrmd9vBPlqLu2Dsv0+MX0nkaewDiCi0FA
 +Z4pNfNJkpOiB6Vrhc6/XE+hH0RmQyqAmUJqA8EhuUMvNdNpAEZ2ZezI2LXYuZkvm+Wg
 yslg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO5MrpDAy4aUtHYxu8ZCTjwovhulagqtQ9Xu8uJBRZBictLLr+hp2pDtyotf9h8BCwNYTEaJ6C5Po=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6uggCtwB9nq9j64ytOhYsPAl7qo464+eUE7VmCTK6B0+vlksx
 bFova9UD+7bCYVAFpdTR5FwGWRk7onrZp5Kcv2pxtQTcbBMVAhJrTvwnQW0wynMe2z0=
X-Gm-Gg: AZuq6aJIKQ6WNm/yosnnQzTy/p67FOVEQhpZOzOapeJQRScxBG87XG74iHZ8TunIy5u
 A9eVFn5JxkfR3/OUX30ZHgqmFMwLdJg7FoolkobeWsIWR8iHWu/DbcyvT8tEM2gUWub38OH/zSv
 /XWPGthNlRISaMZdViGchX4Z6s+E2u/zdR7UmM6f92UqVWWraVQncCwPMRFYZMoAWgWY+mMHPEZ
 Y0ObmLxokNCxmQ3uK2vgX8vbVL+bmJZ3n2bMrHRwGbIGoUrt/KEQa+nGe0U9APEr5OVmH8T8gq8
 UbMvKHtjN3KX65MTBZOMO2kXW7vIQLbLbm4fCmXnkA3vrbjcFWLc9HbmA/QJthiNmMDTaFnfaAJ
 RvDKNiXaAsghZEa8WxUX8nOrTjaGnTAyUaa+IhkHu+3Iy8wbYu6ZR5SW67mHk4kcRIh4jmMTF39
 0r2oJ2XnJQANPRevMa89XKpx3xMHE5X6VQgatedyvrp/smTae6Ak8zP9ECOAu2/kABCc0=
X-Received: by 2002:a05:6214:1301:b0:88e:6db7:f999 with SMTP id
 6a1803df08f44-8942e0c342cmr235499176d6.6.1768933100910; 
 Tue, 20 Jan 2026 10:18:20 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8942e5e535dsm114108506d6.4.2026.01.20.10.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 10:18:20 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1viGJ1-00000005aZS-41Vi;
 Tue, 20 Jan 2026 14:18:19 -0400
Date: Tue, 20 Jan 2026 14:18:19 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Edward Srouji <edwards@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [PATCH rdma-next 2/2] RDMA/mlx5: Implement DMABUF export ops
Message-ID: <20260120181819.GT961572@ziepe.ca>
References: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
 <20260108-dmabuf-export-v1-2-6d47d46580d3@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-dmabuf-export-v1-2-6d47d46580d3@nvidia.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:mid,ziepe.ca:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 7E6F7494E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Jan 08, 2026 at 01:11:15PM +0200, Edward Srouji wrote:
> +static int phys_addr_to_bar(struct pci_dev *pdev, phys_addr_t pa)
> +{
> +	resource_size_t start, end;
> +	int bar;
> +
> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
> +		/* Skip BARs not present or not memory-mapped */
> +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> +			continue;
> +
> +		start = pci_resource_start(pdev, bar);
> +		end = pci_resource_end(pdev, bar);
> +
> +		if (!start || !end)
> +			continue;
> +
> +		if (pa >= start && pa <= end)
> +			return bar;
> +	}

Don't we know which of the two BARs the mmap entry came from based on
its type? This seems like overkill..

Jason
