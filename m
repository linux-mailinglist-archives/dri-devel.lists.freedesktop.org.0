Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C6A67D6A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 20:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB0310E4C6;
	Tue, 18 Mar 2025 19:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 354 seconds by postgrey-1.36 at gabe;
 Tue, 18 Mar 2025 13:18:51 UTC
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8801E10E489;
 Tue, 18 Mar 2025 13:18:51 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZHC1y2V9Sz9shl;
 Tue, 18 Mar 2025 14:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1742303574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nZg7KYseVqSzxe03YTERtCQVwxfRyFFBlFRftXqUL1w=;
 b=LRqoEGFDgNtB9nYw2DcqGDcXJN5bec93E0w7/Ic/1C6vK1KeYaDcaANLrNwH/N57tQerEs
 N+iG1EXTXpET6md2gbIidZ4WwEqtH9dfVFArrjVDPuEo4cD9xXZBddC6Em+6lbYzelgai0
 ZHrZcB1s7DAmnteVnGwyXWnbfL/rB5KbvwazDlwnnlre4IWqwfZx22KQuMKh0jeSUbkH98
 VlLUdnpgUWs1hDEppuqCOsnVzMqH1qulShQtRK79LJId7TMtY15Xcw6pNVLfGPQlO+Dx7T
 XERPteHtO9hwoe7pSLUPYQ3rPJG8jp53nomJtq+yrYLL6BoSCoepbNVVqepMsQ==
Date: Tue, 18 Mar 2025 14:12:48 +0100
From: Anthony Ruhier <aruhier@mailbox.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/7] Support for GPU ACD feature on Adreno X1-85
Message-ID: <dj256lrkc4s5ylqkqdrak6a6p3v62ckkd3orsg7ykz2w6ugllg@rbfkojacklvx>
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
X-MBO-RS-META: g43o4q78m7rpfhcwdtfye1rj1q8t7sc6
X-MBO-RS-ID: 137da8c6ec8de9572e9
X-Mailman-Approved-At: Tue, 18 Mar 2025 19:55:27 +0000
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

Using this patch serie on 6.14-rc (tested over multiple RCs, up to rc7) on a
Yoga Slim 7x (x1e80100), I often get a video output freeze a few seconds after
my wayland compositor loads. I can still ssh into the laptop. I get these
kernel errors in loop:

	msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.12.1: hangcheck detected gpu lockup rb 0!
	msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.12.1:     completed fence: 777
	msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.12.1:     submitted fence: 778

Rob Clark recommended to me to remove the higher GPU frequencies added by this
patch (1.25Ghz and 1.175 Ghz). The lockups happen then less often, but are
still present. It is easily reproducible.

A way to mitigate the problem is by constantly moving my cursor during a few
seconds after my wayland session starts, then no freeze happens. Reverting this
patch serie fixes the problem.

Thanks,

--
Anthony Ruhier
