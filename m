Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB10A38749B
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 11:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3736EB09;
	Tue, 18 May 2021 09:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB476EADB;
 Tue, 18 May 2021 09:05:40 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id t7so6910145qtn.3;
 Tue, 18 May 2021 02:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7aHWUMoi5w4ydiq3vMYs7kt/JSZnceejjinUOINTWww=;
 b=M3+eNjFnUi2QeG9bF/g7Rhn8oF9MfFCUsMrU4xzsaF+FxlEBgSH5p4YjnbD14AH+By
 qjQf5b+Up82hzcqy3K+nw9MJx/CEv0C0e8iqqw8xRMc4dUl696r/AX7N79lFF26IYXpi
 6L2hHsOKqoyMwgmpGDsg6e6kfN1oh36adOcmpFbI65wTVbj5zlTgjt5zEt1hesMkCa3D
 LEVO2emctQ6ddRDzURnzj3MYqRvLahszub+yUlv1C7mhlumCBvl780q1Lc3hbDTsJ76I
 rTlyCc/2X0uU2cs6gnSYYCFpRCjXtB+Ut7PbV9js7PzWt0b9oDdqdNQG1m0N84jGjlnP
 yZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7aHWUMoi5w4ydiq3vMYs7kt/JSZnceejjinUOINTWww=;
 b=cwshKm0mWmw86rLPc5Ke/w60EUjU7o+ZrVARmQW2SzF71fH6FrzGTEykVsk6NAenJo
 LCKgaT2bxvccGJXe8RWGod7Vl6o7ArPLMYsBk08lqUcmFNTEl5JHIHbt8owCsvGqlr51
 uGQmSTx+L1Hs1HeqxXtQko85fbyTd11Vatl/VZxxR4ePtPgQ48GKtTOOJcG2gplheHjC
 kC+0Jf6S8YlxXpH1hPmFMD6qskYC4MAnLH7tPFRidhXo/Yl2fZwqVGjo1fj68t+cNJiC
 cutVn5NpyEUbNgdmxorjQGDqHnESe0KN4vybtae2ImJ1y1yXTDppt0pFEjzEEsTEaqFd
 zVkQ==
X-Gm-Message-State: AOAM5310PTHd4UYGvPj4ufVyFxfttfOgA0ObcsnexrUt2Cxla2i0ihqC
 H8KXLRX3uw4OX3IRd+AFR0XZFnt6lMiIaiQLfRqKynMMlRdG4A==
X-Google-Smtp-Source: ABdhPJxjC8CSjd5WozYXg/TB/2ui0ZVo+mHzyMA3LVWWN76RzNOWUUmroJbUAa5VFkqE0IIKwmGX4anhNQRgs+l/G7w=
X-Received: by 2002:a05:622a:89:: with SMTP id
 o9mr3603329qtw.339.1621328739889; 
 Tue, 18 May 2021 02:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-6-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210518082701.997251-6-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 18 May 2021 10:05:13 +0100
Message-ID: <CAM0jSHPL0d5FqTCndQczf07QkMXnGUd7Y3JhU7GBiL+d2kWQCg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 05/15] drm/i915/ttm Initialize the ttm
 device and memory managers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 at 09:27, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Temporarily remove the buddy allocator and related selftests
> and hook up the TTM range manager for i915 regions.
>
> Also modify the mock region selftests somewhat to account for a
> fragmenting manager.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> v2:
> - Fix an error unwind in lmem_get_pages() (Reported by Matthew Auld)
> - Break out and modify usage of i915_sg_dma_sizes() (Reported by Mattew A=
uld)
> - Break out TTM changes to a separate patch (Reported by Christian K=C3=
=B6nig)
> ---

<snip>

>
> +/**
> + * i915_sg_from_mm_node - Create an sg_table from a struct drm_mm_node
> + * @node: The drm_mm_node.
> + * @region_start: An offset to add to the dma addresses of the sg list.
> + *
> + * Create a struct sg_table, initializing it from a struct drm_mm_node,
> + * taking a maximum segment length into account, splitting into segments
> + * if necessary.
> + *
> + * Return: A pointer to a kmalloced struct sg_table on success, negative
> + * error code cast to an error pointer on failure.
> + */
> +struct sg_table *i915_sg_from_mm_node(const struct drm_mm_node *node,
> +                                     u64 region_start)
> +{
> +       const u64 max_segment =3D SZ_1G; /* Do we have a limit on this? *=
/

For lmem just INT_MAX I think, which is the limit of the sg, but
really doesn't matter for now, this should be totally fine for now.

Assuming CI is happy,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Also we could maybe fling this series with the HAX autoprobing patch
for DG1 at trybot, just to see where we are?
