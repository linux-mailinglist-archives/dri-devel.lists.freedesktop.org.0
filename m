Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEC1446F71
	for <lists+dri-devel@lfdr.de>; Sat,  6 Nov 2021 18:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6976E054;
	Sat,  6 Nov 2021 17:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C392B6E054
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Nov 2021 17:46:28 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 80062e4f-3f29-11ec-9c3f-0050568c148b;
 Sat, 06 Nov 2021 17:46:41 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id F10F8194B13;
 Sat,  6 Nov 2021 18:46:24 +0100 (CET)
Date: Sat, 6 Nov 2021 18:46:23 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH 0/5] Add support for Wanchanglong panel used in px30-evb
 v11
Message-ID: <YYa/bzvB8/a/JdON@ravnborg.org>
References: <20211016102232.202119-1-michael@amarulasolutions.com>
 <YWrFIz08A8ZVKXvi@ravnborg.org>
 <CAOf5uwnv=MxqK772YJ3mggkqFQJW+Z3_WrCNHgDPTpDH8d-2Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOf5uwnv=MxqK772YJ3mggkqFQJW+Z3_WrCNHgDPTpDH8d-2Xw@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

On Thu, Nov 04, 2021 at 02:19:33PM +0100, Michael Nazzareno Trimarchi wrote:
> Hi Sam
> 
> On Sat, Oct 16, 2021 at 2:27 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Michael,
> >
> > On Sat, Oct 16, 2021 at 10:22:27AM +0000, Michael Trimarchi wrote:
> > > This patch series add support for W552946ABA panel. This panel is used
> > > in px30-evb v11. All the patches can be applied on top of drm-fixes
> > > branch. The last patch is suppose to fix a race when the panel is built
> > > in. Tested on px30 evb
> > >
> > > Michael Trimarchi (5):
> > >   dt-bindings: vendor-prefix: add Wanchanglong Electronics Technology
> > >   drm/panel: ilitek-ili9881d: add support for Wanchanglong W552946ABA
> > >     panel
> > >   dt-bindings: ili9881c: add compatible string for Wanchanglong
> > >     w552946aba
> > >   drm/panel: ilitek-ili9881c: Make gpio-reset optional
> > The four patches has been applied to drm-misc-next.
> >
> 
> I sent another fix on the same panel. Are those patches queued on some tree?
The patches was applied to drm-misc-next branch of the drm-misc tree.
Around -rc2 time you will see these patches in -next.

	Sam
