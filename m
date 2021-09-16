Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B7340D755
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 12:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D806EB53;
	Thu, 16 Sep 2021 10:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1D36EB51;
 Thu, 16 Sep 2021 10:23:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="220648047"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="220648047"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:23:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="700569762"
Received: from mmullen-mobl1.ger.corp.intel.com (HELO [10.213.235.197])
 ([10.213.235.197])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:23:33 -0700
Subject: Re: [PATCH v3 2/6] drm/i915/gem: Implement a function to process all
 gem objects of a region
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20210914193112.497379-1-thomas.hellstrom@linux.intel.com>
 <20210914193112.497379-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <4c53ae34-61da-f795-cccb-4fb1557093e9@intel.com>
Date: Thu, 16 Sep 2021 11:23:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210914193112.497379-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 14/09/2021 20:31, Thomas Hellström wrote:
> An upcoming common pattern is to traverse the region object list and
> perform certain actions on all objects in a region. It's a little tricky
> to get the list locking right, in particular since a gem object may
> change region unless it's pinned or the object lock is held.
> 
> Define a function that does this for us and that takes an argument that
> defines the action to be performed on each object.
> 
> v3:
> - Improve structure documentation a bit (Matthew Auld)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

