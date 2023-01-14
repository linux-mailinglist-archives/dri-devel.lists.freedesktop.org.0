Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5647766AC6E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 17:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70B910E095;
	Sat, 14 Jan 2023 16:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC51610E095;
 Sat, 14 Jan 2023 16:05:50 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 145846000868;
 Sat, 14 Jan 2023 16:05:49 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id H0Y-aJ0Xu617; Sat, 14 Jan 2023 16:05:46 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 9069A6005C43;
 Sat, 14 Jan 2023 16:05:46 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1673712346;
 bh=vzXaWVOe417yn1eurWDHhug9jNmcWoC9tlMda/DYJUU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Ni9fRADPTR8k6eKtihAN715qic5GmHRVGh4biRYhd4Mhiw7jm3t3w1j5Xpv7J5bwV
 VxUf74p9cnvg1X8LgFV0l0IkQTdlKj+eoc0NIUT1FF3NFs7EVogtw8qwiKXEfrfrkx
 HszLI9RRUWO6So931P5AoLfkjciPgOxzqdW9RvQY=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 68FAF360079;
 Sat, 14 Jan 2023 16:05:46 +0000 (WET)
Date: Sat, 14 Jan 2023 16:03:36 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
Message-ID: <20230114160336.2jsh3ztij6cpzcee@wslaptop>
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
 <c32ea02c-d706-ea2f-aa13-660b8db958ef@leemhuis.info>
 <481f19ba-da7e-6900-0bb2-64ba92d59ce6@leemhuis.info>
 <CACO55tv3E7y31MgyhW22GdDkE=XCYJF+boMivc5AEmyQ-svMhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACO55tv3E7y31MgyhW22GdDkE=XCYJF+boMivc5AEmyQ-svMhA@mail.gmail.com>
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 14, 2023 at 04:27:38AM +0100, Karol Herbst wrote:
> I tried to look into it, but my jetson nano, just constantly behaves
> in very strange ways. I tried to compile and install a 6.1 kernel onto
> it, but any kernel just refuses to boot and I have no idea what's up
> with that device. The kernel starts to boot and it just stops in the
> middle. From what I can tell is that most of the tegra devices never
> worked reliably in the first place and there are a couple of random
> and strange bugs around. I've attached my dmesg, so if anybody has any
> clues why the kernel just stops doing anything, it would really help
> me.

Hello,

Thank you for looking into this! I have seen this type of hang in
mainline on this SoC, and it was due to a reset not being deasserted.
Would you mind getting a log with initcall_debug enabled to pinpoint
where the hang occurs? I would be happy to help if I can.

> But maybe it would be for the best to just pull tegra support out of
> nouveau, because in the current situation we really can't spare much
> time dealing with them and we are already busy enough just dealing
> with the desktop GPUs. And the firmware we got from Nvidia is so
> ancient and different from the desktop GPU ones, that without actually
> having all those boards available and properly tested, we can't be
> sure to not break them.
> 
> And afaik there are almost no _actual_ users, just distribution folks
> wanting to claim "support" for those devices, but then ending up using
> Nvidia's out of tree Tegra driver in deployments anyway.

> If there are actual users using them for their daily life, I'd like to
> know, because I'm aware of none.

For what it's worth, I consider myself a user of nouveau. Granted, I'm
using it as a hobby project, but in its current state it is not far from
a usable desktop experience on the Pixel C.

Diogo
