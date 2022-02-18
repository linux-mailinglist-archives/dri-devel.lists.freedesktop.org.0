Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747914BC060
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 20:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FD510E8A5;
	Fri, 18 Feb 2022 19:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B6410E862;
 Fri, 18 Feb 2022 19:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645213404; x=1676749404;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=baOXokhByXXziWZwCqa3Bh4RX/PKcroubuFVmmtj6zE=;
 b=R5t3x8mOujLEBO+O3vcxjqiuEVc+27yvwDqeoXQv93dBPwhKwwFtarJ1
 Eu5K9qcy0y2a8srcjJQgE5y+BLwtSDlUZKoH32sLoi5KYrHJR4KUmf5Hg
 j0STk5xfZnn795X9rUkwNQC4x/EEpGxfiCTu1NeFsnLhoe6dYAq7cvQBT
 EfuMLDPQac7vjVgIP/OCH1fAklFyVS7BN5blXK+sqyc5J2xH3eyvk3RV2
 kL9nxiFGpYmp1K0OkB1mOB9TUyRxwjmkyid3hOuXwnumnXcCKEHLzDKOg
 8ylU0CGJLqh7NdVJ7YMc/zAteUTXkyRoPa5vuhguaIOLWgL0KmHOjC7lP A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238606610"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="238606610"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 11:43:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="504111596"
Received: from sporter-mobl.ger.corp.intel.com (HELO localhost)
 ([10.209.62.47])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 11:42:24 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>, Robert Beckett
 <bob.beckett@collabora.com>
Subject: Re: [PATCH v8 5/5] drm/i915/uapi: document behaviour for DG2 64K
 support
In-Reply-To: <20220218185540.GA7762@intel.com>
References: <20220208203419.1094362-1-bob.beckett@collabora.com>
 <20220208203419.1094362-6-bob.beckett@collabora.com>
 <87ee40ojpc.fsf@jljusten-skl> <20220218134735.GB3646@intel.com>
 <78df4b73-9b2d-670b-a6b0-a45b476f1f0a@collabora.com>
 <20220218185540.GA7762@intel.com>
Date: Fri, 18 Feb 2022 11:42:23 -0800
Message-ID: <875ypcneqo.fsf@jljusten-skl>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Tony Ye <tony.ye@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 mesa-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ramalingam C <ramalingam.c@intel.com> writes:

> On 2022-02-18 at 18:06:00 +0000, Robert Beckett wrote:
>> 
>> If desired, we can make the wording clearer, maybe something like:
>> 
>> "To keep things simple for userland, we mandate that any GTT mappings
>> must be aligned to 2MB. The kernel will internally pad them out to the next
>> 2MB boundary"
>
> Added the extra information in next version @
> https://patchwork.freedesktop.org/patch/475166/?series=100419&rev=1
>
> Jordan, hope this explanation clears your doubt.

Ok. It sounds like what we are doing in Mesa matches what is required by
hardware and the kernel. Thanks.

-Jordan
