Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA363AD29A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 21:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599A76EA79;
	Fri, 18 Jun 2021 19:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95EC6EA79;
 Fri, 18 Jun 2021 19:13:27 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id u11so11653373oiv.1;
 Fri, 18 Jun 2021 12:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dl4FOlqLv4Z0Tulz8jAFPR7A25eMTlDbZSxoXS0J78s=;
 b=YKjgPUtND7kfH6jfU14KZrrT0SCbpvowtRzFYYXVId1UQOliH4+fvA6qanuBLXK3Dq
 Eyhs1MkJBSdYe6+TfLb+gsYj8VUiNH4I3Q8eAdFbw/QDthvnH/QoqM0IcLArqC3YLmiW
 0MaIiubNMP78/+1Qb9JzgTqQtUjo95/Zl3D/nabso25Y3/D0Ego4TK8OSXk6YKql79LB
 RcnZsXBTUTYLEc4comIhnDPV52vvzexqBE+K7ZCYN4y/Iym6H9WT6pXVx6G/DAk294pu
 jybhKBVujjngdQEZeNkCP2JEd/YBVNwy2s8nXVT6TuwcfUZUJFllYmmF6SjM3dzllAqI
 VlPg==
X-Gm-Message-State: AOAM530yOfrceAlu0DQ/3cvTcTxgmPJvmuagWQEruPbGwlH+k9nrhf1y
 Q2l1YV3jgr6hl1VB91Rx4Q==
X-Google-Smtp-Source: ABdhPJwWvWUw3Eoz7g/amv13AZe9VuDvwk0tm5r4DTID96jvLll7efVHE4u/i1wwFWcpThEVW/k4Uw==
X-Received: by 2002:a05:6808:2019:: with SMTP id
 q25mr15882040oiw.84.1624043607101; 
 Fri, 18 Jun 2021 12:13:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id 79sm2215467otc.34.2021.06.18.12.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:13:26 -0700 (PDT)
Received: (nullmailer pid 2644851 invoked by uid 1000);
 Fri, 18 Jun 2021 19:13:23 -0000
Date: Fri, 18 Jun 2021 13:13:23 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v4 1/3] dt-bindings: msm: dsi: add missing 7nm bindings
Message-ID: <20210618191323.GA2644798@robh.at.kernel.org>
References: <20210617144349.28448-1-jonathan@marek.ca>
 <20210617144349.28448-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617144349.28448-2-jonathan@marek.ca>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Jun 2021 10:43:33 -0400, Jonathan Marek wrote:
> These got lost when going from .txt to .yaml bindings, add them back.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
