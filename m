Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED161A8992
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E901D6E517;
	Tue, 14 Apr 2020 18:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3F26E517
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:30:59 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id s202so8092707oih.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hCA2+SJnjAIpb0+v1mTByhrS43t6QQFIn6K1NItE6O8=;
 b=l8bpO52GxDQC5BgJ/JUXapTEfi/IL/O3EmSgGftJxyBU4mywfYZwHxdrxUGZcdLrEE
 V2mP2CBRyMBKhJqDxDLBV5c0oXOM1ST4LJdzv5doGoCwsApNiP4B3mAwjpkdX8vaY8PI
 p2TE0GgV/6LPk3/YW/yN4pyyenfyBxNdQmvYZQH+su/eEqhvdY9DjnUb7XVE2M8nI5rz
 rWhbeaXdsoW2/xXvJJc2YU/aR6dc1+vZzJzecyoHupUfPNH5DvgsXb1/NqACCTh87Hk4
 HjgHITIQBmkfqU66g5C/V+KB3ghcispxXYmng6Fyr9FDlPKJBfpTPhH4pSx/bAekie4b
 +97A==
X-Gm-Message-State: AGi0Pub5TJtpX6zwXgbUz5pMkhSpB8DI1lHhn8ghhlxXliiG7nQ9+rP0
 1gEXrX2J+0PjRqiSv1oNJA==
X-Google-Smtp-Source: APiQypIossNwbQu0CymziaWK6/BAL0R+wS+f6D9hWJwmXOVzVQBj/k+jSz+bVCJCPhkgWiI14I01Wg==
X-Received: by 2002:aca:6002:: with SMTP id u2mr16614872oib.45.1586889058506; 
 Tue, 14 Apr 2020 11:30:58 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g8sm3550205ots.38.2020.04.14.11.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:30:57 -0700 (PDT)
Received: (nullmailer pid 31207 invoked by uid 1000);
 Tue, 14 Apr 2020 18:30:57 -0000
Date: Tue, 14 Apr 2020 13:30:57 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 11/36] dt-bindings: display: convert
 innolux,p120zdg-bf1 to DT Schema
Message-ID: <20200414183057.GA31140@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-12-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-12-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Sandeep Panda <spanda@codeaurora.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:44 +0200, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sandeep Panda <spanda@codeaurora.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/innolux,p120zdg-bf1.txt     | 22 ----------
>  .../display/panel/innolux,p120zdg-bf1.yaml    | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
