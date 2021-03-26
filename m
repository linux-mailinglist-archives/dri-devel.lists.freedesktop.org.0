Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF02349D55
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 01:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B996EE83;
	Fri, 26 Mar 2021 00:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180E16EE67
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 00:09:12 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id 19so3674817ilj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 17:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a11hWINvZadDTUc1x1p5mvJKc6CEu6ZdeGypWrdKiFU=;
 b=W2T5sI7WLIl/WbJJRKJb3dslCqgDNWeQGbBXkezqEP14Qpbm0TULAav+J5HGuxucYN
 hvB5u/K7vfH+8P39PVjY9/Ply6oof8/lPbCIFNFBPaQRtjhYPAjJpDaQlCHPgKZwQE6B
 vqvBHr1ybH9yA6/2rm34u+MJHOe9LhcnHC5eAmOGn6kRawLOITmAcXnQhTpFTvnvNsts
 4lg9RbtmX0eQXE2G5sR7EnnV5P231giwSTXwqAtDl69EZWQ8v9GZMcGL7Vh7nb96l5oK
 rb7Jak+22B5RPA6TelPysZxzciHBnCJ1ZuXmMDM3uP7039a9EerqQ90FcRKgzgXZifUc
 iepA==
X-Gm-Message-State: AOAM530yuRaP/gPVAbD9ui3zw5iB3RcdIbymQ+D5q3iYBE+LlPBaBbu5
 U2f6VDSpW5MNzyY6VEKA0w==
X-Google-Smtp-Source: ABdhPJzpAml0C5TSFU9R4CKJ+PFO/N5I4vdC0tlV9SBzBs50molUg1khoXURpZiOCFbTEj49M4Tgow==
X-Received: by 2002:a92:c545:: with SMTP id a5mr7599351ilj.209.1616717351425; 
 Thu, 25 Mar 2021 17:09:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id f13sm3377606ila.51.2021.03.25.17.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:09:09 -0700 (PDT)
Received: (nullmailer pid 2001388 invoked by uid 1000);
 Fri, 26 Mar 2021 00:09:07 -0000
Date: Thu, 25 Mar 2021 18:09:07 -0600
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on
 sc7180-trogdor-pompom
Message-ID: <20210326000907.GA1965415@robh.at.kernel.org>
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, drinkcat@chromium.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Steev Klimaszewski <steev@kali.org>,
 swboyd@chromium.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 16, 2021 at 02:08:19PM -0700, Douglas Anderson wrote:
> The sc7180-trogdor-pompom board might be attached to any number of a
> pile of eDP panels. At the moment I'm told that the list might include:
> - KD KD116N21-30NV-A010
> - KD KD116N09-30NH-A016
> - Starry 2081116HHD028001-51D
> - Sharp LQ116M1JW10
> 
> It should be noted that while the EDID programmed in the first 3
> panels indicates that they should run with exactly the same timing (to
> keep things simple), the 4th panel not only needs different timing but
> has a different resolution.
> 
> As is true in general with eDP panels, we can figure out which panel
> we have and all the info needed to drive its pixel clock by reading
> the EDID. However, we can do this only after we've powered the panel
> on. Powering on the panels requires following the timing diagram in
> each panel's datasheet which specifies delays between certain
> actions. This means that, while we can be quite dynamic about handling
> things we can't just totally skip out on describing the panel like we
> could do if it was connected to an external-facing DP port.

Is this a 'standard' eDP connector? AFAICT, there does seem to be 
such a thing. I've said in the past I'd be okay with a edp-connector 
node. If that needs just the "HPD absent delay" property, I think that 
would be okay. It's just a never ending stream of new properties with 
each new panel that I don't want to see.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
