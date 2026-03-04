Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK9oEMFvqGkkugAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 18:45:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917922055F0
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 18:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B3610E09E;
	Wed,  4 Mar 2026 17:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="m/iILpZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1026610E09E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 17:45:33 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-8cb420fbb5dso421481885a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 09:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1772646332; x=1773251132; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nSAtzjXqss+uxlpk1YxZqBQHrNvbCWRFoP2RW9VjGUc=;
 b=m/iILpZIjH6AXV+SGl2Ybp+HlcZWyYm9IinBHm3fHwbkXEZtzTux0Jl1sx6XhEox3S
 IG8aic8SNU6nTdwNs80yTVY2NmRjjytyK5MZRq9RHbCVUZQlwcwpAOnK0OL6zY++az3m
 71P9y+VSk970kESHGarEhFd5y47yXLBwRhwHu66rPoe/Ykg05Q1pHEw2X3CRa7fNAuO1
 7xSHASDCNHJcaMrpOFijZh22or7Z4dPe862ZAc2osTnYaRXIITIh3UMh0iNl4acS1TTw
 X12lEqw56cgFqS+Vp65mvUkBc9qaWq7+C71IN+Vke4ank2yGPiUjaS2vfpxfpAD9W38a
 /HKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772646332; x=1773251132;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nSAtzjXqss+uxlpk1YxZqBQHrNvbCWRFoP2RW9VjGUc=;
 b=Uypc8hyF1ryHdf0GixVpHdNYvcjP51P3S7JHP3hkh6Hxmtox7/tzc3OAdQE67VDv5I
 6crCdFdc3YluEKCIgnAUxW1wRke0suqluobOmwwKF9G/gwp2qRIhnaL89Ckicw7FvjWk
 vRkcKlVu5ffFKMQ4DKEWWHK9EWrtLid7kej6oUt/5yDTAaMDshzKmTs7PEQ/YirlpPu9
 8v+uMOO6Txq423/VIqZUYUfGxXw0FDNcKCbGT1H1YncbDZLzJb4IjVKl6tkxmGxsJEBN
 qksgG6tt/1lAIlKCFSzxmfa9ly0KYh+eVwfO5D8OV76+iPHe+kHyLXlWTK74npyuTfDo
 BKaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrlNUQz5si02wRi0wskgg+2dNr3SZE1cp6nMEHUOlULtK2/4DIRtgUGdjvyF2N61P4+1J2FPQwxhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe6BLSsL65Pb57RH7W9L43heMN9u4XSJHBICQtytuADpM0NzY0
 mRZEaS0MadhZGqU49U2pCryMjydDM/zFYRJ8HU2gzbPiVMPqNws6wUy2BnboV1rnj8A=
X-Gm-Gg: ATEYQzw4PUIIMbimh2UjbekGe8GaG+6UEVdE0WdRmhpOBtX7koRlPSsWTrqXrZZ5i/s
 0/qXCpw2+ko9xAod3m7IAmK/ZejZvW0FFoiEB1RkiYaQZOhxh/TI9wVVNxJOCTGO/peYbd0CZDt
 yhIxVPbCe8SYHV4ZjCUGeN76HEf0/muAVrLyrILVr1QE+cc9vvEC9KCO4SxLLhtdabbx2edd2AR
 FAyUa6du/E9jJ/PcXoSKcRvWcW7JTt2QjPSypDkKO0FJ2276K8QGB0wJHU7UYzb+IaVoIvXzTnO
 5svpBuCW05XLPBLlSCU7Ciukuj1SNfTBr4IxQxmdFNbitp5IMCG+3wY7FlT/FrO+UMcrkpO0Yas
 aZwq8OvTip03K1QIHzrkBPdfesf2n99DlGQ7e7IHsYjLiagTO5lvz/MvdSAZIY3CbEJsYv4bcbQ
 AK5rhP+xOcsoOhMI6dHOr1m7Tz16OKAVax16XFCkFXkYu/nEvbSouyEh8pusyK3VsrMRg7Zp9Ed
 xjayyjk
X-Received: by 2002:a05:620a:4481:b0:8c6:ee09:5eae with SMTP id
 af79cd13be357-8cd5adb8d1cmr343907185a.0.1772646331749; 
 Wed, 04 Mar 2026 09:45:31 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a1fcb781fsm8074876d6.23.2026.03.04.09.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 09:45:31 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vxqHq-00000005ET5-2S2S;
 Wed, 04 Mar 2026 13:45:30 -0400
Date: Wed, 4 Mar 2026 13:45:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Peter Colberg <pcolberg@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Boqun Feng <boqun@kernel.org>, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org,
 driver-core@lists.linux.dev
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV capability
Message-ID: <20260304174530.GH964116@ziepe.ca>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal> <20260304141852.GF964116@ziepe.ca>
 <20260304142600.GB12611@unreal>
 <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
 <20260304162711.GI12611@unreal> <20260304164551.GG964116@ziepe.ca>
 <20260304170249.GJ12611@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304170249.GJ12611@unreal>
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
X-Rspamd-Queue-Id: 917922055F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:dakr@kernel.org,m:pcolberg@redhat.com,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:abdiel.janulgue@gmail.com,m:daniel.almeida@collabora.com,m:robin.murphy@arm.com,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:yilun.xu@intel.com,m:trix@redhat.com,m:mdf@kernel.org,m:rafael@kernel.org,m:boqun@kernel.org,m:linux-pci@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:acourbot@nvidia.com,m:apopple@nvidia.com,m:joelagnelf@nvidia.com,m:jhubbard@nvidia.com,m:zhiw@nvidia.com,m:nouveau@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-fpga@vger.kernel.org,m:driver-core@lists.linux.dev,m:alexgaynor@gmail.com,m:abdieljanulgue@gmail.com,s:lists@lfdr.d
 e];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,vger.kernel.org,nvidia.com,lists.freedesktop.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:02:49PM +0200, Leon Romanovsky wrote:
> > No, illegal, and it doesn't even work right. When VFIO FLRs the PF it
> > will blow up the half baked SRIOV and break everything.
> 
> The FLR can be disabled. For example, PCI_DEV_FLAGS_NO_FLR_RESET flag
> will do it.

Well that would break all the security properties of VFIO.

> > VFIO already has its own sriov_config support, the right flow is to
> > bind the PF to VFIO and then enable sriov and do your assignments.
> 
> VFIO started to support SR-IOV in 137e5531351d ("vfio/pci: Add
> sriov_configure support"), which was added 8 years after VFIO core was
> added cba3345cc494 ("vfio: VFIO core").

Well, time to upgrade, I see no reason to allow Rust drivers to
further propogate these mistakes.

Jason
