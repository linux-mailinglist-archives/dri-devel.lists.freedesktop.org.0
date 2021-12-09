Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE79646F1E3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1596410E203;
	Thu,  9 Dec 2021 17:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E044010E200;
 Thu,  9 Dec 2021 17:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639070924; x=1670606924;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jXAOejeBpNoneYL0ELO2p9H9kwuhTQsjeBJRbVaa07o=;
 b=IqEz0+vGR6dIW8UImoAGVGSubVFptkxnJ+kqGiSx+Jy+Fi3MpwK8aLFA
 EdbE3VsE79/e9SZKzlRyeQkwbnOEARWfZjGkzpRgshrgRm8GmDYRF6hJP
 JpuaQHpPH2Vn2jJJ7iGCpzJf2C+VZAZH+RMX1mrs+iBCVQhbUtSVlfWnw
 FBlbcqqSVbx30YmR3i8rs58z5Ts/kr86TggXgAh33oaeG/xdJi73EZfmG
 pVlejvjscARiPLEhzd3yGCnomxvo3dY+Cd3JejB7m9XdZPwptt/3R5Ews
 /hpcWCYfFTkj/WC+ET8+OhT0UjWfX1AX8/YHE+K0zaagP8ojuEgzuhQJ9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="225028175"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="225028175"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:28:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="480419786"
Received: from mkeogh1-mobl1.ger.corp.intel.com (HELO [10.252.18.252])
 ([10.252.18.252])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:28:42 -0800
Message-ID: <c90325d8-acdd-0833-5b24-9d0effa873d1@intel.com>
Date: Thu, 9 Dec 2021 17:28:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/i915: Don't leak the capture list items
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211209141304.393479-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211209141304.393479-1-thomas.hellstrom@linux.intel.com>
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

On 09/12/2021 14:13, Thomas Hellström wrote:
> When we recently converted the capture code to use vma snapshots,
> we forgot to free the struct i915_capture_list list items after use.
> 
> Fix that by bringing back a kfree.
> 
> Fixes: ff20afc4cee7 ("drm/i915: Update error capture code to avoid using the current vma state")
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
