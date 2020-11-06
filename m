Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE262A9C83
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5682D6EAD3;
	Fri,  6 Nov 2020 18:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1656EAD3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:39:18 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id b9so2259599edu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:39:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u98Rgpeb4Nt49mc0QG8eEb+MB+Za9caOVTHP5k1gxr0=;
 b=czSliFnhdBAJfWGOqPm+1hCn0kldJFdUshfKFt3+af62AjIriUR0v+gpveplYu4HQ6
 /tPCEK5X4U+Ij3PzKqGjpwaKUR/XYK7opWD9LrQDRNfwhvWJqZMaHEnQoWSiSyhTlkQp
 3ETIK1bBdbS6bEmKVvZoLouxZsl19gPshBPoZ4g4/ogDwW/KZ90x8Wvw1dlhjVN9BU35
 aP+D+XIw0cwQjFR1jFX+Um+aoPgN88rZPNOrYSORh1nF1N9DwAWOp4a//HRlB8f2T8dS
 dvZ4/N9vV0r16cx3N/ycmmaqW7E4Dz0KA9m9pewIWgMl7PzVW3RW8fndLpNydSHro6Zj
 GzfQ==
X-Gm-Message-State: AOAM530hg0P+5zwdpZSPP2PdIhixk81NuchMwjTTfmvwdFEr0hvS/D/T
 E5uLBHZ2W+hDdxMvDwSYbvM=
X-Google-Smtp-Source: ABdhPJxFr3F7asxGB0TOnmt+HUoticWJ2aCBZMi5JRtZ1kzSkCobKCu6kfaAs8KEsD4jnGtxvOiVsw==
X-Received: by 2002:a05:6402:559:: with SMTP id
 i25mr3576305edx.128.1604687957598; 
 Fri, 06 Nov 2020 10:39:17 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id j20sm1588358edt.4.2020.11.06.10.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:39:16 -0800 (PST)
Date: Fri, 6 Nov 2020 19:39:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 19/47] dt-bindings: memory: tegra124: Add memory
 client IDs
Message-ID: <20201106183914.GS65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-20-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-20-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:48:55PM +0300, Dmitry Osipenko wrote:
> Each memory client has unique hardware ID, add these IDs.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/memory/tegra124-mc.h | 68 ++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
