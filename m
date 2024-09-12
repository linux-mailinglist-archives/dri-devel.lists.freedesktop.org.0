Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE1E977339
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 22:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74FB10E07D;
	Thu, 12 Sep 2024 20:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XY5qx1Wj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B57C10E07D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 20:59:49 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-277f19ee2a2so784817fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726174788; x=1726779588;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8mM5Z0KLUO8efTiZgA6ECQxJ5r+uA/1F2hapQlso44M=;
 b=XY5qx1Wj10jzvUYy9BdjEpYO5qjNQtB9H1S2tiAq6kdB6IBW80X9QRdZ1dmgxOp/kL
 J/KBdmkWwhPfBGAkdq6MZaYxWQrCnd7bBD2cnK4UjgtasaotFQrBlk/4+45wNIQBXtfO
 jusRkLgJLiTiolsAPdLX/9gUWEZXbtvSAFcnuKlFadjw9Af3TPGX8u3qX4ML2ksiJPL0
 GDDVwqpmUMPQUts+qAk64WLR9s3nZScZARo0fMPy22JkSl39jTZNUuABmzhXWGwPtT//
 bi2F6+30EyTKvzwNyfRVhtBkt/m7htQMqFM7+ZuDPxwvhYCzvB3pYULIlyqYpoelcIvH
 z4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726174788; x=1726779588;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8mM5Z0KLUO8efTiZgA6ECQxJ5r+uA/1F2hapQlso44M=;
 b=Q2SnmwzFz2lmoJU6fZE+13mcNxjWPE3Yh2lOqf3MeeoyYPbyYMD7EZbBAgHfMSvp7T
 ss1H4AYmI5mtEvpGNrEdKsRLhFS9xQrCGR48Lpl1oEmqGH4wuq0ef56FuO2/9447VVNy
 xdoZ+SG0BIxRJXu62+ivkp/qZ8vUwl64Gw2d6BAi80m01HC39EZ4KBXlEVmVGtZ0mSrC
 //Binnv3wWHx2uK3waKMhKYSuIN92HBf/lsxzlDtMVMxEh3tAV36ezovz/MDHLNE/YVY
 iSFce0C5zbr95GsE8iZCMWKTKni9YV7COml5pI7Lpu6aMj7bJROw3BKLCcHbgfAkoz3c
 ateA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7HIvCCeSNdKlq7Ia9vjxif3BI+6La4S8zG4AOWm1cq/MATyo3cy2iI+AB86N0G/4wdg9BenjpCOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZcOtWp2bHkCvRFqN9zXtgyPgToFc1wZUHJL7nfoFpnD3aokJ6
 vUYLYgUsg20Ze3Jiz5uqbxj5VKFeQh9v0ctxkk85UlCAKdCnDPBDUnvNMB7ecQ==
X-Google-Smtp-Source: AGHT+IFM1AXJ051IzPPqsl49dRXV3EAPdU7MADRa2Tisd07EWLACnR0AfN41J2K91Abg++8l1F9PzA==
X-Received: by 2002:a05:6870:610c:b0:27b:6267:61b0 with SMTP id
 586e51a60fabf-27c3f603118mr3165118fac.32.1726174787877; 
 Thu, 12 Sep 2024 13:59:47 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com.
 [34.135.64.30]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-27ba3f3f125sm3276542fac.25.2024.09.12.13.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 13:59:47 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:59:42 -0700
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
 dri-devel@lists.freedesktop.org, Paul Moore <paul@paul-moore.com>,
 Eric Paris <eparis@redhat.com>
Subject: Re: [PATCH v8 2/8] auditsc: Replace memcpy() with strscpy()
Message-ID: <u42f2oneitzqmzh2tvwokzjxawj6utitu7rongurqeiglkvkvc@ryjktmvutysi>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-3-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828030321.20688-3-laoar.shao@gmail.com>
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

On Wed, Aug 28, 2024 at 11:03:15AM GMT, Yafang Shao wrote:
> Using strscpy() to read the task comm ensures that the name is
> always NUL-terminated, regardless of the source string. This approach also
> facilitates future extensions to the task comm.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Acked-by: Paul Moore <paul@paul-moore.com>
> Cc: Eric Paris <eparis@redhat.com>
> ---
>  kernel/auditsc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 6f0d6fb6523f..e4ef5e57dde9 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -2730,7 +2730,7 @@ void __audit_ptrace(struct task_struct *t)
>  	context->target_uid = task_uid(t);
>  	context->target_sessionid = audit_get_sessionid(t);
>  	security_task_getsecid_obj(t, &context->target_sid);
> -	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
> +	strscpy(context->target_comm, t->comm);
>  }
>  
>  /**
> @@ -2757,7 +2757,7 @@ int audit_signal_info_syscall(struct task_struct *t)
>  		ctx->target_uid = t_uid;
>  		ctx->target_sessionid = audit_get_sessionid(t);
>  		security_task_getsecid_obj(t, &ctx->target_sid);
> -		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
> +		strscpy(ctx->target_comm, t->comm);
>  		return 0;
>  	}
>  
> @@ -2778,7 +2778,7 @@ int audit_signal_info_syscall(struct task_struct *t)
>  	axp->target_uid[axp->pid_count] = t_uid;
>  	axp->target_sessionid[axp->pid_count] = audit_get_sessionid(t);
>  	security_task_getsecid_obj(t, &axp->target_sid[axp->pid_count]);
> -	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
> +	strscpy(axp->target_comm[axp->pid_count], t->comm);
>  	axp->pid_count++;
>  
>  	return 0;
> -- 
> 2.43.5
> 

Good usage of two-argument strscpy(). This helps towards [1].

Reviewed-by: Justin Stitt <justinstitt@google.com>

[1]: https://github.com/KSPP/linux/issues/90

Thanks
Justin
