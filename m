Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A216A5367B4
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 21:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4783610E72C;
	Fri, 27 May 2022 19:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D4F10E72C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 19:51:15 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B21633F726;
 Fri, 27 May 2022 22:13:26 +0200 (CEST)
Date: Fri, 27 May 2022 21:51:10 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/3] drm/msm/dpu: Add MISR register support for interface
Message-ID: <20220527195110.pdsq5aeun5ik5wsk@SoMainline.org>
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-3-quic_jesszhan@quicinc.com>
 <d72845af-f444-af2e-b834-6e4c754a1094@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d72845af-f444-af2e-b834-6e4c754a1094@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-27 22:38:24, Dmitry Baryshkov wrote:
> [..]
> >   #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
> >   #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
> >   
> > +#define INTF_MISR_CTRL			0x180
> > +#define INTF_MISR_SIGNATURE		0x184
> > +#define INTF_MISR_FRAME_COUNT_MASK	0xFF
> > +#define INTF_MISR_CTRL_ENABLE		BIT(8)
> > +#define INTF_MISR_CTRL_STATUS		BIT(9)
> > +#define INTF_MISR_CTRL_STATUS_CLEAR	BIT(10)
> > +#define INTF_MISR_CTRL_FREE_RUN_MASK	BIT(31)
> 
> I'm tempted to ask to move these bits to some common header. Is there 
> any other hardware block which uses the same bitfields to control MISR?

Can we use the "rnndb" register XML and bindings generator for DPU,
similar to how it is currently used for Adreno/freedreno and the DSI
kernel drivers?

- Marijn
