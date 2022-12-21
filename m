Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E2A653936
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 23:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAE189FA7;
	Wed, 21 Dec 2022 22:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C9589FA7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 22:59:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5307C61988
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 22:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359D1C43392
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 22:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671663521;
 bh=xPJyAttQv186mOKKFQAv7hbL1F6VtzkjKD1tNd/7IjE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=c9LX/mATG1E4rUdpQf5lc00FMzlYrmQlGYnyGcdjKs8G80wg6uxgSaLmXYovKzMIn
 6c53uqNXWNr+CER1vROnf2V/dFSrm6+jEzDJPWZ/sYJOY5c4BSVM/Xm8ak9yttAuIm
 VU+y+jSFnHf5VESA94PMTn2SMb4p05Nwd8pkyKxle3UxxilLqoOsp9Uw8iysNP6ynQ
 tQSqudhn21Kv4B72fL2qO1UGwGg4TJ+XL9rFX/abIxNqNCojhxGzTJRfGk0x/Tb7kD
 0ktJgIRBGwsadLRtBb22sj6OlUFNovAX72Glq4jmLa99tYizdmadq0h2GLWBeI46Zp
 DqJlNbJMWY/Rg==
Received: by mail-vk1-f173.google.com with SMTP id 6so236143vkz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 14:58:41 -0800 (PST)
X-Gm-Message-State: AFqh2kqsyKpezvFVkgybhLBJKMSuFkMuwXfqJdBDOhqpjsn0+0Vc+4Rw
 WhCXiVW2s8OO26EjTbcBe0buqwGrAK07C51yGw==
X-Google-Smtp-Source: AMrXdXvkVofoFLUCiiX0oMRt1lMmY+lF5kSdN/xdjD5N4p1/NYeUecqLznUCGN0lyIXoU5dqbSZVNpdmC1dh3bDlsnc=
X-Received: by 2002:a1f:1e50:0:b0:3c1:1c3b:c4d9 with SMTP id
 e77-20020a1f1e50000000b003c11c3bc4d9mr402043vke.19.1671663520158; Wed, 21 Dec
 2022 14:58:40 -0800 (PST)
MIME-Version: 1.0
References: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
 <899d3a39-19bf-519d-a863-bd7ca1e7c033@gmail.com>
In-Reply-To: <899d3a39-19bf-519d-a863-bd7ca1e7c033@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 21 Dec 2022 16:58:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK5EFwqNU4YB3yYPn8x=FAv1jR6vMKhFrS-cqyuO2cRyw@mail.gmail.com>
Message-ID: <CAL_JsqK5EFwqNU4YB3yYPn8x=FAv1jR6vMKhFrS-cqyuO2cRyw@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: display: bridge: snps, dw-mipi-dsi:
 fix clock properties
To: Johan Jonker <jbx6244@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, hjc@rock-chips.com, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 andrzej.hajda@intel.com, Laurent.pinchart@ideasonboard.com,
 devicetree@vger.kernel.org, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 21, 2022 at 12:22 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Fix clock properties from the common snps,dw-mipi-dsi.yaml file,
> as they don't match with what is used on the SoCs.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../display/bridge/snps,dw-mipi-dsi.yaml         | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
