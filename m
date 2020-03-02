Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A484817682E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 00:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BCA89875;
	Mon,  2 Mar 2020 23:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5E789875
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 23:29:43 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id j14so1162193otq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 15:29:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bL4crR0QltZVzCb64PaSDViplJhkuKW5x/Yz6zKqjUM=;
 b=dHDCq2Gs4urV3oYFuursmiDl3qlh3Zyk84ApbK1IqYoh7OrE7jJVEDnvPwNDvMVAZc
 +dBU98KM3TDbYAGXtCIN+G+PMGEkX0KG0zeR09OUd/8+fu57pcYyMY9r/4xQtU0Ul3gD
 CfbPRjaa+VF0seSImPN6v6UrW0HEzQXGsZZZCU/7bPII7u27cQbiTaMgFNOCjWmP6dPa
 TllHhXt2eH04sln9qNa/PhxR7Iiby/dgSw5gIYK42JpVyLiOonO7dZk1o7GYcrNTfSYE
 kWvua7AbtoJ98UQyGkfSq9QlpLifXFqVNt2ELyI91EUzuYLjtL76IwQiuRjOX2Og/V8Z
 IRdw==
X-Gm-Message-State: ANhLgQ1mxujNERZ+Zg+t9rlepxInIvGfuv4jtaScxmO3K7NLdYz9xSlf
 nFH/BnAGVy6ka3dS9uSVPw==
X-Google-Smtp-Source: ADFU+vuIYp3sLPsyMdTfFaP1I6L8Bzm3bqP7VA7nzk6Wvk1TBOMDG6BACKkVaDwUxNRMG3Vc8bts9Q==
X-Received: by 2002:a9d:6446:: with SMTP id m6mr1232961otl.122.1583191782350; 
 Mon, 02 Mar 2020 15:29:42 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m23sm3437121otq.37.2020.03.02.15.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 15:29:41 -0800 (PST)
Received: (nullmailer pid 5546 invoked by uid 1000);
 Mon, 02 Mar 2020 23:29:40 -0000
Date: Mon, 2 Mar 2020 17:29:40 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v11 3/6] dt-bindings: display: mediatek: dpi sample data
 in dual edge support
Message-ID: <20200302232940.GA5490@bogus>
References: <20200228081441.88179-1-jitao.shi@mediatek.com>
 <20200228081441.88179-4-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228081441.88179-4-jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Feb 2020 16:14:38 +0800, Jitao Shi wrote:
> Add property "pclk-sample" to config the dpi sample on falling (0),
> rising (1), both falling and rising (2).
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
