Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OELXDZc5cWnKfQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 21:39:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986905D6DB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 21:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4421510E058;
	Wed, 21 Jan 2026 20:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G/StD5B/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C77F10E058
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 20:39:46 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-894774491deso4037896d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 12:39:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769027985; cv=none;
 d=google.com; s=arc-20240605;
 b=Zzzt7k+fzExl5zThLgA0ZjiceBqqUQYQyvn6Ev8hRkFBWFnlxctArxYtjbSqWx+pVq
 BKlqpMKEKaMDPCa+32zaNLXGiBWy+AUZnoCPtlpgJSCeUADcpqEFZcL/AO1j8zC5/CIz
 B2sz7vHq1N0klIj5CkuLdqMx/NNVaH3UfvOShA+iMxxXfe9I+KwcsF+ZdgxcVq6DaGDn
 V9JFA9PNeZ8nYSk/rOfb1nMwFisGk4lc8Czw/D73AorXK2qn2/GZiEq7YK5Yzu/8EOe/
 t0GIEh8Cbsy3nWYjNHy1V1Wu+67vocuvDtlWeGvqAjU3GdruR2A7OrKw8j8vpBeEFrFf
 WyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=IsKbMXb87YbdFAxJ8k3qkHdu+oabtMAOpKXMPv5pVTM=;
 fh=elsXSadir+fPlQ+9LExbmKuAJyYpSwiwoO+XEQeMc3Q=;
 b=GopELRIt6tp9mradpBT6Uy2zUZq/FbC4D8ccjzOOxBEWNK/c7KafjL4uICXg3eEm2A
 LCUL/kqQ2rLLqqei5sG+3OhXM+m3ZWlOCHLAg4qzEpcN85uYBq7uYYClgZPQfFGu6i2a
 qweFNPEAsOLVm6TXe4+jccjhH8nhrZA05et+GxkcfgaTZlZe56mF8695bajDGcZ19mtm
 Ik5w7+Mb5x/MEsPqSmiZKYraAThFlgovG9Fehyno9ygWgh7ySglylHfEsK+7Ta+lqjUM
 mVsQPRyZlnv8MhzfQgGafvbAWW+4jOs0vihwm0T36VD+ro1mdwcKxjhwE2xb/FI7uKNV
 W8gQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769027985; x=1769632785; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IsKbMXb87YbdFAxJ8k3qkHdu+oabtMAOpKXMPv5pVTM=;
 b=G/StD5B/TYER3g3hk8sGJgHVPBLNGr5zybb153AeyE+qTt+Q3dvnDsup4z7NcC0WE6
 DtPuQChiC4vX3McLQV+iwJDu0iAdArG0N4IjpIy6zQr2cUseQkh8aaKKPgcicprmUMG1
 QB/11iJczPDyuSvCaJADKPZo7M7/rjfVrCnvhk1vkNYf21lEt0WUN+87+o1TnaKTcBDE
 hrXGA/KehH7VAK8Jk46rv+pruCiSKGDVHuaG3pymsNFKeKRmRdSJjgjAn6Q2iqmvu277
 rwJWYOwyjLkR/PPGECdq7X/YEj8QNjHA2T7WyOMVTlR84C5+P4JJebvW5+3e+GjNrJDv
 y4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769027985; x=1769632785;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IsKbMXb87YbdFAxJ8k3qkHdu+oabtMAOpKXMPv5pVTM=;
 b=FOuiXDr0FdFOUV9VLlEj7XMKLORvS5WcsF9pxDB6mTmp5fgYPRqZ4q+7pB0m172/E/
 irtWo4CVaCFis0h3N5Hviki+piSuRn1/lhYUykGhRJS5c97kCy+s77NdIDj2R1pZmZv2
 eKXPxxtdN0NmihhOGsyQsF+5QcweyyJ9W0x1MqOR84BAFCJgX0mjwd0aIpiF5I/hAVSK
 qfIu5Uk4cpaaxfjCkw8xxbSKAsXMug+B2jpC6cz9tYykMXIwcAtz/WmQKbKShLJkuZcx
 Bx8paVLMrwb7bao4Fj92ItMTwFlIt690J97RdbrzJahr/nTJej9sFLnwTiVFNXt9Ikvp
 y3Bw==
X-Gm-Message-State: AOJu0Yz9OR6MgRI/5pcNgp4fBKqeN+ia830TOTWDAQ3F6beMR2ucs1Y0
 6x73cWxLbVkDk9INJYAZhf4hGgYyudYsVhrxeXun1cZ81mkt+U/XFhv7O079Ycfc4pwCUhkQ38u
 RkBp/RNpHjAfTN41UfE4f6J926E/yLks=
X-Gm-Gg: AZuq6aK2j4MtKtx6k6jRfHl+ayTkU1BpW0TYl2LPDEa1TGXXa+PVFYrrDNBZqExeBv/
 u2LALMKdVHWqTjqaLDxVfLO4OELtTfLbSxK8oWHkGt2jb7qmDtH4YUMZChuW9OBkONmk0lgGHeO
 QUwhP/D/ceoC2Bjgp6bluM8bD9bKwHxuzm8kSQLZ967jD+Tk5tcRrj6hqJGvPOzW/XM8PtPsKOS
 BpEzo2DcuKyUqt/l6lCAKU9L/fx3Dy45mXZmK6c1frouE89T/qFS+TWp6i2CUIt4owsP+bnet3y
 hgVdmQdKsZzjp80TIWo0n+YuQwOgLqAbvU1N97p6ItK4sjwbntcSQuM=
X-Received: by 2002:a05:6214:2681:b0:88a:529a:a53a with SMTP id
 6a1803df08f44-894638f61camr101162636d6.51.1769027985195; Wed, 21 Jan 2026
 12:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20260121191320.210342-1-lyude@redhat.com>
In-Reply-To: <20260121191320.210342-1-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 22 Jan 2026 06:39:33 +1000
X-Gm-Features: AZwV_Qh1FXsbPqa-FcyvA6O5iQiCl9rMUe_JWAej1pc4cnRhG7fKxVLa5VZf6Dc
Message-ID: <CAPM=9tzrCNH3DgRyJ0=KkeQ+=ENtev8UOYLXqHO+X7uK93dJNg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/disp: Set
 drm_mode_config_funcs.atomic_(check|commit)
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, stable@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:linux-kernel@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:stable@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:mripard@kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 986905D6DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 22 Jan 2026 at 05:13, Lyude Paul <lyude@redhat.com> wrote:
>
> Apparently we never actually filled these in, despite the fact that we do
> in fact technically support atomic modesetting.
>
> Since not having these filled in causes us to potentially forget to disable
> fbdev and friends during suspend/resume, let's fix it.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Dave Airlie <airlied@redhat.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 00515623a2cc7..829c2b573971c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -352,6 +352,8 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
>
>  static const struct drm_mode_config_funcs nouveau_mode_config_funcs = {
>         .fb_create = nouveau_user_framebuffer_create,
> +       .atomic_commit = drm_atomic_helper_commit,
> +       .atomic_check = drm_atomic_helper_check,
>  };
>
>
>
> base-commit: 68b271a3a94cfd6c7695a96b6398b52feb89e2c2
> --
> 2.52.0
>
