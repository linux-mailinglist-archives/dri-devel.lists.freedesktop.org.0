Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C746120268
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 11:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667396E48E;
	Mon, 16 Dec 2019 10:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32486E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:29:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id u2so6085321wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 02:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=46o7gfaBJKWXTkcq7jAyrA6x8PfxHhsT8BvQ5sfS3jI=;
 b=cGP6aCvJaouKqRF113ZIszW+7Jq6GOE1v2MmKkeCKv1mYQDJ+HoY9Z8V/MPmZfGd2U
 pUDJOT6IetAiG84ATEptiwmgdtqEPnWSn/4zKO8isMNvuaoMoUim5xMIOef0BhZ2MldS
 HdmuLehU6XU8/gpx+ejlWQF4cXlHvAPwPnBKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=46o7gfaBJKWXTkcq7jAyrA6x8PfxHhsT8BvQ5sfS3jI=;
 b=VLxj1F11g9NR04JYFLRaSDxVuEDV7La3uT/nsr0l0SyhhLUXc3g8yJLaqWXZijIcoc
 ZCl6xHJc4N6qjjgYn3s8oOoCotXVAhAuxJr4epU/QsXq25d6UO+x4e/EoNZ2tuNt2oxV
 kd5RSP0K6bDmByljmB6OZxxvKMNiZoaq/S/L9qYdFv8kg/5YqRvdyjENtstZmeCbWFrW
 Rf12FmsvVFdFIS0LcPDhqIlVfqpj8Vr6IIH7+nj5Dm04mm2kCps1tDWj7k2X5jOuZLvW
 Fer3Gv3gdoITzgvoTdXzOoqYh+mcRWCNwxXCiXqZbeB8gE2ctT+6PkOogBwDnc93cOnn
 v99A==
X-Gm-Message-State: APjAAAUtWlJCmchI1bDK2oD2DhbLspih+XhmQ9nSvxKH4yEUbtx6hK6P
 NucIN8XAz7QFwghs6skl8LzRjg==
X-Google-Smtp-Source: APXvYqxqYBkRX2S1WOmH3iJu+DF4WPqvZ4wos4keiSNNx6sBRLiORSihcgxKEvoS1oZAV5r2/Zr72w==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr30026831wmb.0.1576492141292; 
 Mon, 16 Dec 2019 02:29:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id a1sm21003085wrr.80.2019.12.16.02.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 02:29:00 -0800 (PST)
Date: Mon, 16 Dec 2019 11:28:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [GIT PULL] drm/arc: Yet another set of minor fixes
Message-ID: <20191216102858.GR624164@phenom.ffwll.local>
References: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191127100634.GE29965@phenom.ffwll.local>
 <CY4PR1201MB01201760E81B40589D182E08A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <CAKMK7uHSm6oKUUDxQxPkOJMj4Ut6+B1dFdZGoauNjrT_o841sA@mail.gmail.com>
 <CY4PR1201MB0120529194B092E2C2ACD77EA1540@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191213102219.GE624164@phenom.ffwll.local>
 <CY4PR1201MB01206B89011211BB25EF82ADA1540@CY4PR1201MB0120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR1201MB01206B89011211BB25EF82ADA1540@CY4PR1201MB0120.namprd12.prod.outlook.com>
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

On Fri, Dec 13, 2019 at 10:24:42AM +0000, Alexey Brodkin wrote:
> Hi Daniel,
> 
> > -----Original Message-----
> > From: Daniel Vetter <daniel@ffwll.ch>
> > Sent: Friday, December 13, 2019 1:22 PM
> > To: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>; arcml <linux-snps-
> > arc@lists.infradead.org>; Eugeniy Paltsev <paltsev@synopsys.com>; dri-devel@lists.freedesktop.org
> > Subject: Re: [GIT PULL] drm/arc: Yet another set of minor fixes
> > 
> 
> [snip]
> 
> > > Not sure if you noticed re-spin of my pull-request in the previous message.
> > > Do you want me to send it in a separate email?
> > 
> > Yeah I guess this got lost again.
> 
> So should I re-send it in another email or you will pick it up
> from existing thread?
> 
> If I'm going to re-send it do I need to re-base it on today's drm/drm-next?

I just tried to vacuum it in, but it chokes the scripts since it's
multiple pull requests in one mail with quotes. So please redo in a clean
mail.

Wrt baseline, here's the recommendation in order of my preference:
- Just stuff it into drm-misc-next
- Base your tree on a tag from Linux
- If you need a specific depedency, base your tree on drm-next with that
  patch included.
- If it's even more complicated, do a multi-way topic branch with lots of
  coordination.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
