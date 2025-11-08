Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B3DC42292
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 01:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C358F10E04E;
	Sat,  8 Nov 2025 00:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="I5W3Z3xf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11B410E04E
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 00:47:56 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8b0f54370ecso142107385a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 16:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1762562876; x=1763167676; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pfSbx8L4nPanVGMRr479mHYfADbovNNtvZzV7lTcOv8=;
 b=I5W3Z3xfhePSBlFfMqDRSGP0lR+yYQQglCMCD0mruvRMy5iVu8lEJJ4TqdRYjQbQHO
 OdS5NdhkLLefm8TKhD7362v/5iQ7eOuW8Z0IvejDAUjAjiOp/A1ClJDQ9e8dlr3K+rd4
 9STyRNmNDENqqi8DuQ6MYxGvvpUZwlT6MuzBoxw1OQk8e4elX8QLGDY3nHDZ3BGl+kIw
 tsr3/ZkXHO7IpEMrxE+hDYLQtspoM62KOFeWDsusAM22DC9TCpQb0KVhDtPlqyq60MdI
 BZmk1p2U1gMDANiZZ6q1tt7/T0fdK4k5qeDku5LHndPU5Jog9qQeJWY3b+gvlr5/jnN0
 XPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762562876; x=1763167676;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pfSbx8L4nPanVGMRr479mHYfADbovNNtvZzV7lTcOv8=;
 b=Qz9EC9O58haljmGCt45CA/WL5DuwckyUSYR5uxNHdzmJhChcWzcnw0UIdh0s1npbTK
 2HEzpi1nwzGcgVCg0iiw7mi0qzzbkGXW7JgHrPiJIxLAFiriIrDSDgue66PPn6M5NNK3
 23kQx171K1whQ8TyxWoHeiiqlzrk1pLiLOP3c+K6zCA3O3SCzbsk57lwzG8uC8QOu3ls
 +JPpH8JwaCEZy7lwJqyJuF3uEuL5+CVAh9+zH8r57BNBC9ML/Hulb04JbUACPb1sCnxB
 mOf+sdurpUnZDUVekHjefeLc6/Md/23yolTey2SG7t9aEHMldztW0wjqMrlo6+y0i2ft
 nE3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjmvUMgpcfhM6Udp9ipuifPferLY78CP6XcAUeryoPFs35yoY8l/jnxxVQYfoeD5fNfm24YadcBK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0rbyzVvznQBgzowilDghaMTp/CE0ASP4FoS99xv8xP6PaHZEb
 PPJku944el397oZfeXYkSrcOhcV/X86VIT+HTpmGmstjgDpOCh8HgB1lCA1RSUxeBU4=
X-Gm-Gg: ASbGncutskZfZM6BABx9W8o8wEzY10p1iq9ZhnitK2/yzha9eXbHX+q4LQJPCfLT5vj
 TkaPbLNl/kTtOwlbmVf9V6Qva0V9l65TLKT7ZHAGFxK156ggNCUxfL+L+s9E5z5m5TveqsJDDcX
 EyK0SvNqTDrNTaAhsbvf4Ag28O5UtIFHLaSSRyL2LogF6jkGwRXkBo8VHMR6lPl4ffN6rqrDxsK
 GePmwCW1RzU6Z7B3gUzm+NE2WpE34qB9fMFuBQ6QKEfTCe6mI5ajkmLg5ROboDLB0E5mPd9d/5g
 ibBWewhFhCs2JWk8zj3/VxPYMo4xNclS5RiyXeP1G7NX9N9rVV6cjxZhgM+WMTd6EjVoLemr1Xn
 Wmg1mKEnwkrGlfF2z1wcPzG9uBlgOOnPUWmW+oHMkrrlPN3A4cyeFfwuc9AkZlXXSU6LBDEcQTZ
 xflIq+R3E+b45qOMP8+X+Ae9Uta/+p3kh+SKgyuFvinDaSkNJeu2T6TOkH
X-Google-Smtp-Source: AGHT+IGDHhTWDSUeTerMAq7I/MD+3vriezautMa1TSo1oodrv/Bub4/+qoCC1k7wUOs9qzstWCl4pQ==
X-Received: by 2002:a05:620a:1a85:b0:8ab:5912:45c with SMTP id
 af79cd13be357-8b257f3d84dmr149741985a.47.1762562875697; 
 Fri, 07 Nov 2025 16:47:55 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b2357dbebasm525663585a.31.2025.11.07.16.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 16:47:54 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vHX7S-00000008NOZ-0EnE;
 Fri, 07 Nov 2025 20:47:54 -0400
Date: Fri, 7 Nov 2025 20:47:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Winiarski, Michal" <michal.winiarski@intel.com>,
 Alex Williamson <alex@shazbot.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 "Cabiddu, Giovanni" <giovanni.cabiddu@intel.com>,
 Brett Creeley <brett.creeley@amd.com>
Subject: Re: [PATCH v4 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Message-ID: <20251108004754.GD1859178@ziepe.ca>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
 <20251105151027.540712-29-michal.winiarski@intel.com>
 <BN9PR11MB52766F70E2D8FD19C154CE958CC2A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <7dtl5qum4mfgjosj2mkfqu5u5tu7p2roi2et3env4lhrccmiqi@asemffaeeflr>
 <BN9PR11MB52768763573DF22AB978C8228CC3A@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52768763573DF22AB978C8228CC3A@BN9PR11MB5276.namprd11.prod.outlook.com>
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

On Fri, Nov 07, 2025 at 03:10:33AM +0000, Tian, Kevin wrote:
> > To me, it looks like something generic, that will have impact on any
> > device specific driver variant.
> > What am I missing?
> > 
> > I wonder if drivers that don't implement the deferred reset trick were
> > ever executed with lockdep enabled.
> > 
> 
> @Jason, @Yishai, @Shameer, @Giovanni, @Brett:
> 
> Sounds it's a right thing to pull back the deferred reset trick into
> every driver. anything overlooked?

It does seem like we should probably do something in the core code to
help this and remove the duplication.

I guess it makes sense the read/write lock would become entangled too.

Jason
