Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1571F4D5CB4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 08:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA35810E2BC;
	Fri, 11 Mar 2022 07:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0ED10E2BC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 07:51:57 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nSa42-000430-La; Fri, 11 Mar 2022 08:51:54 +0100
Message-ID: <c5d6fd7b-54ff-e407-2da8-ea2a6157fbff@leemhuis.info>
Date: Fri, 11 Mar 2022 08:51:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [git pull] drm fixes for 5.17-rc8/final
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <CAPM=9txhThmkeKMjTVXGL+RYQDxBZv2c4syb_3V7WF=8sZhaHQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAPM=9txhThmkeKMjTVXGL+RYQDxBZv2c4syb_3V7WF=8sZhaHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1646985117;
 9a4f176c; 
X-HE-SMSGID: 1nSa42-000430-La
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.03.22 06:15, Dave Airlie wrote:
> 
> As expected at this stage its pretty quiet, one sun4i mixer fix and
> one i915 display flicker fix.
> 
> Thanks,
> Dave.
> 
> drm-fixes-2022-03-11:
> drm fixes for v5.17-rc8/final
> 
> i915:
> - psr fix screen flicker
> 
> sun4i:
> - mixer format fix.
> The following changes since commit ffb217a13a2eaf6d5bd974fc83036a53ca69f1e2:
> [...]

Out of curiosity: I might be missing something, but why wasn't the
(afaics simple) fix for a build problem caused by 9d6366e743f3 ("drm:
fb_helper: improve CONFIG_FB dependency") (merged for v5.16-rc1) not
among these fixes? I mean this one:
https://lore.kernel.org/lkml/20220203093922.20754-1-tzimmermann@suse.de/

It's sitting in next for a few days already:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=eea89dff4c39a106f98d1cb5e4d626f8c63908b9

I already asked a few days ago why this fix was not on track for merging
in this cycle, but I didn't get an answer:
https://lore.kernel.org/lkml/782a683e-c625-8e68-899b-ce56939afece@leemhuis.info/

Fun fact: It seems the problem and at a rough fix were already kinda
known mid November when 9d6366e743f3 was still in next:
https://lore.kernel.org/all/20211117062704.14671-1-rdunlap@infradead.org/

Then the issue was reported again two times in February:
https://lore.kernel.org/dri-devel/CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com/
https://lore.kernel.org/lkml/YhofdlzadzRmy7tj@debian/

And the fix is relative simple, that's why I wonder why merging is
delayed. What am I missing?

Ciao, Thorsten
