Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3699EBDDB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 23:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CBE10E99C;
	Tue, 10 Dec 2024 22:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 596 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2024 22:31:18 UTC
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3702710E99C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 22:31:18 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1DE241F983;
 Tue, 10 Dec 2024 23:21:19 +0100 (CET)
Date: Tue, 10 Dec 2024 23:21:17 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] dt-bindings: msm/dp: add support for pixel clock to
 driver another stream
Message-ID: <56n4r7p63dtzjpafe5wdljwhlkhzahbct5tsocegivvhop4f6a@65pmfavnyqga>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
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

On 2024-12-02 19:31:38, Abhinav Kumar wrote:
> On some MSM chipsets, the display port controller is capable of supporting
> two streams. To drive the second stream, the pixel clock for the corresponding
> stream needs to be enabled. In order to add the bindings for the pixel clock
> for the second stream, fixup the documentation of some of the bindings to
> clarify exactly which stream they correspond to, then add the new bindings.
> 
> In addition, to help out with reviews for dp-controller bindings, add myself
> as the maintainter.
> 
> This change was made on top of [1] which fixes a warning on the sa8775p
> bindings.
> 
> [1]: https://patchwork.freedesktop.org/patch/624068/
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Abhinav Kumar (4):
>       dt-bindings: display: msm: dp-controller: document pixel clock stream
>       dt-bindings: display: msm: dp-controller: document clock parents better
>       dt-bindings: display/msm: add stream 1 pixel clock binding
>       dt-bindings: display: msm: dp: update maintainer entry

Simple nit: any reason why the third patch uses display/msm as subject prefix
while the other 3 patches separate with a colon and space?

- Marijn

>  .../bindings/display/msm/dp-controller.yaml        | 41 +++++++++++++++++++---
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 +++--
>  2 files changed, 43 insertions(+), 7 deletions(-)
> ---
> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> change-id: 20241202-dp_mst_bindings-7536ffc9ae2f
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
