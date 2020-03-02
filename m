Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EA217685B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 00:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93256E27F;
	Mon,  2 Mar 2020 23:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAD66E27F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 23:40:26 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id r16so1110332oie.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 15:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9vV5PavoKMjDsMnqHBiR5ea2gdjD5MmrYM/2QvxafIs=;
 b=UQmxpMQCtJAuFsGjrzZ1wi2pgxZEOdq8bs6c7lQdLQTFIUbXAlhjQGv9FF6ILTjsy4
 ybqyKj0+vycIQSw2ZT2HhnzPeV/4jWJk/69ekRlXNQb0OEwtfi53WDEplSh/qNzRI9Xv
 IlkxYDLJWa1zZ0lRJlnUCEhyoQg0aZePnrjZ3BUIEgceR/GtXfMwBXINkY4BU7715X9u
 ipq7BEx0QQ7EG2AKV+yMVT1ec+BJ5vHjb7VhSvcAH8RcbobXsgKyNZ7P+88VkxqjeMcN
 qd055na1RYCkGEvrXqJj4aJrEzOqjwwwdKb0YKxKNfeb8CXuyh3ZOFlV+wJjAa8CKEvs
 PbRg==
X-Gm-Message-State: ANhLgQ3ocbGfeVDiVeUqFlgeAca/FrEc1FMyM/gvC0YVuk+izgxeZQ66
 d4rvpKu2wunItUWRKl3HXQ==
X-Google-Smtp-Source: ADFU+vtgcYVuJTNmsDp6or+nYg6nhWTDc+Rs/i0JWWu7H1wds1V1X0/hmCpu4JSt66QSVVmXpfJv+w==
X-Received: by 2002:aca:c709:: with SMTP id x9mr609649oif.130.1583192425557;
 Mon, 02 Mar 2020 15:40:25 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j4sm3556682otr.30.2020.03.02.15.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 15:40:24 -0800 (PST)
Received: (nullmailer pid 20489 invoked by uid 1000);
 Mon, 02 Mar 2020 23:40:22 -0000
Date: Mon, 2 Mar 2020 17:40:22 -0600
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v11 2/5] dt-bindings: mediatek: Update mmsys binding to
 reflect it is a system controller
Message-ID: <20200302234022.GA20424@bogus>
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-3-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302110128.2664251-3-enric.balletbo@collabora.com>
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 sboyd@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  2 Mar 2020 12:01:25 +0100, Enric Balletbo i Serra wrote:
> The mmsys system controller is not only a pure clock controller, so
> update the binding documentation to reflect that apart from providing
> clocks, it also provides routing and miscellaneous control registers.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
> 
> Changes in v11: None
> Changes in v10:
> - Update the binding documentation for the mmsys system controller.
> 
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> 
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt    | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
