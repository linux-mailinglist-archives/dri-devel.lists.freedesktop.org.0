Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C547632F62A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 23:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92B16EC7C;
	Fri,  5 Mar 2021 22:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205A26EC7C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 22:55:18 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id f33so3357685otf.11
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 14:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3LvO/pXvRIOKjKpXkJTQlwURSVtLYQ3uX1kCxtEQMd4=;
 b=muGSFu2nXLDAEOfLqDq8NfBNscEesbm8607AMtgYDQ81UwXban0iW92c2E3OLTgTpu
 PCV7nkopt0HiIqjBw8AzNpohiy3etMC8y6VlVEDHxAgM2uq7Me8M9ZF5f5tOJw0XPPmg
 Ef93JnS03Qx1SXM6RIqe7HudcFqiWECAh0QOLD716m7yWZu5O31C2Enp95m1Bo1MdBU1
 WUTX8TqvFIiy872tTmqT60W8RAl2EoWijjIjsjAJb+WjMx4twURCVLFYzAZgpYiCkBZf
 4DuH12CKQgg9T7OKlFuTVuk88vHna4HozhfpoTmWIHYGH0LwGx/7q5bO72CDSeokntK/
 /IWQ==
X-Gm-Message-State: AOAM530iWnO1rZsAc5FC9KiXitS0pZCMWTYCvRumFeZGRbARcD6I80op
 aajSyBWMHqeYeUOWGYQw9A==
X-Google-Smtp-Source: ABdhPJxfJBjhLPRwDXPm3FVxlkMZT61cTRJ2+/ZaWzPtwZvm0JFTwdGdR8BnqBZHjEsiGVwt1MSddg==
X-Received: by 2002:a9d:788:: with SMTP id 8mr4984590oto.197.1614984917483;
 Fri, 05 Mar 2021 14:55:17 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b14sm828586ooj.26.2021.03.05.14.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 14:55:16 -0800 (PST)
Received: (nullmailer pid 794144 invoked by uid 1000);
 Fri, 05 Mar 2021 22:55:15 -0000
Date: Fri, 5 Mar 2021 16:55:15 -0600
From: Rob Herring <robh@kernel.org>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH 5/9] dt-bindings: display/panel: add Jenson JT60250-02
Message-ID: <20210305225515.GA794098@robh.at.kernel.org>
References: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
 <20210218225458.823773-6-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210218225458.823773-6-giulio.benetti@benettiengineering.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, Lubomir Rintel <lkundrak@v3.sk>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, allen <allen.chen@ite.com.tw>,
 Max Merchel <Max.Merchel@tq-group.com>, Shawn Guo <shawnguo@kernel.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Feb 2021 23:54:53 +0100, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Add DT binding for "jenson,jt60250-02".
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
