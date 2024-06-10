Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7B99021E3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 14:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1C310E371;
	Mon, 10 Jun 2024 12:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="i0ShZLRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B008810E371
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 12:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1718023677; bh=+ecHLff7v1OpVQFUWVfCE9rGpM2sM5huV/0sdhzdtVw=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=i0ShZLRmqI9v9z2T54xJpJpCVR+0XfKrrmbHrBWPfwLyQxzaIrE/THGBNslgtTeVn
 fdNvdGMyM+gc8hFllcAVpaeu2i6jeLH9ZbnJMvoyIVF+iwCcuT9n5o83hGo6Rb0U4y
 M9V0DFz/BmnF+wVU9CuUE/WWSuwG1QzV2kvUCCjc=
Date: Mon, 10 Jun 2024 14:47:57 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/3] Move blender setup from individual planes to crtc
 commit in sun4i-drm
Message-ID: <55gzdgev6oq5mqc5rdybncn4yc3jahqrfqbldkfftyn2s25o3k@kysjowztftde>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240224150604.3855534-1-megi@xff.cz>
 <171801637114.423417.15912541590264684056.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171801637114.423417.15912541590264684056.b4-ty@kernel.org>
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

On Mon, Jun 10, 2024 at 12:46:11PM GMT, Maxime Ripard wrote:
> On Sat, 24 Feb 2024 16:05:57 +0100, Ondřej Jirman wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> > 
> > This series refactors blender setup from individual planes to a common
> > place where it can be performed at once and is easier to reason about.
> > 
> > In the process this fixes a few bugs that allowed blender pipes to be
> > disabled while corresponding DRM planes were requested to be enabled.
> > 
> > [...]
> 
> Applied to misc/kernel.git (drm-misc-next).

Thank you. :)

Kind regards,
	o.

> Thanks!
> Maxime
> 
