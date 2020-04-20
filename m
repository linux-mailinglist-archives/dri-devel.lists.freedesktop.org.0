Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179BA1B15AA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 21:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1538D6E851;
	Mon, 20 Apr 2020 19:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF146E851
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 19:15:25 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m18so9127944otq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 12:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/E8gPmAs5q5j5c6IF7Y5E5C7JdeQS0MYhxEcRGnaPxs=;
 b=PDX8/V8hBnbS4ghyljnzlQQ8S6rBliPmrZyJVTCJyqZl02/wp3uhLLXHmL7AyHbs/O
 Gbabqw1snDjqeILRWfgq2uz766WGQ9HLhZSYLRYIEMgqvUjiCrQ9gNxb7Vqo0vYPSEa1
 TdJg7NjfN0LIJdoM9iTcLDWCLLYXjXMRZnXdCw1Tu0/AZFaBi7p6mHyRTno5vve8O6cV
 eEBjR1cdBHMy/3HksmqsVdq97Ss6IJC1ZAhxiuBS7ZmELJTFV6rfw8xCfwJltdbemDhY
 42nchZzAD7HbCU3W+iLVyt0QJaFl7kzDouPku8+rNWPAikmfsxZFzc1JmnFsJjEnHftJ
 KPBg==
X-Gm-Message-State: AGi0PuZRbuXixGUMS8AouwX68hnrd/wImCn+6dZC49+2tGh2/SejPcDh
 +Hqi0SCJg1FIysENGQZ3dZxrUMI=
X-Google-Smtp-Source: APiQypK4KWrrROkD5Z7eemFuC8Y5bdOwXzixxByT6sDywR+zGy0AuTzZVDCA0mXYc0mjjBP9d9R3jA==
X-Received: by 2002:a9d:6a98:: with SMTP id l24mr10442730otq.133.1587410124253; 
 Mon, 20 Apr 2020 12:15:24 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s13sm71633oic.27.2020.04.20.12.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 12:15:23 -0700 (PDT)
Received: (nullmailer pid 3203 invoked by uid 1000);
 Mon, 20 Apr 2020 19:15:22 -0000
Date: Mon, 20 Apr 2020 14:15:22 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v5] dt-bindings: gpu: mali-utgard: Add the #cooling-cells
 property
Message-ID: <20200420191522.GA3122@bogus>
References: <20200411165700.1576314-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200411165700.1576314-1-martin.blumenstingl@googlemail.com>
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Qiang Yu <yuq825@gmail.com>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 11 Apr 2020 18:57:00 +0200, Martin Blumenstingl wrote:
> The GPU can be one of the big heat sources on a SoC. Allow the
> "#cooling-cells" property to be specified for ARM Mali Utgard GPUs so
> the GPU clock speeds (and voltages) can be reduced to prevent a SoC from
> overheating.
> 
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes since v4 at [0]:
> - Added Qiang's Reviewed-by (many thanks)
> - re-send because I missed the devicetree mailing list in v4
> 
> 
> [0] https://patchwork.kernel.org/patch/11448013/
> 
> 
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Applied, thanks.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
