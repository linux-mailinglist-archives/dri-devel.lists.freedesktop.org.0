Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNc1J2F8gGnE8wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:28:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35978CAED4
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FB110E419;
	Mon,  2 Feb 2026 10:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XLq/DDsj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E222110E418
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 10:28:44 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-353576abcfeso1820174a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 02:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770028124; cv=none;
 d=google.com; s=arc-20240605;
 b=N0RrXZyS+Le76YDQ1RMLt0BicCYWQMQIQJUbZxnt4PKc//m8cR6Tmi1Ljj+I64evLp
 23plWwYnr6Sb8PtPVdTKEZi+00LMJVRuxW9D20rN6YEidMSCUnKbNcPCbUNQlKySHp8c
 qTrnEzcrKO6AtIO7BeFIcQA27UMpE0jOjjWPdRdqiNegFQ3jVq+7OF2PohAtHjGJJNOD
 7AA3sIJ2HNwhm8BVsiIw3DFajwc+ZMVxGur98Tr6w3YbBNep+C6JkK5Ny7FiuMyxPQXW
 y+Xdx/KnP/meVTgyTv9e9u38j2d4lPPUgl72GckwnYFzLUh4Yc/mCr3sUhLbcDCEy++q
 sfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MFOpNv5aGURhK7guif4BLW5/Z1g5jtAibOsBQwSYIj8=;
 fh=convSw78Cyxd8+mtLWXSSEOFuoNaGyliYWU9v/GWLQc=;
 b=Co7tdV2I9c6fnwao39Ws+t9tFqVq7nQ+C7bImEgDswe4efmTcwXgQeM0ILZunTKAbN
 +rHMf5JIe8GyqMztrqBTOjwVyiNZ7++DEZuv7Vn17f6O/iDTNWC/qnLOT5Wc2DSU3WaV
 GwtxrgO48aVbEFUh7HZXkHpN+jUhIAUnuNduvMgZRWPNg1nbJ1541JkPR81D1BeNKOYA
 CoiOyMpdD50MTgenOwoBlBzR9jmDY99r/PnyhazDL+z7xIDkW8el3J7Vdzdz6g3p9irz
 LeY0+h8TjZ5/nJrogQJQkTiaO+bogXO8axOBJ81xunxpkRNisZEM2r9tul+nu9v2CI4l
 s7jg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770028124; x=1770632924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MFOpNv5aGURhK7guif4BLW5/Z1g5jtAibOsBQwSYIj8=;
 b=XLq/DDsj2aMEc0nJzAC+N7D1LY3RD3wV2oq5YFdttTQvXQdyZWJN5JJRCfcvP7eiFu
 UL5EKhAY5Oi3fG9PeKVRLvZEkRujuw55YtCvIASlnM6IEjlcuyy5zP8A6rtr2k/VBPo1
 YwnHdiTaI3J6iWqJD6c3uhDfv+8HmAYykTonrEnqlEKMXTzDSAE1epih3JR6Wv5RTnEl
 fTV286NMXQrEylreivNElfYw1iX/KwuFWwjVK0nEKQf6Wx76YHs2hi4gEAaGYQDQMu3s
 2ROkSvkmDxExEOrcYq9mpaXL0NSAEZpq2XR/FoWSr7GF0VEjTYntbQBzaJDbmfGWoSEm
 +hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770028124; x=1770632924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MFOpNv5aGURhK7guif4BLW5/Z1g5jtAibOsBQwSYIj8=;
 b=odQHBf8ien3q6V0QVzJ+EbJ9fAfmKtZYnL59NY7ZA5a2k6P7aDf3CMTmBlmlwJdJ3N
 dkKNsZMGNXwd4ApCEY79utRN0Zlk5VngRUhh0fm1E2FBnAbtMhqo0VrwHzurbD/833wV
 UsEQoAPro+KiLdFBsq751raZXZFteSFuUZHUlZZebjlxSJBnrKO1jFsJOof5xqfzrRza
 CG9yscg/U8FNvgRA4xYSI6s28mNeH+5Vk65BwC+W2mi7F1J/YhFE9PZQwBiD73wzy0/V
 5QgYb7qnjkOZZnFGtg728rs1yiLOmaf8hL+UKR1axEXJpMSbo8YEynNVsXhe1yNW8T8p
 OxYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVONav0ydyb7mvMF81K2ZY32ucLNOpxsf+EC2kp9zmUEeL/F538JeamPpVgsCwJkQxIXm/PCaNtp10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKuEu4FPA60/QDcCznB8u+xxzi8hU8CzO/fMZd6R71yQjAEDBz
 L+eZwBqe/d49lJ5w42AdfWBQJltn98/g+2MUBUW4DZEw+rgjcL5uJEfGrtJMl7ntTfhFHIUsXsa
 onShBlBXuaA/1Esd3zw/WXYylSO0aFdg=
X-Gm-Gg: AZuq6aJpEV4S0rw7jiziQUvuouyMDpAJyYLvSMQUrEMxGX3pmSe3CK57yvY/7JsX/e/
 g+aS/Zjky/BBViARceGfcHO+Lv9NuAUBS28qgI8PnPPgxewxCnvktX5bLvc0YaVQMyIO/W9k6Dj
 l//1kss5xyaVfo3Buy2/h/H1nz6niv4iGggT1uWeVWhzCTeXvcXaQU10/dB4HCv8gZ+tvNi0N6C
 onnihXNPieWKWvTkUWSLdEyNaJt2y3ubMTkczPvEniH+mVLfV0COFKxyunpiIwFIBMQlbCjqaUL
 nQ/o8nO/
X-Received: by 2002:a17:90b:3f85:b0:341:8b2b:43c with SMTP id
 98e67ed59e1d1-3543b3d65e2mr11169058a91.18.1770028124249; Mon, 02 Feb 2026
 02:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20260119082553.195181-1-aha310510@gmail.com>
 <CAAQKjZMHSQrowPWnWaO88Wynub00YjGLPnSNCg4n4CyNwgYtTQ@mail.gmail.com>
In-Reply-To: <CAAQKjZMHSQrowPWnWaO88Wynub00YjGLPnSNCg4n4CyNwgYtTQ@mail.gmail.com>
From: Jeongjun Park <aha310510@gmail.com>
Date: Mon, 2 Feb 2026 19:28:33 +0900
X-Gm-Features: AZwV_Qg17xGCvCzPBxDLKPqusD21IoQMfG9fEwI1GEiMPhdbVzUTaXzYVLC5Kk0
Message-ID: <CAO9qdTHodCQ=SnnSASSNnNiTyjxb6r2yfVMuTvdT8+LRLtf4Hg@mail.gmail.com>
Subject: Re: [PATCH 0/3 RESEND] drm/exynos: vidi: fix various memory
 corruption bugs
To: Inki Dae <daeinki@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daeinki@gmail.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[samsung.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 35978CAED4
X-Rspamd-Action: no action

Hello Inki,

Inki Dae <daeinki@gmail.com> wrote:
>
> Hello Mr Park,
>
> I'm sorry for being late. I forgot to review the patch you had posted bef=
ore. I will proceed with the review soon.
>
> Thanks,
> Inki Dae
>

Sorry I checked my email again and realized I forgot to add the Fixes tag.
I'll write a v2 patch and send it to you right away.

Regards,
Jeongjun Park

>
> 2026=EB=85=84 1=EC=9B=94 19=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:26,=
 Jeongjun Park <aha310510@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>>
>> This is a series of patches that address several memory bugs that occur
>> in the Exynos Virtual Display driver.
>>
>> Jeongjun Park (3):
>>   drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection=
_ioctl()
>>   drm/exynos: vidi: fix to avoid directly dereferencing user pointer
>>   drm/exynos: vidi: use ctx->lock to protect struct vidi_context member =
variables related to memory alloc/free
>>
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++-----------
>>  2 files changed, 64 insertions(+), 11 deletions(-)
>>
