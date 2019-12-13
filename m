Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472BE11E1DB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1D36E314;
	Fri, 13 Dec 2019 10:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF7E6E314
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:22:23 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so5968149wmb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 02:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QY3NvhBzfNLuo8ft1+5cod4Pq4jbW4pl0EICF70IjAY=;
 b=QqURz+p6OpfSht0UEiMFNp1Wvl5pvnnJfmrnrvcjDYoxzJkBADQ3DpjCZ5cMJbjo79
 Yr9RP8Fc3OfzTYQvoAMAbxW66g8tEBlxyAsrCIarB4/TbjVDkUJP8xUAbs11MbLlUtlN
 FCdCBOHgnF4XHvA5rltRbVp85iqjCOEcck760=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QY3NvhBzfNLuo8ft1+5cod4Pq4jbW4pl0EICF70IjAY=;
 b=MiG/sUAUJTUG8xdE8z0g2t+OfkeVjPCXwlD3dpjqHLIyrJfACEAqwlmdEzH8nz1C+e
 ozvRySRO0xnvD4GvcwYaoZ0zbvmXTLCFdWFDcoNMZzytzEL0t0ct1GOSiyFVRhdt5+xc
 VjOfYXLOrVh1bCqCktfaRizsCSVXwxV45cLgy7tW8JlQ3OSWVVOWNlX6qGnf6KJcq3Tl
 L7ealXTdK6Wd8qdOPJ5KukwNB7TD09GspUDJqeKwLKqJ+zmVDsAuLjxmNOnNu3iGS6uS
 dv9I76rYILe1nADiJOWazrgWF4vIpawAL6dXaAEisMP9cCHr2Wq9gXqJ6NBzKtPCDfKu
 Pmyg==
X-Gm-Message-State: APjAAAWcfE5pWK/m/wmOolYsw/9gyMTxTI41MXAysJf/6lgvGPZRkMyA
 Ji83NnhvfuYUCBulMeLWdw5ymQ==
X-Google-Smtp-Source: APXvYqzBq7k83Laq7gm+anpzvKyH4RR4LWTb0RsNVZZezRVdWRlgoqKhOJ9hmJPnNxebBV64GRpehA==
X-Received: by 2002:a1c:3d07:: with SMTP id k7mr4235810wma.79.1576232541864;
 Fri, 13 Dec 2019 02:22:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id x18sm9523281wrr.75.2019.12.13.02.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 02:22:21 -0800 (PST)
Date: Fri, 13 Dec 2019 11:22:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [GIT PULL] drm/arc: Yet another set of minor fixes
Message-ID: <20191213102219.GE624164@phenom.ffwll.local>
References: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191127100634.GE29965@phenom.ffwll.local>
 <CY4PR1201MB01201760E81B40589D182E08A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <CAKMK7uHSm6oKUUDxQxPkOJMj4Ut6+B1dFdZGoauNjrT_o841sA@mail.gmail.com>
 <CY4PR1201MB0120529194B092E2C2ACD77EA1540@CY4PR1201MB0120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR1201MB0120529194B092E2C2ACD77EA1540@CY4PR1201MB0120.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: David Airlie <airlied@linux.ie>, arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 10:20:39AM +0000, Alexey Brodkin wrote:
> Hi Daniel,
> 
> [snip]
> 
> > > Thanks for the pointers
> > >
> > > > Or respin this one, but these small pulls have a habit of occasionally
> > > > getting lost :-/
> > >
> > > Well I'd better re-spin this, see below.
> > >
> > > The following changes since commit acc61b8929365e63a3e8c8c8913177795aa45594:
> > >
> > >   Merge tag 'drm-next-5.5-2019-11-22' of git://people.freedesktop.org/~agd5f/linux into drm-next
> > (2019-11-26 08:40:23 +1000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.11.27
> > >
> > > for you to fetch changes up to 9c2acc26c899aa12ad009dff10a5573ef769a7fd:
> > >
> > >   DRM: ARC: PGU: add ARGB8888 format to supported format list (2019-11-27 16:43:39 +0300)
> > >
> > > ----------------------------------------------------------------
> > > Clean-up and fixes for FourCC handling in ARC PGU.
> > >
> > > ----------------------------------------------------------------
> > > Eugeniy Paltsev (4):
> > >       DRM: ARC: PGU: fix framebuffer format switching
> > >       DRM: ARC: PGU: cleanup supported format list code
> > >       DRM: ARC: PGU: replace unsupported by HW RGB888 format by XRGB888
> > >       DRM: ARC: PGU: add ARGB8888 format to supported format list
> > >
> > >  drivers/gpu/drm/arc/arcpgu_crtc.c | 36 ++++++++++++++++++------------------
> > >  drivers/gpu/drm/arc/arcpgu_regs.h |  2 +-
> > >  2 files changed, 19 insertions(+), 19 deletions(-)
> 
> Not sure if you noticed re-spin of my pull-request in the previous message.
> Do you want me to send it in a separate email?

Yeah I guess this got lost again.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
