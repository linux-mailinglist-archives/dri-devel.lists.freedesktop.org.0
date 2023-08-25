Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3710278892E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 15:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D54210E699;
	Fri, 25 Aug 2023 13:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BC710E699
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692971784; x=1724507784;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rL8lwlEpWwyz5gytyannueKCuDWZ7o3Z7O2OXGq9D24=;
 b=TKi04auY25vpwsdM0zgCWgx7IXtVBwgk/FCMLCXONLzDneyYX0ZZqbTc
 9LCOMW1vGGYPG/6gr7+fMOfPm9DN1xBnmMsRUEUnavHW+VHGyGVCIjL2z
 qx5Ry76/3QyigoVWE6zNWu5CV1uOmvYHaF/v28NFg49wlf93LI8sKPw86
 S88yt6JWkhk4nGjYkiK5qkSQp/Ro2Wkwvs9yDAjk936WOcy6HtXLIY33C
 sjMRqprJEaxuUBFwaEfpGLQlsNSV+IPcteaGWQ5BDGsTy1EIcpDYl9Ng8
 547OWW0Aan/+cWQyaSnRQ/W8vj578GPqZM2V13o+sc9nlSps1I+QvQWU1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373586064"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="373586064"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 06:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="731073145"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="731073145"
Received: from ogbrugge-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.56])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 06:56:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/6] drm: ci: Force db410c to host mode
In-Reply-To: <20230825122435.316272-3-vignesh.raman@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
 <20230825122435.316272-3-vignesh.raman@collabora.com>
Date: Fri, 25 Aug 2023 16:56:12 +0300
Message-ID: <87pm3b2pkz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, jbrunet@baylibre.com,
 robdclark@google.com, corbet@lwn.net, khilman@baylibre.com,
 sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
 linux-rockchip@lists.infradead.org, daniels@collabora.com,
 martin.blumenstingl@googlemail.com, robclark@freedesktop.org,
 helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Force db410c to host mode to fix network issue which results in failure
> to mount root fs via NFS.
> See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
>
> Since this fix is not sent upstream, add it to build.sh script
> before building the kernel and dts. Better approach would be
> to use devicetree overlays.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/build.sh | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 7b014287a041..c39834bd6bd7 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -70,6 +70,10 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
>      fi
>  fi
>  
> +# Force db410c to host mode to fix network issue which results in failure to mount root fs via NFS.
> +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
> +sed -i '/&usb {/,/status = "okay";/s/status = "okay";/&\n\tdr_mode = "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> +

It seems like a really bad idea to me to have the CI build modify the
source tree before building.

The kernel being built will have a dirty git repo, and the localversion
will have -dirty in it.

I think it would be better to do out-of-tree builds and assume the
source is read-only.

>  for opt in $ENABLE_KCONFIGS; do
>    echo CONFIG_$opt=y >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
>  done

Ditto for the config changes in the context here. Those are files in
git, don't change them.

Shouldn't this use something like 'scripts/config --enable' or
'scripts/config --disable' on the .config file to be used for building
instead?


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
