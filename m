Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB774518736
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 16:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E95310E3EF;
	Tue,  3 May 2022 14:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A0DD10E3EF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 14:50:17 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1127)
 id B010220EB0C2; Tue,  3 May 2022 07:50:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B010220EB0C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1651589416;
 bh=0Hrt9d53XFYn9YSRDobyKkPMyz3dSW6P495Q/i0i1Ps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kh3Rj//hhW+2Kh5YVIiJjwhYzkhhH9wtCU83cMWz9hDFOjbMNhnwDYsK/zWyjCpG9
 dpze87O/ppLvHW2o4T+Kvkuwz0GY/rQPnF59tpiEwDf2OxmMdm1JTHtH3sNCRrOYgH
 ucDAp4wSxdiocvG4ZmLgMJ0RwWQANoGmnu26dVk4=
Date: Tue, 3 May 2022 07:50:16 -0700
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH v4] drm/hyperv: Add error message for fb size greater
 than allocated
Message-ID: <20220503145016.GA25079@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1649737739-10113-1-git-send-email-ssengar@linux.microsoft.com>
 <BYAPR21MB127064CAEA28FBBFB34672C3BFED9@BYAPR21MB1270.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR21MB127064CAEA28FBBFB34672C3BFED9@BYAPR21MB1270.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Saurabh Singh Sengar <ssengar@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 05:06:07AM +0000, Dexuan Cui wrote:
> > From: Saurabh Sengar <ssengar@linux.microsoft.com>
> > Sent: Monday, April 11, 2022 9:29 PM
> >  ...
> > Add error message when the size of requested framebuffer is more than
> > the allocated size by vmbus mmio region for framebuffer
> 
> The line lacks a period, but I guess the maintainer may help fix it for you :-)
>  
> > Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> 
> Reviewed-by: Dexuan Cui <decui@microsoft.com>

Can this be queued for next ? please let me know in case any clarification required.
