Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB275514988
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 14:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B05810E867;
	Fri, 29 Apr 2022 12:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921D110E81D;
 Fri, 29 Apr 2022 12:37:04 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id o18so5551014qtk.7;
 Fri, 29 Apr 2022 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zti6YLLkUsZkekq1rWuAp83UXdMyT1qHJ6+UnS1DJPg=;
 b=lQ5OKC2xytA1QhtjTZavhchSjmIzO2pqa1CF4lvvCmRh1qXWvBhvtSjHGzqkMCXaH7
 bKUmwiSJTx1GQKxV6RSosw2eysbFEGd2ck5dMpla8vo/faRPvWjvZ/sG1pRhBIir3OEL
 wiACct1c13yo5j3nfSFHwNYLwkkQ4wYZGZ0zsyUtm0zwhAdv9ubl11P0c3fSRlwDLaip
 Pbyxjs3J4U6cm1MlfIlC1s2T/IDmK71ZtSNxHkVNtXF0Tl8ztsqRwVywxzInR7afZkEC
 u10IOtwvHyxIXQ8gqtUcMHlpvH6nvbCLXJ+rUKyDKjVeZ9urZPtsKL5J4oNQBkr1i8T+
 FyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zti6YLLkUsZkekq1rWuAp83UXdMyT1qHJ6+UnS1DJPg=;
 b=DK6uw51Ucq7CXW7Q4aeHMaG3knB5lrzggCF2R2i0JVaMH7D8nCKAFlSP8PLBStal1u
 CrYf8NOgHqaSFqKaiw0HRNo92YSzeDfCae9ex1KnPCbCG25zd+zcigM+cIx16LXEuG06
 Ojxn4abagbp2UddK40PgVpE2HfgOnVlkA0GhfZbt75Hd04WqYqvdwEc9kOSkxuJIOYSx
 zIIDLqKmOpI/uAA3niHm1F7rH5iiTqevFtqg0Rp9WwzlnOhSQcv5AGDPbknjdYcQSKdV
 QFbaTPd+fYoLiAJTf864VpkzEEMWUEdUYp3D2yQPDInCd2Ib3eFVOEhZfU3S4kpdxAhj
 6veQ==
X-Gm-Message-State: AOAM533al5TBSsVwye/oXn0YXopz/hy0i6PsdqVuEDzO4kYEtlV0umV7
 9FUIHp2leArEWhjkBoFpHjbl2Wiz88SWQwfYiMC8xKB6yaU=
X-Google-Smtp-Source: ABdhPJwd8ju3TQ8iNiOOGqLH6RHFXqU6m45Ht6CdW+ypD6ZeMjtYMqLPMplfx3OgiFHokIB4z6LJsdXkEVviI4VuPBs=
X-Received: by 2002:ac8:7dc2:0:b0:2f3:729b:75e3 with SMTP id
 c2-20020ac87dc2000000b002f3729b75e3mr15294828qte.197.1651235823742; Fri, 29
 Apr 2022 05:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220425152317.4275-1-ramalingam.c@intel.com>
 <20220425152317.4275-3-ramalingam.c@intel.com>
In-Reply-To: <20220425152317.4275-3-ramalingam.c@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 29 Apr 2022 13:36:37 +0100
Message-ID: <CAM0jSHOETX4dVC9uDy=pxPxKnQrbXB97V0jLh0td98i8yWpaPw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/i915/selftests: Skip poisoning
 SET_PREDICATE_RESULT on dg2
To: Ramalingam C <ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>, CQ Tang <cq.tang@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Apr 2022 at 16:22, Ramalingam C <ramalingam.c@intel.com> wrote:
>
> From: Chris Wilson <chris.p.wilson@intel.com>
>
> When predication is enabled all commands baring a few (such as MI_BB_END)
> are nop'ed. If we accidentally enable predication while poisoning the
> context, not only is the rest of the poisoning skipped (thus disabling
> the test), but the closing instructions of the poison request are
> nop'ed. Not only do we then not signal the waiting context, but we even
> prevent re-enabling arbitration and the GPU will not perform a context
> switch at the end of the request.
>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Suggested-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
