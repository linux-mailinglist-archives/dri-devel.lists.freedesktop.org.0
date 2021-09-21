Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 197D541359B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E596E9D0;
	Tue, 21 Sep 2021 14:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EFF6E9D0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 14:50:08 +0000 (UTC)
Date: Tue, 21 Sep 2021 16:50:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
 s=mail; t=1632235807;
 bh=HVjDwY3TCzwDBv32KPIGLsUQZWFrfWErmGlbPLXnjeo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lI661zFUSBSuibdyMJanQmYB+xU6QJzPb2CWZUzlHjMwPUdQxw7FRTWp32l/sK9sD
 sLAyANhiH1BNw7iKrs15lH3mn+f5AmHL3FGc07a3i461k9/lhD0jHTTMzebK2Hje36
 AdCR+HCtoeeEMRFKYSLKotEbHGtp+Zq7aTAaZeC0=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: propagate errors from get_brightness()
Message-ID: <b25975d3-f417-4cba-92d1-35c93d37e1e6@t-8ch.de>
References: <20210907124751.6404-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210907124751.6404-1-linux@weissschuh.net>
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

On 2021-09-07T14:47+0200, Thomas Weißschuh wrote:
> backlight.h documents "struct backlight_ops->get_brightness()" to return
> a negative errno on failure.
> So far these errors have not been handled in the backlight core.
> This leads to negative values being exposed through sysfs although only
> positive values are documented to be reported.

> [..]

Friendly ping.
