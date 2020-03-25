Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7359192258
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7194B89A86;
	Wed, 25 Mar 2020 08:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C3989E14
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 02:42:26 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id np9so397982pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 19:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=tJVGZmmA1bFjoevn7/qDYyyvIJ/eyc0u4ubgnC7ziTY=;
 b=H4706YZqf8/zScGoFg12vybnR9M2VsIQVJgSz3rS1dHY9dQHDGFEdxDFbUd7d1zTgX
 a1SAGpNqJGQq66/k++qcyoET2sxmyH3emD3uXnYHai1yW2TdH35PONdQL7aDm0PfPzyp
 tYlxhgWpkpR2jgcSCMS6Pg5GkhF65IhQxffKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=tJVGZmmA1bFjoevn7/qDYyyvIJ/eyc0u4ubgnC7ziTY=;
 b=nwwbny94EuIsbdzZDO9I6HN0LhWTz1phNifdSUBe1cnWaCIuG3kkdT1wWelXEe91Pm
 HSlDc5jStT259r4bxn09YzOwSnNOwNpWYu5D34BWpw826i0o02dwjt4b3XVkrZLlwa1G
 ot72XrfQmm1gQ5jepkiGaMQcPCwCsgtHVjd+AkEqRTTncrb1vUoUwOecNaV7k0DT4ZfO
 d7OWA325A6TG3V3A7NJ5ejdgvia5l0jaUhor1eDsM3xrxDQHP2z1JK9Z5rgH/KJtxQrK
 rBkOXfraBcsiauauc2i5tuiuP3Wf1t1vPt6lB4VfGEpunlkZkE9GL50mVrccjF+mu1PS
 vXrw==
X-Gm-Message-State: ANhLgQ3xs9rJ/l2G5HkGysIYVOY/5zbrUCNWF9XuTJ/hA5I2YFdauTWZ
 Bhe883Uj8e4epUtdBxvCW0aG2g==
X-Google-Smtp-Source: ADFU+vtS5LbLrzS1jhzDwYVrTj6A9lZWX06g/Mga4Nlp7aFIrRyOCBB7aq2FIo/kyw4uUBQ1+JG/MQ==
X-Received: by 2002:a17:90a:33d1:: with SMTP id
 n75mr1033588pjb.167.1585104145832; 
 Tue, 24 Mar 2020 19:42:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id x4sm858194pgr.9.2020.03.24.19.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 19:42:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5cfeed6df208b74913312a1c97235ee615180f91.1582361737.git.mchehab+huawei@kernel.org>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
 <5cfeed6df208b74913312a1c97235ee615180f91.1582361737.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH 3/7] docs: fix broken references to text files
From: Stephen Boyd <swboyd@chromium.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Tue, 24 Mar 2020 19:42:24 -0700
Message-ID: <158510414428.125146.17397141028775937874@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: linux-arch@vger.kernel.org, linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, netdev@vger.kernel.org,
 linux-unionfs@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Mauro Carvalho Chehab (2020-02-22 01:00:03)
> Several references got broken due to txt to ReST conversion.
> 
> Several of them can be automatically fixed with:
> 
>         scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/hwtracing/coresight/Kconfig                  |  2 +-
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index 6ff30e25af55..6d42a6d3766f 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -107,7 +107,7 @@ config CORESIGHT_CPU_DEBUG
>           can quickly get to know program counter (PC), secure state,
>           exception level, etc. Before use debugging functionality, platform
>           needs to ensure the clock domain and power domain are enabled
> -         properly, please refer Documentation/trace/coresight-cpu-debug.rst
> +         properly, please refer Documentation/trace/coresight/coresight-cpu-debug.rst
>           for detailed description and the example for usage.
>  
>  endif

I ran into this today and almost sent a patch. Can you split this patch
up into more pieces and send it off to the respective subsystem
maintainers?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
