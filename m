Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6177D476256
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 20:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C6510F854;
	Wed, 15 Dec 2021 19:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75E710F854
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 19:57:11 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so26250655otl.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 11:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OQHnIq3MbqKOkBWaqzhYEGokXZQ4cO9gcO52HXRgUjM=;
 b=Oez8fekpC+VWNqzg/OJxBe/O48of4EepOM9IB6tWmwXruz4WvxsqCLch6yFEcYZqJl
 nC9+87EbnhJn3Dc0PPamACx0AimYrnYyOGJUUYdjlLVp7Q2F/zcZrnaP++xhjBnOaqyY
 kp9beRnrPdqGamAA/dx8ZFVWbeFc0swEH/sD6UGBp0jIj5OXEENvMjnuaL3heZGjCu86
 fqqkwFzB8anG4m574vRLI4QVpfgd5c7dbUD6yNE3M0rwuugIiMe81D9QyVvUztz9P8Uy
 IGzZLP3tBQjm1lPW1qxSabEK/muMfe+1t2asC0w5NAyiP/nCDL/qkWaSmJkhgBBCd7ir
 vG4g==
X-Gm-Message-State: AOAM5331pnIB+TmtZyaxNofnIqi8Xw8GQtlQJU2fDaG4N4Fo10dEKPvd
 w0tT8vw3aS7sNWgYnNxtzQ==
X-Google-Smtp-Source: ABdhPJzxwIsn/cIQGYHuBgMFx+Tg1FD9tkT3hX/+n0dDk8WvLbNnz56ZucAnHQZY6SSnHfzgg0OuTQ==
X-Received: by 2002:a05:6830:1e8f:: with SMTP id
 n15mr9846388otr.259.1639598231225; 
 Wed, 15 Dec 2021 11:57:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id ay40sm508165oib.1.2021.12.15.11.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 11:57:10 -0800 (PST)
Received: (nullmailer pid 1734417 invoked by uid 1000);
 Wed, 15 Dec 2021 19:57:09 -0000
Date: Wed, 15 Dec 2021 13:57:09 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: sharp,lq101r1sx01: Add compatible
 for LQ101R1SX03
Message-ID: <YbpIldrQUQHh37C9@robh.at.kernel.org>
References: <20211211213653.17700-1-digetx@gmail.com>
 <20211211213653.17700-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211211213653.17700-2-digetx@gmail.com>
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
 Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Anton Bambura <jenneron@protonmail.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 12 Dec 2021 00:36:51 +0300, Dmitry Osipenko wrote:
> From: Anton Bambura <jenneron@protonmail.com>
> 
> LQ101R1SX03 is compatible with LQ101R1SX01 from software perspective,
> document it. The LQ101R1SX03 is a newer revision of LQ101R1SX01, it has
> minor differences in hardware pins in comparison to the older version.
> The newer version of the panel can be found on Android tablets, like
> ASUS TF701T.
> 
> Signed-off-by: Anton Bambura <jenneron@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/display/panel/sharp,lq101r1sx01.yaml          | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
