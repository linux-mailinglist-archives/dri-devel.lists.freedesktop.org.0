Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311AB33320E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 00:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E3C6E09F;
	Tue,  9 Mar 2021 23:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EECE6E09F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 23:50:42 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ox4so17466009ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Mar 2021 15:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=If4jvs/NNoN9K3KBkMqFtztdMDA50f6Hs81HuYaAHiI=;
 b=pA6wwod7DMzBCiHBwPtXeeW0o9WEdPPpcAnWqrOdWfhLpNsireNNVOk94XgMqcy8FW
 CVxqpRE/ufhnBeEkZsmXHwk/n+1PYhuw9X3C74/l2lMVN/zxfi1czmOXTxhoD2qKDh3Z
 pkCZ7P0gQ5op1vq6yqmVLU8b91lHOF0yciejPGePIXtL+KcPZyESYnw4MOuciE69mWGR
 9KLJEzynLXDDXmuNbevQMK7ZgyXaM5G52h8KAo6zAH6L3zXOV/urA5LRLO9CKbfuB0zd
 mTDqO5CYRrIHQBX9jDG1iDlupnFUBziTqtVSP7pokNRsU86O9t3W2474CarSPF+NHPWl
 Lh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=If4jvs/NNoN9K3KBkMqFtztdMDA50f6Hs81HuYaAHiI=;
 b=Cyv9cNwlV1bYCXw9xkhHyBaQE7AZZyvWbqt43ECsERZ7kzCAi0BH8o/Ct6eRW6Vx4C
 Xy9ivWmaSAHxQeAE91bNI9jQFci7gJs4HIrcW86YT4GMoieWJ5DVdz5tPnKra1YUGg7/
 d1iKCUK62LJP/sC6doNhjroB0CQCsk9c/WqEVDbZRga/Cjtnx5v2dObb2duxMOKF9Aqs
 4CBBJ5DCwRsvOrZgKfPRvYgzUFjEj9UwIs1bXUbc8R5ORoxpjEuoxrZNlkdHWlXyCTqa
 zWhasXAgG2JGy945/9O0JXzZNZ6MDFWj2AWuKuxFIyM+QLPXkK1d3H3iCn1P8vRJ7H28
 ++wA==
X-Gm-Message-State: AOAM531pvSY7MCdYMxxy92BAh5xU35BWhKzzX1tzArVdBSykGC88A0r9
 J7uyHjsYhRq4qtnTvjiAW1yZbh+J2B2eAEcva/U=
X-Google-Smtp-Source: ABdhPJzsDyjJKZo8IrgA/8AzOQUfHOBrhXk0qN1+qqO6fTNkYDIdK8SAwGiccXqQn/UWbVyHfyC+jBoV9gsGknmOJPw=
X-Received: by 2002:a17:906:81c9:: with SMTP id
 e9mr564849ejx.456.1615333841060; 
 Tue, 09 Mar 2021 15:50:41 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 10 Mar 2021 09:50:29 +1000
Message-ID: <CAPM=9tyZF=seWUswnp7M3RbDQC2hLUc0wjpYYyEfn3dgpOf4zw@mail.gmail.com>
Subject: don't base trees on 5.12-rc1
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey maintainers,

I'm mostly sending this to the -misc maintainers because
drm-misc-fixes is based on rc1 at present.

This needs to be *rebased* not merged up to 5.12-rc2. Merging will
still have the bad landmine commits in the bisect history. This is a
very special case.

But otherwise to any other maintainers reading this, please avoid
5.12-rc1 as the base for any trees for this cycle.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
