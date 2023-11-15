Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 853CB7EC1E2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 13:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EF010E070;
	Wed, 15 Nov 2023 12:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA7710E070
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 12:11:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BCDBBCE1CFF;
 Wed, 15 Nov 2023 12:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8CFC433C7;
 Wed, 15 Nov 2023 12:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700050300;
 bh=ZXoSnXWsERn/N+r/CYTaTn63bZ2yFqm+Ow/x7XJHIH0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Qk1c++jtUqZ0wE+CyEnTXBDOu1546+yBeP8MYpWVR4TclCtUCDinw6/VDhD7dQhrF
 9F7e0N2xiPm22eYnsLxqoL2pSVrBiMJ1OISG2gyRj8dL2wdrLhyg63RG7r4CCmVyqX
 7l9SxaEn5Mlheg8PXxWnY49CtOw3nVLOkB4iVe2d/LNgi/yIOiqYfqoUoNv6M74JvQ
 Wc99L032FrInN67+iReePgr3z2ab/7Wyak7HVD9WnGR6lNw687wZ5YzcDMElmNTQnt
 C5B2QVBfFGJFI86ybJoi4WjRlYdssPB7yiOtYBQPkTY9efeY4ao72hgXlbWpARfIxT
 hc6zSp9b5iBCA==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Marco Pagani <marpagan@redhat.com>
In-Reply-To: <20231115103537.220760-1-marpagan@redhat.com>
References: <20231115103537.220760-1-marpagan@redhat.com>
Subject: Re: (subset) [PATCH] drm/test: rearrange test entries in Kconfig
 and Makefile
Message-Id: <170005029806.2887518.7822762472748927207.b4-ty@kernel.org>
Date: Wed, 15 Nov 2023 13:11:38 +0100
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 11:35:36 +0100, Marco Pagani wrote:
> Rearrange entries in Kconfig and Makefile alphabetically to make room
> for additional KUnit test suites.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

