Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11EE4A63BF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 19:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D157110E157;
	Tue,  1 Feb 2022 18:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467B110E157
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 18:26:00 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u24so35903804eds.11
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 10:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=+aXwDlSdPrYiqYRiGiR29esi6mI3TDnyNJ7vO9GrowI=;
 b=Xtbbhh99p98GDLdNgybjKyQOXYxO+0w5lw0bn88a9FlwZUDbMvOLij8BR0UPeE8E0t
 BgnEcWKwIxlkYYXnOaTTLOtJ1BFccMAkulPLTvm4rwFjEFPLL2T3Jb85syIKbyIy4zXt
 Dl9kmF72dUhaDyM7EQi+a2y4mBZ39DDZyM6jNihv6w3ayiVIMklIuoHv4ui6juVD4Wb/
 zqPq6u/VpBrQDf3JybEjZi97ZlsJ7Dbvjk4vLlXclTdvodMfMvQOpbmBJy6qh61ezTne
 3Yzt1NyCjHJax6zLmR0ys9rzaJhLGfTl2WuNXL5UPKj8j6r0WhUTbkangcHeJcSDfAyT
 9K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=+aXwDlSdPrYiqYRiGiR29esi6mI3TDnyNJ7vO9GrowI=;
 b=rj9SsZPqbOcF1wZU9QqiroVPfJav2jGT9Ssji3OAM6vrXlhd+fOyRDDfcRBnIMHEsz
 ZrFtvQQOpoJe11NI7t7OiXIfUJWr09MWv20Jcks7pbGA/8CV3yVLuH6xeMo8b2UnfPM+
 VGbElv/pD4H/s5bDyeY4coL8DEFbnA9Zhod17ndgzxxw0vSxD1wXYRgP6FYOITy9zRE7
 RttiSsbtZBTNQD1Sno4M9J8QefmgsWQuBzk8FMnKeJ5Hpv3XfOzgfytSCvNiQ6YS6Nx5
 dZ2w3qlEPZTj9u+olb8RICd6Rn1zfkYLVxczF6e0PVVlZB3yof7akkWfIyY2Lk/lkgmt
 BoTQ==
X-Gm-Message-State: AOAM531NG+hsxgbK0ymc1iCWikZKyMC9UbVrZ5mz80a4b1BgzE4yAidX
 BkHrtbT/qh9k6jVM26PhBVxQPxlC72tgnbw4qlE=
X-Google-Smtp-Source: ABdhPJxpKwCAbejEvtuOKX/WqqosPKIvoAMxOIdEXd4sM9SAZ5Uj0mhrqvN6hs7FVN9Lm4RrET+lNxegiUwVxrfPh30=
X-Received: by 2002:a05:6402:358e:: with SMTP id
 y14mr26662819edc.136.1643739958654; 
 Tue, 01 Feb 2022 10:25:58 -0800 (PST)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 1 Feb 2022 15:25:48 -0300
Message-ID: <CAOMZO5B55thnNGy779AxyLEznGqOPZZfzzwn2NwF=v48aHnKfQ@mail.gmail.com>
Subject: kmscube: GLES3/gl3.h: No such file or directory
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Carlos Rafael Giani <crg7475@mailbox.org>, dhobsong@igel.co.jp,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 buildroot <buildroot@buildroot.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

We are getting the following kmscube build error in Buildroot:

../cube-shadertoy.c:37:10: fatal error: GLES3/gl3.h: No such file or directory
   37 | #include <GLES3/gl3.h>

Complete log:
http://autobuild.buildroot.net/results/7f559e89a96273fc019056eae13104e14161a484/build-end.log

In OpenEmbedded the following patch is used:
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-graphics/kmscube/kmscube/0001-texturator-Use-correct-GL-extension-header.patch?h=master

What would be the appropriate fix for this issue?

Thanks,

Fabio Estevam
