Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61E32474D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 00:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2946EC02;
	Wed, 24 Feb 2021 23:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAE68935C;
 Wed, 24 Feb 2021 17:40:21 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id e7so2443824ile.7;
 Wed, 24 Feb 2021 09:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=KVEFF/e3cq8hSLAqkkWzb/tsBUvxw8HxL0663tRmoQo=;
 b=rYBE3tx41p3vC7kUwVnZVOt8IudcouNv90aVHp5aRhAJWTwWstiIG9UaRmHFnBkT1J
 U24fewXNjZGiaZFhZpq2ulihxcffmastRktVQy01PCBiB0hV5Cns2qWgzjvMr3b9EU7k
 7XcN6DV9zH3YcToGb6XW27xkxP6Y2joVmWEVJS0m83PlcBp/DY0IawGND8xawJA+4Fwq
 lZhMZvy6HTWMHwcbp1cPGDjsnr591C0nHLhw1Q5L8I/hgf9LLjcSUFGDZBlNpJOleUki
 HlKTFrumpxZPh7ICSMsxUmo5wRAeraFG4DAyIMeNb4NSZWcsNG/c01XghtRuzsus7PjG
 OiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=KVEFF/e3cq8hSLAqkkWzb/tsBUvxw8HxL0663tRmoQo=;
 b=Gpw1zMGKp03889D7t3uBy1JI1HkR+mv4O3vrK/9ZHpGRUDwyd//sm4vhfXkXNPKoFM
 Y/3WBzvyVj5rjOVvTWbECv2q1WHS0f+Go806QzD5vbGxdMeR/9pz8zqtVcrUDY04Z8U4
 BhTHJcOMaRkEoJ1Ozy5oHKUODEP2DoXOaartmNsfM/3mTJ4ehJBqTUeD4DOjHe/GJ1Kw
 aAUjGIJyacktHWTvWQMnNUMNXHLeJ1vHyFGa90YWLsCBBEF6e4t+uBYycmgLY4MDqG67
 wQu1gY4Qckt+GCad2A8V7Lp6uWIlTsY2tmsqzhsF70jgdWMWURwZsTNd++UWcsNY4XjH
 8s/A==
X-Gm-Message-State: AOAM532MGj+MeVsIwo3nWx4it29NsubTd2oLYuFH+zCuUzpQ/9wiN4Ac
 V7CgATs6R1ZLdLt4Erw/QoNZy9V2oM7Jr8ypdN0=
X-Google-Smtp-Source: ABdhPJx86Fjs3j/bSxZdqqIGrInEz4YE62R4z11rDBzdrMiNUtL9AvS8Ry4ssztrLtAXwA9epgL09On9AhA7jn5fI64=
X-Received: by 2002:a92:c145:: with SMTP id b5mr19179398ilh.186.1614188420558; 
 Wed, 24 Feb 2021 09:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20210218224849.5591-1-nathan@kernel.org>
In-Reply-To: <20210218224849.5591-1-nathan@kernel.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 24 Feb 2021 18:40:09 +0100
Message-ID: <CA+icZUXGS_bbVRsMVJowVPTZpi8NYQ_18Ec9bXBTztWL6dA=hQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/swsmu: Avoid using structure_size
 uninitialized in smu_cmn_init_soft_gpu_metrics
To: Nathan Chancellor <nathan@kernel.org>
X-Mailman-Approved-At: Wed, 24 Feb 2021 23:03:08 +0000
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
Reply-To: sedat.dilek@gmail.com
Cc: Kevin Wang <kevin1.wang@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 11:49 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning:
> variable 'structure_size' is used uninitialized whenever switch default
> is taken [-Wsometimes-uninitialized]
>         default:
>         ^~~~~~~
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:770:23: note:
> uninitialized use occurs here
>         memset(header, 0xFF, structure_size);
>                              ^~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:753:25: note:
> initialize the variable 'structure_size' to silence this warning
>         uint16_t structure_size;
>                                ^
>                                 = 0
> 1 warning generated.
>
> Return in the default case, as the size of the header will not be known.
>
> Fixes: de4b7cd8cb87 ("drm/amd/pm/swsmu: unify the init soft gpu metrics function")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1304
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

I fell over this today with Linux v5.11-10201-gc03c21ba6f4e.

Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM/Clang v13-git

- Sedat -

> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> index bb620fdd4cd2..bcedd4d92e35 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> @@ -762,7 +762,7 @@ void smu_cmn_init_soft_gpu_metrics(void *table, uint8_t frev, uint8_t crev)
>                 structure_size = sizeof(struct gpu_metrics_v2_0);
>                 break;
>         default:
> -               break;
> +               return;
>         }
>
>  #undef METRICS_VERSION
> --
> 2.30.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210218224849.5591-1-nathan%40kernel.org.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
