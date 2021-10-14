Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3DD42E106
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681786EBC4;
	Thu, 14 Oct 2021 18:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAD76EBC4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 18:19:46 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 53e6d408-2d1b-11ec-ac3c-0050568cd888;
 Thu, 14 Oct 2021 18:19:53 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id E13B9194B6D;
 Thu, 14 Oct 2021 20:19:52 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:19:43 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/meson: encoder_hdmi: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <YWh0vzsWFO4omDJ7@ravnborg.org>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-6-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014152606.2289528-6-narmstrong@baylibre.com>
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

On Thu, Oct 14, 2021 at 05:26:04PM +0200, Neil Armstrong wrote:
> This implements the necessary change to no more use the embedded
> connector in dw-hdmi and use the dedicated bridge connector driver
> by passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to the bridge attach call.
> 
> The necessary connector properties are added to handle the same
> functionalities as the embedded dw-hdmi connector, i.e. the HDR
> metadata, the CEC notifier & other flags.
> 
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Look fine,
Acked-by: Sam Ravnborg <sam@ravnborg.org>

