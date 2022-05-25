Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D152C5335A9
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 05:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E617B10FAC0;
	Wed, 25 May 2022 03:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67C0A10E653
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 03:18:50 +0000 (UTC)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24P3FVYw012347;
 Tue, 24 May 2022 22:15:32 -0500
Message-ID: <ede15a37b9e854a50c9d67b890bdebb25642a003.camel@kernel.crashing.org>
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas
 <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, paulus@samba.org
Date: Wed, 25 May 2022 13:15:31 +1000
In-Reply-To: <8cd53439-46f1-117c-7aae-7630a6466ab8@suse.de>
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
 <84a550c3-dcef-17ac-0ae5-666cdf0fb67e@redhat.com>
 <8cd53439-46f1-117c-7aae-7630a6466ab8@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2022-05-22 at 21:35 +0200, Thomas Zimmermann wrote:
> > Interesting. Did you find some formats that were not supported ?
> 
> We still don't support XRGB1555. If the native buffer uses this format, 
> we'd have no conversion helper. In this case, we rely on userspace/fbcon 
> to use the native format exclusively.  (BTW, I asked one of my coworkers 
> to implement XRGB1555 to make her familiar with DRM. That's why I 
> haven't sent a patch yet.)
> 

Various old macs do 1555 ...

Cheers,
Ben.

