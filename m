Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205C24FC2A1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4199E10E36B;
	Mon, 11 Apr 2022 16:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947C110E36B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ywMVhSEFkN4mzs+qI1NZFYlVwjUyxkmwC2V8xkVVnig=; b=UPr1Qp19XniZt+jXu4IHa7s8Uu
 keqS3xWEmFILdNZ00HgP+FZ3uNjEgu9XuRFg8BLmuHExfGN0pkUcd1OPH/tV98X1J3c4WYcm1EQ00
 waptQVi+41dEgH2Hmg2lLwYeo+95XXMUENm2ojB07p3vpZ4IvTiOlURARgtMDUYnWQ03og8YUR7aQ
 KlHh91+5fqfCAXUFz1NjYOzWxQdTBJwjjRg5IwoYlieAdwvo3wtl68/f/YjoFZwFXhoKy3nVKj124
 6Olzxt9SjMpHYgvQV6P6bCkNHfd1OqEQTkzuXURfPv3E9DsQsXRcjV1SQim9Ty4cAKXet/LHTPabk
 Ysba34dA==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=56750)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ndx7G-00057l-Fw; Mon, 11 Apr 2022 18:42:14 +0200
Message-ID: <470e0789-98ab-0904-edfa-6541467a6b9c@tronnes.org>
Date: Mon, 11 Apr 2022 18:42:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] drm/panel: lvds: Drop now redundant width-mm and
 height-mm check
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20220411004728.68203-1-marex@denx.de>
 <20220411004728.68203-2-marex@denx.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220411004728.68203-2-marex@denx.de>
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
> The check for mandatory DT properties width-mm and height-mm is now
> part of of_get_drm_panel_display_mode(), drop the redundant check
> from this driver.
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
