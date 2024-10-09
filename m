Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33AC99670B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 12:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2069B10E6C1;
	Wed,  9 Oct 2024 10:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="erm6bTvP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE5310E6C1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 10:22:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3AD735C4571;
 Wed,  9 Oct 2024 10:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04BBC4CEC5;
 Wed,  9 Oct 2024 10:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728469355;
 bh=VFcBkxZ4J3EDCbEzwJmVFvS5hoL2XFg812Ad/nKdu6M=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=erm6bTvPLu+Jozq9xiK58EcfjyS+AmhhYmg7lUwo+0Yd8FF7osWGajOcNJQZ7Dk3Y
 0269RxtC7FzXlF/79CyKQfz67PP0qABXyI4nI1qJXYrdCCzAYXcA/kacOLNQjBHCb9
 e9IzEseQSiqSuMImoMQJGDnumS6c7o/kgEuFdolb51ORHiPqZFH/zfBrMVTifXRpC9
 B2GyOBGG3RzElY+DxBPM0l8Lgd7W+E8NZK54M7vHT6fhI/AdafVN8bMR3dnO6JUmV6
 Lfv9f/LaMtefr1DzdJ1aJn2sFushE/Q8NWmxhYH90owPj/ohA4s5DMaL8BVoG6s/HW
 DIXDmdAh5LA3g==
Date: Wed, 9 Oct 2024 11:22:30 +0100
From: Lee Jones <lee@kernel.org>
To: linux@treblig.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 hdegoede@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: Remove notifier
Message-ID: <20241009102230.GC276481@google.com>
References: <20240919232758.639925-1-linux@treblig.org>
 <ZvKgo8RUImafDRPE@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvKgo8RUImafDRPE@phenom.ffwll.local>
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

On Tue, 24 Sep 2024, Simona Vetter wrote:

> On Fri, Sep 20, 2024 at 12:27:58AM +0100, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > backlight_register_notifier and backlight_unregister_notifier have
> > been unused since
> >   commit 6cb634d0dc85 ("ACPI: video: Remove code to unregister acpi_video
> > backlight when a native backlight registers")
> > 
> > With those not being called, it means that the backlight_notifier
> > list is always empty.
> > 
> > Remove the functions, the list itself and the enum used in the
> > notifications.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> 
> I think Lee Jones or Daniel Thompson will pick this up.

I will pick this up with Daniel's review.

-- 
Lee Jones [李琼斯]
