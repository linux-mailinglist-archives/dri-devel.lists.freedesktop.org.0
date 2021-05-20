Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7F38B2D9
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F20D6F497;
	Thu, 20 May 2021 15:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF8D6F48F;
 Thu, 20 May 2021 15:17:37 +0000 (UTC)
IronPort-SDR: c2tdDgYhZhgUzWhowrUxzkOxQx+g+9hoyD2PXXwkIs8TebsT9ulEFYdG5skKBn1v6o6ntO4tyS
 Ww8dLwSzGQqw==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="265163854"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="265163854"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:17:28 -0700
IronPort-SDR: qS7YMtn48Zip1dWbO6P3vfQxOIdRn4nvvxkkXIMZQPWXts28mT/7u1WGebaO8Pt6ntrozOROrM
 G5IkM8sBbuRg==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="395730544"
Received: from cbjoerns-mobl1.ger.corp.intel.com ([10.249.254.247])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:17:26 -0700
Message-ID: <78607f9194da1d28e6838b723f4cca68d5bf9f75.camel@linux.intel.com>
Subject: Re: [RFC PATCH 5/5] drm/ttm, drm/amdgpu: Allow the driver some
 control over swapping
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Thu, 20 May 2021 17:17:23 +0200
In-Reply-To: <20210520150947.803891-6-thomas.hellstrom@linux.intel.com>
References: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
 <20210520150947.803891-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
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
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-05-20 at 17:09 +0200, Thomas Hellström wrote:
> 
> +EXPORT_SYMBOL(ttm_tt_unpopulate);

Oh, this one was a leftover. It's not meant to be included anymore.

/Thomas


>  
>  #ifdef CONFIG_DEBUG_FS
>  


