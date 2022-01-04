Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E4484AB2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 23:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F7810E632;
	Tue,  4 Jan 2022 22:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B2B10E4DE;
 Tue,  4 Jan 2022 22:26:07 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id s73so61608682oie.5;
 Tue, 04 Jan 2022 14:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JnOadLKUCLxTeQKKTc3saQOhwTodIVbhHkqdpkUyL30=;
 b=nwnBBuXaiiMGt9U5auscaNEAgp2g6A6/1IVb5KTXRfBNLQ2tY/neG6qfBTx6pADkl5
 Noyn2nlmuz4gSLYq1PNlGaU0rt4ZMUIhO93MmewDgFXQStVhfBo91W2R2L1n8NH4tryy
 dQSnk98RuVknwllLbfjZE3hPG9MqxXXVhx3pIcPw1qMSf5ngu8em/19pydvXCj3zGxJc
 gfaXyhQ6sIHifmSRPI6nJnpFCXCrJgdvjOlHDfESCphhrZ0vyk05ImhfYmqLKV0xcO9k
 /CttrZn8tzdsNfw/vViMzneZAI9uKYQxeEroQU0NEy+HYCnBDxalH9ZQEKJit8pEsP9c
 +oTw==
X-Gm-Message-State: AOAM5319tHlMcu4aNXVJ52tMqBsg5i+M017JmQGwj7IzjQRg54RBmGKv
 BuSSbpWDmxBBAJUv30owVA==
X-Google-Smtp-Source: ABdhPJxfmZnICaR0AFOGdWsnbelA0aJZsRc1Kgnndk6DcVeWC0CYljTp86RqQf43B5yP69zwu5wQGg==
X-Received: by 2002:a05:6808:10d1:: with SMTP id
 s17mr395747ois.26.1641335166437; 
 Tue, 04 Jan 2022 14:26:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c139sm7472227oob.31.2022.01.04.14.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 14:26:05 -0800 (PST)
Received: (nullmailer pid 1557364 invoked by uid 1000);
 Tue, 04 Jan 2022 22:26:04 -0000
Date: Tue, 4 Jan 2022 16:26:04 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] Discussion: dt-bindings: display: msm:
 dsi-controller-main: fix the binding
Message-ID: <YdTJfMXYXjavr8cZ@robh.at.kernel.org>
References: <20211225205352.76827-1-david@ixit.cz>
 <CAA8EJpoVuNDS2uD2g8W_40XVO2jS=6GtRQFxAnyPpd_QuHim8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoVuNDS2uD2g8W_40XVO2jS=6GtRQFxAnyPpd_QuHim8g@mail.gmail.com>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Heidelberg <david@ixit.cz>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 26, 2021 at 02:34:08AM +0300, Dmitry Baryshkov wrote:
> Hi,
> 
> On Sat, 25 Dec 2021 at 23:54, David Heidelberg <david@ixit.cz> wrote:
> >
> > This binding is not much validating the old DSI v2.
> >
> > Currently we don't differentiate old v2 from new versions,
> > so we need to figure out how to validate them.
> >
> > I propose specific compatible depending on mdss version, but I would be
> > glad, if someone with deeper knowledge proposed the names.
> >
> > I'm willing to implement it then and back from autodetection.
> 
> I'd suggest to use hardware-specific compatible for apq8064 (and maybe
> other v2 hosts if somebody adds support). For example
> "qcom,apq8064-dsi-ctrl" or "qcom,dsi-ctrl-apq8064" (no strong
> preference here).

The former.

> For 6G hosts it will probably make sense to use IP versions instead
> ("qcom-dsi-ctrl-6g-v2.4.1").

Humm, we went down the path of version numbers for QCom blocks, but the 
result was not much reuse of same version on more than 2-3 parts if 
that. So stick with SoCs for naming unless there's a strong case that 
version numbers to SoC parts is 1 to many.

Rob
