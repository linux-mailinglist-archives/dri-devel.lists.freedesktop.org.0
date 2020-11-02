Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACA82A2E5C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 16:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FCF6E4F9;
	Mon,  2 Nov 2020 15:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1156D6E4F9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 15:31:37 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 32so12961788otm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 07:31:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VkT+mPMaNNQ1uOKIaMs+kRmIM51v2J/yVY8GqjEu4z8=;
 b=ZOt4Cfi9uz9qiCEOtIsgljV9GneypOknvb+3FMHF2/qhFH81Nz4Ur/0tjLKuitKiMM
 QXXkhIPy9waj0332vzLOTv6X1o5QoqlxyHoA9sFN3ObjRkV9fHfn0/ZlBUeCEdeVBL97
 zYMhKqiIF0y6+yIHwyK/y3tnIFRnBg7u3vVdneCnrCBBlip9HYig36dTsDaFh2fP3wpO
 aLB06t5H40RoPl6wx4dZyzu2K/EuV++MwpOSx9LgTTeTFozm4g+XgEKMEx4O6iKagUax
 YqSZVw++GAZVTKg52EG8jr7X6zvzn5Z3jIXU3Z7Ur9b+pFv3LX7/+ucHQwDc+2ZasKNV
 3hXQ==
X-Gm-Message-State: AOAM532sSH4CckOK816Pn2ZzXHsaApzK4Ac85HYfu54nmUWFGcwYMLGy
 fFA/o+N4ZWlL7zrabJ8KLA==
X-Google-Smtp-Source: ABdhPJzSjtrS3V+u2N9M3si1fuHKu8kg2Sm7lQ8cTJN5U0K1HL/CUzmbAhyLo5Opyy+1m9o5Fnc/zg==
X-Received: by 2002:a05:6830:16c2:: with SMTP id
 l2mr13167027otr.255.1604331096459; 
 Mon, 02 Nov 2020 07:31:36 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t83sm3500406oie.58.2020.11.02.07.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:31:35 -0800 (PST)
Received: (nullmailer pid 3927926 invoked by uid 1000);
 Mon, 02 Nov 2020 15:31:35 -0000
Date: Mon, 2 Nov 2020 09:31:35 -0600
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: dt-bindings: display: simple: Add
 BOE NV110WTM-N61
Message-ID: <20201102153135.GA3927896@bogus>
References: <20201028155617.v2.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
 <20201028155617.v2.3.I28d9e32b3cc0aae980ecc39d364263a3f9871298@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028155617.v2.3.I28d9e32b3cc0aae980ecc39d364263a3f9871298@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Oct 2020 15:58:03 -0700, Douglas Anderson wrote:
> Add yet another eDP panel.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
