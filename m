Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103463DAFFC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 01:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F276EE92;
	Thu, 29 Jul 2021 23:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94C16EE92
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 23:40:48 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id x7so4268198ilh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 16:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oTWaRpGPgXYGZ0nxv3aypr2wXYk30fYpsL6awQ1L3ik=;
 b=AohfD81JHXozeimxEuhVxQHV9zpo1ReX/bYuCfK+voDrfNwbqzMmG0WAhIaQPMWNKQ
 wWsB0xm2QJ5fro8zZdkBQ/HVkKemoUJam+19GBzZqjb7dCRN9jsSxc8ydyFBOLrCwDyh
 oM8xEP8Kk8TiwpI9i5tenga/KkzJuitQLLzBxleXiHx1mqEnDkiE7a9vIlPR/pXSCk5C
 1IpJhGpq4CJlbBWflG0c7d8PAR9AfL2PzTjQqo3XMAFw6q0LTwyEJoNKqF57PBZRY4yf
 meD4aLU4vnIdPRJUTYoKgOSLwfAmPDsqezzGLckjQyzM8RyfJqpOdQ7phAWTrQdSO6Z4
 1J0w==
X-Gm-Message-State: AOAM530De6/3B7BtqtCjZNmIGYuOOqZaeLK5bxIsAUBNKgrNoHaO6lJL
 7ryY1wGwgsNejhjnItFLmg==
X-Google-Smtp-Source: ABdhPJy+s4DqM6X4LI7vSIzdG0HB+/20GDhODztS2lTaljhGw7cu/Wa9hFsvPriogt1XQbpJAlFW5w==
X-Received: by 2002:a05:6e02:1567:: with SMTP id
 k7mr5530259ilu.146.1627602048201; 
 Thu, 29 Jul 2021 16:40:48 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id k13sm2353455ilv.18.2021.07.29.16.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 16:40:47 -0700 (PDT)
Received: (nullmailer pid 1130374 invoked by uid 1000);
 Thu, 29 Jul 2021 23:40:46 -0000
Date: Thu, 29 Jul 2021 17:40:46 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add AUO B133HAN05 &
 B140HAN06
Message-ID: <YQM8fp1H/+xxkp23@robh.at.kernel.org>
References: <20210726173300.432039-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726173300.432039-1-bjorn.andersson@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Jul 2021 10:32:59 -0700, Bjorn Andersson wrote:
> Add bindings for the two AUO panels B133HAN05 and B140HAN06, both
> 1920x1080 panels with 16.7M colors, first being 13.3" and the latter
> 14.0".
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
