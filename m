Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EA914EE4B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 15:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29AE6E9AC;
	Fri, 31 Jan 2020 14:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E158F89FDD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 14:23:09 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id d3so6704362otp.4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 06:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PxMeFzkOsZfzvlj1E/GqrVrfLq2JwIzh0NLeWA9Dicc=;
 b=b3hKfIugPpr5trvAaHi+LyB06FS4dkexooN603hPPpOTSfYaCo81Uj6wSvXBkSf9/G
 MuGkiyF0DGaL7CvoqR08Di52s7aHWYldhXuqhuGvb7fEDGoKeE1QofjTPfI2uOJ6nrS9
 Va/YBIBfXg6x9NodIMWrI6wvXq8I9oucdfOR2OWnBz2f0bxQNRIm32vCVmpla2coLo17
 5iIozQvklW1gyS0FTC+Abxiq7Yh1l7DIRdwXAm7RinriNxRMhqE2mYJE++PHh48F3ZTo
 HX3AZEMkRGvso5aGxBLMMkR65arqmcNPaLU1xG6I+YB/Z0jKpDcr5asaAtqgouh17OM/
 XrHg==
X-Gm-Message-State: APjAAAUarsvbgrjytAW0mIfGhOccLjN9qYjrfrVD0/rXJScpqZlE3/9r
 A0ekKYfIN2KtdArAPDfHIg==
X-Google-Smtp-Source: APXvYqzbha/ycL5MajoXxSDh1B5G7/y41e7NeKsIZddrNIh8p5A46V6ONoTNhVOF1NvK7fkbx6+A4w==
X-Received: by 2002:a9d:370:: with SMTP id 103mr1920211otv.103.1580480589112; 
 Fri, 31 Jan 2020 06:23:09 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e5sm258654otk.74.2020.01.31.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 06:23:08 -0800 (PST)
Received: (nullmailer pid 3810 invoked by uid 1000);
 Fri, 31 Jan 2020 14:23:07 -0000
Date: Fri, 31 Jan 2020 08:23:07 -0600
From: Rob Herring <robh@kernel.org>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: add binding for tft displays based
 on ilitek,ili9486
Message-ID: <20200131142307.GA679@bogus>
References: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
 <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580134320.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580134320.git.kamlesh.gurudasani@gmail.com>
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

On Mon, 27 Jan 2020 19:56:14 +0530, Kamlesh Gurudasani wrote:
> This binding is for the tft displays based on ilitek,ili9486.
> ozzmaker,piscreen and waveshare,rpi-lcd-35 are such displays
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
> 
> v2 changes:
> * Changing file from txt to yaml format
> * removed ilitek,ili9486 from compatible string
> 
> v3 changes:
> * no changes
> 
> v4 changes:
> * no changes
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

See https://patchwork.ozlabs.org/patch/1229867
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
