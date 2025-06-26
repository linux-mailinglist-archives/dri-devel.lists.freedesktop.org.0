Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB9AAE9B1A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 12:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B2110E0BA;
	Thu, 26 Jun 2025 10:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="C+JGQTgl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1859A10E0BA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 10:21:30 +0000 (UTC)
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 866231FA9F;
 Thu, 26 Jun 2025 12:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1750933288;
 bh=8mDX2mVu5psUDXip/UEM+GhL2PEeUin4P89BMTdn6xc=;
 h=Received:From:To:Subject;
 b=C+JGQTglztBCnKVPAZCdr5iMERa2OSCeP4znfS4XhVyRD1GOS4D5ZVYSRgm4G0CYt
 QBWL5HmEAMG2/52afkE8PDl1zSqpJbuBxAWx1fIXa/Z6S+sPvOGZLUID7vEGoHUL27
 6LrRoAwHs5aDVd5fSxjfgOUA0ZOYMg2AJmp2JfAChJUt7UQHrzT+O5z6gVEB+uPqIz
 jeqfRsAOjpgYGhpFNE9e00h5Aq4LP7DVZiD4WpZYoXqQtv/uCu7aMpYW/e+PIo2owP
 Vt/ssRmyTPb0ZqYGBMQ+pdTiBYNLu/StnvxsoCMdvSClI6h9Z1ZFLKuGsymbUtTvsj
 I8ifHMV6XgFcQ==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
 id 2E5177FA06; Thu, 26 Jun 2025 12:21:28 +0200 (CEST)
Date: Thu, 26 Jun 2025 12:21:28 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Message-ID: <aF0fKHQywtoG63wT@gaggiata.pivistrello.it>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
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

Hello Maxime,
it works for me, thanks!

On Thu, Jun 26, 2025 at 12:04:58PM +0200, Maxime Ripard wrote:
> Here's a series fixing (hopefully) the panel-simple regression for
> panels with a panel-dpi compatible.
> 
> It's only build tested, so if you could give that series a try
> Francesco, I'd really appreciate it.
> 
> Thanks!
> Maxime 
> 
> Link: https://lore.kernel.org/dri-devel/20250612081834.GA248237@francesco-nb/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

For the whole series,

Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com> # Toradex Colibri iMX6

Francesco

