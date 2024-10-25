Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A43A9B01B5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 13:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6E210EA87;
	Fri, 25 Oct 2024 11:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="WE4xFSG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF42610EA87;
 Fri, 25 Oct 2024 11:52:40 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 4F6CE6002C23;
 Fri, 25 Oct 2024 12:52:38 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id ujDn4Jn9IZZN; Fri, 25 Oct 2024 12:52:35 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 8D16F600298B;
 Fri, 25 Oct 2024 12:52:35 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1729857155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0w0CRKvFjbgPcKdTa0ghGahWPu5fZXRVHkiS+qSlJ8=;
 b=WE4xFSG0TOaq5bC+Qk1pRTITv4L/vPKznQe74YzTeYc3Q5P4SbDbp2qYa9P9dZOUgwIuJ/
 PP/JHfrllj3Lq2PYLgusi5/mfnbeX5lxxxEVQ9IzZ6PGIoZeFNGPU3fe4aHuLprrGmIMpM
 U4gvormObxE6giQdv6WIVSdrhDj+Hic=
Received: from localhost (unknown
 [IPv6:2001:8a0:6a67:5600:aca0:c311:d240:b169])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id C81A83601AD;
 Fri, 25 Oct 2024 12:52:34 +0100 (WEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Oct 2024 12:52:33 +0100
Message-Id: <D54V6LMBOVIW.2XKY3HBGCDYPR@tecnico.ulisboa.pt>
To: "Linux regressions mailing list" <regressions@lists.linux.dev>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [REGRESSION] GM20B pmu timeout
From: "Diogo Ivo" <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241010133253.30311-1-diogo.ivo@tecnico.ulisboa.pt>
 <041511ee-4556-422a-8604-30b5e0dfd21c@leemhuis.info>
In-Reply-To: <041511ee-4556-422a-8604-30b5e0dfd21c@leemhuis.info>
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

Hi Thorsten,

On Tue Oct 15, 2024 at 7:13 PM WEST, Linux regression tracking (Thorsten Le=
emhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
>
> On 10.10.24 15:32, Diogo Ivo wrote:
> >=20
> > Somewhere between 6.11-rc4 and 6.11-rc5 the following error message is =
displayed
> > when trying to initialize a nvc0_screen on the Tegra X1's GM20B:
> >=20
> > [ 34.431210] nouveau 57000000.gpu: pmu:hpq: timeout waiting for queue r=
eady
> > [ 34.438145] nouveau 57000000.gpu: gr: init failed, -110
> > nvc0_screen_create:1075 - Error allocating PGRAPH context for M2MF: -11=
0
> > failed to create GPU screen
>
> Thx for the report. Hmmm. No reply so far. :-/
>
> Diogo, maybe report this here as well:
> https://gitlab.freedesktop.org/drm/nouveau/-/issues/
>
> Afterwards drop a link to the ticket here. Reporting nouveau issues via
> email should work, but maybe you have more luck there.
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

I opened the ticket as you mentioned but completely forgot to drop the
link here, so here goes:

https://gitlab.freedesktop.org/drm/nouveau/-/issues/391

I cannot seem to get it properly formatted there, hopefully it's still
useful.

Thanks,
Diogo
