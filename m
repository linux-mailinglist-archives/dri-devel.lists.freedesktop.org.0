Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF75A733655
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 18:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0423710E66A;
	Fri, 16 Jun 2023 16:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5C710E66A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 16:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=B7SGOkiscnERiAu/chzqiMg1nhVPxRPZ/YgqKvyvPsE=;
 b=pSmSd9+anlIP0e76+zXPTo/HA52x7Mm5ZEZqKmavfPuFcWVHLZqD2Uu3jQ4271LzkQwPnkhp20hUi
 i0DTepyLcVhdSS6XYQ/UiYDDmXgITvT7kKRLrloQlzBBoHdRfRmvxrhyMspaR0C3mYNtnSQZW/WJ9F
 CGbC61h/v6eLoKak1Dpn/ePWS6DM+yRiatk+o8ihPYa+HXi8+uU0cEPX0vIRyaRjsZV0t934nnliWu
 Mmmt48+WhUOZ6L8vLWvjC+XytoNuuuSCM7cdLCIhgb2yArbmXZOWu8q5pKHA90QyAN9k6WH7W2oktA
 itGo9HvDQo+472k2ZddrPZl3qkF+p4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=B7SGOkiscnERiAu/chzqiMg1nhVPxRPZ/YgqKvyvPsE=;
 b=xjRbRyrFD+VqtofV2snBUmCgShetOF1iVZX/2RRz6cM3nEtzIVAAWqqzlY3u1wWWr6hmbMPLeUJ7V
 6Ycf0bECg==
X-HalOne-ID: 13ef398d-0c65-11ee-9b26-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 13ef398d-0c65-11ee-9b26-99461c6a3fe8;
 Fri, 16 Jun 2023 16:44:38 +0000 (UTC)
Date: Fri, 16 Jun 2023 18:44:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: boe-tv101wum-nl6: Drop surplus prepare
 tracking
Message-ID: <20230616164437.GC1697490@ravnborg.org>
References: <20230615-fix-boe-tv101wum-nl6-v1-0-8ac378405fb7@linaro.org>
 <20230615-fix-boe-tv101wum-nl6-v1-2-8ac378405fb7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615-fix-boe-tv101wum-nl6-v1-2-8ac378405fb7@linaro.org>
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
 Jitao Shi <jitao.shi@mediatek.com>,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus.

On Thu, Jun 15, 2023 at 10:21:38PM +0200, Linus Walleij wrote:
> The DRM panel core already keeps track of if the panel is already
> prepared so do not reimplement this.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

It would be good to rip it out for all panels so people do not copy
less optimal code.

	Sam
