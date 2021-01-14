Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868422F62C6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 15:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C2E6E3EC;
	Thu, 14 Jan 2021 14:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095986E3EC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 14:13:31 +0000 (UTC)
Date: Thu, 14 Jan 2021 14:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1610633608;
 bh=1xVDP+DpaqaHjOhRD3Fsqb5+o8cs19izEhMuZCBEwqo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=U2Hms97g1LH6vW09r/VQijPieVbd5M9KZwfFYnqZFw/WNKkybteyo212qly59QGy0
 LSTanfzOSaut0zhy+9zyobjVH3TMApTgiDPYLRvVxKsvMl11EYZ3L32WPZmNp1NW4R
 V3LVXh8W8ggu+nkW2g3ArIDh1UfjiisPsMf+bNXFhmgaOL72zTI3RVeSyGC3so683M
 ic9bJj5ZZAlyotwvabcw0tx7AUVOZIas3d+CqwWozevv5SsR+VKJUMSPRTa0VE6TDl
 83mfmm+irCRNF/pJUrFEAYtS9q2j3YP1SyubM6A2hFlaxL7vDwVysoOpObQNfEDw0b
 FF4/qFMEONT5g==
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 15/16] drm: drm_crc: fix a kernel-doc markup
Message-ID: <GS4SAPqf7Gl2MJ4pYYlRq38wmiYovdE5GErbY3GKxpiySr5i_FKHGWBMnA7MIDR64-bKHEJPfo7aqbzaDz4DCeoyCW97VVEOUAWGoK1pUHE=@emersion.fr>
In-Reply-To: <qe1toq6DLvoVNP7AaQXNqpa3qtfzGwKWuVz-uYiDIUcI0u0-xaQstZKPNqEbg9-lfHA0wN2yI_i-vQvoYJmoOS_v-XLO1pUfFE-9srEsxNY=@emersion.fr>
References: <cover.1610610937.git.mchehab+huawei@kernel.org>
 <2439fb6713e9b2aa27a81f3269a4b0e8e7dfcd36.1610610937.git.mchehab+huawei@kernel.org>
 <qe1toq6DLvoVNP7AaQXNqpa3qtfzGwKWuVz-uYiDIUcI0u0-xaQstZKPNqEbg9-lfHA0wN2yI_i-vQvoYJmoOS_v-XLO1pUfFE-9srEsxNY=@emersion.fr>
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

On Thursday, January 14th, 2021 at 9:06 AM, Simon Ser <contact@emersion.fr> wrote:

> On Thursday, January 14th, 2021 at 9:04 AM, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>
> > A function has a different name between their prototype
> > and its kernel-doc markup:
> >
> > 	../include/drm/drm_crtc.h:1257: warning: expecting prototype for drm_crtc_alloc_with_planes(). Prototype was for drmm_crtc_alloc_with_planes() instead
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
> Acked-by: Simon Ser <contact@emersion.fr>

Pushed to drm-misc-next, thanks for the fix!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
