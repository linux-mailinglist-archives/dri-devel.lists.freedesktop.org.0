Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD1038BC31
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 04:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBDA6E471;
	Fri, 21 May 2021 02:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30A3891A6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 02:00:56 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so16676400otp.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 19:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eYAL0SQZfqse54W9hf+La4gHbbjMqJ8q2D/DcvhsGk8=;
 b=sFyuQX3r0D9NSeTk1XoMlIYiV0WpGkeICY/Wgc+TiyoqiTWjGoI1bOGGmr1eKWcEUf
 lwXWI+v3p1gMdxlvS2LGilNecd7gGfsaUPnoXPHupM8y2fWlWrZbV7UP9mJnwCcH1T62
 JiDvr7ms51Ee0Stp56hib7P42zIAWlTDUC4yjSocklcA6Dbly6CJGVI+ht1Qod7Lmxs5
 VlXT9pNj9mhgldIadUe+RjAxkJrmJUVX87N7zeXfkKeV7iDUg0SY/qL3boJG/Q2nwZwQ
 wPVHLW76qLbV3EpTQsGLZowb0Y9HwVWz+UHQ1YiDQoPj1MoClvK0EtSUHAM5lysfSoYJ
 4rMA==
X-Gm-Message-State: AOAM530rKlFKXwpNNTwJaSA7OX1UZlDA3K7cLOaJb76WbKzjwDQdliIp
 4kwenHjthFsiKwJXe9nSAQ==
X-Google-Smtp-Source: ABdhPJwQri+efVDl5VKRU4Kwy8jU2xTma3SwAw/7SLFL+NLfmUmQFW5hE6CoCDkahmDE7XkVWVQahw==
X-Received: by 2002:a05:6830:90f:: with SMTP id
 v15mr5965449ott.223.1621562456085; 
 Thu, 20 May 2021 19:00:56 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f2sm977768otp.77.2021.05.20.19.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 19:00:55 -0700 (PDT)
Received: (nullmailer pid 2500985 invoked by uid 1000);
 Fri, 21 May 2021 02:00:54 -0000
Date: Thu, 20 May 2021 21:00:54 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: convert faraday,tve200
Message-ID: <20210521020054.GA2500924@robh.at.kernel.org>
References: <20210519203547.837237-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519203547.837237-1-clabbe@baylibre.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, ulli.kroll@googlemail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 May 2021 20:35:45 +0000, Corentin Labbe wrote:
> Converts display/faraday,tve200.txt to yaml.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> Changes since v1:
> - added two subsequent patchs fixing issue found when converting
> - fixed all issues reported by Rob Herring
>  .../bindings/display/faraday,tve200.txt       | 54 ---------------
>  .../bindings/display/faraday,tve200.yaml      | 68 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/faraday,tve200.txt
>  create mode 100644 Documentation/devicetree/bindings/display/faraday,tve200.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
