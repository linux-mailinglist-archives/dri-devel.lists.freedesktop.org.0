Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2B96288C7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 19:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB9310E1CB;
	Mon, 14 Nov 2022 18:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9B910E1CB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 18:59:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81CB161370
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 18:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4AEC43144
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 18:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668452384;
 bh=EtkNkpCgCEj/XCm8PzfrrbKRBgIIi7EzPDqg2iPYXLA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uQAOorrRZaUwIcN81mjBiutiJ6osxhBLFKL8JiACcvP0MuR3+NHddHSPV8Xv8PDaH
 b0qeSFj5tnnFIsHQn5Ij5A83N6idgI192rkzVLbzoVsNdA/xjM4We81LD9f0tjwEw9
 JQDPr9wQxjupn+AQGvO3RMwGEVNPLHpIipu+yrQtV0xnJKhsu7D682rfk1DlK2zdYf
 AKRMw+apFdw1hdTXhYnC6b3mVKEr9R+5s7XuUtKIGt3T0c80COpu6gp99g8wNcryNv
 PHaouI6rZY2kCYkRoCPZPkID8X1sfKLZCGPY/cLxhQkWxOR+Sj843fLOr8J4VTqSap
 RuO40SLM6kcxQ==
Received: by mail-lj1-f181.google.com with SMTP id t10so14534047ljj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 10:59:44 -0800 (PST)
X-Gm-Message-State: ANoB5plvOpC1k2kzI3nSmFEKPqgd1uID6Qv7/Roq+F/qw4dnD2Sxy0aC
 m9sAFg5Cl93cDTEEcRejPJtqz45VKMCJgwgm4A==
X-Google-Smtp-Source: AA0mqf6Q5WVlUmVRQ8ZKdu8TYVsI0kILX7ikKbk0RHKy0f7vWsNdByG/gg/o9jDPj9PCOPXRNjrJ7r+/TDeEecxeUGU=
X-Received: by 2002:a2e:a80b:0:b0:275:1343:df71 with SMTP id
 l11-20020a2ea80b000000b002751343df71mr4965402ljq.215.1668452382831; Mon, 14
 Nov 2022 10:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20221112194210.7657-1-rjs@fdy2.co.uk>
 <20221112194210.7657-2-rjs@fdy2.co.uk>
In-Reply-To: <20221112194210.7657-2-rjs@fdy2.co.uk>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Nov 2022 12:59:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKgtDJJ8bbfTyMjcOvt80vpGMdo8Py3zN1ne3knM7szgg@mail.gmail.com>
Message-ID: <CAL_JsqKgtDJJ8bbfTyMjcOvt80vpGMdo8Py3zN1ne3knM7szgg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/shmem: Dual licence the files as GPL-2 and MIT
To: rjs@fdy2.co.uk
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
Cc: sfr@canb.auug.org.au, dri-devel@lists.freedesktop.org,
 marcel.ziswiler@toradex.com, daniel.vetter@ffwll.ch, liuzixian4@huawei.com,
 lucas.demarchi@intel.com, boris.brezillon@collabora.com, nroberts@igalia.com,
 noralf@tronnes.org, cai.huoqing@linux.dev, kraxel@redhat.com,
 tzimmermann@suse.de, kuba@kernel.org, airlied@redhat.com,
 emil.velikov@collabora.com, sam@ravnborg.org, dan.carpenter@oracle.com,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 12, 2022 at 1:44 PM Robert Swindells <rjs@fdy2.co.uk> wrote:
>
> Contributors to these files are:
>
> Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Liu Zixian <liuzixian4@huawei.com>
> Dave Airlie <airlied@redhat.com>
> Thomas Zimmermann <tzimmermann@suse.de>
> Lucas De Marchi <lucas.demarchi@intel.com>
> Gerd Hoffmann <kraxel@redhat.com>
> Rob Herring <robh@kernel.org>

My contributions are related to the madvise functions. That's largely
lifted or inspired from the MSM code which is GPL only. That in turn
looks inspired from i915 which is MIT (though not much more than the
comment):

$ git grep 'Our goal here is to return as much of the memory'
drivers/gpu/drm/drm_gem_shmem_helper.c: /* Our goal here is to return
as much of the memory as
drivers/gpu/drm/i915/gem/i915_gem_shmem.c:       * Our goal here is to
return as much of the memory as
drivers/gpu/drm/msm/msm_gem.c:  /* Our goal here is to return as much
of the memory as


I imagine this is not the only example in this file. In fact, looking
at the introduction of this file, it looks like it originated from V3D
code as that was the first driver to convert over. V3D is licensed
GPL2+. Of course, its code was not written in a vacuum either and came
from ???

This to me is a problem with the dual licensing in DRM drivers. Code
moves around with little attention paid at the time to licensing. I
wouldn't trust anything claiming MIT license is not GPL
'contaminated'.

OTOH, there's really only one way for the madvise code to work, so
maybe not a copyrightable work on its own.

Rob
