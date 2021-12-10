Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D24470C6C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 22:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B4610E30D;
	Fri, 10 Dec 2021 21:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23E810E30D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 21:18:57 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso10899516ots.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 13:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Our/pN1IyVCtIS8mIewFtFMewda+bHas4rs49FN0p6s=;
 b=5+Sy8RhmsPypOECatBRjbj41u8QUuFQivtJNE58hDe6N6nVlDvg8nc4Ac9S5VbtqxF
 RQm+Sk+7eIW9ed94RqDQGe8CEWxqnYyau32qs16I9dGn2xci/H7FOv97ZRICl5aRSGwS
 AvDJf4vErJ3pfZSjbhedY0dlaIew1Z9PKUMx9ZnHKSJycwobo+39c8YL5oYYE17dfSJh
 htKae6ZXTFho2r3icz65tpToswdiAmQuDZDkRWuh4owjieoLg/RA8KsJdz8lWgu1RF9t
 XSeLmZr3wTXMSe/sGiFGSvhZzFfEz/mjVw2ixHreLXOebeWihjwu0m1CUOfYM7RRrcET
 Z84w==
X-Gm-Message-State: AOAM532z4leJYpYW9yHgren2U1twlnpkFCdHPuvu1+YBMIaTqIr/I5fr
 BA7GF3OzFjb1QhI8sypHtQ==
X-Google-Smtp-Source: ABdhPJyHmK8KkTYDC8dC39vS4BDv14WHjiA1TtUa3WbDo5zSxnrrirNWYG/gK9DPHglZ1YKjtd2FmQ==
X-Received: by 2002:a9d:1e1:: with SMTP id e88mr12745468ote.75.1639171137206; 
 Fri, 10 Dec 2021 13:18:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x16sm741453otq.47.2021.12.10.13.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 13:18:56 -0800 (PST)
Received: (nullmailer pid 1916612 invoked by uid 1000);
 Fri, 10 Dec 2021 21:18:55 -0000
Date: Fri, 10 Dec 2021 15:18:55 -0600
From: Rob Herring <robh@kernel.org>
To: Tommy Haung <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH v5 7/7] dt-bindings:ast2600-clock Add CRT reset define
Message-ID: <YbPEP9VoYdDWitez@robh.at.kernel.org>
References: <20211208013337.13806-1-tommy_huang@aspeedtech.com>
 <20211208013337.13806-8-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208013337.13806-8-tommy_huang@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, andrew@aj.id.au, robh+dt@kernel.org,
 joel@jms.id.au, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Dec 2021 09:33:37 +0800, Tommy Haung wrote:
> Add new CRT reset define for ast2600.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tommy Haung <tommy_huang@aspeedtech.com>
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
