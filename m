Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKh/LdyynmlxWwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:29:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0AC19431D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED3010E6EA;
	Wed, 25 Feb 2026 08:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lM1ZKmfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF0810E6C8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 07:42:02 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-59e4a04f059so7677251e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 23:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772005320; x=1772610120; darn=lists.freedesktop.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nA6orqw1ilUvcxpwS693fEfzchG2J2+WvoJ8C1eqQSU=;
 b=lM1ZKmfHHC00GuzpbxNFYQFbKG9eKe+3F22yARoI/UmY41VFGHRuFz2uZbCB3EmAys
 slWx8Lc9gSFAUxG/j7RXfTvmxq14ad5CpyrwVXh2jL5KeDjHpL5MHFFvyjt2UTHh9qek
 2R0AZb8p3U0H0nSrQ1Rj0rpO9mmN3Ps1m31GXEhF8ks0MJH/F/doHtdpotyAOk4CZgNY
 tPm3gFaczp2R6zz3+oGTyjl4BlKYHO6Qxm7HGSfevcD+nCFn8V8VbRyRo9QkroKNppCM
 DtvovbqOUrkKGMBv4cpgNtqrh7gOb3doriITpO8aeawf1twqURIlgDVlgz8LmBgkaXR6
 JsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772005320; x=1772610120;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nA6orqw1ilUvcxpwS693fEfzchG2J2+WvoJ8C1eqQSU=;
 b=WaS+JO94kRWLJYvZWb3bB5jjLFyViMR7HbD9DfF4lRQV2GRMp58but7ofVyEc4tCdf
 T9325BvS9usekuheaArSV55LkcM95feOCRaG8CqTFoWafJ+S+bGajiTSZ7n84deYqR52
 bIF3CeB4apwS+frI1+3aPygD7tvH3Z9UDYhaZldLML8/+4EkWekKTmk9wkzbVqoFgrNM
 NDqq4ORNIFsMt1hlcDnTmdEww06Ss6SMFKVygww5Z2sNgvxzHlJ4m9ajpPpzY4CyABz5
 YeyjwKkmWchKhrtoXYt6jH9C9sQyZzrJmcmWAexp8oPO6A/7bKAelOlvMbVzmZ+DslaF
 /B2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3f0CaV7tVNR4ryxe2KMhmsWy14+trjZEtcB6+ym4mBXxtZbP9Jop1gDbfzeqVkQpElr5kYhtcewY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu58sFISY4g1qJRAiOumNupHxDtrGS0EO9kxznTzaP1tquhZ53
 7V+YNLI2y409dv16EmTq17whyyHv6PcDkvpziDhVHLxaC/ndPj4p+3I=
X-Gm-Gg: ATEYQzxEGZQV3dPdu3bB2qsFfX2FFYfMlEfz56ZpVO9VIveLUMV8E5qDDT3b+fN2VZU
 gMlfPMkZfkO5Q0CSbb73e4qQ5Mf2GZhVpMEJRZUZHzgPYgbr1ySLxmDQd6iUuOETi5E3GO9p8Pb
 OVyy3Jq1wz7uEsYuPT17e3WB51C3mHvD4uBvrs1tIz4gTTWWObxcDw4FHdRv+c56GjINHxbgwn5
 yN5uHYeH7i2qbVsmYGxZhTpBt8ZDctJYAe9BmmTuuov4T102rSw6+xI6BSZl28nBXM3a9vPnuWG
 XvLym5R3RD3C9AXvOQGXfH6g5YMefBqXUJnEXEhipq85WCuSKofpDC/NO787KxkPBJQyPgbXxuG
 DWMLecMF72Hrd6kDSOHg+n27kIs7SPUnuMFgzAg0Ho6uTYgLn0mlMwbTmjKQRIUvs3soNiLUDV6
 hG7gMWMcmG
X-Received: by 2002:a05:6512:334c:b0:5a0:efe2:e8f7 with SMTP id
 2adb3069b0e04-5a1026939a1mr472592e87.5.1772005320173; 
 Tue, 24 Feb 2026 23:42:00 -0800 (PST)
Received: from localhost ([2a0e:e6c0:20d0:4f00::1d])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a103e98512sm156088e87.29.2026.02.24.23.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 23:41:59 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 10:41:58 +0300
Message-Id: <DGNVGLH1VK9K.LHA4SXPPH8PK@gmail.com>
To: =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Melissa Wen" <mwen@igalia.com>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <siqueira@igalia.com>, <mario.limonciello@amd.com>,
 <alexander.deucher@amd.com>, <alex.hung@amd.com>, "Ivan Sergeev"
 <ivan8215145640@gmail.com>, =?utf-8?q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, "Xaver Hugl" <xaver.hugl@gmail.com>,
 <amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>, "Jani Nikula"
 <jani.nikula@intel.com>, "Harry Wentland" <harry.wentland@amd.com>, "Mario
 Limonciello" <superm1@kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH] drm/drm_edid: ignore continuous frequency support
 for VRR
From: "Ivan Sergeev" <ivan8215145640@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260223203528.213275-1-mwen@igalia.com>
 <aZ1YE6dcEfTMwly1@intel.com>
 <b6f267f4-812f-441b-939d-1ff24fd3406e@igalia.com>
 <aZ6iSdsTfzQX4_op@intel.com>
In-Reply-To: <aZ6iSdsTfzQX4_op@intel.com>
X-Mailman-Approved-At: Wed, 25 Feb 2026 08:29:09 +0000
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ville.syrjala@linux.intel.com,m:mwen@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:mario.limonciello@amd.com,m:alexander.deucher@amd.com,m:alex.hung@amd.com,m:ivan8215145640@gmail.com,m:michel.daenzer@mailbox.org,m:xaver.hugl@gmail.com,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:jani.nikula@intel.com,m:harry.wentland@amd.com,m:superm1@kernel.org,m:xaverhugl@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[ivan8215145640@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivan8215145640@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,amd.com,mailbox.org,lists.freedesktop.org,intel.com];
	NEURAL_HAM(-0.00)[-0.952];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6B0AC19431D
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 10:18 AM MSK, Ville Syrj=C3=A4l=C3=A4 wrote:
> I see no mention of the model of the display. What is it, and is it
> really supposed to support VRR?

The display is DEXP DQ27N2. It has a Freesync option in the on-screen
menu, and it is turned on.
