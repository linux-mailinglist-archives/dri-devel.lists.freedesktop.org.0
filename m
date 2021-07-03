Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065913BAA1D
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 21:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15D189E47;
	Sat,  3 Jul 2021 19:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15F789E47
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jul 2021 19:24:52 +0000 (UTC)
Received: (qmail 26299 invoked by uid 1000); 3 Jul 2021 19:24:48 -0000
Message-ID: <20210703192448.26298.qmail@stuge.se>
Date: Sat, 3 Jul 2021 19:24:48 +0000
From: Peter Stuge <peter@stuge.se>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 1/2] drm/gud: Add Raspberry Pi Pico ID
References: <20210703141321.35494-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210703141321.35494-1-noralf@tronnes.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

Noralf Trønnes wrote:
> Add VID/PID for the Raspberry Pi Pico implementation.
> Source: https://github.com/notro/gud-pico
> 
> +++ b/drivers/gpu/drm/gud/gud_drv.c
> @@ -660,6 +660,7 @@ static int gud_resume(struct usb_interface *intf)
>  
>  static const struct usb_device_id gud_id_table[] = {
>  	{ USB_DEVICE_INTERFACE_CLASS(0x1d50, 0x614d, USB_CLASS_VENDOR_SPEC) },
> +	{ USB_DEVICE_INTERFACE_CLASS(0x16d0, 0x10a9, USB_CLASS_VENDOR_SPEC) },
>  	{ }
>  };

A VID/PID isn't neccessarily tied to one implementation; as long as an
implementation is in fact compatible with the driver I consider it okay
to reuse a VID/PID, and the 0x1d50 conditions are met by gud-pico too.
That said, there's no harm in adding another id. :)

Reviewed-by: Peter Stuge <peter@stuge.se>


//Peter
