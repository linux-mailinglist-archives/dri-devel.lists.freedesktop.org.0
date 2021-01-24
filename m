Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C55D3022EF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 09:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFB489FBC;
	Mon, 25 Jan 2021 08:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A4D89D89
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 18:38:44 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id CB01BDF61F;
 Sun, 24 Jan 2021 18:34:41 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Ux9EEQKzQmVj; Sun, 24 Jan 2021 18:34:39 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 53DF7E0AC6;
 Sun, 24 Jan 2021 18:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id joA8Xy5qonPc; Sun, 24 Jan 2021 18:34:39 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 169D2DF61F;
 Sun, 24 Jan 2021 18:34:39 +0000 (UTC)
Date: Sun, 24 Jan 2021 19:38:38 +0100
From: Lubomir Rintel <lkundrak@v3.sk>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v4 0/3] Generic USB Display driver
Message-ID: <20210124183838.GA1873250@demiurge.local>
References: <20210120170033.38468-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210120170033.38468-1-noralf@tronnes.org>
X-Mailman-Approved-At: Mon, 25 Jan 2021 08:45:26 +0000
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
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org, th020394@gmail.com,
 pontus.fuchs@gmail.com, peter@stuge.se
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 06:00:30PM +0100, Noralf Tr=F8nnes wrote:
> Hi,
> =

> A while back I had the idea to turn a Raspberry Pi Zero into a $5
> USB to HDMI/SDTV/DSI/DPI display adapter.
> =

> The reason for calling it 'Generic' is so anyone can make a USB
> display/adapter against this driver, all that's needed is to add a USB
> vid:pid.
> =

> Unfortunately I've had some compounding health problems that have
> severally limited the time I can spend in front of a computer. For this
> reason I've decided to keep the gadget driver out-of-tree and focus on
> getting the host driver merged first.
> =

> See the wiki[1] for more information and images for the Raspberry Pi
> Zero/4.
> =

> One big change this time is that I've followed Peter Stuge's advice to
> not let DRM stuff leak into the USB protocol. This has made the protocol
> easier to understand just from reading the header file.
> =

> Noralf.
> =

> [1] https://github.com/notro/gud/wiki

The patch set:

Tested-by: Lubomir Rintel <lkundrak@v3.sk>

Works like a charm with this board [1], though it didn't impress the girls
as much as I hoped. Code here [2], picture here [3].

[1] https://www.banggood.com/LILYGO-TTGO-T-Display-GD32-RISC-V-32-bit-Core-=
Minimal-Development-Board-1_14-IPS-p-1652870.html?rmmds=3Dsearch&cur_wareho=
use=3DCN
[2] https://github.com/hackerspace/libopencm3-gf32v-examples/commit/7ef51b3=
1b9
[3] https://people.freedesktop.org/~lkundrak/lilygo.jpeg

Had to apply a fix for the drm_connector_enum_list[] ommission I mentioned
elsewhere, and that I've now noticed you've noted previously.

Take care
Lubo

> =

> =

> Noralf Tr=F8nnes (3):
>   drm/uapi: Add USB connector type
>   drm/probe-helper: Check epoch counter in output_poll_execute()
>   drm: Add Generic USB Display driver
> =

>  MAINTAINERS                         |   8 +
>  drivers/gpu/drm/Kconfig             |   2 +
>  drivers/gpu/drm/Makefile            |   1 +
>  drivers/gpu/drm/drm_probe_helper.c  |   7 +-
>  drivers/gpu/drm/gud/Kconfig         |  14 +
>  drivers/gpu/drm/gud/Makefile        |   4 +
>  drivers/gpu/drm/gud/gud_connector.c | 722 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/gud/gud_drv.c       | 620 ++++++++++++++++++++++++
>  drivers/gpu/drm/gud/gud_internal.h  | 148 ++++++
>  drivers/gpu/drm/gud/gud_pipe.c      | 472 ++++++++++++++++++
>  include/drm/gud.h                   | 356 ++++++++++++++
>  include/uapi/drm/drm_mode.h         |   1 +
>  12 files changed, 2354 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/gud/Kconfig
>  create mode 100644 drivers/gpu/drm/gud/Makefile
>  create mode 100644 drivers/gpu/drm/gud/gud_connector.c
>  create mode 100644 drivers/gpu/drm/gud/gud_drv.c
>  create mode 100644 drivers/gpu/drm/gud/gud_internal.h
>  create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
>  create mode 100644 include/drm/gud.h
> =

> -- =

> 2.23.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
