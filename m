Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 429E42E2CA2
	for <lists+dri-devel@lfdr.de>; Sat, 26 Dec 2020 01:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2EC8999A;
	Sat, 26 Dec 2020 00:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27608999A
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Dec 2020 00:16:54 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id k9so1124339oop.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Dec 2020 16:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zOHx7r8bUBdtp0nmUurNuEgdm3BgirvRBP8EZaKtUo8=;
 b=m6ckEhbWubKegg8fKF4KBlW0gPn2PoU0iH3U3h34mRzpxM9XiCCXzZfTRu6sNcBYai
 8U2hKi7+wiOuoSkw4Z62FyRJWQi6t38MSGTTiHlD6MIUOY86YsZlqmFnSH53EQNijEB2
 bkE4YGKr8I1ZpieuXVujr7exaM/h9Zy2cVJBpXeJB09OYbxonZicBQJIKLhaZHTaYkDY
 Y0oDTF/dq+M7LMlnwrWAr/0MA+87GOVklqyodN/ehNqUBsztl4O00lNLMdU1L+tRlJdc
 pJ6ie4F/H2vTEZ4XtyYl3SHy5bgxX4AFOoEXPj9peL1/FxVtto5dQ1IujOpAar8YZnHP
 12+Q==
X-Gm-Message-State: AOAM532xO+qXrHKW1yk278ZspNHrM7mxo/4PpzWadTcQZi3d5SdwF8xd
 m9WhIBnpKE2olyr8y6znWA==
X-Google-Smtp-Source: ABdhPJzmiUegrby/ih3TTnHOVg6dB9Qgxi/9GJxGsOTIVe68coS6CJWRwWQF/j1vMvrKvrGuzp09Cw==
X-Received: by 2002:a4a:a88a:: with SMTP id q10mr25045349oom.27.1608941813745; 
 Fri, 25 Dec 2020 16:16:53 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r204sm8272186oif.0.2020.12.25.16.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 16:16:53 -0800 (PST)
Received: (nullmailer pid 1641376 invoked by uid 1000);
 Sat, 26 Dec 2020 00:16:49 -0000
Date: Fri, 25 Dec 2020 17:16:49 -0700
From: Rob Herring <robh@kernel.org>
To: Nick Fan <Nick.Fan@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: Convert Arm Mali Valhall GPU to DT schema
Message-ID: <20201226001649.GA1641257@robh.at.kernel.org>
References: <20201224123119.26504-1-Nick.Fan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201224123119.26504-1-Nick.Fan@mediatek.com>
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
