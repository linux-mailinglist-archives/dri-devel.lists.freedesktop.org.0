Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0322FDE6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771946E056;
	Mon, 27 Jul 2020 23:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C1D89F5B;
 Mon, 27 Jul 2020 19:58:49 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id dk23so6431242ejb.11;
 Mon, 27 Jul 2020 12:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P+ZtokmBUXMUzMCK2bGHNX1SgF1vgTjbYOyC77ce+jk=;
 b=d/dz9cHAZyIUWkOF4iyEEB54wC9RrtmHHxRtwGzmM1BAlZZ3oFzIXxmFfA0mafFd/T
 5HP7Z8Tx3WlvC8JjvVLdB9XCem6CpF4Yh6qILouU3qfTNoXpr0VPHusKxiofDodqqNk7
 KcexI47FrbFGgsI7EGCT9Qrph1GgYWDCFhAdpDp6J2/EhhKUkd8KvwTpdghR4oDAXS5R
 gy67QDNSKnXskDxTAMVX5R4zDHJ5B1mr8eQGhyafd1NRj41S/DnCvgVo6LbmCwgFwxfS
 nfePOw8uVEiDvupvIB1V6Dm0zdOVswIdqpLglfjECJu+jypGAmMuDHzqImmmBxkZ8wVA
 7INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P+ZtokmBUXMUzMCK2bGHNX1SgF1vgTjbYOyC77ce+jk=;
 b=tuk5c9amoGaF2oLRaVQx+R2G/DvnalGTdkQDUtliNR5anZ0NFHDz4Im61IViouPKpJ
 jq5Cmd+tNSG8zMpEe6fb9y554gnDUBnSthwNGomOJPMarQJMJnacmgJVY0/B5JZvXgFU
 7a86M+ZfG801MH/8Q5vp20sQzzHz+qVoNInGjjsUmpUrTzFPb7G+VQb/raXi3hyHL6TB
 0bd1WqvDYrReoEopTxv9GYxnHD6m06nlqcoeWmyYEWDRPKajrItssGLq461u/3LyeEXr
 mM70VVLpHyfucsu9qWJW3dYz29mvpyKrygS2FlBGLlrGALpDlNWiXBYGbH6FGONo0tl1
 U5Rw==
X-Gm-Message-State: AOAM533sAampX2+dL4ZsWCTfVk8kxLiafOSFJL694AWWvIHdjaEFO3+y
 6sMC3qR9qkwrm3VD03MPnyQ+PXdduQAAIRSctLA=
X-Google-Smtp-Source: ABdhPJx5Tqhd6JeCOLSOIs2/bFHHFG80V48Q4I9sJHYsrBzE7kDBMjNuOPbuf5tIW9RJHzS57R9ksfFzYzReLr1GKjQ=
X-Received: by 2002:a17:906:f905:: with SMTP id
 lc5mr6596445ejb.340.1595879928214; 
 Mon, 27 Jul 2020 12:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-9-konradybcio@gmail.com>
 <159587887102.1360974.16083886481437183810@swboyd.mtv.corp.google.com>
In-Reply-To: <159587887102.1360974.16083886481437183810@swboyd.mtv.corp.google.com>
From: Konrad Dybcio <konradybcio@gmail.com>
Date: Mon, 27 Jul 2020 21:58:12 +0200
Message-ID: <CAMS8qEU9t=QZR34FifzGMsQkhxQCVtOfoNRX-n_0xZJz2rbcyw@mail.gmail.com>
Subject: Re: [PATCH 8/9] clk: qcom: gcc-sdm660: Fix up
 gcc_mss_mnoc_bimc_axi_clk
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, devic <etree@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Martin Botka <martin.botka1@gmail.com>,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>Fixes tag?

Can I add it here? I supose I can.

Fixes: f2a76a2955c0 (clk: qcom: Add Global Clock controller (GCC)
driver for SDM660)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
