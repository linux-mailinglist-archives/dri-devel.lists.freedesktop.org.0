Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3A2358865
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 17:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246056EB3E;
	Thu,  8 Apr 2021 15:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6856EB36;
 Thu,  8 Apr 2021 15:28:38 +0000 (UTC)
IronPort-SDR: FAAqAHgnT/ZSnz9Ze5xuOxkw1fRM6bRcUheN3OX+ubDUR7bUTS3gSVUzcXK4KfPoJHmLZo5S7V
 pBzzZU0O254g==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="213975223"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="213975223"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 08:28:37 -0700
IronPort-SDR: y0yQYBO9Y8idC9OV3H0oyxgxvYcCTTD/WePaijxQ1pIAaMaLc6GzKqhsogxesMSA+vqPiNuBbW
 qiD0TpEzOqhA==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="422294334"
Received: from akervine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.34.131])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 08:28:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: Call for an EDID parsing library
In-Reply-To: <BIyXHmd9St1ss-z2I5n6mdZZFRRBj2zhTq4eMGjlN-mmPpp_7VC2HjUyF22htq84SlVwil4LBddopV6slVnJIKWd6VcFmzVZOxSTzTpt0BY=@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210407114404.13b41822@eldfell>
 <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl> <87mtuajshc.fsf@intel.com>
 <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl> <87r1jkj37y.fsf@intel.com>
 <20210408171311.61f433bd@eldfell> <87o8eoj01m.fsf@intel.com>
 <BIyXHmd9St1ss-z2I5n6mdZZFRRBj2zhTq4eMGjlN-mmPpp_7VC2HjUyF22htq84SlVwil4LBddopV6slVnJIKWd6VcFmzVZOxSTzTpt0BY=@emersion.fr>
Date: Thu, 08 Apr 2021 18:28:29 +0300
Message-ID: <87lf9siyn6.fsf@intel.com>
MIME-Version: 1.0
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
Cc: xorg-devel@lists.x.org, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 08 Apr 2021, Simon Ser <contact@emersion.fr> wrote:
> On Thursday, April 8th, 2021 at 4:58 PM, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> Perhaps that should be the takeaway; try to minimize parsed data
>> where the consumer needs to know whether it originated from DisplayID or
>> EDID?
>
> So an EDID/DisplayID abstraction layer?
>
> It sounds like only an EDID and DisplayID expert could come up with a
> sane API for that. Also some metadata will only be available in one
> format and not the other.

Well, some of the data *already* comes from DisplayID extensions in the
EDID.

My point is, if you parse displayid and edid into different structures
and APIs, what will the code bases using the library end up looking
like? Not pretty? Implementing the same conditionals all over the place?

Anyway. I feel like I'm derailing this a bit, and I really don't want
that to happen. I think DisplayID is a consideration that should not be
forgotten, but it's probably not the first priority here.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
