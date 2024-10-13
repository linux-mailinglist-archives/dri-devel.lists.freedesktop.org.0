Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492C599BA14
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 17:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDF410E195;
	Sun, 13 Oct 2024 15:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="gNfsigam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 801 seconds by postgrey-1.36 at gabe;
 Sun, 13 Oct 2024 15:30:14 UTC
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0BB10E195;
 Sun, 13 Oct 2024 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1728833413; x=1729092613;
 bh=mdvAXA4CLbCZyMWN0oPclWBmFcvb8Gc0fFNL8xP5qGo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=gNfsigamM3jpKJT5INIc0awJDnqImyIsiSHcMXtFeXZLZsjHqgHZYvRY6Y0OMIOGw
 4WIPwluV20an4/0IXDg+TNx7wlbuN5OkfjsHNbCNnQg3vn6lCwVb5BgxWX/cL0DIgA
 OA4MUqSubC4uozUdxHWTJJ774ajQ02jDvRcBoatiYbi70oRC9y6EVkFYnHqzLuDvdP
 hKHaPoNoIBHE/xGGR9Es2wchVqnDrfv13P9RbSXDS/jPIDpyKxy4ntn5qQONsIuvfa
 NT0g8WUI4eRmJ3goM6co9S9Ap3d+m6hXhlSoFU10VCMcFMnXFogiTggjaKq10JPfmF
 2gUdqpvmVh/7Q==
Date: Sun, 13 Oct 2024 15:30:09 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 05/44] drm/colorop: Introduce new drm_colorop mode
 object
Message-ID: <atoA2GvabWJUvXGK1RLGNbFgPt6MRO2xt-5S3pGF3BR69MwEa-XPANobC_VEgawa3sdbz5zYNGKzr_-1eJtY9ipdGGxCLhRVp8CgI3d0xYI=@emersion.fr>
In-Reply-To: <nb7nlv8nVlD6Kyd2cY9FiA5BuxHu9BeVKYSbc_ukRLZKW-BqpCwonJDpoYLKs03i0c_WnujwguLcNfB8YONqSTBYsqDN5B7hZmCrxmchYAc=@emersion.fr>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-6-harry.wentland@amd.com>
 <nb7nlv8nVlD6Kyd2cY9FiA5BuxHu9BeVKYSbc_ukRLZKW-BqpCwonJDpoYLKs03i0c_WnujwguLcNfB8YONqSTBYsqDN5B7hZmCrxmchYAc=@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: f7a645f5b772da7f6dec90d3153db3e0356b63f5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sunday, October 13th, 2024 at 17:19, Simon Ser <contact@emersion.fr> wro=
te:

> Would be nice to have user-space uAPI docs for the colorop properties.
> Just like we have for other KMS object types:
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#standard-connector-=
properties

Ah, I suppose subsequent patches add some user-space docs in the form of
uAPI header comments instead of rst documents. That sounds fine to me.
