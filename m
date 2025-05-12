Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF5AB3E23
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 18:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBCE89C55;
	Mon, 12 May 2025 16:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB35389C55
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 16:54:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B9EA4A88D;
 Mon, 12 May 2025 16:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F219FC4CEE7;
 Mon, 12 May 2025 16:54:44 +0000 (UTC)
Date: Mon, 12 May 2025 18:54:43 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>, 
 Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alex Elder <elder@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Georgi Djakov <djakov@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Taniya Das <quic_tdas@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Imran Shaik <quic_imrashai@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 David Wronek <david@mainlining.org>, 
 Jens Reidel <adrian@mainlining.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-mmc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 20/33] dt-bindings: i2c: qcom-cci: Add the SM7150
 compatible
Message-ID: <20250512-incredible-radiant-jackrabbit-d0c77b@kuoka>
References: <20250422213137.80366-1-danila@jiaxyga.com>
 <20250422213137.80366-4-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422213137.80366-4-danila@jiaxyga.com>
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

On Wed, Apr 23, 2025 at 12:31:24AM GMT, Danila Tikhonov wrote:
> Add the SM7150 CCI device string compatible.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

