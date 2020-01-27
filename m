Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E90514A602
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 15:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E481E6E516;
	Mon, 27 Jan 2020 14:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4D16E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 14:27:19 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id z64so6800926oia.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 06:27:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ex/Vz3wX/g9HFdy28JpEbqVZXRZ73mjVXy3JN9csMIU=;
 b=KBEntWIzodi3Yy7D78TnvZa+TUn7ZS2KW6iqdFYq8IQLyN2n4BPKQvnMjktcD5XdOZ
 01QisSGFQ02yEZUyt383DAKbaAJ3XDTNSRLjiXOq/t4vbzHO6zhyoFW0vGJQDPDkJD2E
 pM2xcc4x/tr5oUegovU/3mIUkpKhiDAYRPI92T2zvCDRWwOxbcjFcXICVrF4gahtv09u
 eWFwmRm5B1LQB5DNRISJJgp365Y9FrkFDlip7xXuoI+OoFHviB2BSxDqwUBqDTEBe2s1
 Kym4R+WanWdi/qNCxj1acrMTjuYcJxQuMKxfnePzxdJqikRWhPHeNp8aK63pTyvlht1u
 yXCA==
X-Gm-Message-State: APjAAAUBiDn+BlTvD3/wTD/LL7GjZXcDub2Mf19GWpA/OOJO3AhhVkdh
 X1aq+rVR1Gg+JF5Zo3Beng==
X-Google-Smtp-Source: APXvYqyir024SUWVI341ABEbH3M1KuLPM8D4LvZPtpyviODJx/tjaS2QhxNbgMaSNSZSKOYciY2OEg==
X-Received: by 2002:aca:e146:: with SMTP id y67mr7212323oig.93.1580135238334; 
 Mon, 27 Jan 2020 06:27:18 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j186sm4787555oih.55.2020.01.27.06.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 06:27:17 -0800 (PST)
Received: (nullmailer pid 31278 invoked by uid 1000);
 Mon, 27 Jan 2020 14:27:17 -0000
Date: Mon, 27 Jan 2020 08:27:17 -0600
From: Rob Herring <robh@kernel.org>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: add binding for tft displays based
 on ilitek,ili9486
Message-ID: <20200127142717.GA30789@bogus>
References: <cover.1580059987.git.kamlesh.gurudasani@gmail.com>
 <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580059987.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580059987.git.kamlesh.gurudasani@gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Jan 2020 23:12:00 +0530, Kamlesh Gurudasani wrote:
> This binding is for the tft displays based on ilitek,ili9486.
> ozzmaker,piscreen and waveshare,rpi-lcd-35 are such displays
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
> 
> v2 changes:
> * Changing file from txt to yaml format
> * removed ilitek,ili9486 from compatible string
> ---
>  .../bindings/display/ilitek,ili9486.yaml           | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ilitek,ili9486.example.dt.yaml: display@0: compatible: ['waveshare,rpi-lcd-35'] is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ilitek,ili9486.example.dt.yaml: display@0: compatible: ['waveshare,rpi-lcd-35'] is too short
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ilitek,ili9486.example.dt.yaml: display@0: compatible:0: 'waveshare,rpi-lcd-35' is not one of ['ozzmaker,piscreen']

See https://patchwork.ozlabs.org/patch/1229397
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
