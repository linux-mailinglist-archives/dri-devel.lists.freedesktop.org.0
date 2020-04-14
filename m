Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D2A1A89BF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5A86E24D;
	Tue, 14 Apr 2020 18:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9C36E24D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:37:24 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id b13so729507oti.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=/Z+2mWiqdz7nZgXdoRIFLOMZis6GhqLXgKMULSd886I=;
 b=CJ3aX3JbZB7EQp/vEINB1sThaC44XkszmWU/BeKfLkkQonaMOHLvCy1x+M+AwCr37o
 nqyAW60TjLvAFLqILyrZgGX1GgX+XHlNmhhSgJe3BxsuJOjm/snKNLnMi1YexJGvMRAd
 T4xqSbC0L74UT0UkHr2Ug9qPxq19IdlVJ3ykx2Q76aSoBKRk4pJ1H3AOeAz3m8Zh++aa
 kBTeaXSMPlNN/ht9rrwG8gJyWEzgc553ynQLEz3dRvPRZAAuPXUrs5J7iEzgjqAth2q6
 f4GfOe+2c21prL58HJ8/h0THdvtPDDzpiuSUWfrwb3UHfmnUJd+nOAlbRFyz/w/vvxO+
 oeKQ==
X-Gm-Message-State: AGi0Pua2dCYHCyIq9Q/gtSDvymBPTkNTqYUY+ZYf1gM0eTtJNPY9RcWb
 /USI4WLSXKO3T6Ghrx2nQg==
X-Google-Smtp-Source: APiQypJfNbHAXGBSoIJ4PMVaR4eNG1YDNWCC8Kfz/4EnOXihoGhsRYeBeqs46FivHtrSTvtNjZBeeg==
X-Received: by 2002:a05:6830:4c:: with SMTP id
 d12mr4555446otp.85.1586889443559; 
 Tue, 14 Apr 2020 11:37:23 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j186sm1016067oia.31.2020.04.14.11.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:37:22 -0700 (PDT)
Received: (nullmailer pid 16983 invoked by uid 1000);
 Tue, 14 Apr 2020 18:37:21 -0000
Date: Tue, 14 Apr 2020 13:37:21 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 19/36] dt-bindings: display: convert
 rocktech,jh057n00900 to DT Schema
Message-ID: <20200414183721.GA16927@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-20-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-20-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:52 +0200, Sam Ravnborg wrote:
> v2:
>   - Fix entry in MAINTAINERS
> =

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>
> Cc: "Guido G=FCnther" <agx@sigxcpu.org>
> Cc: Purism Kernel Team <kernel@puri.sm>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/rocktech,jh057n00900.txt    | 23 --------
>  .../display/panel/rocktech,jh057n00900.yaml   | 57 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 58 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/rockt=
ech,jh057n00900.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/rockt=
ech,jh057n00900.yaml
> =


Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
