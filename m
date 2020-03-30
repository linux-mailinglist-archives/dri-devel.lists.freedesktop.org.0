Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E14019883C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 01:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9956E4D2;
	Mon, 30 Mar 2020 23:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD35B6E4D2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 23:26:22 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id f16so17632445ilj.9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 16:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LF85p8LiPrHnow4L9TnXbCTs4I8jEbhzC11j8ciLyRA=;
 b=PlDNMyV0UuvX6wEAN1xHmf7plhBEYlKBkWCUPaB3xaRzP3u9NxzHKraLFdK70+z54/
 f3tkfz1jhhBvBI75B1HpGTSh3KwK+FxiJT+6WWHqfYvnCOwjYsM46f4y7LROIETOtEqG
 kTftha9gcYOWl+Y1eJjeEe4CVJWJ76V581yZUI6aReQfCor5gGwK/PO6jivqQ8Hg7Mvr
 PYbrDHXU7loXGQmvHD+ZXNpmpMnKEnjJY0VG17rg8by65ahFlf7s6uWY8aIoU3AMhRs2
 Q3f5YlDnwWrBZpypzvSe7gVsPBJs74eDuQri+ajAMjEELHTHzv1sB7p0Vi2V6LyjTPMs
 /Org==
X-Gm-Message-State: ANhLgQ2/n+tAlFv0muAKTbGnKvh5yQooScW7WYHaLtNZm/0wGlWsdwwm
 aeNDjTqEZmbXGf2VQ2GsfA==
X-Google-Smtp-Source: ADFU+vtmhUYjMudehiqJmBH9H7jMSe35T5HDRBtsrnXGGftWUwlBk2mhZTwgUl3I5g5TpKH+1HO0bA==
X-Received: by 2002:a92:8410:: with SMTP id l16mr13898715ild.288.1585610782197; 
 Mon, 30 Mar 2020 16:26:22 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id j84sm5352015ili.65.2020.03.30.16.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 16:26:21 -0700 (PDT)
Received: (nullmailer pid 25295 invoked by uid 1000);
 Mon, 30 Mar 2020 23:26:20 -0000
Date: Mon, 30 Mar 2020 17:26:20 -0600
From: Rob Herring <robh@kernel.org>
To: Pascal Roeleven <dev@pascalroeleven.nl>
Subject: Re: [PATCH v2 4/5] dt-bindings: arm: Add Topwise A721
Message-ID: <20200330232620.GA25242@bogus>
References: <20200320112205.7100-1-dev@pascalroeleven.nl>
 <20200320112205.7100-5-dev@pascalroeleven.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320112205.7100-5-dev@pascalroeleven.nl>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, Pascal Roeleven <dev@pascalroeleven.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Mar 2020 12:21:35 +0100, Pascal Roeleven wrote:
> Add the bindings for Topwise A721 tablet
> 
> Signed-off-by: Pascal Roeleven <dev@pascalroeleven.nl>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
