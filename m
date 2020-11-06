Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6172A9C29
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E696EAC8;
	Fri,  6 Nov 2020 18:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D2A6EAC8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:30:43 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id s25so3256402ejy.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LGNdf9QrireIvWZa+KriZNBtoGagpUWNerj0S6Na9/8=;
 b=F6ohr5NEvCQBEb1Mm5xUPQeh2J2OZgSQbwvn7R1l/dG40SBJjOz2RLvVN6A0s1y5oF
 cRTrhYO9uBln90Qgi9+bdanHZqj86uTG9LjWoZt3XrftKj6+1o4kJalk83MmhkMwe874
 nwn5QDRV7tf2RtHmqd+JzWdkXFqEab5uG8cCahhFXczvbl4+ACaAwjg1IQ0zY6Tqg0oz
 w616uE9Mk80T7yVk64EXOXwT9Hf1PJIFuUo1eidBhEHw7dGzDmVWjOOSvQWTs1ZYprYE
 KYeSD+2yXczzdQWeWRfZcJDczgx0GjyWOeLVEFzj3/Q6mxE/20lFZuZetwUBdPe+CiAX
 IEXg==
X-Gm-Message-State: AOAM5323Chs/gUhESlWq3zwc+gpEo4zz+qmlDPzPuVUk/D4pIR3K1ZS/
 X3N18cuvQ3LvfivoY9FUODg=
X-Google-Smtp-Source: ABdhPJy6k9N/Bpoe9hw4KBNy8mWyB7R8cTN/EwjyvcQpQntkEHkgEQ7Wvpsqm/uxCbuGPdQbauDOEg==
X-Received: by 2002:a17:906:86cf:: with SMTP id
 j15mr3334965ejy.260.1604687442427; 
 Fri, 06 Nov 2020 10:30:42 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id v11sm1473235ejj.123.2020.11.06.10.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:30:40 -0800 (PST)
Date: Fri, 6 Nov 2020 19:30:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 07/47] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Message-ID: <20201106183038.GG65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-8-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:48:43PM +0300, Dmitry Osipenko wrote:
> External Memory Controller is interconnected with memory controller and
> with external memory. Document new interconnect property which turns EMC
> into interconnect provider.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
