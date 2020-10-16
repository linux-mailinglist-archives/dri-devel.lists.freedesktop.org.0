Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D78D290D36
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 23:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE836EE76;
	Fri, 16 Oct 2020 21:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BA66EE76
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 21:24:45 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 133E280627;
 Fri, 16 Oct 2020 23:24:42 +0200 (CEST)
Date: Fri, 16 Oct 2020 23:24:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: David Airlie <airlied@redhat.com>
Subject: Re: [PATCH] drm/ast: Avoid to access BMC addressing when P2A is
 disabled
Message-ID: <20201016212441.GA1962741@ravnborg.org>
References: <1602834078-1700-1-git-send-email-kuohsiang_chou@aspeedtech.com>
 <CAMwc25oC596560WUJjh8f2jfcnHjfUTW+cgf=maSMsAc83TcrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMwc25oC596560WUJjh8f2jfcnHjfUTW+cgf=maSMsAc83TcrQ@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=V2NxCb60AAAA:8 a=vyyOippwqKgmslNyEJoA:9
 a=CjuIK1q_8ugA:10 a=3L6qF29SlnrayQqPM2jZ:22
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
Cc: eich@suse.com, dri-devel <dri-devel@lists.freedesktop.org>,
 tommy_huang@aspeedtech.com, Thomas Zimmermann <tzimmermann@suse.de>,
 jenmin_yuan@aspeedtech.com, arc_sung@aspeedtech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 17, 2020 at 07:01:38AM +1000, David Airlie wrote:
> On Fri, Oct 16, 2020 at 6:03 PM KuoHsiang Chou
> <kuohsiang_chou@aspeedtech.com> wrote:
> >
> > The patch is upstreamed
> > 1. For RHEL7.x, because its native kernel is suggested to update
> >    from 3.10 to 4.9 on 2 ODM's platform.
> > 2. For AST2600.
> > 3. For ASTDP.
> > 4. v1.11
> 
> Hi,
> 
> I've cc'ed Thomas who is maintaining this upstream, but this patch in
> it's current form isn't acceptable, Maybe Thomas can provide more
> detailed info, but the basic rules are
> 
> One patch should do one thing.
> Patches should be bisectable so any issues can be tracked down easier.
> Fixes should be separated from new code.
> New features and chip support should be separate.

I noticed the patch included drmP.h - which has been gone for a while.
So on top of what Dave wrote it should build (and work) on the latest
kernel.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
