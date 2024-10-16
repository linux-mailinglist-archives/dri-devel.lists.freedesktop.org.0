Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFC79A0ECF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 17:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC1710E73F;
	Wed, 16 Oct 2024 15:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="bPbaNXJ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6073E10E742
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 15:45:57 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4608f054f83so10148251cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1729093556; x=1729698356; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EEZ2LDphVBRKBdoRQ+LSrY20LCMSUc6nsUE9KVF2o3U=;
 b=bPbaNXJ4oKS/mqCV4PS3Z4G1HZ7LNdrU4GRAzuKCp5tGcfDnSSypJsV0TOH4JDuvwn
 yO13cNCRFzNHYOoE4RwBsOXHlb0fY3GqtOZXDWdsPRa5UJqIoFPTtGZef7MtPN4NN0pB
 rR5smSSrjknDy7xZOuU0jF233f/hLkVHnksNEczeySRRJmgR/YbuBIP4LfnA0rilXM8f
 L2OPmRpPevxi/+rtboORxgxvfm7nqui84cEdPzP8aLlFl1GyO5eWGIaS4Xyxo7Bdnoft
 dThzoqThWk4B8JTGNpIcL3h8uYaGnjSCtP11oXt1K5Nhga6XUJiMLCGNNdTIYAMb3M+P
 uHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729093556; x=1729698356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EEZ2LDphVBRKBdoRQ+LSrY20LCMSUc6nsUE9KVF2o3U=;
 b=USKIC8cCq40FmTCLLQmxdclSpVshkYibPkp9UZ0WgsKolKAiMPGhCyifjeX/W12M3O
 RJ2i0+nlrxqBBtdiL7V29XrL++1CXG9JdDM726a5wHIV/PBN9Obdo2C5udp14i2mmro3
 rgyhZXhTI3GTlGx00KZmAo+i2dt1fUb8f02AbG9vqed+yqRgEsltKSJMifKs2R92fjAD
 TkK02pH7pbcKHyFwaq7qaJdFcCQk7yl4+xPI7dZxWpdXcq5M/gjV6PtEMeNhl+QzGiNU
 KEotK6w/MypfXQ8EPIFv1hrvLUWMrX6lVptV19ilzPNltgOioFIlI6sZSOCIF9Gng18l
 Cwsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmbv8NBeEOmC3rBpori0arAsHW+PkiiUOmhzNXXgCwCViw/7Kk8JoiS86qzVjv5GNzMvOinrN2hbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7eq5wmXHVQz2IwXliTYbR7UkwrymhoKtvCU6z7/LvNplaTJ94
 G2Ukd4NaThRWW4LXPuqFLOKPgU+s1h8th1fMRiyw2cMfYtR6TPguw/ipYPrcy2c=
X-Google-Smtp-Source: AGHT+IHBmbfM9O9ARExkpU9bIKavBiSK4W/Jp563MrmrJiE+AksYkKIOl96ws7ZKt4oJVaRWoyN41w==
X-Received: by 2002:a05:622a:1c06:b0:458:4bf1:1f46 with SMTP id
 d75a77b69052e-460584f2a14mr288154691cf.53.1729093556249; 
 Wed, 16 Oct 2024 08:45:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4609784bfe1sm3525541cf.0.2024.10.16.08.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 08:45:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1t16Dj-000Cg0-BG;
 Wed, 16 Oct 2024 12:45:55 -0300
Date: Wed, 16 Oct 2024 12:45:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: Yonatan Maman <ymaman@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, herbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 dri-devel@lists.freedesktop.org, bskeggs@nvidia.com,
 Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
Message-ID: <20241016154555.GE4020792@ziepe.ca>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
 <87frow8wdk.fsf@nvdebian.thelocal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frow8wdk.fsf@nvdebian.thelocal>
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

On Wed, Oct 16, 2024 at 04:10:53PM +1100, Alistair Popple wrote:
> On that note how is the refcounting of the returned p2pdma page expected
> to work? We don't want the driver calling hmm_range_fault() to be able
> to pin the page with eg. get_page(), so the returned p2pdma page should
> have a zero refcount to enforce that.

I think that is just the rule for hmm stuff in general, don't touch
the refcount.

We don't need to enforce, it we don't know what else the driver will
want to use that P2P page for after all. It might stick it in a VMA
for some unrelated reason.

Jason
