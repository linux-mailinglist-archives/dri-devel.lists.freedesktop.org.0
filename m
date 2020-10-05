Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4D284729
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480FC6E3A0;
	Tue,  6 Oct 2020 07:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5E06E02E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601909265; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSKWE44g/SFazzSz35F0HDw93v+pr64cnMikoaeFFcw=;
 b=kcYY6ernsiuea4kjCPIb/SzTBLp4R7aQBWhtmYvuUr+4BnBk5FAZf6m8cf/G6erBDucJwa
 mLbOZEZwgMebewJlqnu0sgRBppHQDacviqSDDyEycuUi90uKmh3fhWnINY8W9CYA1Q5xzU
 VAZ4wRdRPjViGUkSx54KYdASuZ/O/QY=
Date: Mon, 05 Oct 2020 16:47:35 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM
 =?UTF-8?Q?buffers=0D=0A?= cached"
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <B3HQHQ.7DOFKW9A9TEX1@crapouillou.net>
In-Reply-To: <20201005140534.GT438822@phenom.ffwll.local>
References: <20200930165212.GA8833@lst.de>
 <20201004141758.1013317-1-paul@crapouillou.net>
 <20201004195921.GA556605@ravnborg.org>
 <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
 <20201005230150.5637fa42@canb.auug.org.au>
 <20201005140534.GT438822@phenom.ffwll.local>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, od@zcrc.me,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le lun. 5 oct. 2020 =E0 16:05, Daniel Vetter <daniel@ffwll.ch> a =E9crit :
> On Mon, Oct 05, 2020 at 11:01:50PM +1100, Stephen Rothwell wrote:
>>  Hi Paul,
>> =

>>  On Sun, 04 Oct 2020 22:11:23 +0200 Paul Cercueil =

>> <paul@crapouillou.net> wrote:
>>  >
>>  > Pushed to drm-misc-next with the changelog fix, thanks.
>>  >
>>  > Stephen:
>>  > Now it should build fine again. Could you remove the BROKEN flag?
>> =

>>  Thanks for letting me know, but the fix has not appeared in any drm
>>  tree included in linux-next yet ...
>> =

>>  If it doesn't show up by the time I will merge the drm tree =

>> tomorrow, I
>>  will apply this revert patch myself (instead of the patch marking =

>> the
>>  driver BROKEN).
> =

> Yeah it should have been pushed to drm-misc-next-fixes per
> =

> https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.htm=
l#where-do-i-apply-my-patch
> =

> Paul, can you pls git cherry-pick -x this over to drm-misc-next-fixes?

I had a few commits on top of it in drm-misc-next, so the revert =

doesn't apply cleanly in drm-misc-next-fixes... I can revert it there, =

but then we'd have a different revert commit in drm-misc-next and =

drm-misc-next-next.

Sorry for the mess. What should I do?

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
