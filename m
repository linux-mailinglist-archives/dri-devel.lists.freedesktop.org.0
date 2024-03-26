Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E53788CB7D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 19:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590FD10F1AF;
	Tue, 26 Mar 2024 18:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LmBlsOn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D72D10F1AF;
 Tue, 26 Mar 2024 18:05:04 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-29c75e348afso4261573a91.2; 
 Tue, 26 Mar 2024 11:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711476303; x=1712081103; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=InAZ9/C9EDyJhkW+bEV5eavwbh4jrGbQhGajHqMOaXs=;
 b=LmBlsOn2gBY0xrGi6ldBA079Pg8f6EEUBzFzg+4biGo9Sbk8QwEWOvIKnfyl3E/PXk
 sC4GXttHVtPXZ9ZDGD1EZfQtEfz6cBxryDNxMWFiwfRH676ZQDbrOjdyvIzvTUozBnPI
 dgMAjupkNLwq0XWKKSMUTiVoL0mE9HmkaMiGXXzhy13Ixk5Fk9OuIupLLLvffp+HttmT
 SEFW1C2VewEDnaePKh4orVnO1u4NlAOHfir1mYyyD2QdMVq2+oWeswObi3crWdsioyGQ
 s57sb4650ueNm2aAUytowtBtQ6QReUSsMFIGJkO0R6K/W5N+FZCiZRphT2+LwQ0pTeRq
 +Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711476303; x=1712081103;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=InAZ9/C9EDyJhkW+bEV5eavwbh4jrGbQhGajHqMOaXs=;
 b=qm6MOPZOrlIvHYoUxmqeSZ9rZXQq/UQn3xWR8PL0dz5PVcLuNllCldjDIP4IK/fnU1
 ul6I568JwNHpVnFdiBtlrui/+85U/W9rYIeUCyXZ2kTN34+3NSUPoLIzirf54mO/yy7c
 dHkgNORYNVdqwEc6YLzJrHnujggkhUyw0Jy8RDULfANjeqQfcapsHbe0GvMwgFQmDouo
 r6xty8VVaEvePJ4goOVQEQGtgMpKYpiCXpdEvUM+UXIMKhwuygLrhG22b2J8tpQSeLwJ
 EJEee5uuMzAMRg6oldNj5d1Xvd30B3MYTbJ08Hr6utGrq4q9foehrSk4BUBu+tJm46sP
 21SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHgQxth0J6ybzv1/NLVZP8OVr7dMVMslD73blA2O4T+RZAshZ9qzJcS+rFveFrYfz+4j55/CvvFc9UFW3XcgPOK54VbME8qdR3ybTsrxD8EBe1PEIPtz25rid8Mwiu8CvVQkzNnDwm7QbEkJipPJdUANo=
X-Gm-Message-State: AOJu0YxDUqeQGXn2uBhyl45LHndDouXmMuAZlA8YKvl9Cg4yga58PgHb
 uJ5G9xlRmD+eRvXrOIxjME+jPBquR/TqlZCENgSjXfqnePNn2XonuW7Ro+VezT4XKgwciEAUiBE
 cZmdgEA1BIelKfAyThoVte+s6c6o=
X-Google-Smtp-Source: AGHT+IEBhA+WnnRTf8AR2UyUOmIouX8FcColXZqyCdRGDNFO76HxCoWYBYVkcsPJZ6LizCzy9BOlPUU/AKNzLxSVaQ8=
X-Received: by 2002:a17:90b:380c:b0:29f:e443:204f with SMTP id
 mq12-20020a17090b380c00b0029fe443204fmr8861033pjb.18.1711476303337; Tue, 26
 Mar 2024 11:05:03 -0700 (PDT)
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 Mar 2024 19:04:34 +0100
Message-ID: <CANiq72mbsAYmR_dRPpQQ=9-NWhTtp0TWiOz0v=V-0AvwYbWw4A@mail.gmail.com>
Subject: drivers/gpu/drm/qxl/qxl_cmd.c:424:6: error: variable 'count' set but
 not used
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

In today's next, I got:

    drivers/gpu/drm/qxl/qxl_cmd.c:424:6: error: variable 'count' set
but not used [-Werror,-Wunused-but-set-variable]

`count` seems to be there since commit f64122c1f6ad ("drm: add new QXL
driver. (v1.4)").

Untested diff below -- if you want a formal patch, please let me know.

Cheers,
Miguel

diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index 281edab518cd..d6ea01f3797b 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -421,7 +421,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
 {
        uint32_t handle;
        int idr_ret;
-       int count = 0;
 again:
        idr_preload(GFP_ATOMIC);
        spin_lock(&qdev->surf_id_idr_lock);
@@ -433,7 +432,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
        handle = idr_ret;

        if (handle >= qdev->rom->n_surfaces) {
-               count++;
                spin_lock(&qdev->surf_id_idr_lock);
                idr_remove(&qdev->surf_id_idr, handle);
                spin_unlock(&qdev->surf_id_idr_lock);
