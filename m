Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3EB74CB6B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 06:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D172510E072;
	Mon, 10 Jul 2023 04:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4310410E072
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 04:51:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1688964698; cv=none; d=zohomail.in; s=zohoarc; 
 b=fgwd97yxrPrgATJIdwxjt/d0Q0XZyVoN8Ax1Rrb8mNSHOXnYHgWSHG078neBMnXN3gqZLLq+oRAhmT6SgjuA4UMF/Ht3tP/ZwzNFXeuBBzq9QV9Lzg0CeCKANDJr0QiFm+cW08aXV3DKZ1afQp+rDN7u5eKW50lJXxQEjd5EMUo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1688964698;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=A1sOx1vRN495Y3gjlbsvpWyzTeXNKgYfdMBZ5lw2c1Y=; 
 b=AuTknfaiK976tJqWst3Y5Fy1xKOLq2iwWiKhtMLJJCfAcdiLBOCVNvqUSN2FzdCt0RB9EqTtxIe5ZdNg25T1cgUwDLDYyu6eDD2rJorLvbup9yFTEplPxPz7O0TdtC/kiid1bWx3nO0qe0HsN9EE34Jzk/328K7VU3mNby2HnjI=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1688964698; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=A1sOx1vRN495Y3gjlbsvpWyzTeXNKgYfdMBZ5lw2c1Y=;
 b=rJtRQAth5mkon1U3m528MxKIzIx++TuQXlkt0PIxv+PEKG5lLIcaC5qtoefoPGw8
 IKN8Kds0VMJ3Phr6XnAcwEnN55oO7rPvJ1j5x1gNnSGIEjJUtvwexJPUTgALRESlHg3
 ak7wWSuJxsdE/nl9fVoSZglcMCO87toFwjV0hjEQ=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1688964667784444.66076465051344;
 Mon, 10 Jul 2023 10:21:07 +0530 (IST)
Date: Mon, 10 Jul 2023 10:21:07 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jani Nikula" <jani.nikula@linux.intel.com>
Message-ID: <1893e23997e.5fd81485262265.4190071169823460284@siddh.me>
In-Reply-To: <cover.1686075579.git.code@siddh.me>
References: <cover.1686075579.git.code@siddh.me>
Subject: Re: [PATCH v10 0/9] drm: Remove usage of deprecated DRM_* macros in
 DRM core
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Jun 2023 00:00:01 +0530, Siddh Raman Pant wrote:
> This patchset aims to remove usages of deprecated DRM_* macros from the
> DRM core (i.e. drivers/gpu/drm/*.c).
> 
> [...]
> 
> Siddh Raman Pant (9):
>   Revert "drm: mipi-dsi: Convert logging to drm_* functions."
>   drm/print: Fix and add support for NULL as first argument in drm_*
>     macros
>   drm: Remove usage of deprecated DRM_INFO in DRM core
>   drm: Remove usage of deprecated DRM_NOTE in DRM core
>   drm: Remove usage of deprecated DRM_ERROR in DRM core
>   drm: Remove usage of deprecated DRM_DEBUG in DRM core
>   drm: Remove usage of deprecated DRM_DEBUG_DRIVER in DRM core
>   drm: Remove usage of deprecated DRM_DEBUG_KMS in DRM core
>   drm: Remove superfluous print statements in DRM core
> 
> [...]
>  41 files changed, 463 insertions(+), 434 deletions(-)

Hello,

Please take a look at these patches I sent a while ago, and let me know
if any further changes are needed. I feel they should be good to merge
now.

All patches are reviewed once, except the last one.

Link: https://lore.kernel.org/lkml/cover.1686075579.git.code@siddh.me/

Thanks,
Siddh

