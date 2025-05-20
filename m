Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66552ABD1F5
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA48C10E22A;
	Tue, 20 May 2025 08:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TX3L8Gvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E0D10E22A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:30:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1760B6115E;
 Tue, 20 May 2025 08:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70D2C4CEE9;
 Tue, 20 May 2025 08:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747729833;
 bh=TTfmzlZVvfifJTlZjjrBTsPPuUufHs+nsAPYNFaapNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TX3L8GvkquQpp+gtwcy1w+B4YLAW28PyqQFexAl4Bb0VzPIHR68a5r8xndZpCWVjH
 eW4olLrWlJasNXlpZVCg2KAgq0cNSmMt73nxEIlKY3C60QKMwYAR48tLHtlG0CrDlF
 IsWi/s8aPBLmbTIh1uchYbbPy4QUh4a6zoHhj1Rq93YrvnTT8Ot3TBLwl/25tNc6Mw
 2d/LK3hR0PSRkvGln2qizA3PEHeYyQmeL7JhX12P4++e+HOsyeR71t1ebOtYi071DF
 yoXsIMXCkFUpZpn0uQNg1k5e8YlE+eLFFK3AIKTZWUVSlWg8MHlehk1454tj50X3KL
 yjIuqdZpaZKcA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1uHIMn-0000000020Y-2nQb;
 Tue, 20 May 2025 10:30:29 +0200
Date: Tue, 20 May 2025 10:30:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
Message-ID: <aCw9pYehCdfXXeiR@hovoldconsulting.com>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
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

Hi Chris,

On Wed, Apr 02, 2025 at 03:36:31PM +0100, Christopher Obbard wrote:
> The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
> panels. This patch series adds support for the OLED model which has a
> Samsung ATNA40YK20 panel.
> 
> With this patch series the backlight of the OLED eDP panel does not
> illuminate since the brightness is incorrectly read from the eDP panel
> as (to be clear this is not a regression). This is fixed in [0].
> 
> [0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/

It would be good to get OLED support for the T14s merged. Are you
planning on sending another revision of this series?

> Christopher Obbard (3):
>       arm64: dts: qcom: x1e80100: add epd hpd pinctrl
>       arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller

>       arm64: dts: qcom: x1e78100-t14s-oled: add edp panel

Strictly speaking you could have posted this last patch on it's own as
it doesn't depend on adding the hpd pinctrl.

Johan
