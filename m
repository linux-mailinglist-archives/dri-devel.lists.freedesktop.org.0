Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALb4HsZhqGkUuQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:45:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC59D204898
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B6E10EA6B;
	Wed,  4 Mar 2026 16:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="ToFO2c8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FE310EA6B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:45:53 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-899fbf92bdbso49291296d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1772642753; x=1773247553; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q6mBd5S5w+Qyk+kaNVLUq/NDaIG3PNFY6vyWjAmF/Cg=;
 b=ToFO2c8Bh1Iphrd50T1lcFzmzvedwhTfRWJYY1uZk9KD8dJWsaFPLdjbkxlqZ6CEpg
 Lj5hWyhJ2JqNElUeyYK5QRzttenh6J+quG+rz7zbzfsgjJCDS2cPRaDpsRle7BwOEJES
 niIL84LGj5TE+O2Y5ywcVZxbsMRfMuYnLc9+64JeXFndTM8y61Sv8EcaqvxZqwJUtfxL
 +BfbrFpWNR9rGq6UiUtxN+o3fueMTKnH10HFTPS4unFMkcaged39GjNGz3EfiIWWCCvq
 KKJxTZCjC+KxNhFiSMguq3DjyzPrWghwoA/05wh+3bEVYUMlOGxEHrn3rPkXqs8Dt+6B
 6Ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772642753; x=1773247553;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6mBd5S5w+Qyk+kaNVLUq/NDaIG3PNFY6vyWjAmF/Cg=;
 b=fBvDNyugZKEVrokN5wjwosxBjFrDKxUEcRlPKJUn1gBjz2+zx905hexMRptXHSpxYm
 bNQWVYlF1br7+RgNdmseNrQdyGUManWKDMs8Ln8NetlTAacsXqYGhPKJFPjI/Vq05Cps
 IPYhjLHhHTEbHtwk/gqoudm/UqVwSAP2Huo9GWbXahSTfpPgEAH+tHBV17aT0/mn0bDy
 ar3deaB/2A2/3Yt2PvUSWFWT10AR9z6BY9QV3nlYv05DvQiN4iFcp0QcRn85PO/sJO4E
 IjBX7iZSY4Zsr6w9Nz5nvtrV5RWRR41wf+EzLZ3RXmVY/LfjLwxn9klqdJPmePcqrw4B
 CPWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDC3pEWchQfmjAmTQOtoEWdS2ZpQ/+PeScsykD7X1VIUj1bpP4KsPd4oEEDQ1EqP8oqxHJehzeiO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEZORP13kwUMSR2nmpkLd8Gp6nkBkfv2iMeQI2XN1hADBa89cI
 wqiNk2ZXVb6z2igUbEdEn7L0JJ0JscqTRP3JmHKs2YU9WMmrTxlaW8cehT81aa8qEKA=
X-Gm-Gg: ATEYQzwfXRMx9YUbiap6wUaRO5jAYqy14TIsA/DJsOPSjLTIDCV0ekVhbkVyeF0CsXF
 1DbCEn6hoMj76kmkZScSbl1mjWnt1i5jqWU7hTBg8aW82Peh/AH7vYUUO6eO+6YhwnrO0w6JugN
 U5WCcT7lvmIll1IbR0yGAsraglLaRzBocGF8Wp5P0NzF3+xS/8Jzy63RbPSSd0wdyOr7an5lhVy
 sygah0Kn+KKLI7r12eeLfa5YXc6T2dEm0o7eBJCmOpm0R/kvshh8yV4lsjQdLcc70qMtVoYyDPC
 JmsqYyVUlyoPHO2oxM0mRc8TpRAdDJU2JqVu5J6w2wAvtuD63bvbX4PfEKDchgYFLrloWc2cHdL
 3G4aeRRJAaccq2Hq+SFjpvQjo/KGJ/JS2CBLzfML0K6DHR+2QTSPEzJIED3Jp+Arzc/tK7Vh0Wc
 NqHFlVZNpNk8uCzEWpsIzjL9FTQOBVse0BfEa1mWFNPPAWWlPYaIuK3eWP45OkUZ9QLtrdVYGM4
 tvy4j7Wf/7mRQjAzlk=
X-Received: by 2002:a05:6214:cc6:b0:899:f2af:bd85 with SMTP id
 6a1803df08f44-89a19ce9729mr37872326d6.45.1772642752542; 
 Wed, 04 Mar 2026 08:45:52 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-899fdf30e99sm69421516d6.3.2026.03.04.08.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 08:45:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vxpM7-00000005CBf-1l90;
 Wed, 04 Mar 2026 12:45:51 -0400
Date: Wed, 4 Mar 2026 12:45:51 -0400
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
Message-ID: <20260304164551.GG964116@ziepe.ca>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal> <20260304141852.GF964116@ziepe.ca>
 <20260304142600.GB12611@unreal>
 <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
 <20260304162711.GI12611@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304162711.GI12611@unreal>
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
X-Rspamd-Queue-Id: CC59D204898
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:dkim,ziepe.ca:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 06:27:11PM +0200, Leon Romanovsky wrote:
> On Wed, Mar 04, 2026 at 03:57:57PM +0100, Danilo Krummrich wrote:
> > On Wed Mar 4, 2026 at 3:26 PM CET, Leon Romanovsky wrote:
> > > On Wed, Mar 04, 2026 at 10:18:52AM -0400, Jason Gunthorpe wrote:
> > >> On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> > >> > On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> > >> > > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> > >> > > capability of a PCI device. Provide a minimal set of wrappers for the
> > >> > > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> > >> > > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> > >> > 
> > >> > <...>
> > >> > 
> > >> > > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> > >> > > into by setting the flag managed_sriov in the pci_driver structure. For
> > >> > > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> > >> > 
> > >> > Why? Could you explain the rationale behind this difference between C and
> > >> > Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> > >> > for a practical and well‑established reason: maximizing hardware
> > >> > utilization.
> > >> 
> > >> Personally I think drivers doing this are wrong. That such a driver
> > >> bug was allowed to become UAPI is pretty bad. The rust approach is
> > >> better.
> > >
> > > We already had this discussion. I see this as a perfectly valid
> > > use-case.
> > 
> > Can you remind about a specific use-case for this please? (Ideally, one that
> > can't be solved otherwise.)
> 
> You create X VFs through sriov_configure, unbind PF, bind it to vfio
> instead and forward (X + 1) functions to different VMs.

No, illegal, and it doesn't even work right. When VFIO FLRs the PF it
will blow up the half baked SRIOV and break everything.

VFIO already has its own sriov_config support, the right flow is to
bind the PF to VFIO and then enable sriov and do your assignments.

Jason
