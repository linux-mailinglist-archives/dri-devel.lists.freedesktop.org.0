Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE864659FC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 00:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE8E6E8FA;
	Wed,  1 Dec 2021 23:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252FE6E8FA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 23:50:10 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso37543839ots.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 15:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AAKdEKP97Ls7n7IAvtp5z2iqSUT8MEQ6F41F7W+0AQ4=;
 b=NA4d/X9qdUT1rEuHC6bRSNE8HEhPNQKTVbOjN4UxvgQ42zEt4N2YvkqvF+NMW+6C7y
 oeUP7AcD7eg3BIgWUUz4IYrYX2oFRwPlNW09GnuBfZwDNCvACqGNiJeEQkvgSqEHnmeF
 g79oB17aVAQe9pp88aihHBtdngDDaL6GCVkmByYIN0eUxS8rlj7E4u18arwWmmRvqcEM
 WXgcv5g4B4zTnbDS4Vcoqw8T2OX7VVN0VN0ompeGgybgwyOgdTos4zLzgT7obC7eN//u
 owAS9QdWOHL7+tttbkG/qDokNqcytzFrZiaE0KXsMeMJ1oY+xfnZWNh2f94gD4iNmhBL
 Jbrg==
X-Gm-Message-State: AOAM530tFhm9APa+dD6BrMNRXE/7nWqBN+/vB2+X5T4bEgFfcGp9QvYg
 0GuOcDAnmmb2JcVORC404/xQ7wyZ0w==
X-Google-Smtp-Source: ABdhPJwFGco+ndtzGH+H4l80NmfjEg0wHDCC2Paa28Apu7hnxPttflAx+Rqn/6LnLcW4bvBsRHXMjQ==
X-Received: by 2002:a9d:24c3:: with SMTP id z61mr8751119ota.100.1638402609383; 
 Wed, 01 Dec 2021 15:50:09 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e14sm603686oow.3.2021.12.01.15.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 15:50:08 -0800 (PST)
Received: (nullmailer pid 3241728 invoked by uid 1000);
 Wed, 01 Dec 2021 23:50:07 -0000
Date: Wed, 1 Dec 2021 17:50:07 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 02/20] ASoC: dt-bindings: tegra20-i2s: Convert to schema
Message-ID: <YagKL2mSy0miICW0@robh.at.kernel.org>
References: <20211126161807.15776-1-digetx@gmail.com>
 <20211126161807.15776-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126161807.15776-3-digetx@gmail.com>
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
Cc: Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Nov 2021 19:17:49 +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra20 I2S binding to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/sound/nvidia,tegra20-i2s.txt     | 30 --------
>  .../bindings/sound/nvidia,tegra20-i2s.yaml    | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
