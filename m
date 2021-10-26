Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AD143B9F7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 20:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568FC6E479;
	Tue, 26 Oct 2021 18:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EEF6E479
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 18:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635274220;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=7ft8Vn6lPZYMUJ7yRwsizM95snAuobtCtLzV7BieLtc=;
 b=VEeFuwU6xodp2KD9GwJYEFXdI8WK8H+EoJeJyq93OkvqxMux0LdEzq28FwuWs6Eye8
 UCLVyE3y6a7pPyg/rUV9XqEs2hzlwNcwF+QlAf6E8sg4rMWXVDGLIOWC0OOdzYZyMzqI
 cGFcWWLbbpXQt/4M2RIXtHFheVtBaCr5f3FC0MkyHIiw8tjZnCU3rz7O27RR3hJwHutT
 MutBTYuH3GxjK8nYf78thTCgGPOToC46gZSeLanmMe20UoC6Mp8ypB8GOHy82ACtHGmH
 L0kUOf+FEHzgQAIekjPLgG0hW5M69gYBczzg5/8sVYZHgpNjxl0ejz0lDZvScjKbnbof
 SMHQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8J+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.1 SBL|AUTH)
 with ESMTPSA id d01d1fx9QIoJynM
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 26 Oct 2021 20:50:19 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [RESEND PATCH v3 0/6] drm/ingenic: Various improvements v3
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20211026181240.213806-1-paul@crapouillou.net>
Date: Tue, 26 Oct 2021 20:50:19 +0200
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Boddie <paul@boddie.org.uk>,
 list@opendingux.net, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <4CBF748C-DA58-4E8B-A6E4-A7CE653F2C52@goldelico.com>
References: <20211026181240.213806-1-paul@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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

Hi Paul,

> Am 26.10.2021 um 20:12 schrieb Paul Cercueil <paul@crapouillou.net>:
> 
> Hi,
> 
> I resend the V3 of my patchset for drm/ingenic, verbatim.
> 
> The previous submission of my V3 received a lot of replies, but none of
> these replies were actually talking about the patches themselves.

Indeed. And since we have finally managed to add jz4780 HDMI support
(I didn't find to work in the latest comments) on top of the series as is,
please go ahead and add my

tested-by: Nikolaus Schaller <hns@goldelico.com>

BR and thanks,
Nikolaus

> 
> Cheers,
> -Paul
> 
> 
> Paul Cercueil (6):
>  drm/ingenic: Simplify code by using hwdescs array
>  drm/ingenic: Add support for private objects
>  drm/ingenic: Move IPU scale settings to private state
>  drm/ingenic: Set DMA descriptor chain register when starting CRTC
>  drm/ingenic: Upload palette before frame
>  drm/ingenic: Attach bridge chain to encoders
> 
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 278 +++++++++++++++++-----
> drivers/gpu/drm/ingenic/ingenic-ipu.c     | 127 ++++++++--
> 2 files changed, 333 insertions(+), 72 deletions(-)
> 
> -- 
> 2.33.0
> 

