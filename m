Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CBDA9515D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 15:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2011210E0A8;
	Mon, 21 Apr 2025 13:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA2D10E0A8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 13:07:28 +0000 (UTC)
Date: Mon, 21 Apr 2025 09:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1745240841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wTozYi6D8Lh0GMP5y3aPKcTP9nDmVxr+Gndx4+CY6oo=;
 b=dcEeqfWQIqSbJYQWk2BH9IgHv1DIGiprzUF5xfwHQE9hgZOgGJF0Ej1rfiQg5QvtSJGot7
 WC2mJjHK8hP7GYpP+Ztd3i95JFCaTPslPmYqk+Z9ZBnNGyiMdh25MFG27IbWRFLq6bZkO7
 tuxKKs/V1RRUh7/xaD1ey33Y9MMrsl548eTAWnNeQtzK/cIowmlLAc2tW0yssTGXOn0cJN
 fzL17h3OjKCHGUTnIY4cIoPDeJBgigW42p4np3qtK8Rf+Ldk8JxuH9zl6FkdcmhQxco1cc
 Sfe51i2ERIV8Fi8vDNucDwFo8r8J+VDYfIodlcML22zYFRuiwSZlJJpRTQwpGw==
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
Message-ID: <aAZDApE-Wm_NlbMx@blossom>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597D506487C3133B0358CE5B8BC2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAY0hRvNCi0y6rlt@blossom>
 <PN3PR01MB95978C5635B676286A9F0EB7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB95978C5635B676286A9F0EB7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

> On 21-04-2025 05:35 pm, Alyssa Rosenzweig wrote:
> >> Can I have a feedback from some DRM maintainer on this? AFAIK merge window is over for some time now. It's been more than a week and last time when I submitted, it just stayed in the mailing list without any feedback.
> > 
> > DRM hides the merge window from committers so that's not super relevant.
> > 
> > I am a DRM committer and can pick this up if necessary but it's not
> > clear to me what's going thru with DRM vs elsewhere.
> 
> All the three patches are intended to go through DRM. IIRC Petr, the vsprintf maintainers had requested for that to be done.
> 
> The relevant patches have been Reviewed-by Petr as well.

OK, will queue this today.
