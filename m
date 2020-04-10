Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 692AD1A4916
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 19:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EC46E288;
	Fri, 10 Apr 2020 17:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2006E288
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 17:37:10 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n25so2482178otr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 10:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OvsHNilOxSyiwGW3V/imzWzd5sgcwB1R86uU7/0uLTg=;
 b=Jzu/tn6TpXZlU1hPjBVAfmkByQffz/vnoUmpfiVs4WIaqcm+7WjA0PM/VN3Wj8K2Vz
 oRmF9OHi/zG9R16snEZISrA+PSMYsrC/r8Nxj5uQtUx5jzcH+NNMlXEfPMMhEpcornx4
 CLINCYVn5bGy8+0+GS5jADhg4HmUTjNoxdoLoXVOrRZreC3z/Sd6t0kJZeRjndXYbz3f
 cwZj/ppbWS2puWD2kI70YSPn6mlWDe9PcXB6QmeFY/jSD0c0di2ZPQAVbY/OlpapYCB0
 BJjfCkXqXBPDmNjN54YuG+kM0CCkUC14ISYQQeWHpHf9O4oAFfRJpDqc3gMJRDB6dj9K
 68XA==
X-Gm-Message-State: AGi0PuaL7DgcVqSu+5XqXkHg/RwH3oAiH369w/ibDxBroJ8LXi2fibu6
 rDXMq4kBq8SgxT8KeDfemA==
X-Google-Smtp-Source: APiQypL0WB5tGIuunT3qritEJX9PvG/EVqigMCAxoki77FmP/HPVGri3fzYS6+Bezx2cJ8PtdYYb+Q==
X-Received: by 2002:a4a:9cd8:: with SMTP id d24mr4988155ook.84.1586540230111; 
 Fri, 10 Apr 2020 10:37:10 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.cgn.spcsdns.net.
 [99.203.29.27])
 by smtp.gmail.com with ESMTPSA id d3sm1480526oth.81.2020.04.10.10.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:37:08 -0700 (PDT)
Received: (nullmailer pid 30639 invoked by uid 1000);
 Fri, 10 Apr 2020 17:05:13 -0000
Date: Fri, 10 Apr 2020 12:05:13 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 01/22] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
Message-ID: <20200410170513.GA30556@bogus>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330010904.27643-2-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Mar 2020 04:08:43 +0300, Dmitry Osipenko wrote:
> Memory controller is interconnected with memory clients and with the
> external memory controller. Document new interconnect property which
> turns memory controller into interconnect provider.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-mc.txt          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
