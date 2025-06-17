Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600ACADC6B5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 11:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C662710E58D;
	Tue, 17 Jun 2025 09:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ItTJ/5Fu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7EF10E58D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 09:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750153041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0iZWBl/87jpgBtc7g8vCiBj8fMDtEnqMgq5VqeHe2b4=;
 b=ItTJ/5Fur50l5GlpLwnDNdaF5NgAZNgCWWH5Q8k7KCmBdqoD39DxJdqYxvZnXcyzbJB7HU
 Py7L+dNufvpOmObURzRY7YOEPw23thqZUOWxJQzEXcTr2RZ+610Siuom0AyjsWREvEB+6+
 Z1C9bMbrzP9EqZQaVNl57AIzeksEC8U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-H1MhSAXyOsCqdE6Io2W7RQ-1; Tue, 17 Jun 2025 05:37:20 -0400
X-MC-Unique: H1MhSAXyOsCqdE6Io2W7RQ-1
X-Mimecast-MFC-AGG-ID: H1MhSAXyOsCqdE6Io2W7RQ_1750153040
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a578958000so999464f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 02:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750153039; x=1750757839;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0iZWBl/87jpgBtc7g8vCiBj8fMDtEnqMgq5VqeHe2b4=;
 b=ZGzTxFEFtbZCVAcEXkkMtHpXfq20pliSlpNIrfGTHdUjTqC1jpNVOOX82WzM4IYD92
 XPa5etXIp4fqiDxgGiv/g6QP6TakUg0FuB5CTWF4hsjd1lenHn7y0i3+8rfC+Uza9i4A
 SE3K0BaVAGhzfQ5kWr0+FW9L4EtZ7CEwpX30kPYSVLXPZOCWaYwlTSsP0mnAhaJPo9jY
 DfE1WpSdZRyIDl2HlAFus9S7fPftyJmfOmCDK41pNdhzXp3/X+iz12KGCszin6PRx+G0
 6ObCON4+n5F6XVxIpD/wZiKmitqzi34g/7SUOBX6X68I10crq77fmAy1BJqw7ErNzTYf
 YBmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXktuSiB3+HtxdkrUJJ0hibbORir0OcrVT0uiO/9RGM3kEMlj+rA7scQEerGMmfPJWsvg5+4tnaXiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybmKb9MvvbDDD8lNaIRuVfCnxFbDsOGmh+P1ZC4+lUGLbDdTVQ
 3gUwQzUUerTfaPTQPPcHUXhH1PPmqSE5cwtLvtryLaUkB+liV5v2mQvZQv7EqKDKq/IGb8s7sQX
 Nh0CEgx4wT2RnMVOqKTZEbeLGLx7pHw6M+7eoc1ZsMfqTXGfuqy83LlRwNgKjGezVH4mR5g==
X-Gm-Gg: ASbGnctouy5WHIHW4MqBTj8wIC78sDHdRBCXx8IcalYER58Dh30Vrw/DbjpN/Xo51J4
 wd3/uhnnVtUXhnBHQ4EYFPrO9wi11+4+cGhpI2d57tTc8yAw4BPVfln+DlKs41aARq9pnjS/7Ht
 po3B4fgdp98wrkOVsnS11rQAbeu/TuiK9itOh+ixAjSA+Yi+vaaSSQCgSF2fB1u1Xhd6EpuvCrF
 xY83fKfuZNWRZ2tk0LuPpAszk8BxmmzqPVpPLxuGY5KUMapHENaUjbrVPwdE+r+TEX7qxte44kK
 BjytR09nfpVKe2+XcwrSp70TjQVgkhjYUNS9+XxzrO0urlnWcFlyN+8CIuQ/yL7lOL8bjA71Cba
 WtzsDu51NVm8yUmF7eRXwAhC0zsdynh6JIKyEs+OSuZ5KdJU=
X-Received: by 2002:a05:6000:2089:b0:3a5:2ec5:35b8 with SMTP id
 ffacd0b85a97d-3a572398cecmr9501309f8f.11.1750153039541; 
 Tue, 17 Jun 2025 02:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn0r2S94rVo2KuanbuIlCONOQLmf7OLS7ZUZs7agOAWDn3Sa7W8ftax638hwNbov3D5qaGyQ==
X-Received: by 2002:a05:6000:2089:b0:3a5:2ec5:35b8 with SMTP id
 ffacd0b85a97d-3a572398cecmr9501261f8f.11.1750153038988; 
 Tue, 17 Jun 2025 02:37:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490?
 (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de.
 [2003:d8:2f31:700:3851:c66a:b6b9:3490])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532de8c64esm175838425e9.7.2025.06.17.02.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 02:37:18 -0700 (PDT)
Message-ID: <d9fc2e4f-3a4d-4bf2-9a45-b4d890f2b0d8@redhat.com>
Date: Tue, 17 Jun 2025 11:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] fs/dax: Remove FS_DAX_LIMITED config option
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <bbade6a3154d14d958f5f9cf65fd6424897ec9c2.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bbade6a3154d14d958f5f9cf65fd6424897ec9c2.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8GeONX3XmHxuL6mXswNGSP4IgF-yYQ019GcEufWUsEI_1750153040
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 16.06.25 13:58, Alistair Popple wrote:
> The dcssblk driver was the last user of FS_DAX_LIMITED. That was marked
> broken by 653d7825c149 ("dcssblk: mark DAX broken, remove FS_DAX_LIMITED
> support") to allow removal of PFN_SPECIAL. However the FS_DAX_LIMITED
> config option itself was not removed, so do that now.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

