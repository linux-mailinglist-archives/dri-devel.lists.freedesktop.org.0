Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F804FFF86
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 21:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110CD10E6D1;
	Wed, 13 Apr 2022 19:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6192F10E6D1;
 Wed, 13 Apr 2022 19:41:36 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id s18so6156877ejr.0;
 Wed, 13 Apr 2022 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o6aYxcvUneI95bTdsz28eCaOVBdeKnTjyTuYgm31g58=;
 b=Ar3JAMnHPCsIfQYgcOes+uiSzpnx2R4RdaeNwBiYdyffO5H4jlupRKtMT1blWMazuk
 tjVoI3SSwl54uS9M3FkXwQePiClm6RACTE/aXHpYtDIRLtOo03dbhCVQitsMd4w3dFd8
 czqlfics96/Kpux4eQ2ek8DDhjaj8YRi39er2T83Pv/WnUs4r3dPgAtkzpGfE5BvtZLd
 2fAt15A/DSqyFYyrnl54U7zparp6BwDfcWc9xUuy3y/qMp/oZ790IL4hV0y5uIvSNRuK
 0elHxdOKzwMOa/VazktVd6X0o2vuu8fEdDPYovN1jRitw/MVI/utxIcOkAM4oZd7AZIW
 bJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o6aYxcvUneI95bTdsz28eCaOVBdeKnTjyTuYgm31g58=;
 b=FJ4aS+Z05IMMKyMdOaB/eRsZ20WJgUa2ke4Gs5Z4z7aA2ByL6Kubo9n/Rl6/c1A2/y
 ClMEbOaBUpWV2E6HySs6mYNGpRzn85CxToCEqtOmK5ZbxPpkNlLiIgNvWkVouUBKAbAI
 ncaJnP/VvE25HbF71un21m4jym0dRD23MTDW1eVGV2jcVYsjJNyJnznWOZnaTWm9Rive
 xpc2sd+RzovziRSi9aX+LwmOBAfY/cou8FzW9IX84LMtdJnSMz7t85jWSIYQDXHmymg4
 HNkYWy2lWe4IZjCyH96y0WUTje6aOfdwCHsTfTleYpO8SbZnFsoVzFBof7GwDuirUZGD
 hz4Q==
X-Gm-Message-State: AOAM53203qOagL7ptMG1to04YXt+6IFccXO4EqJaWiWxiOHKCZilkFkl
 CvvQbUTaD6Rpa8OfqP7cFoRK+Qj0aKHqUg==
X-Google-Smtp-Source: ABdhPJxEljLLVQ0kEiFPkfKG9RmhUUwAQUiziY+Xv9O5hm0W3swx+T8iKPfSoBJTmPnsirazAn9qfA==
X-Received: by 2002:a17:906:6a14:b0:6e8:a87d:3f2f with SMTP id
 qw20-20020a1709066a1400b006e8a87d3f2fmr10779140ejc.300.1649878894821; 
 Wed, 13 Apr 2022 12:41:34 -0700 (PDT)
Received: from darkstar.example.org
 (host-79-21-204-193.retail.telecomitalia.it. [79.21.204.193])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a1709066d8700b006d4b4d137fbsm287200ejt.50.2022.04.13.12.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 12:41:34 -0700 (PDT)
Date: Wed, 13 Apr 2022 21:41:32 +0200
From: Michele Ballabio <ballabio.m@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: AMDGPU: regression on 5.17.1
Message-ID: <20220413214132.6aaa061a@darkstar.example.org>
In-Reply-To: <CADnq5_MVO8B-EH70XJ=L6pp7haHz5ZeF1rGFvPEX5nD1+4n1AQ@mail.gmail.com>
References: <20220403132322.51c90903@darkstar.example.org>
 <CADnq5_M+M_iykM0Ag6RF+kxzgpEopUBtp82h7tRM3G+B3AWZ2w@mail.gmail.com>
 <20220404213940.09a56d15@darkstar.example.org>
 <CADnq5_PhaFbVCb=-AUCx4L-sCyPCPOsY3tNpiAg=gfCN7hFcJA@mail.gmail.com>
 <20220409182831.185e5d92@darkstar.example.org>
 <CADnq5_MvGGONvAvhwgokDxRpTbnsGEFROcgsZteJby9Bya81Nw@mail.gmail.com>
 <20220413193337.16ecc808@darkstar.example.org>
 <CADnq5_MVO8B-EH70XJ=L6pp7haHz5ZeF1rGFvPEX5nD1+4n1AQ@mail.gmail.com>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 regressions@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Apr 2022 14:14:42 -0400
Alex Deucher <alexdeucher@gmail.com> wrote:

> On Wed, Apr 13, 2022 at 1:33 PM Michele Ballabio
> <ballabio.m@gmail.com> wrote:
> >
> > On Mon, 11 Apr 2022 14:34:37 -0400
> > Alex Deucher <alexdeucher@gmail.com> wrote:
> >  
> > > On Sat, Apr 9, 2022 at 12:28 PM Michele Ballabio
> > > <ballabio.m@gmail.com> wrote:  
> > > >
> > > > On Tue, 5 Apr 2022 10:23:16 -0400
> > > > Alex Deucher <alexdeucher@gmail.com> wrote:
> > > >  
> > > > > On Mon, Apr 4, 2022 at 3:39 PM Michele Ballabio
> > > > > <ballabio.m@gmail.com> wrote:  
> > > > > >
> > > > > > On Mon, 4 Apr 2022 13:03:41 -0400
> > > > > > Alex Deucher <alexdeucher@gmail.com> wrote:
> > > > > >  
> > > > > > > On Sun, Apr 3, 2022 at 10:19 AM Michele Ballabio
> > > > > > > <ballabio.m@gmail.com> wrote:  
> > > > > > > >
> > > > > > > > Hi,
> > > > > > > >         I've hit a regression on 5.17.1 (haven't tested
> > > > > > > > 5.17.0, but 5.16-stable didn't have this problem).
> > > > > > > >
> > > > > > > > The machine is a Ryzen 5 1600 with AMD graphics (RX
> > > > > > > > 560).
> > > > > > > >
> > > > > > > > The regression I hit seems to trigger when the machine
> > > > > > > > is left idle at boot (I don't boot straight to X, I
> > > > > > > > boot to a tty, login and then start X). The machine
> > > > > > > > after a while blanks the screen. Usually, the screen
> > > > > > > > unblanks as the keyboard is hit or the mouse moves, but
> > > > > > > > with kernel 5.17.1 the screen does not wake up. The
> > > > > > > > machine seems to run mostly fine: I can login from ssh,
> > > > > > > > but I cannot reboot or halt it: a sysrq sequence is
> > > > > > > > needed for that. Note that if the screen goes blank
> > > > > > > > under X, it wakes up fine.
> > > > > > > >
> > > > > > > > Below a dmesg and two traces from syslog (they're quite
> > > > > > > > similar).  
> > > > > > >
> > > > > > > Can you bisect?  Does setting amdgpu.runpm=0 help?  
> > > > > >
> > > > > > I can try to bisect, should I narrow the search to
> > > > > > drivers/gpu/drm/ ?  
> > > > >
> > > > > I would just do a full bisect if possible in case the change
> > > > > happens to be outside of drm.
> > > > >  
> > > > > >
> > > > > > Setting amdgpu.runpm=0 works, the display now unblanks
> > > > > > without problems.  
> > > > >  
> > > >
> > > > Hi,
> > > >     I bisected this, and the first bad commit is
> > > > [087451f372bf76d971184caa258807b7c35aac8f] drm/amdgpu: use
> > > > generic fb helpers instead of setting up AMD own's.
> > > >
> > > > Let me know if you need some more testing.  
> > >
> > > Thanks.  Do the attached patches fix the issue?
> > >
> > > Thanks,
> > >
> > > Alex  
> >
> > Sorry, no. I applied them both on top of 5.17.1.  
> 
> Thanks.  Please try the attached patch.
> 
> Thanks,
> 
> Alex

I applied the v2 patch on top of 5.17.1 and it works as expected.

Tested-by: Michele Ballabio <ballabio.m@gmail.com>

Thanks,
    Michele Ballabio

