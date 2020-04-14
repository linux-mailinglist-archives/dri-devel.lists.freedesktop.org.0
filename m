Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F06411A8A6A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 21:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF516E554;
	Tue, 14 Apr 2020 19:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0066E554
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 19:02:03 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id z17so809525oto.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fVsJ/IpNtOe7JY6gD72HJPhizF5o8XDQ0yjiN57z3vc=;
 b=Ol/cMI3rqyavx7ttShn7hJP4S236P7+r7SAhUrltBiJ7vz1cKX60JzbmO9c13KKVj5
 WQCgTXneuLbsrX9iRsMnhY0WvxQoXrqL7xqyRjGG7zg22ivRTNfXx7JLmlbxZwYM+kPL
 76KUMyT2qFoDZ7FBKs6cBWy8RQkz67H4vEsMqoR7tVSA3VjerIV9HGNh+/hjejDfgTZa
 Qg1+kmqJKWAU64mkBF4/KTGsFJo873UOkclK4aoCRv+JSKXr+6nITC/XQqvnp0b9OPzq
 cZhentGp4wL7Vhw0GRQL5xHniBSLLSlI4fZ8hM29ZugERw8M6V7OJKEmjnyszLXjayr4
 4pKg==
X-Gm-Message-State: AGi0PuaeoaaZagdTgfFqIZyMLgQT1lCR68K22Jhwx/P+CNBLP5q+5hK6
 kbJKrsl03epj1KVr+2nA4w==
X-Google-Smtp-Source: APiQypILqwT3dhOpwh9VY5s+DJSVmbD6BlnKbynfjgY02fGMBYiRFnqODaivjXYVSuPLc8XkiDLkow==
X-Received: by 2002:a4a:a11a:: with SMTP id i26mr19678661ool.87.1586890922350; 
 Tue, 14 Apr 2020 12:02:02 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j186sm1031487oia.31.2020.04.14.12.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 12:02:01 -0700 (PDT)
Received: (nullmailer pid 21017 invoked by uid 1000);
 Tue, 14 Apr 2020 19:02:01 -0000
Date: Tue, 14 Apr 2020 14:02:01 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 36/36] dt-bindings: display: move DSI panels to
 panel-simple-dsi
Message-ID: <20200414190201.GA20959@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-37-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-37-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:51:09 +0200, Sam Ravnborg wrote:
> Tomi noticed that several DSI panels was wrongly
> described in panel-simple.yaml.
> Move them to panel-simple-dsi.yaml where they belong.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../bindings/display/panel/panel-simple-dsi.yaml          | 8 ++++++++
>  .../devicetree/bindings/display/panel/panel-simple.yaml   | 8 --------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
