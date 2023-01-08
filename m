Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE566178A
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 18:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B09E10E1F6;
	Sun,  8 Jan 2023 17:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE7A10E1F6
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 17:34:33 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id o8so3815952ilo.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 09:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hKproKir3HPkv8IvS6jPA1lAY60sR87AX6XZo0jpmrU=;
 b=n2wmj+FPdzzAo/cKvHj92ZpQdB1J0SSSzgIuDUvbUhyavsTcMohfNzYS+tFZVs1c+x
 SusywOCuXNS8YruR2tDMGI8k34sbExYLFArTOZuJxVPcuz+89OtEkF6wNYpTkK0wmsYw
 jQPflQsN7PjvgKJxY470AHucJDgsTzmf1hmnNcoRWwe/QNf9uPR3DqkeNCmgBURSq14H
 rrkbLecC3Tt3BBr0TIqgtfT/MLiD4GenVf8ic6kVnbdbya2Fjqf6Bk6E92azRGWHYaL8
 7WexEeenbY+DaHLxvJs8ox74fjoW6CDb45i3mfz+hcgi6HoV9RAsLLE6SyI0Rgmi3XrD
 gxPg==
X-Gm-Message-State: AFqh2kpeh7523HWAaDRGMBCGKI143842uZ3SqrBEA6SE7VFhc7dBp7SD
 joYHszZDnD7YWO/5X3rqAA==
X-Google-Smtp-Source: AMrXdXs/6tkgd/YFgM7+TqsDaJ+D3dVVhB/jbNBcIGfVOh9qRYTdfrVyAGfkd6r9yEENJJXK29/mRQ==
X-Received: by 2002:a05:6e02:c22:b0:30c:43be:2a61 with SMTP id
 q2-20020a056e020c2200b0030c43be2a61mr19107111ilg.5.1673199272913; 
 Sun, 08 Jan 2023 09:34:32 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a92ad11000000b0030c44ed932asm2037107ilh.29.2023.01.08.09.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 09:34:32 -0800 (PST)
Received: (nullmailer pid 107427 invoked by uid 1000);
 Sun, 08 Jan 2023 17:34:29 -0000
Date: Sun, 8 Jan 2023 11:34:29 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V7 2/4] dt-bindings: display: panel: Add Samsung AMS495QA01
Message-ID: <167319924411.106065.9131828641363471907.robh@kernel.org>
References: <20230103190707.104595-1-macroalpha82@gmail.com>
 <20230103190707.104595-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103190707.104595-3-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 tzimmermann@suse.de, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 03 Jan 2023 13:07:05 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for Samsung AMS495QA01 panel (with Magnachip
> D53E6EA8966 controller IC).
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../display/panel/samsung,ams495qa01.yaml     | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Rob Herring <robh@kernel.org>


