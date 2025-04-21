Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91986A951ED
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 15:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB01B10E39B;
	Mon, 21 Apr 2025 13:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9128110E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 13:49:18 +0000 (UTC)
Date: Mon, 21 Apr 2025 09:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1745243353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxq7QV0ZgaJ4831XpUaW+01t9SMpZWngP0J+YjsExiM=;
 b=ZGDlDS54HCtzkrZerO9wmpwIKOrKpmpaRp+XIJrUPBTyaVFZb5w2vjaoxppkRtpiewNlgZ
 L5Ay83EBra1SuXTIzayL0hLWgnn3MrRd5SFIhE4DNpuDz/+Jme3hpcxMTzvZIYPP0OTYNe
 c7+qIKUGWMeJYofWHAiFZ1lqKg7e/Mhu0XVRpWdwKFgnm7TXnJIOypL+3Tn0zwP1ZuIVwM
 AX7Ag+H+m/PdduluGgT0b+00UwDA1U/UmfoWe6LtZMdbgdDEYYfV0HfwNqb6TA3TDmjIcp
 3Bvr/KGpEcJA9INO2tDH+S5oUv3eGp3/eE3QxUP9NcxxgFc6E7ydKJz0EegzIw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Aditya Garg <gargaditya08@live.com>
Cc: Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
 joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
 Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
Message-ID: <aAZM0svrO2MiNAdg@blossom>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597D506487C3133B0358CE5B8BC2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAY0hRvNCi0y6rlt@blossom>
 <PN3PR01MB95978C5635B676286A9F0EB7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAZDApE-Wm_NlbMx@blossom>
 <PN3PR01MB95977FDD2F4DF6D9E198C516B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB95976BAC455F10F6D75B9C84B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB95976BAC455F10F6D75B9C84B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Migadu-Flow: FLOW_OUT
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

I didn't realize this was so subtle with the backporting. I don't think
I can take this on, sorry.

Le Mon, Apr 21, 2025 at 06:40:23PM +0530, Aditya Garg a écrit :
> 
> 
> On 21-04-2025 06:38 pm, Aditya Garg wrote:
> > 
> > 
> > On 21-04-2025 06:37 pm, Alyssa Rosenzweig wrote:
> >>> On 21-04-2025 05:35 pm, Alyssa Rosenzweig wrote:
> >>>>> Can I have a feedback from some DRM maintainer on this? AFAIK merge window is over for some time now. It's been more than a week and last time when I submitted, it just stayed in the mailing list without any feedback.
> >>>>
> >>>> DRM hides the merge window from committers so that's not super relevant.
> >>>>
> >>>> I am a DRM committer and can pick this up if necessary but it's not
> >>>> clear to me what's going thru with DRM vs elsewhere.
> >>>
> >>> All the three patches are intended to go through DRM. IIRC Petr, the vsprintf maintainers had requested for that to be done.
> >>>
> >>> The relevant patches have been Reviewed-by Petr as well.
> >>
> >> OK, will queue this today.
> > 
> > Thanks!
> > 
> > Also, Petr has requested them to be backported for 6.15
> 
> To be more clear, he does not have objection for backporting to 6.15. Although its your call. 
> 
