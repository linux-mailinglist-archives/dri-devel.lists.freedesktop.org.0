Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F31D3E8900
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 05:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C2E6E09E;
	Wed, 11 Aug 2021 03:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B4C6E09E;
 Wed, 11 Aug 2021 03:48:51 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x14so1479721edr.12;
 Tue, 10 Aug 2021 20:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=DRmn/zkTQmygN4gcRB0A09Eou/i2TXzWeXUFraSIqFg=;
 b=VZnlxnrPHGyNidVXu7SgDTse5YKaLnZa3POZF9I+5V9i+GK35xFv+mGYKiB1sb4azt
 XJZq1w/3I5gcwRtrjNKTGDivieAKz3uVSkwHAeZpVoSdbBOjScj0RRUBd95vaRok+ySn
 AmYz11vd/6Oqp/H7xGAIrCcxlUA3fkKtRXEARBpgx1T4m9tgrQ0yCH09UHK2cu503d9e
 aNPqGo4JBI5QrhlJtkoIR0f3J5cbLaRSebNuS0qElVAIqUkrz3iu4yhkn5m6J8XDPunJ
 SA/vAMIDZfjV3fpwJlj80USA0FPX4afFmmjuEFQgGq6Gc/mGmyL4R8rf4HD5HONwCB8b
 LQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=DRmn/zkTQmygN4gcRB0A09Eou/i2TXzWeXUFraSIqFg=;
 b=bsUIBHa0EvzMEX7lAhD0u89gg8q+HenacpYipE78HjQ/trxGtxRfgBivE0DNGQRIQ+
 RT9ilQoCBi/28F+j66TFH3H2jItSqi2xvZVYZuFq/G/2FXyMcnAcOuueabH53xQnJTqA
 7h5Z3+IA6k8NsZsxeCAEv6Z6JcPYeptKtO5rguq7mIebh6tg6eXR2mPimTexDcryEIok
 pbiBqAdMM75ayQRFn+MDUW6PtHPtmxkYwtyT6ZR5bJ8YyHUX4lj5+7e+SOjywN1sYUn5
 FC5UzSWlB/dYHM1JrI8KYBIv/C4BVEOl0p96c4jyjSdUXUl5HSjtfwfFKu/d6l6EAMpb
 4XDQ==
X-Gm-Message-State: AOAM5307BWVx/DoK/QYWaBAWfHCqf3/FxZShPsKpopsI6C5nP2UBo0VE
 QpkraGai5OJHYIwBNMg0yS4bRqZEaSXlfenTZeOYRDefBy8=
X-Google-Smtp-Source: ABdhPJwPq0m3ZuS0WzmxT9j5Z2VJifg3B08XUqMOPov31QvzORJEpGtKtdiHlgrzKFkzDkt4VoaIZ3fwZ9VSP02peF8=
X-Received: by 2002:a05:6402:1289:: with SMTP id
 w9mr8931171edv.127.1628653730281; 
 Tue, 10 Aug 2021 20:48:50 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 11 Aug 2021 13:48:39 +1000
Message-ID: <CAPM=9tyT17Qbd0b46Xap=vGhiicTKko7qCEsFJwOBVsb=_2axA@mail.gmail.com>
Subject: missing signoff on drm-intel-gt-next pull
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

dim: db47fe727e1f ("drm/i915/step:
s/<platform>_revid_tbl/<platform>_revids"): committer Signed-off-by
missing.

I'm not sure how much pain it is to fix that up, but
commit db47fe727e1fc516cf60fc9ab8299605ef3c2d54
Author: Anusha Srivatsa <anusha.srivatsa@intel.com>
Commit: Matt Roper <matthew.d.roper@intel.com>

    drm/i915/step: s/<platform>_revid_tbl/<platform>_revids

    Simplify the stepping info array name.

    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20210713193635.3390052-2-matthew.d.roper@intel.com

It's definitely missing an S-o-b by anyone who handled the patch.

Let me know if it's insanely painful to fix that.
Dave.
