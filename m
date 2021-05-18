Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A15F3878FA
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 14:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284DD6EB58;
	Tue, 18 May 2021 12:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8715B6E87E;
 Tue, 18 May 2021 12:39:20 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id v188so2014169vkf.5;
 Tue, 18 May 2021 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WVtDj08z98F58bN9H9RBk5MhfrHWI4u1IfK1xNaBLvs=;
 b=k0J848oJ5ulFmZ0Cp2JKo4ZivRARPXRY5MAHXjkMKkcDlXA6qqxpSi587bWIeyFtj5
 XJePd3QwkkERgcFDFmxRD+7t1Cu9ZTEJ++m3sD99dDSaS//suEJ3h6b1/u+6LTFmRSPQ
 Ws79NkrtfhdKX5fPAVsxE/Qh64aplpEyDa0GIZiReyfBMG91UokrR+Z98/Vwv8nNkqpv
 9u9yK6ctx8gvqRtIcAA2CO5VLYKOfjPa9e5mIvsweotqabqe77OpQO8/R8IY2bSYonWG
 Q8fpOFNp5hK5J/mFcsG5ASEl/VGtMC+UZuBe94GP5XcoGnYhkEl7SJ5T68AfEkh2v4Wr
 1uJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WVtDj08z98F58bN9H9RBk5MhfrHWI4u1IfK1xNaBLvs=;
 b=NkKZR9svid0pEU3U8T3P1C3O9WRHo+DHdxxRexuo1gObSRipwBK89RPDFjOFuklM/Y
 T8cBfVEaGm4sfDPW1xOG697SJLson117gfGzV49DOYVrcj8RuirlcyG3pjIgJGl0wQkw
 ofTQdE5qzcO+X7gnAkkOgl0giTDSuGBNYjkqqJWRVUbLpDm5beY/4Cgolqv+F2cMUuSb
 pudYvOuHIG7VBw2dr7wSZ+qnzuInM4byesu5oXI47mlAfzOWahZNwO92PizW+ufvfO8R
 E1wwrsfsRbosMYLFqZNU1VPFVEOFPD9PVQZy8raU0xvklHG6aprVghIJ5T+Xz6XCeMwn
 /XuQ==
X-Gm-Message-State: AOAM5316Sfl9wcFTmy2g7OOcVVDK/x2Ft2RktQTdBH6uFhG/N3tJoLQs
 P6DlrK2RPS3vYs3f9N2p84Sgord/YKcl2jvrBbU=
X-Google-Smtp-Source: ABdhPJyWT3yeXXiSMJweGdWvUZSmrKae3bbcQi6GZwmITlwf5te8X8rrUgt6xQkCmz+mw8VH5UHsMAVCOR0Fr6jf01U=
X-Received: by 2002:a1f:b217:: with SMTP id b23mr5669056vkf.16.1621341559630; 
 Tue, 18 May 2021 05:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210516171432.1734268-1-emil.l.velikov@gmail.com>
 <YKKmsbvTZBwCUiRu@intel.com>
 <CACvgo53H7GAjN_aFsCBOw+xtVbjcbR1q-U3vdgjT1KUPKoMkkg@mail.gmail.com>
 <YKOiN1EFXz7TfYyV@intel.com>
In-Reply-To: <YKOiN1EFXz7TfYyV@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 18 May 2021 13:39:08 +0100
Message-ID: <CACvgo536UEPbePxxOC2Ui7ypWORdFPwtNn_FBug+JcgKSiD_bg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: only disable default vga device
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 kernel@collabora.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 at 12:17, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, May 18, 2021 at 12:09:56PM +0100, Emil Velikov wrote:
> > Hi Ville,
> >
> > On Mon, 17 May 2021 at 18:24, Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Sun, May 16, 2021 at 06:14:32PM +0100, Emil Velikov wrote:
> > > > From: Vivek Das Mohapatra <vivek@collabora.com>
> > > >
> > > > This patch is to do with seamless handover, eg when the sequence is
> > > > bootloader =E2=86=92 plymouth =E2=86=92 desktop.
> > > >
> > > > It switches the vga arbiter from the "other" GPU to the default one
> > > > (intel in this case), so the driver can issue some io().
> > >
> > > I don't understand what this commit message is trying to say.
> > >
> > Bunch of context is lost due to the patch age, so I'm not 100% sure of
> > the actual hardware setup where this occurs.
> > Does the following make sense?
> >
> > Currently on dual GPU systems, we do not get seamless handover as the
> > output flickers during the transition bootloader -> plymouth ->
> > desktop.
> > This happens as a result of switching (via the VGA arbiter) from the
> > "other" GPU back to the default i915 one and issuing io() commands.
>
> Hmm. Does this work?
>
Thanks I'll it give it a try. Might need a few days to find the right
hardware/software combination.

-Emil
