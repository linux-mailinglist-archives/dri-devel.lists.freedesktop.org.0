Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB2D15CF2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 00:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0780789091;
	Mon, 12 Jan 2026 23:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="JGbSfDoI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A81E10E435
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 23:31:58 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8b23b6d9f11so747203485a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 15:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768260717; x=1768865517; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pIO8dQifpp5qZTd7WcwNdFqrDRKIKFleYoHUkXQdAb0=;
 b=JGbSfDoIxvRl0oHzfDwBWFzrVoZdb0TxFHR7Ubfatxl+nnA3WLVlDTZTdqzD3xfLyU
 CMuC89CNWs5scKjX7F/AOeg5WUFG9XZN9yTLS7nmr0PMlmpiT+Wic+W012Sv8LdPf1K9
 DZoHgzdv1nSwGx4zSe8vIQktwhyXBIBHn08kCU3Dcne+HU5gnMm0Z8Q1+D3PA2jiUVCG
 ia4riBTd1+rMfJdXZu//RfdhiEYMazZduV5wtdrIX6dE4IfthISdAKpNo4/Kvez6j6yj
 f78KNJyRZlVpImkw4LnpS3j/GCoFrn1jFKGN35W15a68R6aYm0MbnJS8rZPdcOusBkhl
 8BWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768260717; x=1768865517;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pIO8dQifpp5qZTd7WcwNdFqrDRKIKFleYoHUkXQdAb0=;
 b=cDC1YIbP6r5xPh5+6TPB+hDNbtEN1DQ7VCbLzShCmoKbB3eeZpAIv3fi4x/CD7O7yK
 unvOTB6LHL9v0cSzh2iJ4Wds+PYhuZ3+P9+9yyusTFRnrQ24xz1sTVmfjNNM0/7f7RcH
 0Jtfq620aKMELz02pcVMwMTRZDVUBiXUwMy1+OsaeDBDUyayGZFwRHe3YiCMMS+obeWA
 cBSl4jSRgRTukHuLfroGwXqYuAx4OLllgjTyxMc7xyg8c4pYs1206CP9+c4zZtYtOFSG
 DSqDZDU9J+JVVmr72glUpY/aCtWXEz6Ts4pDZOJI2cLBGwHvFRXS6F3bAwDI5lxbKKxo
 jjVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjEOWPxAnNgZD+ZIm8vJVXGCJd0FQJWkXkZqAwNeiZbB++LI72nCDK1qiaRaSJWKZcNfi1b0k3kFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwE8UbVXdy1ks18qkWASul7M3rxiQlYqRt0BwZnComHxhBud+Zq
 jOnRUjsfhC1YWkzu4s0Zu0pbg3JziJsvl+sYHQU6SbAggHjQ648JAeJcIMOHZ00rcxU=
X-Gm-Gg: AY/fxX7hYntJs4/r23c9AIGaj/yeuhlhahk+CgB2Br7LkjrfSRZ0BUvMYKf/iXp+L/0
 Tac8RZqtnLN69d1wNSBAAdOLUtTUVRMCBDfXOmgd80/PpfK+Y/z0SCZnYjhL3UwOChrMNDTzAwO
 5FUqTetRW8cKE8mBKMlfddBku2gCY7gTUgHL8zGqxKJf/TrZnI/ASGygzSDKCB+c7mJUoUQ5Sgx
 u4ebXSn42uuAXbJ4/HCUlnW3KsPXwE3/I1sUFaRiEsVcBoEU+lJJv/MufgjKlrHQxuaa0Jg1krZ
 DHnZYOVG031VMIkWmUpOrSBN7OfY87i00fjKUobiUXslpMV11MulBwBrCEHl00uAlDGwlRCd9xQ
 jeLl8mrNSfCUcbHcszVWeJbtAteBOesUxSVFtJM3hQIn+fRNiSBrht0vBN9DzJPsDI0G6+q3NLM
 a5c5imdd0B6r80cSFq4sA5FpHEEzZbqg8p883onWb29s7ozGzrx47v5Beuc8jWZlEKy5E=
X-Google-Smtp-Source: AGHT+IHEv3oyWJcb06Rw4VjhDeFEk4R9SXi3D7aPoLG3khcVAljGyaq9fJ2LebD88CvTcTHK3Zmx+A==
X-Received: by 2002:a05:620a:3952:b0:89e:99b3:2eaa with SMTP id
 af79cd13be357-8c389375870mr2741069685a.8.1768260716611; 
 Mon, 12 Jan 2026 15:31:56 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f51bf8csm1591462585a.28.2026.01.12.15.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 15:31:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vfRO6-00000003evB-2tne;
 Mon, 12 Jan 2026 19:31:54 -0400
Date: Mon, 12 Jan 2026 19:31:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Balbir Singh <balbirs@nvidia.com>,
 Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <20260112233154.GM745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <aWVsUu1RBKgn0VFH@lstrano-desk.jf.intel.com>
 <45A4E73B-F6C2-44B7-8C81-13E24ED12127@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45A4E73B-F6C2-44B7-8C81-13E24ED12127@nvidia.com>
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

On Mon, Jan 12, 2026 at 06:15:26PM -0500, Zi Yan wrote:
> > We could move the call to free_zone_device_folio_prepare() [1] into the
> > driver-side implementation of ->folio_free() and drop the order argument
> > here. Zi didn’t particularly like that; he preferred calling
> > free_zone_device_folio_prepare() [2] before invoking ->folio_free(),
> > which is why this patch exists.
> 
> On a second thought, if calling free_zone_device_folio_prepare() in
> ->folio_free() works, feel free to do so.

I don't think there is anything "prepare" about
free_zone_device_folio_prepare() it effectively zeros the struct page
memory - ie undoes some amount of zone_device_page_init() and AFAIK
there are only two reasons to do this:

 1) It helps catch bugs where things are UAF'ing the folio, now they
    read back zeros (it also creates bugs where zero might be OK, so
    you might be better to poison it under a debug flag)

 2) It avoids the allocate side having to zero the page memory - and
    perhaps the allocate side is not doing a good job of this right now
    but I think you should state a position why it makes more sense for
    the free side to do this instead of the allocate side.

    IOW why should it be mandatory to call
    free_zone_device_folio_prepare() prior to zone_device_page_init()
    ?

Certainly if the only reason you are passing the order is because the
core code zero'd the order too early, that doesn't make alot of sense.

I think calling the deinit function paired with
zone_device_page_init() within the driver does make alot of sense and
I see no issue with that. But please name it more sensibly and
describe concretely why it should be split up like this.

Because what I see is you write to all the folios on free and then
write to them all again on allocation - which is 2x the cost that is
probably really needed...

Jason
