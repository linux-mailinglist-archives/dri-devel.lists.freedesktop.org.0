Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF4tJLfXe2l3IwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 22:57:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAF3B51ED
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 22:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CAE10E8D0;
	Thu, 29 Jan 2026 21:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="Wm1XMogD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACEF10E8D0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 21:57:06 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 522C2323FC1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 21:57:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1769723825; bh=tCPe1r1yufyWwEYzedivPD/WCN/MHHue2oFjcOB+g6g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Wm1XMogD2RmUAA/VHltJGfMihdHR+cUTTBffmqQ39Cx/yR8aoGdNtccgWizOr1Pz0
 BsbbqpnhqlbGFCTTXjLVnjOepQYx+ZKV3h2VkNPo8wn7hkKOkFBk4Z75Rp9Yk91YWe
 m/BE3BMcGsXc41Qjp8kiIUQwA+1+FzMD0ImeJoSp9n5CMy/wsAtVNrSBCLGPvydS9K
 IIc3eUXDHFjSscOmSyNzRgx2zeNaKLGjihcz8vUL4zqy+8tyE5cWfARFfd/Po6lYR9
 Ljg6uXyr3miSd96dHWABxsxdhcPOUhMbp1wx1yKkl8PW1MhCP6BmBg4xDQ9P/iS8ly
 wUK+jD0Kz5ZyA==
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-64942ebf1a3so1505488d50.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 13:57:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVdtB82rcM9pg5I6GT2dgnjuk6Q/PDv3YrXuXa8z9Dmd3gkJF8jFG/GmdIM7wHKXvpK1URk5seZvuY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2LfTivXMMaR3YQ5HgThDwrulcabKxSNy805HVPr3ZoPMSH/lJ
 HbpzeQBt20+krNM9ngnIuMlNNNfveD27+AZEqJWuuTpeNY+WTUWcSNe3WDBQTljKFv1GegLU/HO
 SyM83cVSk6rV2Zq1UjUrOak1rwXsjrPU=
X-Received: by 2002:a05:690e:bcf:b0:649:5176:137b with SMTP id
 956f58d0204a3-649a84a4be0mr793461d50.53.1769723823608; Thu, 29 Jan 2026
 13:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <17cd6378-e3fa-419b-90d3-7e0549817110@amd.com>
 <f71df23e-f267-46b7-8fd8-4235e9a7a7fb@mailbox.org>
 <2203806.9o76ZdvQCi@timur-hyperion>
 <eef1982a-ddff-4aea-8ece-5aa1995cc2ec@amd.com>
 <ab52825d-8f26-4b52-af5d-4051760b2aa4@mailbox.org>
 <6f1239d2-eec3-40b6-aca7-5b278350dd04@mailbox.org>
In-Reply-To: <6f1239d2-eec3-40b6-aca7-5b278350dd04@mailbox.org>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Thu, 29 Jan 2026 22:56:52 +0100
X-Gmail-Original-Message-ID: <CAFZQkGz54fuprfAwT1BiadfrqJu7PWHNmFGkFzAYacVqPq-vZA@mail.gmail.com>
X-Gm-Features: AZwV_QjGs1gsWqksnCPJJYDN74_QLdugrEf-tBl706rp-yGiMjQqEbYSaX5D8cw
Message-ID: <CAFZQkGz54fuprfAwT1BiadfrqJu7PWHNmFGkFzAYacVqPq-vZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 Alex Deucher <alexdeucher@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, 
 Kenneth Feng <kenneth.feng@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kde.org:s=users];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[kde.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[xaver.hugl@kde.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:christian.koenig@amd.com,m:timur.kristof@gmail.com,m:alexdeucher@gmail.com,m:someguy@effective-light.com,m:mario.limonciello@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sunil.khatri@amd.com,m:cesun102@amd.com,m:lijo.lazar@amd.com,m:kenneth.feng@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:chiahsuan.chung@amd.com,m:mwen@igalia.com,m:Jerry.Zuo@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,effective-light.com,lists.freedesktop.org,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[xaver.hugl@kde.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kde.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,kde.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EFAF3B51ED
X-Rspamd-Action: no action

> Another possibility is that test-only commits with the DRM_MODE_ATOMIC_TE=
ST_ONLY flag (which can happen in parallel while the kernel is processing a=
 "real" commit) accidentally have side effects on the current kernel state,=
 resulting in the "real" commit failing to do something it should. There ha=
ve been bugs like that in the amdgpu DM code before.

Some users reported that GPU resets on dGPUs happens way less often
with legacy modesetting than atomic, which led me to the same
conclusion of possibly missing locks in the driver.
To test that theory, I recently gave some affected users a patch to
lock KWin's commit thread(s) while doing atomic tests on the main
thread, so it never does two atomic commits simultaneously.

Testing on APUs showed that it did not help there, but as I haven't
heard back from any dGPU users yet, it's still a possible factor.

- Xaver
