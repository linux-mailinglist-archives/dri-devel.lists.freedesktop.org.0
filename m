Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF4F262222
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 23:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7466E09F;
	Tue,  8 Sep 2020 21:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF536E09F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 21:50:14 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id d190so1024149iof.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 14:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=shpHGPudo4d9G1LgLy9sXEgqpkCmEAyFPt2SZvRURXs=;
 b=WAOb4wb+xujq/OPGvzv94mohZloszTuXveVHZH/Yk19JZCcJ77/WigLh0WDrWFnXUO
 6nsR9QxzubmP44F2XgfJM3OTYtW7mJT5MjYryhXvyL5wukHhaeX8oJ8sLlyWtelFPbh4
 1MA/FjFsSrUwe1Cvkt1WITcx7S8u8V76qV2s5G7w7H5Ny8A3G2K4ccGdu7iGD/GWg3JD
 wi01QJYfnR4t5i83RKaWM/6usmxAU7YATi5GTpwwpMbr1EW0JyF6M204qdnWdKBRQe3g
 w0twQji8yHFPW9B4SeS+zEa4vU7u17dJLWeZ01i3/HtA5550+neg/afv8SXpyX/mbeUm
 /rTw==
X-Gm-Message-State: AOAM5314ApFU4nyI/7FahcM6PaDmVrl5fALA457wTHwA+fHFY+8Xz3EB
 hBm0FWlLTpwz0DXGNEJJ3Q==
X-Google-Smtp-Source: ABdhPJztHbGunEEtcZCeK7/v7wNaCgAwGb2KmWS/rtPe0EOYJTJDR8/udRm2/SaK7gqlUOOmvddWSQ==
X-Received: by 2002:a6b:5a0d:: with SMTP id o13mr877903iob.186.1599601814235; 
 Tue, 08 Sep 2020 14:50:14 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id l2sm257270ilk.19.2020.09.08.14.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 14:50:13 -0700 (PDT)
Received: (nullmailer pid 989673 invoked by uid 1000);
 Tue, 08 Sep 2020 21:50:11 -0000
Date: Tue, 8 Sep 2020 15:50:11 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/6] dt-bindings: display: Document NewVision NV3052C
 DT node
Message-ID: <20200908215011.GA989643@bogus>
References: <20200822163250.63664-1-paul@crapouillou.net>
 <20200822163250.63664-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200822163250.63664-2-paul@crapouillou.net>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, od@zcrc.me,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 22 Aug 2020 18:32:45 +0200, Paul Cercueil wrote:
> Add documentation for the Device Tree node for LCD panels based on the
> NewVision NV3052C controller.
> 
> v2: - Support backlight property
>     - Add *-supply properties for the 5 different power supplies.
>       Either they must all be present, or 'power-supply' must be
>       present.
>     - Reword description to avoid confusion about 'driver'
>     - Use 4-space indent in example
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../display/panel/newvision,nv3052c.yaml      | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3052c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
