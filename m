Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05041565BF1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FC810F9ED;
	Mon,  4 Jul 2022 16:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF0210E103
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=jwop+pf8kkMEpCeiQ+ey4F0GYiyZJrDc0hwl/Fh2osY=;
 b=ifyTPU07/1YMooTDfMNuwpPY9MrEx8ALkgY1yx+GU329ufcmj0ZX/KseREM1teFftg0dOJDkcNFBF
 zgAWEgM1PRe704H2HNfAd1pUZtKh54hWMXrrlB6R+7VMo83kAk066eaQ5pzPMeDa2QE0kWolqSasvr
 D9I156IKz6VxCMXaJ1svZJuqozwBdfIdk9OLej+Prj2nFH17BUaZiJoybqvH659lPYBtHy2CJ/bDra
 GDVZO1dleUlJPgupfUFWd4NwGVObr5N+Pb6LOph6LmPaqatzhgYZa5mPG8c11/UIKlP8iveI159ceP
 ewQmLzyM4Ox6XaTZEKqV8261ldM/mvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=jwop+pf8kkMEpCeiQ+ey4F0GYiyZJrDc0hwl/Fh2osY=;
 b=fg/S3L5hFLnGq6AEBmZbOLivji1FXWAHwhM+1aZ8dy9ilMO2Oh1HrORk8i7Recd2ZoHPLyXpfQEIf
 HyLGkk4BA==
X-HalOne-Cookie: a26c1998eea1d8fd6da01ebd99969119b4704861
X-HalOne-ID: d077f01f-fb01-11ec-be7e-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id d077f01f-fb01-11ec-be7e-d0431ea8bb03;
 Sun, 03 Jul 2022 18:56:15 +0000 (UTC)
Date: Sun, 3 Jul 2022 20:56:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v5 0/3] Support Sharp LQ101R1SX03 and HannStar HSD101PWW2
 panels
Message-ID: <YsHmTdvSyX/DYAzP@ravnborg.org>
References: <20220529180548.9942-1-clamor95@gmail.com>
 <b7715f7d-c69d-2bb0-8226-bcb29e5bf91c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7715f7d-c69d-2bb0-8226-bcb29e5bf91c@collabora.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, Svyatoslav Ryhel <clamor95@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,
On Thu, Jun 30, 2022 at 08:23:06PM +0300, Dmitry Osipenko wrote:
> Hello Sam,
> 
> On 5/29/22 21:05, Svyatoslav Ryhel wrote:
> > This series adds support for Sharp LQ101R1SX03 and HannStar HSD101PWW2
> > display panels that are used by Asus Transformer tablets, which we're
> > planning to support since 5.17 kernel.
> 
> The tablets now supported since 5.17 and awaiting for the panel patches.
> 
> > Changelog:
> > v5: - previously patches were sent by Dmitry and he asked me to resend them
> > 
> > v4: - Added r-b from Rob Herring that he gave to the LQ101R1SX01 DT patch
> >       of v2. I missed to add it to the v3 by accident.
> > 
> > v3: - No changes. Re-sending for 5.18. Device-trees of devices that use
> >       these panels were merged to 5.17, so we're missing the display support.
> > 
> > v2: - Added ack from Rob Herring to the HSD101PWW2 binding.
> > 
> >     - Updated LQ101R1SX01 binding, like it was suggested by Rob Herring,
> >       making LQ101R1SX03 directly compatible with the LQ101R1SX01.
> >       Such that ["sharp,lq101r1sx03", "sharp,lq101r1sx01"] could be
> >       used in DT. This removes need to update panel driver with the new
> >       compatible.
> > 
> >     - Improved commit message of the LQ101R1SX03 patch.
> > 
> >     - Added my s-o-b to all patches.
> > 
> > Anton Bambura (1):
> >   dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03
> > 
> > Svyatoslav Ryhel (2):
> >   dt-bindings: display: simple: Add HannStar HSD101PWW2
> >   drm/panel: simple: Add support for HannStar HSD101PWW2 panel
> > 
> >  .../bindings/display/panel/panel-simple.yaml  |  2 ++
> >  .../display/panel/sharp,lq101r1sx01.yaml      |  7 ++++-
> >  drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
> >  3 files changed, 36 insertions(+), 1 deletion(-)
> > 
> 
> Sam, could you please take a look at these patches? They missed two
> kernel versions already because there was nobody to apply them. Thanks
> in advance.

I went through the panel backlog a week or two ago, but missed these.
Likely because I did not look more than a week back.
Sorry for letting it take so long - but I am not the most reliable linux
developer these days (hobby time only, and time is limited).

Patches are now applied to drm-misc (drm-misc-next) and should soon be
visible in -next.

	Sam
