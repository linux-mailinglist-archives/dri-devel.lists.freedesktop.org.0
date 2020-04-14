Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9955E1A8A48
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF0D6E53E;
	Tue, 14 Apr 2020 18:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A64A6E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:54:06 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id w12so709963otm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kmPsIaQP5KMooblYRoWezJ0UlsEuPl/dt/DckuGO7ZA=;
 b=Ux3QY0X1iNq2HUVpFRg40mWSE5sNzWapN/IQtMxFuj3yKrdPeV1W+16Hd3YkJJ/FGY
 Qh6VKHtSMRzqVlyoGet8g+t+8T+pejsELrexrWWUxwqFjyI0YzQbNz4jipt194aSVBJM
 r8dxdTez+iva7IcGRK4Qd/PcJACEfbOpNERgFdJdnUdKxOxyOk6+sofdblL8WqBqPRpB
 Z52XJS9tXmFuAZkTJhElk/twHrkGupCRCorKcnYYhFb0UgopbUGMLAClTHKm3chwvIXm
 skytr1+3ViCjJlNzv2TOE3vMs2hqI+z+0mOP2YcDR9agu3L4p7spb8WtUXSQeqBAttO4
 qPSQ==
X-Gm-Message-State: AGi0PubxtbwcBAZEGpgMcOeX8AcbZD4lHg+xZaaeNGusDgDt4MYETG2k
 rkn4ydcqQsvMNcDV2kSMRNKWhIM=
X-Google-Smtp-Source: APiQypKdGD/FSc00sPVSQf5wlNVzrVoViIugO6yPcV0GsI0rZyLM7N7krbcR3AWLLOQTO6JuuXtE4g==
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr4002041otp.269.1586890445368; 
 Tue, 14 Apr 2020 11:54:05 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u205sm5799839oia.37.2020.04.14.11.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:54:04 -0700 (PDT)
Received: (nullmailer pid 9188 invoked by uid 1000);
 Tue, 14 Apr 2020 18:54:03 -0000
Date: Tue, 14 Apr 2020 13:54:03 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 29/36] dt-bindings: display: convert sharp, ls043t1le01
 to DT Schema
Message-ID: <20200414185403.GA9127@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-30-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-30-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Werner Johansson <werner.johansson@sonymobile.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:51:02 +0200, Sam Ravnborg wrote:
> The txt binding specified the property "power-supply".
> But the example and the actual implementation in the linux-kernel
> uses "avdd-supply".
> So the binding is adjusted to use avdd-supply as this seems
> to be the correct choice.
> There are no DT files in the linux kernel to check.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Werner Johansson <werner.johansson@sonymobile.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/sharp,ls043t1le01.txt       | 22 --------
>  .../display/panel/sharp,ls043t1le01.yaml      | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
