Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 222B443625C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 15:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680AF88DAA;
	Thu, 21 Oct 2021 13:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4329B6EC61
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 13:07:20 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86F8760ED3;
 Thu, 21 Oct 2021 13:07:19 +0000 (UTC)
Date: Thu, 21 Oct 2021 09:07:15 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org, kaleshsingh@google.com
Subject: Re: [RFC PATCH 1/8] tracing/gpu: modify gpu_mem_total
Message-ID: <20211021090715.2318259d@gandalf.local.home>
In-Reply-To: <YXFVdkeGHvOoTpZ0@phenom.ffwll.local>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
 <20211021031027.537-2-gurchetansingh@chromium.org>
 <YXFVdkeGHvOoTpZ0@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Oct 2021 13:56:38 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> Yay, that patch is just impressive. Lands a new gpu tracepoints, never
> even showed up on the gpu subsystem discussion list.

I'm guessing there was some confusion. When this was first introduced, I
stated it needs to go into the gpu tree, which a new set of patches included
more Cc's. I never checked if those Cc's were for the GPU maintainers or not
(I assumed they were).

 https://lore.kernel.org/all/20200224113805.134f8b95@gandalf.local.home/

I'm not sure where Yiwei Zhang got his email list for the GPU maintainers
from. As he obviously thought it was going to them.

 https://lore.kernel.org/all/CAKT=dDnFpj2hJd5z73pfcrhXXacDpPVyKzC7+K94tsX=+e_BHg@mail.gmail.com/

Seeing that this patch set is going through dri-devel list, which I'm
guessing is also for GPU, even though it's not under that in the
MAINTAINERS file:

DRM DRIVERS AND MISC GPU PATCHES
M:      Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
M:      Maxime Ripard <mripard@kernel.org>
M:      Thomas Zimmermann <tzimmermann@suse.de>
S:      Maintained
W:      https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
T:      git git://anongit.freedesktop.org/drm/drm-misc
F:      Documentation/gpu/
F:      drivers/gpu/drm/*
F:      drivers/gpu/vga/
F:      include/drm/drm*
F:      include/linux/vga*
F:      include/uapi/drm/drm*

Should the list be added there?

I've been struggling with this patch set because nobody claimed ownership
for it. But now I believe we have one (you? :-)  And I can now just comment
on the tracing POV and leave the content and usability to you folks ;-)

-- Steve
