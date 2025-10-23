Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D560C00442
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8CC10E3AD;
	Thu, 23 Oct 2025 09:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cwq2+jfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B36D10E3B1;
 Thu, 23 Oct 2025 09:34:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A1D416060C;
 Thu, 23 Oct 2025 09:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1858DC4CEE7;
 Thu, 23 Oct 2025 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761212093;
 bh=mR+72nkRkoEc8417A483lf3aWFt2rv61itovGOouSkc=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=cwq2+jfM+P75EiiRBPiwHlS5M3ARNoJAG/N8ngNp1bP5L1+yEm+CEl6QFxtqVjsBt
 QkNtNd8k2W7ZiQhn0AXObfuZ/ZDFgWkwRS+9lFMbVdex6IYH+NIrX6BJy3HjQwQuft
 4NuuY1XHMFO5eD/l7OaDzkYZYZsNYDFJrbG2EgbQ8P92w8Zj3SOzdD5ickfSZEvbe6
 NDlW5xt84pFiuc3v/i1/EfcBIbMGTjE8mHZoxOtF6SXR0V7MN0ccayfBu9gA1aKOKv
 CiAqMdPoo6zjcDc6JlqgNsfDJcP+KGCylfOs4TbVqPkkXOQ84lCcRVJFsoI5GRc4S2
 f99S155wS32YQ==
Date: Thu, 23 Oct 2025 04:34:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, mripard@kernel.org, 
 linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
 marijn.suijten@somainline.org, abhinav.kumar@linux.dev, simona@ffwll.ch, 
 devicetree@vger.kernel.org, tingwei.zhang@oss.qualcomm.com, 
 krzk+dt@kernel.org, freedreno@lists.freedesktop.org, 
 neil.armstrong@linaro.org, quic_mkrishn@quicinc.com, 
 linux-arm-msm@vger.kernel.org, lumag@kernel.org, airlied@gmail.com, 
 sean@poorly.run, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 jonathan@marek.ca, robin.clark@oss.qualcomm.com, quic_khsieh@quicinc.com, 
 conor+dt@kernel.org, yongxing.mou@oss.qualcomm.com
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
In-Reply-To: <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
Message-Id: <176121209123.1694835.2815069098750745260.robh@kernel.org>
Subject: Re: [PATCH 12/12] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali
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


On Thu, 23 Oct 2025 16:17:36 +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,kaanapali-mdss.yaml      | 298 ++++++++++++++++++
>  1 file changed, 298 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dts:26:18: fatal error: dt-bindings/interconnect/qcom,kaanapali-rpmh.h: No such file or directory
   26 |         #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1528: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

