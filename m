Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F984AE76F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 04:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B010310E1CF;
	Wed,  9 Feb 2022 03:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C1410E1CF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 03:07:19 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id u3so1134989oiv.12
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 19:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4zK4mNlft0YSBrS1EUUtnZ1eiCxH6p/RVKxlEycE1ok=;
 b=KAWgdRd9BWiRgo5R1CNWrsaU7+nyFS1Utekh0tU039Q3fe1qoF3ONggXHgHrKv8zHW
 yMQMc7z2BGAFbLY6fDZCozou7zCc/mhng8WeSKRO3LuekHi0kV9fFYcDc8vtSebPqt48
 qRt3BMWSJSMRCYC8CwohWnCYF1tfHgFbNBGhK5mNkVeK0ATDJ6q/DKUGsWqBzQLCefKZ
 nTjQe9+AimAh/rLU5RCPzRvuAuVLsS71c52v0jD2l6uPFfEeELIGU0i/Kglnc6fQo2Xk
 uicJVF1/y6CAJ/WSEvc3A8jgWJq1rgkLF/mSUt9wn1W/RpltyFj3lcIi82RwooZvmh7m
 XFZw==
X-Gm-Message-State: AOAM5306EtxY0/g+PlzV1x1CjQdfjQYFYMfY7oEOdUtpyiftDLY7ga7e
 y/CVlgEubJah0JugE43M7A==
X-Google-Smtp-Source: ABdhPJxVQa/OMB3jeFEviv/+OHHc5hTS47P1H6zGuk+DV0L87x8EQ3rVWsVnMJo7VRW3gI2yQeavOg==
X-Received: by 2002:a05:6808:158b:: with SMTP id
 t11mr435650oiw.250.1644376038421; 
 Tue, 08 Feb 2022 19:07:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g34sm6140107ooi.48.2022.02.08.19.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 19:07:17 -0800 (PST)
Received: (nullmailer pid 3547540 invoked by uid 1000);
 Wed, 09 Feb 2022 03:07:16 -0000
Date: Tue, 8 Feb 2022 21:07:16 -0600
From: Rob Herring <robh@kernel.org>
To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 5/6] dt-bindings: vendor-prefixes: add vendor prefix for
 SHIFT
Message-ID: <YgMv5A7gwz9a8VNK@robh.at.kernel.org>
References: <20220123173650.290349-6-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220123173650.290349-6-caleb@connolly.tech>
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
Cc: linux-input@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Henrik Rydberg <rydberg@bitmath.org>, Harigovindan P <harigovi@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Alexander Martinz <amartinz@shiftphones.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Andy Gross <agross@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Jan 2022 17:38:08 +0000, Caleb Connolly wrote:
> Add SHIFT vendor prefix, SHIFT make various devices such as the SHIF6mq
> phone.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
