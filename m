Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330C91A8DE8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 23:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB2C6E27F;
	Tue, 14 Apr 2020 21:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0AB6E27F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 21:44:35 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i22so1269363otp.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 14:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1rbtN7N+ptVDeQQdbAIqZEIk2V0QAROfk/PV0WHMjRE=;
 b=ldFjwF+M+HuLchmjiIC7LPmVXWCsNLIIoxtgPhBaLGjDJ8TXAY1814iM81PxqpSZA4
 JBoiXX37REK4Xx/1TqbS1WcO/KUZB4lblhLAJAtff2h8/IuuktokmcNaPm5wNA+nf0+u
 9Ui987hDNEM9SzTzUCCZY8oInf/bAXZgVgrz8p/M28JPuHJOU8zmaUXBeEMzjvgczSZr
 JJNGfy/oyT2oQiuv8TUwTWzRT3KIZ4ZxXwAiVo/lm0dfZ+5P/mFXYDCBt9sriC4eAUO9
 OkfPfgZlMQvCGgctqcqJW0QMGxf3HnkODX4FTk6qWG41+aGKEZu632DqPpbAUBBk3hYq
 jyYA==
X-Gm-Message-State: AGi0Pubp12os18OlNyjprhPtqro5zNieuAE6Es9gN6KOUE12oQT8qls0
 TUEFtzn0dzw0DPPg1BGyNA==
X-Google-Smtp-Source: APiQypL96hB6UYPUf5qDgTbGQ//SKC8rB0d/g8MUB8WJ16O3Kia4xlS7p8LgovR0p7mxbY0QwQJLCw==
X-Received: by 2002:a9d:3988:: with SMTP id y8mr10467743otb.352.1586900675157; 
 Tue, 14 Apr 2020 14:44:35 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r67sm5788491oie.19.2020.04.14.14.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 14:44:34 -0700 (PDT)
Received: (nullmailer pid 10522 invoked by uid 1000);
 Tue, 14 Apr 2020 21:44:33 -0000
Date: Tue, 14 Apr 2020 16:44:33 -0500
From: Rob Herring <robh@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: Document the Synopsys ARC HDMI TX
 bindings
Message-ID: <20200414214433.GA10013@bogus>
References: <20200414144402.27643-1-Eugeniy.Paltsev@synopsys.com>
 <20200414144402.27643-3-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414144402.27643-3-Eugeniy.Paltsev@synopsys.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Apr 2020 17:44:02 +0300, Eugeniy Paltsev wrote:
> This patch adds documentation of device tree bindings for the Synopsys
> HDMI 2.0 TX encoder driver for ARC SoCs.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  .../display/bridge/snps,arc-dw-hdmi.yaml      | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.example.dt.yaml: example-0: 'hdmi@0x10000' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.example.dt.yaml: hdmi@0x10000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'

See https://patchwork.ozlabs.org/patch/1270389

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
