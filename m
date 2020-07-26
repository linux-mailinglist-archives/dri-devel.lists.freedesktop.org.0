Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9612D22DFE5
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BA989F49;
	Sun, 26 Jul 2020 15:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F45289E5A;
 Sun, 26 Jul 2020 11:41:26 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id di22so2926047edb.12;
 Sun, 26 Jul 2020 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lseWHrFGrBMnahk5IsFpxWMdJQwHw9KSOQ+YjXuxbFA=;
 b=aQBpC9fzSLDnNvo+7B291mUv7CYE5RDCBIF21+v6M1aGzer6EfkLoJTc2o7eM2K6MG
 AEwWL5yYBW7duIplNuwImdTx2S1RNduHQeqEz7mgWGH8phlB4lVmG8WraFLhUQJQ98Z2
 zUqMA7AMx1KI9m0wjq5Pggp54FnyaY97h8fptUzqQQSzxWh98jXHZHPHVbaEyQRKgrzd
 i2cvvdyI3MRlbqk0xdTUVTqT7iJB3HtXVtuiJeb5ouEVGh1+FGE608Ek0ww5PSUYS0h2
 CeGhysTrPHi4pC+EoRw7apKj2jD5TkDMRVMNrR+Ty5Y6JJ8bb8ZBiE0hUl/tm2l1AE7l
 L86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lseWHrFGrBMnahk5IsFpxWMdJQwHw9KSOQ+YjXuxbFA=;
 b=HfF8zuBvEeh6aiOPtkz6MNbNtF1wWJD6V3qglykqprCDP8L4p8DkgfiAlfIywQnBgt
 MqHe3pAj4QuT8lCo9yJFHo3yXQd5B6t/IjUACmugzCpWT/wYfqqjX7j0a6N8Iku1bjGf
 mz5bRMdIAg8KLqThUuscloKPOM1MXVAKSO+V5nTYOkBORLnai7vaREL1D5Y6UV9CrXKw
 XI09tKO6jPnaLaeOtShnpxGUHP/rSvIb/mE+CjAUSWNDMgx/NCMekEzpytwShxequEs+
 W/+U8xlKeZ/WSL4Ly97TPOl31Fw9M3rvU/iS1ubv8RFGuBHQNSDw17UHm8R+qlmyuLsm
 uEKw==
X-Gm-Message-State: AOAM5336crb/CZ3sHewaW/k7wTifLVEAj0KarNIeYuH4ZKH6HT75oBdM
 fDqgqN3pnQaRgRhxNvAFPtgD6GNsTXpOJ01GuXg=
X-Google-Smtp-Source: ABdhPJwLaN8pOziusRtdh65jeRMP/q7PrsLl/HAajDABeyO6M98X1ss/F/xt4CRsnqgpobZve6SjTOQeV/4Mrj+BHWc=
X-Received: by 2002:a05:6402:1ade:: with SMTP id
 ba30mr16127632edb.231.1595763685099; 
 Sun, 26 Jul 2020 04:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-10-konradybcio@gmail.com>
 <20200726112920.GA1286220@kroah.com>
In-Reply-To: <20200726112920.GA1286220@kroah.com>
From: Konrad Dybcio <konradybcio@gmail.com>
Date: Sun, 26 Jul 2020 13:40:46 +0200
Message-ID: <CAMS8qEV7jhbHqpXE2UOaXBVM5WbCThaGrcD3wiH9kf6h_K-qeA@mail.gmail.com>
Subject: Re: [PATCH 9/9] soc/qcom: Add REVID driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Martin Botka <martin.botka1@gmail.com>,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 DTML <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-usb@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Greg, thanks for your review!

>Why do we need this noise in the kernel log?

I guess it could be left there as a debug print? Knowing your hardware
revision seems like a good, but yeah, not a necessary thing.

>You can drop the GPL boilerplate text and add a proper SPDX line at the
>top.

Seems I only did that in my other local tree.. whoops!

>Drivers should always use dev_err() and friends, as you have access to a
>struct device * always.  Please fix up the driver here to use that api
>instead, no pr_* should be needed at all.

Will do.

>Horrible global symbol name.  Who calls this?

Welcome to development on qcom platforms :D

>This is the last patch in
>the series, so if there is no user for this, please don't export it.

Other downstream drivers make use of it.. need to get this up first, sorry :V

>Why do you need a .h file in the include directory if only a single .c
>file needs it?  Just put that info in the .c file itself.

Again, other downstream drivers which some people and I intend to
bring to upstream standards use that to access the PMIC model/hw revision.

>But again, who uses this module?  If it's only good for a single line in
>the kernel log, that feels like a huge waste to me.

downstream-kernel-dir$ rg -l qpnp-revid.h | wc -l
25

So yeah, quite a bunch of other qcom-specific drivers.

I'll try to fix these and send a v2.

Regards
Konrad
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
