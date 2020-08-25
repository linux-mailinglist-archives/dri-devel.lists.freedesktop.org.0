Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A20250EB6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 04:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E022C6E82A;
	Tue, 25 Aug 2020 02:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2546E7F1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 02:09:50 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id g13so10891210ioo.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 19:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p24wmINxw5ACsrgiOLfq84gw2srTWDcxVk5SINBeDzc=;
 b=RFk9snLz8BmhcM2rcB/NpKYEAYYRWkISCySbLicpLHdzo3U2kPs6BxSvb5Mv7iQ2hr
 vmjEurXwaFUi9w5XYlm/OQTSEgP3tysiZWCbbdTBgcfpZg42ynk9mlyVjysT05AU3hAm
 8WwUIqXqYxtcONre/fHJhlMybKH8qN7Bque5H55GBXB5H7+oL5AaRcyAUwBaoPGwGhgF
 81u8gFHTsmbu5Iqq4V8u6xNIUr/4Pv8ZZf4E2oJZEenoKeEL/Xorm2UtOpzG66G5tErE
 kKD7LnX62Y1cK/+bdxqjGsNBtwzG1OmgPzZ+dmleqvyVkje2MrQcqL43vAl0inuGrN8b
 lXeg==
X-Gm-Message-State: AOAM531AFAp4Xm12+G9hBzpV82PT+tFhZIicBBWAacvBevFALZOggO9m
 qMYPCjx/H8/sjy+fAvTM8ZhJB1XMqM7H
X-Google-Smtp-Source: ABdhPJyR64UEBk7XMJS3xaNhsQOHAvXTybO+KgsxIlNUDqaIOvnKq7x6Bf0G/VyGmP353HDAmwZHfQ==
X-Received: by 2002:a5d:88da:: with SMTP id i26mr7193353iol.158.1598321389515; 
 Mon, 24 Aug 2020 19:09:49 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id r9sm8205705iln.18.2020.08.24.19.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:09:49 -0700 (PDT)
Received: (nullmailer pid 3789123 invoked by uid 1000);
 Tue, 25 Aug 2020 02:09:45 -0000
Date: Mon, 24 Aug 2020 20:09:45 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 22/36] dt-bindings: host1x: Document new interconnect
 properties
Message-ID: <20200825020945.GA3789072@bogus>
References: <20200814000621.8415-1-digetx@gmail.com>
 <20200814000621.8415-23-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814000621.8415-23-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-tegra@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Aug 2020 03:06:07 +0300, Dmitry Osipenko wrote:
> Most of Host1x devices have at least one memory client. These clients
> are directly connected to the memory controller. The new interconnect
> properties represent the memory client's connection to the memory
> controller.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt   | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
