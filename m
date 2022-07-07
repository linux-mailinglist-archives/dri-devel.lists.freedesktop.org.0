Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A2256AEF7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 01:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9A411B211;
	Thu,  7 Jul 2022 23:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4F611A971
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 23:18:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 330096BD;
 Fri,  8 Jul 2022 01:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1657235886;
 bh=qSeXY27IM1qa1/MU9knkhDz4oP6xqDtjt40vvRl1R9I=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Ozvahh+cS4IQ8Pbs1xjnS4zvcawgbNeFJAkJFuABJyYT6Z3neuhSoiWS9Xu/Ly4m6
 PDXLonNcmrpxOhnAHK8laXcbWJSeIV/UIFe/a/eWuHrwc+fXhOUNKHCxJNH43/v8Ua
 xPRGnC3WzyCVcxQ8vxdE9y3UOXeqnG/AX7JbWmfg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b7d9c7d5-283c-a922-f773-17d722ff03dc@prevas.dk>
References: <0f803b7c-d004-1302-6ef8-205e5b177918@prevas.dk>
 <165703382008.2228597.17239168312569308180@Monstersaurus>
 <b7d9c7d5-283c-a922-f773-17d722ff03dc@prevas.dk>
Subject: Re: connecting a sn65dsi86 to displayport connector
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Date: Fri, 08 Jul 2022 00:18:03 +0100
Message-ID: <165723588318.2961003.13657946179211177978@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rasmus Villemoes (2022-07-07 10:46:24)
> On 05/07/2022 17.10, Kieran Bingham wrote:
> > Hi Rasmus,
> >=20
> > Quoting Rasmus Villemoes (2022-07-05 10:08:37)
> >> Hi
> >>
> >> I have an imx8mp board with a sn65dsi86 and a (full-size) DisplayPort
> >> connector, which I'm trying to get up and running.
> >>
> [...]
> >> Any hints would be highly appreciated.
> >=20
> > If it helps, this is an area I've been working to support one of our
> > boards. I have a branch at:
> >=20
> >  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
> >  kbingham/drm-misc/next/sn65dsi86/hpd
> >=20
> > But it's still a work in progress, and now needs rebasing to account for
> > Sam's latest updates.
> >=20
> > I intend to resume this in a few weeks, but hopefully that branch may
> > have some helpful pointers to get things progressing for you too.
>=20
> Hi Kieran
>=20
> Thanks for the pointer, I'll take a look. But just to be clear: Is the
> board you're referring to above the same as the one where the DT changes
> went in with commit 5a6bca1ff7 ? Or does that Falcon board work with the
> current state of mainline, and the patches in the above branch are to
> support some other board/use case?

Yes, the board I have is the Falcon V3U, as referred to in 5a6bca1ff7.
--
Kieran

>=20
> Thanks,
> Rasmus
