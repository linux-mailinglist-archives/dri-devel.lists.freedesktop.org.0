Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16939A235
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 15:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96896E0A5;
	Thu,  3 Jun 2021 13:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9846E0A5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 13:29:46 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id m23so3275666uao.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EvAaVAGl0y3frERkrC2xF1QPHHzd64BdyWGXs3vitYo=;
 b=LFrA7ipPw8u7Gr5bv4drcTnYNuYyrk5BpPvj6XcXmRZhu7MABiO2ytikBdm2Okor2P
 EI6xz2NhrVmlNJoi0FyBR4bYpFSwV0rdGmRhMmaMEdsaC597ZfQTjQYg2MwTdzoNs9vG
 H+e0PzAmcDM0xYEj+P7Mr+kTW3X1Pkc9crm41jgEwxVqgbHrhg7Q/f+nz/w3M9QSl9KS
 hur0ZS3OObN9YONXH8+hUR2w3SyjbFH4K5BsOWJFpnco32pTEkASMWJiR2mtxVjPRov8
 IO1LiAqBSNZ8xlIm9XZ/GvRm2gDhxY6Ouagv6IUFnxbXBke/K/YaG39jdIs/HWXX4yS5
 /D/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EvAaVAGl0y3frERkrC2xF1QPHHzd64BdyWGXs3vitYo=;
 b=Ogxxq5PHy00z9MjW7+YQ4Wd42sK+YEKfudjW7SzNrwNDNcnNNn1ck+m6+adcrDQxPY
 4CqydD9xi6REE3NbyFjLGXAU02wI7P5ImIMLDyAXalZ/wtL/I/ZSYj1xWwOdBVhfbKV9
 /WuwJ5hcaNdPYtyMWXzLTUfe9+UcrhyWq8q3JA4Egb19pYLsRdqC3ymzZZS7vV404vLa
 RpuBT8xf6phLh97RyMxgWfzfUWKnrchvKP00qjCMQAVIe2InhwlN8Wu786HDqigl4UK6
 ge/KXCYyo2cQzxmvmNt9hdlrNqROhNwtg1VPXTKs0tAyi2mIny3RpcOBNkXg8/DQWlD8
 a31A==
X-Gm-Message-State: AOAM530xibPYaoO7VmZ+OF12MxjXs3OuBN+VOR7uUnaOYS/uhbO0u9sz
 Pgi4hQjs7jsAic5wZIhekX+mOJ67AwijzKvveYc=
X-Google-Smtp-Source: ABdhPJynCdl8YoMPzCi1QkfqCVFUBIlX4aMPGaGe43BPgpWfD5c+anBro0C2OHGpwH6KWNlSFiGs/BlO54JEnBE611E=
X-Received: by 2002:ab0:1464:: with SMTP id c33mr24110473uae.118.1622726985359; 
 Thu, 03 Jun 2021 06:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210601141945.4131934-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210601141945.4131934-1-zhengyongjun3@huawei.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 3 Jun 2021 15:29:35 +0200
Message-ID: <CAH9NwWemTq14Ror4FyqiwGm0vOQB3Er1SShUYiL8eLfdVOPBgw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/etnaviv: Remove unneeded if-null-free check
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Di., 1. Juni 2021 um 16:06 Uhr schrieb Zheng Yongjun
<zhengyongjun3@huawei.com>:
>
> Eliminate the following coccicheck warning:
>
> drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c:84:2-8: WARNING:
> NULL check before some freeing functions is not needed.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
