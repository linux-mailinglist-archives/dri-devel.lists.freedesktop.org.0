Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B617CD5AB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF7110E3BA;
	Wed, 18 Oct 2023 07:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5216B10E3C2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 07:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697615457; x=1729151457;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2e6ywZDG7rC0YaI4mpzW/6wyogmKCONIADxJWPjr35g=;
 b=Ris7k8cvI8G3zzK1+0qkYLVfaaNPC/9aqvZSECaUCxpqHS8ovvvUsWFF
 3daVKnVVA6JHBmPpZmJzG3CtpYY3zrxQ+j3VUuUC+O52XVGWoO4Lp/iHM
 o6IOzP2yUyBH6t/d0DUHc/TPSKm4WQrGLQb7VBjPw2Ewd2lGxU9FJazwp
 Hdyd2X+tegLj5grfGDBPcyNpRp6B58XAy6JUzelYXzbfL0PiUo1zwXkws
 j0BY2ZHn1Lqh56PQYVYNiAQR3pI8NwG6aaylThPSfLdTJa6tWeQc8SyTD
 e3o21H7vnQ3tfjDnpJdh4VeY4tfCxXmnPdA2CeQgJGRXQhZPeplBiOj0W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="365312993"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="365312993"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 00:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="760124176"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="760124176"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 00:50:54 -0700
Date: Wed, 18 Oct 2023 09:50:53 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: ivpu TODO list items
Message-ID: <20231018075053.GB525429@linux.intel.com>
References: <ZSjwuyCOL9Vb9+yb@runicha.com>
 <ZS68dysac34rA32D@runicha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS68dysac34rA32D@runicha.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Tue, Oct 17, 2023 at 10:25:19PM +0530, Deepak R Varma wrote:
> On Fri, Oct 13, 2023 at 12:54:43PM +0530, Deepak R Varma wrote:
> > Hello,
> > I am shortlisted as a mentee for the LF Mentorship program. I looked at the TODO
> > file for the ivpu driver for my project tasks. Could you please answer the
> > following questions:
> >
> > 1. Is the TODO list up to date? If not, can we have it updated? Let me know if I
> > can help.
It's not. Some of those was already implemented (but yet not submitted).
Some ideas there was dropped. 

I think this file can be whole removed. Feel free to post patch for
that.

> > 2. Is it absolutely necessary for me to have a specialized hardware to test my
> > patches? Is it limited to the 14thGen or above CPU or do I need more than that?
Yes, I don't think someone can work on ivpu without hardware.

> > 3. Is it okay for me to work on the TODO list items. Let me know if you have a
> > preference [Please note I just started a few months ago and still learning].
I recommend you to work on items from:
https://www.kernel.org/doc/html/latest/gpu/todo.html

> Hello,
> May I request the maintainer to review my questions and comment please?

Sorry, I haven't seen this email before.

Regards
Stanislaw
