Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3E26EC4FE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 07:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8FD10E141;
	Mon, 24 Apr 2023 05:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC69310E141
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 05:44:32 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so720993866b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682315071; x=1684907071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XuBLmH9wIVGljuXNxlXx2kx1aQjm7l2qZRs0CCmzFU0=;
 b=BkQpLJxPVZbt8K/usXRUG9BTVGVJttaIn+sysrwihymnlnPXrl10vWvaoS2g3qOJbP
 xdodjtOiXIJSmZp9srXNy50zlJejBqNa5Z31PDlVLG/lN0adkvTnvgYubHe36r0oRg+j
 aGOibcmLzgp0X6UhuzCz6J93We95yUpRphvrMyGJtngCroEcJ5bUoTzVr/Jafp6g0WNE
 JyCN3/ddRrzVfkCp7jUKIQwHSLwCphme8Ziwr8swOqSdY2h45QUg9I++YcnYOd3kdeAz
 HzcPcLK2EGmwy+9M8Y1kEssp9CACtbsSzgaSICSniar8PUnT8THug3YBOo9aLTTEFF0t
 0aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315071; x=1684907071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XuBLmH9wIVGljuXNxlXx2kx1aQjm7l2qZRs0CCmzFU0=;
 b=fj9zXLZnByP42DMggroINddMtTE/61MpPUyn8E8yN73UbmODvfvjhUepl4EIpABnw2
 lEHtyDvKgheoHSTpV8RNyunSGtHzj9TPeTIN95O4Z0Zi/1IgKBVpEl5pZQ0h0YyWHLR9
 atjHNGRAV3sCe3hlHvtVY/+hozYNl1Bf+vNNJuXh6A9zidwWtGYc2Cb9kdzY4CINVmUQ
 R5AxYLuDIB5xDY7h46mCeVagy2yvHAONmJVAV56o0sa31qyVnDFmOSPLycYzvAuhpYF+
 hjs1H9l3o+1RggAWop/6teWAPgUOf79t99NbuJHXjedfoWjMBWCcrNmYjhPQ7aE6beCQ
 LUZA==
X-Gm-Message-State: AAQBX9c4QejaITKOYT1QsDQ1Hoigs/FiSKe94CZKXUg6EMiPo22cTbVF
 DP6j8DICIVkKm4DH2CF2RlHONdJSEPU+9H3V23Le4eqL
X-Google-Smtp-Source: AKy350aMRrBUUkTWn4LBYHNN1r9vxHhQQVm8fy9SBS4lGtMSXBj8TbAdYOE8x462sM1w0uChnaVM1xGGZrWMobWfUAo=
X-Received: by 2002:a17:906:2646:b0:94f:31da:8c37 with SMTP id
 i6-20020a170906264600b0094f31da8c37mr9064847ejc.52.1682315070450; Sun, 23 Apr
 2023 22:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230419043652.1773413-1-airlied@gmail.com>
 <ck2dzxvllhhh74oa3vjlacutc7rdmgl7cfrfq7vgx4w3jcufrz@7jbgxcat42yn>
In-Reply-To: <ck2dzxvllhhh74oa3vjlacutc7rdmgl7cfrfq7vgx4w3jcufrz@7jbgxcat42yn>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 24 Apr 2023 15:44:18 +1000
Message-ID: <CAPM=9tw0Y2A4DvuTHT_yd58Eit+tUmo63pbEOHwRJ66LeqznEQ@mail.gmail.com>
Subject: Re: [PATCH] modules/firmware: add a new option to denote a firmware
 group to choose one.
To: Lucas De Marchi <lucas.demarchi@intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Apr 2023 at 05:09, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> On Wed, Apr 19, 2023 at 02:36:52PM +1000, Dave Airlie wrote:
> >From: Dave Airlie <airlied@redhat.com>
> >
> >This adds a tag that will go into the module info, only one firmware from
> >the group given needs to be available for this driver to work. This allows
> >dracut to avoid adding in firmware that aren't needed.
> >
> >This just brackets a module list in the modinfo, the modules in the list
> >will get entries in reversed order so the last module in the list is the
> >preferred one.
> >
> >The corresponding dracut code it at:
> >https://github.com/dracutdevs/dracut/pull/2309
>
> it would be good to have the example usage in the commit message here so
> it can be easily checked as reference for other drivers.

Good point.

>
> I don't think we ever had any ordering in modinfo being relevant for
> other things. Considering the use case and that we could also use a
> similar thing for i915 / xe modules wrt to the major version,
> couldn't we do something like below?
>
>         MODULE_FIRMWARE_GROUP("nvidia/ga106/gsp/gsp");
>         MODULE_FIRMWARE("nvidia/ga106/gsp/gsp-5258902.bin");
>         MODULE_FIRMWARE("nvidia/ga106/gsp/gsp-5303002.bin");
>
> so the group is created by startswith() rather than by the order the
> modinfo appears in the elf section. In i915 we'd have:

The way userspace parses these is reverse order, and it doesn't see
the GROUP until after the FIRMWARE, so this can't work, as it already
will have included all the ones below, hence why I bracketed top and
bottom with a group.

>
> MODULE_FIRMWARE_GROUP("i915/tgl_guc")
>
> There is still an order the kernel would probably like: latest version.
> But then it's an order only among things with the same key.

Dave.
