Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9C99B7D6D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 15:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D243E10E8BF;
	Thu, 31 Oct 2024 14:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pyJm2kZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4CF10E8BF
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 14:59:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0A5A60007;
 Thu, 31 Oct 2024 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730386747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhBWzbO6TK7HAjI1JrCJgcfzbBRZsf8CgpasmbZdcVA=;
 b=pyJm2kZVNxDCIlFuEi2F13pTUfe9vJA54lG8EXyxvC18woI7IohZfl5TzdO1gXzgMBcXap
 sNCrgZ4Z0ui+pwSPlNyz5jmq0CyFtOEWtSt+xQiFflKovEISS3NhaTPmBvJbjzG7lZPVep
 gQL/91tVbo0G3vlcwFiU6dyt7nSewrQUlfqlnzcb60hqayaKlT0tmedzLHq9tca0DJ1M4S
 qlNPD5YRAnt3BwjyIpcF1vgNpkUVR+Uq5/qtfrOGD7Nw/ogO8OTAsQY/WDMGqMfuHdXGfC
 jq4yQ8HkGnXvghXxU+V0etrQiz+DqZEQdb0NWgZxog4xfq2Kx8AO7NZqvbjLhg==
Date: Thu, 31 Oct 2024 15:59:05 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Cc: Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Remove myself as a VKMS maintainer
Message-ID: <ZyObOQ25KAqk-FmI@louis-chauvet-laptop>
References: <20241014145009.3360515-1-mairacanal@riseup.net>
 <ZyJUlP4jRpwb0NsU@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyJUlP4jRpwb0NsU@louis-chauvet-laptop>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 30/10/24 - 16:45, Louis Chauvet wrote:
> On 14/10/24 - 11:50, Maíra Canal wrote:
> > I haven't been able to properly review the work on the driver for a while.
> > Hence, this commit removes me from the maintainers list.
> > 
> > Signed-off-by: Maíra Canal <mairacanal@riseup.net>
> 
> Acked-by: Louis Chauvet <louis.chauvet@bootlin.com>

Applied to drm-misc-next:
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/623b1e4d2eace0958996995f9f88cb659a6f69dd

Thanks,
Louis Chauvet
 
> Thanks,
> Louis Chauvet
> 
> > ---
> >  MAINTAINERS | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7d0b4335e263..23ac5fbf5e1c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7466,7 +7466,6 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> >  F:	drivers/gpu/drm/udl/
> >  
> >  DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
> > -M:	Maíra Canal <mairacanal@riseup.net>
> >  M:	Louis Chauvet <louis.chauvet@bootlin.com>
> >  R:	Haneen Mohammed <hamohammed.sa@gmail.com>
> >  R:	Simona Vetter <simona@ffwll.ch>
> > -- 
> > 2.46.2
> > 
