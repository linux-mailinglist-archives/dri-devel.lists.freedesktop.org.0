Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCE02D746A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 12:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32DF6ED99;
	Fri, 11 Dec 2020 11:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6256ED99
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 11:02:02 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D061180672;
 Fri, 11 Dec 2020 12:01:58 +0100 (CET)
Date: Fri, 11 Dec 2020 12:01:57 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/panel: khadas: Fix error code in
 khadas_ts050_panel_add()
Message-ID: <20201211110157.GA527186@ravnborg.org>
References: <X9NEfmgGilaXJs2R@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9NEfmgGilaXJs2R@mwanda>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=yPCof4ZbAAAA:8 a=7gkXJVJtAAAA:8
 a=LgsML8mqMRuCtKI92vIA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

I assume your nice tooling found this buggy.
Nice!

On Fri, Dec 11, 2020 at 01:05:50PM +0300, Dan Carpenter wrote:
> There is a copy and paste bug so it didn't return the correct error
> code.
> 
> Fixes: b215212117f7 ("drm: panel: add Khadas TS050 panel driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Neil, I assume you will take this via next-fixes, which I think is the
right tree at the moment.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
