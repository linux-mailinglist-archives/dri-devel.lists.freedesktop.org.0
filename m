Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOA0DFMxg2kwjAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:45:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431B9E5454
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849C510E5E4;
	Wed,  4 Feb 2026 11:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="fg8B6o9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B5010E5FC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 11:45:19 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-59de77e2e30so8787908e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 03:45:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770205517; cv=none;
 d=google.com; s=arc-20240605;
 b=Y6OQTRxjuhiJHrGSpwfCkVJH17NhWznqmcBFQ9Kj2tdfYLRFIV1UHeiJYxQ0pd1qhw
 8NF+gydX9lJFfxHMd4uZLAT5iPzECqeWPOT6bRbd4vBIUhJWl/fZtaDsvrQ9hWrPC12Y
 vIJ/C+zCeSejkh7mDKRBDwn+SxZt/51w6E8MJoBSLPO2IWrgy/L7VbADjGkK+dLNYs49
 AYC2SJvu68KfTCzCzK4+W7nPsDELWJcOMh8yBngbyj4tNA/aIA71FNgfEy6v+6W8qEB5
 ekjs8lwLGCez41gTlwL0VkLEiJbn7iU3PSvuNnQGXvP5VHZNP8g2HFL2aOGrgRjyOnvu
 vhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=53Lew/s0y4/sRb6wzY9vj1suyC3RA4MzB4NzyOg6viM=;
 fh=6Q2q72nLBc0dYpD+x82+ZZrwi6zb7lPXsbUblF02Axo=;
 b=GLC/zZTws0lJrPxSQ4dg23m4iDF94/Uqlgp94DUEfk/Bf7Lox60yN6YNU4SgBjSZMW
 unu23M7ME3oiI7P4XdK3fO2oD/hUnOy1DKgrJOb5/GJuUg9163juhPg5ABKVeeSMqoAF
 XukvAMWoY7c1Umjn6utVC02olh497by0UXD0zzESD21tBf0waC2RfDxDG3cSKrr+Lt0N
 Tv6Sn+b2hxEd6Hf2CxA0l/ggVMYyzHVq+YmoID/oW1GTm2m7/ofRfydOxXrgzQpdQ2IF
 Ur8biqYay2W1nWohmo/DCmJG0J2GMLndHhT7xrmXeaJbCMQDdQwwaegFWZevq7Sk49Ze
 00ZA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770205517; x=1770810317; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53Lew/s0y4/sRb6wzY9vj1suyC3RA4MzB4NzyOg6viM=;
 b=fg8B6o9qRgB75uKijV+LVk45sYqpgblzYuoSpDQn6m9RS1QNpb/IsOdSuABSYSqq3m
 WVQ82vaX/9TtkiyQezmAJWU6BKpT92qaJonyf06D27O4NsXNlsCcYA3tuDm6AQVxfo2V
 haowmReJNS5TdL6+wtcvMpaEvzH9BkmweSpt7i4gC8vV71PHj6RYttRsEijJtuJzQ42l
 NFzAoROJm21+kXIMGtG1c3zqhRBecwBpP7DVofSP4x4aR3Q0UBPQYtscvviIdIKa9t9s
 DzxFNN58Q5SclYnIxoQUgkXDBk10F0ZVLdRct2br1Iml1xznXGR6dFg/dGn24TCeRAFI
 ezxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770205517; x=1770810317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=53Lew/s0y4/sRb6wzY9vj1suyC3RA4MzB4NzyOg6viM=;
 b=uFWG1v5wsxiB41u88dGHj97TzzfuHoafpCEtlTs82V7IPc5uaotYfnNfrJ2jDS+ldO
 9TbTVSjrOFQyU7LKZLckDTZLs1PS0XD6+o2c2A6goXxgpa97cDldW16pbEx8vttnfY/w
 GeqJx5HSRsoofArmsR3YL2bh6pZPtJhjj8RrNnutwoxTXGZBR8U6x5HxWnwPqenAIm0u
 /aj/L2v6xMLeYsNMd3JNLv/aamEbDq5rM3gjyi+13va2ioOMjLDmQKZNmfW2T1nnaeJM
 Uyvmk8sumzdESIxdbkK+Mx9DnphNaPv9OA5Kp+3f0tBuLn2xZrhQ/x090N6zApXe+AZd
 wrQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvbZDlnfZmaz49RduAVnGR0nz2Z+FpuyEUskkIQu52jEm6nePf9rbJz2pdR8DU8LqDBp0xFg8hGGg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz083eeq/c7ApKbJ15VcaPJsbmQ4/pTQsjopSvd3SjA50PpMPK/
 DMc/d88n0N+lJNSbIQG8EngGkOp9YPsSNheGH3gjbRj6zVaTCTwnGRkc+V6/rMgHVDVCXmnS8lk
 55xvOqDBpkKFfSb1lQMfLrsPk6teQeCnbA+ug86A6Kg==
X-Gm-Gg: AZuq6aIz9mYgPi7ghDiD9Kn4o9/0eBlzqeQYXHgmEIZZMJRFz8MGP7D/Z5Ss+4uuJ02
 VzPJkiq+U6Ms706LU5mZngLN2ERYOvlWuiGgSlGXOQLSswgreWoYOOVJDwOSqXdNhfTYeOvaQUU
 5+RPU9wdPprsQfyGFfVlbnN2OU4rxWwvTRtgfQcxEWx77BDi7bgL3nJ+KhI/YOJEnpgoTFIQxBw
 M8zOGuxi4aqsCtpIWcY9qCwapp5rmp6d8sp/0LHx890FDPbEcWsGWoZzh0zScVdriJ9ZrTqvNEk
 Gp0YqoNJjrhuYtHQAMp2DT3pk24+
X-Received: by 2002:a05:6512:602:20b0:59e:38e3:c8f9 with SMTP id
 2adb3069b0e04-59e38e3c9f3mr729423e87.7.1770205517612; Wed, 04 Feb 2026
 03:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20251104111339.128685-1-marco.crivellari@suse.com>
In-Reply-To: <20251104111339.128685-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 12:45:05 +0100
X-Gm-Features: AZwV_Qhc9bylVE-hUlyhIgCfPu6PrS_h_3arhjF1X2NBlyE7dPAIBqwEQO-P1qg
Message-ID: <CAAofZF6erhW_CfFbG2xx8TAFgZ18DNa8Cx5AekvShOLgcbV_Ug@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: replace use of system_wq with system_percpu_wq
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,intel.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 431B9E5454
X-Rspamd-Action: no action

On Tue, Nov 4, 2025 at 12:13=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Gentle Ping.

Thanks!


--=20

Marco Crivellari

L3 Support Engineer
