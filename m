Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A5C6D5307
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 23:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048EB10E594;
	Mon,  3 Apr 2023 21:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A050F10E1D5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 21:06:25 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-177ca271cb8so32311002fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 14:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680555984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=08JlvI1hUhZyrM2szVAGCNyVcRh4I7s+6U0f0q0JQOQ=;
 b=I67ezE8pPgA6w9mID4Gilm3vx8cY8I1qNGLdyHk8Ugrn/iNhKWSALulQ1LiwEdlHjB
 whwK6q1VBhmwk5vlMSjtY1HlUEHlF/rC0RuB/1GuOKQrIcoCX0B41uVsWD1QxPZ/TITK
 E2t8XXswFVXJWhRNwCIm0rM7PBhK0k1zqweqaRQCBca2iL0bYuVBGGlSkyB3dquw2eFe
 GsbYff7qOZsVhCgSCJLWRhui6xweNrp3OKmTfnG12VSCBKh1ws0ftujtjOrSknwixLoN
 p1iPqFXcq07zkIoav03zZda7FhdOiQlhKYS3XA07ybOpzpzT2UUbTiPsI3xVet+FUAX0
 WGlg==
X-Gm-Message-State: AAQBX9eNW1dptuSgZ0RJKs/6JNUmSTTBWrz3wLKGzWZndwuDYiVaohJ/
 a34G+q2iUq11RvSKNj9DnA==
X-Google-Smtp-Source: AKy350aevd645dF3st8Velo9cm7pPfpzlct8rQ/ePIbcFPF1B1iFeLjt+3CLri2lBgSP9iq2Cb9PHQ==
X-Received: by 2002:a05:6870:f223:b0:180:5367:33ba with SMTP id
 t35-20020a056870f22300b00180536733bamr318161oao.48.1680555984621; 
 Mon, 03 Apr 2023 14:06:24 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 kw17-20020a056870ac1100b001802d3e181fsm3978033oab.14.2023.04.03.14.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 14:06:23 -0700 (PDT)
Received: (nullmailer pid 1772263 invoked by uid 1000);
 Mon, 03 Apr 2023 21:06:22 -0000
Date: Mon, 3 Apr 2023 16:06:22 -0500
From: Rob Herring <robh@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: bridge: sn65dsi83: Add DSI
 video mode
Message-ID: <20230403210622.GA1740065-robh@kernel.org>
References: <20230330101752.429804-1-francesco@dolcini.it>
 <20230330101752.429804-2-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330101752.429804-2-francesco@dolcini.it>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 12:17:51PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> SN65DSI8[34] device supports burst video mode and non-burst video mode
> with sync events or with sync pulses packet transmission as described in
> the DSI specification.
> 
> Add property to select the expected mode, this allows for example to
> select a mode that is compatible with the DSI host interface.

Why does this need to be in DT? The source and sink drivers should know 
what their capabilities are and pick the best common one.

Rob
