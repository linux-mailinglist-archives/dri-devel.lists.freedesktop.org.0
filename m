Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3B1E7BA0
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 13:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8B56E8CB;
	Fri, 29 May 2020 11:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E4D6E8CA;
 Fri, 29 May 2020 11:21:44 +0000 (UTC)
IronPort-SDR: bSxtejKmGPD6O5BVfC/q6RzeD0qkgcltrfmoHcltklU/jOnfjt02RnUi5M8jQERZ1XZm/0h6iK
 wkVwXJZOfvow==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 04:21:43 -0700
IronPort-SDR: 6nMBh5doATdZ1s/454y/1JfNJ2bS5APfI2qO3leupaup8ztnFY51J8JqRmnHZQHSJOPzomHxEx
 fH7kHHTiqAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="376677657"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by fmsmga001.fm.intel.com with ESMTP; 29 May 2020 04:21:42 -0700
Received: from platvala by thrakatuluk with local (Exim 4.92)
 (envelope-from <petri.latvala@intel.com>)
 id 1jed53-0001ts-HX; Fri, 29 May 2020 14:21:41 +0300
Date: Fri, 29 May 2020 14:21:41 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Rohan Garg <rohan.garg@collabora.com>
Subject: Re: [igt-dev] [PATCH i-g-t] panfrost: Test labeling functionality
Message-ID: <20200529112141.GD9497@platvala-desk.ger.corp.intel.com>
References: <20200528133835.5087-1-rohan.garg@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528133835.5087-1-rohan.garg@collabora.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: igt-dev@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 28, 2020 at 03:38:35PM +0200, Rohan Garg wrote:
> Introduce tests to cover the new generic labeling ioctl's
> being reviewed here [1].
> 
> Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> 
> [1] https://patchwork.freedesktop.org/series/77267/
> 
> Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> ---
>  include/drm-uapi/drm.h    |  23 ++++++-

Please update drm.h in a separate commit, and state which kernel
commit (and from which repo) it's copied from. Examples can be seen in
the git log for the file.


-- 
Petri Latvala
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
