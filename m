Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 787B822B866
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 23:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93436E47E;
	Thu, 23 Jul 2020 21:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3056E47E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 21:12:56 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id t131so7780723iod.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 14:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IMBnZKsh48SKsX8jjKgPA2bqoA7i2K6aQrR+811fDqM=;
 b=QMg+TO0MXYRZzjyWHfqkGwl51G3GlQJUkYJnk/Vj9jkWzFYjXPEYVSVz8h06hXGI3b
 dNmBXxAJ0GekjYEuEkxihoBFPAnqIKqWGnuG0TdSIuJYS+te9uvYvdBcwX+1ofgZjnIp
 aQCJ2ZKgtw0gk14ia355ofldo7Wt7RwrhcrbneCY7tlm6lZDqwTTqWp4z1wRljD5GtVS
 CU4w+m+AhAMQHqE42x6tFC0/xwbjWsnnVevoHU4kEtJUyBfD0iEZNm9P9D80u3mkWd7W
 tLe8XnQb5OOkHeVaOQZ02KhfpJ7vyvn7xIa4rVz/VIdg+OW/f9+viTRFBAqxnwPy4zCK
 j1YQ==
X-Gm-Message-State: AOAM530Nl7D6rRxXITF57xFoRQPW0HONqCFjhUUTwKWB8JFZTV8aFH/m
 A0gosqjIny/LHLU98HS+NQ==
X-Google-Smtp-Source: ABdhPJxloVcHKJ9XFGl9lzOl5yMefFdfF+hhlnC+m1/0kOnxSi4LDMpW6iKiBRM2GLSrNZ05MUVAPQ==
X-Received: by 2002:a02:cb92:: with SMTP id u18mr7016893jap.143.1595538775491; 
 Thu, 23 Jul 2020 14:12:55 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id r13sm1821041ila.85.2020.07.23.14.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 14:12:55 -0700 (PDT)
Received: (nullmailer pid 867917 invoked by uid 1000);
 Thu, 23 Jul 2020 21:12:53 -0000
Date: Thu, 23 Jul 2020 15:12:53 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 2/4] dt-bindings: ili9881c: add compatible string for
 Feixin K101-IM2BYL02
Message-ID: <20200723211253.GA867872@bogus>
References: <20200719170411.275812-1-icenowy@aosc.io>
 <20200719171007.276383-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200719171007.276383-1-icenowy@aosc.io>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Jul 2020 01:10:04 +0800, Icenowy Zheng wrote:
> Feixin K101-IM2BYL02 is a drop-in replacement of K101-IM2BA02 panel
> (which is already supported by panel-feixin-k101-im2ba02 driver) with
> the same pinout. It utilizes an Ilitek ILI9881C controller chip, so its
> compatible string should be added to ilitek,ili9881c file.
> 
> Add the compatible string for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
