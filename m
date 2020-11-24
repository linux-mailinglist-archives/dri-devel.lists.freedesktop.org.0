Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C32C33AB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 23:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1357A6E1F8;
	Tue, 24 Nov 2020 22:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B0B6E15E;
 Tue, 24 Nov 2020 22:06:32 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id c198so363247wmd.0;
 Tue, 24 Nov 2020 14:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Figoe8Zer72GbW0+hvjATZnj5NO6h5Raa/lqkNpArQ=;
 b=jc/+571ztrybLm+BOwSaoY7pl4esZi+3r3UODwY6Ge1iKKDOPYMx6lwyjDb88+QxAm
 YenolkYfmfPpLhA+w6f5e/1qbkphU0EepCGWU8xLQofles6qPv/nl1DVGk3z/O344be2
 xZ4VTY9dIj8j0z06kpnm6uvyCYG0fueUt3pqqxnOQZOhr0yQC2AGyWdPqSnRt2aIQ7AK
 Yl6yzAnF27oIa9mypy+3ntdIaN0uZyoNxQ4gsk6uBoeWwZDiwqmQTkTpVjAUR4RIRjew
 /P7O7b2lv+JiKkgOoyw+doXLWoWCzR0WMJ/OvmJBZhf0GMXiUMhm2cryo2QoYDH5qYKW
 q3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Figoe8Zer72GbW0+hvjATZnj5NO6h5Raa/lqkNpArQ=;
 b=f0ccF9m8OqYiFjZgBzIWVTmu095dWAaJGwIYRETVMNKpOfHrIg96lNi7zc8rs8B3ir
 SCmCv0DXV2txAA7CC7peYc3FTgU9LN7y2HxwoJvYydLsS7dAcoe68JYaG0hpRFl8UrfO
 VtpCXMNOQnmEbjJA3adsrgzkf8PfEIGQlZcJcgRjB73PBxaF5CJ1+MuzOUpO7mKvfxNk
 xZ1+AeZTG7WzMc+p9KiNDFsg10MoNewz6ITp6SyS96d0B4DvQFqLd4coQGK5EzzXOIiD
 K4rDNm4WTgcciOYCQB3Qorz7yXlqtnJE27w8ni97M2IvIH00PpigqmkhtaeNT29Ywcn1
 399Q==
X-Gm-Message-State: AOAM5305IuUTiNVKl6Vp7KzIBw9nla/2XN3qpsUOYBbBRCs61b/Jp0lx
 HsHAos6xUApSqd5fDwngvslH3vDco9B3T8DkUZM=
X-Google-Smtp-Source: ABdhPJwxbj4hO3UhcOcUoC6jldq1SY0wj0dG1MEboORgvbHGRin3UXGunv67sZajYqm+JEM/JctmCGooiJvj2pLsGak=
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr470472wmb.175.1606255591078; 
 Tue, 24 Nov 2020 14:06:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123152146.GE11033@willie-the-truck>
 <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
 <CAF6AEGse=WBAC1WbTi6aD5_m1_NBg91f=veYm-7V=Uds7NA0Lw@mail.gmail.com>
 <1c665e33d1d27263fb5056c16d30b827@codeaurora.org>
 <20201124111027.GA13151@willie-the-truck>
 <CAF6AEGuZ2YbY=ATFBX1KJw=LwhcpH8n+zzxckTHPwwopi6mOqw@mail.gmail.com>
 <20201124214332.GC14252@willie-the-truck>
In-Reply-To: <20201124214332.GC14252@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 24 Nov 2020 14:08:17 -0800
Message-ID: <CAF6AEGvu2Hdnw=ia8Ffmr1LPvkQNKpVVBM9xMNUKCn9uDcWWAg@mail.gmail.com>
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU
 support
To: Will Deacon <will@kernel.org>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>,
 " <iommu@lists.linux-foundation.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 1:43 PM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Nov 24, 2020 at 11:05:39AM -0800, Rob Clark wrote:
> > On Tue, Nov 24, 2020 at 3:10 AM Will Deacon <will@kernel.org> wrote:
> > > On Tue, Nov 24, 2020 at 09:32:54AM +0530, Sai Prakash Ranjan wrote:
> > > > On 2020-11-24 00:52, Rob Clark wrote:
> > > > > On Mon, Nov 23, 2020 at 9:01 AM Sai Prakash Ranjan
> > > > > <saiprakash.ranjan@codeaurora.org> wrote:
> > > > > > On 2020-11-23 20:51, Will Deacon wrote:
> > > > > > > Modulo some minor comments I've made, this looks good to me. What is
> > > > > > > the
> > > > > > > plan for merging it? I can take the IOMMU parts, but patches 4-6 touch
> > > > > > > the
> > > > > > > MSM GPU driver and I'd like to avoid conflicts with that.
> > > > > > >
> > > > > >
> > > > > > SMMU bits are pretty much independent and GPU relies on the domain
> > > > > > attribute
> > > > > > and the quirk exposed, so as long as SMMU changes go in first it
> > > > > > should
> > > > > > be good.
> > > > > > Rob?
> > > > >
> > > > > I suppose one option would be to split out the patch that adds the
> > > > > attribute into it's own patch, and merge that both thru drm and iommu?
> > > > >
> > > >
> > > > Ok I can split out domain attr and quirk into its own patch if Will is
> > > > fine with that approach.
> > >
> > > Why don't I just queue the first two patches on their own branch and we
> > > both pull that?
> >
> > Ok, that works for me.  I normally base msm-next on -rc1 but I guess
> > as long as we base the branch on the older or our two -next branches,
> > that should work out nicely
>
> Turns out we're getting a v10 of Sai's stuff, so I've asked him to split
> patch two up anyway. Then I'll make a branch based on -rc1 that we can
> both pull.

Sounds good, thx

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
