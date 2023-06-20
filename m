Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6AA7374E5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 21:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A715110E0A0;
	Tue, 20 Jun 2023 19:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C491710E0A0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 19:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=+RZpYgFNCvrSeFhu6tkXemP5lBZUDvO0k9uNpbibveI=;
 b=Y8Guav07mntEC/WBf34HSfiyMuYWv4sJBvAesYxwy+NTEd6bfoLTFfYghFIlBRjqiU70RX/bq7YBT
 1t1mUYE1FCE1TGOU1peoc9P7079Qa2NG+3LV7+xCOy5NlEAKwXaFluLA0lUOMAtZP6BqQZ8tVyPcaE
 jydGUaxZuhjzw9a4dk7mvsmkoF3cKxFsiAW8e0roxV97t9Veo+l+LC+Ug30disgX+ZabcUAI1NaHKh
 vIIRz7NJbUlv7yNuYN7C5HauaKG4fdUBJlB0eM5iNKM0y6MJd54JhVe/kyuh2TjgCjTZ+sM0fjunxo
 NZB1AHMVypxq8GI3Pn295GgDrhE5ryQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=+RZpYgFNCvrSeFhu6tkXemP5lBZUDvO0k9uNpbibveI=;
 b=+tQY/5btjHGULo7TZplAK/XRuwduyuO5b6VLC1lOaeYMFSOs6PA3tIUoeGyCRdyGI4TlnFJI5FSrV
 jx9AC4bDw==
X-HalOne-ID: acf1b806-0f9d-11ee-90fd-5ba399456a4a
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id acf1b806-0f9d-11ee-90fd-5ba399456a4a;
 Tue, 20 Jun 2023 19:07:20 +0000 (UTC)
Date: Tue, 20 Jun 2023 21:07:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/bridge_connector: use
 drm_kms_helper_connector_hotplug_event()
Message-ID: <20230620190719.GA2194699@ravnborg.org>
References: <20230620175506.263109-1-contact@emersion.fr>
 <20230620185820.GA2192874@ravnborg.org>
 <Wa05vV4e8z9QQhDQelGxxOZ7pw1T5X0JxcJgvMN2F6G-LlG5M-LifebMp3chY4XpgiIEPjb3TtLObXgFKJkGa2eN_0Z2eczrfuHhE29Ja-8=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Wa05vV4e8z9QQhDQelGxxOZ7pw1T5X0JxcJgvMN2F6G-LlG5M-LifebMp3chY4XpgiIEPjb3TtLObXgFKJkGa2eN_0Z2eczrfuHhE29Ja-8=@emersion.fr>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

On Tue, Jun 20, 2023 at 07:01:59PM +0000, Simon Ser wrote:
> On Tuesday, June 20th, 2023 at 20:58, Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > On Tue, Jun 20, 2023 at 05:55:09PM +0000, Simon Ser wrote:
> > 
> > > This adds more information to the hotplug uevent and lets user-space
> > > know that it's about a particular connector only.
> > 
> > Will this change have impact on user space?
> > They will start to see CONNECTOR=n where they did not occur before.
> > Asking as I have not really worked with the hotplug stuff.
> 
> Yes. CONNECTOR is an optional udev event property indicating that only
> the specified connector has changed. User-space unaware of this
> property will just ignore it. User-space aware of this property will
> only refresh information about the connector instead of the whole
> device.
> 
> A few months back, we've converted calls to
> drm_kms_helper_connector_hotplug_event() in amdgpu and the DRM DP
> helper.

Thanks for the explanation - all is good.

	Sam
