Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOlZFaePjGlQrAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 15:18:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95262125224
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 15:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270A310E60F;
	Wed, 11 Feb 2026 14:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hrHsy6JG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4334710E089
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 14:18:10 +0000 (UTC)
Received: by mail-dl1-f50.google.com with SMTP id
 a92af1059eb24-124a2dc92dbso461112c88.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 06:18:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770819489; cv=none;
 d=google.com; s=arc-20240605;
 b=aUvqDbiHi7QUnSZX2KB+MJca/iltUegiMg3/JdOsTFziUEoi7xzXshboPd10fZp/6U
 qu8hoMKFkhwdl4aERszfOF386bOn0Wcg/hKBXbJzciD1tNTGWoJBvxd9492Q1iiNFCi8
 Jv2UNAC08P34HvPnbVMyJQKIVQy8be3ipBMCjAhcK1n1s5m4B4F2+Mi/623ch4YH+2lS
 RWdUmMwmo2lHAeKbg6P6150wxALtKMMFKlJfazBRFZgjAq/YHfP8T6ZUKrlJxdHX7Afc
 qFOkKO4HFRlW7c2oCCeSkB6rZ2uUPriZQeHIZUvTNR05qeyv6xTnqi131HXMsRz1InlP
 Vouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=goBWqa/XBAUCU/USU+7vOgmq/PVsWb+UivWg7c+q+G4=;
 fh=6CJt3l4bU02K923tftxCOZmIFEuWxzqAHF4EXQbjCnU=;
 b=FkDBk8TZRLVXQ0j961lw4PKybq/MCSGtXEqxi92Kzyej26PRXSl1LP+rxA4PmWP/qN
 XpuOjJ6ofGe9IeRp9MRCqI6MSywmO6HvK7qM0Mx9E11y5WAvEFjbUAuvd5wsA0Bp81RS
 dlRoDPotX4NeVpa/ztCrpBEOW+MFz4NWNcY4cXhitjeSsAld42ztHtXqW+Crje5/VK9w
 lMlEwsZH9H4Plj9j1OtwjVvXFMsSrPkCYMqGhQZgnhM5pLn//D64ofUZTPI2RH/UmEKS
 6/80vOrBbCyeB5BfxsKZkWm03WtU0vVkPXrutclPsjApf/oh83vdMq4/GHKl4JM50m8E
 QMOA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770819489; x=1771424289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=goBWqa/XBAUCU/USU+7vOgmq/PVsWb+UivWg7c+q+G4=;
 b=hrHsy6JG9sD4opKHYeBuVzFRfpYvjneZeYNSUTbwTrZPCCuKha2yB2/JDlkJsibr0T
 DhcJoXlCiNc5xpzUSFr8Ru7I+ezkW39scB/34NPAqEh+S/1dOE3O5/koyVgxv3nYd23m
 vDirWj947IIqJurB/VAxsrMvjEhjSYs7pvG87oNC7sSQFh497v559AWiYlIiaueKZHUx
 0fw31+QUrSerBMUpUaSMItJI7fEyVqhkMyPgjZppeiYGSyTMIdiAk8B7wSpKopdsUZgD
 Cl0QKlIJlryVBlkrvrRhodH2Y49mcZPTM4tx57T9seQYkcbKTwGu7OHnEt9bXWghNxMN
 ld/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770819489; x=1771424289;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=goBWqa/XBAUCU/USU+7vOgmq/PVsWb+UivWg7c+q+G4=;
 b=MD8Abl/meB5sdnEnwEesBXHAcLydygi/LdonD3pcusAdgtSZL9B3J+/8ft0dteteZF
 RhhM+9DZbo80dpG7JaqWpwIlM1vz6jw/DIUdV0ccHEOuWrdRNdKPKTFL0hzUjAuBRH5D
 F160UsrzrZAwsJw3+Z8RfAInpCzwuyQIpcNysDxD/JXfvov0wBy+VMY0wCn6TGsPEqde
 fspbnOEhKFPyA0VTs4xerceJGYzQHj91DsWZP7Qki+HdGXVs3l0UsqhN1BWzHbyxOjrq
 fcV1O8ixEKIOdazTzcPMa/IuAqWiZPsgk2jsnOEySKzQ+xCfmn5MH5m569goeeRIe9JC
 2ANg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVqEVGZcNtCJRc18dji500uNj5HS2hCExkUN6KTh5n6ga+0RMUUpZSzR62IZb28ZkHIZt0cygOehI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyThd8pkpbtf+3OCPgXQmrmxuTb6xqq/Uqe+XZ4fHhen1DP/ls+
 sch5YZ7FKcBhTAiz1ShZLnbioc0+52ENQhHomSGogIrsfHuEnqkBK+a1NGH0whIefphQPsdr9G+
 AuyNfT20YhNG6yGLVpCR9GSzlkqCqxJc=
X-Gm-Gg: AZuq6aJA16CupB7TZz3R5d64MEDNVYdlFQxoVQD3orPsSdnHFJFS+Xxyu/2APEtoLBo
 vcK50Wts73ywYDFjNfrYQx0Jfc3zxDYQcMfXo8hmokFLLclHJ2e3C3jhXqC+aMF323OeWM1pUAv
 SeVC1F1HblW8RyfQiU6YLmspO5eG8dO7cMBUD29Azk4Ne16GPqdxiGtOEpxWxIiwr4YJwuVM38l
 rRk3My4SFyyCYhauvoLGmEZOfWlLoY2nyYUMZkpiaa/+483FIty/yZ3dR17Pgk2URDRBfqWLq/o
 SzNZa3VCieTwuJjzYwY=
X-Received: by 2002:a05:7022:ec11:b0:123:308f:667b with SMTP id
 a92af1059eb24-1272a7728cdmr416122c88.2.1770819489253; Wed, 11 Feb 2026
 06:18:09 -0800 (PST)
MIME-Version: 1.0
References: <20260210072309.14911-1-decce6@proton.me>
In-Reply-To: <20260210072309.14911-1-decce6@proton.me>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Feb 2026 09:17:57 -0500
X-Gm-Features: AZwV_QiPLTEeETb9o-odEKXS3UkM5PUZZ_yDmvKK0LDZ2SxwLbh-oK6gcsMssh0
Message-ID: <CADnq5_MRvfNk83C6fd_gFTN8Sv8hgi56vJgEENajxpmQo3xd9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add HAINAN clock adjustment
To: decce6 <decce6@proton.me>
Cc: amd-gfx@lists.freedesktop.org, Kenneth Feng <kenneth.feng@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 Lijo Lazar <lijo.lazar@amd.com>,
 Alexandre Demers <alexandre.f.demers@gmail.com>, 
 "chr[]" <chris@rudorff.com>, Sunil Khatri <sunil.khatri@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:decce6@proton.me,m:amd-gfx@lists.freedesktop.org,m:kenneth.feng@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:timur.kristof@gmail.com,m:lijo.lazar@amd.com,m:alexandre.f.demers@gmail.com,m:chris@rudorff.com,m:sunil.khatri@amd.com,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,m:alexandrefdemers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com,ffwll.ch,rudorff.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,proton.me:email]
X-Rspamd-Queue-Id: 95262125224
X-Rspamd-Action: no action

Applied both patches.  Thanks!

Alex

On Tue, Feb 10, 2026 at 3:20=E2=80=AFAM decce6 <decce6@proton.me> wrote:
>
> This patch limits the clock speeds of the AMD Radeon R5 M420 GPU from
> 850/1000MHz (core/memory) to 800/950 MHz, making it work stably. This
> patch is for amdgpu.
>
> Signed-off-by: decce6 <decce6@proton.me>
> ---
>  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm=
/amd/pm/legacy-dpm/si_dpm.c
> index 1f539cc65f41..b5d895537477 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> @@ -3468,6 +3468,11 @@ static void si_apply_state_adjust_rules(struct amd=
gpu_device *adev,
>                         max_sclk =3D 60000;
>                         max_mclk =3D 80000;
>                 }
> +               if ((adev->pdev->device =3D=3D 0x666f) &&
> +                   (adev->pdev->revision =3D=3D 0x00)) {
> +                       max_sclk =3D 80000;
> +                       max_mclk =3D 95000;
> +               }
>         } else if (adev->asic_type =3D=3D CHIP_OLAND) {
>                 if ((adev->pdev->revision =3D=3D 0xC7) ||
>                     (adev->pdev->revision =3D=3D 0x80) ||
> --
> 2.43.0
>
>
