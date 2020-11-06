Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12C52A9C4A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA57B6EACB;
	Fri,  6 Nov 2020 18:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4FC6EACB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:33:52 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id p5so3283011ejj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=irZ12SbbSCqDVzveJpX+VcrhhOjlapLNW1b3S/AMVe0=;
 b=LM2EfyYFIFTkkprIIycL4e4y5/TXGLOHTXCPPslwdiL8xoKzEUYkOAUpFK8S/VPm7P
 pw5qeulMWsWIDZqdkQdwJLao07WRZUW+Yz8wuDnP8X4Ejrvh/k7Ex3ZP9VgjI+aU5EUj
 zhYl79IK+t9HBCD/Y/t7eLGk7LbXehrar/kIPE9V/Qo8QykhFFIuJUtvm7thUvGpzuFM
 gKbIfhNJVK0k5dfIFlHNYXhdJi/Qk9/8z7fsldrXps4aciG2KJKodlP44jJG0GKx0nBf
 QBv3kpmjCjOeQM14AzT7nhBJToDLwROKNUVSbjZOhegU0VC5W0XcOqVNsiBXXBJrZC2u
 3PCA==
X-Gm-Message-State: AOAM53141kg8Ba+mILip0NwKhTcx/kIb1FYH0C843wDsXK9AJXjyZBOq
 jxDa+nh6qTJ2oYljNPWGVHI=
X-Google-Smtp-Source: ABdhPJz8C1XSHSfMN9i1f3xXNic0zmGfdJdwpqf7v24uy1m3zgtFjeNADWRaTxkMnR0u3C6n71pCcA==
X-Received: by 2002:a17:906:2697:: with SMTP id
 t23mr3491901ejc.292.1604687631594; 
 Fri, 06 Nov 2020 10:33:51 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id a1sm1619624edv.88.2020.11.06.10.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:33:50 -0800 (PST)
Date: Fri, 6 Nov 2020 19:33:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 12/47] dt-bindings: memory: tegra124: mc: Document new
 interconnect property
Message-ID: <20201106183349.GL65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-13-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-13-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:48:48PM +0300, Dmitry Osipenko wrote:
> Memory controller is interconnected with memory clients and with the
> External Memory Controller. Document new interconnect property which
> turns memory controller into interconnect provider.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra124-emc.yaml     | 1 +
>  .../bindings/memory-controllers/nvidia,tegra124-mc.yaml      | 5 +++++
>  2 files changed, 6 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
