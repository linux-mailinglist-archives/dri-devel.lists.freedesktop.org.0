Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CE6523BBB
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 19:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC5910E0E8;
	Wed, 11 May 2022 17:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA57D10E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 17:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=iALarvYr6q24+R4Th1G4RXSh7gnuFWx7r3JvoYpd3xk=;
 b=W9xFVeO8LlGUfyYNl9YjYZ9ZctbU8etMQKk6mgK5eNNMwHdKmpY1Rnlvs/tcMhZuFNDgDDj5D5xXp
 rKFTaUrT9umvFG6ucNypFltBnfVrVGggs0wfStO2aYLtgvujAgsIla6xNkv1J4JbPo7Nha+k4HgVA3
 F5yO8ZUKqcdNeVVLUDs/WW1trNoqLrkN+qpGV7A3u5imlgspD7rOfqkhXJePu5ye7AE1s8tzCvPZAB
 doXWdIYAX+qAJv1VW7krOJtgjK5BfTOEWbaGvw0iSuO6eye4XNUjcp/w+FnCMSfiK5ULbPTmD+h+ES
 nGeCfompngqVHV83tGs3mGxM8k8xXpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=iALarvYr6q24+R4Th1G4RXSh7gnuFWx7r3JvoYpd3xk=;
 b=hImXde1zDvSVJkx15NBS5pKNiZbhkQkuYrmlHkQ98BvXln9AlcTSZH6xC64Y7s7D/j8PJ2tjjUnDu
 FOqhaicBQ==
X-HalOne-Cookie: e2cdac57c96ca2243c1cd42b5ad62a44227cc89d
X-HalOne-ID: 4cacf8ba-d151-11ec-a908-d0431ea8a290
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 4cacf8ba-d151-11ec-a908-d0431ea8a290;
 Wed, 11 May 2022 17:39:25 +0000 (UTC)
Date: Wed, 11 May 2022 19:39:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Joel Selvaraj <jo@jsfamily.in>
Subject: Re: [PATCH v2 3/3] drm/panel: introduce ebbg,ft8719 panel
Message-ID: <Ynv0y6xmtnE+33/y@ravnborg.org>
References: <cover.1652245767.git.jo@jsfamily.in>
 <BY5PR02MB70098FF9BDEDE264B78CFCE0D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR02MB70098FF9BDEDE264B78CFCE0D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
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
Cc: devicetree@vger.kernel.org, Hao Fang <fanghao11@huawei.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Oleksij Rempel <linux@rempel-privat.de>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, phone-devel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joel,
On Wed, May 11, 2022 at 10:58:11AM +0530, Joel Selvaraj wrote:
> Add DRM panel driver for EBBG FT8719 6.18" 2246x1080 DSI video mode
> panel, which can be found on some Xiaomi Poco F1 phones. The panel's
> backlight is managed through QCOM WLED driver.
> 
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>

Driver looks good:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I expect someone else to pick it up and apply.

	Sam
