Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67C41E595A
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594306E425;
	Thu, 28 May 2020 07:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B91B6E2A8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:44:35 +0000 (UTC)
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id B90CC3C0579;
 Wed, 27 May 2020 09:44:33 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NIkAPByA2Jjy; Wed, 27 May 2020 09:44:28 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id CA7B43C0022;
 Wed, 27 May 2020 09:44:28 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.38) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 27 May
 2020 09:44:28 +0200
Date: Wed, 27 May 2020 09:44:22 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200527074422.GA27239@lxhi-065.adit-jv.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <CAMuHMdVGcFGL6V6_zDCPQA66VFyqM9bQ6choWs8eYfOieFu1ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVGcFGL6V6_zDCPQA66VFyqM9bQ6choWs8eYfOieFu1ZQ@mail.gmail.com>
X-Originating-IP: [10.72.94.38]
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: muroya@ksk.co.jp, David Airlie <airlied@linux.ie>,
 Michael Rodin <mrodin@de.adit-jv.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>, hien.dang.eb@renesas.com,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 gotthard.voellmeke@renesas.com, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 Simon Horman <horms@verge.net.au>, Sean Paul <seanpaul@chromium.org>,
 Michael Dege <michael.dege@renesas.com>, michael.klein@renesas.com,
 Harsha.ManjulaMallikarjun@in.bosch.com,
 Ezequiel Garcia <ezequiel@collabora.com>, efriedrich@de.adit-jv.com,
 ChaitanyaKumar.Borah@in.bosch.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Wed, May 27, 2020 at 09:34:30AM +0200, Geert Uytterhoeven wrote:
> On Wed, May 27, 2020 at 9:16 AM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> > On Tue, Oct 15, 2019 at 12:46:13PM +0200, Jacopo Mondi wrote:
> > > CMM functionalities are retained between suspend/resume cycles (tested with
> > > suspend-to-idle) without requiring a re-programming of the LUT tables.
> >
> > Hmm. Is this backed up by any statement in the HW User's manual?
> > This comes in contrast with the original Renesas CMM implementation [**]
> > which does make use of suspend (where the freeze actually happens).
> >
> > Can we infer, based on your statement, that we could also get rid of
> > the suspend callback in [**]?
> 
> While the CMM state will be retained across suspend-to-idle, I'm quite
> sure it will be lost by suspend-to-RAM, at least on the Salvator-X(S),
> ULCB, and Ebisu development boards, as PSCI will ask the BD9571WMV
> regulator to power down the R-Car SoC.
> 
> So IMHO we do need suspend/resume handling.

That makes sense. I should be more careful about suspend-to-idle
vs suspend-to-ram and not alias the two.

-- 
Best regards,
Eugeniu Rosca
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
