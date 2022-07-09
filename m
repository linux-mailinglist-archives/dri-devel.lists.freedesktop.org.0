Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D8056C80F
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 10:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4645610E78F;
	Sat,  9 Jul 2022 08:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B5410E78F
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 08:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=mO4Lux4zExqJwsq693AgROuTl+x+kJdHNbYuPHKBSt4=;
 b=TgVX/ijFEvLZEAqewwRTuyPLSpy25GpVpFYJQKtA8fSYi5/MA0aNiH7u2/YEYlkiQoa6P7ORPk6PG
 yOZWahlzVNMziT/ht5UMBtysZT773tSz69WcQwX5+dpfwmO/jUAtMNc+rxn/5vS9c+gc7+20uZP3Dk
 ZJDw7fVFLkItZnveY70UQbGYe2Vow5SSniP6aJKrUUbkrSsOjkqmE4zxLTg9MlQbFB6+ZboyeAqFDu
 DMxtTpXco05ux0xRTZMnnAHWhL5rz0aPeUrDLSbIEFjCWkePOuAxphr804WR4N2R1cO5RvEsrks+tW
 tO1dnb8c1kCYG1n3bkdfOvHyvTpU1jA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=mO4Lux4zExqJwsq693AgROuTl+x+kJdHNbYuPHKBSt4=;
 b=w9p/xLtYiE38/MV3LPBUup56d572jke4BSd/+BvCTTJzjswWF+S0dSaRFE3NsFFCB3Y8WIOTP/EFY
 sICDM1ZCQ==
X-HalOne-Cookie: 7fd59b46a51611b99b6b071a385538c9ebf1830c
X-HalOne-ID: 91d73c41-ff61-11ec-823c-d0431ea8bb10
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 91d73c41-ff61-11ec-823c-d0431ea8bb10;
 Sat, 09 Jul 2022 08:31:46 +0000 (UTC)
Date: Sat, 9 Jul 2022 10:31:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/6] drm/ingenic: JZ4760(B) support and random changes
Message-ID: <Ysk88cZO1iQhX/I2@ravnborg.org>
References: <20220708205406.96473-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708205406.96473-1-paul@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 list@opendingux.net, Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On Fri, Jul 08, 2022 at 09:54:00PM +0100, Paul Cercueil wrote:
> Hi,
> 
> A small set of changes to the ingenic-drm driver.
> 
> The most notable thing is that ingenic-ipu is now its own platform
> driver.
It would be nice to know what is achieved by this change, I could
see the code being a tad simpler, but the cost was more EXPORTs.

With the added explanation, which you can add when applying, all patches are:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
