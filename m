Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B49402E5E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 20:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79296E091;
	Tue,  7 Sep 2021 18:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBB16E057
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 18:29:43 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id q39so21049oiw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 11:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WBm3/RVc74JuFx//faY79xyo3QlJCEJNAqjGkmkQ+8w=;
 b=Y+VrZf7ZBNb1/gKlkPE85BPFRBnAH5WabCO8U7Gw/CJS9cpMdj5ecfemhbc2CqZChJ
 CM692tHpRQr27NyfFSu7L0OH3oLcmdP+oGWXZOC8Q78Y5gpjPkpfNVNUp7+UOeRkexKy
 J1VtZT7EMX+RvGZqf9hEfsSW1hWrgvFEetDgz4Q2XG+2t84JRouhVL8idAnZCD+M/68t
 hwpYIjUXU98z9BR38x3WFMxP4GUmEnRlM+ujE1Becbwq44TvXfxQz2QUOKSTFFxlrBci
 wkK7O/PqzIaRC58myxWMWsfwiqJmH66Ej55YXSI9S/kEKYlL/RVZGNVilCBczJqaZw3K
 Cz/Q==
X-Gm-Message-State: AOAM530mROvlIZvHoXV1WT0wD/wWV+w3Cubaa/NOghn+Q+mILl23RVNp
 3DPgtOSjWRv2u5gAQdrnLtfvPYohWw==
X-Google-Smtp-Source: ABdhPJyYC9hHrsEvwSbpnoLjACNQhcERTQQfgkhoJWHhla+NVH53kaUnth9ZlD2f5Ggaf968yJgYBg==
X-Received: by 2002:a05:6808:1481:: with SMTP id
 e1mr3945250oiw.5.1631039382328; 
 Tue, 07 Sep 2021 11:29:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v19sm2246925oic.31.2021.09.07.11.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 11:29:41 -0700 (PDT)
Received: (nullmailer pid 108976 invoked by uid 1000);
 Tue, 07 Sep 2021 18:29:40 -0000
Date: Tue, 7 Sep 2021 13:29:40 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: marijn.suijten@somainline.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 martin.botka@somainline.org, sam@ravnborg.org, phone-devel@vger.kernel.org,
 konrad.dybcio@somainline.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, thierry.reding@gmail.com,
 daniel@ffwll.ch, paul.bouchara@somainline.org, robh+dt@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: display: Document BOE BF060Y8M-AJ0
 panel compatible
Message-ID: <YTevlAXUHcw0Db0w@robh.at.kernel.org>
References: <20210901173115.998628-1-angelogioacchino.delregno@somainline.org>
 <20210901173115.998628-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901173115.998628-2-angelogioacchino.delregno@somainline.org>
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

On Wed, 01 Sep 2021 19:31:15 +0200, AngeloGioacchino Del Regno wrote:
> Document the boe,bf060y8m-aj0 panel.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../display/panel/boe,bf060y8m-aj0.yaml       | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
