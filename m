Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BFA807093
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C9C10E71B;
	Wed,  6 Dec 2023 13:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BFF10E051
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:10:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8580E61CAE;
 Wed,  6 Dec 2023 13:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE206C433C8;
 Wed,  6 Dec 2023 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701868220;
 bh=h9KWpohyTTR3pTq0NasEcVnQ4d28IL9h85MEdUeIIK0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EPvHc7hY/n7aNn4K0+fbS9tNtpE4h3wneK9nI/9mhJZtawvSq6BdhQYu2mMnimYaT
 8L9nhgbracmjU6JuMzv8Mc5JksS5UYPnSXlvW481bxAVtaKuVzlVG0BG0jB/HX5ZiZ
 O/fgZsW12TkNt7P/zT/gREKO3uMn0FwteP9SfGGGP8/2+Scr2xQGE0oMwfM9gNBgY9
 c8/PO8qgnkJFdivu6dl2kqLjpQSny1wFq8Sp1yPUEBrRDTe3W8IVzhdy5aN/LGf/vy
 XJPr6IELbXQjivPkFk8TVp3dcnEXwzAV7UHXMVw1aQ3V56kSjBzg5zldiyaWOzJ0h5
 6+Up6o37toN1g==
From: Maxime Ripard <mripard@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Sarah Walker <sarah.walker@imgtec.com>, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20231204073231.1164163-1-arnd@kernel.org>
References: <20231204073231.1164163-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] drm/imagination: move update_logtype() into
 ifdef section
Message-Id: <170186821781.357447.7620047835600780144.b4-ty@kernel.org>
Date: Wed, 06 Dec 2023 14:10:17 +0100
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 04 Dec 2023 08:32:10 +0100, Arnd Bergmann wrote:
> This function is only used when debugfs is enabled, and otherwise
> causes a build warning:
> 
> drivers/gpu/drm/imagination/pvr_fw_trace.c:135:1: error: 'update_logtype' defined but not used [-Werror=unused-function]
> 
> Move the #ifdef check to include this function as well.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

