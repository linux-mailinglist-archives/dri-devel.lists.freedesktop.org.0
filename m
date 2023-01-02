Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C374665AF98
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B3188284;
	Mon,  2 Jan 2023 10:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DAA10E2FD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:34:01 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso20301892wmp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 02:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8mgGt+WDil8dXaAkpJ8qZ0avMhy4Myb58QPGVDym6jk=;
 b=yNsiE5cnW7N2EYqUIgR6oylWXDpokhhUBC++Hyr5GSKhbbGYxxLF6AxDzhQlxgp8bB
 iP9FHXzLpMBT4+H0U+GeaOZgaqPkosrF71zTJbgP0DTCTH9Iep+XVGkqJPQ1AOwrWdKi
 gyUCqDrOD0r3EbPZfuAHfx4yVfSW0Ww1GfTy/GOP7wWX+VgUzWfWDepBAvPLMOsoNCmn
 0CJyADgaPbJFbsBqtM5gEmmtlJ+ndqG80yihZN4wiwzcNdNQv/eJbAfTVlioeKWnBQ8g
 u7Mk+2qHk6PzpoxLBm+ikqT+ux1UVPpr6X6D0Oxepk3AV8ORdC3Fqr22906Vtn31Ju5R
 mL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8mgGt+WDil8dXaAkpJ8qZ0avMhy4Myb58QPGVDym6jk=;
 b=oC2ODoSBS1gQL1jO+05F+P3nNmrmj1SWxGdfhAIOdnynBWsTsbcLwI0UDFfNZgeNzs
 EFQ2ms0wxonoZ63AjIYt+JGtiZY2zAnDHrXBTDTpuKZ0r9mzg7H/qqUkKBnu5iETf6Ri
 dXT1W7EQw+M2mFYwcpG+lLYhiNRKlWyQN3Wz5d6iIM7y8OyMiU2NHDwwmeP0yt9jOkI8
 eBn5NqITCJw5lNBqawrLNsuoWEdph7SgtOZczjl3Keips4AUYERKhVLCffM7gqujj7VF
 4ifGpEyr9aI4ACvkwCsrTMi/NbPJ7fvPs0HuR5x7HwXgaufsdiINYj822eJ1vMr28iY2
 +OrQ==
X-Gm-Message-State: AFqh2kqMIIX8R6104T70xs7Qd3vAO86W4QI/Vh3+N4YPqoovlwl9Ik78
 wCsHHCpp7wkzJNeElvSDDjle9A==
X-Google-Smtp-Source: AMrXdXtR8Zpqr1OOrcZbsXvxGi2rMh686vRDHyobS4MDPmdqNXmhUxFGkbSoZEpsVKm7yR6UFphmcg==
X-Received: by 2002:a05:600c:1e09:b0:3cf:b73f:bf8f with SMTP id
 ay9-20020a05600c1e0900b003cfb73fbf8fmr28237316wmb.7.1672655639818; 
 Mon, 02 Jan 2023 02:33:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b003d96efd09b7sm39558447wmp.19.2023.01.02.02.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 02:33:59 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
Subject: Re: (subset) [PATCH v6 0/8] Support for the NPU in Vim3
Message-Id: <167265563884.375287.14738065029964626826.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 11:33:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, italonicola@collabora.com,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 2 Dec 2022 12:52:12 +0100, Tomeu Vizoso wrote:
> This series adds support for the Verisilicon VIPNano-QI NPU in the A311D
> as in the VIM3 board.
> 
> The IP is very closely based on previous Vivante GPUs, so the etnaviv
> kernel driver works basically unchanged.
> 
> The userspace part of the driver is being reviewed at:
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/drivers)

[3/8] soc: amlogic: meson-pwrc: Add NNA power domain for A311D
      https://git.kernel.org/amlogic/c/9a217b7e895313a4d42f7a6c48b6237a595945f4

These changes has been applied on the intermediate git tree [1].

The v6.3/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil
