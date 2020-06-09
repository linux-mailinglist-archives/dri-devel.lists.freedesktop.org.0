Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F29A1F4966
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 00:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A786E34D;
	Tue,  9 Jun 2020 22:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3C16E34D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 22:32:07 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id t9so2863342ioj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 15:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pEYj8Q8hvWMVFci2AIGkl90xllgpbmt8ipjrO6OHSLs=;
 b=OaWgX02cQ8tBr2F5MPWAhAjvepRP6n4/k1tyefP/oojw/IhIG7MesWy4iIEsfWcwR5
 UZ4Hpgfjz+FExnP1yBKWc62FGAVmpaeRu6A6M5S+MhIgX42WqNXcJXbogCEa0FU8l1F/
 soZnIzHgFXm932zr2xNGjE9Jbj0A7v4VovwROoyCzousUWRf/WJbEFXXjTfqu7hZ2yb6
 V+0B2c7LSr0VvFr5h9UtBV97vdEhFDp+d9aG9HO83OPfZ6zogXizQYgMGgSW3XDxQGJ9
 i+ZJxRff0cqb2Vf2mKf2w74OeYSMDzmw+cmE2KnJLFBwCfMKpZP4o9gYSUcMmNODd6rG
 ORfw==
X-Gm-Message-State: AOAM5328y+J+dv65b1y7ggZHqOTT2Hjq5kZyLEHIlm2eYYOEKN75SF+F
 aSvEU7OeN/We0W+e+7/7PQ==
X-Google-Smtp-Source: ABdhPJyt5YfQsuRoIMwdfPzISkYMAJHYLcHFHVzz3hR9HowWYWnL9UlrtXdu879YVUnJLYs3lo7g+g==
X-Received: by 2002:a5d:9505:: with SMTP id d5mr377613iom.34.1591741927140;
 Tue, 09 Jun 2020 15:32:07 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id d1sm2290032ilq.3.2020.06.09.15.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 15:32:06 -0700 (PDT)
Received: (nullmailer pid 1619975 invoked by uid 1000);
 Tue, 09 Jun 2020 22:32:05 -0000
Date: Tue, 9 Jun 2020 16:32:05 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 5/6] dt-bindings: panel: add LOGIC Technologies panels
Message-ID: <20200609223205.GA1619918@bogus>
References: <20200601083309.712606-1-sam@ravnborg.org>
 <20200601083309.712606-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601083309.712606-6-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 01 Jun 2020 10:33:08 +0200, Sam Ravnborg wrote:
> Add support for the following panels from LOGIC Technologies, Inc:
> - LTTD800480070-L2RT
> - LTTD800480070-L6WH-RT
> =

> The LTTD800480 L2RT is discontinued, but it may be used in
> existing products.
> =

> Both panels are dumb panels that matches the panel-simple binding.
> =

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: S=F8ren Andersen <san@skov.dk>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> =


Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
