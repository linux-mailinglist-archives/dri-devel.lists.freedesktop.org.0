Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE26078D3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 15:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA5B10E2D5;
	Fri, 21 Oct 2022 13:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0963410E2D5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 13:46:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bk15so4848557wrb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 06:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HTW1ak8VzXpCI08r4eBk6oGot7zwzXVhKo5pydkpeYg=;
 b=p1qqqicfd4r4KTGeXyghw0nEbDqVKLwzb+v2Q89PWDLhSZYh5+ZNmQsn9Gk0/gTjLL
 yrLxbqEqhTRSVKYjODNy5fih1v9iBQs45CWaiIe6vGx1uaURFTdo6N+stQCSllMtnTni
 +7YOlQ3gPs6dDl9KVwizvRzMWe6lV/aZKCwqGqRVFwCKzUioalpoN+zqttWFZOyv2y14
 gOEyziwXYrCkKDH1iCVow+VORlgju91uLXUSAAC2cLiRheYfAcYwjrLqoYC+v0GbrGSx
 hFKBNBKEIoaMt1FXYSCdj8LKUl5eQxWGzMJrkkOFRHsQL8G5EYACYRvM7REYhO9hxiqG
 8L/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HTW1ak8VzXpCI08r4eBk6oGot7zwzXVhKo5pydkpeYg=;
 b=uHLXet83x2kNnFr4Hiu3ExhNxG8YjkAitjeKaAgdfihDL3uJLT+fXr9caWN5JgUDnK
 n3dDQDWn31XNFuTfnKaHIAsG2k0yxNUMzjC51ds1FV4J4cm9DStJJv7NHdf1+L94CX1S
 lEUga8ETy7cZ7W/w+wMIAHGZ/22iosZmiXcQkMarFMyOgEi4282yyeR3hWgsV1hZN9Uy
 Cic18PXOkZY8Sm/dJqvLq4gGpRu4AEwx1y0ZPUBQsA0vXSb5w9unsOuOOXA833ih75kZ
 rcvbiKeRQuCq7NqtOuTrwz/rvk9N5ys51XpQebOy24OhZGKVAz1t9Y64J/H2Vvx+5Bwz
 sZMQ==
X-Gm-Message-State: ACrzQf2Z3UUKZsKxMAaGj6Bd53ZSJdeaBjl3/pmYFXNreRRF5+NxOxV/
 G2BxGDvPIrVy7F6GMhyJ6DA=
X-Google-Smtp-Source: AMsMyM5EJnFWhH5Op3x2LjXVu/A/2KGcxz3mtqjBA6sl524eV9v2p83Y2K5kU504CX5uXWoyFR0NGQ==
X-Received: by 2002:a05:6000:713:b0:232:bd2e:8620 with SMTP id
 bs19-20020a056000071300b00232bd2e8620mr12587712wrb.139.1666359970448; 
 Fri, 21 Oct 2022 06:46:10 -0700 (PDT)
Received: from [192.168.2.181] (46-10-149-153.ip.btc-net.bg. [46.10.149.153])
 by smtp.gmail.com with ESMTPSA id
 c192-20020a1c35c9000000b003c6fb525b4csm2580252wma.38.2022.10.21.06.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 06:46:10 -0700 (PDT)
Message-ID: <82bdc429-f4c8-5a41-cd6f-53bae1609ca9@gmail.com>
Date: Fri, 21 Oct 2022 16:46:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 17/17] drm/vmwgfx: Fix a sparse warning in kernel docs
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20221021034400.542909-1-zack@kde.org>
 <20221021034400.542909-18-zack@kde.org>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20221021034400.542909-18-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


On 21.10.22 г. 6:44 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> Fixes a warning about extra docs about a function argument that has been
> removed a while back:
> drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3888: warning: Excess function
> parameter 'sync_file' description in 'vmw_execbuf_copy_fence_user'
>
> Fixes: a0f90c881570 ("drm/vmwgfx: Fix stale file descriptors on failed usercopy")
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index c943ab801ca7..f16fc489d725 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -3869,7 +3869,6 @@ int vmw_execbuf_fence_commands(struct drm_file *file_priv,
>    * @fence: Pointer to the fenc object.
>    * @fence_handle: User-space fence handle.
>    * @out_fence_fd: exported file descriptor for the fence.  -1 if not used
> - * @sync_file:  Only used to clean up in case of an error in this function.
>    *
>    * This function copies fence information to user-space. If copying fails, the
>    * user-space struct drm_vmw_fence_rep::error member is hopefully left

Phantom arg doc goodbye!


Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,
Martin

