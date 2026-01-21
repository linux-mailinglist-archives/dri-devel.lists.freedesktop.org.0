Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMsoJ671cGmgbAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:50:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0405F59778
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB6410E823;
	Wed, 21 Jan 2026 15:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Fiy3ityz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5873A10E823
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 15:50:02 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-8c52e25e636so942289485a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 07:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769010601; x=1769615401; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q7hXpke/3/yOS39pnZAAHMgYMjm6i7TC9CfciaL4A2Y=;
 b=Fiy3ityzmtR55ry9UXUn7nibRo4qZNtkI8wxLo41VNQXZNkC8kdUI+PqnGbFfWIGIn
 uwuCT8T7zTzqXlEM4nLk4vevBpjo/6lQjFh3jnU2TZZdEZ+t4MXEcQW8acJPbGLVBjIV
 xhvOL0lPpMp/+lQYI6MHXiy91UCQ8ICwXVV86Rgw0mQuupaomqOyu1QUl5i+42AfiXX1
 JcDhvXA1qxtPTzfNjj3J5lkuk4A7KfrOuSKy2Un1y7OdyAcQBNB4s9XU47SGdzt+X9Fu
 kdXC2mUlat78oppJvtjImYuL6mF4u5GbMtwqZ1plt+XO88rSDEbO0JxO96kbxkfIcmPi
 H+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769010601; x=1769615401;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q7hXpke/3/yOS39pnZAAHMgYMjm6i7TC9CfciaL4A2Y=;
 b=UxARbo2hTup2mv25KWEgwagMr3sJvKGndjNtc6tJywhdFrfXPTUKUa6kcKdrVLsnD/
 wlOZ7/MOAK3SD7MVb58z6+iTbupBC3+10inuawR0AgMH+ihtg2dC2cUKHSB6+kP2MYoH
 R7V+VIyjmWBvD0D2EdJfzR3vNgJ+aFMChRX5L0T7hCNSb/kF8qFKAf783RcLkK+7qpps
 bstsIrfj0bunNlWEU9kvtaX8pR8W2UaSC9aobswIDJN3ppE/Kq0FdrEFk9VTcElhvNAY
 KGvcWZN9ur5F718L+l+ScmlRLe+2N2MGuw5ZtV8uNPdaBhG3lV3HLvuEBxGqdBzQXiow
 k30w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUthoKAWzc9+GQGQ3JwC8R4DDyFuZ8EC8RsaesU/MfTDml4KlznNQJl7lF2JhCthRiEmiYFJ6yTNTA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoYzOsUMiFwdBbxyEoHeTxm6mfjRbraAlGnECBdM5rCB1F2GH7
 2ar43KZCHyumqS8oNmjt8N3T2HQZ8bhH+G8mLYxbsayhxk1i+da1nAntnRbHvREeV5U=
X-Gm-Gg: AZuq6aIrKCt8KNi5QjuOHjxvGl6gW9eflXPcoqJN+QJv/4pr6L+uf6NPMgltzxRnOIb
 WUV4o2vZyTbKyQeprxEfGUWIG+ygQaJHFvcp670S8+NcxAUfo8U+4mLQMXo4I8TLjhO6zxAPvUb
 XHcSDlINk24amKhWc3O5+18B+dN0w+dWZZssC3ET5L+znkEwjUAuwqYangdpmtWuQNMiSdTUhYf
 ihs2vBPsxOl5Yd6CmkZpykuOADSJnEf/Ycn8fhaGVF5Yal3s/nNa95C5I1pVYSdy3dLvlHZQ9r+
 PcaHmF9YmChT9mCrUuITmwbX9N7U/71BWuDfpY8hEjDJBITmPiU0GOq4W1Z/tEXWV5xe2HlJ67V
 6qaNesVHK4qL0PcTa3S3tGUlz3PKpsOQeJcPOfdu8JaFUDNPhGip/QFrXqFJf08ERO/P72L7Eu5
 a09mAQW8DcylYh5GTW8SwxJvKF30Xphf3pQ67r/vUvCd349iWEerI4J+uyYPvGFm1o29dYuKbgo
 7JIqQ==
X-Received: by 2002:a05:620a:298a:b0:8b2:7290:27da with SMTP id
 af79cd13be357-8c6a68ec70emr2561552085a.12.1769010601362; 
 Wed, 21 Jan 2026 07:50:01 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8942e6a9d97sm127467116d6.34.2026.01.21.07.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 07:50:00 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1viaT2-00000006Emy-0KMB;
 Wed, 21 Jan 2026 11:50:00 -0400
Date: Wed, 21 Jan 2026 11:50:00 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pranjal Shrivastava <praan@google.com>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v4 8/8] vfio: Validate dma-buf revocation semantics
Message-ID: <20260121155000.GE961572@ziepe.ca>
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
 <20260121-dmabuf-revoke-v4-8-d311cbc8633d@nvidia.com>
 <20260121134712.GZ961572@ziepe.ca> <aXDhJ89Yru577jeY@google.com>
 <20260121142528.GC13201@unreal> <aXDnAVzTuCSZHxgF@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXDnAVzTuCSZHxgF@google.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praan@google.com,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:alex@shazbot.org,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:mid,ziepe.ca:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 0405F59778
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 02:47:29PM +0000, Pranjal Shrivastava wrote:
> But at the same time, I'd like to discuss if we should think about
> changing the dmabuf core, NULL op == success feels like relying on a bug

Agree, IMHO, it is surprising and counter intuitive in the kernel that
a NULL op means the feature is supported and default to success.

Jason
