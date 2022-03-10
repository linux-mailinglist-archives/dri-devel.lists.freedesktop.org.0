Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E26F44D513C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 19:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCB810EC8A;
	Thu, 10 Mar 2022 18:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A574310EC8A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 18:17:38 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 q1-20020a4a7d41000000b003211b63eb7bso7748181ooe.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eZKB5rgatNU4unfMPUALwl/eCbetKzYXpdyZA9VU5SY=;
 b=6X+IAQEbvfJG7SXDtLd1b2cOZI4vLwNQpMHmFSZ9/p7K62BZHw4vSRHrLfWXRt/YVo
 VWZESEV2JrYtJapix/ro2SM1Tl/tkpuBOHKhx8TISwmP/X6daczcLR8a2LbOWu2glm1Z
 ScrTMeGjXUq3/uud9gL734IEbT/kBNPw+9nkRvDSdkaioZ63kpuQIBgUfo1Es4SV0OVW
 sNpQfOe48qqVxy17wbcnOiAJiM7Wh6lTa6xyPhMku1aDJnnHCoDxnpFHg+plAn0ikEEx
 TZPoBdrormzLlBAs4S+8d5eDxNpqN5vG1qBvkYlTlUK/ng9uJkKs3W1V/SlPVURIOupx
 FL6w==
X-Gm-Message-State: AOAM533JYxOYCvf5xR/VmdNQZKwXuZzttwi4nT+1419amyXipSkl+0/t
 m8UHvB1qEHosHV3JM6VYfg==
X-Google-Smtp-Source: ABdhPJy+kSQTHi+CuiP48iwuEt3adEwVucDFsMoEwtJisvJGTapRTmSo1y4xd40p5Wla/Pah3MdH6w==
X-Received: by 2002:a05:6870:340c:b0:da:b3f:2b7f with SMTP id
 g12-20020a056870340c00b000da0b3f2b7fmr9438791oah.286.1646936257866; 
 Thu, 10 Mar 2022 10:17:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b15-20020a05687061cf00b000d17a5f0ee6sm2640359oah.11.2022.03.10.10.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:17:36 -0800 (PST)
Received: (nullmailer pid 1800189 invoked by uid 1000);
 Thu, 10 Mar 2022 18:17:35 -0000
Date: Thu, 10 Mar 2022 12:17:35 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: gpu: mali-bifrost: Document RZ/V2L SoC
Message-ID: <YipAv3DDdCj6sVvP@robh.at.kernel.org>
References: <20220308211543.3081-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308211543.3081-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Mar 2022 21:15:43 +0000, Lad Prabhakar wrote:
> The Renesas RZ/V2L SoC (a.k.a R9A07G054) has a Bifrost Mali-G31 GPU,
> add a compatible string for it.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Applied, thanks!
