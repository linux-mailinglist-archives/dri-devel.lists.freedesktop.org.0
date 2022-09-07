Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C2D5B07AA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 16:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA93D10E790;
	Wed,  7 Sep 2022 14:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACDD10E790;
 Wed,  7 Sep 2022 14:56:48 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 6-20020a9d0106000000b0063963134d04so10455086otu.3; 
 Wed, 07 Sep 2022 07:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=R18/KkvI0bwN1Yb6uOYkzfgE4nW++3c9UPmBBYxx7CU=;
 b=QB8Ku1JNOE1BUAopdNjlcDp1puobGOzHlyUhKR6CWlFP15tejy6UAgQs1GfZwKadDs
 a0gyp3nB4XZrd9rchWz256RHIKDl9/5krwM7UNHlfD50LKybxsC9CnfE4pZPYmK+4Ts5
 t4Z9wLe8CfXRL0bSpxGpdhk2xl6jIu6MqoUrmLSWyu0NIl6qvHzY/sAigyQ4uP+A/tpi
 YRTM4RATMRutuA03smGNmntwEwWKGWyKBcL3ggj9qxpTDBXnTQs+yn3qViuHbNXWvDLV
 zE2vGQlvDUFm9ZR38UdkiSpxEla5mWnaJMNzf2L6bYPonYsiJkE2lFOtc+qR1Gr7Lcup
 w2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=R18/KkvI0bwN1Yb6uOYkzfgE4nW++3c9UPmBBYxx7CU=;
 b=K2sJvzZUf/jVaIF95TFKprD6hTYJZ9fKpDEL2eiVwMb8cO0xyMQ39ppuFVWNJMclna
 CMFBgzExpLoprim3pisYTluYBe4OsQFVlBqHPEyvt50CVbamv3l3GLEA9h89dxOFRZZM
 PnXiI2GwZH430a6JQ7Crl/6jp2441e/8k8tav9L/JzgjzZkW3EU1FL5lmyHofDNi8mFE
 2fJerA6A7lXsAVoJEMC//CIjRLr2dRhikQNClk06mgh+J1/KSbAm/fU1icEB7MHOMuZo
 WpKhMu91XvyAjNAC1gWlzOZrBaX2XPCJzA2KtkPx8EeqwqyzE0MAuc6eJ1OFPWkrgwNB
 Fe5A==
X-Gm-Message-State: ACgBeo2nQ75LcL8GroobQI8w6U41+IOmXoExoquu2zXu9ZeMlvsO6blS
 okj7tp5a+G0KLOp112FgN1yzHiY878BI5KqRjjw=
X-Google-Smtp-Source: AA6agR7IWbHn3lhZ/ot+C85/TxO/QN9z4ndtsTAyaJfaazgJGihOPTdsepxkn6HDUffxyIi1P+btvKVCBiP4iT8yQic=
X-Received: by 2002:a05:6830:54b:b0:636:eecb:1196 with SMTP id
 l11-20020a056830054b00b00636eecb1196mr1623273otb.123.1662562607723; Wed, 07
 Sep 2022 07:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220907112657.25150-1-yuanjilin@cdjrlc.com>
 <becf299e-9cf0-68bc-da31-1207e4bb71e1@arm.com>
In-Reply-To: <becf299e-9cf0-68bc-da31-1207e4bb71e1@arm.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 7 Sep 2022 10:56:36 -0400
Message-ID: <CADnq5_Ms18MHqyQVZ7UMQUCGGinzWtb5SkLubjSceOgrfJn+Ag@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix repeated words in comments
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 7, 2022 at 10:50 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-09-07 12:26, Jilin Yuan wrote:
> > Delete the redundant word 'we'.
>
> FWIW, to me it's not redundant because while indeed it is not correct,
> it looks exactly like the kind of typo I might make of "if we", and
> parsing it as *that* does make sense. The sentence you end up with here
> can hardly be considered an improvement since it is still ungrammatical
> nonsense.

Yes, I believe this was supposed to say "if we" rather than "we we".

Alex

>
> Robin.
>
> > Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> > index 02cb3a12dd76..6d6cc4637d41 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> > @@ -694,7 +694,7 @@ static int amdgpu_vce_cs_reloc(struct amdgpu_cs_parser *p, struct amdgpu_ib *ib,
> >    * @allocated: allocated a new handle?
> >    *
> >    * Validates the handle and return the found session index or -EINVAL
> > - * we we don't have another free session index.
> > + * we don't have another free session index.
> >    */
> >   static int amdgpu_vce_validate_handle(struct amdgpu_cs_parser *p,
> >                                     uint32_t handle, uint32_t *allocated)
