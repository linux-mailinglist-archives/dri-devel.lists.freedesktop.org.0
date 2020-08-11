Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C56A9241712
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 09:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B856E153;
	Tue, 11 Aug 2020 07:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2755C6E153
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 07:19:56 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v22so8285175edy.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WzeE0ETsHwTrcZjkyPeaVgFzhKSLH7P6eZu9dM+LgBc=;
 b=hbJnw4PXWmc+6MdsTR1Az6ulYyXGveGuVDuaBfuNG7/8dboe2+eQyTEt774tXiUUPJ
 uTOZyMK7DUeUSpsnhFsUBPgJQL2QnjXGkZr2PO79secdVBVRFXAqIXcNYBDZQgRjOUo3
 NPZExuOhtX4aUPHr7oo1e5hrq+Ui5+Xm6GkAJPOL2jUnUdMiTIqIHE/UoE3o/E6u5eIz
 pGCKy+VLj1IlCATEG7t943e84ls/VUH03ZnIVvscmRiMQlL6x2WoVuOocBlvfyEbX4KT
 5SMXjom7bFqUBkyEGS+s8EeZJlemq6NOodmh9DtqgajcNuDY1CFUZjO2kHsDunFlq9vo
 1gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WzeE0ETsHwTrcZjkyPeaVgFzhKSLH7P6eZu9dM+LgBc=;
 b=NKa2GSUBt9sCHhK+/q6mQS7iMU8KwaDFFH1I1NjJJuFgCKIZxDG4Adz4GaIwpuCJ+j
 hLpBlc378CpyEHkBTfc0q1r9DzdX17m2dNsu5wgZiYdHV+Yp3+l9opDpMuWOdDTmWB3U
 fQp+CDlUzKOoqc6AEunKvHrh9sqDBEnSMqIAgzKJM3OcJEWIlVMOZhdke+VV3e0L/2IR
 NIrSPFRpGUcdsodzBdZ2+2uNyC0BHOvSrwKQFb3n6VDQ2aIsOleY3lSKPGuQKm4ciOte
 o51KQMZvy+2sPcmhBEcHW1KjlDgoNXSuTcUTVidwDJDuheer3BRFFRSiceKlob7ZogIe
 K/OA==
X-Gm-Message-State: AOAM530KZ9a1Kl3gT0IVK1gfhZT/LqzL5dsok8/3pZCSXGUr9gzgHNwB
 Yhb5ueG0ab+pYjCpeRODbzXnvu9prp3wEhr/XeU=
X-Google-Smtp-Source: ABdhPJwIgJ+gg5KkKRM42u+CmfJVOb4FSiEWBgQO/jHRoII+HNJgltAvZDEH2lwjL0Y8ydzr3Shs4xp13N2Zs6E+Bag=
X-Received: by 2002:aa7:cc12:: with SMTP id q18mr10758548edt.113.1597130394743; 
 Tue, 11 Aug 2020 00:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <230cc360-89b9-bb39-ee7e-d68ac037345f@i-love.sakura.ne.jp>
 <e5822548-4373-5020-eb3a-9d6144b74d25@amd.com>
 <be670819-20d0-0757-a0f9-20054a527e77@vmware.com>
 <33c4495c-7fb5-f075-b30b-9ab9bdd4ce32@amd.com>
 <e4055371-5a78-0b32-9e1f-d17d865cbb8c@amd.com>
 <CAPM=9txMmSdHqnTsq97voJnNabh+dzfSzeJL302z=WJJD9j8Gw@mail.gmail.com>
 <551d34e3-945f-cb76-f3a6-d2a7533ed2a6@amd.com>
 <CAPM=9tzS992VBjTX24wsz=Oey3SVO6PS50oXaW7o9kBqt156eQ@mail.gmail.com>
 <36e09aae-a758-43c0-2a3d-4eeb393d3e5a@amd.com>
In-Reply-To: <36e09aae-a758-43c0-2a3d-4eeb393d3e5a@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 11 Aug 2020 17:19:43 +1000
Message-ID: <CAPM=9txRCV=rANdzki1KSHZExpDse_hkXD26Jvt-d=cevTdgYg@mail.gmail.com>
Subject: Re: [linux.git drm/ttm]: NULL pointer dereference upon driver probe
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Well how about completely removing the concept of a global TT from TTM?

Yes makes sense to me to try and rip out the global TT from the core
and turn it into a driver optional feature is possible.

Dave.

>
> What TTM should do is managing domains and help with the transitions
> between those domains.
>
> That one of those domains maps the backing pages into a global TT is
> completely specific to that domain and shouldn't bother TTM in any way.
>
> We can of course provide some default functions to manage AGP and
> classic GART, but TTM shouldn't enforce using those.
>
> Regards,
> Christian.
>
> >
> > Dave.
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
