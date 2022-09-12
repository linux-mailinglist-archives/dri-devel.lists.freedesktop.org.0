Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A7B5B5C84
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 16:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E124910E592;
	Mon, 12 Sep 2022 14:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D6610E592
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 14:43:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [89.101.193.67])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BED83415;
 Mon, 12 Sep 2022 16:42:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1662993779;
 bh=ccRPjt0jL/UArIKLQwcpBPxkVwm+dSo2VE+EeGx2Jw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jIQgVsn9h1zSrmVuKQzOs283pXk+5ETPcGdanQnVGYGBK1v9q6ejPUBZO4nRzmcn1
 fv/2NJIf7oiAGALopLXDm3v5n0bAtgAKLVmb9H5t2Kg3IOF65H18ZC7yA3GbOPMDx4
 HdpB94ETAodNmFUvXsj2dLnzezfbYwGm+KSRi+3w=
Date: Mon, 12 Sep 2022 17:42:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 2/2] Revert "drm/bridge: ti-sn65dsi86: Implement
 bridge connector operations for DP"
Message-ID: <Yx9FZDKjOcS9wmcI@pendragon.ideasonboard.com>
References: <20220912113856.817188-1-robert.foss@linaro.org>
 <20220912113856.817188-3-robert.foss@linaro.org>
 <CAD=FV=WrH2AAFxV72FZqk-=xU8jzCn6KtcbZRYJAaCwhmvSWmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=WrH2AAFxV72FZqk-=xU8jzCn6KtcbZRYJAaCwhmvSWmg@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Chris Morgan <macromorgan@hotmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 03:29:52PM +0100, Doug Anderson wrote:
> On Mon, Sep 12, 2022 at 12:43 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > As reported by Laurent in response to this commit[1], this functionality should
> > not be implemented using the devicetree, because of this let's revert this series
> > for now.
> >
> > This reverts commit c312b0df3b13e4c533743bb2c37fd1bc237368e5.
> >
> > [1] https://lore.kernel.org/all/20220902153906.31000-2-macroalpha82@gmail.com/
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 28 ---------------------------
> >  1 file changed, 28 deletions(-)
> 
> Any chance you got confused and reverted the wrong patch? This
> ti-sn65dsi86 patch doesn't seem relevant to the problems talked about
> in the commit or the cover letter. Maybe I'm missing something?

Aarghhh I missed that when checking the cover letter :-( This indeed
seems wrong.

-- 
Regards,

Laurent Pinchart
