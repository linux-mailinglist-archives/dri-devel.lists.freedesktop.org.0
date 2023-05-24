Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FC670F5B7
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 13:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581A510E663;
	Wed, 24 May 2023 11:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E5210E65A;
 Wed, 24 May 2023 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684929394; x=1716465394;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2M75/3f2zuPoKT8zUlYJqnZto7dEX5INKB2TBMcY3XU=;
 b=fxkK66hv6c2k8x8ZhEXh/w2F6gY7oVMpscR+oOAYK0geObd0MfqdJygR
 uLEFg0lMia+UDsydlQ1SnuCHXm9HIM+GupUBQZnwe7HWqixK9Oc+plkrL
 KkIhmzyp7U0LXN5xZ8RLYUuPYggp75SuJTgSDeDQ7ad6QO7zaeFThB3Qn
 m+Idu8bucDDRJisVNq2CO87EpAKM3rPBWSjivnfDSd9zU9p8IhVzkSZij
 nVtGfLCYyaS1sia1jtY6Y4NB1il7w36Y5m51kb1EC2d2lItqekyhf5TvZ
 nMiBenAS0uwFYjq2JPGpjWE4xfaHSrRzhAlPICLnmjSXo7186rF8MSkxS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="417000050"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="417000050"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 04:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="794163701"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="794163701"
Received: from bmhacket-mobl.ger.corp.intel.com (HELO [10.213.218.245])
 ([10.213.218.245])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 04:56:32 -0700
Message-ID: <37a0e8fc-efbc-973f-f163-235b9482f21c@linux.intel.com>
Date: Wed, 24 May 2023 12:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v10 0/2] drm/i915: Allow user to set cache at
 BO creation
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, fei.yang@intel.com
References: <20230519051103.3404990-1-fei.yang@intel.com>
 <ZGx7Quf+ArHnXOR0@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZGx7Quf+ArHnXOR0@ashyti-mobl2.lan>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/05/2023 09:37, Andi Shyti wrote:
> Hi Fei,
> 
> finally... pushed in drm-intel-gt-next! :)

I had to revert this (uapi commit only) by force pushing, luckily it was 
the top commit.

1)
IGT is not merged yet.

2)
The tools/include/uapi/drm/i915_drm.h part of the patch was not removed.

Please fix both issues before re-sending and re-merging.

Regards,

Tvrtko
