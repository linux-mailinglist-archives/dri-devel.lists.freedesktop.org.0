Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E23874C5
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 11:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CDD6EAE1;
	Tue, 18 May 2021 09:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2BE6EAE1;
 Tue, 18 May 2021 09:09:03 +0000 (UTC)
IronPort-SDR: AuvuuDsiaBhUO23Dq7xt0BF33hWxiO+K4pmnX24PZSVuZjd/AXAzSCXoramJA3RWyt09HLHyZl
 PwO7YW94WcOg==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="261894363"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="261894363"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 02:09:02 -0700
IronPort-SDR: yPJN47b28MnhQmYDYnkruaXNg+D3o1fuSGmv/OhvwUhWQRWO4Ku/3NAzTDjmSBTyAX6yt7MWf5
 t85NZBHNN50Q==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="438576762"
Received: from alirazas-mobl.ger.corp.intel.com (HELO [10.213.211.104])
 ([10.213.211.104])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 02:09:00 -0700
Subject: Re: [PATCH 0/7] Per client engine busyness
To: Simon Ser <contact@emersion.fr>, "Nieto, David M" <David.Nieto@amd.com>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
 <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
 <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <mysJHURIfWxBRBabIlnunj7LZNkkRQ-Knu_o6v7GZI4xCwGMZXn0rvjscl-aTT_d-ttlAQgJOG3gP95DBd_dxCPQNfguTSdrltxPrKt2FGs=@emersion.fr>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <7f8fc38a-cd25-aa1f-fa2d-5d3334edb3d2@linux.intel.com>
Date: Tue, 18 May 2021 10:08:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <mysJHURIfWxBRBabIlnunj7LZNkkRQ-Knu_o6v7GZI4xCwGMZXn0rvjscl-aTT_d-ttlAQgJOG3gP95DBd_dxCPQNfguTSdrltxPrKt2FGs=@emersion.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "aritger@nvidia.com" <aritger@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/05/2021 20:03, Simon Ser wrote:
> On Monday, May 17th, 2021 at 8:16 PM, Nieto, David M <David.Nieto@amd.com> wrote:
> 
>> Btw is DRM_MAJOR 226 consider uapi? I don't see it in uapi headers.
> 
> It's not in the headers, but it's de facto uAPI, as seen in libdrm:
> 
>      > git grep 226
>      xf86drm.c
>      99:#define DRM_MAJOR 226 /* Linux */

I suspected it would be yes, thanks.

I was just wondering if stat(2) and a chrdev major check would be a 
solid criteria to more efficiently (compared to parsing the text 
content) detect drm files while walking procfs.

Regards,

Tvrtko
