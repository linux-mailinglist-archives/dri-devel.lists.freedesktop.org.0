Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1959A2431
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 15:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0199610E840;
	Thu, 17 Oct 2024 13:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="l/Yv2XSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5865110E83E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 13:46:46 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6e34fa656a2so10078817b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1729172805; x=1729777605; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T0nQN0NCObfK5Vn1zgRw1TpjVIw9ZxydvJ5Q22r05Dw=;
 b=l/Yv2XShFqnGSHJI6q1IFfyZoMf62b/tvrLahry6iiG6pF6HoNVOF7z7BNaptY0MRq
 /46+xehNSYiDQo4CAvTrlXnJ6i68aNja1VBIyfuTEkygYxhV+M4HCK2pznnCRrRgX9nl
 QZRNbDNH99LcRxWOIfmt1osJiAQNhAdBDpT6ycZF6ZJ5ZBlKTIFyvsiigkKO7LwdLEui
 alwn1ThLnl951FohEGImtN96cCIz7do9daiXVwP+bNWEXAZ5uWNTkAjarsfR9KWOyYL5
 5mYz9lxBlm+xAcSteZziCQ4L5V8PJe8zgzdZfqhq5lhT22Qnqf0wD/lQdKD6GrypROyV
 23NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729172805; x=1729777605;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0nQN0NCObfK5Vn1zgRw1TpjVIw9ZxydvJ5Q22r05Dw=;
 b=i0VVx95IbGkvkJyO4MKAOw1baMJBrsj+7YE0Dp6zi6WpzZv/DuOANSQFRF5uR1ZeM8
 RoyazY4kYCkWNm2dQsJ8npCxR81sTkU/FFdCW1Kp9ga1GHcfNO9Pa7prXMbD/dkVAOv9
 rX6i8o7TbXzBhYwh/7z9fIQ5x16mVU48mLB+jOwrUT9CWs7pxbhF9DcleEob1f7vvEJ0
 n1ukIdNDrFXR9eZsDx0qOT1Cv9uLU86vy9WcxZG758nybwa4xguWJRPZmvIomxN0OqDE
 44j2gyFGf0bbMamVRr9MxsBDdrBpH5BtPDHTcx43jTUAaOHQ8hjNL5/wUxubPG2h0n1n
 aH+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJP4lA6qIsjK1CVusHorrufbxBGqunJgUi/I6U15QJXXa/KSPhVyHD52Va0X4gaTo1LbBJPUPkLw0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk0R9caIKceKKVK6zaMzO22SSWyCGgLQdQv4gtMkV1sMK2crax
 AhJXBZlacG3JWeZzLzIZqdV7Tvzo/Q4F8Zre5S+FnFkKVYLUtj6em454fGwYxPE=
X-Google-Smtp-Source: AGHT+IGpgOmzimpqGZo+yKVQ9O8UZLb6Hva6cSsO+ZYcAVIT1sMFZwMiYnH2dMe9t9IABxyKBdXUOw==
X-Received: by 2002:a05:690c:3586:b0:6e3:3521:88ff with SMTP id
 00721157ae682-6e3641411f4mr162528807b3.18.1729172805398; 
 Thu, 17 Oct 2024 06:46:45 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cc229245f1sm28440036d6.57.2024.10.17.06.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 06:46:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1t1Qpw-00404r-FW;
 Thu, 17 Oct 2024 10:46:44 -0300
Date: Thu, 17 Oct 2024 10:46:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Cc: Yonatan Maman <ymaman@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, herbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 dri-devel@lists.freedesktop.org, apopple@nvidia.com,
 bskeggs@nvidia.com, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
Message-ID: <20241017134644.GA948948@ziepe.ca>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
 <Zw9F2uiq6-znYmTk@infradead.org>
 <20241016154428.GD4020792@ziepe.ca>
 <Zw_sn_DdZRUw5oxq@infradead.org>
 <20241016174445.GF4020792@ziepe.ca>
 <ZxD71D66qLI0qHpW@infradead.org> <20241017130539.GA897978@ziepe.ca>
 <ZxENV_EppCYIXfOW@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxENV_EppCYIXfOW@infradead.org>
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

On Thu, Oct 17, 2024 at 06:12:55AM -0700, Christoph Hellwig wrote:
> On Thu, Oct 17, 2024 at 10:05:39AM -0300, Jason Gunthorpe wrote:
> > Broadly I think whatever flow NVMe uses for P2P will apply to ODP as
> > well.
> 
> ODP is a lot simpler than NVMe for P2P actually :(

What is your thinking there? I'm looking at the latest patches and I
would expect dma_iova_init() to accept a phys so it can call
pci_p2pdma_map_type() once for the whole transaction. It is a slow
operation.

Based on the result of pci_p2pdma_map_type() it would have to take one
of three paths: direct, iommu, or acs/switch.

It feels like dma_map_page() should become a new function that takes
in the state and then it can do direct or acs based on the type held
in the state.

ODP would have to refresh the state for each page, but could follow
the same code structure.

Jason
