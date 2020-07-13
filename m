Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EF821D6A6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 15:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F9B6E4FB;
	Mon, 13 Jul 2020 13:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C326E4EC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594646524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edOrghovsTl9yTDWwi9fzaESzHDSf4CiS9atP/uIedw=;
 b=HzA1xZA7rdRQtrEOTw2uHMh3m2pKVjZ7UPtUmIMdebNMOaAAObtOiWFTkCz+RfU42wJaKz
 DtwB+ArW4C2cIngzhE/R3fYeNyQnqs7/R2lGckX+nU0UcuBTjQlFfIUvf+MXxJLmXwAcUA
 5BtI9a8+2McjALsISUj4sHf3DyE55YI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-oidJ-_u6N36hACxKU5oFAA-1; Mon, 13 Jul 2020 09:21:53 -0400
X-MC-Unique: oidJ-_u6N36hACxKU5oFAA-1
Received: by mail-qk1-f198.google.com with SMTP id q6so10725123qke.21
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 06:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=edOrghovsTl9yTDWwi9fzaESzHDSf4CiS9atP/uIedw=;
 b=EcRJgQq1WmU6UF5/G9t6LsEEDsKQ9o6mKe5D6ko0rRgLjtRUTjjbHKNK8hOOrwO7R5
 KaRGI4hVfATzbR9SL//QIoxBjsGH7iO2Iu6t88MX2u3PziNoC820VPnQx1qMB4UlaifG
 UNkbELWdCeFzI8w0SWCTLAIh+Hrgt0f12O1alfPFmBlO8UdE5H0j2iMBYIrkwJr2/9U0
 10Bia6XiqE2Tu2C0eVl8s6HCdYmpCgmJaIvgKdk1QYW9rSLXzMe4qMMsIUZioHUatkho
 F7PTM0UOFIr4vSYTVdYn38Xun0TMjVW4vwiIwPSA7vueO3xCBbKnPSe3GF5A9BHYBiUT
 igeg==
X-Gm-Message-State: AOAM530puunEpH89Rhny+TOhJjRzrjaySsITDExHg0OI06KkXz+KFJZ4
 A/sg1ekUUWytBe2Dik/E9U18AgZtcpHhqE22BLJUouECmg53spqh78AQUHRcLFeQpa7rE1dB42M
 pDJao3xWnnO4QMhXOd3YCNprFUDUx
X-Received: by 2002:a0c:a306:: with SMTP id u6mr67426918qvu.88.1594646512969; 
 Mon, 13 Jul 2020 06:21:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYRKNW3SgUy7XnKo2RNZqSZNx5VyzzmbGCZ2MPDith9Noszi80okXC2k3n8/dWFeBZeD0Xlg==
X-Received: by 2002:a0c:a306:: with SMTP id u6mr67426900qvu.88.1594646512707; 
 Mon, 13 Jul 2020 06:21:52 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
 by smtp.gmail.com with ESMTPSA id l1sm19358395qtk.18.2020.07.13.06.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 06:21:51 -0700 (PDT)
Subject: Re: [PATCH] drm/vboxvideo: Replace HTTP links with HTTPS ones
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200713124923.34282-1-grandmaster@al2klimov.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a48d1f1f-d292-cda1-cafc-ac16c0606d7a@redhat.com>
Date: Mon, 13 Jul 2020 15:21:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200713124923.34282-1-grandmaster@al2klimov.de>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/13/20 2:49 PM, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>    If not .svg:
>      For each line:
>        If doesn't contain `\bxmlns\b`:
>          For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>              If both the HTTP and HTTPS versions
>              return 200 OK and serve the same content:
>                Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

The "new" https link works for me and I see no reason why
not to do this, other then that some weird site might still
only do http, so:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

(oh on second reading I see that the script already checks
  that the new link works, ah well)

Regards,

Hans



> ---
>   Continuing my work started at 93431e0607e5.
>   See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>   (Actually letting a shell for loop submit all this stuff for me.)
> 
>   If there are any URLs to be removed completely or at least not just HTTPSified:
>   Just clearly say so and I'll *undo my change*.
>   See also: https://lkml.org/lkml/2020/6/27/64
> 
>   If there are any valid, but yet not changed URLs:
>   See: https://lkml.org/lkml/2020/6/26/837
> 
>   If you apply the patch, please let me know.
> 
>   Sorry again to all maintainers who complained about subject lines.
>   Now I realized that you want an actually perfect prefixes,
>   not just subsystem ones.
>   I tried my best...
>   And yes, *I could* (at least half-)automate it.
>   Impossible is nothing! :)
> 
> 
>   drivers/gpu/drm/vboxvideo/hgsmi_defs.h | 2 +-
>   drivers/gpu/drm/vboxvideo/vbox_hgsmi.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/hgsmi_defs.h b/drivers/gpu/drm/vboxvideo/hgsmi_defs.h
> index 6c8df1cdb087..3cb52f2b2274 100644
> --- a/drivers/gpu/drm/vboxvideo/hgsmi_defs.h
> +++ b/drivers/gpu/drm/vboxvideo/hgsmi_defs.h
> @@ -58,7 +58,7 @@ struct hgsmi_buffer_tail {
>   	/* Reserved, must be initialized to 0. */
>   	u32 reserved;
>   	/*
> -	 * One-at-a-Time Hash: http://www.burtleburtle.net/bob/hash/doobs.html
> +	 * One-at-a-Time Hash: https://www.burtleburtle.net/bob/hash/doobs.html
>   	 * Over the header, offset and for first 4 bytes of the tail.
>   	 */
>   	u32 checksum;
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_hgsmi.c b/drivers/gpu/drm/vboxvideo/vbox_hgsmi.c
> index 94b60654a012..a9ca4d0c3eca 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_hgsmi.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_hgsmi.c
> @@ -8,7 +8,7 @@
>   #include "vboxvideo_vbe.h"
>   #include "hgsmi_defs.h"
>   
> -/* One-at-a-Time Hash from http://www.burtleburtle.net/bob/hash/doobs.html */
> +/* One-at-a-Time Hash from https://www.burtleburtle.net/bob/hash/doobs.html */
>   static u32 hgsmi_hash_process(u32 hash, const u8 *data, int size)
>   {
>   	while (size--) {
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
