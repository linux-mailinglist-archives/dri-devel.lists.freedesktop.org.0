Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B846E2A8788
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 20:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858F96EDE2;
	Thu,  5 Nov 2020 19:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BE16EDE2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 19:48:46 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id g19so2537231otp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 11:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U3AlClqo4zPa2hQPAiQZhyszXRgNsf8T2hjWUGDP4o4=;
 b=mUz42M8S3+hJwDLhBSnvRm96HkH6rK4B/5w4P4gLzM96KoNcus1w/zW6mxxeC32cJQ
 5q5FwGEjCaXzJSmAGfoRaKdO2ykvwtp+kmDVTwIKU6NYEfAwB/OMFsrbXNMSG6V+EPBI
 jGRRBo0GLiO54l89RImvvRb/aSgObvR4I/xrS7T5PbKa61Bha7Fq+TEf3Q7QIdNYZgV4
 0uGrAms+bAM7TAJPBQctavX78uDoXqdi23QbKho8ae8yasJoZcrLN9FsZLeHM4cD9ORg
 AOQGXCpDGt7MKUJ2g/JYBG7jzdGzIKyIZXCj6Ck3XAGfODGwbmVj1xE7qopeM3BJcay5
 H7kA==
X-Gm-Message-State: AOAM5313ZHs8cIabFpawy+iZJanxStudjaHgkKPUtmg5vu36sG6X406a
 lmQlpl+Mgp1EMb8n5qBkSA==
X-Google-Smtp-Source: ABdhPJzRzA3D64elj+tDd0ByzlwywJPSGiowQOvdrEbTMVjqHpwNJiFwtb6dVDRuPY1Hq6DQ3xc0yA==
X-Received: by 2002:a9d:1727:: with SMTP id i39mr2629158ota.96.1604605726134; 
 Thu, 05 Nov 2020 11:48:46 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d22sm576191oij.53.2020.11.05.11.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:48:45 -0800 (PST)
Received: (nullmailer pid 1701068 invoked by uid 1000);
 Thu, 05 Nov 2020 19:48:44 -0000
Date: Thu, 5 Nov 2020 13:48:44 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 08/47] dt-bindings: memory: tegra20: emc: Document OPP
 table and voltage regulator
Message-ID: <20201105194844.GA1700597@bogus>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-9-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-9-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 04 Nov 2020 19:48:44 +0300, Dmitry Osipenko wrote:
> The SoC core voltage can't be changed without taking into account the
> clock rate of External Memory Controller. Document OPP table that will
> be used for dynamic voltage frequency scaling, taking into account EMC
> voltage requirement. Document optional core voltage regulator, which is
> optional because some boards may have a fixed core regulator and still
> frequency scaling may be desired to have.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra20-emc.txt    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
