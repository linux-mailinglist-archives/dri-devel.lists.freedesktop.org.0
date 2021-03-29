Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DBB34D65F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 19:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EED6E497;
	Mon, 29 Mar 2021 17:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68266E49D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 17:55:52 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id o19so15204482edc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 10:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6MnTmV7Ubg2sTi3Xa2Quc7eX0k5n11budl3ddfjJpTQ=;
 b=gJtMzc9yrdH/AglObhliCl1eLVPtYjBzEmGKhMs9v04xve8sR8xROi3HbQURzWGDBs
 x8hjM/XW/JAvIauCyjxGZxqaSPBn0pcf+T7fLRHs7eObNBz2kPQmyxHodjG+nu+2gJZy
 FIVdwhqEuY1c/omIMQ0qtK55Vk+CN/qmkvUprAWKV84JmQMF9rzoH+lH0KmtH7NZN+W6
 fxLZuGFGvtrYKg/jzLgyYqQQ+6MAMaONyDWHCjxn3cfuCalDKFQDPkJYCBBcW6SuypKs
 wssZhiDV5SEqInSyh8F8f74PMu8fBNBcKYbISCWdYueBbiapEn7mxGLyhaKBuVsq+1Nt
 6gpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6MnTmV7Ubg2sTi3Xa2Quc7eX0k5n11budl3ddfjJpTQ=;
 b=F5+txOzhsqTztcitOcDpgvCd9Dh7E+Hie8Ff2UacxXXLsi4wF+UVafVjuHyfJf5haj
 hpSp1er81VdR3U/ywgmEmxzWEYeK0DgsQt1YeHZNprlkdt0Ydwr5HlPkp0OLYWoE46gS
 sObSjMhMteRXBVZYnl0gvWP6qICD6ttNdcXMLib5YYlkDyOViD0v7IQYnrELVEjatfE/
 /xBmWr7jTazfjBf9HNMBpEx/kilXtIphBt6++AMwSb6PR4l7wcKV+vtCPmfM/OCSakXN
 KAxeSSa3cFH//yVXoDZqfmIfKu5qpGwOQlvZrPeH9PCCJ3wXmLu4ucfW3idJUc7phUKY
 xJ8A==
X-Gm-Message-State: AOAM532cxragTAL0ia2HOKkHkYD+wt8mFSht68m/oKfDhcjSkwP5hTQ/
 zgON+Tuh+r0KJTxdfPoF892bXZm4PTZcZzSqZR3Vvw==
X-Google-Smtp-Source: ABdhPJyyEm9oNlLOtY/Bv1/0xqF/9Vl1Ci9LBjhH/1QbEkuGJ2ahfATbkAxlMF/PRkZVCCe8dvKLypvNECTtIrpoWYA=
X-Received: by 2002:aa7:d588:: with SMTP id r8mr29436114edq.88.1617040551435; 
 Mon, 29 Mar 2021 10:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210326231303.3071950-1-eric@anholt.net>
 <20210329144729.GB4203@willie-the-truck>
In-Reply-To: <20210329144729.GB4203@willie-the-truck>
From: Eric Anholt <eric@anholt.net>
Date: Mon, 29 Mar 2021 10:55:40 -0700
Message-ID: <CADaigPV0yHFUnGt_ncsS=wBHCMyex_wp=PVAibxSaAMEs8GS=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 29, 2021 at 7:47 AM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Mar 26, 2021 at 04:13:02PM -0700, Eric Anholt wrote:
> > db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> > the GPU from wedging and then sometimes wedging the kernel after a
> > page fault), but it doesn't have separate pagetables support yet in
> > drm/msm so we can't go all the way to the TTBR1 path.
>
> What do you mean by "doesn't have separate pagetables support yet"? The
> compatible string doesn't feel like the right way to determine this.

In my past experience with DT, software looking at the (existing)
board-specific compatibles has been a typical mechanism used to
resolve something like this "ok, but you need to actually get down to
what board is involved here to figure out how to play along with the
rest of Linux that later attaches to other DT nodes".  Do you have a
preferred mechanism here?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
