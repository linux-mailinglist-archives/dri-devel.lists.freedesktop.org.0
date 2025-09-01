Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A4B3E704
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 16:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EBA10E110;
	Mon,  1 Sep 2025 14:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="E0P6N9GZ";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="wf4Bv+fX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF2110E0EF
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1756736766; bh=8KShl1tm1BjlFSbDUsFgucKEyf5Ghvv9NMK2L8THTz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E0P6N9GZbbkjRIskjMa+wtonmwVN4GP9bxeH7qZLfdq35v5W3VvR/dshN+MJvyXKQ
 9HGkP21A2du+9UcmIjzS9ZgR3chEoB0tm9ISLhwGe+fhCyOWdp565Nv4tRdVtOAvFO
 SW27zqiTd9zktm9cDXWK3xxYTxlnuvI5LONy52j0MnkFDy3EUs6jeKhCJDJioxxZJY
 rnFcPaqbMyi2dKhWw7/Gu3R0mh7HNgNSDAuRLNasS8ooCo5TztU1AHbqeOghcuEs5r
 OyjeYszlfoMRR77nr13YKeXVUwXqOGQUNqy0B6xk4gOsn6nLJQGG3xL+oj9WzF5tDK
 O23qYVe1+/HSA==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 06852FB07;
 Mon,  1 Sep 2025 16:26:06 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1a6Wgjm3wm5o; Mon,  1 Sep 2025 16:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1756736764; bh=8KShl1tm1BjlFSbDUsFgucKEyf5Ghvv9NMK2L8THTz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wf4Bv+fXrvZ08K5yU/Laf5fNYUpRkUhVpTTVVbEybJVUG6ppyGpgICxnvNGYQCXjh
 ECu9ornzdB6Sjud/OaeMVEpxDpG4cGVPgLaWuyvFNUX9eTU1/WlXmRGE4xvPzGGtWN
 ZnfEBCcaA7fFCN1skP53LcA1TbU2foAo0w9AHnKjKYU74aIH9HV9bH3aJeRVJaKdSp
 Lhu0yEJXoXahUqgmePv/suwWlvUmcIDyAOFJSFT9CZD66tG6cpaDXspPjwTr4gPzmZ
 bQYMdDmdvmV8d/t3VwZbOIgWqHYxirGAhudfbyMvVjl6XDNRdS4zIZI8GeYoF9zi7r
 txIJFZh1pg7yA==
Date: Mon, 1 Sep 2025 16:26:03 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Casey Connolly <casey.connolly@linaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: visionox-rm69299: Fix clock frequency for
 SHIFT6mq
Message-ID: <aLWs-z_bYmuld3q9@quark2.heme.sigxcpu.org>
References: <e975da213c1f8030db50d66ec1c9597f59f25e35.1756567474.git.agx@sigxcpu.org>
 <e92049c6-1d90-482f-ad4f-0c88bb96989e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e92049c6-1d90-482f-ad4f-0c88bb96989e@linaro.org>
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

Hi Neil,

On Mon, Sep 01, 2025 at 02:24:48PM +0200, Neil Armstrong wrote:
> On 30/08/2025 17:29, Guido Günther wrote:
> > Make the clock frequency match what the sdm845 downstream kernel
> > uses. Otherwise we're seeing timeouts like
> > 
> > ```
> > msm_dsi ae94000.dsi: [drm:dsi_cmds2buf_tx] *ERROR* wait for video done timed out
> > dsi_cmds2buf_tx: cmd dma tx failed, type=0x5, data0=0x28, len=4, ret=-110
> > panel-visionox-rm69299 ae94000.dsi.0: sending DCS SET_DISPLAY_OFF failed: -110
> > ```
> > 
> > Signed-off-by: Guido Günther <agx@sigxcpu.org>
> > ---
> >   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> > index 909c280eab1fb..e65697ce6f51c 100644
> > --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> > +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> > @@ -247,7 +247,7 @@ static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
> >   };
> >   static const struct drm_display_mode visionox_rm69299_1080x2160_60hz = {
> > -	.clock = 158695,
> > +	.clock = 149360,
> >   	.hdisplay = 1080,
> >   	.hsync_start = 1080 + 26,
> >   	.hsync_end = 1080 + 26 + 2,
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks! I noticed I made a small mistake: the timeouts in the log were
unrelated but the clock change in itself is correct and needed to make
the panel show an actual picture. I've corrected that in the commit
message and folded the patch into more changes for the driver:

  https://lore.kernel.org/phone-devel/20250901-shift6mq-panel-v1-0-444b4abbfaea@sigxcpu.org/T/#t

Cheers,
 -- Guido
