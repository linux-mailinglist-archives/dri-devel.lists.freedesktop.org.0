Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC0B4FC29F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E1F10E48E;
	Mon, 11 Apr 2022 16:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F4010E36B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rjVBHFdIYpE0HE+q4aXz1bkAcg+tGno6YXabxyB8IqU=; b=ErNAvg6Yd6he1lCezE/huC4zXf
 ViOOJzTpWAp/2hrzLQE1npL5xqPQQYH6kDHj+FpxswFvjK++pXDACPkh+fFo+rxh9aw+LFC9NMOr9
 g+N7LSN88JIwWhIbTI5uAr9FeSzfwPzAMvshforGlqL/pZPJBRcAoJrp2SJo/O+K1WZlGS8ZhLDES
 4rZtS+0L3tpTeeer4F4vWr1W32Kc6RXuiOnn0wa14MjVH5TRFR0M5NlZtRDt1qZYWNBzYZ3Yo7pSX
 H+IOCatCVsIFYhLebdCeSmhgF8qiFcejjv9wHAsfhsLAuURUpeVxYYRGqpIJyp32LOLG4AuPhelEI
 v4pknZTg==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=56737)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ndx6q-000517-5F; Mon, 11 Apr 2022 18:41:48 +0200
Message-ID: <dcfde0da-d4ec-e7ee-641c-d806e2eddf47@tronnes.org>
Date: Mon, 11 Apr 2022 18:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/modes: Make width-mm/height-mm check in
 of_get_drm_panel_display_mode() mandatory
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20220411004728.68203-1-marex@denx.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220411004728.68203-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, robert.foss@linaro.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 11.04.2022 02.47, skrev Marek Vasut:
> All users of this function require width-mm/height-mm DT property to be
> present per their DT bindings, make width-mm/height-mm check mandatory.
> It is generally a good idea to specify panel dimensions, so userspace
> can configure e.g. scaling accordingly.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
