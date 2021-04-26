Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482BE36AE09
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 09:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682926E18E;
	Mon, 26 Apr 2021 07:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60C66E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 07:43:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l189-20020a1cbbc60000b0290140319ad207so2192097wmf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 00:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o3yNGFerPaIjhTT8F584fvlzTAF67b4Q0oDOOjXEcyY=;
 b=TBt9cIWmhTvlBO/40IvjAQWu273ElEPJ/Sz4y4ebQlm3GxoYDixwi28dtCp4CU+0Iq
 Bmk21oNnVj0y6FXCAOiDeMCEviI662dk3bUNqyDvlvIF6+NGWbtiqrLVHkPqw2NdYjIm
 ATtnizFIE7fFnMYmw4SxYR9qQXDgm4coAgZ3ZqmspAIvsOFzZLQqfGTpWe1GD3IcMn60
 6Y94Ph5VoA/BIZJY6e4Jsm7uJU/uVcJz4UETdPeM0X74kYRfiG7ISa0TXrhw0uU80E+H
 6DrJuSHmELpd39UFgEDrqAvzZjgP6iejNMaa+AK7dHYjLGLbBILWnzWyl+7gocl10W5J
 5SsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o3yNGFerPaIjhTT8F584fvlzTAF67b4Q0oDOOjXEcyY=;
 b=Y1OtWzfoEcGdH9I9yvnIIhC7VvTf5drReeKj/4X8efI+KzsU/7QnQo4Q9MR1A/cWrN
 xpFOJbdfU2l1bLFKIsPiKZzLrPNYf2Sl12njER78Vs449TWXcbtb/ovfGQUH3TaB+6Ld
 /CZyjT2bu1KfLho0Xlot8iwNdJGlWIrbR02UQ4in0DDQBcf1BL9/+TC/g7YjG5YvBniP
 4BASQyKNkAS+ALr7MnDY3xlIAQZJB+N3OI/iBbJgyzaioK2hSoy/yFlQN+gS6Ro433rR
 XRCtkUkcKKf3jUMPI8z49UYiAwtlsCjPetn9tdA8QYodE6dnizjpDyuLGKWX3hZ+UYmB
 u+Xg==
X-Gm-Message-State: AOAM533oEklATuaKQoyDQCgPGVN5VvN9vTf4tduZtnPP1BUWqVBop7qX
 REbO8mQM4hWtkJPZOKwCTR0=
X-Google-Smtp-Source: ABdhPJyYmSbeCJsTGhrqZWiXKD3xu7288co2lcEiPcIBwItbrEIyDCmc4u1llIVtcRnOIj/zPBWYHg==
X-Received: by 2002:a1c:a5c1:: with SMTP id o184mr7084706wme.106.1619423037586; 
 Mon, 26 Apr 2021 00:43:57 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id b8sm9081983wrx.15.2021.04.26.00.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 00:43:56 -0700 (PDT)
Date: Mon, 26 Apr 2021 04:43:51 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: update the current status of todo list
Message-ID: <20210426074351.2qfqiorll7xbf2ag@smtp.gmail.com>
References: <20210424135722.s3bwmqeutqmelxv3@smtp.gmail.com>
 <6VuYdAKRsSRdG1f3qbGGZsIT6x5fAlxYYawffzLWiFAex0SLjbI8Riy1nxfVQedycNkTke2ICJ_gDrzGql_oZsKi-7j_2N7Cwr_hZJHz1Pk=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6VuYdAKRsSRdG1f3qbGGZsIT6x5fAlxYYawffzLWiFAex0SLjbI8Riy1nxfVQedycNkTke2ICJ_gDrzGql_oZsKi-7j_2N7Cwr_hZJHz1Pk=@emersion.fr>
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
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/25, Simon Ser wrote:
> On Saturday, April 24th, 2021 at 3:57 PM, Melissa Wen <melissa.srw@gmail.com> wrote:
> 
> > -- Real overlay planes, not just cursor.
> 
> Maybe we should mention "multiple overlay planes" as a good task?

Sure. I'll include it.

Thanks for taking a look and pointing it out.

Melissa

> 
> Thanks,
> 
> Simon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
