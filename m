Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA583874D3
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 11:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB7B6EB0A;
	Tue, 18 May 2021 09:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0496EB0A;
 Tue, 18 May 2021 09:10:17 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id eb9so4571039qvb.6;
 Tue, 18 May 2021 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IP6wYnRxy963JyWLUpDbRMEX/sDWiBqDJTYFxJF/O5Y=;
 b=Fh8Q7PVhYELAqEAa64A3pKOCcw83yGm+fowdKfw17PptRWlXiEkhQmcFCyQkbCDnGH
 AdUhBb8N/cHkxU9xFSI+RdZECy78tBofxmNUvYEQJ4By5uDs0JS5yCzbxhT729Xoqd58
 iqtCp0vOnsAv1UrS44rVf8vnA/GPpQ9CgPHSj8yUsp3av7wUM59Hm2++FDA3UUQVtmUP
 TkZH6BQez9LPLeM2/pUb0RZVm76em5yGPpxzy7fflVrQuw0MFeAE6Nax+Q9UdLZx3OI4
 V5VKln43EWjsdJMnqEuOc7lvOYxnBfAlRVFzQLqOPdXn/z/62c+hit7NY4PQRWwxwxpE
 vK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IP6wYnRxy963JyWLUpDbRMEX/sDWiBqDJTYFxJF/O5Y=;
 b=PoTtpAzNgHvn2NMbC9EZZ4MV2IocO19UQ9tzsL4xqsqtUAeU8zIEHd2/uFfULepmlv
 dwym+Hg70TkfMKZWysf3OXmOX/0xVVmHHnz+pRDdaAdZcbuYdlUxbjNyO+XPSVBBzI9A
 mo6nNdyli2lLTy8lXikqswdfMn7MGFqWBQIFrSgT/KXxO53RKHjQ32u+H1a1MutGlQ+2
 6whjWtcBdEkBkf38PqDEuPkgIqoswuoYh6m0o5nC2EWWXXyqFn86CwBBqT8XXX7sm5P7
 S8DdUML2ot6Etoi3VCA8vmZjuo66MbwcpNcs02DvMyVXyFuAeEgRpinbRXOWAgpQ11DL
 sjeA==
X-Gm-Message-State: AOAM5302rzbgEu1hkG+X733Db97oLa25P5Fm4Y67FOOeUkWJMvUJEvMj
 kzW5FCEomiDEx+CUfSdqCh/76aACXtz7fkiEqwCQ8B4PwtGGHw==
X-Google-Smtp-Source: ABdhPJyCz0nwBmAUiA1twdhbImd6v0bDTCBSCJRVXW5N/2f0g5Q90VEA39XGM0lN4Il0uxDo0HyU64UJ+Ao51bpnToU=
X-Received: by 2002:a05:6214:18d:: with SMTP id
 q13mr4856751qvr.60.1621329017095; 
 Tue, 18 May 2021 02:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-6-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210518082701.997251-6-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 18 May 2021 10:09:50 +0100
Message-ID: <CAM0jSHNOLTqrp-kv0rAkXZGb02swQ+8-Q7dxMZOHwDEh=QCgpw@mail.gmail.com>
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

> +
> +static int mock_region_get_pages(struct drm_i915_gem_object *obj)
> +{
> +       unsigned int flags;
> +       struct sg_table *pages;
> +
> +       flags =3D I915_ALLOC_MIN_PAGE_SIZE;
> +       if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
> +               flags |=3D I915_ALLOC_CONTIGUOUS;
> +
> +       obj->mm.st_mm_node =3D intel_region_ttm_node_alloc(obj->mm.region=
,
> +                                                        obj->base.size,
> +                                                        flags);
> +       if (IS_ERR(obj->mm.st_mm_node))
> +               return PTR_ERR(obj->mm.st_mm_node);
> +
> +       pages =3D intel_region_ttm_node_to_st(obj->mm.region, obj->mm.st_=
mm_node);
> +       if (IS_ERR(pages))
> +               return PTR_ERR(pages);

Needs some onion?
