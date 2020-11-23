Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D922C1449
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 20:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C16E6E083;
	Mon, 23 Nov 2020 19:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D896A6E07D;
 Mon, 23 Nov 2020 19:20:45 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e7so2185043wrv.6;
 Mon, 23 Nov 2020 11:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qywik7ZeoNLjOI/OiRzyEWbv5L3UmV1jd3xo8upxDsg=;
 b=D3LUaTo9sjQT2psf9iOfR5Q+w/hWOKbYJIrGkOwrSKId0+dXBhN2JbAKZrdU51cvlB
 2TH/BH6AH3DKIlQMdVT/V8i+l/yJ0ztIDwjnuj5ekXsttMcEx45j51pC0OifHlxSPhYg
 Vk+onO+4dhk/KXF75P7ZKjh+voUOJ9oSQjQwUJDgxbPMNzzW/mCkzUromNJl14ewjTbQ
 hnFhD+OP+mQd1nGunov0a3cqO2Ge91PFnaB9BUbjoIR7Xh+5gqsSdXq8Qw6VGchsGoGF
 0vJhoOfb411RYFqRARv8q6FJ4UVj/X+YELsIA4bt6jG6BaYQDZlj6Yq4zmlmJcnYBMzK
 BWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qywik7ZeoNLjOI/OiRzyEWbv5L3UmV1jd3xo8upxDsg=;
 b=VMPFVFL+j5KYOvQ3J8lfazXe+3C+zxwp52ASXgsRqUM/G3HW2YIahoU/8u+UtqCvLY
 gjQm1leb9jYXsSgeMzra3sb8INZ6sCzn/DL9QVXpZXN53PNciARDLlOiihXvz7nJth56
 uMsJQfh+tCBOX/hrou0fWBpk+LKibcBO4nJGp5IM1ABXX/2fk5+rPdA/vU+C/Jw9aS7C
 4/MRCyB0pQrsHqlo6DZMaBEYI9Q9SNHVX1dns1n5KhfFwAcOeROW2txKt7lti6HyHYJh
 y3yeRhnMyji9G0XYEKRSKYzRPu1ocx0JbSCIcGBRvAdN3vAqTqNn7gkXdNGsssR6+eZb
 ZgTA==
X-Gm-Message-State: AOAM531EcK/K1kkJmXXzbYk+5vByRtTYAcqpjW0cInAQRCukP6xA/PBa
 PXLAkUS+PX3Pdgs+QxFDxpQCcmWllC1gtYZS/wY=
X-Google-Smtp-Source: ABdhPJy8N53HXm9IuUy+KZQkqOt4/pj9ITZPgRIZbKk5Hw32UENtsWfsI7ELNiEQlwY8TBRX7HEq8kOv+802Ag6uHEw=
X-Received: by 2002:adf:a54d:: with SMTP id j13mr1337431wrb.132.1606159244462; 
 Mon, 23 Nov 2020 11:20:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123152146.GE11033@willie-the-truck>
 <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
In-Reply-To: <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 23 Nov 2020 11:22:31 -0800
Message-ID: <CAF6AEGse=WBAC1WbTi6aD5_m1_NBg91f=veYm-7V=Uds7NA0Lw@mail.gmail.com>
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU
 support
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
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
Cc: Will Deacon <will@kernel.org>, freedreno <freedreno@lists.freedesktop.org>,
 Joerg Roedel <joro@8bytes.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 23, 2020 at 9:01 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> On 2020-11-23 20:51, Will Deacon wrote:
> > On Tue, Nov 17, 2020 at 08:00:39PM +0530, Sai Prakash Ranjan wrote:
> >> Some hardware variants contain a system cache or the last level
> >> cache(llc). This cache is typically a large block which is shared
> >> by multiple clients on the SOC. GPU uses the system cache to cache
> >> both the GPU data buffers(like textures) as well the SMMU pagetables.
> >> This helps with improved render performance as well as lower power
> >> consumption by reducing the bus traffic to the system memory.
> >>
> >> The system cache architecture allows the cache to be split into slices
> >> which then be used by multiple SOC clients. This patch series is an
> >> effort to enable and use two of those slices preallocated for the GPU,
> >> one for the GPU data buffers and another for the GPU SMMU hardware
> >> pagetables.
> >>
> >> Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
> >> Patch 7 and 8 are minor cleanups for arm-smmu impl.
> >>
> >> Changes in v8:
> >>  * Introduce a generic domain attribute for pagetable config (Will)
> >>  * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
> >>  * Move non-strict mode to use new struct domain_attr_io_pgtbl_config
> >> (Will)
> >
> > Modulo some minor comments I've made, this looks good to me. What is
> > the
> > plan for merging it? I can take the IOMMU parts, but patches 4-6 touch
> > the
> > MSM GPU driver and I'd like to avoid conflicts with that.
> >
>
> SMMU bits are pretty much independent and GPU relies on the domain
> attribute
> and the quirk exposed, so as long as SMMU changes go in first it should
> be good.
> Rob?

I suppose one option would be to split out the patch that adds the
attribute into it's own patch, and merge that both thru drm and iommu?

If Will/Robin dislike that approach, I'll pick up the parts of the drm
patches which don't depend on the new attribute for v5.11 and the rest
for v5.12.. or possibly a second late v5.11 pull req if airlied
doesn't hate me too much for it.

Going forward, I think we will have one or two more co-dependent
series, like the smmu iova fault handler improvements that Jordan
posted.  So I would like to hear how Will and Robin prefer to handle
those.

BR,
-R


> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
