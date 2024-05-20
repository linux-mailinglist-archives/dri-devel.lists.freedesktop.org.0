Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9868C9C91
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 13:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6273010E0C6;
	Mon, 20 May 2024 11:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DNGKbJlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4C310E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 11:49:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EE90593;
 Mon, 20 May 2024 13:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1716205745;
 bh=t+pjIpHWwVWoGbu51U5Ft4pHw3iODZAWJ3ANRxuiE+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DNGKbJlZrNf3oQc7C9GUCb1SB0E+JtDzszFNDXDkBa1DqtFAbnvCB/aZkW1JvuX3r
 Jn2bODQ1RJPZPwMV1RsdsDr3IoFD7YcTWgnVoZXGczuxitFb22ThkCzAa8DauSNzOc
 u9764CMP3/eryWYwC9FK4JJFaZmf6YsX91VN4t/g=
Date: Mon, 20 May 2024 14:49:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Oded Gabbay <ogabbay@kernel.org>, Olof Johansson <olof@lixom.net>,
 Lucas Stach <l.stach@pengutronix.de>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: DRM Accel BoF at Linux Plumbers
Message-ID: <20240520114907.GA6275@pendragon.ideasonboard.com>
References: <CAAObsKAw174AhGaA13Hyw0ANW=TxJHpK10+OwQGNMVca85Urdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAObsKAw174AhGaA13Hyw0ANW=TxJHpK10+OwQGNMVca85Urdg@mail.gmail.com>
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

Hi Tomeu,

On Sat, May 18, 2024 at 10:46:01AM +0200, Tomeu Vizoso wrote:
> Hi,
> 
> I would like to use the chance at the next Plumbers to discuss the
> present challenges related to ML accelerators in mainline.
> 
> I'm myself more oriented towards edge-oriented deployments, and don't
> know enough about how these accelerators are being used in the cloud
> (and maybe desktop?) to tell if there is enough overlap to warrant a
> common BoF.
> 
> In any case, these are the topics I would like to discuss, some
> probably more relevant to the edge than to the cloud or desktop:
> 
> * What is stopping vendors from mainlining their drivers?
> 
> * How could we make it easier for them?
> 
> * Userspace API: how close are we from a common API that we can ask
> userspace drivers to implement? What can be done to further this goal?
> 
> * Automated testing: DRM CI can be used, but would be good to have a
> common test suite to run there. This is probably dependent on a common
> userspace API.
> 
> * Other shared userspace infrastructure (compiler, execution,
> synchronization, virtualization, ...)
> 
> * Firmware-mediated IP: what should we do about it, if anything?
> 
> * Any standing issues in DRM infra (GEM, gpu scheduler, DMABuf, etc)
> that are hurting accel drivers?
> 
> What do people think, should we have a drivers/accel-wide BoF at
> Plumbers? If so, what other topics should we have in the agenda?

I'm interested in attending, even if so far I have limited involvement
in that area. Looking forward we're considering usage of ML accelerators
in libcamera for various purposes, so an open ecosystem will be crucial
for us.

-- 
Regards,

Laurent Pinchart
