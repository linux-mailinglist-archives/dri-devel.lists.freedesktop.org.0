Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0D0554EC3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 17:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DA911347B;
	Wed, 22 Jun 2022 15:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4C811347B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 15:11:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C4D8B81F2C;
 Wed, 22 Jun 2022 15:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E5BC34114;
 Wed, 22 Jun 2022 15:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1655910681;
 bh=85kAYdDSM1kdzcUsEkD4BEv1Jp3ZVjaLheAWsW8yx+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mkqi5YRlRB1xY9CLLZ3Zqqn/IxYC0/iNiDBFGMIqg/Pa1tW2zRU4VQmHJHQlM1Y9V
 OOCfYTNT+rSKEGS8CU+6OBdgj1cXU5Ci8fV5GcAjgugELU+LRwOERTQhPWa4pwQlOk
 97qTIqt103r7FlTA2nh9vozltw6hbAQ6jNwCMSO8=
Date: Wed, 22 Jun 2022 17:11:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/7] usb: typec: Introduce typec-switch binding
Message-ID: <YrMxFeMc0tk/K1qL@kroah.com>
References: <20220615172129.1314056-1-pmalani@chromium.org>
 <CACeCKaetgayTS+yX0cuNiK7j6Yqd4o2ziX6nCoGTt64A3jFT=g@mail.gmail.com>
 <YrHE9KrF0HG9rVi/@kroah.com>
 <8f0501c5-84f2-10f1-ae06-4b3936c50b12@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f0501c5-84f2-10f1-ae06-4b3936c50b12@linaro.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 04:53:40PM +0200, Krzysztof Kozlowski wrote:
> On 21/06/2022 15:17, Greg Kroah-Hartman wrote:
> > On Wed, Jun 15, 2022 at 11:13:33AM -0700, Prashant Malani wrote:
> >> I should add:
> >>
> >> Series submission suggestions (of course, open to better suggestions too):
> >> - Patches 1-3 can go through the USB repo.
> > 
> > I will take patches 1 and 2 now.
> > 
> > seems the others need reworks or acks from the DT people.
> 
> I just gave for patch 3 and before for 4, so you can grab these as well.

They are gone from my queue, a resend with that ack would be good so
that I can pick it up easier.

thanks,

gre gk-h
