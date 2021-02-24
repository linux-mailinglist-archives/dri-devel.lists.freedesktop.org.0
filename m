Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A298132422F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 17:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E356E046;
	Wed, 24 Feb 2021 16:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54FA6E046;
 Wed, 24 Feb 2021 16:35:24 +0000 (UTC)
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MG9To-1l2uzP2Rn2-00Gade; Wed, 24 Feb 2021 17:35:15 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id E30FF1E01E7;
 Wed, 24 Feb 2021 16:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1R3S697HcAb2; Wed, 24 Feb 2021 17:35:14 +0100 (CET)
Received: from pflmari.corp.cetitec.com (8-usr-pf-main.vpn.it.cetitec.com
 [10.8.5.8])
 by mail.cetitecgmbh.com (Postfix) with ESMTPSA id 84DA61E01E6;
 Wed, 24 Feb 2021 17:35:14 +0100 (CET)
Received: by pflmari.corp.cetitec.com (Postfix, from local account)
Date: Wed, 24 Feb 2021 17:35:14 +0100
From: Alex Riesen <alexander.riesen@cetitec.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
Message-ID: <YDaAQts9LIb5h3xd@pflmari>
References: <20210119015415.2511028-2-lyude@redhat.com>
 <YDUN+Re/alMVL0Zn@pflmari>
 <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
 <YDUg/9fjsvTkRUqr@pflmari>
 <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
 <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
 <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
X-Provags-ID: V03:K1:sX/CG2UfR9ZWz0C/Msv3C8F4GLz8hmFRqQFTiqzctodHy2ofn0U
 jqYzCAVowjAtD2Vjh4vy6GWijFhTcMZTytE5M68lhm3s4yNmAeEE46r8VGuVuhok8uecR8f
 L+1Mg1CCqceDNg/EOIewiJ8fRRzrtH58WPwzkl4gOr5GUpu5ZJOGVx2SFKe5gNNY9xKx5Du
 I+lU/To4LH/xPVoybWa7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lRSiZ9jK9ck=:Aze318R3qNIq+LqBez9yGD
 1db8gC4g4k3hlsY5tRmXvj4NpfTBG7IyNcyQ3YsbSdeqQfh6J6k/JpRSV15jDbIk6Gwbs8e52
 5HZW2yTAhChuLkM9NcwDaOlLUSqDtcq0K6KBhC/HvxDWKUuwplCqyYCF8fIWmr3ftsYFNdCO6
 PcKKZGLhcnq2OZ8ZXKDeCWQxApuT38KemaaS/1MNkhJYHQsnPzdJjh1NwBkKoUId8ss/QCBa7
 IWK89kAr05DSLpyBTvCsqrOPq18qCfawaQpysVRKCDMZ/smDJZclqrfABFS+pBGGzI+3a+b8t
 +OjnAz4y7PyITLFQsEgfaVXoUDOA+3BwR9L0M61Ks5oOU/UDZenBvqc2SiMRComynM8PFpDP7
 2MzLsJS1UttnkqJ5J/MXLt1WHusEaBWPD3umw5pFJdLR5lWgFqOzkbVc5xj72/EAhfa7gGqwd
 DkaLHuIroA==
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ilia Mirkin, Wed, Feb 24, 2021 16:10:57 +0100:
> On Wed, Feb 24, 2021 at 4:09 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > Ilia Mirkin, Tue, Feb 23, 2021 19:13:59 +0100:
> > > It might also be worthwhile just testing if the 256x256 cursor works
> > > quite the way one would want. If you're interested, grab libdrm,
> > > there's a test called 'modetest', which has an option to enable a
> > > moving cursor (-c iirc). It's hard-coded to 64x64, so you'll have to
> > > modify it there too (and probably change the pattern from plain gray
> > > to any one of the other ones).
> >
> > I am interested, so I did.
> >
> > If I start the test without X running, the sprite of 256x256 cursor always
> > contained horizontal lines across it, both with commit reverted and vanilla
> > v5.11. Similarly, the 64x64 cursor has no lines across it in both kernels.
> >
> > The test does not seem to work at all if there is an X server running (using
> > modesetting driver): modetest complained about permission denied to set the
> > mode, and just sits there, drawing nothing on the displays.
> > So I could not run the test in the environment of original problem.
> > Am I starting it correctly? Is the change in modetest.c correct?
> 
> Looks right. Although TBH I'd just start it on a single display (I
> forgot you could even do multiple displays). You should be able to
> start it with the X server running if you switch to a vt (and run it
> as root). If you can't, that means the modesetting driver is
> forgetting to do something in the LeaveVT function.

Tried that and yes, modetest works. Even without running it as root.

> The fact that you're getting lines with modetest means there's
> something wrong with 256x256. What if you do 128x128 -- does that work
> OK?

Yes. Unfortunately in both cases.

> Simon, you tested on a GK208, that has a slightly later display
> controller than the GK104 -- can you try to reproduce Alex's results?
> Perhaps there was a problem with the GK10x's and it starts working OK
> with the GK110 disp.
> 
> I don't have any GK10x's in my posession (I have nearly every other
> iteration of the display controller), but hopefully someone on the
> nouveau team will be able to dig one up and reproduce.
> 
> Thanks for testing, Alex!

You're welcome! As I'm stuck with this particular machine for foreseeable
future, you can count on mine GK10x as well.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
