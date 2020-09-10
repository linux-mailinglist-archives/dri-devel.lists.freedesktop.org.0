Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5012645CE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 14:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFE66E055;
	Thu, 10 Sep 2020 12:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115DD6E055
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 12:14:39 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id ay8so6054476edb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 05:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FMedo/ps8ueGnwlfFnZRujy1M8hYwNZ1iM1VhAT/b7Y=;
 b=XOVe0UrWgi2iTjb/J6Rh8uivbxMaQn9Tk6p/5BuDwSqs/tQVeceEIDK0Lcpc8IzO6G
 PlojBQBCeMgqMH7CnBSD0dbAdw8roDOrbtkSXqkihBZL76njNd4vwnnf8Q9hLOL9SqRH
 YICxmQyRzBlnmCzKFgte91BvOPBL7G0r1vR8hR/L1pOswRfwiZIAQIOkJGuyFfir7Bew
 Ka1fck7S1EJKWduhpXEM63vXPvBigDME6v3QL8PmyAfL32RwEB768vpKDgVzIMEfqG4n
 KzMQ3Wr571ftGMpm7W8yJYY9mfZFC/weQmRPVtCvBdzRG6RC4G1rWQqXR/TfKuXhjyT8
 lcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FMedo/ps8ueGnwlfFnZRujy1M8hYwNZ1iM1VhAT/b7Y=;
 b=As1Z96nxN35MzGFJxyXodpYlJ5PpSuoBYVt+Utsms/trGZWIFS8Dg8ngKj0gpwzv4I
 l+pU6C1rICv5h9e6Mg6lZnicJzpBwXMDJLgZX1/FX4dfb2xLza/1Oyf1zIyC308i3YlA
 oZZi8jnCI+2Kl4JLsrVLlnEYCAv2cnmfB+pDBPpnALsPVNPciwFv4d8QaLNgzEooE1hY
 MiFkjDCAPQunuvFKbaQ8uwd68RS9jjCUZUIqPeVG9CF1R0C84ZSCCOxZWA14F496dIcg
 rx3shTFQmSzic8daRsYz1S57DCgfW2q4BGBN05sTTO5NgvQqLyz57XBfXfAzeN9VNCME
 wOxg==
X-Gm-Message-State: AOAM532nZ3MqR9Ds7X9eXXdm56/EMnFaeVOGaNVTJEok4X9SCp2zn+OO
 7deqA/0twGwMXkMY7mdEB4LoxCT+eJGNLoz/ViGmug==
X-Google-Smtp-Source: ABdhPJzgwqUNAHIwF+wfDZqx86v610h3DWNzzkZhejAyZuwzNQOMivh6QIyaYXMSAlvxWZK3URWsueXCrelxTIBLXRc=
X-Received: by 2002:a50:b022:: with SMTP id i31mr9140839edd.17.1599740077633; 
 Thu, 10 Sep 2020 05:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <1940005.XIBaf5lNV5@jeremy> <1857880.I5TKlsx52r@jason>
 <CAAEAJfDU=rvQ4aEAbBrveLigUjoYFGhLZJ7PsE_WpoOYxaDqdg@mail.gmail.com>
 <6531669.OW97vx6Khr@jason> <B8QFFQ.FVZD8SCWAWD51@crapouillou.net>
 <CAAEAJfBQRLKxaR_6HUi-Dvoc+_WC0JPJNGH5C0rz-yxhOwArdw@mail.gmail.com>
 <829D6884-D1F1-4197-B25C-F0DBF2F4AEA7@goldelico.com>
 <CAAEAJfBO5-T9oG_whDu5=MDcthAJpbJ5ER3eJJx1gXMsHu-v7w@mail.gmail.com>
 <2093A5E6-28CC-42C6-8CF9-3E78942254F4@goldelico.com>
 <DD421AB9-E419-41C1-B23E-B7FC4603C433@goldelico.com>
In-Reply-To: <DD421AB9-E419-41C1-B23E-B7FC4603C433@goldelico.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 10 Sep 2020 09:14:25 -0300
Message-ID: <CAAEAJfBgWKk9T0y81C53r5vNe8jFZdUPp72PzypB4zbF8hJDYA@mail.gmail.com>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the
 Ingenic JZ4780)
To: "H. Nikolaus Schaller" <hns@goldelico.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Paul Boddie <paul@boddie.org.uk>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Sep 2020 at 04:54, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi Ezequiel,
>
> > Am 27.08.2020 um 09:21 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> >
> > Hi Ezequiel,
> >
> >> Am 24.08.2020 um 19:38 schrieb Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>:
> >>
> >> On Mon, 24 Aug 2020 at 13:05, H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >>>
> >>> Hi Ezequiel,
> >>
> >> The fix is just re-organizing the code a bit. Just pushed a possible
> >> fix for that (following the IPU handling by Paul Cercueil),
> >> please feel free to test this:
> >>
> >> https://gitlab.collabora.com/linux/0day/-/commits/jz4780-drm-hdmi-module-fix-v5.9-rc2
> >
> > Works well (after doing a minor fix to the CI20 defconfig)!
> >
> >>
> >> FWIW, my test setup uses mainline vanilla U-Boot v2020.07.
> >> The kernel is loaded via TFTP. Debian mipsel is mounted via NFS
> >> (which means dm9000 works). I'm testing with weston and modetest.
> >>
> >> Note that enabling DRM_INGENIC_IPU will make the driver
> >> fail to load, as the IPU is not optional (and not present on ci20.dts).
> >> A minor thing to fix.
> >>
> >> Cheers,
> >> Ezequiel
> >>
> >>> And it seems to differ significantly from what Paul has developed recently
> >>> to make it work. It seems to be quite lucky that we have a working setup now :)
> >>>
> >>>> Nikolaus, Paul: Do you have plans to submit these?
> >>>
> >>> Yes, as soon as we are sure that it works (and when it doesn't).
> >>>
> >>> But thanks to your work it is now much easier to improve things, since we
> >>> are no longer looking for a break-through but just have to avoid regressions.
> >>>
> >>>> If not, I'll be happy to get them out the door for review.
> >>>
> >>> Let it mature a little first and have it tested on more setups and rebased
> >>> to mainline v5.9-rc2 :)
> >
> >
> >> Am 24.08.2020 um 23:11 schrieb Paul Cercueil <paul@crapouillou.net>:
> >>
> >> DRM drivers follow their own schedule, you should rebase to drm-misc-next instead.
> >>
> >
> > With the comment from Paul, I think it is best if you push them for review.
> >
> > My patch set based on v5.9-rc2 is here (including one EFUSE patch which I have
> > included only for making my Ethernet interface work for testing):
> >
> > https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/letux/jz4780-hdmi-v5
> >
> > Please take it, do the required squashes and rebasing and post them for discussion to the
> > appropriate lists.
>
> I hope you are well. Do you plan to do the squash and rebase and posts?
>

Hi Nikolaus,

I wanted to use the component API for the the dw hdmi glue driver
but somehow it wasn't probing and I haven't had time to debug it. Using the
component API consistently would allow to do some cleanups IMHO.

Thanks,
Ezequiel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
