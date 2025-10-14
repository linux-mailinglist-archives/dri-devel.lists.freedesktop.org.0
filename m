Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FFABDBCA0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 01:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3266510E122;
	Tue, 14 Oct 2025 23:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="jHzp/zUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE3E10E122
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 23:26:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760484355; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l3aEtCGOBFmw34kvncruL5I0CAdmjLd3ugm7GxNnrDugRlCX1pNAn1nGj+UCi8IF+iZWZP+bphH2YeYCmBe22nu2AIqvMnnXUxUMYJpVTLBKwkm6qU87LBZ9f0X5zhrTb3GEnQYicbEF/1sEdzuCcnjaxNEtRcmsWHWV7mQO4h8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760484355;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Wi2ZRrHxNn49/AQiAXirHuf6hBMU43LJAxsXybMZx9M=; 
 b=OvXJKhdvXFT+1mRA3lrvqzmVSlsS061cLS4Qq/zklmCCihLBuMEkoNDeLKKfpPpgZ635w9OWtSLhs2p/CB6F+uX66Th6l6LasIxPVAmAJnLwaAH9VR7OiuKyPxgVlDxnBsqb1Bk2MZRzv7z0E+W/fm8VAFVHdxRCBbxVBcmg8t8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760484355; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=Wi2ZRrHxNn49/AQiAXirHuf6hBMU43LJAxsXybMZx9M=;
 b=jHzp/zUROnFSKCcXwfpokPJi3hn+exWK8MY378jA/sx8UqtGFN6zk+4+onS4Cpch
 uXOKmaunxZ61XfqiDBegacWKWHH3NyouKTI0fjdFGkl1ytYcj/VFeW9pfBXK6oZKfx8
 vyxie3ebiqzH1Hn9CepsNrbD/wFJAji83KHmYPxA=
Received: by mx.zohomail.com with SMTPS id 1760484353782985.1438714110084;
 Tue, 14 Oct 2025 16:25:53 -0700 (PDT)
Date: Wed, 15 Oct 2025 00:25:46 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v5 12/12] MAINTAINERS: Add Adrian Larumbe as Panfrost
 driver maintainer
Message-ID: <mrp2orrfpxhb2w66lzrjnqpnhf67ahkqislc6tjbzzwjm57a35@c7hod3cwkzou>
References: <20251007150216.254250-1-adrian.larumbe@collabora.com>
 <20251007150216.254250-13-adrian.larumbe@collabora.com>
 <971fd0e3-474a-4685-ade2-f4563372f74d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <971fd0e3-474a-4685-ade2-f4563372f74d@arm.com>
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

On 09.10.2025 16:47, Steven Price wrote:
> On 07/10/2025 16:01, Adrián Larumbe wrote:
> > Add Adrian Larumbe as Panfrost driver maintainer.
> >
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>
> Acked-by: Steven Price <steven.price@arm.com>
>
> Welcome! And thank you for helping out.

Thanks a lot, I'm very glad to be onboard.

> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5257d52679d6..cb68fdec3da4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2066,6 +2066,7 @@ F:	drivers/gpu/drm/arm/display/komeda/
> >  ARM MALI PANFROST DRM DRIVER
> >  M:	Boris Brezillon <boris.brezillon@collabora.com>
> >  M:	Rob Herring <robh@kernel.org>
> > +M:      Adrián Larumbe <adrian.larumbe@collabora.com>
>
> NIT: it looks like you've used spaces not a tab.

Oops, thanks for catching this.

> Also while we're here...
>
> @RobH: Does it still make sense for you to be listed as a maintainer? I
> haven't seen you active on Panfrost for a while.
>
> >  R:	Steven Price <steven.price@arm.com>
>
> And given that I've been doing a fair bit of the merging recently I'm
> wondering if I should upgrade myself to 'M'?

I'll resend a new series flagging the two of us as maintainers.

> Thanks,
> Steve
>
> >  L:	dri-devel@lists.freedesktop.org
> >  S:	Supported

Adrian Larumbe
