Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /O2zIpJ6oGkakQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:53:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A1B1AB45B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E8010E9D5;
	Thu, 26 Feb 2026 16:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AwRMxKjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9503710E9D3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 16:53:34 +0000 (UTC)
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-1277863a912so84606c88.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772124814; cv=none;
 d=google.com; s=arc-20240605;
 b=JCOdaIMd7gWwbXT7SKjsxpnZvDpVFt6eKloasP/lXcOUI4Va3pIPFtq04e8PVSC0Tl
 A8r5Uo6YLM4eIphI4LUuuZz+PoODnYaLsnKmELRPwsjvjVG+kfaqwHkm7kRdDG7R7JNM
 Juoifi+1EPRg/StCGDbw2vF490iZXE9i+EgApVl0trgaBLvwE98S/hnnTxQ2jMfZSua9
 MrYyOk09qolKJkDL/xA7vZPDIIyole91iQ6HKlhxXHlh3bV8df8cL7JUhvjGQuEupSv+
 LyvfBbM0O++h7jwOariOWM4bfJ1Vt8cjFUF8h58Dq1DlJPSWt0K4UBFv3nQVDcm8e6oz
 w0Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nSMaYfcAaczcS5xedZ+A5sc4SxyyrrIlz7xrQ4/9ZI0=;
 fh=e3kDYMd9bzJsoJX/a4eKibA2KOknF5zf3BxUgDul6Gs=;
 b=Ls+cevWpOhdFvBZKDqjlBo/xxZzEPOSNI4eL13zouUZVhhUy6oOBOdYue+4hHVMxKR
 uDCULsziPjr1aF4Io6hyPsDUGhDcI9VVISsD0aoIJoTdEpenMNyqPJhD1TFV3m842AO3
 /rC04dS8SZ69ZxL37jVA6tPj6o0UYUlgwg31dbD5WNQlMrjaTUrfO0wO53k4ApvE46w0
 FUkORGOtFdq5mZd/A5fKc7Ao6sd0Y/UbILgYwSaxWz05J2OoGPJ/sYdaC18QCNlGgWVb
 IwxETY/bkLxx6B3p7r87S91PdfVYgwnNlhLcAbRjjbFh92/uazAleZ4KIRZKy9fAOLmN
 cBqg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772124814; x=1772729614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSMaYfcAaczcS5xedZ+A5sc4SxyyrrIlz7xrQ4/9ZI0=;
 b=AwRMxKjAsUHiqfy4c/NJU4iuytLg90dnQ1QgihGt1xQRJdeAyQMrZyu0G8NEyQhUkt
 7FaRwbg6t0fpIbM1ZCMyvvkP4dlYZG4EuzcB1osHkObpDPujyvU6vnt2zsQPXMzeV8vG
 ZTwRGTAPN2s+V+C2uIjrbIFXHAPrigJe/dhxNZy5RE8R0ZgyW+no0zfIjEt1EnY3dWVp
 bUSaedoY+sA3+L9vWmyitg+Ni+zuJW5fjSqRufqmfaXKVVxl8MJXal9BVJ+RotOSYk9p
 JSqzoGZ+DmUSWEyVBEw7Su9jgp4DOEsxiErdgvrabRauHF5b79K3Uo2qbzEApETKiPUo
 qHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772124814; x=1772729614;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nSMaYfcAaczcS5xedZ+A5sc4SxyyrrIlz7xrQ4/9ZI0=;
 b=dq6hAKiLDwrWPNL6eI33EvQnt5NG+mYVLEGwh+Bu+o/+iOtKMj65UCisrL/c1MH1JV
 haWn8rtZdUL+wYVSFhzyL4xhqNnySSzf+Z0y6urOp9vcoGOUaBqByhfi2tp57+4KC2Vu
 BW3+VAcH2MkbLEiq3eBsxns02ujAGD4SfkypT2AuvrPlR59RnLyurqNdYwKnmEdwQ7ee
 W50OUMAgSnzYZHR8wn2gJebsyeDMwBNXvz+PxOcjupjDXCqSbwAS7aOk3H6Ft+wn0tLe
 n9Ia3uhEboYTlwyp5l5XBy7vBnFQaoTH77dl7ykSPLN959anqFs0RN3LcRBugEbwjkKL
 o8iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCH5JGWfo9syMCnEFS+WzVcPFGXmVLJej/nV6npWYp+M7iAvC6RLA5H9813wpJqAKCP+Z+hL8ihds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4fPzkEigOLzx6Kt8oAxaQTUbMSDU2efIO3INYJwSa1/K1IwTM
 9GWTNRGSgVEH/WVlVwraG/HM0hqXAEpUTDktmLNnS9fSusYLFs8L10vNVGeTbrjXRI9eYQNP6LC
 Gs2IjbA92ZOhg+f6euUf+aGGkk3uq/lw=
X-Gm-Gg: ATEYQzxairtkss3kZiJ2esBSXnbH3WUZoVhxNbKOI5vhsfGd1Bx4T/mKEIfqSSIBWJ6
 S+wmP9u3g3rBNJEFwA2aBhH6SSk/Z4zHdZalB4ly6CL3wT9lwwfuORtE6kk9f56sKavozmmIAk4
 yQJ1J8n/Ice5+T+12PxewjcfS0UEhSpyBo7CX4Ct+/hR8LK6nCjMUxbh85dWO68zUkq9LOz1LlL
 tFd7jhLCLbrmj1PcwEj+LeA0PUG58DDB6bTjeeZI87LnbmbnnmUQUT/6ElKIW65tDpyH+B6gJk+
 bXz9jevWJLc/9xzVp7zC0tF2UkGE3h0IKykJa+hbg/l8kEtDL5KRquJyAmo+7S4je/01/g==
X-Received: by 2002:a05:7022:2383:b0:119:e56b:46b7 with SMTP id
 a92af1059eb24-1276acad3efmr4459654c88.1.1772124813724; Thu, 26 Feb 2026
 08:53:33 -0800 (PST)
MIME-Version: 1.0
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-8-yujie.liu@intel.com>
In-Reply-To: <20260226030038.1182961-8-yujie.liu@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Feb 2026 11:53:21 -0500
X-Gm-Features: AaiRm53PhKEH-H8S2VgmZZ1MUIfEIaZDuRwRMb5_ZanlUifF-Xs_VnxnKyGbvPw
Message-ID: <CADnq5_PD3DMPA5WY-wGS+NHmEQRXSx=WQNOygNXt8so-n2L2mA@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/amd/ras: fix kernel-doc warning for
 ras_eeprom_append()
To: Yujie Liu <yujie.liu@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kenneth Feng <kenneth.feng@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Asad Kamal <asad.kamal@amd.com>, Yang Wang <kevinyang.wang@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>, 
 Gangliang Xie <ganglxie@amd.com>, Candice Li <candice.li@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Luben Tuikov <luben.tuikov@amd.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:yujie.liu@intel.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:patrik.r.jakobsson@gmail.com,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:pierre-eric.pelloux-prayer@amd.com,m:srinivasan.shanmugam@amd.com,m:tvrtko.ursulin@igalia.com,m:sunil.khatri@amd.com,m:lijo.lazar@amd.com,m:asad.kamal@amd.com,m:kevinyang.wang@amd.com,m:Hawking.Zhang@amd.com,m:tao.zhou1@amd.com,m:ganglxie@amd.com,m:candice.li@amd.com,m:YiPeng.Chai@amd.com,m:matthew.auld@intel.com,m:luben.tuikov@amd.com,m:ville.syrjala@linux.intel.com,m:michal.winiarski@intel.com,m:michal.wajdeczko@intel.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:intel-xe@lists.freedesktop.org,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,igalia.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A6A1B1AB45B
X-Rspamd-Action: no action

Applied.  Thanks!

Alex

On Wed, Feb 25, 2026 at 10:02=E2=80=AFPM Yujie Liu <yujie.liu@intel.com> wr=
ote:
>
> Warning: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:845 funct=
ion parameter 'ras_core' not described in 'ras_eeprom_append'
> Warning: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:845 expec=
ting prototype for ras_core_eeprom_append(). Prototype was for ras_eeprom_a=
ppend() instead
>
> Fixes: 5c3be5defc92 ("drm/amd/ras: Add eeprom ras functions")
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> ---
>  drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c b/drivers/gpu/d=
rm/amd/ras/rascore/ras_eeprom.c
> index cd6b057bdaf3..65c1812a10fb 100644
> --- a/drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c
> +++ b/drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c
> @@ -829,8 +829,8 @@ static int ras_eeprom_update_header(struct ras_eeprom=
_control *control)
>  }
>
>  /**
> - * ras_core_eeprom_append -- append records to the EEPROM RAS table
> - * @control: pointer to control structure
> + * ras_eeprom_append -- append records to the EEPROM RAS table
> + * @ras_core: pointer to ras core context
>   * @record: array of records to append
>   * @num: number of records in @record array
>   *
> --
> 2.43.0
>
