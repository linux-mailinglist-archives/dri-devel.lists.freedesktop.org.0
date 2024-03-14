Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA06A87C452
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 21:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A46910F662;
	Thu, 14 Mar 2024 20:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tai2F9MF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1AA10F5CF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 20:31:54 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-568a3292916so1218704a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 13:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710448312; x=1711053112; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kZIDi3Y08QpzEesZwVXxzPmG9ypMQJ5jhtYTYB147rs=;
 b=Tai2F9MFu79BVsnaprOUgq9nmjJQydweOZ9Hrijv/4eQlA8PH4XKRXXtxaMaevX2TA
 3RTbWWzLe9exnryH7XV+wfHGpx0CDllXWmVZSBZ8yVpfqZcyP9de9RW8L3vhWX081AMu
 rv/uuHr9/NTV4Nki5JKY5UucD4DWBlPkXRab+akAJUbuyEhH9evGvus685Z/OyLaDFdj
 HPKBSF5D2bmkuShqvifgvatbM9sCrT1ScW5zlrtZkFlT3aEXKrsYrU7MVUlWDTa4wP3e
 cC+I0cgKMKj6bjWNFwwbPPSg1ByuKS5zSQxcCV7Az+X6a3wM9RsGeARjwdDN0hbZVEmD
 RUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710448312; x=1711053112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kZIDi3Y08QpzEesZwVXxzPmG9ypMQJ5jhtYTYB147rs=;
 b=tePWpVhPxmAuSj+2gd3IAY/trzyz/rSh+sJ40bD2FUmsaNCDTH249itLWfqBr4lfuX
 UupttLOv7ctHuO69fpWF2ruuK416/NVzADSAZB+fijph704/kwfmkgflAMu6akZb53bn
 4dTn+SE4DYJjJEfPjTPl9N2fg1FIZ32Xik/U4iPgsCcOedKuNVeb4MNjRwfO8lthCT4E
 87OMRwA6MGJfJwoPOUwoe/PyDQbzLpuxOr0p6Ht2v184tn9u8hb4m/UncdhLcsAelon3
 Fa9jr2sRb9RLbg++yC8Re8AU6FnvuBcb0BW+QSiPVtV+GraTXLXaKDbuD+QbusxM58n3
 1DVg==
X-Gm-Message-State: AOJu0YwiFpKKNq9vCSaML2vhx/6913SbNml1pA6twgmy++1jm4jGd+Jx
 JyTnwbqWX1HkCeEEqj+ZxJRfJDGdN48ZYbqTk9btWFjeJ4XUS00ONrk1MpDNREgKowN5wgaR7fK
 7DwmJynRde414FU5yOvvK8K3NdYo=
X-Google-Smtp-Source: AGHT+IGUgzuk/EcqlW7m6e6FH1uKLqsdDhuXbs6/9pNaeVMCVxrSY6lcB7KuNYWtxQybyl6TvdCnIvxgujqnwa1lEI8=
X-Received: by 2002:a05:6402:1ccf:b0:566:1952:694c with SMTP id
 ds15-20020a0564021ccf00b005661952694cmr2109388edb.20.1710448312328; Thu, 14
 Mar 2024 13:31:52 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 14 Mar 2024 13:31:40 -0700
Message-ID: <CAF6AEGsRLPqddgc2MKCXKD1TDFuwxRs_6Pj=oDuj4gah0D-07Q@mail.gmail.com>
Subject: Time for drm-ci-next?
To: Helen Koike <helen.koike@collabora.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
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

When we first merged drm/ci I was unsure if it would need it's own
-next branch.  But after using it for a couple releases, a few times
I've found myself wanting to backmerge drm/ci changes without
necessarily backmerging all of drm-misc-next.

So, maybe it makes some sense to have a drm-ci-next branch that
driver-maintainers could back-merge as-needed?

Thoughts?

BR,
-R
