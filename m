Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB24977367
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 23:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3133910E231;
	Thu, 12 Sep 2024 21:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="m2prHLLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3796D10E231
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 21:14:52 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3e0402a98caso669061b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726175691; x=1726780491;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2EO0qmaSPp73jvXnTs7TJzCKL8q51LBbEbQNyisfg4c=;
 b=m2prHLLkozrPyX5GdM2TJftIHXQmvrqxDH6q6faL1mt0uPwnUg8DEedZroVEnnd33C
 FGTHgmZVsdrgTWLhN7UBSsfIrufH4qzXXMFbpPix/rRR85eY6K8i7bQe/gI4VcAsWxyp
 NxKqFjX7FSgJy4zVyLvE/Ll41sSQ0Y42PpFSd4RrdK67yHEZYqhHl7mv1yY28kJ2dl/W
 46WIUaoW8RHHAlt53514yqFlDIuIBGIYhOv7Ul1j+3fGT7iKy8ctpntRHzzj23w6cxrY
 Xtlo08zlfeHutj6DBwSGOUzaBZmunKvME1bEJJaiLTuthBAHj7X/h80jnopuN0Qg75s3
 3Mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726175691; x=1726780491;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EO0qmaSPp73jvXnTs7TJzCKL8q51LBbEbQNyisfg4c=;
 b=ih7n3cZC6barY7vIuyD2ndlWMdDwUQcLtDIh/TsbW+kdTYaFAKsiDilZMpB6kb9vPR
 If8ljWUFXphncpvXHvesmnkydFmdO1Rp6Tlr0py4tnruSBvbaQlFkSuUDUvsVrclvuUL
 tbiZtinYQNdfWwluPy9uBhRaSvNOKGu94OBZEKoFE0PowjbsSshwHyjGBBrQdezfGMrb
 UMgFUrGf8LVE314eRJ10LOcXXtPaY8YLl1Qlclc8UgSzaSyhOFcZt2VFhTIC2YYmqDlG
 HWz3ox1+64dKUL4fj4A/nEeB5hI/etGe9NuZwg8lZCUJPPvAXcQ3uEQrSwpzIbHjShVX
 XF0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaKXoC4r++mUnGQElJdc8+QkqsPf8+XJcuFmapqMoirxe3eTwPfQMuZ2drmf2MDhM+Wq8rJZbCuH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAkB1oLebakUYuSYE6CvUTTc1WO0ng8jXPRN2WFna2aq0jYTCP
 F1asBgK/VU3iqQiGH//aPLb2mwA8NR9ZAYBf+M9XxW6Z0cIFz4jOk3YDcnnEYw==
X-Google-Smtp-Source: AGHT+IEXhrO73skogk/s/nT+zYKnKQ0Yub0DnxaAiKfl03Q20IYpu3fPe1nRti4noHn1qI7LW/QNUg==
X-Received: by 2002:a05:6808:399b:b0:3d9:3a2f:959e with SMTP id
 5614622812f47-3e0719ee561mr3950771b6e.0.1726175691128; 
 Thu, 12 Sep 2024 14:14:51 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com.
 [34.135.64.30]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5e1cab53594sm2250200eaf.43.2024.09.12.14.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 14:14:50 -0700 (PDT)
Date: Thu, 12 Sep 2024 14:14:47 -0700
From: Justin Stitt <justinstitt@google.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
 alx@kernel.org, ebiederm@xmission.com, alexei.starovoitov@gmail.com, 
 rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Quentin Monnet <qmo@kernel.org>
Subject: Re: [PATCH v8 4/8] bpftool: Ensure task comm is always NUL-terminated
Message-ID: <ozoyqz5a7zssggowambojv4x6fbhdl6iqjopgnycca223jm6sz@pdzdmshhdgwn>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-5-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828030321.20688-5-laoar.shao@gmail.com>
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

Hi,

On Wed, Aug 28, 2024 at 11:03:17AM GMT, Yafang Shao wrote:
> Let's explicitly ensure the destination string is NUL-terminated. This way,
> it won't be affected by changes to the source string.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Reviewed-by: Quentin Monnet <qmo@kernel.org>
> ---
>  tools/bpf/bpftool/pids.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/bpf/bpftool/pids.c b/tools/bpf/bpftool/pids.c
> index 9b898571b49e..23f488cf1740 100644
> --- a/tools/bpf/bpftool/pids.c
> +++ b/tools/bpf/bpftool/pids.c
> @@ -54,6 +54,7 @@ static void add_ref(struct hashmap *map, struct pid_iter_entry *e)
>  		ref = &refs->refs[refs->ref_cnt];
>  		ref->pid = e->pid;
>  		memcpy(ref->comm, e->comm, sizeof(ref->comm));
> +		ref->comm[sizeof(ref->comm) - 1] = '\0';

...

>  		refs->ref_cnt++;
>  
>  		return;
> @@ -77,6 +78,7 @@ static void add_ref(struct hashmap *map, struct pid_iter_entry *e)
>  	ref = &refs->refs[0];
>  	ref->pid = e->pid;
>  	memcpy(ref->comm, e->comm, sizeof(ref->comm));
> +	ref->comm[sizeof(ref->comm) - 1] = '\0';

Excuse my ignorance, do we not have a strscpy() equivalent usable in bpf
code?

>  	refs->ref_cnt = 1;
>  	refs->has_bpf_cookie = e->has_bpf_cookie;
>  	refs->bpf_cookie = e->bpf_cookie;
> -- 
> 2.43.5
> 

Thanks
Justin
