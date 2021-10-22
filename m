Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D55E24372FD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 09:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C936E8E6;
	Fri, 22 Oct 2021 07:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864C76E8E6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 07:43:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DBD3E2197F;
 Fri, 22 Oct 2021 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634888602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYXqzL/6HhifHEzyeb6y/B1mDBHnANb3wM0JqTVeJN4=;
 b=E1TDhKkVmIVQtRKSIats7Bjc0Q75KzXyErPC+SvzP4SkOnDmhpYEnEJIUXMR+uR3pd+KTL
 7N/6y5Ncfn6BH5ECDsGkc/TxCCW1kfcNlP1/TLynAjdEh1drXdjyQR1fswi2xbkIqPiNqT
 sjGwJjJnnMhvLUeugmD+z6LZo8Rs/cI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634888602;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYXqzL/6HhifHEzyeb6y/B1mDBHnANb3wM0JqTVeJN4=;
 b=1/OkM3q/XS7FD68wNB6gOmxpXW/2Rn4Xxr3uAgYhCm8tzgQFYSnECUrYNRRnL/FQmzBeHU
 uwgbaQtnwZgkjBAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 82E3713C7A;
 Fri, 22 Oct 2021 07:43:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +PE1H5prcmF7LgAAMHmgww
 (envelope-from <vbabka@suse.cz>); Fri, 22 Oct 2021 07:43:22 +0000
Message-ID: <1810283b-164a-800b-63ab-c3fab303a84a@suse.cz>
Date: Fri, 22 Oct 2021 09:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [next] [dragonboard 410c] Unable to handle kernel paging request
 at virtual address 00000000007c4240
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jani Nikula <jani.nikula@intel.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org,
 Marco Elver <elver@google.com>, Vijayanand Jitta <vjitta@codeaurora.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Oliver Glitta
 <glittao@gmail.com>, Imran Khan <imran.f.khan@oracle.com>,
 lkft-triage@lists.linaro.org, Stephen Rothwell <sfr@canb.auug.org.au>
References: <CA+G9fYv3jAjBKHM-CjrMzNgrptx-rpYVmGaD39OBiBeuz7osfg@mail.gmail.com>
 <80ab567d-74f3-e14b-3c30-e64bbd64b354@suse.cz> <87fssuojoc.fsf@intel.com>
 <2a692365-cfa1-64f2-34e0-8aa5674dce5e@suse.cz>
 <20211021203856.1151daebedef7b180fdfec22@linux-foundation.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20211021203856.1151daebedef7b180fdfec22@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/22/21 05:38, Andrew Morton wrote:
> On Thu, 21 Oct 2021 19:51:20 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:
> 
>> >> Then we have to figure out how to order a fix between DRM and mmotm...
>> > 
>> > That is the question! The problem exists only in the merge of the
>> > two. On current DRM side stack_depot_init() exists but it's __init and
>> > does not look safe to call multiple times. And obviously my changes
>> > don't exist at all in mmotm.
>> > 
>> > I guess one (admittedly hackish) option is to first add a patch in
>> > drm-next (or drm-misc-next) that makes it safe to call
>> > stack_depot_init() multiple times in non-init context. It would be
>> > dropped in favour of your changes once the trees get merged together.
>> > 
>> > Or is there some way for __drm_stack_depot_init() to detect whether it
>> > should call stack_depot_init() or not, i.e. whether your changes are
>> > there or not?
>> 
>> Let's try the easiest approach first. AFAIK mmotm series is now split to
>> pre-next and post-next part
> 
> It has been this way for many years!

Aha, great. Looks like I misinterpreted few months ago the thread about
adding folio tree to next.

>> and moving my patch
>> lib-stackdepot-allow-optional-init-and-stack_table-allocation-by-kvmalloc.patch
>> with the following fixup to the post-next part should solve this. Would that
>> work, Andrew? Thanks.
> 
> For this reason.  No probs, thanks.

Thanks!

> I merge up the post-linux-next parts late in the merge window.  I do
> need to manually check that the prerequisites are in mainline, because
> sometimes the patches apply OK but don't make sense.
> 

