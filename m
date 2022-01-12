Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD848BCAB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 02:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B531E10E30D;
	Wed, 12 Jan 2022 01:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C61510E30D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 01:48:34 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 h20-20020a9d6f94000000b0059100e01744so911614otq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 17:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cUty9fNQLUFbhjCDCZUxiV3yvWgMbjHkj6auv9/shMY=;
 b=bHRknB2DNuVizGCIrjsndmcHk97u0fBGQojMQ12Q/B+T3sQgHpzmYzSXPxr6glZ/Wp
 gBq0zc2uPbbfVOI3R0noLh7um3mlUjN4iSYCW5NLycaB1BqCdCg3CjDD2SsoBCmPWksZ
 4TCgpQ9dTL5DLSMs/uyz7raYHRd1opuhRBDIXn/Jly/H10oetzmKL4M4UUUcsZgz22+J
 9M0Gy/ZEv4UChZgvBsqWJK3XMP53UOtvJgSQqoLo38rtoHUoTKkDFrFCBE4lHpAb5Y7M
 LtyBEO+Ne4HtRjYDWZ8MnIQslm19GXGPZPaK1YFLtXVCy64O/XZtL/XHJQRYK8txsbWH
 onTQ==
X-Gm-Message-State: AOAM532v+EwKxv2Zd4rsQadNGCYxovQI/Zant/M9glxw3WtO4ijWn6Yh
 PqbFlZbdmO4qrXYW132uuw==
X-Google-Smtp-Source: ABdhPJyNoHwHxRvMowkk4XMvIcs0XWUlxsNKgpFHMaWJ8SnTQmMcxFP7hQVT00CDE3e213sqaNJXLA==
X-Received: by 2002:a05:6830:3489:: with SMTP id
 c9mr5451305otu.206.1641952113557; 
 Tue, 11 Jan 2022 17:48:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q189sm1375079oib.8.2022.01.11.17.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:48:33 -0800 (PST)
Received: (nullmailer pid 3895404 invoked by uid 1000);
 Wed, 12 Jan 2022 01:48:31 -0000
Date: Tue, 11 Jan 2022 19:48:31 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel:
 feiyang,fy07024di26a30d: make reset gpio optional
Message-ID: <Yd4zb/psD6vzwIli@robh.at.kernel.org>
References: <20220107051335.3812535-1-pgwipeout@gmail.com>
 <20220107051335.3812535-2-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107051335.3812535-2-pgwipeout@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 07 Jan 2022 00:13:32 -0500, Peter Geis wrote:
> Some implementations do not use the reset signal, instead tying it to dvdd.
> Make the reset gpio optional to permit this.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  .../bindings/display/panel/feiyang,fy07024di26a30d.yaml          | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
