Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F772E31F0
	for <lists+dri-devel@lfdr.de>; Sun, 27 Dec 2020 17:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073C9894E0;
	Sun, 27 Dec 2020 16:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4BB894E0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Dec 2020 16:56:31 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id w3so7344984otp.13
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Dec 2020 08:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=zOHx7r8bUBdtp0nmUurNuEgdm3BgirvRBP8EZaKtUo8=;
 b=P7nQi1/OO12Iar+YUiED2G1u/l+ILRB45wrVafkKE50MCYmjI/jlEHftpFHCQa7lAE
 B7ghmrgfy03A7mHzzw49VWeHVhEgv8bAhAlnn5LkfXhg4hAL9yXP55bK+bmBt6sS5/98
 El1VnSkRiGp6pPW2d2UcZ3gpDWJLLWsQvv8QMU+v0O0rbQDORKPUjx/x7Gnbtu+2jXaG
 ryEi3qUR0ZzkCdxd1zQSYC0wyHqfcHR+dNvyi/yKhEGb8pbm/WoIdyW9KnBzR00y3Crp
 uzeu9c/bTRzj4YXhN8fVsPNGLCjzADQHNqAB4VPrzfYpey1x40+bPdbtT51KmVqObtgD
 VT9w==
X-Gm-Message-State: AOAM531UR4ZWuEgYIvbIwt05r1W46oYDjkOVLMntkNBcPwo0clUsI6lw
 NOKhPvbKdOMkdD5reXTpyA==
X-Google-Smtp-Source: ABdhPJzjfapIxx697lofhNlLTsEkycfgDUBiDloMLI4cPPgY1p1lUj/Z+HubGl8e9Xsc57xtzgW1hQ==
X-Received: by 2002:a9d:27e9:: with SMTP id c96mr29709334otb.15.1609088191057; 
 Sun, 27 Dec 2020 08:56:31 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id g92sm8621100otb.66.2020.12.27.08.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Dec 2020 08:56:30 -0800 (PST)
Received: (nullmailer pid 1338172 invoked by uid 1000);
 Sun, 27 Dec 2020 16:56:21 -0000
From: Rob Herring <robh@kernel.org>
To: Nick Fan <Nick.Fan@mediatek.com>
In-Reply-To: <20201224123119.26504-1-Nick.Fan@mediatek.com>
References: <20201224123119.26504-1-Nick.Fan@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: Convert Arm Mali Valhall GPU to DT schema
Date: Sun, 27 Dec 2020 09:56:21 -0700
Message-Id: <1609088181.485721.1338171.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Dec 2020 20:31:18 +0800, Nick Fan wrote:
> Convert the Arm Valhall GPU binding to DT schema format.
> 
> Define a compatible string for the Mali Valhall GPU
> for Mediatek's SoC platform.
> 
> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
> ---
>  .../bindings/gpu/arm,mali-valhall.yaml        | 252 ++++++++++++++++++
>  1 file changed, 252 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpu/arm,mali-valhall.yaml#

See https://patchwork.ozlabs.org/patch/1420519

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
