Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088EA93EA8D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 03:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA9210E090;
	Mon, 29 Jul 2024 01:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BeKUdQVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C0C10E090;
 Mon, 29 Jul 2024 01:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gu8nc4h8/VPXWYTQQ7jGEnuWToEyWQDwNorGseCJ9kE=; b=BeKUdQVs9T/mOsR2COxlmWS78c
 2xBWQJt08Kxs597qByJ1mfcCHTs7202Geo5WnElJsyX9P5Tx/nqI2eH6ct/KEGzPr7IPxgSWfxjzt
 mlhaXlMQchOT9quFF5wfaiNbkZ3l3k6yiZbPzrKWjvnGodH6jtkPcygAI2hdaAtRmtM5dwKBU6TWU
 m6GOSQF8MLj1SoCiAq4fpHJvVsAzCurvGB00G14KYogDcu5Uli7z8QSTh9skFuoGMM9bSjFX37SGL
 7klgdZOtfcXAm16FBX/9rehZUvU3OND/pGhLNqKF6Hj1X1AOAMFblYRAWswMnX1dZdISiyhftqRxE
 MdHeHdiw==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sYFFY-003ITq-VW; Mon, 29 Jul 2024 03:32:33 +0200
Date: Sun, 28 Jul 2024 22:32:21 -0300
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, 
 daniel@ffwll.ch, Mario Limonciello <mario.limonciello@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v4 01/11] drm/amd/display: clean unused variables for
 hdmi freesync parser
Message-ID: <n335sldiuaq4tslcrsybeslq34tfr67d3vigbalp6gtku2yghs@j2guivjhp6ff>
References: <20240706034004.801329-1-mwen@igalia.com>
 <20240706034004.801329-2-mwen@igalia.com>
 <b0017268-5651-4031-901e-45e64319d537@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0017268-5651-4031-901e-45e64319d537@amd.com>
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
> Hi Melissa,
> 
> There are no commit messages in this patch.
> 
> Also, do you think this can be merged with Patch 5 "drm/amd/display: remove
> redundant freesync parser for  DP"?

Hi Alex,

Thanks for your feedback.
I'll add a brief description in the next version.
Regarding merging it into patch 5, I'd prefer to keep it detached
because here we have a non-functional change. I can send it as a
separate, single patch from this series to reduce noise and make
validation faster. WDYT?

Melissa

> 
> On 2024-07-05 21:35, Melissa Wen wrote:
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ---
> >   1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 98cf523a629e..1dfa7ec9af35 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -12108,9 +12108,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> >   	} else if (edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> >   		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
> >   		if (i >= 0 && vsdb_info.freesync_supported) {
> > -			timing  = &edid->detailed_timings[i];
> > -			data    = &timing->data.other_data;
> > -
> >   			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
> >   			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
> >   			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
