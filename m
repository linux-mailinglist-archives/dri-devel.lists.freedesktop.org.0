Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFD21A89B6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8DA6E523;
	Tue, 14 Apr 2020 18:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139266E523
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:36:47 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id k9so11313997oia.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RiaQWq2NYwgbrwKOf4tUCMX0fzNiLyUXlcD+SP0MVHY=;
 b=j0KM7Cb34d95sbdx16wl8N4gdqFRLZqbSOwtYraNdjDyZPz15IXhECkBDkkIm+PWC4
 YGWtqFprGVdD6djJVMVk9wKbK5uTZaXWdVjvSpWpnHaVZwsKiayLRqvKPy0iF14CgILG
 xtCWvv+KUx6lufP7n3Ebk4HbZ0eyjCpyKJDPMoUBQW4nKNjEDeOWBL/TM9V+3WhcMgxh
 2dSMY9vpg5/IVoJRowD3DimO4/YH2qBIPzV8JEoEnvUf7qlxXe8djsh4r8JEuqU9i0H7
 CzHA1Sse2luXFENeMxz+GaeLP72AfPPXqLIK+R1pc5JIWY+mBqIsssFhKfMWA7b+cst7
 i4PA==
X-Gm-Message-State: AGi0Pub62ow8V76up2ly2iCnEbTw/w1smkk+wnFTJgwRfqx0OmN7pvuC
 nj25lj0tUkzPEpxFEJlxWQ==
X-Google-Smtp-Source: APiQypKaf2LvtYE5Z9bp53Kr+d+5Lc8yerArAJZVegI5fi7TiOKfTa+p66W1cGVP/ccAsa6dn7eFsA==
X-Received: by 2002:a05:6808:8:: with SMTP id u8mr15805568oic.37.1586889406416; 
 Tue, 14 Apr 2020 11:36:46 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c15sm6342649oot.23.2020.04.14.11.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:36:46 -0700 (PDT)
Received: (nullmailer pid 16031 invoked by uid 1000);
 Tue, 14 Apr 2020 18:36:45 -0000
Date: Tue, 14 Apr 2020 13:36:45 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 18/36] dt-bindings: display: convert raydium,rm67191
 to DT Schema
Message-ID: <20200414183645.GA15991@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-19-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-19-sam@ravnborg.org>
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
Cc: Robert Chiras <robert.chiras@nxp.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:51 +0200, Sam Ravnborg wrote:
> v2:
>   - Fix entry in MAINTAINERS
>   - Add reg number to node name (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/raydium,rm67191.txt         | 41 ----------
>  .../display/panel/raydium,rm67191.yaml        | 75 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 76 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
