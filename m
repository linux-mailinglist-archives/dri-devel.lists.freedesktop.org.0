Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41DD65AFAF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B7510E2FE;
	Mon,  2 Jan 2023 10:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324EC10E2FD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:39:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h16so25927922wrz.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 02:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TN3FpV1I7tFu/Kpha9CDnNvHD7KVpRjqtfkjCmVPUO0=;
 b=CakuEVBcyWpVCHtq/gK0WL8H5kopdxqYu/fVo/dM+vHh1V8sZ+azV8nsGYLtljTXD/
 Jan0bb1u2z6DBTbYgWOe3F3oWRQkEXTN7ztpNDX9uesOCbQwTs9b9Gy1XnACehMALSO9
 epAapZem3wE9CprqWtC4EIdMuPaKyykdTAI9wvrGR8ecRb9OdNyNT5dW/mHVs/l8/LEX
 vzsBl2x2BPr3Ifx3ZZcZZBGkUw1+odEJ4t+2weznXeuIh+RfNJcTOzij+gzqWzQ3DqQR
 wh88hwAqkaRW9U7tYi3O+oxdt5Q5UAigMXZtSxG5GVpOOl3XSzR82YsrFvWlDDt7UISs
 7Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TN3FpV1I7tFu/Kpha9CDnNvHD7KVpRjqtfkjCmVPUO0=;
 b=R0hRkHsnN0I58v6gTiE2Y3rwFLAxeyDSFYSMvuv0PA8nTPa5/msmPBOgVBeOGX7/Ee
 W4jDqYXBhyzgAsRKFjOF0MzIJdDuDdCYhzLLKHxhkK5TqhpGKbohpmztYC8pp8bUUo1x
 ul/yoQRq7qG15bNu4dGcMCWRKjIr3VWrv/jRidE5k3skwk5tqG9ObTaZSp6Ydr/Xpm/K
 L4m4WIPLDDg6/A0ZHPF2BrCbXO6dbRaL4K7Ca5R0vg4+aC3uaWwzMfxd5H5dkY2s95Lw
 W/27hpyKmynNdFwLVWY+xgitnzY+S+0DCngxlfM7fawHY4BUkwnkG2MdB28L7q+kxJI4
 UCfw==
X-Gm-Message-State: AFqh2kpc2cITz6hQBbd275k4fNZ6p2iKPEV2Kh3gqq6Go+2a75UrigXj
 TV53q7cBrnGzuh4xFJAmCDYEVw==
X-Google-Smtp-Source: AMrXdXvJmLCCviOiLhVE2Fn/tGQ7qfOD6ZJjjx6/aj9+9AjFtmpkJtNmUE2jJpa+634KcFkd2p2Kuw==
X-Received: by 2002:adf:f243:0:b0:26d:798f:ab8a with SMTP id
 b3-20020adff243000000b0026d798fab8amr22489628wrp.68.1672655986705; 
 Mon, 02 Jan 2023 02:39:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d4e4e000000b002549b649b62sm27810881wrt.50.2023.01.02.02.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 02:39:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
Subject: Re: (subset) [PATCH v6 0/8] Support for the NPU in Vim3
Message-Id: <167265598564.387036.9948295692448105822.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 11:39:45 +0100
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
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
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

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[4/8] arm64: dts: Add DT node for the VIPNano-QI on the A311D
      https://git.kernel.org/amlogic/c/18b542e544d3bd00e55d7135ee673b34dbfdb9b9
[8/8] arm64: dts: Fix NPU power domain references in Amlogic G12-based SoCs
      (no commit info)

These changes has been applied on the intermediate git tree [1].

The v6.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
