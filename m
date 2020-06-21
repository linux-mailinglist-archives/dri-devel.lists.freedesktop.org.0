Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9519820291D
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 08:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DBD89B0B;
	Sun, 21 Jun 2020 06:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F1289B0B
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 06:22:25 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1188B20024;
 Sun, 21 Jun 2020 08:22:21 +0200 (CEST)
Date: Sun, 21 Jun 2020 08:22:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH] drm/panel-simple: fix connector type for LogicPD Type28
 Display
Message-ID: <20200621062219.GE74146@ravnborg.org>
References: <20200615131934.12440-1-aford173@gmail.com>
 <CAOMZO5Bw5qSDirAKBTRcu4_nDafDcfDGpuNRDyuLZs9Zc=HsQA@mail.gmail.com>
 <CAHCN7x+=xjFTy6J4Ej61U2jXTez2rLrt=KtEOzbvV7Tzq6XoPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCN7x+=xjFTy6J4Ej61U2jXTez2rLrt=KtEOzbvV7Tzq6XoPQ@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=Vt2AcnKqAAAA:8 a=e5mUnYsNAAAA:8
 a=7gkXJVJtAAAA:8 a=VwQbUJbxAAAA:8 a=s3IO3C7y_afzQisZ5X4A:9
 a=CjuIK1q_8ugA:10 a=v10HlyRyNeVhbzM4Lqgd:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: David Airlie <airlied@linux.ie>, Adam Ford-BE <aford@beaconembedded.com>,
 stable <stable@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam.

On Mon, Jun 15, 2020 at 09:53:45AM -0500, Adam Ford wrote:
> On Mon, Jun 15, 2020 at 9:46 AM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > On Mon, Jun 15, 2020 at 10:19 AM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > The LogicPD Type28 display used by several Logic PD products has not
> > > worked since v5.5.
> >
> > Maybe you could tell which commit exactly and then put a Fixes tag?
> 
> I honestly don't know.  I reached out to the omap mailing list,
> because I noted this issue. Tomi V from TI responded with a link that
> he posted which fixes this for another display.
> 
> https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg312208.html
> 
> I tested that patch and it worked for a different LCD, so I did the
> same thing to the Logic PD Type 28 display as well.
> 
> My patch and commit message were modeled after his, and his commit
> CC's stable with a note about being required for v5.5+
> 
> I added him to the CC list, so maybe he knows which hash needs to be
> referenced from a fixes tag.  I was hoping to not have to go back and
> bisect if it's not required, but I will if necessary.

git blame is your friend - the panel was added here:
0d35408afbeb6 (Adam Ford               2019-10-16 08:51:45 -0500 2469) static const struct panel_desc logicpd_type_28 = {
0d35408afbeb6 (Adam Ford               2019-10-16 08:51:45 -0500 2470)  .modes = &logicpd_type_28_mode,
0d35408afbeb6 (Adam Ford               2019-10-16 08:51:45 -0500 2471)  .num_modes = 1,
0d35408afbeb6 (Adam Ford               2019-10-16 08:51:45 -0500 2472)  .bpc = 8,
0d35408afbeb6 (Adam Ford               2019-10-16 08:51:45 -0500 2473)  .size = {
0d35408afbeb6 (Adam Ford               2019-10-16 08:51:45 -0500 2474)          .width = 105,
0d35408afbeb6 (Adam Ford               2019-10-16 08:51:45 -0500 2475)          .height = 67,
0d35408afbeb6 (Adam Ford               2019-10-16 08:51:45 -0500 2476)  },

So this gives us fllowing fixes info:
Fixes: 0d35408afbeb ("drm/panel: simple: Add Logic PD Type 28 display support")
Cc: Adam Ford <aford173@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.6+

I have adjusted the changelog to say 5.6 and applied to drm-misc-fixes

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
