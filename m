Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 790851ED71A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 21:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F8989CAA;
	Wed,  3 Jun 2020 19:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7658A89C88;
 Wed,  3 Jun 2020 19:50:58 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id d13so1684779ybk.8;
 Wed, 03 Jun 2020 12:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZEyEyEdu5zWmO0R2WmxHhzAVp9IwHZ3PJjcwh7vs5m4=;
 b=CQWsJPQhDizeaRlLOsbnTSO4MdBrCBkDDTAoOJcB9MweMq17vKWSNrySyXQTM8h/R3
 nXA07a4DxKs9SVyNvHK3NQDJWzGqMwuJZyJPhlvefrJHelYTAbzemc/EXLTt+s05uTFJ
 PjgMSfDK3F7CLZjJVo9HZ3mrczwJyMgIsUW3z0Yy1Gzn5ixo69cwN7Ouv8wQyb02QdMz
 u5Izgr0nbBtsspQrXp8WqABdVMOpWbHIJfsgXhJZz1Y0l2ea0mHst7U0tsXjjl7/8nxu
 K2QM1rzO1MWBnjpSFXzChhw5xXoU84I5nT7vP1l5VUwiMFFB/tYb2Rj7/QCs2lnQxlUh
 oong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZEyEyEdu5zWmO0R2WmxHhzAVp9IwHZ3PJjcwh7vs5m4=;
 b=ojECjPt4o2yeIgn/n1YJNyapS6Ohof6UV8cgwJ4/VwbkL3l06Ti/W6Cwjt5L8JgVlg
 VXi+MgyQKcdwYXGKtE1vWWQMCcgvO6ixqcX5F2jh77X8aY9r3m8emk/RwVlrYj2U07vf
 eERBXUS1TChIbwCCXcfIR3/50hLHFLEowULt63EkkaBeyNJ2y1vsvcRzNGKU8SYEG3I3
 D8er2nP74rty7tBJR3C2CeAHluHkOMbvyYN5Az4h62wiGEbHC/HnysLQOEhIPK38tfwJ
 nG+WYHKRMZelxnh/hHvxGs8tp7inJSRMvKhva4ILsMhdJrMU3DKu0QfS8iK2pHT+BuLa
 Dbbw==
X-Gm-Message-State: AOAM530VXktqp9y3TjrePkLkgT5Y6sv6y7CN9RT3pzB+DuOuQYqTEo0U
 vbfUAKGCErQ+8EwZbH0DLiikPTl17VVd7rM+NvI=
X-Google-Smtp-Source: ABdhPJyGWrUhtxot8xwbLc0lAWIcEnJ3LXlTiHs5LNVjXXBQCio5c0BeQbfmM+WJ6+YhUDwAIAybpL++00AoiNi2Tfw=
X-Received: by 2002:a25:dd87:: with SMTP id u129mr2890055ybg.83.1591213857587; 
 Wed, 03 Jun 2020 12:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200603142002.3776672-1-thierry.reding@gmail.com>
 <CACvgo529m+fub=ZddGkjRXEY-7i3rRUs0EssYGf+DJgkcDm3Zg@mail.gmail.com>
In-Reply-To: <CACvgo529m+fub=ZddGkjRXEY-7i3rRUs0EssYGf+DJgkcDm3Zg@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 4 Jun 2020 05:50:46 +1000
Message-ID: <CACAvsv7ecMSxhCTC6tJU63-aMJpoQn5-hkUpOjNFhJX1GAFQYQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: gr/gk20a: Use firmware version 0
To: Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, ML nouveau <nouveau@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Jun 2020 at 01:43, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> On Wed, 3 Jun 2020 at 15:20, Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Tegra firmware doesn't actually use any version numbers and passing -1
> > causes the existing firmware binaries not to be found. Use version 0 to
> > find the correct files.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>
> Fixes: ef16dc278ec2 ("drm/nouveau/gr/gf100-: select implementation
> based on available FW")
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Oops, my bad.  Merged.

Ben.

>
> -Emil
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
