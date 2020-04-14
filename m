Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF11A89C9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EA66E527;
	Tue, 14 Apr 2020 18:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814126E526
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:39:21 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id f52so698610otf.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dEiaIAvFJTlzpo/PB1mU+6ATHN9pj5y1SOOp368ZN78=;
 b=R59YoYvyhvYLknZJfFX26wIapeIoyIU9ikbtgj+B4/JNXiioCRlkyslraIno8Or9rY
 klIpk1pB+pa4NxEwQJlYD+qfceb8Pkw1xE6iFtKfq6bYsST63oKcw7cZdz2wvB8ntB35
 IrZrbWjMF5wsGlw4P42HnWB/jPUcRCpMA0FBMcmKPtaLaYw2uzNEfGJHjEEWPTXKcLN9
 ZzLJsPXytSJc71C7/rU9BbKZSElWVhdh9RYtM4H/XHdP0llswZQMAqi7jJswlnt2BLsG
 7+7RBjoMQeVNIqg1sYrsfGhzrnlAJ9NPh12bHlha0A2khaogC+0hpPRXm2hDZmoiJTkV
 o2jA==
X-Gm-Message-State: AGi0PuYfAr3u+7Z/52AXdXcCB46LlpxWHnGNU1sQ3mBNkgAHc3CXMzF9
 td2uVoUEmoarfLBHGmXA7Q==
X-Google-Smtp-Source: APiQypJkzZHUyWzUu8THoFBytfHvNhQ5r8JEg6EMKILNV27nlLwjpWy4NwOIziv0ZO4AxsNR3rkUuA==
X-Received: by 2002:a9d:7201:: with SMTP id u1mr19997253otj.293.1586889560773; 
 Tue, 14 Apr 2020 11:39:20 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z12sm5688036otk.24.2020.04.14.11.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:39:20 -0700 (PDT)
Received: (nullmailer pid 19914 invoked by uid 1000);
 Tue, 14 Apr 2020 18:39:19 -0000
Date: Tue, 14 Apr 2020 13:39:19 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 21/36] dt-bindings: display: convert samsung,s6d16d0
 to DT Schema
Message-ID: <20200414183919.GA19853@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-22-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-22-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:54 +0200, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/samsung,s6d16d0.txt         | 30 ----------
>  .../display/panel/samsung,s6d16d0.yaml        | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
