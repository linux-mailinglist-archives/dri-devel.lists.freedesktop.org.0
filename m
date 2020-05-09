Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1B91CC18D
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 15:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF706E340;
	Sat,  9 May 2020 12:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7A96E340
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 12:59:58 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id m7so1918648plt.5
 for <dri-devel@lists.freedesktop.org>; Sat, 09 May 2020 05:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Xj1T5YhvcvBwjGMJQVL7Y5xOMpKxjTRljl4dKQ9HXJo=;
 b=CvFkioWPZs+/vvAZ+Voj7zix8SnckXQ6RWMT0akzkWEfkwaFK/PLHcZaC5kxZE8Fxq
 1vx3VBzxpahwyVqwlOFH5JknOvVXQ8fF+vaSA/UUG+zJX38cVbzxuEZmI/ELtxJw5/sN
 PIQPGi9SSZ2Z/cSBBhF2unEZA+56ostGZ4+wHcAzXRcul4uK93aBOrvuhgyNs9SXSHJq
 NZJm4vY9vY8Y7jNUSbeoE+nRhzPMu0YHNhpeRUuPUhO2hnImUdWjXHZapJLNVZr1R+Tk
 61OKI5t3DqZx2gi7wpqnw7SKXFrtEnMuKGWVtHpg82WE4DQiuOzbP5Try5cSTej6jmyP
 BQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Xj1T5YhvcvBwjGMJQVL7Y5xOMpKxjTRljl4dKQ9HXJo=;
 b=Ld0h+JzjUNcDLOu/YciIu0GcUV2xVnK1JKE8lROFhGsSLF57ZrOfnod2lV7sRyvR4H
 KpM3E5hJeNveUiDVb8ov0DyEPTUyGix4hRwZU+uATnBWXOOavRkr4Jc+5/jvs52BTNLS
 tyYWcRB57Tjx6R6RsMT5kdTFqWQX6yavvcmHVbP8gNZvzp9pSavvuO9d6KOvtqhTnVOO
 MMXGkif+omT/m4jok4zAhg3pQbnJy1Ov5EK8Ge/0a1xgVJTHyyFcX/FyLsTtgaeDeJdw
 fY1J8a50Nb3PD8QDwPuPNPI2F42v5iADmPAHkdPCe9PrBNkcX0HKedG35uG5pW7Ayrlk
 4mAw==
X-Gm-Message-State: AGi0PubesgTG7MFua15LKEtnGcJFxFTqSNkBrUX9Dpu9FY6QgdFK1ypy
 15+3O22pZyVuys8kYz/HsKpuIw==
X-Google-Smtp-Source: APiQypKBuBxoge/WoRey+HXDRJR/KwDvY4v6JT6FlgETkFS/2RfUCD9RD8qn0q0SidSfKsq4mMpKzw==
X-Received: by 2002:a17:902:9a08:: with SMTP id
 v8mr6763383plp.90.1589029197880; 
 Sat, 09 May 2020 05:59:57 -0700 (PDT)
Received: from dragon ([80.251.214.228])
 by smtp.gmail.com with ESMTPSA id y63sm4540692pfg.138.2020.05.09.05.59.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 09 May 2020 05:59:57 -0700 (PDT)
Date: Sat, 9 May 2020 20:59:44 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [Freedreno] [v2 PATCH] drivers: gpu: drm: Add MDP5 configuration
 for MSM8x36.
Message-ID: <20200509125943.GC26840@dragon>
References: <20200509104812.202981-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200509104812.202981-1-konradybcio@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Sean Paul <sean@poorly.run>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhengbin <zhengbin13@huawei.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 09, 2020 at 12:48:10PM +0200, Konrad Dybcio wrote:
> This change adds MDP5 configuration for MSM8x36-based SoCs,
> like MSM8936, 8939 and their APQ variants.
> The configuration is based on MSM8916's, but adds some notable
> features, like ad and pp blocks, along with some register
> changes.
> 
> changes since v1:
> - add an ad block
> - add a second mixer @ 0x47000
> - adjust .max_width
> - write a more descriptive commit message
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Subject prefix "drm/msm/mdp5: " seems to be more idiomatic as per
git log of file/folder changed here.  Other than that:

Reviewed-by: Shawn Guo <shawn.guo@linaro.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
