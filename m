Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874279C6CD9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 11:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E0F10E6C6;
	Wed, 13 Nov 2024 10:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="i0AznSW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C32610E6C5;
 Wed, 13 Nov 2024 10:28:06 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 0ADF06002995;
 Wed, 13 Nov 2024 10:28:04 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id ImfuLPTuPxcW; Wed, 13 Nov 2024 10:28:01 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 67CB2600299D;
 Wed, 13 Nov 2024 10:28:01 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1731493681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ccZyF2YdctOG/jDywK4v0Y0OCscfIVmrLzvgDchdxdM=;
 b=i0AznSW2+eCaAbs0rXf2fNSw0BDaUMiCp4ZfpzPLw34VIusbw4RkQZZ0uNvfEzmt6WZht7
 kEUskLavCse2gMzGyVuhqUMx51AXF096dE4yLqEVfhsArQSx1f91jz1Zp7u24Gn5xBT29F
 GPpJEZ6QsHx84mZ+AE65ACeewSvp9fw=
Received: from localhost (unknown [165.225.92.235])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 444D636015A;
 Wed, 13 Nov 2024 10:27:59 +0000 (WET)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Nov 2024 10:27:53 +0000
Message-Id: <D5KZA4FBPDXD.2NKXWOH7UM2VJ@tecnico.ulisboa.pt>
Cc: <kherbst@redhat.com>, <linux-kernel@vger.kernel.org>, <dakr@redhat.com>,
 <lyude@redhat.com>, <bskeggs@nvidia.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>, "Danilo
 Krummrich" <dakr@kernel.org>
Subject: Re: [REGRESSION] GM20B pmu timeout
From: "Diogo Ivo" <diogo.ivo@tecnico.ulisboa.pt>
To: "Dave Airlie" <airlied@gmail.com>, "Linux regressions mailing list"
 <regressions@lists.linux.dev>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241010133253.30311-1-diogo.ivo@tecnico.ulisboa.pt>
 <041511ee-4556-422a-8604-30b5e0dfd21c@leemhuis.info>
 <D5DDUQJOZ4HW.1XDOASECJR714@tecnico.ulisboa.pt>
 <44c39c87-90e2-4a74-a185-752c14f6d711@leemhuis.info>
 <CAPM=9txeL+WxYuuGYyhGouXYC0=Y=YS=k=-4G74JbfT2mvkn2g@mail.gmail.com>
In-Reply-To: <CAPM=9txeL+WxYuuGYyhGouXYC0=Y=YS=k=-4G74JbfT2mvkn2g@mail.gmail.com>
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

Hi Dave,

On Tue Nov 12, 2024 at 7:59 PM WET, Dave Airlie wrote:
> On Tue, 12 Nov 2024 at 22:34, Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > [CCing Danilo, who committed the culprit]
> >
> > On 04.11.24 13:11, Diogo Ivo wrote:
> > > On Tue Oct 15, 2024 at 7:13 PM WEST, Linux regression tracking (Thors=
ten Leemhuis) wrote:
> > >> On 10.10.24 15:32, Diogo Ivo wrote:
> > >>>
> > >>> Somewhere between 6.11-rc4 and 6.11-rc5 the following error message=
 is displayed
> > >>> when trying to initialize a nvc0_screen on the Tegra X1's GM20B:
> > >>>
> > >>> [ 34.431210] nouveau 57000000.gpu: pmu:hpq: timeout waiting for que=
ue ready
> > >>> [ 34.438145] nouveau 57000000.gpu: gr: init failed, -110
> > >>> nvc0_screen_create:1075 - Error allocating PGRAPH context for M2MF:=
 -110
> > >>> failed to create GPU screen
> > >>
> > >> Thx for the report. Hmmm. No reply so far. :-/
>
> Apologies for the delay and thanks to Thorsten for bringing it up again,
>
> Does the attached patch fix it?

Yes, the GPU is booting again. Thanks for looking into this!

Diogo
