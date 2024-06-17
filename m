Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0CC90A383
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 07:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3A310E19B;
	Mon, 17 Jun 2024 05:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="moZ+hifb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6718210E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 05:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1718603935; x=1719208735; i=deller@gmx.de;
 bh=+HdE+GKlMXl1Tr/7+VvWnOUp6XAauHEgbZXiKGTwqjY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=moZ+hifb7+2byidQb+PospfdMsn1Zgn3Xo3BCmvjHldxseo5W7XbFBPZAvgiqiwf
 ExuDsCkWhbE2WjcI06jpa8VtgBqqi3w6F+XSr5hktTPFv9zWDrccRY/R/vFh9ra7F
 KIIe/4PTgB8l5Bkc4D4mDemYPVdGtXz+3iBmzy6HiH0s8V6nMCTnGIoc2U0byXWBM
 0v96nQvnBrn7iPqSPCwBlrGSwCx5MpoC8I0cD6cH7fRvwpq8wYGQr0FCTa1jQXJmU
 KCZL38a8kP7dBcoBh7jJkQOgnNh7fXEY7Bk7Ndb6g7Nwk/7U4SEuLDHhqRF02c5Kp
 ZlFzlLpg1jTQW9AakQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.92]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKlu-1s33u12UrS-00RiwV; Mon, 17
 Jun 2024 07:58:55 +0200
Message-ID: <85ef9e82-558b-4a96-9667-acb2038716fe@gmx.de>
Date: Mon, 17 Jun 2024 07:58:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 resend 0/9] use for_each_endpoint_of_node()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-staging@lists.linux.dev
References: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r0x1YfLuiViZYe+gRUIZyYs9KMqwrj7gg4vqYWHQP3jzzu2J2vQ
 2tA003nABkGX+yvWQkfU8XfHklcBtSm0Wk4Jib1U1P7v2u/iTTKsefJnNPU7zBsQUvpoWDY
 Bn97gMMD8ClI4sMqYXlRU2gmkdVHmgiwNe0FWx6oEivrXOZFg0HjHB+pDYAbxel4ny1fI56
 Vvcf2gdthOWGl1QdLYmtg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rOPvLsu7E7Q=;zPfU/y0veqh7r5Vxg96s5cXbnKr
 szn5uukJBNKOnveJzIvo5sofwj0ra7O3U1JtSOTROyDEFaTdcUujIK2DzuQ5aL163PoLlxYbz
 lRpdoa7b/gTmgFwqk1ZtEgfOkNOHKEJGlTM6wewTjT1gAb82o58Ah5bblijFZVisF7ygu7MBi
 7qqz+K2rO5C0bniLuIZpIvpmihi9nUrRQ/SJJCeIILo13rLm8GswW3qP50Zbmz6swsQtslGyB
 BHkvhlh4ly7NiYRXMYQkCwaHcttbRsyzrAB45hBbfXQngmx+lbKdguE/jWkTKtWWaz2CF/4RV
 zh5yCzgQCB2MoLZbSg+1oekh2AeBNcDaDISxC4pq0r2hQBgnQYffI+WJM7o4hNaataW1l3bSQ
 jRLIPbH/MiyRFZMMkvUtYHVBDQlR6HA688uyvx7lIfKFSFtxaOXBylBCMQVTdJB+xjiUjmzO5
 MllyqMhw6HmjeyNqE0f/iVbiRJAfLvjWJexg2D/1MONQCojodcE5SmdE14dhw2U7zQbsTQVzy
 cX2+ho69aZrPvQ8sjfXL6dZrnWV9DvOuXDlPhrVavrDCfCNBDfbmyQZ0alXEO5gPlASVhXY4j
 vaWcDD64r803Bo+r2+41t7qS+higsB1oAWrQYZS6A8m2VuVIzHXyb5QLS0cJERe00eGHneYOW
 JMs/lBQW6Ed9YwfKn+53pPW4UkdWWmcjN479B4TKG1PXYDKcJPa6rTXGKWPOy9CGIkHVxmtvC
 jJ08xps8/aDUW5Mw1cZFgUtH9NbS6QTPQMs15+Hi5xhHk3Z4rlEmvn+bSOwjUZClL8cUe8/G8
 mn1ZLkTeqpIU7AkYt90yIwiS9MNvTAUtD6UFlrtspejxM=
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

On 6/17/24 02:58, Kuninori Morimoto wrote:
> Hi Rob, Helge, +Sakari, +Hans

Hi Kuninori,

> 2 weeks past. This is resend v4 patch-set.
> I add +Sakari, +Hans on To.
>
> We already have for_each_endpoint_of_node(), but some drivers are
> not using it. This patch-set replace it.
>
> This patch-set is related to "OF" (=3D Rob), but many driveres are for
> "MultiMedia" (=3D Helge). I'm not sure who handle these.

I applied the two fbdev patches (#8 and #9), but I'm not maintainer for "m=
ultimedia".
For multimedia I expect people from linux-media@vger.kernel.org to pick yo=
ur patches.

Helge

>
> I noticed that my posted 1 patch on (A) was not yet included on
> linus/master. I have included it.
>
> Dan is indicating it needs _scoped() macro, but it is new new feature.
> So I think we want to have separate this patch-set and _scoped() patch-s=
et.
> I asked it to ML/Maintainer but no responce, so v4 doesn't include it.
> It will be handled by other patch-set in the future.
>
> [o] done
> [*] this patch-set
>
> 	[o] tidyup of_graph_get_endpoint_count()
> (A)	[o] replace endpoint func - use endpoint_by_regs()
> 	[*] replace endpoint func - use for_each()
> 	[ ] add new port function
> 	[ ] add new endpoint function
>
> v3 -> v4
> 	- fixup ret handling
>
> v2 -> v3
> 	- don't initialize pointer.
> 	- add Reviewed-by / Acked-by
> 	- include not-yet applied missing patch
>
> v1 -> v2
> 	- fixup TI patch
>
> Link: https://lore.kernel.org/r/8734sf6mgn.wl-kuninori.morimoto.gx@renes=
as.com
> Link: https://lore.kernel.org/r/87cyrauf0x.wl-kuninori.morimoto.gx@renes=
as.com
> Link: https://lore.kernel.org/r/87le3soy08.wl-kuninori.morimoto.gx@renes=
as.com
>
> Kuninori Morimoto (9):
>    gpu: drm: replace of_graph_get_next_endpoint()
>    gpu: drm: use for_each_endpoint_of_node()
>    hwtracing: use for_each_endpoint_of_node()
>    media: platform: microchip: use for_each_endpoint_of_node()
>    media: platform: ti: use for_each_endpoint_of_node()
>    media: platform: xilinx: use for_each_endpoint_of_node()
>    staging: media: atmel: use for_each_endpoint_of_node()
>    video: fbdev: use for_each_endpoint_of_node()
>    fbdev: omapfb: use of_graph_get_remote_port()
>
>   drivers/gpu/drm/drm_of.c                      |  4 +++-
>   drivers/gpu/drm/omapdrm/dss/base.c            |  3 +--
>   .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
>   drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
>   .../hwtracing/coresight/coresight-platform.c  |  4 ++--
>   .../microchip/microchip-sama5d2-isc.c         | 21 +++++++------------
>   .../microchip/microchip-sama7g5-isc.c         | 21 +++++++------------
>   .../media/platform/ti/am437x/am437x-vpfe.c    | 12 +++++------
>   .../media/platform/ti/davinci/vpif_capture.c  | 14 ++++++-------
>   drivers/media/platform/xilinx/xilinx-vipp.c   |  9 ++------
>   .../deprecated/atmel/atmel-sama5d2-isc.c      | 10 +++------
>   .../deprecated/atmel/atmel-sama7g5-isc.c      | 10 +++------
>   drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +------------
>   .../omap2/omapfb/dss/omapdss-boot-init.c      |  3 +--
>   14 files changed, 46 insertions(+), 84 deletions(-)
>

