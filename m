Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2407A58968
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 00:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEB810E37D;
	Sun,  9 Mar 2025 23:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hUuWq3Up";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FDD10E37D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 23:56:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 99880A45D89;
 Sun,  9 Mar 2025 23:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AA5C4CEEC;
 Sun,  9 Mar 2025 23:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741564608;
 bh=LddSs4hgGqDTjpXUGJlPBDoaDhWj28W3bV0A08SN7UU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hUuWq3Up4ke7Bjslgu8Mcc/mNbS27HB7l6si5f+DgUOK9Qt0XXPXhzrRdE6lvo9gm
 FagZYvpT3Kvh+Nth3ceMziAUkBR3l2U3qqZipJUEi1jlifYs6XU2XD22WZUmenn8ez
 x81IFfvfwk7H8TlW4biiH3tUqxtlDfCT9ldkvdC7F7jfI/QAYyPaU+tnTD81d+BkU+
 bmI67q3XECknylAsKJJx+D4aqvgERn4ANq4ZPlRY3sPuxyWld8PefbSc+QPgLMIGvC
 P2EW5KHpwiXA8bykNYP6uz1apllP41yxO7OuoqG+ey/mt9O4bGExp68tPpS8mhltTJ
 IyUxqIJoADe8g==
Date: Sun, 9 Mar 2025 23:56:47 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, deller@gmx.de, akpm@linux-foundation.org,
 linux-hyperv@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ssengar@microsoft.com, mhklinux@outlook.com
Subject: Re: [PATCH v3 0/2] fbdev: hyperv_fb: framebuffer release cleanup
Message-ID: <Z84qv4Fp-A254kTk@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <1740845791-19977-1-git-send-email-ssengar@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1740845791-19977-1-git-send-email-ssengar@linux.microsoft.com>
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

On Sat, Mar 01, 2025 at 08:16:29AM -0800, Saurabh Sengar wrote:
> This patch series addresses an issue in the unbind path of the hyperv_fb
> driver, which is resolved in the second patch of this series.
> 
> While working on this fix, it was observed that hvfb_putmem() and its
> child functions could be cleaned up first to simplify the movement of
> hvfb_putmem(). This cleanup is done in the first patch.
> 
> Although hvfb_getmem() could also be cleaned up, it depends on
> vmbus_allocate_mmio(), which is used by multiple other drivers. Since
> addressing hvfb_getmem() is independent of this fix, it will be handled
> in a separate patch series.
> 
> [V3]
>  - Add a patch 1 for cleanup of hvfb_putmem()
>  - Use the simplified hvfb_putmem()
> 
> Saurabh Sengar (2):
>   fbdev: hyperv_fb: Simplify hvfb_putmem
>   fbdev: hyperv_fb: Allow graceful removal of framebuffer

Applied to hyperv-fixes, thanks!
