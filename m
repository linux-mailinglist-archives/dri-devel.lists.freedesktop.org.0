Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0D6AFFEBA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 12:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A2510E1F4;
	Thu, 10 Jul 2025 10:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fNdY50vl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2CA10E1F4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:07:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 196146146A;
 Thu, 10 Jul 2025 10:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E8FC4CEE3;
 Thu, 10 Jul 2025 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752142032;
 bh=kTfBtHQVaqOAbu7HaUkw0dQpJOXNcnY0mNBZzC7M93g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fNdY50vlmF0c3atPR0wpveOpaNYxBV09YlwyUysx8+WWxAzCTJ6C4H25qZHs6+vPz
 fQFnAPMh4qh9tsq8v4xcCdX7bkFwq+8QmtyQlczn71+bRGiZPS7D6SN/c+uW5JQbkq
 6U6PQz966SOHuYgvna7pN128BUKoWV26N3haXFPcvWNwPtnNcIfyv2euWSK64EK4/P
 suUv78F8cyyLf0JxlDmKu0+pUzOjMPKabsggu0IF0J8lmmaHECpLgOt4bZvnvxESgp
 nT1jiX+TFZ69Ct8gMbpXu+HI1eYaKUCnuvIdTS/AJ6IoDlKLOJTFVrHGW5WfrNbriR
 TtZxnGmteDWjw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1uZoBE-0000000082t-3BZ0;
 Thu, 10 Jul 2025 12:07:05 +0200
Date: Thu, 10 Jul 2025 12:07:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
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
Message-ID: <aG-QyF12rGY55gcG@hovoldconsulting.com>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <aCw9pYehCdfXXeiR@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCw9pYehCdfXXeiR@hovoldconsulting.com>
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

Hi Chris (and Neil),

On Tue, May 20, 2025 at 10:30:29AM +0200, Johan Hovold wrote:

> On Wed, Apr 02, 2025 at 03:36:31PM +0100, Christopher Obbard wrote:
> > The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
> > panels. This patch series adds support for the OLED model which has a
> > Samsung ATNA40YK20 panel.
> > 
> > With this patch series the backlight of the OLED eDP panel does not
> > illuminate since the brightness is incorrectly read from the eDP panel
> > as (to be clear this is not a regression). This is fixed in [0].
> > 
> > [0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/
> 
> It would be good to get OLED support for the T14s merged. Are you
> planning on sending another revision of this series?

No reply for over a month. Do you intend to respin these or should
someone else take over?

Neil, do you have the OLED version now?

> > Christopher Obbard (3):
> >       arm64: dts: qcom: x1e80100: add epd hpd pinctrl
> >       arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
> 
> >       arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
> 
> Strictly speaking you could have posted this last patch on it's own as
> it doesn't depend on adding the hpd pinctrl.

Johan
