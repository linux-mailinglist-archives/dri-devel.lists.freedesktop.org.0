Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7477C4949A9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E578010E8B3;
	Thu, 20 Jan 2022 08:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1386510E479;
 Thu, 20 Jan 2022 08:38:11 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1F79E1F391;
 Thu, 20 Jan 2022 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1642667889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S1149P6IJdsdpbMcrXZq6Mc6WqPqJoBvK3pMWsa4MN8=;
 b=mgVK2GKX4z682928eNQNmcKH4PlzeX6XpPLxSucJKp6GDejDBl9xGnHm3EQ7m1HB7u4s0x
 HmV98Y94Jgx4BP2N49y70kzTAsfC49uladYoyY9u+lMOkRTYf7K7VjPT83DyGrKubQrpNL
 4X9INnLQQrZk7xUamCgzquBLJDcbk7E=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 1E602A3B81;
 Thu, 20 Jan 2022 08:38:04 +0000 (UTC)
Date: Thu, 20 Jan 2022 09:38:04 +0100
From: Petr Mladek <pmladek@suse.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/3] lib/string_helpers: Add a few string helpers
Message-ID: <YekfbKMjOP9ecc5v@alley>
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <YegPiR7LU8aVisMf@alley> <87tudzbykz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tudzbykz.fsf@intel.com>
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

On Wed 2022-01-19 16:16:12, Jani Nikula wrote:
> On Wed, 19 Jan 2022, Petr Mladek <pmladek@suse.com> wrote:
> > On Tue 2022-01-18 23:24:47, Lucas De Marchi wrote:
> >> d. This doesn't bring onoff() helper as there are some places in the
> >>    kernel with onoff as variable - another name is probably needed for
> >>    this function in order not to shadow the variable, or those variables
> >>    could be renamed.  Or if people wanting  <someprefix>
> >>    try to find a short one
> >
> > I would call it str_on_off().
> >
> > And I would actually suggest to use the same style also for
> > the other helpers.
> >
> > The "str_" prefix would make it clear that it is something with
> > string. There are other <prefix>_on_off() that affect some
> > functionality, e.g. mute_led_on_off(), e1000_vlan_filter_on_off().
> >
> > The dash '_' would significantly help to parse the name. yesno() and
> > onoff() are nicely short and kind of acceptable. But "enabledisable()"
> > is a puzzle.
> >
> > IMHO, str_yes_no(), str_on_off(), str_enable_disable() are a good
> > compromise.
> >
> > The main motivation should be code readability. You write the
> > code once. But many people will read it many times. Open coding
> > is sometimes better than misleading macro names.
> >
> > That said, I do not want to block this patchset. If others like
> > it... ;-)
> 
> I don't mind the names either way. Adding the prefix and dashes is
> helpful in that it's possible to add the functions first and convert
> users at leisure, though with a bunch of churn, while using names that
> collide with existing ones requires the changes to happen in one go.

It is also possible to support both notations at the beginning.
And convert the existing users in the 2nd step.

> What I do mind is grinding this series to a halt once again. I sent a
> handful of versions of this three years ago, with inconclusive
> bikeshedding back and forth, eventually threw my hands up in disgust,
> and walked away.

Yeah, and I am sorry for bikeshedding. Honestly, I do not know what is
better. This is why I do not want to block this series when others
like this.

My main motivation is to point out that:

    enabledisable(enable)

might be, for some people, more eye bleeding than

    enable ? "enable" : "disable"


The problem is not that visible with yesno() and onoff(). But as you said,
onoff() confliscts with variable names. And enabledisable() sucks.
As a result, there is a non-trivial risk of two mass changes:

now:

- contition ? "yes" : "no"
+ yesno(condition)

a few moths later:

- yesno(condition)
+ str_yes_no(condition)


Best Regards,
Petr
