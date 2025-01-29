Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D55A21ADF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 11:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3AE10E78C;
	Wed, 29 Jan 2025 10:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Kf/FdR2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD07810E78C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 10:18:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F309C1BF20C;
 Wed, 29 Jan 2025 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738145909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Ikvj6UjZQiJ/OilPNPj7S6f1HouQmJjaj4l9C8Zbbk=;
 b=Kf/FdR2o28EeNBUf2gKzGzNXzvipHdeCtNy3XoMkcDm49cGsIoj5DU2YGjgQ2oPetY7EpA
 QNcSyxi9cbrXfuTHML24K907RHLZcEG7gIgWzaXyY8/FTPZiGUExcVPDRopkNl8Aer2Ctq
 qMFRmcFcIDx4g0/brpUlPa6yYMEPp8+jcf4z+/7VedcW8/qYm43VyAWuFy6vb02fo5FR4z
 3HH8L2YWheMuWuQLyKfcNTeqjej9OGH2TcTsYO8/P3r2sUjf1pxiRdCLb4vDF7UeqrDjkz
 sMQwpl/OEkYSkQeLHNvJeEoEuckKk3HIbgO1qxkh+OXQePqe86zExrSvx5S4zg==
Date: Wed, 29 Jan 2025 11:18:26 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Paz Zcharya <pazz@chromium.org>
Cc: Sean Paul <seanpaul@google.com>, Drew Davenport <ddavenport@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vkms: Add support for ABGR8888 pixel format
Message-ID: <Z5oAcugIxU6zdROD@louis-chauvet-laptop>
Mail-Followup-To: Paz Zcharya <pazz@chromium.org>,
 Sean Paul <seanpaul@google.com>,
 Drew Davenport <ddavenport@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20250127235956.136032-1-pazz@google.com>
 <Z5irsdEc6Ex2v_eP@louis-chauvet-laptop>
 <Z5jzBe48aaImd4F4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5jzBe48aaImd4F4@google.com>
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

On 28/01/25 - 15:08, Paz Zcharya wrote:
> On Tue, Jan 28, 2025 at 11:04:33AM +0100, Louis Chauvet wrote:
> > On 27/01/25 - 23:59, Paz Zcharya wrote:
> > > Add support for pixel format ABGR8888, which is the default format
> > > on Android devices. This will allow us to use VKMS as the default
> > > display driver in Android Emulator (Cuttlefish) and increase VKMS
> > > adoption.
> > > 
> > > Changes in v2:
> > > - Rebased on top of tip of tree because it has been 3 months.
> > > - No functional changes.
> > > 
> > > Signed-off-by: Paz Zcharya <pazz@google.com>
> > 
> > Hi Paz,
> > 
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > 
> > When applying a patch I got a small warning about a missmatch between your 
> > author email and the Signed-off-by:
> > 
> > 	-:106: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Paz Zcharya <pazz@chromium.org>' != 'Signed-off-by: Paz Zcharya <pazz@google.com>'
> > 
> > I can fix it for you by adding a Author: / changing the Sign-of-by before 
> > applying on drm-misc-next.
> > 
> > What mail do you want to use? pazz@google.com or pazz@chromium.org?
> > 
> > Thanks!
> > Louis Chauvet
> 
> Thank you for the quick review, Louis!
> 
> Let's use pazz@google.com.
> I apologize about the mistake -- I'll make sure to fix that in the
> future.

And I just noticed that "changes in v2" is in the commit log. It should 
not be there.

To add a changelog, you must put it after ---, so in your case your commit 
should be something like:

	drm/vkms: Add support for ABGR8888 pixel format

	Add support for [...] adoption.

	Signed-off-by: Paz Zcharya <pazz@google.com>

	---

	Changes in v2:
	[...]

Can you send a "real" v2 with the correct commit message and the correct 
author?

If you don't know it, you can use b4[1] to help you manage your series and 
iterations.

[1]:https://b4.docs.kernel.org/en/latest/

 
> Greatly appericiate your help!
> 
> Thanks a lot,
> Paz
> 
