Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF23680A905
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFBC10EAB8;
	Fri,  8 Dec 2023 16:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF2610EAB8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:33:37 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6d9f7b3de20so121248a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 08:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702053216; x=1702658016;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9GKuWGx0JJFRVK4jl2gAQwDPO2YGwHUxaXRf8Tzo4vI=;
 b=Bs8E6Qda18SSa/8h/zqFyJCEwVCDBu3x/FV+nciuQOWr9A2USEAml2w/t3zo+POJIy
 a45Qf3Hh3A1oVByD4FXDcjAYA8hLUqOPrNJdxwLUdlCC2iYj1ctKmDakqH5JfxWNdxaS
 3lG1CAgVJdy93EJ4ZEXTR32oZqT+xI+YxanknNpezOFWffflGRAaTaZQhADHQfea5QpV
 EsZzKms/DJ5be5Xue2HlkpA6UrdUmGW/DP2o8F9Y73OSGo9jQqNM4jPDAd28Lt611P7W
 v8n41VAGv+yXc4Q3OcTOHtplxdKzrwoyywUrySfv7me2B8sfBbWwKhI6WmVeU3lHQnGw
 0UOA==
X-Gm-Message-State: AOJu0Yxb1m4Te1t3UuuMl+HQv5cvgb9gAwKBe29XJdDgfA8WzxMyxJUb
 xbQvg7pBH4xLYaNUkaqf7w==
X-Google-Smtp-Source: AGHT+IGJgyPhFszyyuv/ahTq9jCGY/uMbNvjsmemLXOK2SmMafrlPlw/OCBI/pVSJYLPRtpk1/ZBmQ==
X-Received: by 2002:a05:6830:1e75:b0:6bc:8930:a1d4 with SMTP id
 m21-20020a0568301e7500b006bc8930a1d4mr300120otr.15.1702053216777; 
 Fri, 08 Dec 2023 08:33:36 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i2-20020a9d68c2000000b006d3161e612dsm346476oto.30.2023.12.08.08.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 08:33:36 -0800 (PST)
Received: (nullmailer pid 1696654 invoked by uid 1000);
 Fri, 08 Dec 2023 16:33:35 -0000
Date: Fri, 8 Dec 2023 10:33:35 -0600
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [v3 1/6] dt-bindings: display: Add yamls for JH7110 display system
Message-ID: <20231208163335.GB1659919-robh@kernel.org>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-2-keith.zhao@starfivetech.com>
 <46ad8c2b-5be2-4cfd-b771-a8d95a5b5d8f@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46ad8c2b-5be2-4cfd-b771-a8d95a5b5d8f@linux.dev>
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
Cc: devicetree@vger.kernel.org, Keith Zhao <keith.zhao@starfivetech.com>,
 krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 xingyu.wu@starfivetech.com, jack.zhu@starfivetech.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, mripard@kernel.org, tzimmermann@suse.de,
 paul.walmsley@sifive.com, shengyang.chen@starfivetech.com,
 linux-riscv@lists.infradead.org, changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 08:50:29PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> 
> On 2023/12/4 20:33, Keith Zhao wrote:
> > StarFive SoCs JH7110 display system:
> > dc controller, hdmi controller,
> > encoder, vout syscon.

[...]

> > +description:
> > +  The StarFive JH7110 SoC uses the HDMI signal transmiter based on innosilicon IP
> 
> 'transmiter' -> 'transmitter'


Thank you for reviewing, but please trim your replies especially when it 
is only 1 line reply in the middle of 100s of lines.

Rob
