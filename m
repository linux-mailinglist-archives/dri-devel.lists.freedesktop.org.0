Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B802F812E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 17:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6B86E0CA;
	Fri, 15 Jan 2021 16:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CA56E0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 16:50:42 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id q25so10165020oij.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 08:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5fLN7OulXncVQApei3ublkkTNVRLPQFG9EYgq/5LsEY=;
 b=Kz4HLyVFTk5hzEjQVZ77jOtc2VfoOkU001u/O5KX42/0cU+9lKkgsliCy3pBUdmODG
 fTNl0CfhW6meJR7WryARIMmD4iGkDwmcFrFHgZ41lZon2psUPLZw2aiJjR1Py9XjMZbM
 4UqYeYz18/+NCkW6A1QyUnuuIEKUWjr++RgnBYi/71O7vxxm9mwJ92Azv27iPPUGfkMz
 2W5BqGI3x/MY2dE167N/dmg9DqJ3reW9JLL9jx9lp0ItyhlCHVBYLa8O5e1YLenaH7Mh
 w/EtMmr0Ahpx7qfXgtRVkgOh6SLEA3jKPW4ra8A0FzY9BQFHn8wkX4IAOK8vpxYST7QT
 oHAQ==
X-Gm-Message-State: AOAM532CWpqQLyyjkQG0h0u5PrVQJpHNZhEeQJf/b7lMHSQ9Jl/KtpJi
 4evwdEUuJTjSjNdCSdD7Fw==
X-Google-Smtp-Source: ABdhPJyWVaI+1oubphuIPiK+3CWSN1uLPvtMMc/tQUOhs4fBs8IFxhHO1oH4JJo3TZe4FonyuohtsQ==
X-Received: by 2002:a05:6808:253:: with SMTP id
 m19mr6041849oie.34.1610729441177; 
 Fri, 15 Jan 2021 08:50:41 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a15sm1735753oii.50.2021.01.15.08.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:50:40 -0800 (PST)
Received: (nullmailer pid 1434041 invoked by uid 1000);
 Fri, 15 Jan 2021 16:50:39 -0000
Date: Fri, 15 Jan 2021 10:50:39 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 5/7] dt-bindings: display: rockchip: dw-hdmi: Convert
 binding to YAML
Message-ID: <20210115165039.GA1433984@robh.at.kernel.org>
References: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210114064437.5793-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114064437.5793-6-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jan 2021 08:44:35 +0200, Laurent Pinchart wrote:
> Convert the Rockchip HDMI TX text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v3:
> 
> - Replace endpoint-base with endpoint
> 
> Changes since v2:
> 
> - Use Mark's @gmail.com e-mail address as the @rock-chips.com address
>   bounces
> 
> Changes since v1:
> 
> - Drop pinctrl-0 and pinctrl-1
> - Use unevaluatedProperties instead of additionalProperties
> - Drop reg and interrupts as they're checked in the base schema
> - Rebase on top of OF graph schema, dropped redundant properties
> - Fix identation for enum entries
> - Tidy up clock names
> ---
>  .../display/rockchip/dw_hdmi-rockchip.txt     |  74 ---------
>  .../display/rockchip/rockchip,dw-hdmi.yaml    | 156 ++++++++++++++++++
>  2 files changed, 156 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
