Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464CBC37003
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 18:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4088910E07E;
	Wed,  5 Nov 2025 17:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="GKUp+J/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B4A10E789
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 17:15:51 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-8802b66c811so1435516d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 09:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1762362950; x=1762967750; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=waenEKCMjn97yqJgR3j8p8YSw3a8sLLocbZT7haat5A=;
 b=GKUp+J/5nYPILeILwImQdmVYS0MoDW6nfgm1boET/lLJDIRTM6ISdERYjo4j7LX5Yj
 F7DAvpFIpuTqZPVMG/tIie+XpZ0t2wExhA3PGlw4hjlTj5xFDtMMryanP/qL0yvVK8RP
 he5+P2oEayhDpXosSvPlLzsRq1+V9LLqmEdm02XF/F9ABg1bpilf6V3MCyJpslmDbSBt
 5NlYhwGTaDn8XmsXZeOsr2TrwD3scIwKMWLt1vudkzqh92mdK9gcNxj/tCTXnusnvUa/
 yOKlexKahmAKRjhEm+cAyW/wpp2s+yUXBITNwCbxFnnLTxsZ4MEN8jMusfA/iIZ0zxLX
 neqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762362950; x=1762967750;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=waenEKCMjn97yqJgR3j8p8YSw3a8sLLocbZT7haat5A=;
 b=YvsuC76FKyIF+ODmfgI40/ZozR1MGPLW+SsrmsmVw8U2e9jPStnIMRNb43qLpiO4Vi
 6Yh9s+/af/ssCZzggZEoEjs75xcjjIXsJ80re9qDrHVxGNaSPnC/tNi8SXcgAFMJOmhn
 +metVjYTWlf5L0j9PrvX1uK5Go/pwzn4x5vLALSUkEh6sEFDgfQRa0wOmfTSGDFtIp7t
 UxO8r+4xDaqKn8yJBWod95wU9h+0XnXKhC2magQnmNDI55Jm6pUsccEokSIA4zY69L39
 zcJhIr7Rb/+dcwOm10z3UoG8rCjC5o/RTW3Y0gDAIe53wKvETgtWkz1MhuXXzXIB5V/K
 T5WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9k5qa1lbQ/h8GTuY3jM9/K93kFD1Dg7n/QgA1CBD6ZebfDfBpMmcaiN5Vw7rrM1LRbd33OgXkpAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy8MxEmUVn4iZ2L6+lWYHa1EtOq1ZuDb1BKcXDUnjwAU8C3Wbv
 7ltkiZLGWXiELvLLX1PgI5DP2M+Q6SY04q+FDafIs/9rFmSIuWx7XrF0bQkLu7O33KY=
X-Gm-Gg: ASbGncu4aTnRUoUdfk2rsagBnRF7HHIb5Iw0g1xf7dFnk8r2mqU6OtYUdm6lw9OCLRw
 9Hwt7z4JoACkXisMb14mylBqGiiJ+4TNDOG8sqEhqxgoyRQ3pnSJbqLt4soZ7XD0i69w7z8LRIH
 th5f31KNIhi2PsCTuz5I7Y0piOTowHLUZmp8y/Njw6OgD2bWfIYDtreOrX3HN7EyIx2Ix9cMNww
 8m8kIpg3GrCwsi6ENAcd9ybGS+cyGAwK798kK59OgbPNSNBqm4amfHX7b9llU/OGmqlDDnJRcwa
 c4pVW7RrcTwrNbOGxyL4hJCjsjXaMOtT2uGCi1oNaH5lDXQ6oZU3ptjNua+bxGoWVCwPfsIUT/G
 LUVXHMoQO3PZXDBnK8MVqJNeTHzJgp40Vq8dWVk6Xj3ZrAQbuJ8lNgsGQr39bUJvwc28Ayg5196
 /sEBiYOpTY6WYfheGLHhaXzuNX/6w3Iq373K85M3HnYFRMdg==
X-Google-Smtp-Source: AGHT+IHujecuHKAp19SOjD1ziznvYD8tAwFGOLS3T8YEf0KUSZ8DObLM9JfUqnSghUiTTZ/sscfDOQ==
X-Received: by 2002:a05:6214:2262:b0:880:4690:3bb8 with SMTP id
 6a1803df08f44-880710ba284mr52063816d6.18.1762362949784; 
 Wed, 05 Nov 2025 09:15:49 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88082a3ac4fsm551996d6.57.2025.11.05.09.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 09:15:49 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vGh6p-00000007BtB-1oaJ;
 Wed, 05 Nov 2025 13:15:47 -0400
Date: Wed, 5 Nov 2025 13:15:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Williamson <alex@shazbot.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 27/28] drm/intel/pciids: Add match with VFIO override
Message-ID: <20251105171547.GP1204670@ziepe.ca>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-28-michal.winiarski@intel.com>
 <cj3ohepcobrqmam5upr5nc6jbvb6wuhkv4akw2lm5g3rms7foo@4snkr5sui32w>
 <xewec63623hktutmcnmrvuuq4wsmd5nvih5ptm7ovdlcjcgii2@lruzhh5raltm>
 <3y2rsj2r27htdisspmulaoufy74w3rs7eramz4fezwcs6j5xuh@jzjrjasasryz>
 <20251104192714.GK1204670@ziepe.ca>
 <r5c2d7zcz2xemyo4mlwpzwhiix7vysznp335dqzhx3zumafrs4@62tmcvj4ccao>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <r5c2d7zcz2xemyo4mlwpzwhiix7vysznp335dqzhx3zumafrs4@62tmcvj4ccao>
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

On Wed, Nov 05, 2025 at 04:20:33PM +0100, Michał Winiarski wrote:
> On Tue, Nov 04, 2025 at 03:27:14PM -0400, Jason Gunthorpe wrote:
> > On Tue, Nov 04, 2025 at 11:41:53AM -0600, Lucas De Marchi wrote:
> > 
> > > > > > +#define INTEL_VGA_VFIO_DEVICE(_id, _info) { \
> > > > > > +	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
> > > > > > +	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
> > > > > > +	.driver_data = (kernel_ulong_t)(_info), \
> > > > > > +	.override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE, \
> > > > > 
> > > > > why do we need this and can't use PCI_DRIVER_OVERRIDE_DEVICE_VFIO()
> > > > > directly? Note that there are GPUs that wouldn't match the display class
> > > > > above.
> > > > > 
> > > > > 	edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
> > > > > 	5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
> > > > > 
> > > > > Lucas De Marchi
> > > > > 
> > > > 
> > > > I'll define it on xe-vfio-pci side and use
> > > 
> > > but no matter where it's defined, why do you need it to match on the
> > > class? The vid/devid should be sufficient.
> > 
> > +1
> > 
> > Jason
> 
> I don't need to match on class.
> 
> With PCI_DRIVER_OVERRIDE_DEVICE_VFIO it just becomes:
> #define INTEL_PCI_VFIO_DEVICE(_id) { \
> 	PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_INTEL, (_id)) \
> }
> 
> static const struct pci_device_id xe_vfio_pci_table[] = {
> 	INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
> 	INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
> 	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
> 	{}
> };
> 
> So, no matching on class, but I still do need a helper macro.

Yes, that looks right to me.

Jason
