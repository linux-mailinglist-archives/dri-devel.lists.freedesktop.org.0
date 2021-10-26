Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C415B43BDFE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 01:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E17D89817;
	Tue, 26 Oct 2021 23:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EAC89817
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:37:34 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 z11-20020a4a870b000000b002b883011c77so305043ooh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 16:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4670SkK0w4/UKayAjq/weXcDXPpJisLvckFdsXwxx04=;
 b=qDeYLLaacaOYDLvzQjFUdKe/gwi3ud4G8TT+JBlpfBHLDoFQGTJ2EOSL5ECXYP7sQB
 gQF6LkxdPlIVn5iGBISJhNjnhZFELVsAPIqVnNWinCsO2fVQJzSWJ95HQ9LDBoNTqba+
 DzxXKD0+5emAFL01ZGdNV5PLIH5Xwn72c2uVTHle6Q2uIDGwKVqzIf0Jlvxnk1w7uXHD
 Vt5Rn9fsnROH/7Ri4oHWhhrvZU592XSg5NN57+HBBMCGWJMgu6AfGTrOWO2blPONHToO
 j99SUGDXIRu+NkKY8s5Ydylxz8sTYNnDpKz3wOu9MggkosEaBAkq6Ti1EZzCYcNrmtn3
 xXEA==
X-Gm-Message-State: AOAM530eZmhKBHGtXupoGkS3SByyAQhvl3xN1yWQZ+rppfVE+XfMXN4Q
 1pjfK/QjmfHFzi2D6AX1Ig==
X-Google-Smtp-Source: ABdhPJxnyG3zeEG3Iobe/YeC916tooCWbnqCtO5S93XiblBa1sANXubXQFNKt6o3YDt3tRPr5TpcrA==
X-Received: by 2002:a4a:aacd:: with SMTP id e13mr4618686oon.67.1635291454223; 
 Tue, 26 Oct 2021 16:37:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w9sm4977235otp.64.2021.10.26.16.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:37:33 -0700 (PDT)
Received: (nullmailer pid 3544534 invoked by uid 1000);
 Tue, 26 Oct 2021 23:37:32 -0000
Date: Tue, 26 Oct 2021 18:37:32 -0500
From: Rob Herring <robh@kernel.org>
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, monstr@monstr.eu,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, git@xilinx.com, devicetree@vger.kernel.org,
 Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH] dt-bindings: display: xilinx: Fix example with psgtr
Message-ID: <YXiRPKSKSUpfsh+y@robh.at.kernel.org>
References: <a291be294dea6e580ad9acd436742a48b7cd00a2.1634539210.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a291be294dea6e580ad9acd436742a48b7cd00a2.1634539210.git.michal.simek@xilinx.com>
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

On Mon, 18 Oct 2021 08:40:12 +0200, Michal Simek wrote:
> Commit cea0f76a483d ("dt-bindings: phy: Add DT bindings for Xilinx ZynqMP
> PSGTR PHY") clearly defines #phy-cells as 4. In past 5 cells were used by
> it never went to upstream. That's why fix example by using only 4 cells
> instead of 5.
> 
> Fixes: e7c7970a678d ("dt-bindings: display: xlnx: Add ZynqMP DP subsystem bindings")
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
>  .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!
