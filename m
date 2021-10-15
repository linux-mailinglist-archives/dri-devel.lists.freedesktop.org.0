Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C642FAC9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 20:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D566E095;
	Fri, 15 Oct 2021 18:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F736E095
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 18:13:25 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 9571a653-2de3-11ec-9c3f-0050568c148b;
 Fri, 15 Oct 2021 18:13:22 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 51FD9194B53;
 Fri, 15 Oct 2021 20:13:29 +0200 (CEST)
Date: Fri, 15 Oct 2021 20:13:19 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] drm/meson: split out encoder from meson_dw_hdmi
Message-ID: <YWnEv2B26/3XWH/O@ravnborg.org>
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-4-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015141107.2430800-4-narmstrong@baylibre.com>
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

Hi Neil,

On Fri, Oct 15, 2021 at 04:11:04PM +0200, Neil Armstrong wrote:
> This moves all the non-DW-HDMI code where it should be:
> an encoder in the drm/meson core driver.
> 
> The bridge functions are copied as-is, except:
> - the encoder init uses the simple kms helper
> - the mode_set has been moved to atomic_enable()
> - debug prints are converted to dev_debg()
> 
> For now the bridge attach flags is 0, DRM_BRIDGE_ATTACH_NO_CONNECTOR
> will be handled later.
> 
> The meson dw-hdmi glue is slighly fixed to live without the
> encoder in the same driver.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Looks good,
Acked-by: Sam Ravnborg <sam@ravnborg.org>

With this I have covered this nice series. I am happy to see one more
display driver that embraces fully the chained bridge approach.

	Sam
