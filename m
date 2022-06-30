Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABAC561F0C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 17:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B608B10F033;
	Thu, 30 Jun 2022 15:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5716910F200
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 15:19:39 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id w10so12613306ilj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 08:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ADsvCR0mog9Wctcf3viijqLXbCb8A/ISSb9KkaYOBcQ=;
 b=8Ryr30xGzkhbIHhBtpBocl9ge8s8mfNvxjUOf1Tszcxa10UhyIAZT5/k+Gvl/6VnvE
 KaXuJHLt1KrnumpzJpWzY1d/IKTQTdfkdRd4HtBqD3lWJSPs89aJBgXnOzYOGNvAJBOe
 ovnqO/IS+2l9mbq/q+Pc+AFWMhT5EuznHpJHWWy+ZivulCOr6hzWGILFG5Aky17mlAaV
 G2Il8O4/IUahSVFDuw/74zzH9wZW3BK60wSkdXZuw8vnVxlJO92zrMlSBbFwoAgfshC1
 Ykz237o+Ro9xs9ivF+TtT2xgrJBLDEJlEJSZNAladec1VQBBqjQXsttqVFhQkywZzrV+
 cKYw==
X-Gm-Message-State: AJIora95lFafR0F4Axip8hfW1JcqzBGSJclnvOwu7pOrEsdsv743Z6/h
 daCaFW4XK3ssOC36YgK9CQ==
X-Google-Smtp-Source: AGRyM1syNumhIZ9i8WZw9tGrKUzdzJYR0RUCc8u+zCX5QaXsZAZPAG6uCSOCyYG4AF4BzG+LxuqWjA==
X-Received: by 2002:a05:6e02:b22:b0:2d9:2bda:34e9 with SMTP id
 e2-20020a056e020b2200b002d92bda34e9mr5615211ilu.273.1656602378655; 
 Thu, 30 Jun 2022 08:19:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a02c853000000b00339dfb793aesm8731583jao.86.2022.06.30.08.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 08:19:38 -0700 (PDT)
Received: (nullmailer pid 2729118 invoked by uid 1000);
 Thu, 30 Jun 2022 15:19:36 -0000
Date: Thu, 30 Jun 2022 09:19:36 -0600
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v7/v3 00/22] Host1x context isolation / Tegra234 support
Message-ID: <20220630151936.GA2722229-robh@kernel.org>
References: <20220627142008.2072474-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627142008.2072474-1-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 27, 2022 at 05:19:46PM +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Integrated the Host1x context isolation series (patches 1 to 8) and
> Tegra234 support series (patches 9 to 22) in one email thread for
> the benefit of automatic testers.

And probably to the detriment of tools looking at the version number 
like b4 with the double version. Don't get creative like this.

Rob
