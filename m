Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3595FF2F4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 19:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046DE10EB55;
	Fri, 14 Oct 2022 17:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6032910EB55;
 Fri, 14 Oct 2022 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665768367; x=1697304367;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mo5YD1j/QiWGQ/AMwalJmfQLrk4CmKZy3NsoWGa6rfg=;
 b=NqL0RugseogdC2UHuko0PoDoqKdojN4ymLIxoJGAWrA2KMnlQboezr61
 xhvklreDAotrrEMVd3kLdq/BYUbuKTPa8dnJ29nUr33Ja2BmXaj7y7VVz
 7HAc8Lrhma/L5IeWXtK/EMVP4Tbpq3NPd8FX65mJiX5q6lxrjNok9vHpU
 zXzR8ZSGDuRPlGREPnm8cCQ/NDwcbL+HBkRnEM0CtYvPbyMQZ/mcoPeo2
 Xg636FOpfw1TIeOizkH5cWStoNjEppkoGL6HkbMtcjtDDb8Q2pqjoox7+
 w5hJz2lCY6Jv8wIj8U9Rf28hJwrBekLKQUezE5zzXlAxubb4SAqsFszev g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="288723700"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="288723700"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 10:26:06 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="605444057"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="605444057"
Received: from salamu-mobl1.ger.corp.intel.com (HELO [10.252.11.69])
 ([10.252.11.69])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 10:26:04 -0700
Message-ID: <d2f37a2e-3ff1-c689-613d-08306f8fa38f@intel.com>
Date: Fri, 14 Oct 2022 18:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v3 2/2] drm/i915/uapi: expose GTT alignment
Content-Language: en-GB
To: Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org
References: <20221004114915.221708-1-matthew.auld@intel.com>
 <20221004114915.221708-2-matthew.auld@intel.com>
 <166573205234.1044993.5297661838478296333@jljusten-skl.local>
 <466153a3-59ef-e91f-d267-ff9c777eccb9@intel.com>
 <166576630544.1044993.4210107539627625327@jljusten-skl.local>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <166576630544.1044993.4210107539627625327@jljusten-skl.local>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Yang A Shi <yang.a.shi@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, dri-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/10/2022 17:51, Jordan Justen wrote:
> On 2022-10-14 03:58:12, Matthew Auld wrote:
>> On 14/10/2022 08:20, Jordan Justen wrote:
>>> Acked-by: Jordan Justen <jordan.l.justen@intel.com>
>>
>> Thanks. Can I take that as ack for merging the series from Mesa POV? I
>> think Lionel was going to test this, but I think keeps getting swamped
>> with other stuff. We kind of urgently need to land this series.
> 
> Speaking from the uapi perspective, I would would say, yes, it looks
> seems good to merge. I looked over your igt patches, and they seem to
> test the uapi well. The uapi change is pretty simple, and the related
> documentation changes look good.
> 
> No, we haven't gotten the chance to test the uapi implementation with
> Mesa, but I expect we will soon, once it's in drm-tip.

Pushed to drm-tip. Thanks.

> 
> -Jordan
