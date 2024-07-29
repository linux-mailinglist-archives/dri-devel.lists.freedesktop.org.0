Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8662A93EAE4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F8710E1BF;
	Mon, 29 Jul 2024 02:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WTIr8qBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B274710E1B1;
 Mon, 29 Jul 2024 02:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XBhNFDnfZGOIiwExbI9nRmKAUEJnxF3BB9KI+9GMhUA=; b=WTIr8qBtaiQVAIcwQ4kNLuQ+ak
 Seo7XOqHJ+SgZSfkOir1oVHdMHDqZmSI4QNcEQBYDv/so8Sbs5pLLOOQCzrhH9zIe7/2ZZ/GDgafk
 cq15rxPISldSVW7vR42PKFceXqod/7g27rOb1allxWNKW5LT5tEwN6k8ZQztNi9LRfURXs2fVKn2X
 Ub7X5tCX3pFZNYBbxjkjABfadxusgjp7jJSmtLskc+Yls6RcA3r6HaU7AhxL29fI+M46WJzZZArQB
 +3tfvE44LGsQgbqDiyc4yy2wzyInvC0Z5WWNjGw663zfWVpjacymHdadLe3xfkCEb1CwL4NTaXyPp
 PMRKutjA==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sYFhl-003JxG-TG; Mon, 29 Jul 2024 04:01:42 +0200
Date: Sun, 28 Jul 2024 23:01:33 -0300
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, 
 daniel@ffwll.ch, Mario Limonciello <mario.limonciello@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v4 07/11] drm/amd/display: don't give initial values for
 sad/b_count
Message-ID: <t2quwvdzchucxr3vxyaxvtm3nhvzrca6ek5q633hl2i7jud72i@cghd27hujxto>
References: <20240706034004.801329-1-mwen@igalia.com>
 <20240706034004.801329-8-mwen@igalia.com>
 <2ba30e17-609f-4a74-8482-15281dbbfdc8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ba30e17-609f-4a74-8482-15281dbbfdc8@amd.com>
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

On 07/25, Alex Hung wrote:
> Can this be merged with [PATCH 10/11] drm/amd/display: get SADB from drm_eld
> when parsing EDID caps

sure.

> 
> On 2024-07-05 21:35, Melissa Wen wrote:
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > index 85704fd75ee4..6df55161d6df 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > @@ -97,8 +97,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
> >   	struct drm_edid_product_id product_id;
> >   	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
> >   	struct cea_sad *sads;
> > -	int sad_count = -1;
> > -	int sadb_count = -1;
> > +	int sad_count, sadb_count;
> >   	int i = 0;
> >   	uint8_t *sadb = NULL;
