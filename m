Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1025F3FB73D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 15:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFC189DC7;
	Mon, 30 Aug 2021 13:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7217C89CB5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 13:49:22 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id e186so19927624iof.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 06:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hDLkNcl3kpNuKXzYl4GK/0vNmHcEDi/wO1WbFyuTnp4=;
 b=ABRzwlJRaHBViMvocIXvTc9GX0mM/8Blk9K8IkGyMSJ7wfHHuZcq0usKO7JFVnD5kI
 7KTHLhfvQjqfN/Sja0E2ffvrrEnGkN1y/I051XbZpKEuU0ADHGVFRfkALdZSHHF7xWhx
 HPsV0m5j7FIfkhfRiS0E0M8bksq5gvq0ZR56jcak0IYLXIMzYp/xawZs2/5EICmReVzK
 DkGwDytjOBrtBSqorTcwYhpMnfcJhOM1tzQHELYpprrfmszpjTrqp8p8pdKaCT1WRvSn
 ZTOqtUeDOeZgF1DaHN4EkUNbMBIyl8r7wyX+cKfGez6YiBQtsdXIdCxYbbycmYraQhLB
 lnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hDLkNcl3kpNuKXzYl4GK/0vNmHcEDi/wO1WbFyuTnp4=;
 b=RE9l3LG/QqDE193i4mi9ATCAYJvumqx/63stHN3rHxGiMe6x958LpLvjBpDIW8hQ1i
 ZkZy++exTkkxOeE5vxHwtFZmPLSb8Mii6iT5EIDL/RtSwa4WDI94n5GtVIbL38AGXCVt
 /nm9xMNs+CV4B1YCieyxROsdKHm/ZwlZG/+Ifc/RMZJd2z9ZIWom/lttDEh6cO9FdV2r
 yr4UcHKa2RNEZBMriPtMlk1oBkRQ642lCuCLkUWsIN+Twbvfrd8D/xXtR/WJKDK6yse5
 jUyUarrxICkLPtEdJi6CBLGtk7tYcKK2znJmhmJztoibuRGjUv6IlDmNlvSDzIUtUr38
 9zzw==
X-Gm-Message-State: AOAM530enWlHngsy4U81YcaPXMIBu09Fpm/sFI516mOQI1uLWJU0+8PJ
 9+uZdkuUYSan7TmY3IFFveK96aLspq6Lh5fccXPP5w==
X-Google-Smtp-Source: ABdhPJyltWMMh9vlGuvi7AgbAmDyM9zljm0vPuHVCKduK0eHjx8KygFpP4UFC5f2vVaW2pXmcT+zySzcGXKg41WnbYM=
X-Received: by 2002:a5d:824e:: with SMTP id n14mr18223161ioo.134.1630331361799; 
 Mon, 30 Aug 2021 06:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210817204329.5457-1-anisse@astier.eu>
In-Reply-To: <20210817204329.5457-1-anisse@astier.eu>
From: Anisse Astier <anisse@astier.eu>
Date: Mon, 30 Aug 2021 15:49:10 +0200
Message-ID: <CALUN=qLzwmP1sz1wr=yrFHUGEHm=n+uEre_ApfP6MgtYCZbRWQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] GPD Win Max display fixes
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>, Uma Shankar <uma.shankar@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Daniel Dadap <ddadap@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Aug 17, 2021 at 10:43 PM Anisse Astier <anisse@astier.eu> wrote:
>
> This patch series is for making the GPD Win Max display usable with
> Linux.
>
> The GPD Win Max is a small laptop, and its eDP panel does not send an
> EDID over DPCD; the EDID is instead available in the intel opregion, in
> mailbox #5 [1]
>
> The first patch is based on Jani's patch series [2] adding support for
> the opregion, with changes. I've changed authorship, but I'd be glad to
> revert it
>
> The second patch is just to fix the orientation of the panel.
>
> Changes since v1:
>  - rebased on drm-tip
>  - squashed patch 1 & 2
>  - picked up Reviewed-by from Hans de Goede (thanks for the review)
>
> Changes since v2:
>  - rebased on drm-tip
>  - updated commit message
>
> When v2 was initially sent [3] Ville Syrj=C3=A4l=C3=A4 suggested that it =
might be
> a good idea to use the ACPI _DDC method instead to get the EDID, to
> cover a wider range of hardware. Unfortunately, it doesn't seem
> available on GPD Win Max, so I think this work should be done
> independently, and this patch series considered separately.
>
> [1]: https://gitlab.freedesktop.org/drm/intel/-/issues/3454
> [2]: https://patchwork.kernel.org/project/intel-gfx/patch/20200828061941.=
17051-1-jani.nikula@intel.com/
> [3]: https://patchwork.kernel.org/project/intel-gfx/patch/20210531204642.=
4907-2-anisse@astier.eu/
>
>
> Anisse Astier (2):
>   drm/i915/opregion: add support for mailbox #5 EDID
>   drm: Add orientation quirk for GPD Win Max
>
>  .../gpu/drm/drm_panel_orientation_quirks.c    |  6 ++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  3 +
>  drivers/gpu/drm/i915/display/intel_opregion.c | 69 ++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_opregion.h |  8 +++
>  4 files changed, 85 insertions(+), 1 deletion(-)

Would it be possible to have this series reviewed ?

Kind regards,

Anisse
