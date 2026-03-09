Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCoCABsKr2nXMQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 18:57:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6A623E148
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 18:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9499110E580;
	Mon,  9 Mar 2026 17:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N+xrrEJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9072610E580
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 17:57:42 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso6969491f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 10:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773079061; x=1773683861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nUKSwJnAjG3KEbJmiO+Wt70o4b5Vf+pCbPEIwqMHXPE=;
 b=N+xrrEJoh7mgc/8IcxUcNKFNMsXXJdY4y/hkYhbPCqIkrG2rkjCqADC865Fjbml2mZ
 RHA1W5ZLa2KMHg1Ye6EYNsOAIoJYKVpH/uJIdNwchJ9u752TdfBzDeHaxDWh/ZVpn0ay
 MipwQepke0qy1o3xjbtpMmk27o95NSpIPiVNOijTI6zqBdtqFx0UMYu+N1h9U40ynCBn
 581MYWQtcAMrY+h+t1Nydrueh+T/G9S8ndw2aVMpq8AglPF8lg9IMIIynWmFkF+NKCSY
 59oOcei/wRBikcLz5V6qEqzpcdSWtg2TAAMNR7KYPYfgR123Puauiwtl67s9VvTT9ZjA
 hjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773079061; x=1773683861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nUKSwJnAjG3KEbJmiO+Wt70o4b5Vf+pCbPEIwqMHXPE=;
 b=OsOXGKP2b2YdAdGboRoVE2ysCF+pxXozt9yDdYnwWSUa1LV/ofTZqymYL+9P3kw/R4
 ba1YT9jaOo+9Y0sp2NVX99c+Uw0q+oQSDeBKfeUlkfmcFkt8DZ89ht2tZIuKdZRPn3cx
 jM8wLCZDy+/j8I5cuINcx6BApKHtrvEC9eXrwBE18az5LkMKp/wiK2Reh11wQ0BzBBF2
 pqlvo1BU8K3N4ij87ZeTDIAzS8hUnnwBuq7ZQold6BLjTL8ju+h36ZpRfcndedxVMhSm
 K13lalHOVkJOEz5uZKl+iENlP8DMgVlbtOmbSTn66VZa5aILQCqF2uo/CAnikbq593E1
 gf+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUplHkkdCNFpk/zz46BNK6ICBnvhxjiJW4edMlIo2KX2VBIQaEqpmngjBuVuPu0lv4aypGLCTKsol4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxbcf48JIqDeSIHZo0+TTW+Meql0AohMN677qRgRsFFvGSIrzbU
 /wuKNR91JBJKFo/7NQYNFAX9QfHBdudplinKxUcLZ4UMYzGZFyEuxthM
X-Gm-Gg: ATEYQzzKH1s9+nb9GwLvIs+MhiSA2XSNVEDvKCYYX7JHBUIzJ9r9XEcJxWbFYof5JX5
 PPCOdvq5HzFUJZA7MjkboJh1ClpnlrcLMZLcgme52A/HUWHa0LMnX9H+hB5d8+Cf6yd2Zn6f7I/
 7TOqZeKoSvZjL5Xuidf5MKzMB1djCtAcQb3qOE+UOBxb1cae9OiX4Ujv0x9BoXbUibRnSJkLxzM
 Getf9Fz/usYAQ+fcaaRFP2WWhhVgz9qtYGP9bIyFCMmvl6v/vm9tNiBiqMNxpEVLyiJbMynvUTP
 L8UqiVBFRHTfqXGNeV8sga4grMc+Y2Q0WnSNjKoypwGjmCPf6TtFountTwqLYiNwNgUaNl+gziT
 EgO9TT/s4FBE0CbmkdMSro8iHC/lMc/BPbl53r4CcV61avJ0H1X/cdmCL7Qpqv1ivEmKlEsj3eC
 RQ5j8SV0Wc3tRnAvgmQ0tmsr75M1+MpHL8untGhXDMD9NZxzd4A5GOin2fCXNaFAa/3PbqaJfhr
 tg0jg==
X-Received: by 2002:a05:6000:2506:b0:439:aef4:944b with SMTP id
 ffacd0b85a97d-439da351a36mr19860816f8f.19.1773079060736; 
 Mon, 09 Mar 2026 10:57:40 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net.
 [86.58.12.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad97da3sm31230324f8f.12.2026.03.09.10.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 10:57:40 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get
 display memory
Date: Mon, 09 Mar 2026 18:57:39 +0100
Message-ID: <2820486.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260309165635.1138413-1-wens@kernel.org>
References: <20260309165635.1138413-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Queue-Id: 7B6A623E148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:jernej@kernel.org,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:linux-sunxi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jernejskrabec@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Dne ponedeljek, 9. marec 2026 ob 17:56:33 Srednjeevropski standardni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> Commit 4636ce93d5b2 ("drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()")
> adds a new helper, which covers fetching a drm_framebuffer's GEM object
> and calculating the buffer address for a given plane.
>=20
> This patch uses this helper to replace our own open coded version of the
> same function.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Nice!

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


