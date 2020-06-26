Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A000020B2E3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 15:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8D06ECA1;
	Fri, 26 Jun 2020 13:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA446ECA0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 13:51:58 +0000 (UTC)
IronPort-SDR: jgT6IdYDTaFlLc2vO0wrbxP1VdA9oCk13dlaitPaBiIj461n60/vIkH1Ma++9RzuK56Mz5H2+G
 vjFogHTPfrMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="142833264"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; d="scan'208";a="142833264"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 06:51:58 -0700
IronPort-SDR: v2CQQeS2jdPaJRSf7OIvLN0XV/KUmCD7bEsZb/eFhi3zPPzJo0E7T53CKL9KqNKnUJPs3/SBvn
 HaptvU0sI5Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; d="scan'208";a="320008788"
Received: from marisaku-mobl.ger.corp.intel.com (HELO [10.252.49.150])
 ([10.252.49.150])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jun 2020 06:51:57 -0700
Subject: Re: [PATCH] dma-buf: document dma-fence-chain purpose/behavior
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200626122100.55123-1-lionel.g.landwerlin@intel.com>
 <CAKMK7uGPsmbOqm4+jhSA4EWAyHw1evac8-Hxd2y42Dx-BZs5Sw@mail.gmail.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <14413433-3521-cf6d-a55a-1ae516739f2f@intel.com>
Date: Fri, 26 Jun 2020 16:52:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGPsmbOqm4+jhSA4EWAyHw1evac8-Hxd2y42Dx-BZs5Sw@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/06/2020 15:43, Daniel Vetter wrote:
> On Fri, Jun 26, 2020 at 2:21 PM Lionel Landwerlin
> <lionel.g.landwerlin@intel.com> wrote:
>> Trying to explain a bit how this thing works. In my opinion diagrams
>> are a bit easier to understand than words.
> kerneldoc supports in-line DOT graphs, see e.g.
>
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#overview
>
> If that doesn't work, then you can include a full-blown svg too.
>
> And yes for this a quick DOT graph that explains how things connect
> sound like the perfect use of a diagramm.
>
> Cheers, Daniel

Thanks!

Though I'm thinking I need a few to show the signaling behavior.

Not sure how tractable that is with DOT/SVG.

My last attempt was a series of slides...


-Lionel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
