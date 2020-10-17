Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E792910A6
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 10:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA786E0BF;
	Sat, 17 Oct 2020 08:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BA26E0BF
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 08:03:16 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E06FD80613;
 Sat, 17 Oct 2020 10:03:13 +0200 (CEST)
Date: Sat, 17 Oct 2020 10:03:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vinay Simha B N <simhavcs@gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fixes bus formats read
Message-ID: <20201017080312.GB2568873@ravnborg.org>
References: <1597217150-22911-1-git-send-email-simhavcs@gmail.com>
 <20200812095418.GG6057@pendragon.ideasonboard.com>
 <CAGWqDJ4i=t4Noi7wjGDDhUYkB_uuQ6A-WiMrh1ErKRi2HU9t9w@mail.gmail.com>
 <20200812131818.GI6057@pendragon.ideasonboard.com>
 <CAGWqDJ6eHCNXb5dMCUJ785iUp7gjdCk0bB=GuZesVesaVACucQ@mail.gmail.com>
 <CAGWqDJ5QWyvgJWyink1eH2fHhFWEKSei7XPCdtCRaM1BqRs-Tw@mail.gmail.com>
 <CAGWqDJ7DQbnxBmL9xt3cJoXkcm4aU1Msf-MiJOi12hd61GbJpg@mail.gmail.com>
 <CAGWqDJ4eqDNZFz+F2ybaCzuZ=bvr_4hFq=GGMmPCK0zY1KcyPw@mail.gmail.com>
 <CAGWqDJ4zHO4sjXOkG=iSeBhJn4J9+ccr6CKOKcAEBxU31b4VGw@mail.gmail.com>
 <20200908175707.GH11405@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908175707.GH11405@pendragon.ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=GvDVO_YM4ib0h8v04t0A:9 a=CjuIK1q_8ugA:10
 a=QYH75iMubAgA:10
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinay Simha B N <simhavcs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay

On Tue, Sep 08, 2020 at 08:57:07PM +0300, Laurent Pinchart wrote:
> Hi Vinay,
> 
> On Tue, Sep 08, 2020 at 11:22:48PM +0530, Vinay Simha B N wrote:
> > laurent,
> > 
> > Please review or give some feedback.
> 
> I'm sorry, I have very little time these days :-( Maybe Neil can provide
> feedback ?

I have lost the original patch - if this is still pending could you then
please resend.

Thanks,

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
