Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4697C662EA0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 19:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA0F10E4E1;
	Mon,  9 Jan 2023 18:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:403::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F23B10E4E1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=wZxH/nDf40/5XX4K0N7bveQXBer/ZTbSo4stXhMD1MQ=;
 b=xr+iUWmfOB1CLBr6Qsy2YZMDRotm12WBZ/zh+3qIGnqD+WW38gq16Rl6LS9taWAIgXP2llv2ueyF0
 fA3iIIxYnmuPGkwiK+SGk3l7yHRvIxggcTtT7x2q0+wwF6fVIQkEzPtcW04Q4A6X4SKS9m56vo7D0o
 hLzfG7GraTS31Ch8FAtoGue7T76SmYvTnNeZNZkj0/5oK6YNNivj7Wo0ExtjbmvCmHRBteAPdkj/Eg
 NkDkGI6lGIPAVh39LbMkR8Ej5M2GsnANIVRaeRashpzz54gdLod6v1ri7V6JrPjvdhVHIVaCwftjs+
 2rttIhFTMoveJDSDeM23dX3GpjUJUVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=wZxH/nDf40/5XX4K0N7bveQXBer/ZTbSo4stXhMD1MQ=;
 b=nxcQ2DNweooGl9o3PknXxmGKMXudrM7A8yocezPtlLEgBpQEu7WtSwjxUTWj2HhN7+D5H3vtKKz4P
 oB6b4GmAA==
X-HalOne-ID: 5e23647e-904a-11ed-85ce-87783a957ad9
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id 5e23647e-904a-11ed-85ce-87783a957ad9;
 Mon, 09 Jan 2023 18:21:02 +0000 (UTC)
Date: Mon, 9 Jan 2023 19:21:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 02/15] video: fbdev: atyfb: Introduce
 backlight_get_brightness()
Message-ID: <Y7xbDAwLEeCJ4L54@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-2-1bd9bafb351f@ravnborg.org>
 <04f0f8c7-43cd-f774-c952-eb1cf3494bd8@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04f0f8c7-43cd-f774-c952-eb1cf3494bd8@csgroup.eu>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lee Jones <lee@kernel.org>, Stephen Kitt <steve@sk2.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Antonino Daplas <adaplas@gmail.com>, Helge Deller <deller@gmx.de>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jason Yan <yanaijie@huawei.com>, Robin van der Gracht <robin@protonic.nl>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,
On Mon, Jan 09, 2023 at 05:44:46PM +0000, Christophe Leroy wrote:
> 
> 
> Le 07/01/2023 à 19:26, Sam Ravnborg via B4 Submission Endpoint a écrit :
> > From: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Introduce backlight_get_brightness() to simplify logic
> > and avoid direct access to backlight properties.
> 
> When I read 'introduce' I understand that you are adding a new function.
> 
> In fact backlight_get_brightness() already exists, so maybe replace 
> 'introduce' by 'use'

Thanks for your feedback. A similar patch is already applied to the
fbdev tree, so this patch can be ignored.

	Sam
