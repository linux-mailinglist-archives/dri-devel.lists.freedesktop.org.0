Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D115F389759
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 22:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C756EE83;
	Wed, 19 May 2021 20:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A876EE83
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 20:03:23 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id w127so10405404oig.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 13:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gV7KaQ2RRDP+Kg+gfuY1yML9grJpthCGS6mDZn+/Isg=;
 b=CiTsfO0fAjwU25BYl5S/ShL58fcdSOX6SHoxGPETjWBdcal0fodFXngVM2x/2Q0Idt
 2IOdnawp5q8658CL2smHjBLfJn21meDxRnD0bQYx3JlkIYrZ0OZb/bdMgqLN8aYHGBFV
 FWidIN2eMWjhUGTO0zRH32t+NRi7kBN1imZ9D1ALC7i+7SwSt6rKo3DKpVQBMfYep960
 gVd0Jfby/me0L9pCjDoC6E7eq/UT5IhXUqm2HxGz7PRd2s7jcre3do80B3Er760vC48K
 PkZ3sQolvfNj+6BOfKwua7cG6JIHM747RmiwMy5Z2EV5XL3nmbsezZhwYGd7tBqDH5C2
 HLBw==
X-Gm-Message-State: AOAM533Bs9urpqJkJ56VrREyaB8P8QsXNsyKr36ADB0+DPcVt1aLkGXb
 1g0ZyxmLa0ktayKQIf87Lw==
X-Google-Smtp-Source: ABdhPJxTNYORD0T11tY39XgYAoKFzANs7V0Asx86T2BxvaiEU8opJ6t9m8UCghu1h4S9pPHRfXmjBw==
X-Received: by 2002:a05:6808:206:: with SMTP id l6mr786177oie.5.1621454602757; 
 Wed, 19 May 2021 13:03:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f21sm75810oou.24.2021.05.19.13.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:03:22 -0700 (PDT)
Received: (nullmailer pid 3554837 invoked by uid 1000);
 Wed, 19 May 2021 20:03:21 -0000
Date: Wed, 19 May 2021 15:03:21 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2] dt-bindings: display: Fix spacing in lvds.yaml
Message-ID: <20210519200321.GA3554734@robh.at.kernel.org>
References: <20210517224336.409301-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517224336.409301-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, ch@denx.de, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 00:43:36 +0200, Marek Vasut wrote:
> Add missing spaces to make the diagrams readable, no functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: Replace all the other tabs too
> ---
>  .../bindings/display/panel/lvds.yaml          | 46 +++++++++----------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 

Applied, thanks!
