Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF09832D25
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 17:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BFF10E0EA;
	Fri, 19 Jan 2024 16:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFD710E0EA;
 Fri, 19 Jan 2024 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705681794; x=1737217794;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wtc2h97YUh9D/j+ej8BEuaU+qkrQafHSsRcOQOfKBYM=;
 b=dbaXC3Yu3MwQVbsuWr64olNb/ubg0Hr7IFXPyNrGsd/6rvbgNDwSp3KD
 3otyl1zZAFU8n28Esftb3h+Lup7HB5iD6nxhA9SRCZALxwmlulkaz1ao+
 PybSOw7IChn0RDeBs+XPHTD9PMIqZ341WnZEoYspuTOb0VUDMrHiyVS11
 wnSPBPGyW8iHPjFbZmqbqWkQUSr67VpI+yxjWfWxlBfaAi/6AhTaykZld
 qYnaJY+lO8hABHWW0RlIu1q0PUr4iLLnWsyXzfwwtZO3Y1dGkr+97TmTx
 TtSHKd9o77vEMLcg6JVaQkgQDSKOKPJRq7LjXQHwCCCo9/5/fLSO6ONdq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="400438469"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="400438469"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 08:29:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="788390497"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="788390497"
Received: from amcgaura-mobl.ger.corp.intel.com (HELO [10.252.18.221])
 ([10.252.18.221])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 08:29:52 -0800
Message-ID: <c06e6e4c-ac73-490f-a607-27ae2e014c6b@intel.com>
Date: Fri, 19 Jan 2024 16:29:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/doc/rfc: Removing missing reference to xe.rst
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20240116220331.145607-1-rodrigo.vivi@intel.com>
 <ZaqidHi4EGImQgoF@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZaqidHi4EGImQgoF@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2024 16:25, Rodrigo Vivi wrote:
> On Tue, Jan 16, 2024 at 05:03:31PM -0500, Rodrigo Vivi wrote:
>> The file has already been deleted as the tasks were completed.
>> However the index reference was missed behind.
> 
> Gentle ping on this one.
> I should have mentioned here that this fixes a doc build warning:
> 
> Documentation/gpu/rfc/index.rst:35: WARNING: toctree contains reference to nonexisting document 'gpu/rfc/xe'
> 
>>
>> Fixes: d11dc7aa98e5 ("drm/doc/rfc: Remove Xe's pre-merge plan")
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
