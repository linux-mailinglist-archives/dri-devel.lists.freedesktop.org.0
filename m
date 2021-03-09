Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FAE332DB2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 19:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19E189701;
	Tue,  9 Mar 2021 17:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D7989701;
 Tue,  9 Mar 2021 17:59:59 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id a17so13702531oto.5;
 Tue, 09 Mar 2021 09:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yDPCYluFrdjMuzSEcawbKVQhqqsYOAVXybwEkOdxycU=;
 b=fQQzGb/jC1+8DjdcNxsptTS92WplKKRFklYa26EweJxZelK+27rO4Dk3Z+c0CcoG0i
 ex6lvP02F6oP23QRdP1abDLhXK+leEIvngG7dxSPifhRUVltVm0o/jlN4lgIbZQMSGfC
 +Q1rQe9M8OUTe+Jfi28FRJZ9Kro9wwNnlntZekOUY38dTsiRA1vPTiL5fXNkSVVyh8K+
 t3IJjkXzGkhvzgm40JVKnCLUJezdQUyyK7kR2BsDjle84ERuGhTM1b5v7WGGrcWhVLsv
 FJdeLG2DUkH9/8Iqp4xXALIgFo1/j5y+60UcIzb/pOS7MShzZtw17n3lj6Ue2wmRdsga
 4Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yDPCYluFrdjMuzSEcawbKVQhqqsYOAVXybwEkOdxycU=;
 b=LbQiXFWqsWuN25ChlteuyO5X3zxX5GOmLo7e2KLGRsVOIHoN5ap0Jmczh1SWtCiwEq
 hNBdLW/ktmuYsfUizlwODSvIFeYiH+wEfqUj56o0EA8057NqNi6BE36TBzStxfWO1geq
 gJn5bA/6wZx2myRLCd8fuGC0LkkCRmfFzfqXRw42LdylgHACx2RWRUWVLCuyOF9OntPV
 HQ9YQZHEE28MwirRaRGBt4qI0daHbrVNSY4PgMtB4zmYq2geX6g+kkyxL4LewsTxownK
 PeGPETEEFTOgTFPQcceo1z7L6mOwzM8o1AZWpCzeEPUeX5M+d70ro4RMz3b/3jDH6i7M
 LZLg==
X-Gm-Message-State: AOAM532MeVm+3ZudJw6iFlE6D7zlvLvyrfQRXxZpgMJWPEAzTAuO6ESz
 Soe44EyGoKBMryWeU6XGi34HL8OqH6NsWsSZ7L8=
X-Google-Smtp-Source: ABdhPJwEwsQ2caBdS22GuC0IAzNDOpvTy7t2RPblLIObbiLdaz9uhek4Vj9BBKsWFEIVLdwuEa4xRZ7j1/P0+lG9We8=
X-Received: by 2002:a9d:760a:: with SMTP id k10mr25146289otl.23.1615312798691; 
 Tue, 09 Mar 2021 09:59:58 -0800 (PST)
MIME-Version: 1.0
References: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
 <20210309032356.20800-1-Felix.Kuehling@amd.com>
 <CAK8P3a1EeHimbufajcHzV+-bBarWtLHzzFSsa=qdUDsip=Wz_A@mail.gmail.com>
 <8023bb6b-b6aa-230c-afa5-871ce32782c6@amd.com> <YEexf0/V/YF394bf@myrica>
In-Reply-To: <YEexf0/V/YF394bf@myrica>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Mar 2021 12:59:47 -0500
Message-ID: <CADnq5_OTeK7-nN57+F+WE+Hdg86uiuTN8c_n0bmCtx40N_wraQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: fix build error with AMD_IOMMU_V2=m
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <felix.kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 9, 2021 at 12:55 PM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Hi Felix,
>
> On Tue, Mar 09, 2021 at 11:30:19AM -0500, Felix Kuehling wrote:
> > > I think the proper fix would be to not rely on custom hooks into a particular
> > > IOMMU driver, but to instead ensure that the amdgpu driver can do everything
> > > it needs through the regular linux/iommu.h interfaces. I realize this
> > > is more work,
> > > but I wonder if you've tried that, and why it didn't work out.
> >
> > As far as I know this hasn't been tried. I see that intel-iommu has its
> > own SVM thing, which seems to be similar to what our IOMMUv2 does. I
> > guess we'd have to abstract that into a common API.
>
> The common API was added in 26b25a2b98e4 and implemented by the Intel
> driver in 064a57d7ddfc. To support it an IOMMU driver implements new IOMMU
> ops:
>         .dev_has_feat()
>         .dev_feat_enabled()
>         .dev_enable_feat()
>         .dev_disable_feat()
>         .sva_bind()
>         .sva_unbind()
>         .sva_get_pasid()
>
> And a device driver calls iommu_dev_enable_feature(IOMMU_DEV_FEAT_SVA)
> followed by iommu_sva_bind_device().
>
> If I remember correctly the biggest obstacle for KFD is the PASID
> allocation, done by the GPU driver instead of the IOMMU driver, but there
> may be others.

IIRC, we tried to make the original IOMMUv2 functionality generic but
other vendors were not interested at the time, so it ended up being
AMD specific and since nothing else was using the pasid allocations we
put them in the GPU driver.  I guess if this is generic now, it could
be moved to a common API and taken out of the driver.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
