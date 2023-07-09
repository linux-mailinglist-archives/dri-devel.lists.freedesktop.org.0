Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1774C4E9
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 17:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB4E10E0E5;
	Sun,  9 Jul 2023 15:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F053510E0E5
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 15:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=IxUPLHw0FPiyyKxSeKZzjQUU8i2S9vda9XMgZX1g1Nc=;
 b=lslyAkZWIbdxhnv8ykihgRmtk/n6fYeML1AfsCjUhFYlsVHJ2P5TdJGKUHvSNq/CMTr3Q+UmD6LwS
 moEDaYx+UBYCeVRK1sYbPBadVZCje3fyh3IQcQ+oLCfvlyI10D1yYX79WmGLTlChjW+EyW3crSimKu
 ttTKW7hm9U1n66g0FhLXfjKb/xPBu00etZfM1famC+h38WnG/wiXwyYNd6RI/KcEeJ91/0eKv0Ncea
 h0QU2BF7dHHBZEZX1Q0ekw00w5ZCrlYFTBU2kM0tDB6wpFytjwluB3TYg8KPjQKOVPTkuxo/6GlBPA
 SuljW+2EKSxZUIi7TcdDSEWcKScj6Nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=IxUPLHw0FPiyyKxSeKZzjQUU8i2S9vda9XMgZX1g1Nc=;
 b=USXpgflSKNf1Hx1sTED6B4/RDatjvb3oJifjvTGTXRp/Gi4lZeK3Oz5Pp2kv6b3Smq9pE66hqoivh
 h+Hw+iyBg==
X-HalOne-ID: 95cac7b0-1e6a-11ee-a031-55333ba73462
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 95cac7b0-1e6a-11ee-a031-55333ba73462;
 Sun, 09 Jul 2023 15:09:24 +0000 (UTC)
Date: Sun, 9 Jul 2023 17:09:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/panel: simple: Add missing connector type and pixel
 format for AUO T215HVN01
Message-ID: <20230709150923.GB697428@ravnborg.org>
References: <20230709134914.449328-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230709134914.449328-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 09, 2023 at 03:49:14PM +0200, Marek Vasut wrote:
> The connector type and pixel format are missing for this panel,
> add them to prevent various drivers from failing to determine
> either of those parameters.
> 
> Fixes: 7ee933a1d5c4 ("drm/panel: simple: Add support for AUO T215HVN01")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
