Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OzKBQI4lmk/cgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:06:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6FD15A902
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFEA10E62E;
	Wed, 18 Feb 2026 22:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HO8IrBrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017CE10E630
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 22:06:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2399661857
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 22:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57D9C116D0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 22:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771452411;
 bh=d0ECnb6E6NAjc35rk9eRekKo/IkQKEj1Ixpf/eUHjk8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HO8IrBrneAmxNTjOYLeEWMjdasEXwmMFxYm0imQf+s2RP4m9nU3kiXklACP8flaL6
 a9dY1PPaqKP4Y62SEgkLpUkRgvUVgvbvgkhHZAXKmGouiJOipQdKEfQ/PCL/Hd/D+8
 MaWK9CkPZQl52iWBXzTJRYBuyDO/RSq2KCT1XLx6odGCtU49ppSsZXEBlRIpkdeCXY
 Rs1TGfPkLThFHZBr4C//KoJ+S8Deng4ZmlNRA1TnIPiRalfZzgZ5Ku2u/p0PBoBOhp
 oSHCoaeK3VaPXwprTKYox2CmMDqWtdkM5O7+5MhIW2AXKKe16YzG8lcVRNRYnpYiGE
 fgu0/XrtYu54g==
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b8845cb580bso66019666b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 14:06:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWaYwBEr7ia3uOeW2QcwH3RiqA6FlWUrpeHfhDkguuhIOVOisTczbUaEn2oqXkPx63zTAyjBNdBPjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOEL1802hJYJ40HBSfje3wHhxpKFhogmd+P48IdnBempYNEmTg
 fkUTdfcnke8tu2wHtESrswHwnO1t4eLD0KlCsjKQhvait1zbjIEeBBbGmRxMk5j6W68+THy22pE
 S5UV5VUfE7YmgKfFOTtREdMkAW7Bp7g==
X-Received: by 2002:a17:907:d0e:b0:b89:fb0b:6602 with SMTP id
 a640c23a62f3a-b8fc38f23d8mr933388166b.4.1771452410397; Wed, 18 Feb 2026
 14:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
 <20260128110806.38350-20-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260128110806.38350-20-tvrtko.ursulin@igalia.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Feb 2026 16:06:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJc=UMdg1TiE34NNTAZ_XcgPdDwdq2aoD04eTqN2qJ=hw@mail.gmail.com>
X-Gm-Features: AaiRm511TmliQ9O7FFZ3UTrahqOU3lr21nuSiwaOb16syneP6pc_eCsqeed3qUM
Message-ID: <CAL_JsqJc=UMdg1TiE34NNTAZ_XcgPdDwdq2aoD04eTqN2qJ=hw@mail.gmail.com>
Subject: Re: [PATCH v6 19/31] accel/ethosu: Remove drm_sched_init_args->num_rqs
 usage
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Oded Gabbay <ogabbay@kernel.org>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: DD6FD15A902
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 5:08=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
> Remove member no longer used by the scheduler core.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: "Rob Herring (Arm)" <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> ---
>  drivers/accel/ethosu/ethosu_job.c | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
