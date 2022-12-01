Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB2B63FC1B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 00:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA65010E68D;
	Thu,  1 Dec 2022 23:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3860710E68D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 23:34:50 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id v13so3740207oie.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 15:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AHPzwPPmVpEqjanwr4jgFBm+n/uWlEBRqCWBwP5Ob4o=;
 b=E3WpwczZNlvVKBsKkiwgw8P//EwCZHCzbiDrHVjcTK1rz+gfJpha4upJinK0tld20P
 CpKJPFKwqZhzzZCklXRjXzvQhXdjtvMvvwZnpqycMtirZMTtD3kdgiqfFaLB6IAJkWnd
 2P2oj5nZfQlhWDN8C09FEkgkCydsQIPPvQGGsqw5fhsgux73vI4XLNT/OiYCMHKF5FBY
 6tmymKyykDatEsDEj1iAzrEQorR6HKoojNJC+zufGubaPP+u21lbqsoORAcS+8RFK4+h
 UOBkQpn3iGNZOXAL06rtcu+f0Aotggk5ycJHQJ7YBslD3ptuylhq1BDyXg13fZD4WR+j
 ZPmQ==
X-Gm-Message-State: ANoB5pmvqCR2ehy6x18CRd2Tt9MAzLAivVJyu6GcBGBqGH6nMbtrYYJ6
 xzlvLsn8zPnE5JXrabSC/g==
X-Google-Smtp-Source: AA0mqf6lSjgPUF0IN9rm8Ml0Vg8feDJ4KS/+1+Grxk2A70CmEtbn+Bvn667l56WuIeDPVHWrTy/A5w==
X-Received: by 2002:a05:6808:3a8:b0:354:7a3c:6984 with SMTP id
 n8-20020a05680803a800b003547a3c6984mr22728704oie.269.1669937689212; 
 Thu, 01 Dec 2022 15:34:49 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f9-20020a4ace89000000b0049fd6bfde95sm2308409oos.26.2022.12.01.15.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 15:34:48 -0800 (PST)
Received: (nullmailer pid 1688407 invoked by uid 1000);
 Thu, 01 Dec 2022 23:34:48 -0000
Date: Thu, 1 Dec 2022 17:34:48 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V4 1/3] dt-bindings: display: panel: Add Samsung AMS495QA01
Message-ID: <166993768688.1688353.12388291303431485909.robh@kernel.org>
References: <20221129172912.9576-1-macroalpha82@gmail.com>
 <20221129172912.9576-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129172912.9576-2-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 linux-rockchip@lists.infradead.org, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 29 Nov 2022 11:29:10 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for the Samsung AMS495QA01 panel.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../display/panel/samsung,ams495qa01.yaml     | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
