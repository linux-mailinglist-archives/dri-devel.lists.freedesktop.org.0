Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906C47C7D6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 20:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BCD10F25E;
	Tue, 21 Dec 2021 19:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8C610F25E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 19:55:00 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id b85so166441qkc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 11:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6VHYJrOICuCRKXetn+z4zf9kDzOY2t3EaZvz+IrV2KQ=;
 b=w3hnjR6PQWD8YIys68ZlKUj5QzvPcNLHcapa4NHDzSJP37IJEySGSJITQT6zLWxwi6
 zNmHr7F1qD5WLPa+MXxdSVom46tm39dKwdjSxduR+tpQT60GE4fxn49LUscF09XgLEAw
 WgMwyIEQ+eDc2El6p2Y+XTn2afU1CGGINnP8Kziz4vSUB13dcS5bXJEJJ5QFUxZ7nFTz
 Gn7iaULTPYwAX3Orkoq0HmyMZGWGsxqoBYk/eHllspZBBAqMbY8oJ3wQte+CkBpRXG49
 9muK5xvIp+0dW20OfHMcyMflILatgoDPAaI4zdocZrqFUySGTNx0T4HC0mAEa3m48iBP
 yD6g==
X-Gm-Message-State: AOAM533QPBvXXXCCa3Uw1g/XrfhuWAUKwpFOAD3LdyWOc29P24gqJkbD
 2kFzJZhusA8vDMgY9R0n03hzdP6Dwk7k
X-Google-Smtp-Source: ABdhPJz9u8CiTbsAZdEsdJoGvRZNkZDJVEHwD3vNvu4uW5RzFcnzDQJrUHkoaVpUFbZucZMaZSemkw==
X-Received: by 2002:a05:620a:1a10:: with SMTP id
 bk16mr3213781qkb.258.1640116499347; 
 Tue, 21 Dec 2021 11:54:59 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id v12sm9575968qkl.50.2021.12.21.11.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 11:54:58 -0800 (PST)
Received: (nullmailer pid 1644637 invoked by uid 1000);
 Tue, 21 Dec 2021 19:54:57 -0000
Date: Tue, 21 Dec 2021 15:54:57 -0400
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: bridge: lvds-codec: Document TI
 DS90CF364A decoder
Message-ID: <YcIxEffwDTi4LgS1@robh.at.kernel.org>
References: <20211218152309.256183-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211218152309.256183-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 18 Dec 2021 16:23:09 +0100, Marek Vasut wrote:
> Add compatible string for TI DS90CF364A, which is another LVDS to DPI
> decoder similar to DS90CF384A, except it is using smaller package and
> only provides 18bit DPI bus.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
