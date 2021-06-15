Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0E13A8A30
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 22:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2DF89668;
	Tue, 15 Jun 2021 20:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FAC89668
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 20:32:14 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id l4so606086ljg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 13:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8wFEhP3RtxfoxSD9RpFJsXqsCrndSkCzNDUEr2dYMqY=;
 b=aFjSAPtCj3D7zoq/RO/Hp9R5N//xI0eqXcfHrL5DTbq9mvwaKT/9oXsUPAOnrl/wCn
 4i2+1mexcPJv6sbChnEmeY9MOP785LQMuiUD0nLNNqOrkseUw2zXEnBVdfgoJx9SVHTp
 NRou7IysYQPKMtmQW+HbjgWn0LS7p8L4gFn/QB0oN5uNJti8MelxP9EFZm+Fbs+z/Ir0
 qYXJlPtOeoFUdQFme1HJuAuv0IwVhOL9FPM0Wpo7gR3wHfZNi2fXpkLwlbReClxqqDP6
 QmyJXgmHi47a9D4Ti6d9FmEYlVcoQZ7/tFKeDLa3SLshv6hmzMvdM+67NKJBiCfrzpxR
 7dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8wFEhP3RtxfoxSD9RpFJsXqsCrndSkCzNDUEr2dYMqY=;
 b=rWcSfxh4j6k/nMidzo9nB6Bp6dznXoqZCy3K9eaaGQsTbVi+gNZThIZeiATOE//xtV
 G/CVI/x2nz5KBL9Ao5/U5nK2RkVnELBIiLQX70r2ZHOKp8wTiXLyJhJJLF3ENQ5z8xr5
 vuJigIglXzjORINJNtHCD1BTrlE4fOn38ilRPis4CVQ9oPUGLVLl4pPIm59mLXm3oFMT
 tzo2IhSuFDxETmJP/LIkgx9VZGZXjtgMUw89NuuRlSrBgMQBNbalCOR6lfhjO1NeLSK9
 RwvT0XLSe+uGEfxWxfuFkTubRq8w07oqZJ1m/Taj4aQS/XMPHhFwGkP+7yT8T8fNi1ly
 WaDA==
X-Gm-Message-State: AOAM5309TKQw8NY+TctqXSZzs3HtNb5yyXResFCjP/Zwlu91Ws6cpG1z
 a7uBIwEVUT00hDdX9beBNIs=
X-Google-Smtp-Source: ABdhPJzoZZyt9KQzwxoqBiGH/6kVvWE3IY4yESCONWdmKrl/Sr4PMxuwrFBoFshuY+1xlyhf9Y2rmA==
X-Received: by 2002:a2e:a490:: with SMTP id h16mr1301782lji.270.1623789132579; 
 Tue, 15 Jun 2021 13:32:12 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
 by smtp.googlemail.com with ESMTPSA id 15sm2302920ljr.25.2021.06.15.13.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 13:32:12 -0700 (PDT)
Subject: Re: [PATCH v7 00/15] TegraDRM UAPI
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e91d780c-a157-1775-2d60-1379e7684f20@gmail.com>
Date: Tue, 15 Jun 2021 23:32:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110456.3692391-1-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

10.06.2021 14:04, Mikko Perttunen пишет:
> Hi all,
> 
> here's the seventh revision of the TegraDRM UAPI proposal.
> Only some small changes to v6 here to fix things on older
> Tegras with certain configuration combinations, as well as
> rebasing to latest linux-next.
> 
> The following pieces of userspace have been updated to support
> this revision of the UAPI (unchanged from v6):
> 
> * vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
>   Experimental support for MPEG2 and H264 decoding on T210, T186
>   and T194.
> 
> * xf86-video-opentegra - https://github.com/grate-driver/xf86-video-opentegra
>   X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.
> 
> * grate - https://github.com/grate-driver/grate
>   3D rendering testbed for Tegra20, Tegra30, and Tegra114
> 
> The series can be also found in
> https://github.com/cyndis/linux/commits/work/tegradrm-v7.

The needs of the newer hardware are mostly understood now, so it's not
the biggest problem now, which is good. The only part that is still not
clear to me is whether sync points sharing is mandatory or optional
since it's needed only by a proprietary monitoring software.

This is still not a full UAPI implementation and it's difficult for me
to see how this will integrate with the DRM scheduler and etc.

I don't like that the new code is build upon the old troublesome
codebase. The half of it will be removed later on and the other half
will be reshuffled, which is a lot of effort that could be avoided. It's
apparent to me that it should be much better if we could clean up the
current code base first, but before doing it we need to agree on the
organization of the updated driver, which should help a lot with moving
forward.
