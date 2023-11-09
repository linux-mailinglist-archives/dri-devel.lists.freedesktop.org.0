Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D727E6BB1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 14:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC2110E07E;
	Thu,  9 Nov 2023 13:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD6210E07E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 13:53:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 85BF7CE12E2;
 Thu,  9 Nov 2023 13:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AA7C433CA;
 Thu,  9 Nov 2023 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699538032;
 bh=wtPUeiA+I6ad8aRGSlFcAhsZfkiaITLloz41OLGVENw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Jn7kkk6WchGOxug47N5i0HZsLreIHNUVul8Tjil5j+4aVh7akKJzHaRDzdMsK4oe3
 yFhrjZzxzyesqzqcHi0jJomnj4WmhiThqRqXUzXl4T1QX1dWgkgD/0sT64yPp6qY+r
 FqNSngUFQ9I/+jD0xAKHr6NhKUTfp6tS7ai3A2eHU2mua575UijVLC7Wd/OpB+9Ijz
 9rfF9LEgoC9D0PMhM+6N7rSdBnBa6Jv2XbA7bE2ef6pXdpNK0vuOQKHOF1f5r4FCsZ
 qu3BEatlr5/7dkDdLKqi11eCD0CGZgBnwIH/8q/FEYxDCb4DK/zD/DesZKP4WiUrAY
 q3dtmwucuXeaA==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20231025132428.723672-1-mripard@kernel.org>
References: <20231025132428.723672-1-mripard@kernel.org>
Subject: Re: [PATCH v2 1/2] drm/tests: Remove slow tests
Message-Id: <169953802992.1223125.15203154420245897827.b4-ty@kernel.org>
Date: Thu, 09 Nov 2023 14:53:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Oct 2023 15:24:27 +0200, Maxime Ripard wrote:
> Both the drm_buddy and drm_mm tests have been converted from selftest to
> kunit recently.
> 
> However, a significant portion of them are trying to exert some part of
> their API over a huge number of iterations and with random variations of
> their parameters.  They are thus more a way to discover new bugs than
> actual unit tests.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

