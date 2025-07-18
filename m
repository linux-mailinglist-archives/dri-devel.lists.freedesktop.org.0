Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3C2B09C99
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0680210E917;
	Fri, 18 Jul 2025 07:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C8310E915;
 Fri, 18 Jul 2025 07:32:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 20A6E43441;
 Fri, 18 Jul 2025 07:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CF5C4CEED;
 Fri, 18 Jul 2025 07:32:12 +0000 (UTC)
Date: Fri, 18 Jul 2025 09:32:10 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Danila Tikhonov <danila@jiaxyga.com>, 
 cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
Message-ID: <20250718-finicky-orangutan-of-piety-fcfd6a@kuoka>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-3-72ce08285703@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-3-72ce08285703@oss.qualcomm.com>
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

On Thu, Jul 17, 2025 at 04:28:45PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Current documentation of assigned-clock-parents for dp controller does not
> describe its functionality correctly making it harder to extend it for

It does...

> adding multiple streams.

Just extend the list?

> 
> Instead of fixing up the documentation, drop the assigned-clock-parents
> and assigned-clocks along with the usages in the chipset specific MDSS
> yaml files.

It should not be added here at all, but since Qualcomm added it, it is
an ABI, so explain why this cannot be fixed or impact of this ABI
change. It is fine to drop it in general, but reasoning in first
paragraph feels incomplete. I don't see any problem in how it describes
the functionality (except that it should not be there...)


Best regards,
Krzysztof

