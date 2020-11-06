Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1E2A9C71
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13176EAD0;
	Fri,  6 Nov 2020 18:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CCC6EAD0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:38:12 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id cq7so2059914edb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lgaaduNWhBtGCGTi0Ry8Q0coZRaawbsMQyKl/2UIEgo=;
 b=bWEpvYPwIh4FzC5r5pPWEo+HH7d29j2XT+4IHLwB7h2mpK0BanjnOUM2COAaDZMTHG
 tMZKkNXatD7jTbZyohBfebsRHFBgtxeHcIA7nd966oFzw+fPOQE8STyntXMtEH18dPWn
 vTVTsNdd8Nba8Yf8KY9twWS+7BquaMilp2SC8Szn+PeSSTY9lrAhCUSIRGun9jB4Aes6
 61h66Y6o7tKGJa+wbIhTUG/8F0whqKnko/bCvYb8OE9bBnxGvtcZb0gMeWNyeJzNvA34
 w5GWpkJ+hBDIwVxUjSmiQGu6FrGML9ueNGcmM/wcU24wCYp6yzR3dr3zzRMhO5u4fHhg
 gPbQ==
X-Gm-Message-State: AOAM531OjiZUY8KXCVwVkiQKUhnHRkIRA77VfXCTpSsf2vCL6cJiRhzC
 qrGJWXm/bZBC7RI+Ejk6P8fKUcwyUMU=
X-Google-Smtp-Source: ABdhPJy4HtbN7vYJA2lNpLeh4AOM6cl6mWGJG37W4W7pBtW9Cbp8CePA8JE/iAbGlQ2/RzLAUdYZuA==
X-Received: by 2002:a05:6402:22c6:: with SMTP id
 dm6mr3472585edb.139.1604687890665; 
 Fri, 06 Nov 2020 10:38:10 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id b24sm1594165edt.68.2020.11.06.10.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:38:09 -0800 (PST)
Date: Fri, 6 Nov 2020 19:38:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 17/47] dt-bindings: memory: tegra20: Add memory client
 IDs
Message-ID: <20201106183807.GQ65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-18-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-18-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 07:48:53PM +0300, Dmitry Osipenko wrote:
> Each memory client has unique hardware ID, add these IDs.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/memory/tegra20-mc.h | 53 +++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
