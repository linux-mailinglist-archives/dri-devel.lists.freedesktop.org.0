Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D4048675F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 17:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEEE10ECBA;
	Thu,  6 Jan 2022 16:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A757310E564;
 Thu,  6 Jan 2022 16:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641485324; x=1673021324;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vb6vrCvSxSIf37EDOesvMOPizCpMiC3E1xqj/HWgB+g=;
 b=LWbdHUOGCaY81pQYR4sS99V9pNbDX/5GtatDIMV3zNqhy0aE7QrC1hVf
 pQW+IfJ9clOr9ygr7L6KBK7QQ1vsMxZ3ZyzXrsZMerUdQmQSkYqa5zcJt
 Kc5aIENiRu7JlYSlHYe2/NG3V4fGyvnN4pZpdcBxjLkUQRU3RePrhgWhs
 0oMwsQ1NCmJ0G6JvUD0Nd1zNEL2vIz/cme3wU0Gu8tlijL9VXCGX5rwmG
 hCnV1O35q2sR7/UDSq7wsh5hB1rjS0Q4Z6pgEYTZ3STMFnsDdjVR30mEn
 6JTEvetgwa+lyhMHyVV1v5n04G+sZpCbZya3piALnhqrVK+dWj21qps0m g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="229493960"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="229493960"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 08:08:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="761197731"
Received: from lsgoh-mobl1.gar.corp.intel.com (HELO [10.249.65.184])
 ([10.249.65.184])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 08:08:40 -0800
Message-ID: <9bdfc054-c8c7-a083-7b66-156369ef79ac@intel.com>
Date: Thu, 6 Jan 2022 16:08:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 3/6] drm/i915: Don't pin the object pages during
 pending vma binds
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220104125132.35179-1-thomas.hellstrom@linux.intel.com>
 <20220104125132.35179-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220104125132.35179-4-thomas.hellstrom@linux.intel.com>
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

On 04/01/2022 12:51, Thomas Hellström wrote:
> A pin-count is already held by vma->pages so taking an additional pin
> during async binds is not necessary.
> 
> When we introduce async unbinding we have other means of keeping the
> object pages alive.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
