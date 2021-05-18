Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DA9387963
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 14:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043AA6EB5D;
	Tue, 18 May 2021 12:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546AD6EB5C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 12:59:32 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 e27-20020a056820061bb029020da48eed5cso2204693oow.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 05:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ql+9UOI+ynnNwT/MKTb6YYHrLFl/HmtKIOBbQYJJbdE=;
 b=gUwdJ564zFSXrJy+IwqrBjjGzmtsFnX8jJ9WJm8AZAVg5FPkA8VjB5EzQcaQ1xcC29
 60KEQ7tZUz+YykHhe3u2YDrnT/guojTv1w2PY+z1A8f84XgA40beadk31Q583yGOyPsJ
 eDjTBFVDYkVtPBQwqxuaEMPDwn7hlmQjLx7XtBTFqQaoI9FhwQrwk6mv9tDutrJvsK8X
 lqOF2D+YvxtglhANN9K/5o5PeRL/ecgq5GQk6yLelvMk+fR49voJfnvcgAr8jX7gav9z
 dQ+gVi+jV9f8K5lEJaetjbSYGP+DuXTD8h12FttBg4oecDlhPH4JWSZunXKFtpLuu3pr
 coog==
X-Gm-Message-State: AOAM532FDWs38A8sxjiTZGt3iK7T+vheApA8AlBmmdXIrPX4YNRYNfBk
 gHU956YSRAOXW0Qn2wAzu0whm8/LOA==
X-Google-Smtp-Source: ABdhPJy15udTxFSSU+fKRJjg3g6/siEwKnl4fNQ+78a+Mb7vXu3vmgtlxALvUy9RzGKheAO7vg50ug==
X-Received: by 2002:a4a:e697:: with SMTP id u23mr4243417oot.51.1621342771562; 
 Tue, 18 May 2021 05:59:31 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h11sm362697ote.72.2021.05.18.05.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 05:59:31 -0700 (PDT)
Received: (nullmailer pid 492742 invoked by uid 1000);
 Tue, 18 May 2021 12:59:30 -0000
Date: Tue, 18 May 2021 07:59:30 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: lvds-codec: Fix spacing
Message-ID: <20210518125930.GA485447@robh.at.kernel.org>
References: <20210515203932.366799-1-marex@denx.de>
 <YKBBlWXXK8LUc8ac@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKBBlWXXK8LUc8ac@pendragon.ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, ch@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 16, 2021 at 12:48:05AM +0300, Laurent Pinchart wrote:
> Hi Marek,
> 
> Thank you for the patch.
> 
> On Sat, May 15, 2021 at 10:39:32PM +0200, Marek Vasut wrote:
> > Add missing spaces to make the diagrams readable, no functional change.
> 
> Looks better indeed. The patch view looks bad though, because of the
> tabs. Maybe you could replace them with spaces, while at it ?

It's best to not have tabs in yaml. And if we ever generate any 
documentation out of the schema, the tabs would probably cause issues.

Rob
