Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EE556C82B
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 10:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D281310FF63;
	Sat,  9 Jul 2022 08:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B2410FF63
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 08:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=a/etUxJvUZ7VsOvxKXGQRMYQdxPjcKSao39BKwK+g5o=;
 b=eB6HM7zuFgBSWZDpn/VmoilXnqoLjbOykUP9rNEb97cP7refGjsCvXfQh5UoOFImgHJykFg7gvfVu
 m58lPkNJCQY2EEQS27/p/PyasoLpMbh3PF0WmhEfb3EdTrpIwlL/EHQnuysFvDgRmEdhb2Pbvy5IYb
 5qdLzMJTDHbt1ehka59zxOdhI0H5nPzzzhC1u0LUK3GieqjppR0grTUBrY1geybaBS8dYJ1GXfo+As
 3FpSGqlW78NFWXOQShNCI/B/r00vtu3vJ37ZhMT0aQo+y8pevk6kyiXTs+xHf2OfoLm7/mncZWgk1U
 OPbkN/80C7hNnScsmmACM5erN16Aqcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=a/etUxJvUZ7VsOvxKXGQRMYQdxPjcKSao39BKwK+g5o=;
 b=qnw769rIuh6xZM2T7MzF+iFCeYKroklxwDBxRaDss+/ZrMpVt3URZEM/919hTTrSmE+iJtrvoUGnf
 Ru3cRsFCg==
X-HalOne-Cookie: e30285ddbb863a4d4c6cd1d1d4f5ece6af4d2934
X-HalOne-ID: 4bf04b3c-ff64-11ec-a6c6-d0431ea8a283
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 4bf04b3c-ff64-11ec-a6c6-d0431ea8a283;
 Sat, 09 Jul 2022 08:51:17 +0000 (UTC)
Date: Sat, 9 Jul 2022 10:51:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/panel: simple: Make panel_simple_remove() return
 void
Message-ID: <YslBhN2zQxnGJ6xY@ravnborg.org>
References: <20220708094922.1408248-1-u.kleine-koenig@pengutronix.de>
 <20220708094922.1408248-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220708094922.1408248-2-u.kleine-koenig@pengutronix.de>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On Fri, Jul 08, 2022 at 11:49:20AM +0200, Uwe Kleine-König wrote:
> panel_simple_remove() returns zero unconditionally. Make it return no value
> instead making more obvious what happens in the callers.
> 
> This is a preparation for making platform and mipi-dsi remove callbacks
> return void.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed and applied to drm-misc (drm-misc-next).

	Sam
