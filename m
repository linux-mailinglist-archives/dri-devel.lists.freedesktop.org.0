Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D15242A9
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 04:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF5E10FF61;
	Thu, 12 May 2022 02:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D5110FF61
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 02:24:47 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 24C2ObEp028012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 22:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1652322280; bh=VS1Wz6MTDeDEe7mFjiXRuQFi0ffsrqAX4JhdhobUr+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=nNm5XGIRxTLkjZ9+UM/FNhm3f18Kz/55+4qIb2adh81DsdLJNfttLakxIdBFcKBz/
 v6RcM3QlUFnreCqfGI9u0aM29E2Hajngw3eNDNzNaBwVfexhXlodmpISiMjDfCneba
 zKOe5AGr/mkJmrvK5CQdgcbL1k5Lz3M7eFbWYe4rUMHh1E6vRf9Q4fEwhUYDFlbK5y
 LWqOCX6pa+RkWVEdidnv1a0BZYzD3du3sS6sdLzZ/0AvpZequqUjv+mz6lB5zYAUT4
 38DKNY31Qk0LCta6rxrZKK02UcwVWoo5XwR/bdEuCvaFs9XHUxOtFf4hqy3pynrbXw
 6uy4GZTTcYUrA==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 67CE015C3F2A; Wed, 11 May 2022 22:24:37 -0400 (EDT)
Date: Wed, 11 May 2022 22:24:37 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] Adding CI results to the kernel tree was Re: [RFC
 v2] drm/msm: Add initial ci/ subdirectory
Message-ID: <Ynxv5WGMd0aJYM5a@mit.edu>
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <YntWQIXSqMCd6TYV@kroah.com>
 <1255a66a-121d-988a-19a7-316f703cb37d@mailbox.org>
 <YnujG0nkF0U6d5kd@kroah.com>
 <CAF6AEGsmD-CNGj4bAE952JQpquaWA+Nxo5TGpFiHqaPK9doP-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGsmD-CNGj4bAE952JQpquaWA+Nxo5TGpFiHqaPK9doP-g@mail.gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 06:33:32AM -0700, Rob Clark wrote:
> 
> And ofc we want the expectations to be in the kernel tree because
> there could be, for example, differences between -fixes and -next
> branches.  (Or even stable kernel branches if/when we get to the point
> of running CI on those.)

There are tradeoffs both ways, whether the patches are kept separate,
opr in the kernel tree.

In the file system world, when we discover a bug, very often a test
case is found to test the fix, and to protect us against regressions.
It has one other benefit; since the tests (xfstests) are kept separate
from the kernel, it's a useful way to identify when some patch didn't
get automatically backported to a LTS or distro kernel.  (For example,
because the patch didn't cherry-pick cleanly and the manual backport
process fell through the cracks.)

It does make things annoying when we have bugs that can not be safely
backported (which results in tests that fail on the LTS kernel without
kernel-version exclude files), and/or when the expectations change
between versions.  (Although to be honest, for us, the more common
annoyance is when some userspace package --- e.g., bash or coreutils
or util-linux --- changes their output, and we have to add filter
functions to accomodate expected output differences.)

						- Ted
