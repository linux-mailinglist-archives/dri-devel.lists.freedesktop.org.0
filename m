Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4604785171B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 15:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD0710E35E;
	Mon, 12 Feb 2024 14:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QSWM1AHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA60810E35E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 14:35:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C8F68CE12CC;
 Mon, 12 Feb 2024 14:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40729C43394;
 Mon, 12 Feb 2024 14:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707748550;
 bh=QYf+5/QTHe/pR5frJUhbCNA1+D/FWdDxUAFsDka0kaI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=QSWM1AHSP/9zAdL55MyTxzban42kr7Xhzbkh2+x1k9Ln+dAhovPnd9YJMx17NZ9fh
 8Yye1aQu9uG458Z4cet443NCQl6Jb0GHVfXEJEyyzYi3vEcFs9aPESpURnOuU9jmGn
 H9fokutBg2itYfACFL2vXLRBBR6v3g1w3pg2+OCU3zSF/IUThK1WzdaZBVHPxsG39V
 UW8lu7GPmHWVPalnxxY6Rpi64YT2yGShdBdMDxnHuQhTAyIEv+WCsUACULJlkIGpux
 SP9AguvNNQwLuPszJF+mlgjRPBOLJQdd+d/xyVK6ZUn2002RGhqjk2+ie3dYpa2key
 I/Epe7TIhZICw==
Date: Mon, 12 Feb 2024 08:35:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 conor+dt@kernel.org, airlied@gmail.com, mripard@kernel.org, 
 dinguyen@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 robh+dt@kernel.org, hverkuil-cisco@xs4all.nl, devicetree@vger.kernel.org, 
 ribalda@chromium.org, daniel@ffwll.ch, chromeos-krk-upstreaming@google.com, 
 mchehab@kernel.org, akpm@linux-foundation.org, 
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20240212131323.2162161-9-panikiel@google.com>
References: <20240212131323.2162161-1-panikiel@google.com>
 <20240212131323.2162161-9-panikiel@google.com>
Message-Id: <170774854550.294485.3708612918527188826.robh@kernel.org>
Subject: Re: [PATCH 8/9] media: dt-bindings: Add Intel Displayport RX IP
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


On Mon, 12 Feb 2024 13:13:22 +0000, Paweł Anikiel wrote:
> The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
> Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> capture and Multi-Stream Transport. The user guide can be found here:
> 
> https://www.intel.com/programmable/technical-pdfs/683273.pdf
> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> ---
>  .../devicetree/bindings/media/intel,dprx.yaml | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/intel,dprx.example.dts:28.27-28 syntax error
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/media/intel,dprx.example.dtb] Error 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240212131323.2162161-9-panikiel@google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

