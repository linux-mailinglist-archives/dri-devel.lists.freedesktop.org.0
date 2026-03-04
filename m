Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFDgNS+vp2nAjAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 05:03:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4431D1FA928
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 05:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3996010E944;
	Wed,  4 Mar 2026 04:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fKyTg+/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC8B10E944
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 04:03:54 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b904e1cd038so854383666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 20:03:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772597033; cv=none;
 d=google.com; s=arc-20240605;
 b=l2D34WZ/wuQ0qkSu+JezgnUhNpOkIEO/RhJRLyFAKvbOzGUoMexpoaONwhu/H0oJHT
 ESMwFgLDpvSX0jZ3bIyVXvkOjC/EC+yKBw1/mx+tFMYXKR+fWG6quw5Z5wcAAfF91TUJ
 Je30vpzfeBSYTnT0nhuzWEMTKgYNOK59yrByOVRbL1DdFwMOOMOJD2NdDGXmNM8ylODa
 FepjMxwa2aqwzoE8+JuhtsXkP8LpHBfZFca/z0b1EI0e9y2rjEuRTlNhH8XJzcMIfHQH
 DL6woSj9boz0YgqBYysr+8MrLzXts99fyFH6WlL1cqrR2fCPub0rhx9m/AE2DFRgL+Nu
 oNcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6z8M845Y+NpITZKZSzsYEQuXgpy16cvxcX5WIhmq9VA=;
 fh=PmAJhR68ClkumS2dhN1ZdavFzqqpl+/3QwsaOMgnzKk=;
 b=lSNTgGHp0rwBzinlcyrwcylYXWDy1fjRYHAQWdwudfz+NkB4mMEgtgEwXextXGR81m
 2LbBHbH2snCg8bSmARea8yb7jySr1Ij8oOCCtOlL8yPG6gs7FnRfe+Gae9guKB7JuNT1
 vlwNUfoZ38KBzNRDYmiRAUHHWgOVbioUzhUUiC0VvIQJZX3hytOKp5CUGyplkoMMDn5s
 XbYb/inwqDsilxmSJU/94bK0kHJu0wzwVq1XX1FydKc/VYuFRy7heA4n+UKkpjhp4pLb
 fhX+UaK5R1ke3Voj4R/Vu6mMmLA9NWiVfAtZZzSNoZvpNdxon5LtX+UnbIWtf8NTee5L
 FMQQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772597033; x=1773201833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6z8M845Y+NpITZKZSzsYEQuXgpy16cvxcX5WIhmq9VA=;
 b=fKyTg+/+K2/0f0AQO7RA9P4GU55qSGunllF++jJxsbGY6tf60VYPtrOjRL0XM01xr4
 pmOX6iVPspVqmIEHKptp7Wj9to87ha30SuiDqSrizf6ZsgTY4Av3pxdGFvDoHoWsZLE0
 6sy3dLv0BI47b/ZUtwJSPf+FBXHyfYLOPEQGAIS/TIghCD0yIEoOr8SWaH/ahUFxpFqa
 vNh0J6u45mjJMrsaHFOkIZkqDnCKThjGCKbjEEV/pjbl8+CmWOGb6AsB7a+ZjlMVYHdT
 Hv4ggacpV2mnaBJSPaVMgSyABcmvLLa3fR0vAJftpWT04mxjjOBoA2dNpEFtOWzgSz9p
 7sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772597033; x=1773201833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6z8M845Y+NpITZKZSzsYEQuXgpy16cvxcX5WIhmq9VA=;
 b=AGTyIwauNvEXjgURARDWOyCNn92xVtYsy4QVlfRuqP3WpcsMMuMwQQaGaeNUWlgNzN
 RM6yF6MplSD51uUYSy830Q8rYm8uhUR5QZQuPV7UROcs83mfwL2Zwwq0bTmHOnnxEqhM
 cSmTXvXhHt3cG50VM1JB6PbOZOljI4JIS7EWBE4jY4L1LtRxoZkx7ydpKgE3QPUNvDll
 m6VRMBtYbSFZUnrb3fwsGca8JITFoCnnGRkAr+/pdHh6iGHPbNH5/VBzdHXyhxXIKczF
 Gi8bLdkzGm/OzFVaHl8J2whDhR7Am07j/yZqMNARFJRD4onlQvwiPIAqdcA7sMHaDIpt
 ONrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjTW7co4DWkkd96ie3i99n0LFV24LEXOzk6btDN/Tqy/SSnOt7uF+Y1bSaKlne+N7caCZwjkziJU4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV4IX8RJZjNc8pjbd8J5gFltraAipJ3nOBA2FCsFgW6lx0h3Ky
 KEQ1XYY1ss9kKHzTv44hfwXcYA5lzvUtJflXLEmKGOBUPVUqIiAjWBl4BzQCcelD9xoKwjgaE4z
 ukoIKysrb1tEgeMki0BE9KKMcBaBRido=
X-Gm-Gg: ATEYQzzoXjbax4pVZ7uiI4jphluDmSCnp6Ig4/vUWF9j4KhD3uW1h+kWFnVoue7qFip
 7pG3gL76v9AULx//4n7LXc46XVNVKYdo9BT3pZ8TZ5FGlWWMG9nZAqwRTrQ/Yki+rC8jg2sy294
 dNlshp6s111M8DmzpBTHc2gaQ2+OcWl3DHbd7X1FVzjz1SKgA4a05cD1ZUqaPXRFg3kVikrHVW2
 CZzflfXVkmfQPKISAhVp6jMBQ/oueeYTMyY24sjobnLGW75Ys25lqE7PNDDSReLJafkMumirXeA
 ZmEWZsZGiPsETA4/E4IBPLz5KxitJaRZA/fFFMMTcGJEtT1bV6ac372eSqYR2yPAh7iW8mwpiwf
 wLcI7bQ==
X-Received: by 2002:a17:907:96a6:b0:b93:8460:4af with SMTP id
 a640c23a62f3a-b93f14cf1afmr27445366b.56.1772597032896; Tue, 03 Mar 2026
 20:03:52 -0800 (PST)
MIME-Version: 1.0
References: <20260228045356.3561-1-rosenp@gmail.com>
In-Reply-To: <20260228045356.3561-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 3 Mar 2026 20:03:40 -0800
X-Gm-Features: AaiRm50svINP7hvFX0utAndkOyARkkDlnOGgjjSGoekSn-A5-l-P6oFmN6TdzZE
Message-ID: <CAKxU2N_FbB_d6ntXEOFzE2u-sfu9sRRFwaDnb3P=RfTwE5yuDA@mail.gmail.com>
Subject: Re: [PATCHv2 for 6.112 and 6.6 0/2] amdgpu: fix panic on old GPUs
To: stable@vger.kernel.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 Alex Hung <alex.hung@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lijo Lazar <lijo.lazar@amd.com>, "chr[]" <chris@rudorff.com>,
 Sasha Levin <sashal@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>, 
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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
X-Rspamd-Queue-Id: 4431D1FA928
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:Rodrigo.Siqueira@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:timur.kristof@gmail.com,m:alex.hung@amd.com,m:gregkh@linuxfoundation.org,m:lijo.lazar@amd.com,m:chris@rudorff.com,m:sashal@kernel.org,m:vulab@iscas.ac.cn,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linuxfoundation.org,rudorff.com,kernel.org,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 8:54=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Because of incomplete backports to stable kernels, DC ended up breaking
> on older GCN 1 GPUs. This patchset adds the missing upstream commits to
> at least fix the panic/black screen on boot.
>
> They are applicable to 6.12, 6.6, and 6.1 as those are the currently
> supported kernels that 7009e3af0474aca5f64262b3c72fb6e23b232f9b got
> backported to.
>
> 6.1 needs two extra backports for these two commits to be cherry-picked
> cleanly. Those are
>
> 96ce96f8773da4814622fd97e5226915a2c30706
> d09ef243035b75a6d403ebfeb7e87fa20d7e25c6
>
> v2: Add Signed-off-by.
Do I need to resend?
>
> Timur Krist=C3=B3f (2):
>   drm/amd/display: Add pixel_clock to amd_pp_display_configuration
>   drm/amd/pm: Use pm_display_cfg in legacy DPM (v2)
>
>  .../amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c  |  1 +
>  .../dc/clk_mgr/dce110/dce110_clk_mgr.c        |  2 +-
>  .../drm/amd/display/dc/dm_services_types.h    |  2 +-
>  drivers/gpu/drm/amd/include/dm_pp_interface.h |  1 +
>  drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c  | 67 +++++++++++++++++++
>  .../gpu/drm/amd/pm/inc/amdgpu_dpm_internal.h  |  2 +
>  drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c    |  4 +-
>  .../gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c    |  6 +-
>  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c    | 65 ++++++------------
>  .../gpu/drm/amd/pm/powerplay/amd_powerplay.c  | 11 +--
>  10 files changed, 101 insertions(+), 60 deletions(-)
>
> --
> 2.53.0
>
