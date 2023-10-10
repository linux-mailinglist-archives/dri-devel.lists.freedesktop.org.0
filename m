Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E97C4143
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 22:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E11A10E3DF;
	Tue, 10 Oct 2023 20:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E1610E3DF;
 Tue, 10 Oct 2023 20:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696969884; x=1728505884;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qBvsRXPAp8rlG1g/uACPWJkTIGo1tkCFpVM9Tinsmn4=;
 b=cmk1TYTYpQuxn+5lkovPzwLJvbkFl43l9Wj4d+odOnc/TpizDamdj8DH
 sNj1Ipkx8NFqVd24Ibf4ZZIlZIxgeF8/MDCo/1GZqiqJO3kbTTiCwhvNR
 0dfU1q9LdC8DGJDbqyITtTEC48wnQKinti8bsjJYm8OVQx6cV5CwL5cES
 h8v1r1JbMzyXIfA9zxsFQLy10/h0Q/9PJGCvh/rkTN6LZwlH3BZDoX17j
 KBf+aPw3oSB0nUQvITLDSjxFbnmYW3eNtSeQRDGuKGmxttUnwxgwwp90t
 xTihDHd+4aK9oGozooftbBS0+E1RMu4Dd0IqX8CJp7wS9vnbDSJy8DfiA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374843876"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="374843876"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 13:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747180147"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="747180147"
Received: from ppalanyk-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.148.82])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 13:31:07 -0700
Date: Tue, 10 Oct 2023 22:31:01 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH RESEND v2 0/2] Add drm_dbg_ratelimited()
Message-ID: <ZSW0hY7MWWAWAfcZ@ashyti-mobl2.lan>
References: <20231010121545.1046793-1-andi.shyti@linux.intel.com>
 <5f879ced-6d70-43e5-83d5-276f561f66f0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f879ced-6d70-43e5-83d5-276f561f66f0@intel.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Tue, Oct 10, 2023 at 11:25:03AM -0700, John Harrison wrote:
> On 10/10/2023 05:15, Andi Shyti wrote:
> > Hi,
> > 
> > I might have picked up the wrong series and missed some reviews
> > and the extra patch from Nirmoy with a real use of the
> > drm_dbg_ratelimited() that John was looking for.
> > 
> > Thanks,
> > Andi
> I just found the original post of this from back in January
> (https://patchwork.freedesktop.org/series/112925/). Is there a reason why it
> was never merged? As noted, it appears to have a whole bunch of r-b's on it.

yes, the patch was widely appreciated by reviewers... but I think
somehow it was forgotten... that's why I am resending it :-)

Andi
