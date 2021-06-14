Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C53B3A6C2C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 18:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EC86E042;
	Mon, 14 Jun 2021 16:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891F76E03B;
 Mon, 14 Jun 2021 16:40:36 +0000 (UTC)
IronPort-SDR: mbD7UPf4Cb+nobl6ioIElPSrjOpy7XiVYRoRk6LhLcp4+gyed8M05lmB7eNmg3CJxIWaqfs9Hp
 ecmBayM2IkKA==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="291474263"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="291474263"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 09:40:35 -0700
IronPort-SDR: TzmqY3BgK56uDuGeKLykMEwRWMEtxBEo70KE4mPC2C71l1xrbikTy3iRPfVttv1XXtQ7Jr5QGG
 HFwDMxNhEIpQ==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="553416908"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO [10.249.254.50])
 ([10.249.254.50])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 09:40:34 -0700
Subject: Re: [PATCH v3 11/12] drm/i915/gem: Zap the client blt code
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210614162612.294869-1-thomas.hellstrom@linux.intel.com>
 <20210614162612.294869-12-thomas.hellstrom@linux.intel.com>
 <d5600d3f-0a7f-26bc-7785-0768b06abbef@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <c86f189b-738e-2e1d-4fde-94bb7c868345@linux.intel.com>
Date: Mon, 14 Jun 2021 18:40:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d5600d3f-0a7f-26bc-7785-0768b06abbef@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 6/14/21 6:33 PM, Matthew Auld wrote:
> On 14/06/2021 17:26, Thomas Hellström wrote:
>> It's not used anywhere.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> We do have to keep igt_client_tiled_blits subtest, it's not related to 
> the client blitting code and was added afterwards. Not completely sure 
> why it's in this file.
>
> With that added back,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

OK, I'll add it back.

/Thomas

