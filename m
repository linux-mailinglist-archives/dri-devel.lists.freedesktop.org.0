Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A41903909
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 12:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448F910E58E;
	Tue, 11 Jun 2024 10:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Xae1nHkV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD7D10E58E;
 Tue, 11 Jun 2024 10:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=RJEjwUTNqxARRNi+A8Omlry3cWQer/5aK7szXPhq1oE=; b=Xae1nHkVIBr4AJjv
 Tg/tcKEZ3do6YJRnY/vmjK6quHsH4TrVpocgmXHoOnW3d5KRWVRGisngBN7bX3Yb4c5x/QrzqpFW8
 XIIBYG49XKCAoDk7Z2SSu70R+ENQ2DsJohrS6abpCdnZqMhdNRvLwMuXS1kqdyMo3CyyEXz8GTURO
 yLBD8Ye+7BMxjEFcEQpgNdXXGNvO+mcmf5NE+/HgzJR+nBlfMqTPfNNDv96VnkQSyvM7kJEP3F669
 tjqAZ1eRsttZvlBt4jY/2rF+inQMJTBzRIbxswrwsAxAJOYTdYMOHabK3JrJwxlNV6JI6hZUiKL/o
 BS0er4lRBbAZCqGL1A==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1sGysk-005X9R-13;
 Tue, 11 Jun 2024 10:37:38 +0000
Date: Tue, 11 Jun 2024 10:37:38 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: daniel@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kherbst@redhat.com, lyude@redhat.com
Subject: Re: [PATCH 2/6] drm/nouveau: remove unused struct 'init_exec'
Message-ID: <Zmgo8leSWpsjVVBS@gallifrey>
References: <20240517232617.230767-1-linux@treblig.org>
 <de79f41d-3a9b-4f15-b270-246af8b4c5b0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <de79f41d-3a9b-4f15-b270-246af8b4c5b0@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 10:36:34 up 33 days, 21:50, 1 user, load average: 0.07, 0.02, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Danilo Krummrich (dakr@redhat.com) wrote:
> On 5/18/24 01:26, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > 'init_exec' is unused since
> > commit cb75d97e9c77 ("drm/nouveau: implement devinit subdev, and new
> > init table parser")
> > Remove it.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Acked-by: Danilo Krummrich <dakr@redhat.com>
> 
> To which series does this patch belong?

Actually all of them were independent patches on drm
some of which are all in, so it can be taken by itself.

> Need me to apply it?

Yes please!

Thanks,

Dave

> - Danilo
> 
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_bios.c | 5 -----
> >   1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> > index 79cfab53f80e..8c3c1f1e01c5 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> > @@ -43,11 +43,6 @@
> >   #define BIOSLOG(sip, fmt, arg...) NV_DEBUG(sip->dev, fmt, ##arg)
> >   #define LOG_OLD_VALUE(x)
> > -struct init_exec {
> > -	bool execute;
> > -	bool repeat;
> > -};
> > -
> >   static bool nv_cksum(const uint8_t *data, unsigned int length)
> >   {
> >   	/*
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
