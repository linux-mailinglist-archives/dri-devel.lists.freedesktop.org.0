Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780051A8A41
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A906E532;
	Tue, 14 Apr 2020 18:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC5F6E532
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:52:32 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i27so749850ota.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ffzxDlgphbZXBktrRhbbNGpwdttblbyl/hILCZIxaKw=;
 b=fFvHuslhUxzxmLDEcaFwwluOOX7idr4jBfBs+mExds9tgtWBncB3OID2/siMx6E+AF
 ttDtlqml4AmnvCZnlgtI/KbPsdOKznBpoOPjPOEQgzYGxGNo8RmB5wIgEhQU7GPPVx6p
 5HKdwm6D3junJNEQME3jWwDjQ6jdDo+o4Vcvb4u/CMoy+c6Ko7bkjj7AhkqsLLG+xOe2
 rotyY3lGjC2mVVrBzMw8UQubxslKkm/oJ5lJ+zbLIcDOGBqu7tZAspZsM9uRaCmzIlL8
 hSgK/B3Jha3hPoKHiEtjdBwMz9zrH0OVeecPn8+1APs7xp0BggBK5LFgE0J2OI5NDuvK
 Pq9w==
X-Gm-Message-State: AGi0PuYPJl21jFflrRCmjmlxDBPo5jZl/17/k1wBIDi25tfVcCoNB0tQ
 DbG+7ccNz3C7L+fUROhWpA==
X-Google-Smtp-Source: APiQypK9bAPVENbT5XIK/PsRZiM3V54qJ/IgN+OTh2Senbkkz2Wefs9R5BhtAYCwQ03a/Kb476Yptg==
X-Received: by 2002:a9d:525:: with SMTP id 34mr19030057otw.80.1586890352020;
 Tue, 14 Apr 2020 11:52:32 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y11sm3415599oos.10.2020.04.14.11.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:52:31 -0700 (PDT)
Received: (nullmailer pid 6692 invoked by uid 1000);
 Tue, 14 Apr 2020 18:52:30 -0000
Date: Tue, 14 Apr 2020 13:52:30 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 26/36] dt-bindings: display: convert sony, acx565akm to
 DT Schema
Message-ID: <20200414185230.GA6635@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-27-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-27-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:59 +0200, Sam Ravnborg wrote:
> v2:
>   - drop use of spi-slave.yaml (Maxime)
>   - add unevaluatedProperties (Maxime)
>   - rename node in example to panel (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/sony,acx565akm.txt | 30 ----------
>  .../display/panel/sony,acx565akm.yaml         | 57 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
