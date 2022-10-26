Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 558B260E3AD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 16:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9728610E2AA;
	Wed, 26 Oct 2022 14:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EEE10E2AA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 14:47:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B0DA9CE22F9;
 Wed, 26 Oct 2022 14:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2955C433D6;
 Wed, 26 Oct 2022 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666795665;
 bh=X2UhieQC0vkYAuIOP+R8NvoQajm/xqAszoQi26wF+rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hi8TM+flyocLYcbgEdcchBVnwTOr18yT+pNUXD+8TpjnWt8NNNaXCgmCqrEl7zeL2
 C4T3z5y7Wj2qGmv+KoM3gJEtGLwOqlpHBmPsc9blKH5yDOicE4ICVIaycOKG6ZyBDw
 bwR6o6kQmaAIsIzfEI0T5+mQ1dn6MlzBpOjPf42o=
Date: Wed, 26 Oct 2022 16:47:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] video/aperture: Call sysfb_disable() before removing
 PCI devices
Message-ID: <Y1lIjt3awUj3MNIz@kroah.com>
References: <20221026144448.424-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026144448.424-1-tzimmermann@suse.de>
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
Cc: sashal@kernel.org, linux-fbdev@vger.kernel.org,
 Andreas Thalhammer <andreas.thalhammer-linux@gmx.net>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 deller@gmx.de, javierm@redhat.com, stable@vger.kernel.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 26, 2022 at 04:44:48PM +0200, Thomas Zimmermann wrote:
> Call sysfb_disable() from aperture_remove_conflicting_pci_devices()
> before removing PCI devices. Without, simpledrm can still bind to
> simple-framebuffer devices after the hardware driver has taken over
> the hardware. Both drivers interfere with each other and results are
> undefined.
> 
> Reported modesetting errors [1] are shown below.

Now queued up, thanks.

greg k-h
