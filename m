Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C03590C2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 02:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F116E428;
	Fri,  9 Apr 2021 00:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E151A6E364;
 Fri,  9 Apr 2021 00:04:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j5so2876550wrn.4;
 Thu, 08 Apr 2021 17:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=chwrUM2TWAanSXapc+0s3HHbpVYNPGMJlPMynyO4MaM=;
 b=szk2C+Y8dkE91pdo9VDP/7HV6fvK7siaj/6cCuWj4tcHjhPN4kfhTtD7jmjp7OvM5T
 9Jb58E0c7MzRYPJr7CMtogre39WPFU72gkBZbWQaTEGrXJgGCPMxDf5lSgsJc5f62vKp
 MYCguHqb+dSN7vuYfpi0Q/mETAobLbif2QQF2J5C/UXqcn//KqU49kclNjong2JS1bsf
 dgiP1vBAFs6apHS9kuRK8dFcB/iPu5+k4hHV/NCIp7eTSvdL5+fSyWkz5ssyqHPmb83O
 bqUfoJFTLDByNGVMhk2wVSnANly7QXrCCvK7ga2yrNaTMkFMaas35JLDnZay0Ei/ML2v
 BLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=chwrUM2TWAanSXapc+0s3HHbpVYNPGMJlPMynyO4MaM=;
 b=Ol0JCJOukFxBG8GCDCIBCRUslq+ws3G3M1z1RCf5+loHNlyYLvQ7X2DVRpGjp7f/Tn
 cEkbbwYC8h4RkFO1HPril8T8h52TkINsO++rWo445Yl3eGwfenBwHAk9c1+drcyNaByS
 eap50q9WnyUFf/2th3CcLxVJvMm9CUftACHCdDS4MaX2TCAC4VButocHhgcFZkWzf6hV
 dYukXL1kf41cKbwU+S6YHooloGCX6yn1bTuK3w1+5D0Z8yK7EnPiIsfdWWyDF0ywFpwB
 SnH4erUjsemMqWR2iG7oxOCVci7nvZMvEPOKeWkbsmtxO+TzmEbnOoH01HU8ATRS/hq1
 J7EA==
X-Gm-Message-State: AOAM530w4ZkRy/03POPjFchXqKgM+MHF4Fe+2LzLcahr1vEIiWA58G98
 wpDvBwoPorIgnmTnbofM/cBI+E4jQM22MbGhF/k=
X-Google-Smtp-Source: ABdhPJw9laeG7GHSofodaeepxEdFM1PXqK34zDwIWPQ4A7F8StT4xJmlDWNiu0iHq3HkyJwqEPg60Q59sfDkzgys1I0=
X-Received: by 2002:adf:f108:: with SMTP id r8mr3451876wro.147.1617926694563; 
 Thu, 08 Apr 2021 17:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210406214726.131534-1-marijn.suijten@somainline.org>
 <20210406214726.131534-2-marijn.suijten@somainline.org>
 <6413863d04df9743e2d7e81beff5c3e8@codeaurora.org>
 <04860f05-f79f-de0b-13d1-aba85065b4da@somainline.org>
 <CAF6AEGuoLgBSZOou1TSb-d2o6tHS-L-E7AQLS5RM4aOogvRG7Q@mail.gmail.com>
 <CAK7fi1aUXy2i8zY0Cb5Svq0s1H9cSAvY4hq+BsiWgdphwm-ebA@mail.gmail.com>
In-Reply-To: <CAK7fi1aUXy2i8zY0Cb5Svq0s1H9cSAvY4hq+BsiWgdphwm-ebA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 8 Apr 2021 17:08:23 -0700
Message-ID: <CAF6AEGuSav210dMHa3+f-7W1Kgyjam7K7HhWFO4aXWbdjvPTLw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/mdp5: Configure PP_SYNC_HEIGHT to
 double the vtotal
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Martin Botka <martin.botka@somainline.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 8, 2021 at 4:16 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
>
> Il gio 8 apr 2021, 21:05 Rob Clark <robdclark@gmail.com> ha scritto:
>>
>> On Wed, Apr 7, 2021 at 12:11 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@somainline.org> wrote:
>> >
>> > Il 07/04/21 20:19, abhinavk@codeaurora.org ha scritto:
>> > > Hi Marijn
>> > >
>> > > On 2021-04-06 14:47, Marijn Suijten wrote:
>> > >> Leaving this at a close-to-maximum register value 0xFFF0 means it takes
>> > >> very long for the MDSS to generate a software vsync interrupt when the
>> > >> hardware TE interrupt doesn't arrive.  Configuring this to double the
>> > >> vtotal (like some downstream kernels) leads to a frame to take at most
>> > >> twice before the vsync signal, until hardware TE comes up.
>> > >>
>> > >> In this case the hardware interrupt responsible for providing this
>> > >> signal - "disp-te" gpio - is not hooked up to the mdp5 vsync/pp logic at
>> > >> all.  This solves severe panel update issues observed on at least the
>> > >> Xperia Loire and Tone series, until said gpio is properly hooked up to
>> > >> an irq.
>> > >
>> > > The reason the CONFIG_HEIGHT was at such a high value is to make sure that
>> > > we always get the TE only from the panel vsync and not false positives
>> > > coming
>> > > from the tear check logic itself.
>> > >
>> > > When you say that disp-te gpio is not hooked up, is it something
>> > > incorrect with
>> > > the schematic OR panel is not generating the TE correctly?
>> > >
>> >
>> > Sometimes, some panels aren't getting correctly configured by the
>> > OEM/ODM in the first place: especially when porting devices from
>> > downstream to upstream, developers often get in a situation in which
>> > their TE line is either misconfigured or the DriverIC is not configured
>> > to raise V-Sync interrupts.
>> > Please remember: some DDICs need a "commands sequence" to enable
>> > generating the TE interrupts, sometimes this is not standard, and
>> > sometimes OEMs/ODMs are not even doing that in their downstream code
>> > (but instead they work around it in creative ways "for reasons", even
>> > though their DDIC supports indeed sending TE events).
>> >
>> > This mostly happens when bringing up devices that have autorefresh
>> > enabled from the bootloader (when the bootloader sets up the splash
>> > screen) by using simple-panel as a (hopefully) temporary solution to get
>> > through the initial stages of porting.
>> >
>> > We are not trying to cover cases related to incorrect schematics or
>> > hardware mistakes here, as the fix for that - as you know - is to just
>> > fix your hardware.
>> > What we're trying to do here is to stop freezes and, in some cases,
>> > lockups, other than false positives making the developer go offroad when
>> > the platform shows that something is wrong during early porting.
>> >
>> > Also, sometimes, some DDICs will not generate TE interrupts when
>> > expected... in these cases we get a PP timeout and a MDP5 recovery: this
>> > is totally avoidable if we rely on the 2*vtotal, as we wouldn't get
>> > through the very time consuming task of recovering the entire MDP.
>> >
>> > Of course, if something is wrong in the MDP and the block really needs
>> > recovery, this "trick" won't save anyone and the recovery will anyway be
>> > triggered, as the PP-done will anyway timeout.
>>
>> So, is this (mostly) a workaround due to TE not wired up?  In which
>> case I think it is ok, but maybe should have a comment about the
>> interaction with TE?
>
>
> Mostly, yes.
>
>>
>> Currently I have this patch in msm-next-staging but I guess we need to
>> decide in the next day or so whether to drop it or smash in a comment?
>>
>> BR,
>> -R
>
>
> Marijn, can you please urgently throw a comment in, reminding that these timers are interacting with TE and send a fast V2?
>

Or just reply on list w/ a comment to smash in, if that is easier

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
