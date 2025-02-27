Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090D7A48A6D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 22:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524410E0AB;
	Thu, 27 Feb 2025 21:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SiIha4CF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB6510E0AB;
 Thu, 27 Feb 2025 21:26:00 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6dd15d03eacso14510856d6.0; 
 Thu, 27 Feb 2025 13:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740691559; x=1741296359; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UF7O2o8LV3sBQN2Z5pMzAnL0OBwN8vfx4Qu6oNc5dM=;
 b=SiIha4CFYllxuDar1yUgao/ABXEl5h2OkWdwaGpHmY0j0b6T9azY0If5X73rjmqb11
 IBkXa6QZi/Eb/3VQviJ0/MZWBy4a0rwqm1K6wxtfK05noMtz3jB5NR4FsmP/gPQjhw+m
 aTzeudm0q8mWpfSyHGt7mHWEX1LU/+TSn1xQbtwvXnjWiRPuF+FKwnnEGYMlmMgXMopj
 1PWHlw85zFnjjMTRpjhMopayQ1QR0Lx0BaZPDv5+IEudbzaP/YwlUBnCrKJrzQJf4unH
 qs/thxRN0IIkKrWtnzdFIwrzrllXqN472GtNjAQTED84XAuNAziJW4qlv03hbB7AEZFo
 UIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740691559; x=1741296359;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UF7O2o8LV3sBQN2Z5pMzAnL0OBwN8vfx4Qu6oNc5dM=;
 b=cWyTwtu0BU+jOiZV0TZG/bLX7cfbUsAsLgNd27y81rf/U8q6xONVAhqdHs+UFUgZ9n
 xH+SQl10VselkuhlO+uOq42GtE7OQr+AUwgPIFJ/K3PsjMfYxmEOb1tRdE+e3xLW9xvg
 aUtgPBUD7SgS9WiE1zFMUfbAitcZTaMPezZrhKR8Ba5zUflL2xCo4t8DypZxqEmuW766
 8/HTJUPDNb67CveRApAuuR9b2ZAIZDd1ybO5dFWh3eZ2P61bhSfRdOjiSvs9/T7vGGBF
 +s5cBWjjtbQJx0VhEnTRTc+Qk2PwUEmivhuMuRJQ2XbRwFX7L1w8clhm76oO1FH1Ent0
 ZJkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFrCkGilJQssmdRfNf5QB8BeQ5laJx1LWIkhiQo8byzxo9T7VdV+C1QS5A+NfnbqX4hcGXgAfZIwA=@lists.freedesktop.org,
 AJvYcCX0Zp0w2ffpQzunVT8S7hDqgU6wS9p6q+dDsGF2/96BPnNSlyTyO8bSCLVV7Kss5sVm80fyHaTPeA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF7D1VZoNMsuOMyphdTkNgqs5eYk9MBDbrPGikvPM/UR9+1ieE
 g7DU4gfM5ukHWUG0p+9IxsDnP9//0JV7M+iM9N5L2fzdwAwBpfir
X-Gm-Gg: ASbGncsXNwPC7SbgrZARXnz3iSXWhydhn1NgXQMnMzHV9xFSLfsRS2sqgvLucj24D7X
 vhwbV0vDdTAiGrPXoQw+pt0Np9t2cE2OuTt92e0/Y8w/s0HbMq0IFP47c0kTYHUrmAy+w2DybMP
 XzoPCp5Qtfpo4h6IRWRAGe4MOyV4nalCXCDddC5l3nZDz6Cq3E+0/owdI5zgxn9mV02CufY9MPq
 41th9A8duWifCVWyDjMvolZcOr62cn3d1qH3LXbZSbWVABV1aDEdelxBcPqNr/jNrOSRuJxvFgh
 XsHIc0Jav0BmNm4j7y/oe6FQ8PEwlxQijkNXwB2dxVMVvRtDTWZG6RpSXSSSHu4Hjne18efhknJ
 nMuZggiy+Ql94F0SM
X-Google-Smtp-Source: AGHT+IEPDOQ7BZ2Sbx86St0jP2+DOKauK3d9nYm7k7AYGnZ2YAad8o5P61Ob7AwAw8Bjzh+SoVipww==
X-Received: by 2002:a05:6214:2aa8:b0:6e4:5a38:dd0f with SMTP id
 6a1803df08f44-6e895798e25mr78217746d6.4.1740691559215; 
 Thu, 27 Feb 2025 13:25:59 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e89766087dsm14124836d6.52.2025.02.27.13.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 13:25:58 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfauth.phl.internal (Postfix) with ESMTP id 32F7C120006A;
 Thu, 27 Feb 2025 16:25:58 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 27 Feb 2025 16:25:58 -0500
X-ME-Sender: <xms:ZtjAZ5xiCQj1tMhaxghzhrNFsXc0VYP-45C8hZJpzVts_mPyzLI6ZA>
 <xme:ZtjAZ5RAXVI0ln7niV2HDes9T-ndIGX57kNI1tqAbzP8GHwsmqvmH2T21mfxi9onf
 SPhQawZhkLrnSwV9Q>
X-ME-Received: <xmr:ZtjAZzXPibEUnw8gs_pK9FWxq3GpZvvNGu8T6Xre1aa3fhtObNNT_UHYQs4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkeehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
 drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
 ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
 ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
 hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduhedpmhho
 uggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhgghesnhhvihguihgrrdgtohhmpdhrtg
 hpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohgvlhgrghhn
 vghlfhesnhhvihguihgrrdgtohhmpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiug
 hirgdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghp
 thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepjhhovghlsehjoh
 gvlhhfvghrnhgrnhguvghsrdhorhhgpdhrtghpthhtohepjhhhuhgssggrrhgusehnvhhi
 ughirgdrtghomhdprhgtphhtthhopegsshhkvghgghhssehnvhhiughirgdrtghomh
X-ME-Proxy: <xmx:ZtjAZ7hDlqdN1I5R7i4hpxdt_QE8BVIdqpH1m4SFCGUhSpHlUsdb-g>
 <xmx:ZtjAZ7DptZWXmZMeZ6xDEnwJV0DYHrTujc3EL3aRFuW56V2GXN0DCw>
 <xmx:ZtjAZ0I8j70c-gvzPmtP21DJefEBUeHAtRm7OYjzNOS14hgzgbCDVw>
 <xmx:ZtjAZ6CFlaGMj7OZ24M6YZ6jF3FgQ3jFPnAVwHVbLwl3HX70SVON9w>
 <xmx:ZtjAZ_xx6BrgASXaWs5JOVwRlPZp3ATVyj0YMbg6d_eL6dsONWdXTO-S>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Feb 2025 16:25:57 -0500 (EST)
Date: Thu, 27 Feb 2025 13:25:10 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z8DYNszfONdsKZsl@boqun-archlinux>
References: <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
 <Z7-0pOmWO6r_KeQI@boqun-archlinux>
 <20250227144618.GE39591@nvidia.com> <Z8CCKl_yA74WjpQ1@Mac.home>
 <20250227161733.GH39591@nvidia.com> <Z8CY7fqbtbO4v1jv@Mac.home>
 <Z8ChnwPC0UwM8xBe@cassiopeiae> <20250227192321.GA67615@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227192321.GA67615@nvidia.com>
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

On Thu, Feb 27, 2025 at 03:23:21PM -0400, Jason Gunthorpe wrote:
> On Thu, Feb 27, 2025 at 06:32:15PM +0100, Danilo Krummrich wrote:
> > On Thu, Feb 27, 2025 at 08:55:09AM -0800, Boqun Feng wrote:
> > > On Thu, Feb 27, 2025 at 12:17:33PM -0400, Jason Gunthorpe wrote:
> > > 
> > > > I still wonder why you couldn't also have these reliable reference
> > > > counts rooted on the device driver instead of only on the module.
> > > > 
> > > 
> > > You could put reliable reference counts anywhere you want, as long as it
> > > reflects the resource dependencies.
> > 
> > Right, as I explained in a different reply, the signature for PCI driver probe()
> > looks like this:
> > 
> > 	fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>>
> > 
> > The returned Pin<KBox<Self>> has the lifetime of the driver being bound to the
> > device.
> > 
> > Which means a driver can bind things to this lifetime. But, it isn't forced to,
> > it can also put things into an Arc and share it with the rest of the world.
> 
> This statement right here seems to be the fundamental problem.
> 
> The design pattern says that 'share it with the rest of the world' is
> a bug. A driver following the pattern cannot do that, it must contain
> the driver objects within the driver scope and free them. In C we

I cannot speak for Danilo, but IIUC, the 'share it with the rest of the
world' things are the ones that drivers can share, for example, I
suppose (not a network expert) a NIC driver can share the packet object
with the upper layer of netowrk.

> inspect for this manually, and check for it with kmemleak

In Rust, it's better (of course, depending on your PoV ;-)), because
your driver or module data structures need to track the things they use
(otherwise they will be cancelled and maybe freed, e.g. the hrtimer
case). So you have that part covered by compiler. But could there be
corner cases? Probably. We will just resolve that case by case.

> progamatically.
> 
> It appears to me that the main issue here is that nobody has figured
> out how to make rust have rules that can enforce that design pattern.
> 

Most of the cases, it should be naturally achieved, because you already
bind the objects into your module or driver, otherwise they would be
already cancelled and freed. Handwavingly, it provides a
"data/type-oriented" resource management instead of "oh I have to
remember to call this function before module unload". Again, I believe
there are and will be corner cases, but happy to look into them.

> Have the compiler prevent the driver author from incorrectly extending
> the lifetime of a driver-object beyond the driver's inherent scope, ie
> that Self object above.
> 

Compilers can help in the cases where they know which objects are belong
to a driver/module.

So I think in Rust you can have the "design pattern", the difference is
instead of putting cancel/free functions carefully in some remove()
function, you will need to (still!) carefully arrange the fields in your
driver/module data structure, and you can have more fine grained control
by writting the drop() function for the driver/module data structure.

> Instead we get this:
> 
> > If something is crucial to be bound to the lifetime of a driver being bound to a
> > device (i.e. device resources), you have to expose it as Devres<T>.
> 

I feel I'm still missing some contexts why Devres<T> is related to the
"design pattern", so I will just skip this part for now... Hope we are
on the same page of the "design pattern" in Rust?

Regards,
Boqun

> Which creates a costly way to work around this missing design pattern
> by adding runtime checks to every single access of T in all the
> operational threads. Failable rcu_lock across every batch of register
> access.
> 
[...]
