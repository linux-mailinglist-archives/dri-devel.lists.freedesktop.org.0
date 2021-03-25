Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E24349987
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 19:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341DD6E08E;
	Thu, 25 Mar 2021 18:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DAA6E0F6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 18:32:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id x13so3278784wrs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 11:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LA7Hb8nPRjo7MYxOvggtNYhoehPphvQZUls236H6p9c=;
 b=lCy9FmR+0+E3y+itb1T4Bo+0O8CW7BnVc3yt+JaKtf8cFujFCJqgo1ANCYhYtVT/05
 qhSlJzsHZTidpxjZQL5tusQja6HKdQZPTRdv0fwTO9IeKJAWZjIXKibDlI8Sfv2q7iu4
 snCqTnc+qnFRuXmBXFce458ASq1UO+gJu26y7aK70lEbSruHYo0b9OnFLS6EtZpkGiIh
 BLt4hgtGpDHd5uvl+93JKtYldTtvu1PNdWzOiakWqb3es406VE+tIfs192wwGTegIO+j
 06CuchkPjC5xYKMaK+ATS+bK/Zj9Ud5wxuH+TJuTzA/TVjkrhGa21SDd6uhWwKOdxLg3
 fuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LA7Hb8nPRjo7MYxOvggtNYhoehPphvQZUls236H6p9c=;
 b=oZo1nW+2geWRSlbQMVzjH4Qkq+V1HtL1GP5mxREMY9pRCXCODjk06S1WgAy+Rf1ltV
 VeMe+guaWUU9TBVqLUIHn6glcBBt0kxUQkHTSosm6eG3Jkncsp79Yshts0TODaadURf8
 ieFjECjCBNahGVxoFAGHnXbxp5fXtmLkzXqAm5+61epx1+icLhg9ErhWN2fP8NtjcyMB
 aIDCitDzHH76gDHYCNDIV3TDzSSwxJx4Waq3Q7sy1/3ExS8A6ToHiIlgiBGpCKrkl1D4
 PMwDFvBaICkP6WrjKLgktkAosHVBn9LQtW4InxPKF9m6+4BUGmYlRUKS+U5ZxQqD5mDM
 JtSA==
X-Gm-Message-State: AOAM530tVIcM+v1HvnJ6H/2xtJD+7mwWFKzbJPSdHvB126DPV/n5OM9l
 HfC/uAyJb6nVotPIhx8i0s3CVJf7Of8Vp5YKXki27B/4
X-Google-Smtp-Source: ABdhPJw8OYe773Nkq+0DjeWV379bHZDJxMSPFrpC6YuZ89wJDHFYqZIA3HVZf4IwcOhpP8Wwv4S7L55AGflHGCw5C+M=
X-Received: by 2002:adf:f587:: with SMTP id f7mr10487770wro.147.1616697169273; 
 Thu, 25 Mar 2021 11:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck>
 <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
 <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
 <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
 <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
 <20210203214612.GB19847@willie-the-truck>
 <CAF6AEGvjzkRqr8-z56tJdMs-LsoLMr1m5cVAq_++xCdHjTPKrQ@mail.gmail.com>
 <CAF6AEGveB=t0gQ0-WZn_qy=scYR60DEcum53saovg5h31ZMHog@mail.gmail.com>
 <CAF6AEGuc5i9hMtfU3HSpLVWi_e=emJTPLqntzJfAH69dO_gagA@mail.gmail.com>
 <d44fc38c038be1165aa8f4212bd9c91f@codeaurora.org>
In-Reply-To: <d44fc38c038be1165aa8f4212bd9c91f@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 25 Mar 2021 11:36:02 -0700
Message-ID: <CAF6AEGvKwtDu3zRMdoBHWCUaKXBFYL-Xw8HZ+kHdPJMhbw9bOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection
 flag
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
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 =?UTF-8?Q?=3Ciommu=40lists=2Elinux=2Dfoundation=2Eorg=3E=2C_=3Clinux=2Darm=2Dkernel=40lists=2E?=
 =?UTF-8?Q?infradead=2Eorg=3E=2C_Linux_Kernel_Mailing_List_=3Clinux=2Dkernel=40vger?=
 =?UTF-8?Q?=2Ekernel=2Eorg=3E=2C_linux=2Darm=2Dmsm_=3Clinux=2Darm=2Dmsm=40vger=2Ekernel=2Eorg=3E=2C?=
 =?UTF-8?Q?_freedreno_=3Cfreedreno=40lists=2Efreedesktop=2Eorg=3E=2C_Kristian_H_Kri?=
 =?UTF-8?Q?stensen_=3Choegsberg=40google=2Ecom=3E=2C_Sean_Paul_=3Csean=40poorly=2Erun=3E=2C?=
 =?UTF-8?Q?_David_Airlie_=3Cairlied=40linux=2Eie=3E=2C_Daniel_Vetter_=3Cdaniel=40ffwl?=
 =?UTF-8?Q?l=2Ech=3E=2C_dri=2Ddevel?= <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 2:33 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Rob,
>
> On 2021-03-16 22:46, Rob Clark wrote:
>
> <snip>...
>
> >> > >
> >> > > When the GPU has a buffer mapped with IOMMU_LLC, is the buffer also mapped
> >> > > into the CPU and with what attributes? Rob said "writecombine for
> >> > > everything" -- does that mean ioremap_wc() / MEMREMAP_WC?
> >> >
> >> > Currently userspace asks for everything WC, so pgprot_writecombine()
> >> >
> >> > The kernel doesn't enforce this, but so far provides no UAPI to do
> >> > anything useful with non-coherent cached mappings (although there is
> >> > interest to support this)
> >> >
> >>
> >> btw, I'm looking at a benchmark (gl_driver2_off) where (after some
> >> other in-flight optimizations land) we end up bottlenecked on writing
> >> to WC cmdstream buffers.  I assume in the current state, WC goes all
> >> the way to main memory rather than just to system cache?
> >>
> >
> > oh, I guess this (mentioned earlier in thread) is what I really want
> > for this benchmark:
> >
> > https://android-review.googlesource.com/c/kernel/common/+/1549097/3
> >
>
> You can also check if the system cache lines are allocated for GPU
> or not with patch in https://crrev.com/c/2766723
>
> With the above patch applied,
> cat /sys/kernel/debug/llcc_stats/llcc_scid_status
>
> The SCIDs for GPU are listed in include/linux/soc/qcom/llcc-qcom.h
>

Actually for the benchmark I was referring to, it is the *CPU*
bottlenecked on writes to writecombine mappings.. so I think what I
want is for CPU mappings to be able to use systemcache..

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
