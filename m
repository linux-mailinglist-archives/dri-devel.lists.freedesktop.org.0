Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BACB7DC06A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 20:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D96410E360;
	Mon, 30 Oct 2023 19:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B64010E360
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 19:26:54 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1dcfe9cd337so2097810fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 12:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698694013; x=1699298813;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iMNn8gw95Mi9aB89F2PItspCe/uKw0JKgKBsspi+cN0=;
 b=IjGi8nd9gZpWzo8ez02zNogoxTUC5eUhpfIidVs+8ZnFlrQDpKKVlzJYTVf9eOialR
 FihyIvrAApTsaDKfM0eI8+cf37YP7qh36MgTD7Fv0iY/YR4P6Mqt8lHw4/walR0QOLPq
 dlw+J7l1vtiu1h/EPZCAvCUsKzjliCV9kKPgQH2Un19ZfvQ/XHqmWVq+QjB+Qqbtszo+
 OKeMisKhPJW8oqAFWFtZPzUjGCDkveTacKYCWiMzyRoa5Q46op0Qrhy+pMZnJnKQUr5N
 7wfBy21uVRYIPDb3rLUOd9yWw+zNeYvbUAJHLeV/n314izKnef4xJ8f3WNIVvNULxehu
 27uA==
X-Gm-Message-State: AOJu0YyBWiW0D+Yj0eZTXLsyEqljaZPt1d7qeG7Ym+/kODpj5yrm8+gg
 uvV4zxiV8vYPRRSIO09SFw==
X-Google-Smtp-Source: AGHT+IFqVwsmxx+ch82fJSmqPqoTwRaa9+WOEzKyddP42zM17GUxUkOuZQ+88pjFz/wQkY8Sp+ZVPw==
X-Received: by 2002:a05:6870:d8c8:b0:1ea:ce71:dd13 with SMTP id
 of8-20020a056870d8c800b001eace71dd13mr10661464oac.28.1698694013252; 
 Mon, 30 Oct 2023 12:26:53 -0700 (PDT)
Received: from herring.priv ([2607:fb91:e6c7:c3eb:a6fd:69b4:aba3:6929])
 by smtp.gmail.com with ESMTPSA id
 bh9-20020a056871948900b001cc9bc7b569sm1702946oac.27.2023.10.30.12.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 12:26:52 -0700 (PDT)
Received: (nullmailer pid 1994506 invoked by uid 1000);
 Mon, 30 Oct 2023 19:26:50 -0000
Date: Mon, 30 Oct 2023 14:26:50 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Subject: Re: [PATCH v8 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Message-ID: <169869400953.1994265.3434527810955780048.robh@kernel.org>
References: <20231030100022.9262-1-moudy.ho@mediatek.com>
 <20231030100022.9262-17-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030100022.9262-17-moudy.ho@mediatek.com>
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
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 30 Oct 2023 18:00:22 +0800, Moudy Ho wrote:
> Add a compatible string for the PADDING block in MediaTek MT8195 that
> is controlled by MDP3.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,padding.yaml           | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

