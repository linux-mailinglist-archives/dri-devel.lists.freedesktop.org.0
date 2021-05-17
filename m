Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F6F3838D0
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 18:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698F06E9E4;
	Mon, 17 May 2021 16:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A175B6E7EC;
 Mon, 17 May 2021 16:00:41 +0000 (UTC)
IronPort-SDR: Rwu8LEL8geFPFDgbMhD7vSif8sG/YwVfAHeNzuAPrUodmYU/xnGFI3DwHOoXG5wHj37wwHWmTE
 2i3NLlJpakCg==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="187903062"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="187903062"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 09:00:39 -0700
IronPort-SDR: kdjFSQqaxvTsGlFLY+WSp7phdjhF5XzUoRM45Bo3pvvZXzI3BM3XqrNOnnEqHTXcnHME3DamXT
 lEccz0QwxzBQ==
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="438037020"
Received: from lobrie3x-mobl4.ger.corp.intel.com (HELO [10.213.193.103])
 ([10.213.193.103])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 09:00:37 -0700
Subject: Re: [PATCH 0/7] Per client engine busyness
To: "Nieto, David M" <David.Nieto@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
 <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
 <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
 <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
Date: Mon, 17 May 2021 17:00:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/05/2021 15:39, Nieto, David M wrote:
> [AMD Official Use Only]
> 
> 
> Maybe we could try to standardize how the different submission ring 
>   usage gets exposed in the fdinfo? We went the simple way of just 
> adding name and index, but if someone has a suggestion on how else we 
> could format them so there is commonality across vendors we could just 
> amend those.

Could you paste an example of your format?

Standardized fdinfo sounds good to me in principle. But I would also 
like people to look at the procfs proposal from Chris,
  - link to which I have pasted elsewhere in the thread.

Only potential issue with fdinfo I see at the moment is a bit of an 
extra cost in DRM client discovery (compared to my sysfs series and also 
procfs RFC from Chris). It would require reading all processes (well 
threads, then maybe aggregating threads into parent processes), all fd 
symlinks, and doing a stat on them to figure out which ones are DRM devices.

Btw is DRM_MAJOR 226 consider uapi? I don't see it in uapi headers.

> I’d really like to have the process managers tools display GPU usage 
> regardless of what vendor is installed.

Definitely.

Regards,

Tvrtko
