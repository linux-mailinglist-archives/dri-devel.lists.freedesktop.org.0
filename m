Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEDF49AFC6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44BF10E89F;
	Tue, 25 Jan 2022 09:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891F810E660
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:25:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id CE093580DC0;
 Tue, 25 Jan 2022 04:25:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 25 Jan 2022 04:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=b0OrAtOUGTOVO2
 OZvmQVAemTz6zYG91EI3XfSujvUt0=; b=AkEeXo0u/6X9Qlo0cOxdNlKi0ee2Sw
 wEBJ3FwQZ1pezHpq+CJVJ0mEnqOTmJdIguU/dosGigCD28pT5cMfyjVJyecseKLM
 VUx6L5paVbIvADFHznA2HGIGPVpo7KunEYqL7wDLYJdPUlCVPQ7PChq/8a9c4Fh4
 1Xh9nxadC9Ye3ZTsJi/ckompzPXnRxw3KO4LTnGDBXjhqScaVJTXPKUfV+nMRprq
 W9GZByTdDq8LdPTt/mP0EQXq0ELK/BfrsYsQwX60smMh7A8ifa8Aj4D3jT4QbFMR
 +z9aC1kWaKLhFWXEzBXkF1JfGcxtIIStjuPiw6w2a7bRGTB6Dv81uf1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=b0OrAtOUGTOVO2OZvmQVAemTz6zYG91EI3XfSujvU
 t0=; b=OwWQmx6k79btOZa7l2tNejI5diao3ZVjlA37BdEV67dnyI9LhnEyPysLt
 7evJ36V4EqGNK6Mgv+/NcDmPskwhlJcyl+i/KfYcDynj4aKbJVjAnZbN4wjLWHU2
 u5Fi73EFcwn0mnMjdBJRxFtbGA4bpUBSJdC7qmDV0LCpFJSKD7Q+wg9z/uWZpAyn
 8KW4T2xlWa8fb3+M3XyUM8Wg7z3eERhWohTJkiLL92CjyclRHsAAaIdCig3fMI7a
 HwRoK2MxLou1RhH7CkVAgK78d2ba0OXMHcH9u3XXz7jYFV95sVRGACioUs+Zz7Ca
 i3vZf5MiZh9gghlym6paZ0QUPtDkQ==
X-ME-Sender: <xms:A8LvYZ4n3dQTmczYoQuJ00Nm3qyUaQ8ugcZODrqw2Bo9cvy9IxoH6Q>
 <xme:A8LvYW7uXyX1tbXnI_shnM3Xbx_ZPsUqZ4hvStQaLBISadeNMKwltfohdIoUkHGHa
 kWeJzrzDyQII5J37ZA>
X-ME-Received: <xmr:A8LvYQex10IZE_ULs5D2HY1A0UY7Al3SH7DKrhQNa5bS06cTDtR6KVU0ciPvvG0klq_itt5Qn2kNfPwxm_BehHo3NBFp1aG9JECiKWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:A8LvYSIWOshQzZPFxKr9I8MaWzGUUQVHvhUp_fhb6V_fsd_0Yit83g>
 <xmx:A8LvYdK8OZCB1n4S5IckmceE7rB3xpptKdgIU54SK997J3YZURZTUA>
 <xmx:A8LvYbytuPZliW2SrLXChzWyoN5eSDBcvCsSzgmDdamadi-anzJ8bA>
 <xmx:BMLvYWUDaS9iuglxdIV0iroftoUUmbRIknOhfb41onPiavjXTTV1sA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 04:25:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v4 01/16] drm/edid: Rename
 drm_hdmi_avi_infoframe_colorspace to _colorimetry
Date: Tue, 25 Jan 2022 10:25:10 +0100
Message-Id: <164310270996.583056.2497444758740265576.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-2-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
 <20220120151625.594595-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022 16:16:10 +0100, Maxime Ripard wrote:
> The drm_hdmi_avi_infoframe_colorspace() function actually sets the
> colorimetry and extended_colorimetry fields in the hdmi_avi_infoframe
> structure with DRM_MODE_COLORIMETRY_* values.
> 
> To make things worse, the hdmi_avi_infoframe structure also has a
> colorspace field used to signal whether an RGB or YUV output is being
> used.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
