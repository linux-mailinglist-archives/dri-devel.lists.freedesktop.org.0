Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D052F5BF6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 09:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839296E03E;
	Thu, 14 Jan 2021 08:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7786E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 08:07:04 +0000 (UTC)
Date: Thu, 14 Jan 2021 08:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1610611621;
 bh=oZoLOvB8GFNjTNukq9k4F1x8Zrh7VuJWPVVKWBKbx6E=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=QntvKbV1vbBi+N/094QDG70LEkXfRBGSma8e3IoD4jHW+TxXVRJbXS9E1IGSKVB4d
 r1x0dNCfc3xC0p7aPRVYcrCXoU/zHBPHs6VcIudLRyY/D8YlQtBOAIlUwlLWFsLTy6
 mmrHtEA0JagQIO6GtkHlDdNY/uA5IsOJr5urCGRkg+G8K4w/hmRuPgq8lufieWChJD
 5TcCRFeHcuvG+KLwDvBouFhhnl7ADS8pN4F/SPg4uoyG/3rE7WKxn3YWUzTM7WuiUy
 5RjlIBQoAGXy+1qVUL3Mhm74oiIaUtj7oCiQnrh+BFVUKoZzfMmZCwRP8ixSh6c4yY
 2Kh9d84w2LHiw==
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 15/16] drm: drm_crc: fix a kernel-doc markup
Message-ID: <qe1toq6DLvoVNP7AaQXNqpa3qtfzGwKWuVz-uYiDIUcI0u0-xaQstZKPNqEbg9-lfHA0wN2yI_i-vQvoYJmoOS_v-XLO1pUfFE-9srEsxNY=@emersion.fr>
In-Reply-To: <2439fb6713e9b2aa27a81f3269a4b0e8e7dfcd36.1610610937.git.mchehab+huawei@kernel.org>
References: <cover.1610610937.git.mchehab+huawei@kernel.org>
 <2439fb6713e9b2aa27a81f3269a4b0e8e7dfcd36.1610610937.git.mchehab+huawei@kernel.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, January 14th, 2021 at 9:04 AM, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> A function has a different name between their prototype
> and its kernel-doc markup:
>
> 	../include/drm/drm_crtc.h:1257: warning: expecting prototype for drm_crtc_alloc_with_planes(). Prototype was for drmm_crtc_alloc_with_planes() instead
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Simon Ser <contact@emersion.fr>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
