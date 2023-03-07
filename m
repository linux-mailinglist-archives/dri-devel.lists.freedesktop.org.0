Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D066ADBD6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1F510E3E3;
	Tue,  7 Mar 2023 10:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C3910E3E3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 10:27:10 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id x40so8497289uaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 02:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678184830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0lIP6QMCX3nExnse1kF0X/k89ASNhvKrsoqP0TvYGno=;
 b=YA/vWYLL+KxXY1sPwdyBi7xdV37GzpA+yMEtwec/IcVfnN/Y7OW+zTmdCExJKPTKep
 sUHs6wFhVeM9+EKCrehvRB00bEadA1Lrrw1+brNUyvsK8bbk1z5r7CfTtHvTCt9fE1J2
 p7N36WMUM8nENpwHPcSzU+hfddZn7hAto9rDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0lIP6QMCX3nExnse1kF0X/k89ASNhvKrsoqP0TvYGno=;
 b=QxIulfUJ2xbXDzqxtCduF2STFdBp9ww8lh9Nlyb716bwoEWpR0QIwo3vKDwkDbBxJ4
 mw3WTqpvMrY8ABMIBuw0XPy2iWDd/l7RApTcyZiHoP1d5MAzfMDlMyPBBMb7F7TzMFWW
 URXbTTy9aUCPAEdueilnEdwgv41RWRaKbMg44qAZSug0mUvDV4CXuAQb/OT0tNIvVrVp
 fBo6veUD1RME/O9jvZI8AXCc/ccvvWAVf4gQCVVwA06CLK+Cr3C8+z34ZZUOJv+c2Bhx
 W8XU3g2SHTWUOBfn8Cr2l0aRmum+tfvKFt+dy9tUtCGhbbf4IGcEY+3xn+mZ7PAUWMQZ
 GIlQ==
X-Gm-Message-State: AO0yUKUbM/brboS5IA0QePSMJlPS8PX3OYCVWnifkZgYmLGmXl0zvx37
 zLLWNEcTd76XDmmy+lb3BivvG0kwh2837IWe+8xrzw==
X-Google-Smtp-Source: AK7set819ohzAaSDe0nZOxCmCgvs/Q8sYI8nIk6xQMEmrLHEWghxcsfgqRisZu1xB8xnfMWgTnPegQm6O/nqzaXnSRw=
X-Received: by 2002:ab0:4714:0:b0:68b:90f4:1d8c with SMTP id
 h20-20020ab04714000000b0068b90f41d8cmr3434006uac.1.1678184830022; Tue, 07 Mar
 2023 02:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 18:26:59 +0800
Message-ID: <CAGXv+5E6EzucKFUOp1i0CgKh4tmaVMC-MV3FgjtgqmbhbB3_zg@mail.gmail.com>
Subject: Re: [PATCH v4 04/12] dt-bindings: gpu: mali-bifrost: Add sub-schema
 for MT8192's power domains
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MediaTek MT8192 (and similar) needs five power domains for the
> Mali GPU and no sram-supply: change the binding to allow so by
> also introducing power-domain-names in the generic binding;
> while at it, also disallow the newly introduced power-domain-names
> for all non-MediaTek bindings.
>
> Fixes: 5d82e74a97c2 ("dt-bindings: Add compatible for Mali Valhall (JM)")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`
