Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8528C1F78
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 10:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7877910E6A9;
	Fri, 10 May 2024 08:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQ8yJlkr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0937910E669;
 Fri, 10 May 2024 08:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715328534; x=1746864534;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=WLilInU9CMgqlUDg6TUAP/uNgawnkqlXH6y0EJ/kbsY=;
 b=WQ8yJlkrPFGX+ucwpywxeYPnr+VGW4XRNfhulflMuOnG9B4/q8vPuHe0
 afcyiO1T/QlHqctVIK+SdFujaTto5+1FtpiKAdf/n3/1+w0tq/U52B5pz
 VEFQuFFXGoqh1FnSixbOXklWwmRNMRGJyZvxIPYBZXr1V3risQxpSwUHK
 nOtLh3QJyH2OWYHtP2z4GSVej8zcgUluOFApTFjG2b87LPtC+JD0arhiZ
 knjaw38cG7xXj9xTJg4miSkCS9NEq97D+0qZ3NAnnXxd9IN3JAozym4dh
 BlhgAtfrU08VUw8sVg1d/37gMcAGIpS3E2FRSVaDtQVklS6Rei5QqO+G2 A==;
X-CSE-ConnectionGUID: nd+tLjztSJqcyCgyBiJejw==
X-CSE-MsgGUID: GrVe5hhFRXGvXVZ1RM0NbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11147185"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="11147185"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 01:08:47 -0700
X-CSE-ConnectionGUID: VpFEcPo4Q1uu90H6USjaQw==
X-CSE-MsgGUID: etVPO+06Q8SoAzQO5D5a6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="30092333"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 01:08:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jonathan Corbet
 <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
In-Reply-To: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
Date: Fri, 10 May 2024 11:08:38 +0300
Message-ID: <878r0ijdh5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> The drm/msm driver had adopted using Python3 script to generate register
> header files instead of shipping pre-generated header files. Document
> the minimal Python version supported by the script.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/process/changes.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/process/changes.rst b/Documentation/process/ch=
anges.rst
> index 5685d7bfe4d0..8d225a9f65a2 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -63,6 +63,7 @@ cpio                   any              cpio --version
>  GNU tar                1.28             tar --version
>  gtags (optional)       6.6.5            gtags --version
>  mkimage (optional)     2017.01          mkimage --version
> +Python (optional)      3.5.x            python3 --version

Python 3.5 reached end-of-life 3=C2=BD years ago [1]. What's the point in
using anything older than the oldest supported version of Python,
i.e. 3.8 at this time?

BR,
Jani.


[1] https://devguide.python.org/versions/



>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>=20=20
>  .. [#f1] Sphinx is needed only to build the Kernel documentation
>
> ---
> base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> change-id: 20240509-python-version-a8b6ca2125ff
>
> Best regards,

--=20
Jani Nikula, Intel
