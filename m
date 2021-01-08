Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F341B2EEB7B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 03:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F74A6E5BD;
	Fri,  8 Jan 2021 02:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427676E5BD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 02:52:35 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id 81so8311814ioc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 18:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j9BJOm6Gyl9YhJRZvOpzUQv+7D7nE5zdeZRpcSuRRBI=;
 b=GEVZEZUyfsf00zSGXOKUKFhgYPoIW/uPoDzLkNklfCOwgZrg8N/OlihwiisbYc5rQq
 LmTcz9xu+HCm8LI4Hxq6aZ2lG3Gy14EpFek6m3xq1ESyEW5a1NY85du1SoZcOEbfsh9+
 AdQ2v6jKQ7uNz1iA4iqE0EVzcKLeSOyG5zD+lpXjyM4MM2DYk2GprhtFtJrmrUmH7FCx
 DZuGZi0X9d73F5L1QgtS/rstY/b9eEy3kaluTfrbzcNVg69xp/DSjxVMiE3jYBEzAl+J
 sprAmzI2mCzKK7JXq1t7VJDrBLwFACD3r5/8hkgI25pKTiMrYJCqfNu3Cqhw9jvbjz0o
 WSpQ==
X-Gm-Message-State: AOAM532kR0Mkl/8s//9XDNA03buv6XzsNG/g/Y6FhHB5IILDbV7yUkMp
 oJdpS2ZmIbZe+6k9yv6NsA==
X-Google-Smtp-Source: ABdhPJxSj3GS6b8u4lJrqSge/6GnqMxaAVuJHdUXCdgq9UGMMZClQFUGQc3VppY2A5kzN6A5IQaUGQ==
X-Received: by 2002:a05:6638:1a:: with SMTP id
 z26mr1500734jao.52.1610074354559; 
 Thu, 07 Jan 2021 18:52:34 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b13sm4525239ils.54.2021.01.07.18.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 18:52:33 -0800 (PST)
Received: (nullmailer pid 1782876 invoked by uid 1000);
 Fri, 08 Jan 2021 02:52:31 -0000
Date: Thu, 7 Jan 2021 19:52:31 -0700
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v2, 1/3] dt-binding: gce: add gce header file for mt8192
Message-ID: <20210108025231.GA1782839@robh.at.kernel.org>
References: <1608770889-9403-1-git-send-email-yongqiang.niu@mediatek.com>
 <1608770889-9403-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608770889-9403-2-git-send-email-yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
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

On Thu, 24 Dec 2020 08:48:07 +0800, Yongqiang Niu wrote:
> Add documentation for the mt8192 gce.
> 
> Add gce header file defined the gce hardware event,
> subsys number and constant for mt8192.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mtk-gce.txt        |   7 +-
>  include/dt-bindings/gce/mt8192-gce.h               | 419 +++++++++++++++++++++
>  2 files changed, 423 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/gce/mt8192-gce.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
