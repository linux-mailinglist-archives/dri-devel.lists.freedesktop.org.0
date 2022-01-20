Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD879494C05
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 11:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC89F10E64E;
	Thu, 20 Jan 2022 10:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B26610E49E;
 Thu, 20 Jan 2022 10:45:39 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 971CA1F394;
 Thu, 20 Jan 2022 10:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1642675537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lNXsCxk1kmLzWZ3KuMXgc2QP7yNDhqQLgFtjl4LsFGg=;
 b=s80Eh1CewTbGXaANSfdmhOC8yS7mIDv9FCt/I0hzu7cf9Pu9Si7tpC0AUMlifM6MhpyvNI
 EdQykNw0T5LfW9CMRgRZQ36TExFEeiyITs3AE72J+aELbU1yWnXuKDUzDzoC1F8NJaMUMu
 9y1MB7bqBlsK9YohaVnVWyOxwl7Ul6w=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 65535A3B81;
 Thu, 20 Jan 2022 10:45:30 +0000 (UTC)
Date: Thu, 20 Jan 2022 11:45:36 +0100
From: Petr Mladek <pmladek@suse.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/3] lib/string_helpers: Add a few string helpers
Message-ID: <Yek9UEHpS16/9ajt@alley>
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <YegPiR7LU8aVisMf@alley> <87tudzbykz.fsf@intel.com>
 <YekfbKMjOP9ecc5v@alley> <8735libwjo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735libwjo.fsf@intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Mikita Lipski <mikita.lipski@amd.com>,
 amd-gfx@lists.freedesktop.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Raju Rangoju <rajur@chelsio.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Eryk Brol <eryk.brol@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 2022-01-20 11:12:27, Jani Nikula wrote:
> On Thu, 20 Jan 2022, Petr Mladek <pmladek@suse.com> wrote:
> > The problem is not that visible with yesno() and onoff(). But as you said,
> > onoff() confliscts with variable names. And enabledisable() sucks.
> > As a result, there is a non-trivial risk of two mass changes:
> 
> My point is, in the past three years we could have churned through more
> than two mass renames just fine, if needed, *if* we had just managed to
> merge something for a start!

Huh, this sound alarming.

Cosmetic changes just complicate history. They make "git blame" useless.
They also complicate backports. I know that it is not problem for
mainline. But there are supported stable branches, ...

There should be a good reason for such changes. They should not be
done light-heartedly.

Best Regards,
Petr
