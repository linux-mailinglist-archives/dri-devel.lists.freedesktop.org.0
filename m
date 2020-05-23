Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DB81DFB3A
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 23:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766356E222;
	Sat, 23 May 2020 21:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A076B6E222
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 21:36:50 +0000 (UTC)
Date: Sat, 23 May 2020 21:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1590269807;
 bh=PHfKuuHWPcmUbb2PmD0LDOWBT12D4OHwe+gCYSUhMas=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=lqzqn2kQUZ4MELG/rA+0R38wWEq8WfACOx3mn2R/MHkiSm2xtfOaJpbiWjj+81lgN
 8AMVGPHsXJPogTQyru9AbqHnnLYJw6PIqS7FnsbaxKqsrFTVagG9vzkQWsK8bElKQF
 CXFh8e2dB4HShor5P8m+IlOYIaTaZlj8DM8dpxVE=
To: Mauro Rossi <issor.oruam@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] xf86drm: add drmOpenByFB
Message-ID: <U8jrM_GtxrGK0nNOiMU4H-uVLXPdv79TjXOQh_PVn7tkWFixOqW3wA15x5MIpygORK3x8X8Kdz45tbqe57MA3nAWh-J0K8QIfDSSa6yeOc0=@emersion.fr>
In-Reply-To: <20200523154426.1088988-1-issor.oruam@gmail.com>
References: <20200523154426.1088988-1-issor.oruam@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "robert.foss@collabora.com" <robert.foss@collabora.com>,
 "cwhuang@linux.org.tw" <cwhuang@linux.org.tw>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, May 23, 2020 5:44 PM, Mauro Rossi <issor.oruam@gmail.com> wrote:

> OpenByFB is introduced to overcome GPU driver loading order issue
> on a device with multiple GPUs, e.g. Intel iGPU and Nvidia dGPU
> where the first drmfb kernel module loaded will become device file
> /dev/dri/card0 and the second will become /dev/dri/card1
>
> The use case is to prefer Intel iGPU over dGPU, or viceversa,
> in a deterministic and reliable manner.
>
> OpenByFB function opens the DRM device with specified fb and node type,
> thus enabling gralloc to open the correct device node of the primary fb,
> regardless of the GPU driver loading order.

"FB" is ambiguous here, because the other FB functions in this file
refer to DRM frame-buffer objects (as opposed to fbdev I believe?).
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
