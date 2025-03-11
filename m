Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECBEA5CA77
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 17:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5D010E263;
	Tue, 11 Mar 2025 16:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lRBwZ3y2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0884E10E25A;
 Tue, 11 Mar 2025 16:11:54 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2ff5f2c5924so1560181a91.2; 
 Tue, 11 Mar 2025 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741709514; x=1742314314; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tbXgDbQe6odtzN7qJt3Hn9EsxbW1Jh0Po6Yo1yHTQZY=;
 b=lRBwZ3y2TltEQ6OdMdJfMThNq3GTBoHgNDK0tlArpSnZI13shsSQ4rpLYWJYFPblpX
 XAVF4KW3qCDWUTrJ4ZE4LyT1uTz/JoXKIZZuXqzER8qR/5sFrnxlQBIL4uKRqfari5Ht
 sG8+PVR+iailpzg6FQrIf4f7tI/auImgZKRQQvNhcSyMQ0/fIE3ZxLsOHLWmfAfHsLPr
 tFRiy7cugL+vMmTTHt1/XMWYe98L/m1Av7ARFNzlEBe7BH2CbdodMnXwtqHM8uxC9Ud1
 ZTIgVTfAazts3UQo41NyZrSEOH8VqPrco7JxEVxz2T+vTvg/FLjcl/WhqwxvH2+Mp+pA
 074A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741709514; x=1742314314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tbXgDbQe6odtzN7qJt3Hn9EsxbW1Jh0Po6Yo1yHTQZY=;
 b=dmKHyVOiqCDKDBouwEoJDLJ0dZ2opRpocj/d+qBOluTT/wHhKP+JufbIQBFSIusggk
 twBOZuztqqvVyJLyaNNfYj1wueRWE7uhF3au+Bs4y5TbYdGj/+G34QJ/mAKY6PIK7Uyc
 sxvpXlFfF2jPu5Cji2wAtcKZl14upZrWQceOe0XTHRygvbGVcju0ybqBgCvhAJZE1gDh
 TCszPfMRjPnBXSCWw8bTI/nndeLPaKcBU7reqLeAGCdvQ2F7yX9hirv1KyokaEPSAmQX
 3iNJgdUN7bUUuk8FEiZDArIbHNZmLDljL9PxfIQZ0jtoWg9aMyXUOViRHnsX5ptHitp5
 vRDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5nbNoj5CCxnGrQ802h5TDcylPFzPlkqo8VOpMy6zsZ8Rnbe98App9BufQePNQDdT89V3HDWnV7tyo@lists.freedesktop.org,
 AJvYcCVKEiP1/0VfnHhnPqSfXUelTv7DLyFkoO9V4oigRz/EsryZeR7aV29/i87HlH6fByQhzwchoDNu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnHr08LOABCRMcVwK4RcL06xbNCAk/tDPNdGkSw7lomX/ziJGt
 Cp9c46LOsaYOH6hx9RoSqI6N7kFQddMOZRcbu+kiDmotEHe//LxYBeNo2E57Y8AgtkJUGhAVr+O
 qBn1pGx4pzaFphOICwmAOamqtw/Y=
X-Gm-Gg: ASbGncvDXs1z9L1AnrmscgFTgD8vkgRfS86RepfofRwAQpm0//ybzgHfZXQGzNo6E82
 2hEyMH5SHePZ8mbHy/Weaxfe0O0D8O8gqFw+Kvlcsiv9+IL0CbfDKfZYNp+idaw3CgLsPPwk38O
 0kK+KK0x/PUFZkg91rWCgYYl7+BSkPHn4kNG8M
X-Google-Smtp-Source: AGHT+IHoUI2IVDeSuvbHPxuzIsIzy8DbeE/xia2Z5IbkvUSauYjGSV2OlB5NBKJvQwzYZ9fQklzxpagAfdTPP7TP2rY=
X-Received: by 2002:a17:90b:4d0b:b0:2fe:8fa0:e7a1 with SMTP id
 98e67ed59e1d1-300ff720794mr2092338a91.2.1741709513631; Tue, 11 Mar 2025
 09:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250311111501.9190-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20250311111501.9190-1-n.zhandarovich@fintech.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 Mar 2025 12:11:41 -0400
X-Gm-Features: AQ5f1Jo_n7znu1k53mWqt5ocAdZXDWFpNjqsQGbU5mMQMuEwRLuEpw7wKFxIBH4
Message-ID: <CADnq5_M0vVpU-puopwNjJcaSKfHr3ZDS3_n-Cmf5MWAA_4qViQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: fix uninitialized size issue in
 radeon_vce_cs_parse()
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
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

Applied.  Thanks!

Alex

On Tue, Mar 11, 2025 at 7:23=E2=80=AFAM Nikita Zhandarovich
<n.zhandarovich@fintech.ru> wrote:
>
> On the off chance that command stream passed from userspace via
> ioctl() call to radeon_vce_cs_parse() is weirdly crafted and
> first command to execute is to encode (case 0x03000001), the function
> in question will attempt to call radeon_vce_cs_reloc() with size
> argument that has not been properly initialized. Specifically, 'size'
> will point to 'tmp' variable before the latter had a chance to be
> assigned any value.
>
> Play it safe and init 'tmp' with 0, thus ensuring that
> radeon_vce_cs_reloc() will catch an early error in cases like these.
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>
> Fixes: 2fc5703abda2 ("drm/radeon: check VCE relocation buffer range v3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  drivers/gpu/drm/radeon/radeon_vce.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/radeon=
/radeon_vce.c
> index d1871af967d4..2355a78e1b69 100644
> --- a/drivers/gpu/drm/radeon/radeon_vce.c
> +++ b/drivers/gpu/drm/radeon/radeon_vce.c
> @@ -557,7 +557,7 @@ int radeon_vce_cs_parse(struct radeon_cs_parser *p)
>  {
>         int session_idx =3D -1;
>         bool destroyed =3D false, created =3D false, allocated =3D false;
> -       uint32_t tmp, handle =3D 0;
> +       uint32_t tmp =3D 0, handle =3D 0;
>         uint32_t *size =3D &tmp;
>         int i, r =3D 0;
>
