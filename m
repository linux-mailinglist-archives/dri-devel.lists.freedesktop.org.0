Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFEA45E8D7
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 08:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615846EA9C;
	Fri, 26 Nov 2021 07:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44386EA9F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 07:47:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="235865954"
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="235865954"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 23:47:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="607770552"
Received: from krchrist-mobl2.ger.corp.intel.com (HELO [10.249.254.153])
 ([10.249.254.153])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 23:47:39 -0800
Message-ID: <59294a9b-550a-aa63-bbb6-c31e915f94ab@linux.intel.com>
Date: Fri, 26 Nov 2021 08:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: drm/ttm: moving the LRU into the resource
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel@ffwll.ch, ray.huang@amd.com, dri-devel@lists.freedesktop.org
References: <20211124124430.20859-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211124124430.20859-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi, Christian,

On 11/24/21 13:44, Christian König wrote:
> Hi guys,
>
> I've already send out this patch set a couple of times.
>
> This fixes the fundamental problem in TTM that during a move a buffer
> has resources allocated from two different domains at the same time.
>
> Additional to that it's a prerequisite to remove ghost objects and
> allow to allocate multiple resources per BO.
>
> I should have fixed all previous review comments as far as I can see,
> but probably better to take another look.
>
> Regards,
> Christian.

When sending the next revision of this, could you CC intel-gfx (if it 
applies on drm-tip that is), so that we could catch and help fixing any 
dg1 regressions early?

Thanks,

Thomas


