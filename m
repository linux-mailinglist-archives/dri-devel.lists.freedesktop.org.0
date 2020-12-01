Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A8F2C9B10
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 10:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CC06E4CF;
	Tue,  1 Dec 2020 09:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DD76E4CA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 09:07:54 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B8B5B2001F;
 Tue,  1 Dec 2020 10:07:46 +0100 (CET)
Date: Tue, 1 Dec 2020 10:07:45 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 13/28] video: fbdev: riva: Fix kernel-doc and set but
 not used warnings
Message-ID: <20201201090745.GA1980788@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-14-sam@ravnborg.org>
 <53f3e91e-d8da-bce6-878c-7842250a7a7c@suse.de>
 <20201130183549.GA1498572@ravnborg.org>
 <20201201084718.GF4801@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201084718.GF4801@dell>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=t8GryHL0c4qf8DcNx-0A:9 a=CjuIK1q_8ugA:10
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Jani Nikula <jani.nikula@intel.com>,
 Aditya Pakki <pakki001@umn.edu>, Alexander Klimov <grandmaster@al2klimov.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peter Rosin <peda@axentia.se>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee,

> 
> Cop-out!
> 
> Do what I do and make something up (joke)! :'D

If I thought anyone would actually read the comments then maybe yes.
But I assume that apart from this thread no-one will read it.

> 
> > > Well, it fixes the warning ;)
> > 
> > Yeah, I could not dig up anything useful to say here.
> > Was tempted to just drop all the kernel-doc syntax but that
> > was a larger change.
> 
> Did you trace it from it's origin down to it's final use?
Yeah, but not something that seemed useful.
I could have added "translating from pixels->bytes" as they
are described somewhere else. But I could not convince myself
this was right so I just silenced the warning.

The only reason I kept the kernel-doc in the first place is
that I am told some editors use it.

The only effect the kernel-doc in fbdev has right now is burning
effort that could have been spent (better?) somewhere else, and
I would personally prefer to drop the kernel-doc annotations.

But I already discussed this in another thread (not fbdev related)
and I was told it was useful for some, so it is kept.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
