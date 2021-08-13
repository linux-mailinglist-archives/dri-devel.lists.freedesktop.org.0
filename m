Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05773EB9DA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 18:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD176E880;
	Fri, 13 Aug 2021 16:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690126E880;
 Fri, 13 Aug 2021 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9Jq9OYg9EXI1aRB5/mW+60AZEjUGr9kH6BUneFaePHw=; b=srU2gOhlF1tA35b57YG0YNmQxP
 Bu7cAtaISOcIQ5NX4BIk/TfOlOHPn82r4hLbjJIY3Kk+5STCK2yycxhkCFjMHMTuPyOtY5mPtiWNu
 8PHYiam1b2H2D5UTeByA4eT4hYZqxpnTD0gI4LS3RPWD4zhiBBYdhekex0P6p0SwZZnA1Mk3vivuw
 xZsJSC70p0qDfbsiYBbd79goLwWxx4ahK+itkfJyAiFkIg/M1Yzxt0y5EVeoTaCw6l5+FpwtajKn/
 kqW98BeM4RU3mYmkl5oFkchdxpk8NQpZxkj/oV2ihrSsq0bv5lQRgq7SbOM5b2CPcMbVs6WEqLE2l
 JJZoY3wQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mEZjj-00FqgB-G6; Fri, 13 Aug 2021 16:09:06 +0000
Date: Fri, 13 Aug 2021 17:08:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jim Cromie <jim.cromie@gmail.com>, gregkh@linuxfoundation.org,
 seanpaul@chromium.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Baron <jbaron@akamai.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Huang Rui <ray.huang@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 John Clements <john.clements@amd.com>,
 Ashley Thomas <Ashley.Thomas2@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wyatt Wood <Wyatt.Wood@amd.com>, Johan Hovold <johan@kernel.org>,
 Jessica Yu <jeyu@kernel.org>, Joe Perches <joe@perches.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Nick Desaulniers <ndesaulniers@gooogle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Changbin Du <changbin.du@intel.com>, Marco Elver <elver@google.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Alexander Potapenko <glider@google.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Albert van der Linde <alinde@google.com>,
 Johannes Berg <johannes.berg@intel.com>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Patricia Alfonso <trishalfonso@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5 3/9] dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES and
 callbacks
Message-ID: <YRaZDzROiEhqJgUb@casper.infradead.org>
References: <20210813151734.1236324-1-jim.cromie@gmail.com>
 <20210813151734.1236324-4-jim.cromie@gmail.com>
 <YRaU6fbGjcV7BGC/@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRaU6fbGjcV7BGC/@smile.fi.intel.com>
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

On Fri, Aug 13, 2021 at 06:51:05PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 13, 2021 at 09:17:11AM -0600, Jim Cromie wrote:
> > +int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
> > +{
> > +	unsigned long inbits;
> > +	int rc, i, chgct = 0, totct = 0;
> > +	char query[OUR_QUERY_SIZE];
> > +	struct dyndbg_bitdesc *bitmap = (struct dyndbg_bitdesc *) kp->data;
> 
> So you need space after ')' ?

More importantly, if ->data is of type 'void *', it is bad style to
cast the pointer at all.  I can't tell what type 'data' has; if it
is added to kernel_param as part of this series, I wasn't cc'd on
the patch that did that.

