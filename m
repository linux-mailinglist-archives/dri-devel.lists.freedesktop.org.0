Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F45832F61B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 23:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFAC6E3BB;
	Fri,  5 Mar 2021 22:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117906E3BB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 22:53:29 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id h22so3381773otr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 14:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SESkgwxE34Ue5+G0A5styguJRyIcPh+9gdfTTFKIFHY=;
 b=rGZ8wsgbjDOKqDLjXeJS1vD362VoPMerOrk9lOK9RYvg+Kzgj1LqxkaG6E2/kECxo3
 qNtnGtr/i9/DoqjWa1J6nyxVAXDpiINSY8jUdK6aG4CrX533g+aQPBUy3lSlJwVAsGU7
 TnPKQjXYAGUXUfzDiZ68ylJrzOJPTjQ/kAGB0yiqPrzEcLAktckQ/QMLjiRdgGS+ZcG0
 NkkeTfH4hRwP0YNgR2TMqe0PpAmQTSxnxeDSy2ACeeUsU7DxhtyTRS0piwi2O/n54EaH
 vLQqZRYhdAUNnkZv+DeOeWVdqxFJJ7WLIBFAWbtaipHhffdT5tUFa5lsTiQ/NthIXi6p
 lmBg==
X-Gm-Message-State: AOAM533wy8sGPl9l8axV50DCjPBMq+QDQH5nRPRL4UT4U3PMDfjf8qcc
 cCgoWxP+FsDtPf2TWoiu+g==
X-Google-Smtp-Source: ABdhPJyVykejdFl6XfYolY739GKlcY0uorRLymeoLSfVK9GC0j1KIWN7PP+gUB7F7XRgTDNwEWD3yA==
X-Received: by 2002:a9d:6381:: with SMTP id w1mr9858830otk.236.1614984806984; 
 Fri, 05 Mar 2021 14:53:26 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r22sm884761otg.4.2021.03.05.14.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 14:53:26 -0800 (PST)
Received: (nullmailer pid 791447 invoked by uid 1000);
 Fri, 05 Mar 2021 22:53:25 -0000
Date: Fri, 5 Mar 2021 16:53:25 -0600
From: Rob Herring <robh@kernel.org>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH 2/9] dt-bindings: display/panel: add Jenson JT60248-01
Message-ID: <20210305225325.GA791397@robh.at.kernel.org>
References: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
 <20210218225458.823773-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210218225458.823773-3-giulio.benetti@benettiengineering.com>
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
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Max Merchel <Max.Merchel@tq-group.com>, David Airlie <airlied@linux.ie>,
 allen <allen.chen@ite.com.tw>, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Feb 2021 23:54:50 +0100, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Add DT binding for "jenson,jt60248-01".
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
