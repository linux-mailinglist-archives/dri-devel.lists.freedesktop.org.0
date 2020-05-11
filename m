Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F231CE82B
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B656E5A0;
	Mon, 11 May 2020 22:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B706E5A0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 22:34:48 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id t3so8961479otp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 15:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eEYJO787L4hFdfVmppGJoURsIfu4v30oXYj733amcm8=;
 b=liOtpkAfPJBbsGnRf/a0clyOchU8zK/UU3eFcgvsrxh54CKlyP+tlqVKepez+p/zqf
 s+OA24WPmwOljenRnWR1LMHIOcCIpjqNTBEV/3kBAJORtWl7DjFphg5uCsLC3IJt/8Vb
 8PL/QHbgPXxnZpzNHme+7cWnihBB65H7SdWx4hN5g7vUMLHxfFkxxsx4zbBC95kafOVR
 TLoCOTByKdhNpiLR0e5VZ5H87JD3YA9mbkP8xrBuJv7G7bP32y9odYPcdSXW3HZZIFGX
 qf5fHGzM6w3X033njWKVsmWudu2PzpDIGuELoq+lnfgCefTfV8K4Gyd+PeG66sc8FDPc
 63mQ==
X-Gm-Message-State: AGi0PuZtMf491tBtS+U5wWDyu0bVKI0dHW6nPzcp1zpwuE61//6N4iee
 RfEDlxCgoD/9pqz6cdCV9A==
X-Google-Smtp-Source: APiQypLtT/X05M8l7zBdEA0gsanAJHzjfh1Fbw4ZKIwZebB4QlF353Lej8+d2MpNzUXHB7tUhCMpfA==
X-Received: by 2002:a9d:6ad0:: with SMTP id m16mr13613165otq.122.1589236487268; 
 Mon, 11 May 2020 15:34:47 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n23sm1231572ota.37.2020.05.11.15.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 15:34:46 -0700 (PDT)
Received: (nullmailer pid 7417 invoked by uid 1000);
 Mon, 11 May 2020 22:34:45 -0000
Date: Mon, 11 May 2020 17:34:45 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/8] dt-bindings: intc: Convert ingenic,intc.txt to YAML
Message-ID: <20200511223445.GA7357@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-2-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, od@zcrc.me, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Apr 2020 20:58:50 +0200, Paul Cercueil wrote:
> Convert the ingenic,intc.txt doc file to ingenic,intc.yaml.
> 
> Some compatible strings now require a fallback, as the controller
> generally works the same across the SoCs families.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../interrupt-controller/ingenic,intc.txt     | 28 ---------
>  .../interrupt-controller/ingenic,intc.yaml    | 63 +++++++++++++++++++
>  2 files changed, 63 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
