Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CC219A0CF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 23:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A73489467;
	Tue, 31 Mar 2020 21:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8DF89467
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 21:30:20 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id t11so20992467ils.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 14:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hgde7gIab0A9AJlPfRAbxdOzxdpC6QBuQyWWHDDG1s8=;
 b=QTqZ81SuI2ld8YkGk4mwnGcRv4EcGKYDIeYJWdvPg96qPvEqBzq+76ZpMlHDQEMOcz
 mR8L/E5rtsvRuC62hqFxT1zcKfOjvtpPZv/679PtlcTqFCSBiEQT5hj7SZwz33jr0UI2
 Kec3zaUUiPxDGQVFW+muQ54H7rkCJajOP7bL6BYKBjwVP8IozHdLekCBD9lxP9k+UPsK
 F/3TRPGSyEqE0Uysv4y1GRGWnk7e39ZKqgvWDSV4WszyMT22S9mmTrYusopvnDac66O/
 vAkuVhudx/I04U26MIZBvhAWMJ0Q3bUvbRZnpN8WgVNGREcibjN9JiJjfnIa7mvMqtt7
 TMow==
X-Gm-Message-State: ANhLgQ0hGFADnA1n0n4WLF71CJW9pG5dS3MuokdCofwPCAE2S6+dvRxk
 inpv9werX2PO5kx6sF5//Q==
X-Google-Smtp-Source: ADFU+vu1BYo0UPKQXSA6GKj/6abEkzFRO5nrM14lwT3cYsl1D0tV1MA1I6gmRcQjxC2STIxV/8Y8gw==
X-Received: by 2002:a92:8f81:: with SMTP id r1mr18614381ilk.51.1585690219360; 
 Tue, 31 Mar 2020 14:30:19 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id q17sm23336ilk.48.2020.03.31.14.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 14:30:18 -0700 (PDT)
Received: (nullmailer pid 32705 invoked by uid 1000);
 Tue, 31 Mar 2020 21:30:17 -0000
Date: Tue, 31 Mar 2020 15:30:17 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: convert rockchip vop
 bindings to yaml
Message-ID: <20200331213017.GA32448@bogus>
References: <20200325103828.5422-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325103828.5422-1-jbx6244@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Mar 2020 11:38:27 +0100, Johan Jonker wrote:
> Current dts files with 'vop' nodes are manually verified.
> In order to automate this process rockchip-vop.txt
> has to be converted to yaml.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> Changes v4:
>   Change description
>   Replace compatible oneOf by enum
>   Change interrupts description
>   Remove resets minItems
> 
> Changes v3:
>   Change description
> 
> Changes v2:
>   No new properties
> ---
>  .../bindings/display/rockchip/rockchip-vop.txt     |  74 ------------
>  .../bindings/display/rockchip/rockchip-vop.yaml    | 124 +++++++++++++++++++++
>  2 files changed, 124 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
