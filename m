Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDB72D0E77
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 11:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218A76E5C0;
	Mon,  7 Dec 2020 10:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520446E5C8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 10:53:54 +0000 (UTC)
Date: Mon, 07 Dec 2020 10:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607338432;
 bh=TugXDhrfwG8tOJseZps4g0RYy3XK8d+yZzgooc3nlHE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=W4+QdBQN4UXUZlgvo9x+34flkV/BPm2scPr567+HTIzFLvEDX4+Q/ajYrI50fAwIm
 8jqttQ/9ejtW+nPl6wgJhrCXPsIR6TL9oSXpeQxk0cvhackc6pE+RhV+X4oYBCxaM4
 jjX6wRzAhwnR+ZUQLCjZyBCj0uDLH8yMLSOwjC7twYu4RK/afZuNWl2taaIua/NVsu
 wS8qm9fxwuQKCYtAC4eyK0+IyXrZUsV3gg23VC5yu7SB/kS0uR1xsHzU3H/1slA/AC
 0CEEQUAgso6L1toNmC0LQ1AC0MgTuVvgZnW/inCRLuLyqlaX8XvrVqAml6tIyHLMIK
 2qzEjnNk2Mk5w==
To: James Park <james.park@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <CE57r-xvcKbKT0LCtCjasef7m8hy4jgYOsQ5_ntH16VGrzEFksPwVs2wL-gBdWHAhYrIDhXF2WmNIHvGd3bWhkqtUJvAakLI7vcgForuxM4=@emersion.fr>
In-Reply-To: <CABjik9cd_NWOSH79Y1x7Hj5iW6nqoP44XrNSDr+o5am07Suzbg@mail.gmail.com>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
 <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <20201207105109.599273be@eldfell>
 <CABjik9c+TVMK3685bkYp43PbqxoAosTxXEeQvH6hmfBD0YSz6A@mail.gmail.com>
 <20201207123514.65e4b868@eldfell> <20201207124454.42b87186@eldfell>
 <EdWYHKD3WXh4_hWSW633I_O9leJ7ib3vLux7KuDhdcl-3vhSphWQnDALaATh_HVU97nzVuDWf5j4pp1d9tnHCelC7ogUjBcqxzW7Z_erfIs=@emersion.fr>
 <CABjik9cd_NWOSH79Y1x7Hj5iW6nqoP44XrNSDr+o5am07Suzbg@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, December 7th, 2020 at 11:49 AM, James Park <james.park@lagfreegames.com> wrote:

> That would work, but that's kind of an annoying requirement. I would
> prefer the header to be self-sufficient.

I don't want to make it more confusing than before, but here Pekka (I
think) suggests to replace this:

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 82f3278..5eb07a5 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -24,7 +24,11 @@
 #ifndef DRM_FOURCC_H
 #define DRM_FOURCC_H

+#ifdef DRM_FOURCC_STANDALONE
+#include "drm_basic_types.h"
+#else
 #include "drm.h"
+#endif

 #if defined(__cplusplus)
 extern "C" {

With this:

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 82f3278..5eb07a5 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -24,7 +24,11 @@
 #ifndef DRM_FOURCC_H
 #define DRM_FOURCC_H

+#include "drm_basic_types.h"
+
+#ifndef DRM_FOURCC_STANDALONE
 #include "drm.h"
+#endif

 #if defined(__cplusplus)
 extern "C" {

That wouldn't change whether the header is self-sufficient or not,
would it?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
