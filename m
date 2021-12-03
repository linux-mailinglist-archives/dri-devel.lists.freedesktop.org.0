Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C06467AB0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 16:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E806EDDF;
	Fri,  3 Dec 2021 15:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608C96EDDF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 15:58:14 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t9so6644590wrx.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 07:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=ws1r6luiKcFLGmHQC5MDCjqpZbp9tkgkP1274bUaIqI=;
 b=mFH6sAT74XBZpwpRsrazCgeKuR+w0HKUbHU339AyglhpjbFAtrr2MpWPRW3o4vYTgE
 5NNR8yknW97iI+ayHGDRva6uFly5IwNUbh2+UBtB/Bc/aG7F2plZdb77b/9iSargagRD
 Pvmh5qAEN6OEdnGCiWmMd8qc6o3eySTNgN0i4zxrpCBUpF4MXQkxXgVBpxUVtAfpbzQJ
 ZxyvKh1jokMepLFzRzOSUhmJsKV9MVqy3IbPs89ff4PrJxHxuSLOdom/7P5nwT5yVylX
 GwZBYAZ4nVsxArMh0zBnzhzrp9isgnKGCmdBZqBLGwLC22EG6/ACgocu3pVt+hoJJmNv
 OeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=ws1r6luiKcFLGmHQC5MDCjqpZbp9tkgkP1274bUaIqI=;
 b=mQxmaghfjQBSFuNsan1SpvPudpgHc0AKhGc6acz6jeRbtv+PcnQcrTo2bqAU4m2rbx
 L3tiMYrXS6CbjMKzl3BoQ18Mgvcz0aASTTpqg+MBomfm7HAgWdiKJGdC2n4UcHPky68E
 T5ZX30ws6rQKJ0kpWxXUuffpxLO/+BOjkaadAbd8ahtoGTMCZ5LbQ0ybdJmEpSQwNYe3
 knQrbiX0Q1ISGaHjDnBexR8VayO3qmobWQjo7qf81Qy0sGulQBmCAKBF7cAtIXM7ektX
 wMtgOPyDl1XLxF0M2Nh5a2oQbPqxRmoIGD+D+76ZBrcsnG4fPe5cupyj0cth+yAxt6Kd
 3OIQ==
X-Gm-Message-State: AOAM532+cvJUir9HO08LAkUT4x7UMs4H9q/UWURZyznW5KZ5ykBh/ORA
 vevcNWH2QW3HguCMuHBjU+Q=
X-Google-Smtp-Source: ABdhPJx9c2tj3IZsUkjwbdvjCpvJizQK/Uv5qccGFVRnfb5Xwoc0YO5mQChU8gdeUwfda+nlsE8QbA==
X-Received: by 2002:a5d:40c8:: with SMTP id b8mr22407962wrq.610.1638547092871; 
 Fri, 03 Dec 2021 07:58:12 -0800 (PST)
Received: from [192.168.0.23] (static-66-219-86-188.ipcom.comunitel.net.
 [188.86.219.66])
 by smtp.gmail.com with ESMTPSA id s24sm2770012wmj.26.2021.12.03.07.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 07:58:12 -0800 (PST)
Message-ID: <392a239a-14da-c544-a1f9-09d8b25d3e07@gmail.com>
Date: Fri, 3 Dec 2021 16:58:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Mark Yacoub <markyacoub@chromium.org>, dri-devel@lists.freedesktop.org
References: <20211202151200.3125685-1-markyacoub@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] drm: send vblank event with the attached sequence rather
 than current
In-Reply-To: <20211202151200.3125685-1-markyacoub@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: chunkuang.hu@kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, tzungbi@google.com, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

On 02/12/2021 16:11, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 

please make sure to add the linux-mediatek mailinglist in any follow-up 
communication.

Regards,
Matthias

> [Why]
> drm_handle_vblank_events loops over vblank_event_list to send any event
> that is current or has passed.
> More than 1 event could be pending with past sequence time that need to
> be send. This can be a side effect of drivers without hardware vblank
> counter and they depend on the difference in the timestamps and the
> frame/field duration calculated in drm_update_vblank_count. This can
> lead to 1 vblirq being ignored due to very small diff, resulting in a
> subsequent vblank with 2 pending vblank events to be sent, each with a
> unique sequence expected by user space.
> 
> [How]
> Send each pending vblank event with the sequence it's waiting on instead
> of assigning the current sequence to all of them.
> 
> Fixes igt@kms_flip "Unexpected frame sequence"
> Tested on Jacuzzi (MT8183)
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>   drivers/gpu/drm/drm_vblank.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 3417e1ac79185..47da8056abc14 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1902,7 +1902,7 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
>   
>   		list_del(&e->base.link);
>   		drm_vblank_put(dev, pipe);
> -		send_vblank_event(dev, e, seq, now);
> +		send_vblank_event(dev, e, e->sequence, now);
>   	}
>   
>   	if (crtc && crtc->funcs->get_vblank_timestamp)
> 
