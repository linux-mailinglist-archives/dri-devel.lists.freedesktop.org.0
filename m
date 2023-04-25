Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A25F6EE761
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 20:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA3A10E173;
	Tue, 25 Apr 2023 18:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19E410E173
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 18:11:04 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6a5ec0d8d8aso4208325a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 11:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682446263; x=1685038263;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=blucUmTFFpYTbfvcDnO8xeGwtboxlR6eWgksqH9ouRk=;
 b=P0GqvfBLdV20gdYmAwzYYAgzXsV/f6Rhav+FgN2kwl0L8EGY1kYyENks236Wu6ubzi
 5uPKSNjBMCR8ZQG+NTJNwI68CPlfW7zHFwxgzAvTBwFlKaXXJsz6GTMBzyWx3QXdyDpQ
 DPBUTOzBj/PLTELEMlMqznga14G06DPh7zJuh5JhUQXu/YpYAH8fCncJJmu8ldndGmb9
 b/GN4KNxF42ymnuF3izHoxCLNPpbmRw9xU5uQWOhiOBPGo2Dboimgw9kTPZYz72t72fp
 gdfau3lDi7QwwSdXzI5txzxa/G6WA2bXEYJVUUPuMtMbrvoukWeJqEg2lfnAAhLY49HV
 7/7Q==
X-Gm-Message-State: AAQBX9d3CsNUWPkrJEwh8nCdJUh6z6EIseBXZ/4jXuAbY3PM9A+gexYs
 xhYFEEap9DDHNpQU/MwLmQ==
X-Google-Smtp-Source: AKy350ab+YkZ7m8tzyd2lMcmqjzLCSkKC3Fd7xKM9Ad2SJ7uD/BQj013Z3HR+2XikXPzNJctOz8xsw==
X-Received: by 2002:a05:6870:a406:b0:17f:cf1f:9d8f with SMTP id
 m6-20020a056870a40600b0017fcf1f9d8fmr11610087oal.8.1682446263383; 
 Tue, 25 Apr 2023 11:11:03 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y5-20020a056870e50500b00187e500e7b3sm5724335oag.49.2023.04.25.11.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 11:11:03 -0700 (PDT)
Received: (nullmailer pid 2031664 invoked by uid 1000);
 Tue, 25 Apr 2023 18:11:02 -0000
Date: Tue, 25 Apr 2023 13:11:02 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH 4/7] dt-bindings: display: panel: Add Ilitek ili9805
 panel controller
Message-ID: <20230425181102.GA2031194-robh@kernel.org>
References: <20230421154308.527128-1-dario.binacchi@amarulasolutions.com>
 <20230421154308.527128-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421154308.527128-5-dario.binacchi@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 05:43:05PM +0200, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Add documentation for "ilitek,ili9805" panel.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../display/panel/ilitek,ili9805.yaml         | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml

Same comments on this one.

