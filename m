Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAP7NmRWnWk2OgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:42:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417571832AD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E79310E4CE;
	Tue, 24 Feb 2026 07:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ubglMiOT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com
 [209.85.208.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2219110E4CE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:42:24 +0000 (UTC)
Received: by mail-ed1-f73.google.com with SMTP id
 4fb4d7f45d1cf-65a1b27b84cso6123513a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771918942; x=1772523742;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=frFYhvxWM9eIw5h2wgGi0BhhHCnVyyp+eDzoN2U5eXo=;
 b=ubglMiOTl0s89clEPrFVV5pvqKY7ZH3LZaoIprjXz/TaU0Z+OQNwLAUn3jmyddsSXn
 2zwWdZwT+9xQzTvtIGOfgdvBlg1RkWoQKvcRtjFYy5Vumto/1fDGWq/pgjBwEt23bFna
 xusx/BWPBKNTtpEpEinHa2QQPxyzug1q+RpJvh7/TdKmoxzPMIhTtM4YYKLUa68GAXcp
 b3chYyhb7OIfLnJMV26yufBgvoXPQeFlwc7rMlNsbVZrr5NalN1wwDVMkYBDFIEIjOfl
 AbzFCG2MA+/2l56FYQo4+WSBCUANcpIW2N5Y3NriEqiOx7ssgsmjv1Jtd12Jx9pELN+g
 Wi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771918942; x=1772523742;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=frFYhvxWM9eIw5h2wgGi0BhhHCnVyyp+eDzoN2U5eXo=;
 b=nGzUeWuMKFXGXVoMjd3uu0xTnbRmrDt31tVIJkDX74m1l5Ou1DutENrJmgO9QB0gBV
 LP+0B8cxr45AHFV2hxObhJsD9OJxkVIitjQER4Ak2PN2VnHmNKwOi/hJSP7vPaEAJ/wL
 HRapc+e0cedPNHLWFj+T7L0F8djBSTSW5etYupXRFMw3H0ZF6QVNrXVmhIwrGXepvkUa
 2hagDzD0YhvJC5zaHzB50ArNC/FO1APIvDuAQQBjgbRuBxrwBuukJEjmrU0DfWFcta9P
 ipTsgk56V5phVduk+IwvZVH26qUqfnn1QIhjCaoky3m0/rh2zgoNFl1dntSPjrqaXE5S
 yOqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsGgYcHNZd2GMrQ3ZTu/j+vXFZca6iZsA3z655yDjzIThGVT4aSK1WmSz3l2mnv3BfiE7H+Q9Tqgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywraqh7bdTGyttp+uXu1eXhiexrcAZk/nlMUnkMGbDrIBZ0uKmo
 nrgkiaAc+w9kB+GM4a3BD8zgw0DVsWOGxs/PliztxC6MC/R6XItWiZq8LzxvIZoNkucDWfUldwa
 n3IjqeDl750dibiAaOw==
X-Received: from ejrv26.prod.google.com ([2002:a17:906:565a:b0:b8e:a7a6:78a1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1c18:b0:b8f:6699:a036 with SMTP id
 a640c23a62f3a-b9081a2bfa6mr666119866b.19.1771918942287; 
 Mon, 23 Feb 2026 23:42:22 -0800 (PST)
Date: Tue, 24 Feb 2026 07:42:21 +0000
In-Reply-To: <20260210183812.261142-1-work@onurozkan.dev>
Mime-Version: 1.0
References: <20260210183812.261142-1-work@onurozkan.dev>
Message-ID: <aZ1WXYhM8meuCZkM@google.com>
Subject: Re: [PATCH v1] drm/tyr: gpu: fix GpuInfo::log model/version decoding
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: daniel.almeida@collabora.com, dakr@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:work@onurozkan.dev,m:daniel.almeida@collabora.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,onurozkan.dev:email]
X-Rspamd-Queue-Id: 417571832AD
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 09:38:12PM +0300, Onur =C3=96zkan wrote:
> GpuInfo::log() was decoding GPU_ID like this:
>=20
>   major =3D (self.gpu_id >> 16) & 0xff;
>   minor =3D (self.gpu_id >> 8) & 0xff;
>   status =3D self.gpu_id & 0xff;
>=20
> That does not match the Mali GPU_ID layout and mixes unrelated
> fields. Due to that, model detection becomes `mali-unknown` on
> rk3588s which is wrong.
>=20
> We can already get all the version information with a single
> GpuId::from call (less code and cleaner), so this patch uses it.
>=20
> Also renamed `GpuModels` fields from `major/minor` to
> `arch_major/prod_major` to reflect their real meaning.
>=20
> This change was tested on Orange Pi 5 (rk3588s) board and the
> results are as follows:
>=20
> Before this change:
>=20
> $ dmesg | grep 'tyr'
> [   19.698338] tyr fb000000.gpu: mali-unknown id 0xa867 major 0x67 minor =
0x0 status 0x5
> [   19.699050] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0=
x301 MMU:0x2830 AS:0xff
> [   19.699817] tyr fb000000.gpu: shader_present=3D0x0000000000050005 l2_p=
resent=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [   19.702493] tyr fb000000.gpu: Tyr initialized correctly.
>=20
> After this change:
>=20
> $ dmesg | grep 'tyr'
> [   19.591692] tyr fb000000.gpu: mali-g610 id 0xa867 major 0x0 minor 0x0 =
status 0x5
> [   19.592374] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0=
x301 MMU:0x2830 AS:0xff
> [   19.593141] tyr fb000000.gpu: shader_present=3D0x0000000000050005 l2_p=
resent=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [   19.595831] tyr fb000000.gpu: Tyr initialized correctly.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Applied to drm-rust-next. Thanks!
