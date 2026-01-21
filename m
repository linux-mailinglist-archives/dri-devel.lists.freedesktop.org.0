Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPwYHrfzcGmgbAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:41:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50B1595EC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA8C10E801;
	Wed, 21 Jan 2026 15:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="j4MZKsgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D42E10E822
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 15:41:39 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-88a37cb5afdso14960676d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 07:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769010099; x=1769614899; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ou8wYJVgke38aZatOGIOXXNbnvyF2AuO4MiXOCQfuAM=;
 b=j4MZKsgUzjKQEpQMncc+/HcrEhb5f8k9TQICdU9VNuXmlenrDEpZRNk6OUPg2FQBZg
 5oUzaIrEAGpXUfT8bt68kqaimPLQ9lnU37FzB/va3EHpDGg/ZvBD01LFMHd+lii3pXr7
 Xzec+FExy4n7Q6eihGRIq1E4sUChCKXe1KgLhSbiw84bKGwO5sfXBd5no5iSYm40FCm3
 /IcgQU+LmiMmxV60xEunnfTpCTx+AYLGV11mi9LAop2ydcz24suGmc8r0zVEnCjNKuKj
 oJUIQ8H0J0X4bjpMwB7oo0dY3/mbBXX5m0X8i0Xv9X5MRukEttpTMeeeybrzypo++0JP
 ZpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769010099; x=1769614899;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ou8wYJVgke38aZatOGIOXXNbnvyF2AuO4MiXOCQfuAM=;
 b=hen/B8bbZEu+DGdQoWcBdsvDIeXbvN9WM8LpQKSaSm2Tk7Qkv18kqsG08ao8vvEjzl
 CBTs2BznmeRYAfLlAobxiHku955tEbkCT2XYtj31J8FGuLNtwqidfVNgBnGTEAFkN168
 HZd2j3rTgx0yKzcha3Bhk1U6KzOpIyk1cHHmGmy4yOBiv+V8YP8XMmsGTS/iJ8cr6d65
 gBvXaHGbf/hVWpbOAxIS0aJeOGHVC5jRXnr0XXMCy/9wfjLce7tqMmA0MDUUQzAvzude
 /c2FQ7RqMobGMS9ob4cX7Lz4pJiDfcSkrHfqO42RT4Tot8IL5whCqCjYv96ned2oEVSG
 uOcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaFKIBXYczPRu4eDBPkSRsZ6yutZ0A+AG90YWtp+NuSc1DhMt/xR0HjcA4Y5MgRlYd7NAhCvLCAVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4EMJXupQNK5ahBWTxWq+684GpMcdFnTrBpOpEh9gQucqusmDz
 e5fqj+p+xufarErtxdsnaAZYxP3J+WyGm5TCrSdw5nSTjww6sJf1j4RrVC+2dvlglWU=
X-Gm-Gg: AZuq6aJiTkuf9pS4ub1b+kMlTGe+bCKdnJieyWhIQt6Fzp6+4n358gxvnBNWFKWucdh
 lEIVBzJE1cXQKjnu80HErcjOyR0yP4voRyksaxy7UEWQV2e5UYW4UVcbMOQESZNg1+rZNUn1vDp
 m/hIuYOxsWHAW7EW1c+4zv/DpDsvZZ3NdGvQDGPjARxVirujtQApsnpr181abMWvidhWL2WzBcv
 PB7K6WOoiJXdi8nP3Sn1hvHsw/pxD7ucRQBlaYQaO/WqhUAZhV5RENFQw/Sqju7/uLMFVi1IfpN
 /MUOUFCa+kb1oCmMVBaVeZ8GPNBak5xA3UPWHYP2YyJbiFLeEHdX+P6dOkbVelBkGAhuPJw6dqd
 OcfxX7sn5myXL1kfa9hvsOSwhAQD8RJkKZlv/puET27E6zLFuhFEP0jjD69LmDTh4drGbnPC5Vx
 GbCrqpjHq+/iVqL1ekraLCjyDwqdxl+mZ7OeOPwIKQ/vxhw8HyF1MClnv7IcJ/IZcQgQdBiFK2f
 d01UA==
X-Received: by 2002:a05:6214:212b:b0:888:6fde:7b72 with SMTP id
 6a1803df08f44-8942d7e0460mr262093776d6.32.1769010098574; 
 Wed, 21 Jan 2026 07:41:38 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8946a1e3d28sm30951806d6.7.2026.01.21.07.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 07:41:37 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1viaKv-00000006EjK-1pDz;
 Wed, 21 Jan 2026 11:41:37 -0400
Date: Wed, 21 Jan 2026 11:41:37 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
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
Message-ID: <20260121154137.GD961572@ziepe.ca>
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
 <20260121-dmabuf-revoke-v4-8-d311cbc8633d@nvidia.com>
 <20260121134712.GZ961572@ziepe.ca> <20260121144701.GF13201@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121144701.GF13201@unreal>
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
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:alex@shazbot.org,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: D50B1595EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 04:47:01PM +0200, Leon Romanovsky wrote:
> > We need to push an urgent -rc fix to implement a pin function here
> > that always fails. That was missed and it means things like rdma can
> > import vfio when the intention was to block that. It would be bad for
> > that uAPI mistake to reach a released kernel.
> 
> I don't see any urgency here. In the current kernel, the RDMA importer
> prints a warning to indicate it was attached to the wrong exporter.
> VFIO also invokes dma_buf_move_notify().

The design of vfio was always that it must not work with RDMA because
we cannot tolerate the errors that happen due to ignoring the
move_notify.

The entire purpose of this series could be stated as continuing to
block RDMA while opening up other pining users.

So it must be addressed urgently before someone builds an application
relying on this connection.

Jason
