Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAA98299ED
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF7610E5CD;
	Wed, 10 Jan 2024 11:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA17D10E5CD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:57:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4FE9AB81C97;
 Wed, 10 Jan 2024 11:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BBBC433C7;
 Wed, 10 Jan 2024 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704887872;
 bh=xkRqDJzY2Q7rGDUHLUsK/Nq5FNNZRpdRRWdvHBixc1E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jUCbxb4XB/DTgM7vbr5mn5hfM+aBIOvS4ofINM9xiKN8GIFZbwxMqWV+zAczbOOxX
 i3zbWLVtfVl4kJVFomY8e+brEDlhBiwDuFLsnJ6J3K7ydJAJpQpPa3IJkSsUTlK6GP
 ISW7cwitlrhBg7NjuRswd2dd1jcWM8PK8msuxqOTzAVRHQkZHd4is1EYJMRJxyogOR
 5BwkB9C3LW3g5IX36BW7lDOukp9vYy0Gr24c050QKiefpdPnchmRtD1z/fiG5zQn8w
 4K75jujwSv0nGpIbKr2k8p7i1arfBzLZq0qY8Bc8do17EbFAEq57BYWFPyOTp3wmoP
 +Mnri9S9aK17A==
Received: (nullmailer pid 942197 invoked by uid 1000);
 Wed, 10 Jan 2024 11:57:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
In-Reply-To: <20240110102535.246177-2-dharma.b@microchip.com>
References: <20240110102535.246177-1-dharma.b@microchip.com>
 <20240110102535.246177-2-dharma.b@microchip.com>
Message-Id: <170488786892.942140.9840992468910708150.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Date: Wed, 10 Jan 2024 05:57:49 -0600
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
Cc: thierry.reding@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alexandre.belloni@bootlin.com, bbrezillon@kernel.org, sam@ravnborg.org,
 lee@kernel.org, nicolas.ferre@microchip.com, dri-devel@lists.freedesktop.org,
 claudiu.beznea@tuxon.dev, robh+dt@kernel.org, linux-pwm@vger.kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, u.kleine-koenig@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 10 Jan 2024 15:55:33 +0530, Dharma Balasubiramani wrote:
> Convert the existing DT binding to DT schema of the Atmel's HLCDC display
> controller.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  .../display/atmel/atmel,hlcdc-dc.yaml         | 133 ++++++++++++++++++
>  .../bindings/display/atmel/hlcdc-dc.txt       |  75 ----------
>  2 files changed, 133 insertions(+), 75 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-dc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-dc.example.dtb: /example-0/hlcdc@f0030000: failed to match any schema with compatible: ['atmel,sama5d3-hlcdc']
Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-dc.example.dtb: /example-0/hlcdc@f0030000/hlcdc-pwm: failed to match any schema with compatible: ['atmel,hlcdc-pwm']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240110102535.246177-2-dharma.b@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

