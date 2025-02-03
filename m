Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25764A25991
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 13:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301E110E030;
	Mon,  3 Feb 2025 12:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="NiCsXrG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E072710E030
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 12:40:19 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id E576025CAA;
 Mon,  3 Feb 2025 13:40:17 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOJee6X8J05I; Mon,  3 Feb 2025 13:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1738586417; bh=AkDFsgM8ht/4xOTKn+YGxCP4v6cjlpjp8uRWn5voH7o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=NiCsXrG7LpnG5w/NFwLl1Xf4k91ChodYcxZdyx5YPPOd49ovtD7MWdYY8MSqveHJL
 AjJK0tAADkF89VLXYecmauRE5Gbv5iijR/wWAk4bwUHJvvvhXCYprAkat0d0TGYHIf
 ykOg1aVULxEsuMRLAo+lnp61mnypYcYTcGh8agQvcbDbQ93GggzGqmU2WdUo/fnERe
 cf0a6u52bgH+nL3XJ9zgtBTU2ZwrsvKehCSZyQANT07sLZRkG2mrLpJPC599dAG4RR
 gPgmAg3QdVtp9K9GV7ZrzkCmvJgfX0tErHPHs9P/aQnPsTEdcVAPpr+zHZOgyA1afb
 2mgxyQClmL60Q==
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 12:40:16 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Tomasz
 Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung
 <jh80.chung@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Thinh
 Nguyen <Thinh.Nguyen@synopsys.com>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>, Sergey
 Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH 02/33] dt-bindings: clock: add clock definitions for
 exynos7870 CMU
In-Reply-To: <20250203-enigmatic-remarkable-beagle-709955@krzk-bin>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
 <20250202190758.14986-1-kauschluss@disroot.org>
 <20250203-enigmatic-remarkable-beagle-709955@krzk-bin>
Message-ID: <c1249f2f6ac8a2f5a1dcb3bbbba647f9@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On 2025-02-03 07:54, Krzysztof Kozlowski wrote:
> On Mon, Feb 03, 2025 at 12:37:58AM +0530, Kaustabh Chakraborty wrote:
>> From: Sergey Lisov <sleirsgoevy@gmail.com>
>> 
>> Add unique identifiers for exynos7870 clocks for every bank. It adds all
>> clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
>> CMU_PERI.
>> 
>> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  include/dt-bindings/clock/exynos7870.h | 324 +++++++++++++++++++++++++
>>  1 file changed, 324 insertions(+)
> 
> Look at git log - that's never a separate commit.

Hmm, I see past examples which are mixed.

2ae5c2c3f8d586b709cf67efe94488be397d7544
Exynos850 CMU (c. 2021). CMU definitions are in a separate commit.

591020a516720e9eba1c4b1748cb73b6748e445f
Exynos7885 CMU (c. 2021). CMU definitions are in a separate commit.

while

96bd6224f07b8bf73e0359f15a3d7678118494e6
Exynos5433 CMU (c. 2015). CMU definitions and driver are in a single commit.

Let me know if I should still continue with the approach you mentioned.

> 
> Best regards,
> Krzysztof
