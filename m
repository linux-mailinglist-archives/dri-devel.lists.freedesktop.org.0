Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHA2D91+eGkFqQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:01:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57C39166D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24F310E4EF;
	Tue, 27 Jan 2026 09:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="X+gIjFdN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3517A10E4EF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769504466;
 bh=noo9XsAcC7n3F4JCncujc4ESels/5xcyYpBpkJ9bFy0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X+gIjFdNgCgMDfrS3icP5NKrOS9hVcQAijOwjnlOVaFJbTMXEuWg76e95TRg4cr3n
 Qo1v90TEZ4mAtIdolCQ93aNR8Tiw1xJG2lXMwY2G4CvJe9GSxEcA53mJK0B61VHczz
 UimmQLOiDqrBYcdh43olLdK9W1YCW1xX2okD+gj0I5EBqUnQiFE884Jqmh3g3I5Tsg
 oQ/cH5uq7Q0TAeJf96DrFwzxkOT56ban2l0SblMUVbSPcqxdr3fmKi6xADdMsr0IFH
 yEExYV37cf8rW2C1z3xjRz6r+MgSlwbv5qjAf7EMzfHz2ETwhW2I6mrge9m+IrpxYI
 nz4UnXHGvmcqQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 198F317E1276;
 Tue, 27 Jan 2026 10:01:06 +0100 (CET)
Message-ID: <e5177fe1-2ee1-465e-809d-92233efa2095@collabora.com>
Date: Tue, 27 Jan 2026 11:01:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm: Add CRTC background color property
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Matt Roper <matthew.d.roper@intel.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-2-2ff1127ea757@collabora.com>
 <1425ed35a21bcd9633524d4fc747b71a17068363.camel@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <1425ed35a21bcd9633524d4fc747b71a17068363.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:nfraprado@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:matthew.d.roper@intel.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[131.252.210.177:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid,intel.com:email]
X-Rspamd-Queue-Id: A57C39166D
X-Rspamd-Action: no action

On 1/26/26 8:23 PM, Nícolas F. R. A. Prado wrote:
> On Fri, 2025-12-19 at 23:46 +0200, Cristian Ciocaltea wrote:
>> Some display controllers can be hardware programmed to show non-black
>> colors for pixels that are either not covered by any plane or are
>> exposed through transparent regions of higher planes.  This feature
>> can
>> help reduce memory bandwidth usage, e.g. in compositors managing a UI
>> with a solid background color while using smaller planes to render
>> the
>> remaining content.
>>
>> To support this capability, introduce the BACKGROUND_COLOR standard
>> DRM
>> mode property, which can be attached to a CRTC through the
>> drm_crtc_attach_background_color_property() helper function.
>>
>> Additionally, define a 64-bit ARGB format value to be built with the
>> help of a couple of dedicated DRM_ARGB64_PREP*() helpers.  Individual
>> color components can be extracted with desired precision using the
>> corresponding DRM_ARGB64_GET*() macros.
>>
>> Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>>  drivers/gpu/drm/drm_blend.c               | 39 ++++++++++++++++--
>>  drivers/gpu/drm/drm_mode_config.c         |  6 +++
>>  include/drm/drm_blend.h                   |  4 +-
>>  include/drm/drm_crtc.h                    | 12 ++++++
>>  include/drm/drm_mode_config.h             |  5 +++
>>  include/uapi/drm/drm_mode.h               | 67
>> +++++++++++++++++++++++++++++++
>>  8 files changed, 133 insertions(+), 5 deletions(-)
> 
> You should also add a dump for this property in
> drm_atomic_crtc_print_state().

This and all your other comments have been addressed in v5 [1].

$ grep background_color -B13 /sys/kernel/debug/dri/display-subsystem/state
crtc[82]: video_port0
	enable=1
	active=1
	self_refresh_active=0
	planes_changed=1
	mode_changed=0
	active_changed=0
	connectors_changed=0
	color_mgmt_changed=0
	plane_mask=1
	connector_mask=1
	encoder_mask=1
	mode: "3840x2160": 60 594000 3840 4016 4104 4400 2160 2168 2178 2250 0x48 0x9
	background_color=ffff000000000000

Thanks,
Cristian

[1] https://lore.kernel.org/all/20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com/

