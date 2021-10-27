Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E4143BF77
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 04:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35156E4E8;
	Wed, 27 Oct 2021 02:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D4F6E4E8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 02:18:24 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 t17-20020a056830083100b00553ced10177so1316514ots.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 19:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7VRwiWsFW3qU9OClD0E6PGyfRVEAATUo35AgOU+oVAs=;
 b=LLhvncrBx00b5NoAAq6u8Ay8msdK9UtwthMU7ju/TBs/2B9XC3jjPz3fPeoBudipYR
 nYF4wJ+kOQyvuPpwfL/5mEjQ2yOOyH8U+GNML1a8yShGkKfvngHRar3B6W3sJ4vE6Y0v
 Q0xzBObgOjCLDZ0jL3wCJ8IppjahlOpImjmbhjet/1BldC1NSuTSJN32iQbxt53KRQ2Z
 XUwvA/Kne/lPky/kjWe6UUm6YMJqRF4ZHB8LPlixEYVjGVn+9AdQfilezPFcu0iLoflR
 bLTfEnY9WnZvWekREfaKRpmfzPraSN9CM/KydkqKVLYM++sqW5sFmG89rTDF/LU6ldDX
 pGGg==
X-Gm-Message-State: AOAM531ijOJBrPmJ5TMDKcK9dcHzcndGpcpDoa0x3SHApAxwfeUNt+V1
 G2+x3rNqslCxcEW4IsQF2Q==
X-Google-Smtp-Source: ABdhPJyv1pUrxa7Hiz1b6MtytdlGJV6SUTPZtbLUZyB4s9ILL8HXBapLEsoJv6AKeLk4kJofMM2s+g==
X-Received: by 2002:a9d:6009:: with SMTP id h9mr22691428otj.313.1635301103594; 
 Tue, 26 Oct 2021 19:18:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j15sm463929ots.58.2021.10.26.19.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 19:18:23 -0700 (PDT)
Received: (nullmailer pid 3814307 invoked by uid 1000);
 Wed, 27 Oct 2021 02:18:22 -0000
Date: Tue, 26 Oct 2021 21:18:22 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: a.hajda@samsung.com, daniel@ffwll.ch, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display/bridge: tc358764: Convert to
 YAML binding
Message-ID: <YXi27l0bzbEmb65C@robh.at.kernel.org>
References: <20211018144003.878345-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018144003.878345-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 18, 2021 at 04:40:03PM +0200, AngeloGioacchino Del Regno wrote:
> Convert the Toshiba TC358764 txt documentation to YAML.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> Note: dtbs_check on exynos5250-arndale.dts will give some warnings after
>       applying this patch: since the preferred way is to have 'ports',
>       this warning was ignored.
>       I have no Exynos5250 board, so the dts fix is left to someone who
>       is able to test on the real hw.
> 
>  .../display/bridge/toshiba,tc358764.txt       | 35 -------
>  .../display/bridge/toshiba,tc358764.yaml      | 94 +++++++++++++++++++
>  2 files changed, 94 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml

You haven't implemented any of Sam's feedback on v1.
