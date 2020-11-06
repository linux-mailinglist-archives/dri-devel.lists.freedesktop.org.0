Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C79B2A9C25
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6356EAC7;
	Fri,  6 Nov 2020 18:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841546EAC7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:30:17 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id oq3so3238285ejb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:30:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HBwnRJAwBgSO7RnER97hOPywzds5kKgLbwT3heQfB54=;
 b=Th4Wjs91ShbC6mndxFSAFQ+EgHCZzoVwAKMQRHU1WERVUr8yEiNNzNSe+rK9odo9lh
 3hSG58tuUbxY2rkYxeOfe+upcamsQsz1jcrgr/ZPAPPM1PZfM6pq0iQVf9z+xnSv32jY
 glhp3jSUWc9jA2ffliE33TQKtdy861OsI/4M67yDBUyS0krNpZixQYDUYFWs/mja6xc+
 a1uTmIB5N95m4D6llY3uMlaWhC2ZFu7nRVF40lwUwIr/zwGknqKfVF7rV7DtRGy4jrvZ
 NnqZR7H1rf9WBBvnJBaZeVtUP3slDSvYvwQu26yL2Ls3Ml+r9uJuqXDSVuir0XZsRO+S
 kkyQ==
X-Gm-Message-State: AOAM530ouz07DCjC3q8GsiQvSd5qFGe408UlOyU6Fjt4sou910g6CTz5
 wiA5tQ3rOUwTtOUdiAGXwUg=
X-Google-Smtp-Source: ABdhPJwWgQOr4L+1v8Kqs30glduzQppkT27qtp6w9QSMRlqfDwHixdijnPXdR1P1E4UtW3MJyuNI0Q==
X-Received: by 2002:a17:906:1e08:: with SMTP id
 g8mr3293305ejj.358.1604687416196; 
 Fri, 06 Nov 2020 10:30:16 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id 11sm1463580ejy.19.2020.11.06.10.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:30:15 -0800 (PST)
Date: Fri, 6 Nov 2020 19:30:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 06/47] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
Message-ID: <20201106183013.GF65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-7-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:48:42PM +0300, Dmitry Osipenko wrote:
> Memory controller is interconnected with memory clients and with the
> External Memory Controller. Document new interconnect property which
> turns memory controller into interconnect provider.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-mc.txt          | 3 +++

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
