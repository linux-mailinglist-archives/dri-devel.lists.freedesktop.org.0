Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB2B804CDB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7890210E4A3;
	Tue,  5 Dec 2023 08:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ABE10E4A3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:46:13 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A5E506601659;
 Tue,  5 Dec 2023 08:46:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701765972;
 bh=eZolyK2cCm1YVgDtmZlY7KvHDWlgVleol311UR5eAQc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MdhIXaJwC33lb65UuVidZagz8dmwTojAz/v6lNjpiIsPJOBmBaPJYRkPyYUsxVttN
 /83JAmGdhTJj1RG/NHjZMLnwFxMkIZ1ihi9UKoTDpTljecDYvPhAMGILCwiXw97QUZ
 91z4A38UYws2/tWrcwg+D+1nYBZADMONv0mdWgWW3Tz9Zba0GP10/pW+quRYtO5RBp
 sTtVCvxDL01EoWmRo2nsQADzxMuWw0K5myY7zb5gPB9FqTuhYE/EsKtKA5F4kAVP9L
 BhG9t6pjx6BsTM0GOPKkpcx/B0/y+Te1S6EO+iqOkQ2YwBqD7rpZs/NwkAKD0UcMT/
 3jjEAT1xiLx5Q==
Date: Tue, 5 Dec 2023 09:46:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 13/14] dt-bindings: gpu: mali-valhall-csf: Add
 support for Arm Mali CSF GPUs
Message-ID: <20231205094608.65cca2da@collabora.com>
In-Reply-To: <170171811207.4196.6974304837599035136.robh@kernel.org>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-14-boris.brezillon@collabora.com>
 <170171811207.4196.6974304837599035136.robh@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 kernel@collabora.com, Daniel Stone <daniels@collabora.com>,
 devicetree@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQg?= =?UTF-8?B?UMOpcm9u?= <peron.clem@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 04 Dec 2023 13:29:17 -0600
Rob Herring <robh@kernel.org> wrote:

> On Mon, 04 Dec 2023 18:33:06 +0100, Boris Brezillon wrote:
> > From: Liviu Dudau <liviu.dudau@arm.com>
> > 
> > Arm has introduced a new v10 GPU architecture that replaces the Job Manager
> > interface with a new Command Stream Frontend. It adds firmware driven
> > command stream queues that can be used by kernel and user space to submit
> > jobs to the GPU.
> > 
> > Add the initial schema for the device tree that is based on support for
> > RK3588 SoC. The minimum number of clocks is one for the IP, but on Rockchip
> > platforms they will tend to expose the semi-independent clocks for better
> > power management.
> > 
> > v3:
> > - Cleanup commit message to remove redundant text
> > - Added opp-table property and re-ordered entries
> > - Clarified power-domains and power-domain-names requirements for RK3588.
> > - Cleaned up example
> > 
> > Note: power-domains and power-domain-names requirements for other platforms
> > are still work in progress, hence the bindings are left incomplete here.
> > 
> > v2:
> > - New commit
> > 
> > Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > ---
> >  .../bindings/gpu/arm,mali-valhall-csf.yaml    | 147 ++++++++++++++++++
> >  1 file changed, 147 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> >   
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml:108:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
> 
> dtschema/dtc warnings/errors:
> make[2]: *** Deleting file 'Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.example.dts'
> Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml:108:1: found a tab character that violates indentation
> make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.example.dts] Error 1
> make[2]: *** Waiting for unfinished jobs....
> ./Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml:108:1: found a tab character that violates indentation
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml: ignoring, error parsing file
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
> make: *** [Makefile:234: __sub-make] Error 2

Uh, sorry. I messed up when applying Liviu's changes. Will fix that in v4.

> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231204173313.2098733-14-boris.brezillon@collabora.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

