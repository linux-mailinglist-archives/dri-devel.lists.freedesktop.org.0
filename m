Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF0E402B1C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 16:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7155E6E02C;
	Tue,  7 Sep 2021 14:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 60915 seconds by postgrey-1.36 at gabe;
 Tue, 07 Sep 2021 14:52:40 UTC
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708DD6E02C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 14:52:40 +0000 (UTC)
Date: Tue, 7 Sep 2021 16:52:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
 s=mail; t=1631026359;
 bh=rBR2zR4qYK5bAv6dYBRzzsHRiX1WFHqQpOc1+JsquVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VgWipVkapyOEVwkfXw+q6eXUANQ9cUfmpjzqHwb4QWB25rRkA3+bF/T+Z5SqBAKwD
 /5C5jJSOgfjDbtrQ7H4Ia4YP8ZfXNzBzNxpvVyD8/K4b47ZXTxqzMvNA/4yCGMKY3t
 Dh9Si6RIr6Jf78amtbnYa3FsB5kg80tnhGA8ABnE=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: propagate errors from get_brightness()
Message-ID: <cb817cdc-449e-4587-ab79-36be4f49f8d4@t-8ch.de>
References: <20210907124751.6404-1-linux@weissschuh.net>
 <20210907131005.vvaitvcllbte37zp@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210907131005.vvaitvcllbte37zp@maple.lan>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-09-07T14:10+0100, Daniel Thompson wrote:
> On Tue, Sep 07, 2021 at 02:47:51PM +0200, Thomas Weißschuh wrote:
> > backlight.h documents "struct backlight_ops->get_brightness()" to return
> > a negative errno on failure.
> > So far these errors have not been handled in the backlight core.
> > This leads to negative values being exposed through sysfs although only
> > positive values are documented to be reported.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Thanks!

Thomas
