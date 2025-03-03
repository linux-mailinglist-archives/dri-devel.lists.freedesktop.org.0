Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91523A4C1D8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046E388EBA;
	Mon,  3 Mar 2025 13:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AE2vC9EL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB5188EBA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:25:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4D0BD5C58F4;
 Mon,  3 Mar 2025 13:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D43CC4CED6;
 Mon,  3 Mar 2025 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741008329;
 bh=wdhoR6ywow1PwN5lQx32sLFLsyyGs0zWpCWAU/kybBw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AE2vC9EL+ZJH5AFoHN1UKXS2gOyOcmx1+SvK2w7Uf2aPcon+J2diYucaWf2XPXKan
 6alVVReitG6Nqb8N9a5rWIhA0l+8EFEeGooHKwrojhEEvPQ6QmbIoxfhqX2VOql2A2
 VWMWrNTPzQDiUqOKGak5WVDbOzkwb1rpNxFueUhlZ4QRKxYWDKzXYLdL8WQbni7F3P
 6nKKRi71wdGzy6RSYizLyBewg1tf6Goi0NWhiwTlmwdwzMQBy5Xo7GuwfHAN8KG6Pf
 c3ZA1llyqOzFf73lnYpdou3nwcRy+hiRbRQHZXN1b4bifkaIO3RGbO1O2/H9S0V8oN
 xvC8zztWQrV7g==
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/vc4: hdmi: Fix some NULL vs IS_ERR() bugs
Date: Mon,  3 Mar 2025 14:25:25 +0100
Message-ID: <174100832301.41636.4338334342828265261.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <a952e2b4-d4b8-49ac-abd9-9967c50f4a80@stanley.mountain>
References: <a952e2b4-d4b8-49ac-abd9-9967c50f4a80@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 28 Feb 2025 12:38:17 +0300, Dan Carpenter wrote:
> The devm_platform_ioremap_resource_byname() function doesn't return NULL,
> it returns error pointers.  Update the checking to match.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
