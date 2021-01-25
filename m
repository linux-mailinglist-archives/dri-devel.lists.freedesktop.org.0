Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C251B302E3E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 22:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3A86E0FD;
	Mon, 25 Jan 2021 21:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEFD6E0FD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 21:47:50 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id n7so4498863oic.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 13:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4U5Iaql8VOgM/DLTY8lNymZH+MQ4mAZ9WR6+DIkahZ8=;
 b=ZDG7OPHo8L7himGF8RF6xEnyxzWF51QtZHothMDEKx54eoA5QHUJ1BDDzpi9nK8l22
 nUnzKuqjVwVOwP5PyCXcbr7w6guE+Kjfucd9Z4UZ+BtgSLO3eimL1GjIuoORuNf4RJeu
 Z5zJGDBjWZkzNK2SB+eAR5qOUsuV/dzJht0t5Qc4MyYVy5fbGBsuCkbCBdiz7spb+OHm
 yLF7NXsOdif3zQ+6QIUFZZBjqxx025Q8C3AwQWFoKZAYW2XqCj9lNc+DHIAnEHge59uh
 cW9w3I9fzPfik0fO/tcj9/0dgXVsAIxlXuWsiRQGkdqY3/avbUq9WJIb5QN8vapOZ9C0
 22ng==
X-Gm-Message-State: AOAM532shHNNHJoALZawsou25U7zGxOfz8T/fKNC8i18ZJ2ORsHoUMeU
 xo3yz/9OlEqUS4yRg6HdxA==
X-Google-Smtp-Source: ABdhPJybxOVVFOS3NkAAEC/AR9Y5/4kVSK2OgYDipCWcKbf9Z7GreQV5ccgTMO22ZvTm5DoLFx1oaQ==
X-Received: by 2002:a05:6808:3b1:: with SMTP id
 n17mr1330058oie.41.1611611269620; 
 Mon, 25 Jan 2021 13:47:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p23sm3758067otk.51.2021.01.25.13.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 13:47:48 -0800 (PST)
Received: (nullmailer pid 1065810 invoked by uid 1000);
 Mon, 25 Jan 2021 21:47:47 -0000
Date: Mon, 25 Jan 2021 15:47:47 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 2/2] dt-bindings: display: Document BOE BF060Y8M-AJ0
 panel compatible
Message-ID: <20210125214747.GA1065748@robh.at.kernel.org>
References: <20210114175024.399756-1-angelogioacchino.delregno@somainline.org>
 <20210114175024.399756-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114175024.399756-2-angelogioacchino.delregno@somainline.org>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, martin.botka@somainline.org,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jan 2021 18:50:24 +0100, AngeloGioacchino Del Regno wrote:
> Document the boe,bf060y8m-aj0 panel.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../display/panel/boe,bf060y8m-aj0.yaml       | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
