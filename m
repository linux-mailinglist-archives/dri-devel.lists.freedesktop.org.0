Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BDA4A3FF1
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 11:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB7F10E71D;
	Mon, 31 Jan 2022 10:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77E010E71D;
 Mon, 31 Jan 2022 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643624303; x=1675160303;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MAvDqjxpvbR8YteLGZ86U8KlXI/uVGn+nO0DjLBqdas=;
 b=JSrAI+j+mYwweko8hKv/F/tIUWwo9C1DwFExpPrcPLdWiGk/TO2A2vsQ
 weD0tCkyRumIKcYAxmWeMr29j6wR16Eiotl6zdDqP8UC9T+mUDUfYcOh5
 FVk0x5p1iIIUIhsCthd0zwibuITpiN2Sy3NK9Uvo5LsO3BJwhXhj5GqcF
 ZVRQ4N+yIb0QrTzinJXYT3dWU7G8zEh4Uep5DlD1Uh6StuHT5n9p0hDWF
 Z/v6w3fEHBmoKvjy0FUmeFj7f8NkwHVmCTifeFc48IQNfT8LXoxUR+hdv
 C1A1MKYg3auLXizS++rOOJKdxUNcd0eS3gnQY35Ietl7pq7h6MaH7trWH A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="247387857"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="247387857"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 02:18:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="697953568"
Received: from bvandelf-mobl1.ger.corp.intel.com (HELO [10.252.5.180])
 ([10.252.5.180])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 02:18:21 -0800
Message-ID: <32da9b50-536e-b999-6eb5-9d658979056b@intel.com>
Date: Mon, 31 Jan 2022 10:18:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] drm/i915: align the plane_vma to min_page_size of
 stolen mem
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220128185209.18077-1-ramalingam.c@intel.com>
 <20220128185209.18077-3-ramalingam.c@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220128185209.18077-3-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Chris P Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/01/2022 18:52, Ramalingam C wrote:
> Align the plane vma size to the stolem memory regions' min_page_size.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Matthew Auld <matthew.auld@intel.com>
> cc: Chris P Wilson <chris.p.wilson@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
