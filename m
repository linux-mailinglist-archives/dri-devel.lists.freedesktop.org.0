Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D947C2C8CA4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 19:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4326E5D5;
	Mon, 30 Nov 2020 18:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7726E6E5D5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 18:23:49 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id y22so9259953edv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 10:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I9ONVBtfScKIMTye82bfGQ5rddLKQrmuSaE2Zj5EgGI=;
 b=KSjplbCH1Lnhnlu294EdtZNzIp2VPCRBM4o22ncVGKc3DvHGLAHAaZdIc1eMGViaru
 WendEmc3t5sgpCsaZ7lkdb+U/mhr8tTc2VXpMebO0VoESDN+zixTwdGy7YcYLJe7hQuh
 zOvJalvGHEa28a/akew88BuNM20hS14dmAErUJ5hlF/+EiQD+VRTPJQhJgKOEmGa8SNS
 yN/urFDanoOjnzBVx8IifgK/pROQO7LtylWiokfoKBjpRjw3dJqqInyS2RPWvEpzMA3j
 EuPGmzqEhqnr65ZNHv/wv2/1EPVPwHFVkhbBv2GCow3JT3OJMXdH+ZF34bUDL6kwTpvs
 Yqfg==
X-Gm-Message-State: AOAM533+bbSf7FD2Z36iE92EInWFp1IzaeD8H2eQTBOfRAWHYtdBkAll
 nEjKI9+OMheZYe7ChpVX72M=
X-Google-Smtp-Source: ABdhPJwYHGbHVMApFqE392EkdKd4CbGtej8nEk3tKKJMIPVxgXA2gu998VoT05uHS0KZ4By5J9o3BA==
X-Received: by 2002:a50:8f64:: with SMTP id 91mr23297490edy.310.1606760628069; 
 Mon, 30 Nov 2020 10:23:48 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id v18sm789274edx.30.2020.11.30.10.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 10:23:47 -0800 (PST)
Date: Mon, 30 Nov 2020 20:23:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v10 01/19] dt-bindings: memory: tegra20: emc: Document
 opp-supported-hw property
Message-ID: <20201130182345.GA28450@kozik-lap>
References: <20201123002723.28463-1-digetx@gmail.com>
 <20201123002723.28463-2-digetx@gmail.com>
 <46b3bab7-1c2c-2f50-6e41-f411e532357b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46b3bab7-1c2c-2f50-6e41-f411e532357b@linaro.org>
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 11:48:18AM +0200, Georgi Djakov wrote:
> On 23.11.20 2:27, Dmitry Osipenko wrote:
> > Document opp-supported-hw property, which is not strictly necessary to
> > have on Tegra20, but it's very convenient to have because all other SoC
> > core devices will use hardware versioning, and thus, it's good to maintain
> > the consistency.
> 
> Hi Dmitry,
> 
> I believe Krzysztof is waiting for Ack on the binding before merging
> this patch (and the rest), but unfortunately it was not sent to the
> DT mailing list for review.

Indeed I am still waiting for Rob's and Thierry's acks for this and the
following patches.  It has been just a week so I'll give it few more
days.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
