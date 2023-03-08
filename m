Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E329D6B11A3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 20:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD7710E134;
	Wed,  8 Mar 2023 19:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3145410E134
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 19:03:22 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-17683b570b8so17023316fac.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 11:03:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678302202;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9il/DGJIQiu6Ue8jvxZUwoY7ORjCm0v/Im7Io+dDxPs=;
 b=Ml6BNVngU1mpJu1GK+jnreQd4TMmS0GRfNf/zQl3dXVZa9WLgxE1deBa+VO4baS+QB
 Sfqb2P8aQo+rYNdmy0ZxbeAsACq1OUv53TAPhpe19ALm2YNGj6Sxu1MFm1313a8memPB
 fInb03PxjkXX8YYE/6CZ+7AceUrlbm8B9JKyNjq2TAAjvpKsCmW94luCmu8M56ujEb+m
 k4gnlDBYVkkizchKBZvWxuAfWiA9m90XAeQ2dx7HHafY/JAQIuTrJwNxXJeqc7gCcO0G
 VdA3/0Frmi2nqTNCSx1L8yj67iMZoyIQPnzsdyocuH+9xRrBd1lbS4CE5a970b5OBJ6h
 9FSw==
X-Gm-Message-State: AO0yUKW6xSdkvKJgd7z4oq8tRlezlpLmB6RbFbQGEc3UBzBSXdaYFSCU
 WLT/loerxOu0ADh4KxqC2hwJxz1ooQ==
X-Google-Smtp-Source: AK7set/POqWuscJib/lrSJTB9epA2owd4C+73BtnHIuJFrEFJL2xeHZhaNT4yQoIOLqI2Iaqknu/XQ==
X-Received: by 2002:a05:6870:f292:b0:172:c578:d78b with SMTP id
 u18-20020a056870f29200b00172c578d78bmr1164117oap.23.1678302201744; 
 Wed, 08 Mar 2023 11:03:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 dx12-20020a056870768c00b0017281100b75sm6506505oab.42.2023.03.08.11.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 11:03:21 -0800 (PST)
Received: (nullmailer pid 3605141 invoked by uid 1000);
 Wed, 08 Mar 2023 19:03:20 -0000
Date: Wed, 8 Mar 2023 13:03:20 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 06/12] dt-bindings: gpu: mali-bifrost: Add support for
 MediaTek MT8186
Message-ID: <167830220018.3605078.16960763301333635462.robh@kernel.org>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228102704.708150-6-angelogioacchino.delregno@collabora.com>
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
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 28 Feb 2023 11:26:58 +0100, AngeloGioacchino Del Regno wrote:
> MT8186 has a Mali-G52 MC2 2EE GPU (two cores): add a binding with
> two power domains (one per core) for it.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

