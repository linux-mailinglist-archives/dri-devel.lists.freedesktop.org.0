Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578D7387555
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 11:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856B26E864;
	Tue, 18 May 2021 09:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304D06E866;
 Tue, 18 May 2021 09:40:30 +0000 (UTC)
IronPort-SDR: NllE0dEqvIjM3P7KNzA8Z7w72nxO15wXUYqh6U3FDmohLmsmYlaju0NI/PJKCAuUi5Z+/B3IXO
 1eKaAm0YSEwg==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="221718810"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="221718810"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 02:40:26 -0700
IronPort-SDR: K6iOpmkmPeNLeglPfgd+qPmb7kTQvkRXF5D7CXEh5yQ8CQ7XS/t5I9S73iegWET8EJ+6ogweQp
 YS6+JXgo+y3g==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="438584204"
Received: from alirazas-mobl.ger.corp.intel.com (HELO [10.213.211.104])
 ([10.213.211.104])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 02:40:24 -0700
Subject: Re: [PATCH 0/7] Per client engine busyness
To: Daniel Stone <daniel@fooishbar.org>
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
 <7f8fc38a-cd25-aa1f-fa2d-5d3334edb3d2@linux.intel.com>
 <CAPj87rOL7SEVXoH1rWH9ypj7idRmVPLXzmEsdVqFdVjsMh5PbA@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <71428a10-4b2f-dbbf-7678-7487f9eda6a5@linux.intel.com>
Date: Tue, 18 May 2021 10:40:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAPj87rOL7SEVXoH1rWH9ypj7idRmVPLXzmEsdVqFdVjsMh5PbA@mail.gmail.com>
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
Cc: "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "aritger@nvidia.com" <aritger@nvidia.com>, "Nieto,
 David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/05/2021 10:16, Daniel Stone wrote:
> Hi,
> 
> On Tue, 18 May 2021 at 10:09, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>> I was just wondering if stat(2) and a chrdev major check would be a
>> solid criteria to more efficiently (compared to parsing the text
>> content) detect drm files while walking procfs.
> 
> Maybe I'm missing something, but is the per-PID walk actually a
> measurable performance issue rather than just a bit unpleasant?

Per pid and per each open fd.

As said in the other thread what bothers me a bit in this scheme is that 
the cost of obtaining GPU usage scales based on non-GPU criteria.

For use case of a top-like tool which shows all processes this is a 
smaller additional cost, but then for a gpu-top like tool it is somewhat 
higher.

Regards,

Tvrtko
