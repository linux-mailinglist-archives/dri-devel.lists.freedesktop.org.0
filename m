Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E2234C2F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 22:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786F46E040;
	Fri, 31 Jul 2020 20:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB8D6EB47;
 Fri, 31 Jul 2020 20:26:32 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id q75so24743206iod.1;
 Fri, 31 Jul 2020 13:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AiMGdmCb+bz6YVV8Hxa7igAvU6qudkwfV+tj6X7dOh4=;
 b=AzyhknaABwGLhDgc6A0rmC6YAJXE0XtUH78ck1eyXafcZsILpBt7CbmzOT/IiB8RX7
 cUYxxJAV8wa3j1cxSgK3MxLbbh9bOkD3xtpC+MJoplnJCdtp6672D93pM7uSiin0agD1
 7RZrXH3C9ZNHnzs5dZq+yAFGsE5c8IZ/aGHb8cssNB1GYpZeATzwjeDgyGSjwKtw9at9
 VqKo5vJ/WNy9OO2ztLgr/IB83vjZJYqCmKZ8VshIYISbGS2S7L4Idz8Oc+9fjUaZyZui
 AeP+1IQ9qIBmxt3GQ5HaYN8thqbikNEQyZFnAryMEM90lvTSmAzqthq4EiYVwCJ7sJmI
 bm7g==
X-Gm-Message-State: AOAM533CxZDpwExiebzoiA1AFtAoQxe43jau+XBIWDNINIGq+iNmqR1D
 h9pcGtyZkdUN+uE0RcJpIQ==
X-Google-Smtp-Source: ABdhPJxPe/ccy6ODQW2ezEBqzYMhTdtl0ygSHo9crgD2bv3oq38Q3L9HvFzQgv5RMZ2ASGAI4iFJsg==
X-Received: by 2002:a6b:b74b:: with SMTP id h72mr2738365iof.52.1596227192057; 
 Fri, 31 Jul 2020 13:26:32 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d125sm4827878iof.32.2020.07.31.13.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 13:26:31 -0700 (PDT)
Received: (nullmailer pid 723736 invoked by uid 1000);
 Fri, 31 Jul 2020 20:26:28 -0000
Date: Fri, 31 Jul 2020 14:26:28 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH 3/9] drivers: usb: dwc3-qcom: Add sdm660 compatible
Message-ID: <20200731202628.GA723682@bogus>
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-4-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726111215.22361-4-konradybcio@gmail.com>
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
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, martin.botka1@gmail.com,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Felipe Balbi <balbi@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, zhengbin <zhengbin13@huawei.com>,
 Manu Gautam <mgautam@codeaurora.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Jul 2020 13:12:00 +0200, Konrad Dybcio wrote:
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  drivers/usb/dwc3/dwc3-qcom.c                         | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
