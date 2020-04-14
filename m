Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717671A8E29
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 00:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E50E6E5AE;
	Tue, 14 Apr 2020 22:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D44E6E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 22:01:42 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id j16so11840409oih.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 15:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G6PPt1QnSaN0ApJ5RR4KQrnjQemnxVXWfSc9EvEQLP0=;
 b=eRtGucDMJSuCJoPKjL+9Dq/zNkwp9gFfzp372JqUywjzMUPElSOIf4sbx+LP3KB/F8
 iDhJu7N3BpBnEseY6yOit5FoWnGoYtvqvrXU5uBm6iCEZIFK7XxsNbgC68zg8WPk3wN4
 1IwwjDkYCDm0KXTqTY9dGeBuboLYCnSQ1sHp0IEHOSVQNyY7XUuOvqJbtqvjrpIf3Br+
 9PaUGK2/APWQIheOaWOF5xtELs6vzKQkhvvcuQDsabOGLSCXnMJS0WJ4DmJlA/C4MVo9
 ebg5FagGZ4QxkXgspzAr9Gm5HTqWJ+0Zacqi3ZqAC9k0TKY8eZrgLOTp0qNtzkImrX0b
 K4Zw==
X-Gm-Message-State: AGi0Pua0jNgXsInn3VE8xyG4cx+u8DmWBFTQtGQYe50oJeOaAColmPdx
 79rwivSqEV8gVohEeCNFYw==
X-Google-Smtp-Source: APiQypJgNGOt5RJHf7DTmxuYa6cjzVowN5sTDAOvfa5ylnYX6d3lhAnN5erFU66Pa0EwwqBW8CNfUw==
X-Received: by 2002:a05:6808:181:: with SMTP id
 w1mr3029236oic.26.1586901701741; 
 Tue, 14 Apr 2020 15:01:41 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y8sm3631228otg.6.2020.04.14.15.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 15:01:41 -0700 (PDT)
Received: (nullmailer pid 6545 invoked by uid 1000);
 Tue, 14 Apr 2020 22:01:40 -0000
Date: Tue, 14 Apr 2020 17:01:40 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/4] dt-bindings: display: bridge: thc63lvd1024: Convert
 binding to YAML
Message-ID: <20200414220140.GA6489@bogus>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200405232318.26833-4-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  6 Apr 2020 02:23:17 +0300, Laurent Pinchart wrote:
> Convert the Thine THC63LVD1024 text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../display/bridge/thine,thc63lvd1024.txt     |  66 ----------
>  .../display/bridge/thine,thc63lvd1024.yaml    | 121 ++++++++++++++++++
>  2 files changed, 121 insertions(+), 66 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
