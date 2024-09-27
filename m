Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08752988839
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 17:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691A410ECD2;
	Fri, 27 Sep 2024 15:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="olk2rzgw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DBF10ECD2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 15:23:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C3AC25C5F32;
 Fri, 27 Sep 2024 15:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81878C4CEC6;
 Fri, 27 Sep 2024 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727450580;
 bh=7xDLUYpghe7ztbYZ7nJ8ARf2+zZfkNO3rZJgf6ACqgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=olk2rzgwfwWTyQ3BUW/pJzqFHmLuW5keUJ1axU6qN3o8hZiate2WYUb27o+801YBs
 cTO2rvoK2CkFyTDF9yGSgBu3QGC/plJVbH0iGqpJQoIlgyGbRXNWGvMUBVpgpU1iLp
 TofKHVOvFEWpJBBXX2DtnA2H2xieSwYs9FQffzxPbSGWGb6w1pilhiK1jTEGVQ/Kk+
 WpF15F44/5D8qmWfr6aPZQykjWzSgld4lIeQ3f/rp+7g83KgasDZhvcNKzcxQSau/0
 mhrZiWjNIlZfFMfTwffidAdFiUrwUWF3MD830V2S6ujk5+V5pfB7HNdOhbuA6tn0Iu
 RweZVlJfvTSWQ==
Date: Fri, 27 Sep 2024 17:22:54 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>, 
 Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: Re: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
Message-ID: <dsby3ndmnqpxnqh5eykhdcodrlabdtry4j37ywaz2xv4ghtyao@m42xdqx2iujj>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
 <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
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

On Sep 26 2024, Aditya Garg wrote:
> It has been more than a month since I've sent this patch set and I haven't got a clear yes or not for the same. I understand maintainers are busy people, but I'd really appreciate if I get some response for this series of patches from the HID and DRM maintainers.

Please look at the time. You sent this a month ago, while v6.11-rc4 was
out the next day.

I was personally taking time off and came back at the end of August
(roughly at rc6).
This is then a problematic time to merge new drivers because they won't
have enough time to be in linux-next before they are sent to Linus.

Also some subsystem are more strict in term of what can go in and when,
and IIRC drm had been strict regarding that because it is heavily making
use of sub-subsystems, and they need time to put back everything
together for sending it to Linus.

Then, when -rc7 is out, I bet no maintainers will take new drivers for
the next 3 weeks:
- the final version will be out the next week, meaning not enough time
  to test in linux-next
- while the merge window is opened, we are not allowed to take any N+1
  material, or this will break everybody testing system.

Merge window is closing this Sunday, but I realized that there was a
regression in HID-BPF which breaks the CI, so at the earliest your new
drivers will be taken at the end of next week.

So yeah, I understand it can be frustrating somehow, but please avoid
all caps in your subject prefix, this really put other people on their
nerves for nothing.

I have a few objections to your series, I'm going to answer individually
in the patches.

Cheers,
Benjamin

> 
> Thanks
> Aditya
> 
> > On 11 Sep 2024, at 5:51 PM, Jiri Kosina <jikos@kernel.org> wrote:
> > 
> > ﻿On Sat, 31 Aug 2024, Aditya Garg wrote:
> > 
> >> Hi Maintainers
> >> 
> >> It has been 2 weeks but I still haven't received a single reply on this
> >> version of the patch series. Consider this email as a friendly reminder.
> > 
> > I think it makes most sense to take this whole set through hid.git, but
> > for that, I'd like to get Acked-by/Reviewed-by for patches 9 and 10 (drm
> > bits).
> > 
> > Dave, Daniel, .. ?
> > 
> > Thanks,
> > 
> > --
> > Jiri Kosina
> > SUSE Labs
> > 
