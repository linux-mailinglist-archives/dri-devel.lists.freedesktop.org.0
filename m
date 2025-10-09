Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1909CBCB37F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 01:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E11410EB38;
	Thu,  9 Oct 2025 23:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JBODc7yS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770D410EB35
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 23:41:09 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-279e2554b5fso12212935ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 16:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760053269; x=1760658069; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+Sj/FlLClIAaIi47L5d+OmfIP9+1/M40ysaJFq8xtE=;
 b=JBODc7ySjExkVzt7IsGX3IrIk34ZimI9TsI7P4Yo5htd2MLIS7lK/JlJEOnYIGVJyu
 rK121U8imZ9Qs58pnWXXbGdJu6WW+AwCxl/EWHJaoQLPQveHAxUSl0spNtGOaZFik8WS
 ysfx/x21n2sh1DO3RT9uLeeaxzO/KIm+IR8IDn+LkQkP4NtYLNU8vencBeBghrmewpP/
 YExrYCvOGCqsh/7Z5M8Y8hp2xqTC90nMKEXsJXCz2VmNLpt9MeyNzqD/mtE1G3Gc/JCH
 fjKc+hWa40vc1R1GnQMpO1yOPGQ1+k5uSGXzktwW2AHWg+J/mDG95kiMuDlSlNK5D1yQ
 re7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760053269; x=1760658069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m+Sj/FlLClIAaIi47L5d+OmfIP9+1/M40ysaJFq8xtE=;
 b=Wn9fs7VNl0oopnoCFhgEd+SQdy3Lg1vafAfHwya9j2SIytjya7QH7t+fK5XL5NfQ/5
 U1Vx9vyO/G9HY4MRgfEGVQrX55Wc/J1IpRCerdnGs9ieeRP2j4L/9/brwt4YDFAxXaOm
 pnp9hqbo4SKI1qxzP5rqL0TXdY2k3jq4U3Xaw8ImFVr9U1vIAAqMkqB5kVKejPw5o/0V
 AyYGQQvoJJYPo5eUvybGqQm36Ql+UHpQxDOsBgpTsg30SBOEz/xcm94ZVHOYp7mp6eza
 IuE27we45Apmd//23c0Q/odZLs7IpDsMvM5oBuJcIMQWFVn+51fOGB0IY+gBFIqG/lcJ
 u8lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCLc2TIn58zMThDoy9+u3ZmhPs/9ce83yRJiNDwMDXygYJ7ifHo+6CN6ahCPlzbHtK0TOu5s22hH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6etek4NwnCyE+PQ+4hwYM4dSYZpU01mYPcS37HyT5rl1YoU4o
 w5kpQvmNNTfCdMqzLDEdwlKINqITnZqmooudooFxpswNA70JlmR1ENOFN6fakwJitsJ4pq6xnf3
 KLdlMEd6txyI/4V9R/nOboPF2+B6mYzQ=
X-Gm-Gg: ASbGncsZtM0XLuUbdb89Ir4ejWPfUm+Dic3gYjg1SsVVqy5rYE14zEH8ljrUO5Y/83p
 aeArVPb3j5zM0UEOHWaL2gDTLYdUzGfXarh7cO08eCRBijD7jBckfcNlvdyr4wdlcXb1Oaor5e2
 tjovva0+3pxDvd4pc+pMQwmID3ftNOepEw0YQzRjtSluFQYdislcoprb3fRheQMUPsNNRUL07iR
 nTm5/oqSzEOJbfd17PkdDHuSBCW
X-Google-Smtp-Source: AGHT+IFG8GuaAnTC9mm4pLh5wMTiHUgLi3ZgKsO3tOKCTCi2fMgbktYjlP/dKWBXn3a/6oaAReEJJC4o43voe3I/mKc=
X-Received: by 2002:a17:903:1acf:b0:269:b2e5:900d with SMTP id
 d9443c01a7336-29027e5ee48mr125511745ad.5.1760053268902; Thu, 09 Oct 2025
 16:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
 <20251006191329.277485-3-mohamedahmedegypt2001@gmail.com>
 <DDBISJ2DUDF6.150HCB14ZRPH3@kernel.org>
 <CAA+WOBvu2Gq=SM2TBdahsQ-RVi+vn_U-oDa7-DG6kj9Arq5tpA@mail.gmail.com>
 <DDE2BDLEZHBW.253EO66P7ZH2P@kernel.org>
In-Reply-To: <DDE2BDLEZHBW.253EO66P7ZH2P@kernel.org>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Fri, 10 Oct 2025 02:40:57 +0300
X-Gm-Features: AS18NWD1KmuNQjj2ajk1Vp9hVJ3FbFP6Rph0sUtrDfNLzUy8yptTDSkt7HErI0Y
Message-ID: <CAA+WOBuAJpQARp70XRpLWBMUG6hJCY0+1-dDKJrxQAQg3SwaLQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/nouveau/uvmm: Allow larger pages
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Mary Guillemard <mary@mary.zone>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org
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

Sorry about that, I misunderstood what you meant and thought you meant
to remove select_page_shift() entirely and move the shift selection
logic into op_map_prepare(). Done and sent v2.

On Thu, Oct 9, 2025 at 11:09=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu Oct 9, 2025 at 6:51 PM CEST, Mohamed Ahmed wrote:
> >> Let's move the call to select_page_shift() into op_map_prepare().
> >
> > How would this work? Originally when we were working on this, we did
> > place it in op_map_prepare() but we ran into the issue where
> > nouveau_uvmm_vmm_put() needed the page_shift retrieved (see
> > nouveau_uvmm_sm_prepare_unwind()).
>
> -                       ret =3D op_map_prepare(uvmm, &new->map, &op->map,=
 args, PAGE_SHIFT);
> +                       ret =3D op_map_prepare(uvmm, &new->map, &op->map,=
 args,
> +                                            select_page_shift(uvmm, &op-=
>map));
>
> You can move this call to select_page_shift() into op_map_prepare(), that=
's not
> related to nouveau_uvmm_sm_prepare_unwind(), right?
