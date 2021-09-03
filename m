Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B229C4004DF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EEF6E8C0;
	Fri,  3 Sep 2021 18:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F416E8C0
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 18:31:07 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 b5-20020a4ac285000000b0029038344c3dso1757202ooq.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 11:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=76jnDJCxGmr/v4jY11AieoLLZS9SNT7WUzklwo02Pbo=;
 b=LXGI/G0AyM40j/dnmYlQNwQnvXIRYZfRwWp1bLqs9rPSD5cMUv1JSQBlPBdVPE0bb9
 tRxACr0aW1ka5gF7BMqLrK1sY+4Bcq6xtAw/lL98GUIv0By1JZIA8YK+huXafc+OPB9N
 P+vzhMfd8aGO1clNZI7Hu/uN9z9/3qBQNuaM8tzhOIa0lIjuTyl6gSYPaBQGbnHEY3P4
 mTjrh8T5GmmiaTqA2FXyDLAcJTMQGj00zQsDJakqBct44jPGOKtJimIO/OUMatCQ/Ske
 KIKTf8wO6nquvzVH/XwM18vokeVBMOF4Iynlw0hDdEXp4E17RWc0o2+n1JyyiDpaDilL
 fGdw==
X-Gm-Message-State: AOAM532kiLttDZRKgUtW4vduofzXoi4jhgY0PT89JuGB+bQ2tVzSK7Nx
 /tSIUWZBf6EwG5qv8t5F4w==
X-Google-Smtp-Source: ABdhPJxzwyPGzPvnG5gtPbFSBwfKvVWD1cmhn1BQ7qM803qOGHILf/hTwFZh+P9RfPtY04ktP2a6hg==
X-Received: by 2002:a4a:d04d:: with SMTP id x13mr4106627oor.65.1630693867295; 
 Fri, 03 Sep 2021 11:31:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b2sm1146421ook.46.2021.09.03.11.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:31:06 -0700 (PDT)
Received: (nullmailer pid 3241187 invoked by uid 1000);
 Fri, 03 Sep 2021 18:31:05 -0000
Date: Fri, 3 Sep 2021 13:31:05 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-sunxi@googlegroups.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 14/52] dt-bindings: display: aa104xd12: Fix data-mapping
Message-ID: <YTJp6d7RXKsYxPKq@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-15-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-15-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 01 Sep 2021 11:18:14 +0200, Maxime Ripard wrote:
> The Mitsubishi AA140XD12 Device Tree Binding was requiring a
> data-mapping property value which was set to another value in the
> existing Device Trees. Fix this.
> 
> Cc: dri-devel@lists.freedesktop.org
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/panel/mitsubishi,aa104xd12.yaml          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
