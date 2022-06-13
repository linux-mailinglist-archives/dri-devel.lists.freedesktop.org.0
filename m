Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CD054998E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F284810F3AD;
	Mon, 13 Jun 2022 17:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E527A10F3AD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:08:48 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id g8so407304plt.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1gML3idNGzOA0oMgNls2+BU5SBWiBm9N/bZBNgDeAxA=;
 b=LjrK5Tw72pH6r07cZyjsZP9qShKbpcYyU2qz6swdXVUYhTp5jJPgQ+wYlFPPrieYSC
 6f6WL8ahuPPPsrE4y+eIlingzwjiCo8vwB/NNlx02keTXe37cuNVORidWT2KrdisE9Y4
 px0+QKCMJBZgYK4wpbYCogFMQkxrs48UN549blKB3vY5i2ro5sCPFsejvg5IB3j2ZLGf
 OlcAQ1uX8yN9ZrxaisIOif/M0RsojN4ophYNCCryAVs2M03hGpbWVAPUoCA6G2ApdSS1
 R7Rkd5KfE9E69HStd5mJfb9AgAMHyNycSymMQHRE9vv7SL3mWB5MEV7cpb9b0Lr2LhEl
 hzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1gML3idNGzOA0oMgNls2+BU5SBWiBm9N/bZBNgDeAxA=;
 b=UmHFqbbgNT48DrxL8xa7gku3fazqAqoP6qTUoRhb5Fxya9o3/xdx+BZGutcifOPEe5
 kU4acVSegBwshuWdBO2JZdIWjaDkkgrJILKFfz6Ii130Uc9jUP87D7y3hJAKNT2C4k7y
 gmx3KlDYss8b5hxSFx1sfg5cPhxkd5aN1jyYvGwW2wGajedzN1WLad2Qef6+CK6O8Tee
 akbxGszltVgc7JdVqfNBEYYz6PjI+3XMP5fD/lp4YCCemLDmiFi8+EBJ062yb1/atssx
 +Ui1Ysqfc8ZO2oNM5ek+TjZPztWBG2bnmIQ45nw+Smwgx7r+n7qwH6WNMeXQ+QxnaNKP
 S9lQ==
X-Gm-Message-State: AJIora87PYi2fU6eq6yvZquZWeoQLD40HqHIGK+560CrkV9/Fgi8r0XS
 sNbKdkiWqjZPMT/cRiI2A50=
X-Google-Smtp-Source: AGRyM1vOmlNIm8TxD3FVnTYer8FcbncZuM9zaVG4E+EBjhe5zHyefnDA/r/xDFXJRxwiMJI1Ah6i+w==
X-Received: by 2002:a17:902:7b8b:b0:168:a7d0:ddf3 with SMTP id
 w11-20020a1709027b8b00b00168a7d0ddf3mr632943pll.118.1655140128466; 
 Mon, 13 Jun 2022 10:08:48 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170902e9d300b001677841e9c2sm5394742plk.119.2022.06.13.10.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:08:48 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
 Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, javierm@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 6/6] arm64: config: Enable DRM_V3D
Date: Mon, 13 Jun 2022 10:08:46 -0700
Message-Id: <20220613170846.238226-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220603092610.1909675-7-pbrobinson@gmail.com>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
 <20220603092610.1909675-7-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  3 Jun 2022 10:26:10 +0100, Peter Robinson <pbrobinson@gmail.com> wrote:
> From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> 
> BCM2711, the SoC used on the Raspberry Pi 4 has a different GPU than its
> predecessors. Enable it.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian
