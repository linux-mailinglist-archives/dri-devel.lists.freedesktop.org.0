Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA077186CEF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 15:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B1089C8D;
	Mon, 16 Mar 2020 14:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3984789E3F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 14:20:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id z13so1816081wml.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lCVRcWuoqSFl9sGnC8c12m+SWaVwxGlK7BuQr+QvnO8=;
 b=WFG3xc8zoDgUYH2hvIvTPWgij9nOMlZARwhbcz8a0J4UIGdVU6d5psQ/WGPrbW83Xo
 hZkxS6/7Fapud7w6NM1fSMZlOgnZc09dq8583uiHFzdjNooxWSf9IdhG4vsQeRRigsQi
 cpLrHt4zYe8zKz9st+7Y0RShulPMaQJe0Y20wV2lqBB0dlXM76xwWZd/9ytBy8Xl6Zxt
 1qYW788othu/VjOP4KN4jA65OdXmi/DRuk75uMAMtLhxf/V5tauPE7+RKxxUuOXLjS2E
 wDdCahLhUsyb18VwYLyPaIt2GOK1fLFb1BaXykdcqxgcQKm/Ta2a1AhMiavRtt2epc5f
 Zv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lCVRcWuoqSFl9sGnC8c12m+SWaVwxGlK7BuQr+QvnO8=;
 b=t4OjROeYjDXBuwUNhmyrtkPlRWHTezWngWu2sKP+gCsuCdSl6VU87YnvsTZ3M1aunz
 Hjibuv2d8u4cJopSVu8QmXIZ0d2QguvAcZODFlUvUzTCzGb/XpSZr2PL/RFfwLe16GmO
 5NYlYy3q351VecnqnuBuESGEDDCpX++0QjgVDLYtJ+3uqYMGG5rEmOQvvk0VKpr5Eaz7
 K2VWH9f6n7d5a8DDVBaYoDP/1dR8kt2Tu3Tr05nRmQgBnPgycljhAlFGqRRFdhScGm1p
 sCnF552UAXCXRWF9N4ndGdXKckR56O5EweeXPAYZAdTWX+ybRqYL54uw/q0CNh4ZrxLB
 aBgg==
X-Gm-Message-State: ANhLgQ2/Bzh1udGwcM9eHHDZ+DkSvhK3y+avuNdWCOxxECLJHxMEkpxE
 3FzyxAXf5XeIPjab+XOYcISLu4dfwZluGaT7kzVTNg==
X-Google-Smtp-Source: ADFU+vsq3/x6v6lcvejrjC3o0qItXykDeNQ3x01CIM7UBRevRBaz4S+fhsx6tNXYD4+4GWiIl75lPjao9ywpdjb49wA=
X-Received: by 2002:a1c:2e92:: with SMTP id u140mr11155915wmu.84.1584368447789; 
 Mon, 16 Mar 2020 07:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
In-Reply-To: <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 16 Mar 2020 14:19:55 +0000
Message-ID: <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: Tomek Bury <tomek.bury@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomek,

On Mon, 16 Mar 2020 at 12:55, Tomek Bury <tomek.bury@gmail.com> wrote:
> I've been wrestling with the sync problems in Wayland some time ago, but only with regards to 3D drivers.
>
> The guarantee given by the GL/GLES spec is limited to a single graphics context. If the same buffer is accessed by 2 contexts the outcome is unspecified. The cross-context and cross-process synchronisation is not guaranteed. It happens to work on Mesa, because the read/write locking is implemented in the kernel space, but it didn't work on Broadcom driver, which has read-write interlocks in user space.

GL and GLES are not relevant. What is relevant is EGL, which defines
interfaces to make things work on the native platform. EGL doesn't
define any kind of synchronisation model for the Wayland, X11, or
GBM/KMS platforms - but it's one of the things which has to work. It
doesn't say that the implementation must make sure that the requested
format is displayable, but you sort of take it for granted that if you
ask EGL to display something it will do so.

Synchronisation is one of those mechanisms which is left to the
platform to implement under the hood. In the absence of platform
support for explicit synchronisation, the synchronisation must be
implicit.

>  A Vulkan client makes it even worse because of conflicting requirements: Vulkan's vkQueuePresentKHR() passes in a number of semaphores but disallows waiting. Wayland WSI requires wl_surface_commit() to be called from vkQueuePresentKHR() which does require a wait, unless a synchronisation primitive representing Vulkan samaphores is passed between Vulkan client and the compositor.

If you are using EGL_WL_bind_wayland_display, then one of the things
it is explicitly allowed/expected to do is to create a Wayland
protocol interface between client and compositor, which can be used to
pass buffer handles and metadata in a platform-specific way. Adding
synchronisation is also possible.

> The most troublesome part was Wayland buffer release mechanism, as it only involves a CPU signalling over Wayland IPC, without any 3D driver involvement. The choices were: explicit synchronisation extension or a buffer copy in the compositor (i.e. compositor textures from the copy, so the client can re-write the original), or some implicit synchronisation in kernel space (but that wasn't an option in Broadcom driver).

You can add your own explicit synchronisation extension.

In every cross-process and cross-subsystem usecase, synchronisation is
obviously required. The two options for this are to implement kernel
support for implicit synchronisation (as everyone else has done), or
implement generic support for explicit synchronisation (as we have
been working on with implementations inside Weston and Exosphere at
least), or implement private support for explicit synchronisation, or
do nothing and then be surprised at the lack of synchronisation.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
