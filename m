Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK7YFV2nhGmI3wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:21:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD59DF3E43
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF0410E8E3;
	Thu,  5 Feb 2026 14:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="T82y2l+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A87510E8E4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 14:21:14 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id
 6a1803df08f44-894770e34afso13634206d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 06:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1770301273; x=1770906073; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MSUoQMJoCCNydU2DcwMWqdKRWnt0MqAVvIGN6ESmMGo=;
 b=T82y2l+gvgvflNe+Ykv+sIOMay/sO8Q2rFK8m/HCNE9dJZ/derfurWcpf8hRxRbpT3
 655hJEFUhTmBijclKOd6OJdPCtg1Yf9VzTMvpOb7HeJpH5Dvu5UP8r4zhIJZfs5B0rWG
 Z0WHLO0jQ2NQuqBscSKVlj3VUBrx0JSCZMyiS9hh6bT1oLtHqNctjEDV2xwlMJYRcNNN
 vVJ89ZccVFE6A+GE2+JFWg3LEeeD/kMUQUiF9zT2toKPNnw03RHF30r62sxxS5t0rS1/
 3SlNJIT3G0WqBtk7cca50Y61ey7EHayMa6gLR6/wmUbOE2cV8vqPmM4hQTaHrRIm0gxa
 euEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770301273; x=1770906073;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MSUoQMJoCCNydU2DcwMWqdKRWnt0MqAVvIGN6ESmMGo=;
 b=Bs40od+zrBOS3V6tERfCQshy2s8slXFmM23LgDJK95nPNrDiGA8CwbAAxdIxy1b+E6
 XGmPy3LsfB7c7aqs4m+0eIjoGJDgHToJqfZMJ9tbIQKuOFfXjvkMz0Lj3FneZjDJZ191
 F481SRn89HP+pyUxmPfBFimsJl5XB+4yqjm0FzVUuaIJP6gQuJSwvfY/0+52yZ3y5C9U
 icsmMhijLgLrB3R+ZDj3iivuiO31S/wQ/jfCcHxAEQFSYNP6c9mt21osSWJUA9zRF+2F
 M6n3FfA/jpg3NgDE8pBTaFy/vOE+41nz13KDm372Zpr0sEtJm++rdABywBIlG5AWzAV6
 UxYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVezcwoXMvgc91sHpNLdRFGmvzwVYZub9nZbBBoNBcyZo4xY/6ALBGDmcCqDd54lKaD1LLOnFojKoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfvWAwhgaQl0MYAWC5lcI9wfgeLG4Ywc+BDa9E7orMi6VXN/ys
 73aXyJUQy4lVFIyrZsmgfWT94XewdshvXAcl81DXQaj+FCeLEnjw7S0Jto+8+JlFUDU=
X-Gm-Gg: AZuq6aIPzroQYh49cSRQ+z2UEKyfaOYWHCeMXWeKyRPafhkX0QxUIx7HYsrGbkA5FBc
 TdRdXJjBNSCFGJziDaA/IvJji3ScsjjKizxQf4oYu2Xi7UlvyITDvCMGNq0PFpoqARv5yktMHxl
 HEvBH5jmq/3VSQ18l86npvDdUnAFUrN1fCW6a2PQorIngumdcmbHomyDZOF6MDAbdp1t9hv6nGu
 TMjyKQg5ieXS4EI8I9QZksjyTgtMtpmxv2728LW6OimPYhAGSqJkqpj/tWE5vzJLRAiEIhQvfI/
 9tKtDbbOqGK3Vr2Yxi5Rr5VOFUlShOH1LTtpM0ehhgCTSfzcb+iFvVpTjgXHFBtjbnFGIEiwHFI
 43rD/KBSg000Imy76DRX4RXH6O2XDtu3O582PyOdVqTBZRxMmB82zBeiAc3K5s6QQFK8UXL/Wbn
 zZigwFfGq/MLy/M1RWYzsxZoxcQshxjydbMe90wf/ZAj6f/Lo9BLH04pU8XWor2rEkkV0=
X-Received: by 2002:ad4:5cc6:0:b0:88f:ca72:6ae8 with SMTP id
 6a1803df08f44-89522189787mr84672066d6.45.1770301272999; 
 Thu, 05 Feb 2026 06:21:12 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89521bff53esm42252276d6.8.2026.02.05.06.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 06:21:12 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vo0EJ-00000000kPY-3gpa;
 Thu, 05 Feb 2026 10:21:11 -0400
Date: Thu, 5 Feb 2026 10:21:11 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Williamson <alex@shazbot.org>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v7 7/8] vfio: Permit VFIO to work with pinned importers
Message-ID: <20260205142111.GK2328995@ziepe.ca>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260131-dmabuf-revoke-v7-7-463d956bd527@nvidia.com>
 <fb9bf53a-7962-451a-bac2-c61eb52c7a0f@amd.com>
 <20260204095659.5a983af2@shazbot.org>
 <ac33ad1a-330c-4ab5-bb98-4a4dedccf0da@amd.com>
 <20260205121945.GC12824@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205121945.GC12824@unreal>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:christian.koenig@amd.com,m:alex@shazbot.org,m:simona@ffwll.ch,m:jani.nikula@intel.com,m:lucas.demarchi@intel.com,m:sumit.semwal@linaro.org,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FREEMAIL_CC(0.00)[amd.com,shazbot.org,ffwll.ch,intel.com,linaro.org,gmail.com,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,8bytes.org,arm.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[35];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,anongit.freedesktop.org:url]
X-Rspamd-Queue-Id: AD59DF3E43
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 02:19:45PM +0200, Leon Romanovsky wrote:
> You don't need any backmerge, SHA-1 version of vfio-v6.19-rc8 tag is the
> same as in Linus's tree, so the flow is:

I'm confused what is the problem here?

From https://anongit.freedesktop.org/git/drm/drm-misc
 * branch                          drm-misc-next -> FETCH_HEAD

$ git show FETCH_HEAD
commit 779ec12c85c9e4547519e3903a371a3b26a289de
Author: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>
Date:   Tue Feb 3 16:48:46 2026 +0300

    drm/komeda: fix integer overflow in AFBC framebuffer size check

$ git merge-base  FETCH_HEAD 61ceaf236115f20f4fdd7cf60f883ada1063349a
24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
$ git describe --contains 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
v6.19-rc6^0

$ git log --oneline 61ceaf236115f20f4fdd7cf60f883ada1063349a ^FETCH_HEAD
61ceaf236115f2 vfio: Prevent from pinned DMABUF importers to attach to VFIO DMABUF

Just pull Alex's tree, the drm-misc-next tree already has v6.19-rc6,
so all they will see is one extra patch from Alex in your PR.

No need to backmerge, this is normal git stuff and there won't be
conflicts when they merge a later Linus tag.

Jason
