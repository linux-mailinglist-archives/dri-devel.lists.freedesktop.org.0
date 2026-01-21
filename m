Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMULB5zbcGnCaQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:58:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E740B5809F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E3910E7FF;
	Wed, 21 Jan 2026 13:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="dKpl6QC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C124A10E803
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 13:58:47 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com
 [74.125.224.49]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 8A93533FB75
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 13:58:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1769003926; bh=t+WAegLd0O2DA7u4H3Ymm5GHutH0tSda5Ue+u5MqbKo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dKpl6QC24aDxNbPcdRMGR67Strq0xoxamUE44MsHf8qW24/6jfsk4hD79rR/KSLmX
 JyOEGNp8XxtIl0EtKhAfDYI75UzVsmodkNXNfPxbY06ZGqQOh0YfRuuByKC65B3OVE
 GpNKmoNRC30JLnQItNBFwIqnO5SV1ZRzsezq8s8AXJ1PV2iU3uKC3Stfw68FpuczZM
 zEwwLePy2yBMeFis8UycwhbijsCBDnhRnK+Fp22+U0tMGdgb0BHPhzC5uMAYdnJkt0
 NEclQY/D3vvbM66rYdXZUV/pLqIOzIdo4r11nKgrooylgzDI9yE8jSCLexyKm6JBK1
 FAYidJud3+dng==
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-6446c924f9eso5492960d50.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 05:58:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVl1YD8DM9jUcHw+Z+2lKS3tWOPqAQhEaVydR28yQ+INgVGJVafKQ2QNpMrCpth+hQlBLb0d/bO9uM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3SXDZL45EXOgXQc2rvB9W0TrzhfDz8BnDcHbDkoNo9sWf/fhv
 0c3Uv3C5Z11G/umHVzvdfzZCSrH6cEqMQhMa5VGcT5XRr4xFiHcGV/bvWcJCEEbs4Sey1+0Sifx
 2GnwDisyw8Z4DvpNawzAW+ByLOA3WERI=
X-Received: by 2002:a05:690e:c43:b0:649:4640:f8ee with SMTP id
 956f58d0204a3-6494640f9f8mr1693053d50.6.1769003924752; Wed, 21 Jan 2026
 05:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-1-d51d9a351684@intel.com>
 <CAFZQkGzQ3GmUHibTJS2xCWsya2=Bh_Uo8zjqN5f_K4HMdfpHCA@mail.gmail.com>
In-Reply-To: <CAFZQkGzQ3GmUHibTJS2xCWsya2=Bh_Uo8zjqN5f_K4HMdfpHCA@mail.gmail.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Wed, 21 Jan 2026 14:58:33 +0100
X-Gmail-Original-Message-ID: <CAFZQkGwdpfEzv=210AQxBhqauj4NmSQCb1m1xfD1+e6rsTrwow@mail.gmail.com>
X-Gm-Features: AZwV_QgPlPv5DCiiKJt6RSzHn6CFCSx25NGw-cD-v0VCaFqpNEWAu8UUQuVEVMU
Message-ID: <CAFZQkGwdpfEzv=210AQxBhqauj4NmSQCb1m1xfD1+e6rsTrwow@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] drm: Define user readable error codes for atomic
 ioctl
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kde.org:s=users];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[kde.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:arun.r.murthy@intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:harry.wentland@amd.com,m:uma.shankar@intel.com,m:louis.chauvet@bootlin.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xaver.hugl@kde.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,amd.com,bootlin.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[xaver.hugl@kde.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kde.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,kde.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E740B5809F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Oh, I just noticed: It would help if we had a CAP for this, so the
compositor knows if the new API is supported before doing atomic tests
with it.

- Xaver
