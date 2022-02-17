Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2B44BAB21
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 21:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68D910E7AF;
	Thu, 17 Feb 2022 20:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1126B10E7AF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 20:36:12 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 49b89cd5-9031-11ec-b2df-0050568cd888;
 Thu, 17 Feb 2022 20:36:30 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 864C1194B53;
 Thu, 17 Feb 2022 21:36:12 +0100 (CET)
Date: Thu, 17 Feb 2022 21:36:08 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 8/8] drm/fourcc: Add DRM_FORMAT_D1
Message-ID: <Yg6xuEF1nfFmw5lM@ravnborg.org>
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-9-geert@linux-m68k.org>
 <20220217121033.0fc7f6ba@eldfell>
 <CAMuHMdXf3tFLb16Y=wh5C3QUYN4PdCjaYPCzMOTCye-eYS-N8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXf3tFLb16Y=wh5C3QUYN4PdCjaYPCzMOTCye-eYS-N8w@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

> 
> C1 is color-indexed, which can be any two colors.
> R1 is light-on-dark.
> D1 is dark-on-light.

It would be nice to have this explained in the fourcc.h file,
preferably with a little more verbosity than the current explanations.

	Sam
