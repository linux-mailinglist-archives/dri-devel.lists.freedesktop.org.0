Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E42418344E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 16:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546D46EAE7;
	Thu, 12 Mar 2020 15:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7E16EAE7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 15:17:55 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w17so3542405oic.9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 08:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rHiigiRwWdeqsTTALfFLdUeJZ+/BBDh3z6SgaZUc3ZY=;
 b=DpmeyHR6iBkLyZU8iefx6s966/1EHXm/t8GdQBtrKnMgfwuQTlJ22Qu64FhnRICSgh
 chipwvaCMt2LzPL/QWVDh+xLpLBv3yDCKVREiWPI/i77gxH0NUXvbFdf8WNvbD/SKCo0
 Zif0qypfO5h0FiizKiNUgtwTUoEjnRiFyr9eQXj9VVEBPeLY12884mlVEjh93Idge62j
 6zIFapwxG7xbKud/A2H/JggbFLQ51wvyOjfgadn4gSrc/+/2tzQaJ53FNkuXf2hVZVX8
 ytxE1Ans9HMqB2wp3aRvaIJI2dayxbAmqk6J00ykp3GPXE1EJ7Oytb8aVhNN2cW8olqi
 G1XA==
X-Gm-Message-State: ANhLgQ2nweTpVmn7vDi7VtEBpYhLn6iQNMVlBZsfU+nRkN4eS74N0NEn
 afJWN0ozMQuxAM9aV88oYg==
X-Google-Smtp-Source: ADFU+vvYViH6zu1LQKfvsKC98PIW22YAry8cj86SwVNzzddHoLKUHC9/jtwAo4z7+fj1dyHXKjTVqw==
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr2886726oif.114.1584026274247; 
 Thu, 12 Mar 2020 08:17:54 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q22sm1368687oic.22.2020.03.12.08.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 08:17:53 -0700 (PDT)
Received: (nullmailer pid 8236 invoked by uid 1000);
 Thu, 12 Mar 2020 15:17:52 -0000
Date: Thu, 12 Mar 2020 10:17:52 -0500
From: Rob Herring <robh@kernel.org>
To: Vinay Simha BN <simhavcs@gmail.com>
Subject: Re: [PATCH 1/2] dt-binding: Add DSI/LVDS tc358775 bridge bindings
Message-ID: <20200312151752.GA7490@bogus>
References: <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vinay Simha BN <simhavcs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Mar 2020 15:18:24 +0530, Vinay Simha BN wrote:
> Add yaml documentation for DSI/LVDS tc358775 bridge
> 
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> 
> ---
> v1:
>  Initial version
> ---
>  .../bindings/display/bridge/toshiba-tc358775.yaml  | 174 +++++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml:  while scanning for the next token
found character that cannot start any token
  in "<unicode string>", line 11, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
warning: no schema found in file: Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml: ignoring, error parsing file
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1252753
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
