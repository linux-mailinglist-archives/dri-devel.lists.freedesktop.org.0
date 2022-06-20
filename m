Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5879E552BCC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF21610F2BC;
	Tue, 21 Jun 2022 07:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EBE11321B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 10:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719899; x=1687255899;
 h=references:from:to:cc:subject:date:in-reply-to:
 message-id:mime-version;
 bh=3y8nDAKWBUlZ9K1j37HQS8U7bJfHwitl9vAtCp1vOyU=;
 b=S/6EPJwRJ0EalvQGP13disnI/dhRsLZwiSFofSV8QdUCrR39C6h8LWbG
 42YFYNj3QlYHFqvqU6bK/FVH9mYZI1hyDHr0R58uI3ux+H1/j44HtaIui
 h02pTwEe79RcVFBZ7Tp2/1zodROdCORonE9EontwwwcucfZfHR/Xmgt/Y
 fADWP0yzjmQcFbPpdJxPrL55znZYY23JYdjNs7zXOu/9/giSeLwG22Nps
 yE2xFsP3XJ9ax2pb+W0JKgIxADbasjlKd3vmfs/tvAsVsa60bZzL4fCAD
 lSPWVo0lvbqVPVhUvUwcEJ7SYqD80u5rTq07Sg/Rl7BX6JZ6NmX/hPRN/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366182186"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366182186"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:11:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="584836507"
Received: from gna-nuc-dev34.igk.intel.com (HELO localhost) ([10.102.80.34])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:11:27 -0700
References: <85a6nq45uh.fsf@linux.intel.com>
 <20220620094907.4101274-1-maciej.kwapulinski@linux.intel.com>
 <YrBEP4P9JA60LeOB@kroah.com>
User-agent: mu4e 1.6.10; emacs 27.2
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
Date: Mon, 20 Jun 2022 12:08:34 +0200
In-reply-to: <YrBEP4P9JA60LeOB@kroah.com>
Message-ID: <86czf3wsrg.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 21 Jun 2022 07:24:08 +0000
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
Cc: arnd@arndb.de, corbet@lwn.net, guy.zadicario@intel.com,
 dragan.cvetic@xilinx.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy.shevchenko@gmail.com, derek.kiernan@xilinx.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Greg KH <gregkh@linuxfoundation.org> writes:

> On Mon, Jun 20, 2022 at 11:49:07AM +0200, maciej.kwapulinski@linux.intel.com wrote:
>> Please share your thoughts.
>
> No code here to share thoughts about :(

code will be published in comming weeks to dri-devel ML
