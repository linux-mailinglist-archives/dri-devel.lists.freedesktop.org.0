Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNn+JmQVnGkq/gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 09:52:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4150173505
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 09:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B8C10E299;
	Mon, 23 Feb 2026 08:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="do1bepG6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779D610E29B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 08:52:47 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-59e62834439so4504844e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 00:52:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771836766; cv=none;
 d=google.com; s=arc-20240605;
 b=AwqVeKqT/t/rXScAzm0u+vcEqWSSVM/1UMgg1hPijFJ4wW9CTE+D6KxrzED7ZYtBqq
 0f6bLC1is+7FB/Riv69L6C/RCr+ATfmVG6jTMJaIXAQKeLF/7kpLqrIDLi/QLGizAdBj
 cDT/Q+21FYZ5BJ2nNKAoeg3L4R6BLdyCXTwsrhZrqm8DC9ARHp5OdBqJTxRHZ640Bb6Q
 0hPvM606hBjFAIc5mgUqwQOFUgnnEXIHEji/ZJqRFpMcuGHtJRHovN3a/7HZA2HPskYO
 JlZ+WVB/VYj2POAxRQOA4LXpNvthT8Yk70jgU3OYG/N7CAtNI15Kj8JYXTFPhuWtHR++
 4p4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8pMfDy0/3VKLDSPvg/zhyqaAQb/EPG1TE7b+CoYlVks=;
 fh=bfPlUUnzo+Lm0g2+XQNYGS6hMGM4uaICPrG063XFgIA=;
 b=HWB6i+Oph87YGv3Yqo/Ys0TIEDn9Le9SMe6RWjO9qxRxzmcZeKP4fULkcFFW9XbgXQ
 i3UsFHC4N4lx4oIx7ej9cNG0HL3AFFuadcZoafS4RlTpUPVLpAPNTgVU0+2ked/bB001
 mnzwFpxRGc/oYQWeda/sC/iYiQE9Z6h1DOQBLwWeUOTYnFXE1H0rUbmQW+m+JYCZoU+W
 sTw1XiUZpIXaMnxqHzvn56mx9vmV/osam9GYLbx2Chf+8LYB6yhr8SyyRsa8lW6zblaq
 +qMzrXWI9I46MavwpZIvgI7L2JZX9BI7fi1CccuAp8GDnDcGjveYdmwGYRAs1NUHk7Pu
 nCiQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771836766; x=1772441566; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8pMfDy0/3VKLDSPvg/zhyqaAQb/EPG1TE7b+CoYlVks=;
 b=do1bepG6l4934cYzPhXZ4yAF2xq4A+OIPzrUQ1nkcbKme6TcjJ9OuhfNxifOgxT7qP
 +Ly4M4WTjWgMkIndSGJFiB06k49f6d0Dj9+J5PdudsuVooiq9UgqntOcz1Y/buqIiH+q
 1y/rjttFarMU2Wl3fwNB522qod/vfRAri0pyehyYMwrO48tS8Md73bpZ7UQ3Cvbxd7yv
 +cDzqA5teoU1VYcC0Ah7eyIbts+syOBPg2emVMAVGz16Hn8+6+5uT2jW4Sl1PKVdog4G
 rmn9/xMrfz5E07rVl+KpVCwexCYJFYXYCEJWCVzrWF0fw7isKz90DV3tGpLX04j1qqh6
 RdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771836766; x=1772441566;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8pMfDy0/3VKLDSPvg/zhyqaAQb/EPG1TE7b+CoYlVks=;
 b=XfZ5X5WBwlih+1xlZKwkFUbOwc+ZmuSCcvAgspKLTzSjiwfWhdbyG0WugVUoiE1Cik
 EpRDeWzmHCX7nWs+z0QvMrUeBFcJfn3I27CpsZ+ukiCpIYzCEYkReSKTS4Az60y7v6/I
 mrETnBm7KhvYQ7ZC3Ylr4DP7IIVEE7eJfzuK40h1WDRYKOKyF0PDS1tgAvjHDSBrMjpf
 HFeam8Eznq+xXIfW3ClZBEHN4364z5d1Dv8N9YYvEpipQHpTAxkWohOYHyG4967mHrPV
 EVQWs8ttHfeBikDEHBKDPpFVtJ4Y7O3FdtOu77RnNkEjbqjJpXl13J+WyQi7aEtzNMPs
 Cc8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwUOP/wlAZMO1XYr33e6xSwfSZmlRvETa8Gm+wDGfsEvdPNX894IzoNjH3TjidxIsy4rzYizEmZPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrZn5zjPxLUvYaSot/QBuYTQl+1bD/LSLsn+EO//fdq1YCEJuy
 14xVMHnScPsf2RznBcp3ip1iLcxqPpxAG+lh+Di6Gfc+5CpV2A48iQrlh1CGdeMAEMgxpnyKIlw
 S+8is3eLm4qPyzP2+pGKLm+KeG5nvtoaTasHjqp489nSXiWTDF0ST
X-Gm-Gg: AZuq6aLPE2DuuRgcjNEIuaTkRzMwhT4k6ym/AXbs5URsdsXvTGi+9R54V08vhDM9kDx
 vk+9HJoLm1xSU52ERMX2ylB974zkCtphmhlFF3gVuGf0+Uk8YmDWKRIRwjk2O1FgJqbRHYh5QiX
 /YlEtkgjedJMql7JYzpFOmFcTOwiX53VDgfX4x4V4vFAiJnOz3NJ1kdKwmy/n/r+N3FEuHjI6m2
 sLm2LtPtGN1lpbF+XorkfzBj+6XoWPtMuFwRCZByDGN/OqNVIg/a819AbUqEZdo7XH2GycYigtH
 PFbQhTTkpn/M0szk9pJJNU5Hve+9Y6OM+pqBiY1j
X-Received: by 2002:a05:6512:aca:b0:59d:eab0:c836 with SMTP id
 2adb3069b0e04-5a0ed87759bmr2452544e87.6.1771836765637; Mon, 23 Feb 2026
 00:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20251224144708.61167-1-marco.crivellari@suse.com>
In-Reply-To: <20251224144708.61167-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 23 Feb 2026 09:52:33 +0100
X-Gm-Features: AaiRm50yF5Rlw7ATpftOWtV82_eD6bFHXzpnPtJ1vlADkXKmkv3g_Y7y2xwA-KI
Message-ID: <CAAofZF5XSUVn+XW75rC76-Amibc3rZnG3QQhWxPtk7K6YMQx4w@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email,suse.com:dkim]
X-Rspamd-Queue-Id: E4150173505
X-Rspamd-Action: no action

On Wed, Dec 24, 2025 at 3:47=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
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

Thanks.

--=20

Marco Crivellari

L3 Support Engineer
