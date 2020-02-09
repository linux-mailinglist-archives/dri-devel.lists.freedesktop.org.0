Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA412157156
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888E26E94B;
	Mon, 10 Feb 2020 08:59:14 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0766E04E
 for <dri-devel@freedesktop.org>; Sun,  9 Feb 2020 00:19:25 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id j9so1737371pfa.8
 for <dri-devel@freedesktop.org>; Sat, 08 Feb 2020 16:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Sstt02xcY3tWivWVDeG5iBViBhgDcepwGoXIUUCRlj4=;
 b=BPbxcNj6SmiZxSbe75MPs5wgysL/4VNC8ywY9+pPcNVd5S2M8SRDxNwfWfTJyj150R
 WQNu4RB/bLoGYnZ1Nd3Qpa+8CuWSZ/wHtK7Cc+qKa/R9nhfZ0JQlCMUgiXW/yzDslyH1
 qlJ7tJ99NjX78Y25d1bG98cJx0SsfoCyM6YYa9vTS3kbi/yJHYXhFSYRBKBIelZVy2Ke
 0xt6+sGby2W7BOs6AHGa/bFBlKEeUqCFLP2K/rGjPont15exh5IYLTWMj7fmOThiUkOR
 vmq0E+9ag/9g55KPMYeaLVEVsKewAGhZwpFYWX8twWDStuo+6l0p2FiBwqNDAGV6tbCw
 UyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sstt02xcY3tWivWVDeG5iBViBhgDcepwGoXIUUCRlj4=;
 b=lJFyU2RQp/+igkK/qDFXwBSJFr6twNf79SDKbp5DIPEyLenmv0AVPQXMS7Wl/ARtNZ
 dHxt4xOPX/kXyWonE3AJDwRJ2jU/OymcLC1hKADNUGSkOO32URux/ET/YvP0sa3Y6KFY
 NkTivRY4UOFECzRDfSd5oZL3rKC5fNBNhVOsbxT/3ZNpNMtN3JQU8Gg5fsL02gm6Oenh
 YwMWy99Xwe2YpWHw4KJT/5W0Uad+hQ6kNUnJzUSgYESR6FcliR6Ao3H/YaUImaVFQAYP
 fNxb7p8gd64NJkhdTKhV9nYpLGBUroWoAtudN+C/fdagNVPmE7cylYwelXiXCYMxyoXr
 azPw==
X-Gm-Message-State: APjAAAXU1VUiD3y6oavgTq+LP4zuOEsFDUO/F5LqaItQPOPmEoUJWD9f
 uMhr/MAuXCasJEPCDycjm0NmMw==
X-Google-Smtp-Source: APXvYqw/gMmQQJ9ir/gx3iHXpaMoj2RQ1ibv3ZsMai6SyfW/JiBS/hZuYBtLZ3iWedSC6HJ3BYXvpA==
X-Received: by 2002:a62:1402:: with SMTP id 2mr6355873pfu.126.1581207564844;
 Sat, 08 Feb 2020 16:19:24 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id w11sm7385129pfn.4.2020.02.08.16.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 16:19:24 -0800 (PST)
Date: Sat, 8 Feb 2020 16:18:38 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
Message-ID: <20200209001838.GF955802@ripper>
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org>
 <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=Ux9XjUQMy4zzaz9JxZzyuZJvNB_W9ANzE140W_pDmixA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Ux9XjUQMy4zzaz9JxZzyuZJvNB_W9ANzE140W_pDmixA@mail.gmail.com>
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 05 Feb 11:24 PST 2020, Doug Anderson wrote:

> Hi,
> 
> On Tue, Feb 4, 2020 at 11:02 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
> >
> > +                       power-domains = <&gpucc CX_GDSC>, <&gpucc GX_GDSC>;
> 
> I should note that this is going to be a PITA to land because the
> patch adding "GX_GDSC" should technically land in the "clk" tree.
> Without extra work that's going to mean waiting for a full Linux
> release before Bjorn and Andy can land.  It might be worth sticking
> the hardcoded "1" in for now instead of "GX_GDSC".  That's what we
> often do in cases like this.
> 

I'm fine with the patches using the GX_GDSC define and I will replace it
if necessary when applying the patch - but either way we this is
dependent on the clock tree picking up the patch that defines the value.

Regards,
Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
