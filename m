Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CE73D5AEC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF6A6E862;
	Mon, 26 Jul 2021 14:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F5A6E821;
 Mon, 26 Jul 2021 14:02:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="210350391"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="210350391"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 07:02:06 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="516110255"
Received: from mandhav-mobl3.gar.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.20.227])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 07:02:05 -0700
Date: Mon, 26 Jul 2021 07:01:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 02/30] drm/i915/display: split DISPLAY_VER 9
 and 10 in intel_setup_outputs()
Message-ID: <20210726140153.adlmwxqdaiujfzp6@ldmartin-desk2>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-3-lucas.demarchi@intel.com>
 <YPxQwdEAcNRIX9ep@infradead.org>
 <20210725050215.s2ejpin6xkwzba5h@ldmartin-desk2>
 <YP6MU/zzQTwWKOyD@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YP6MU/zzQTwWKOyD@intel.com>
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
Cc: Christoph Hellwig <hch@infradead.org>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 06:20:03AM -0400, Rodrigo Vivi wrote:
>On Sat, Jul 24, 2021 at 10:02:15PM -0700, Lucas De Marchi wrote:
>> On Sat, Jul 24, 2021 at 06:41:21PM +0100, Christoph Hellwig wrote:
>> > Still tests fine:
>> >
>> > Tested-by: Christoph Hellwig <hch@lst.de>
>>
>> I just pushed this  to drm-intel-next as part of another series and
>> added your Tested-by.
>>
>> Rodrigo, can you pick this up for -fixes? This should go with your other
>> patch to fix the port mask, too.
>
>done.
>
>But while doing this and reviewing this series at the same time
>I got myself wondering if we shouldn't remove the PORT_F support
>entirely...

well, there is still ICL with some skus having it. I'm not sure we
actually have that sku out in the wild, but if we do, we wouldn't be
able to remove it.

Lucas De Marchi

>
>>
>> Thanks for the bug report and test.
>>
>> Lucas De Marchi
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
