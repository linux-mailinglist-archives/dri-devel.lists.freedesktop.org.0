Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BCB3A1AB2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 18:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB5D6E9AE;
	Wed,  9 Jun 2021 16:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6226E0FB;
 Wed,  9 Jun 2021 16:16:49 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so24487625otg.2; 
 Wed, 09 Jun 2021 09:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=pGGy0QJiGHO1VqANFEeP8eQnM2OGRel1gTBvXXS9M6M=;
 b=ErUZryuE1fqiyn5wd0H00/QOWlUTERe5sNJYQyN81cAJJWk9iowZFkdtdJUbjI8Xh8
 AB6DE3K0LE2dHFEl2+il1xa3xqKaBo94cvMcLO9GivbWLIf6xpq3qR22wK2IPVa/a/WV
 1ps3Dc4Ttfd5Fu0Em7zBAB+HYWQslQzHvCetzAbmGMSk+LqEEQALDIQa7jfpwIBjkzmE
 f0gzf7GcWIfVvk+8AaMNtfIfY7lc3z5xaZjMU1rtNFgfAUDyDLDXEtj+HV7xG33geeSR
 SzJvxA6MoZAcQC8BGSqrzCIEfJYT8J2Doy5IfmOLy25+Bm5tuVxKie5iJWgXCfxY3F6t
 U7IA==
X-Gm-Message-State: AOAM532rgfa2eQj9EMv7SsJVr3Rs5D3ZkyyoFC6e4KfxrWDuIIhf/b9l
 pCWuPHLDA8BevuPMyXsEJA==
X-Google-Smtp-Source: ABdhPJz9lb6nQLNfKFtmUMYZW5PMOiiZPprVnIwJWUBq/29WErexzGXTF+CbUeDZFUDAGFLzY7eHew==
X-Received: by 2002:a05:6830:14c:: with SMTP id j12mr196670otp.0.1623255408424; 
 Wed, 09 Jun 2021 09:16:48 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v203sm49302oie.52.2021.06.09.09.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 09:16:47 -0700 (PDT)
Received: (nullmailer pid 3763302 invoked by uid 1000);
 Wed, 09 Jun 2021 16:16:43 -0000
From: Rob Herring <robh@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
In-Reply-To: <20210608195342.18269-2-jonathan@marek.ca>
References: <20210608195342.18269-1-jonathan@marek.ca>
 <20210608195342.18269-2-jonathan@marek.ca>
Subject: Re: [PATCH v3 1/3] dt-bindings: msm: dsi: add missing 7nm bindings
Date: Wed, 09 Jun 2021 11:16:43 -0500
Message-Id: <1623255403.647740.3763301.nullmailer@robh.at.kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Jun 2021 15:53:27 -0400, Jonathan Marek wrote:
> These got lost when going from .txt to .yaml bindings, add them back.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/display/msm/dsi-phy-common.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
Error: Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.example.dts:26.38-39 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1489620

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

