Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223C933301E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 21:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DE289CA8;
	Tue,  9 Mar 2021 20:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7786E919
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 17:34:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso7257804wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Mar 2021 09:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u2Jgq2SnEUtYvh+N+tLW1yt3xw0hfp1QxcwgyedJ7ds=;
 b=qJyWMJ60xOqK0ZUsA2dlaXWSGFKGH3Yvm6uAgMQJAXNEPWydlYRk8aq9iAaoFgqdm4
 KfHU/rYSqzlLw6DjYgzy+0ubuR3EQHX0GgxFtDVTL8pmxBv2t62G2xik5b026iT+pt+S
 E36q/xu+DnxEGX31iTZRh5KQT4wWhdovQaUJEG9KQtEtF0JbMy5LIqdi14SepZWK4+7b
 j/ZPgEOWBqH6kCWswHqw+3kWCGIdkXwpJPN3wYXXstSKWTjL9Ev6jN4USnUz/FMlvuE4
 +yH3FHbcxiopniS/RMPTfquoFNP+16GDnuM55pO1njHe2VqIUOrdXiRw13CaLmROpLav
 BVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u2Jgq2SnEUtYvh+N+tLW1yt3xw0hfp1QxcwgyedJ7ds=;
 b=mLYtU1xhtJ+Sfi8OrDgmWr6ktXrZPKRJxyrEfs5piP4DWr93DCkJLOTtV5hDXF6Xmh
 RLS7gJVxPwPITM7LTuNAYJpQLkP7HlkLo5gTTriBu6XmUaT393ecSc4uGedgzX1sIxe8
 RhT8r6Kukj14NawhJjC4K6kG4Gfib2oHJY9p0wswfvKWwrkcyvzSnWPTPOVgqdsMIo3y
 ImUV/PA7F9pyAifBdyeNmtE0UMZhhlnU7uZtstcYQJBZsuqsVjMGeE15SShIEkjXXova
 NN4b8P3xOQv3AlLpD17LoNt8pmmBI8Yj9Af6bGtcB19JMaFNW/H7kjJ0iwfA3HbOkKpV
 8PYA==
X-Gm-Message-State: AOAM533VvMhjfVlP84XjM8nHiTEx9q6I5PZcMoV7T95+SIsJx/BQnGCC
 F9iC1kY/HpDfw+mSqZGuv7ZY3g==
X-Google-Smtp-Source: ABdhPJx6ZdYnpNQLX/O7M2VYIdw9Lzlp44StIKqfq7yUlf4Hzk6VAEa3cWvsT55R4PRXOBUooXO2sQ==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr5325693wmc.59.1615311254016; 
 Tue, 09 Mar 2021 09:34:14 -0800 (PST)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id w6sm25973243wrl.49.2021.03.09.09.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:34:13 -0800 (PST)
Date: Tue, 9 Mar 2021 18:33:51 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: fix build error with AMD_IOMMU_V2=m
Message-ID: <YEexf0/V/YF394bf@myrica>
References: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
 <20210309032356.20800-1-Felix.Kuehling@amd.com>
 <CAK8P3a1EeHimbufajcHzV+-bBarWtLHzzFSsa=qdUDsip=Wz_A@mail.gmail.com>
 <8023bb6b-b6aa-230c-afa5-871ce32782c6@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8023bb6b-b6aa-230c-afa5-871ce32782c6@amd.com>
X-Mailman-Approved-At: Tue, 09 Mar 2021 20:42:34 +0000
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Will Deacon <will@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Felix,

On Tue, Mar 09, 2021 at 11:30:19AM -0500, Felix Kuehling wrote:
> > I think the proper fix would be to not rely on custom hooks into a particular
> > IOMMU driver, but to instead ensure that the amdgpu driver can do everything
> > it needs through the regular linux/iommu.h interfaces. I realize this
> > is more work,
> > but I wonder if you've tried that, and why it didn't work out.
> 
> As far as I know this hasn't been tried. I see that intel-iommu has its
> own SVM thing, which seems to be similar to what our IOMMUv2 does. I
> guess we'd have to abstract that into a common API.

The common API was added in 26b25a2b98e4 and implemented by the Intel
driver in 064a57d7ddfc. To support it an IOMMU driver implements new IOMMU
ops:
	.dev_has_feat()
	.dev_feat_enabled()
	.dev_enable_feat()
	.dev_disable_feat()
	.sva_bind()
	.sva_unbind()
	.sva_get_pasid()

And a device driver calls iommu_dev_enable_feature(IOMMU_DEV_FEAT_SVA)
followed by iommu_sva_bind_device().

If I remember correctly the biggest obstacle for KFD is the PASID
allocation, done by the GPU driver instead of the IOMMU driver, but there
may be others.

Thanks,
Jean
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
