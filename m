Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLI/FYRyg2mFmwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:23:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62C7EA260
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F5288284;
	Wed,  4 Feb 2026 16:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="f2U58zjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE71188284
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 16:23:28 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-59de2d1fc2cso52122e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 08:23:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770222207; cv=none;
 d=google.com; s=arc-20240605;
 b=LKqTigYygfKwyIE+3bJoJ0Q1++NOUUu/FTTDcPaUdVfbfk4ltLDm3rlYXofZF06GYp
 IN35t3tVjATVQtYxVO52L20h7yfPH2NOWAkqYh/TSyc3y/J1VkLvNX/Nd/0Ys9gCPSlW
 /nU2E+7cvjvJ9DqVeTDwb+2xGwAlJmtoE6pb7HzAU8xEwJ0QYWQpeeObwVjdBlwoi/K2
 vT/KP5vqqgw0au2eC8QfM0kS7GJeOlDarwWf4Npx9HWu2QVdh9HjwiJ9OX7BgYSIeU6F
 CWC1h4GDfJ+WO7fKlvPdfRfXw7a1CrpMMm58HTsoBNh7foocuEXkzH2SKGFwTwPamNWr
 q58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ab2t+mcWFGP06dFB6KRcl1ymh71pJERVjF8n14rySY4=;
 fh=x/Zj9FvCmWWdXF/re7yjPxzwl+KzN66tJOolENPfpDM=;
 b=LoQUoFOo1/LCtCNPFzYYjwY3t9ylzBQ0IYQBitTtlMIOKmpwsiCYtj6fqxxLADXb0o
 pZUSZPm6dfwTWT3/zT654P8I7TigG/C1HGBYuEvwLhIxSMJ1N6IisHmj80sTgdK7dTj6
 RGJoFU+0cy3hkpS0BUZ/nMP9ZKxGBD7xEoseESkak7fHT/OuS+n/KUdiQ4GZ3hnGX8Q3
 S/cvkm9f6sjGT9R1PHSVp7M2pnFBB3S9vpAxUiF10rlRLP8yYBoggH3zGPI5rKsXUgzt
 hEoAgqVQXWzV2bR4UDMViAdl4xwa0p+mCsUkDtGoiMdhd+U/cZioEw9IwFY6Rv6HUbXI
 uHuQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770222207; x=1770827007; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ab2t+mcWFGP06dFB6KRcl1ymh71pJERVjF8n14rySY4=;
 b=f2U58zjsvXbhMaP2ah6STt+lhLHCREptigNLrASCAnb4pjpaNyg8boyp7K75MTL+Ti
 egvkNxAXt2cGeFZs5qqj4U6bdceKHv1L+MTMW61Vb/BwMJlj1uOPL+pz/Vq/OhUXJ8uU
 wGnjbghAFD2cR2w5b96eMulWzJTRO4u126MgK285Gj0SqE2V9eAjaTHzV+hDaqf0rthj
 A3jPxitWYkLF+kZccuBjEXjcCDfmty7MuILKzEMJRfhu9cF5iyjyID24Zbr19TAQ29c0
 P9vjy/CPMvE5wUMRFylzjqRSjb4AU1owCS81iluUHcfe7nqrEQDa08eQ+Pm2Sh08WYSu
 X49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770222207; x=1770827007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ab2t+mcWFGP06dFB6KRcl1ymh71pJERVjF8n14rySY4=;
 b=bucls+xPNMUjJXt6cEdD0vYCD7cY++kJI74+w9T+Mgj4xN2vTKH22OCR4s/zDXo4Lx
 o1jS4IXMSOa4E8iaOOGu/TSbLnUOaN0nVvh42ZIezUsDUiOzjbYBHI+NJRwrEXaOU5BO
 Ls7dGwVo/UejFQoWC5WLpR0mIlQDXHcJho5OIe/k6zgdYCnl4bqGVRoi5r+zY8014odu
 VhOVCWYyVn+A93lDwt1Aos4YF2Wm0m4lvC3/2tF+u80M2IamWgwS3myrPrUKAsw60ARY
 sXCEl6pgdOKlh6z8O1HknuV8C/uMSirjIQ7msOk68V38WczDjaTZkKh5avmaTBKRsSFy
 j7oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7kHG3+q2NINdM4OULPtYM2w9FHplT5sT2ZjzkFTePrnevUov2fEsnPuoUc1bgXIAjEoab0A0Aug8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNkcwLKBt2LmnyLJxgG4Nm8Qb/syATzOc8Nuc6ZfuKjwWFIysk
 YO+6Be2B1GFaTOVcjG/lrWWGZ7+A2MGAd3Dxvpe4hAdaXvoYMMNXj0NEvDBMpmbOGd34UPfG7ZY
 NVN56zvXuBbUx7ptDMJONVg3cgFQjMil2FPFiPA9xVg==
X-Gm-Gg: AZuq6aLX9VTKJQ5Nr3BlVCWSWdJSrhZHdR6jFOfyUwtGZJ9wHpg2/wG1ALkCJNk+4uT
 npCboav5SdaxyfIPnBMl2ztv/WHZTANdVnnWA9I7AMrLwZbc8/etd6P72YXkDxA8I+aa7jr1TNy
 xw1Y5q/zvk6baOlVy9SF7fQIzwE2GD2xiK910kbeH96M+dqqB3wpRifFBilQVMyY6sQNlBWO41L
 XGBBs8kR/8KUX2C+1pYhfGLMKkAVFMSI+xNL5BTCa+otYYjj0PMXX2p3ts52+xmj1g3jwoLPcGu
 SDPMKOGLnc2OIcU0KsrKp/R61PFk
X-Received: by 2002:a05:6512:2399:b0:59e:3702:cdc2 with SMTP id
 2adb3069b0e04-59e38bd022bmr1391764e87.0.1770222206822; Wed, 04 Feb 2026
 08:23:26 -0800 (PST)
MIME-Version: 1.0
References: <20251224144708.61167-1-marco.crivellari@suse.com>
In-Reply-To: <20251224144708.61167-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 17:23:14 +0100
X-Gm-Features: AZwV_Qj0hbru-qyZsN6yOLCm8UGRjKsemohDZ0bkezg1DSADm8lZKDq2GMAMm2A
Message-ID: <CAAofZF4fUyBj1pSD5T9TzyoEmnkzRsuhOb1s1m=z7iXM8PHwSw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Replace old wq name and add WQ_PERCPU and
 WQ_UNBOUND to alloc_workqueue users
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Christian Konig <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Philip Yang <yangp@amd.com>
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
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:yangp@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,amd.com,ffwll.ch];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,suse.com:email,suse.com:dkim]
X-Rspamd-Queue-Id: A62C7EA260
X-Rspamd-Action: no action

On Wed, Dec 24, 2025 at 3:47=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>[ ...]
> Marco Crivellari (4):
>   drm/amdgpu: replace use of system_unbound_wq with system_dfl_wq
>   drm/amdgpu: replace use of system_wq with system_dfl_wq
>   amd/amdkfd: add WQ_UNBOUND to alloc_workqueue users
>   drm/radeon: add WQ_PERCPU to alloc_workqueue users
>
>  drivers/gpu/drm/amd/amdgpu/aldebaran.c     | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c   | 3 ++-
>  drivers/gpu/drm/radeon/radeon_display.c    | 3 ++-
>  5 files changed, 9 insertions(+), 7 deletions(-)

Gentle ping.

Thanks!



--

Marco Crivellari

L3 Support Engineer
