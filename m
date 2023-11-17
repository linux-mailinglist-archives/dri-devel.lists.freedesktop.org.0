Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE007EFB2A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 23:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3E710E14C;
	Fri, 17 Nov 2023 22:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF8710E14C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 22:06:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49B0F61DB1;
 Fri, 17 Nov 2023 22:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29711C433C8;
 Fri, 17 Nov 2023 22:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1700258810;
 bh=oP9++cMx5+6UXwQgBcFzAbEHfnbgh5sQ75FUpsTUX8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YLhB9GtaqrfMAKBiDQZkO4Ru3mBj476+A6koG90qahSLgynXhEEM41cMah+S36VUI
 AGIpe+TlQ1J0leEiUWlRExwy92C39hmrHDDgenrD5QURbif/GKoekfOSFggTqCPX+T
 MatUkUsSIsUqqpjY1hflwPTT8dLWAPYrOynrh0EE=
Date: Fri, 17 Nov 2023 17:06:47 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v7 1/3] drm/panel-edp: Add override_edid_mode quirk for
 generic edp
Message-ID: <2023111738-bondless-sketch-f201@gregkh>
References: <20231117215056.1883314-1-hsinyi@chromium.org>
 <20231117215056.1883314-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117215056.1883314-2-hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 01:46:32PM -0800, Hsin-Yi Wang wrote:
> Generic edp gets mode from edid. However, some panels report incorrect
> mode in this way, resulting in glitches on panel. Introduce a new quirk
> additional_mode to the generic edid to pick a correct hardcoded mode.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> v6->v7: split usecase to another patch.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 48 +++++++++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 3 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
