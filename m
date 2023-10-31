Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A297DD596
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 18:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAC810E5A0;
	Tue, 31 Oct 2023 17:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B0810E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 17:55:08 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1dd1714b9b6so4054684fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 10:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698774907; x=1699379707;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3sOmvixHfQMEf6cSX5X+V5dJf4sK0eb9T02qoOsLX1I=;
 b=VUjmaDeuri/9hYvpCw1azpFWNM6bBWggkB2nXXrUuEPt2cjU6NeMjFiYRwXnMyN449
 SHAZe7CdTBnfHYT/f0fu6nTmCvfLxBbKHZXG1C0KefLYCpPP1/YSV3bV650pEtyGJgVO
 gbpcps2rI1Q7wXMBot0BqHz1RJQrKt+V1cZCBRn4vcr2PFh2bPzsAfYiONGlyTIZp3mS
 DWFAFSEEsEvcwzmMQlbXO7saXY4lwrYn1nc2v00NWZEeztbdACengbwtKeHx/b3trk/F
 OgblGF9Dbpnnp5EUG2bvoCvd1+HZX5OzWPfYQOVQgX+i64gaF309XvJV/lxFGsw5NDif
 T3RQ==
X-Gm-Message-State: AOJu0YzfhcPEdpKWmaPkNQaXiWgkK5SHGGoE3iOJbTa18v/ngd5gizlG
 9PVHCjRKj6I0u7F9J0tt9g==
X-Google-Smtp-Source: AGHT+IFmuj30SZPqXu2EIXyI7kKLettnOwn2LVc9BC4D5MXj13OHIw3L94S9nKTG5g66A8WPtZAtEA==
X-Received: by 2002:a05:6870:cd93:b0:1e9:97cc:59ff with SMTP id
 xb19-20020a056870cd9300b001e997cc59ffmr16786765oab.9.1698774907268; 
 Tue, 31 Oct 2023 10:55:07 -0700 (PDT)
Received: from herring.priv ([4.31.143.193]) by smtp.gmail.com with ESMTPSA id
 n1-20020a056870034100b001e9b02b00e9sm368369oaf.22.2023.10.31.10.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 10:55:06 -0700 (PDT)
Received: (nullmailer pid 1809590 invoked by uid 1000);
 Tue, 31 Oct 2023 17:55:05 -0000
Date: Tue, 31 Oct 2023 12:55:05 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Subject: Re: [PATCH v9 02/16] dt-bindings: media: mediatek: mdp3: merge the
 indentical RDMA under display
Message-ID: <169877490486.1809532.9023561200743242448.robh@kernel.org>
References: <20231031083357.13775-1-moudy.ho@mediatek.com>
 <20231031083357.13775-3-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031083357.13775-3-moudy.ho@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 31 Oct 2023 16:33:43 +0800, Moudy Ho wrote:
> To simplify maintenance and avoid branches, the identical component
> should be merged and placed in the path belonging to the MDP
> (from display/* to media/*).
> 
> In addition, currently only MDP utilizes RDMA through CMDQ, and the
> necessary properties for "mediatek,gce-events", and "mboxes" have been
> set up for this purpose.
> Within DISP, it directly receives component interrupt signals.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 -------------------
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 42 ++++++++-
>  2 files changed, 38 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

