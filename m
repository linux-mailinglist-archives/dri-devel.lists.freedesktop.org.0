Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388FB1CE81D
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32416E060;
	Mon, 11 May 2020 22:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CCA6E060
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 22:33:18 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k133so16373540oih.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 15:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wGHbSnsFJYGWuvu1b3WM72Xji0DD4irBuSVt4YkTgKI=;
 b=lqbecVep0iDyZZFmI9kTXILNV6JjHZVGuQksoKXq9cjT4FikC7Of1SHSAIGPYUEpLa
 to+fwFspjxrr2vUPolq9Ku+57PdPXDT9O/o4cAMtG0dJ1lmhHfHXDKM8WiEd1Y1rNWJN
 XRuF+CTgqXDMcpRhGj8BteGOMGyx5DyJOnqFJXagj+KUPfHGqc26rsUUfnukFE72m6Q/
 pWLtJ8yFzCncQUmM8g+B5NdEatvv63dYPB8sRr4PyQMBoacIheOt7YDWND/0rrVt4T7I
 zGoDlzNy0j97ptb9BA+WMQ5anuaGMD83Ph/r8+bgaeqA56LziT+8L44AozJkg0g6B2X0
 2toQ==
X-Gm-Message-State: AGi0PuaJjsylW4Y9smlWPN+vs700guufEcheLrAxanAkNLxD3C6mXGw+
 dZ1nPPE31+Fs+c8ZLZxXqQ==
X-Google-Smtp-Source: APiQypJuI3Zhx/CxBn4qh7KjVcz6okjsSvY5mWX+NLlxANjIA4CVRmtDvBU4eGunbZig8CyjwWfN0Q==
X-Received: by 2002:a05:6808:698:: with SMTP id
 k24mr588483oig.102.1589236397728; 
 Mon, 11 May 2020 15:33:17 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s16sm3989264oij.5.2020.05.11.15.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 15:33:16 -0700 (PDT)
Received: (nullmailer pid 5158 invoked by uid 1000);
 Mon, 11 May 2020 22:33:16 -0000
Date: Mon, 11 May 2020 17:33:16 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/8] dt-bindings: clock: Convert ingenic,cgu.txt to YAML
Message-ID: <20200511223316.GA5051@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-1-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Apr 2020 20:58:49 +0200, Paul Cercueil wrote:
> Convert the ingenic,cgu.txt doc file to ingenic,cgu.yaml.
> 
> The binding documentation has been updated as well. The node can have a
> child node that corresponds to the USB PHY, which happens to be present
> in the middle of the CGU registers.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/clock/ingenic,cgu.txt |  57 --------
>  .../bindings/clock/ingenic,cgu.yaml           | 122 ++++++++++++++++++
>  2 files changed, 122 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ingenic,cgu.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
