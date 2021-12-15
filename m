Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBF3475D5B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7C110E8B3;
	Wed, 15 Dec 2021 16:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BB710E98F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:27:15 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 n104-20020a9d2071000000b005799790cf0bso25592469ota.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 08:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mRjfzGCFsyEy9liNkofQ4/Kvoz3LJlq+jyN1RL2p0+w=;
 b=X/Gj7AguCp0dGSNM1wvYcB8XdBxr+0BIcoghTN0YgNk6ZNgYn2pE4IFzw9wdk1nPaJ
 EuUh96lDglRvW1jalPrMDgdHUmNXQsJAZG+qfyuVrTmi+M8D+jHzSDylzTYo+2KLe2uw
 zq+iX81l2IOLW0pLpNPE3FsUT89aminbq5aRSCvkEPQXUJRQsinGHJndm0qA1wXvveQI
 /IvOvv36vycu8GG4bpjURDU/2aT5U96H3T35N1F5OMe+vsZ/UHnJFp5m6MHwN/+cfUnu
 OyphOVqQoMJHCRG09lVrMEYqBj2ANcyVxgp5m4DFykk/Wf9dyusrPxe68tZly8E3BFmU
 XuTw==
X-Gm-Message-State: AOAM5319dxPax82zWTnhEzm6mxpu9eH2fiKsT2fP+sB6ZLrvGy3Ag4/J
 Xc1dDf/2dCgwEC2DtjMuG2gf3a9nhw==
X-Google-Smtp-Source: ABdhPJz7cwNq1L5+PZs4RmdzDlYifLHy9xBrYU9l4KrMX1zbl4Y1pZvmi0gCVQcogvUT6QO5WJ9pwg==
X-Received: by 2002:a9d:4e89:: with SMTP id v9mr9559811otk.352.1639585634572; 
 Wed, 15 Dec 2021 08:27:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v20sm515081otj.27.2021.12.15.08.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:27:13 -0800 (PST)
Received: (nullmailer pid 1427316 invoked by uid 1000);
 Wed, 15 Dec 2021 16:27:12 -0000
Date: Wed, 15 Dec 2021 10:27:12 -0600
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 06/18] dt-bindings: display: rockchip: dw-hdmi: Make
 unwedge pinctrl optional
Message-ID: <YboXYKbjRmbUO1Wt@robh.at.kernel.org>
References: <20211208151230.3695378-1-s.hauer@pengutronix.de>
 <20211208151230.3695378-7-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208151230.3695378-7-s.hauer@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Dec 2021 16:12:18 +0100, Sascha Hauer wrote:
> None of the upstream device tree files has a "unwedge" pinctrl
> specified. Make it optional.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
