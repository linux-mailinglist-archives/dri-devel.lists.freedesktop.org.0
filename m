Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D9E6F3630
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 20:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FDE10E241;
	Mon,  1 May 2023 18:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8A810E20C;
 Mon,  1 May 2023 18:48:08 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6a5f9c1200eso1084797a34.1; 
 Mon, 01 May 2023 11:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682966887; x=1685558887;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C5TiKpdAanfe72qJPMfhQiBumiXfFbxq5ufhiPMCXmM=;
 b=Tpt7grdpC48UPehD4adOVN14BtzAM9UVejuJiPKH/hbSy3T4AbDYXo2929ln2JFrQT
 5sVhb67G8bM3vqUZZd8XMXfegB488whixnh4/4Ex3LMZef+2Dt6WZHWxl5kuOXLmLyyq
 +H2JDPn4x65XOmlQe8EH8/DfVxXBQyMA1XCX6cNMqCqZaCbogH0s31i4rDfdXQ3qE9nM
 3KgGNj3PN7gwI6tnazzMoI8p8ckjxvWI4U2J50o+kAOyK8rIv94uLSf/OUc1duKkaWjP
 fsfN2vyPgwim5t6NDQh0/L1eaQ1NE61GGD/VOVApy5w3i33Ndhe8phBZvdtEXLiAogQD
 3shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682966887; x=1685558887;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C5TiKpdAanfe72qJPMfhQiBumiXfFbxq5ufhiPMCXmM=;
 b=R85AwAldyfuh4h68nfaIeyVuGBycguM2ZSiBIEEGZYNhZ68EWP89n4rABEKc1T3ns3
 fZ7+Wvge6WmfG9wxXu6/+kqRSU6EB88iqvwQwwqf2dNlYUYTHP8yM6Wfrizn/dZU9zYe
 rYg0fIex2YiqSm5Kr9aMMpKx3HHBmqARTPDudoExO899SnUfGYDJM/+HhC7PwF/l5a/a
 drLKndNFT4hiO0QJIq2q/0ME8dc0WKZmOTribMizqo2OlMdHWTTVcdpdjr6OMOsqUjK1
 Tro1kDan5tf50+Zvn6rD7SWZEO1LGWRtv65wCh1qG3+W3DMxwH4Duo9kS6yidLdvyKz+
 su/g==
X-Gm-Message-State: AC+VfDxaYWbaTCmtF8fsK3CoQQnveS/GP2k99gsY7Y2zCthOZt2Dj1HY
 MjCPLmo+UGNrZJo9JCeNF/EGDGka33IZwGSh6bkYAWl2
X-Google-Smtp-Source: ACHHUZ7R6+RO/CQaS1NWrl2sAiTEIe5IvBhrmW42hW7dOltu3PhX62jT76DunSb1MTRDQB70S756Ua0QkYOgElZxzVs=
X-Received: by 2002:a05:6808:3096:b0:390:983c:4ab1 with SMTP id
 bl22-20020a056808309600b00390983c4ab1mr5998321oib.42.1682966887139; Mon, 01
 May 2023 11:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
 <CADnq5_Nuu7hAFR6A8SqaENA_CUV_F3J1qgCwE=Yn_1rY-n5GLg@mail.gmail.com>
 <9525dac3-05d9-3943-c43a-e5b475e6088b@felixrichter.tech>
In-Reply-To: <9525dac3-05d9-3943-c43a-e5b475e6088b@felixrichter.tech>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 May 2023 14:47:56 -0400
Message-ID: <CADnq5_OsjBMOy4rT3z+y2zznW_28fOALbB=YPteiCmo=_V2N7g@mail.gmail.com>
Subject: Re: PROBLEM: AMD Ryzen 9 7950X iGPU - Blinking Issue
To: Felix Richter <judge@felixrichter.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 1, 2023 at 2:44=E2=80=AFPM Felix Richter <judge@felixrichter.te=
ch> wrote:
>
> On 01.05.23 15:27, Alex Deucher wrote:
> > On Mon, May 1, 2023 at 3:20=E2=80=AFAM Felix Richter <judge@felixrichte=
r.tech> wrote:
> >> Hi,
> >>
> >> I am running into an issue with the integrated GPU of the Ryzen 9 7950=
X. It seems to be a regression from kernel version 6.1 to 6.2.
> >> The bug materializes in from of my monitor blinking, meaning it turns =
full white shortly. This happens very often so that the system becomes unpl=
easant to use.
> >>
> >> I am running the Archlinux Kernel:
> >> The Issue happens on the bleeding edge kernel: 6.2.13
> >> Switching back to the LTS kernel resolves the issue: 6.1.26
> >>
> >> I have two monitors attached to the system. One 42 inch 4k Display and=
 a 24 inch 1080p Display and am running sway as my desktop.
> >>
> >> Let me know if there is more information I could provide to help narro=
w down the issue.
> > It's related to scatter/gather display.  As a workaround, you can
> > disable scatter/gather display by setting amd.sg_display=3D0 on the
> > kernel command line in grub.  It's fixed properly in:
> > https://gitlab.freedesktop.org/agd5f/linux/-/commit/08da182175db4c7f808=
50354849d95f2670e8cd9
> > Which should land in Linus' tree this week.
> >
> > Alex
>
> Thank you for your quick response. Sadly I have to report that using the
> workaround kernel parameter did not resolve the issue for me. The
> monitor still
> turns full white although less frequently. I'll be sure to look out for
> the update once it hits mainline ;)

If the module parameter didn't help then perhaps you are seeing some
other issue.  Can you bisect?

Alex

>
> Kind regards,
> Felix
