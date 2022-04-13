Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB714FF522
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 12:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2192910E1EF;
	Wed, 13 Apr 2022 10:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE8110E1EF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649847056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8f/PwshmkguRT4VixsIFRRZxWGHz2g1FKjPSgvCys1U=;
 b=PH92T2uAPa1DqbYT0KsgxTD6JcmMf0M0F65FAS+7OQdUPTCo6+ThZLSMu2cMKpnONSBzg4
 41YBxK1daDSmS3Ua9fkL3M3TwjN9EwxAPtHFdEBWZ4nh2Ofz5FFIv6SESAn2GhPrdmhmn0
 DC8rWoDRp/OI2QqaM1FoK5BeOL8mD0s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-XgrotyCtMo-wavBchx0mHg-1; Wed, 13 Apr 2022 06:50:53 -0400
X-MC-Unique: XgrotyCtMo-wavBchx0mHg-1
Received: by mail-wr1-f72.google.com with SMTP id
 105-20020adf82f2000000b002079aba50b9so252247wrc.18
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 03:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8f/PwshmkguRT4VixsIFRRZxWGHz2g1FKjPSgvCys1U=;
 b=taFttSig49PJ3SWJAnLLvtlps1QbIWK/lq4rkC8SeV4KA2NXrzuuGKmsXM7xf54Gmw
 QVshN5ZXg2uDDX8DeaPEelZwOXCq1FSXzVzppzIG+PIPlEiFocK6DlLhSxvmABfbPNcS
 NqZm778N9A+tgmqmEdGpOpMwELCHiN6gRm9D67VcGakx3u0uLGG6cERp6dVYbTC85+h3
 Y2scxyDyFQ+7gnb3mnWZRoBOFl9s02dAn4BRUZRABoRHxkv8wfpDSIC9infFYLZh6aNJ
 0wHxPHqbqUeTcqcnmBBRb9KZJhE9fRczyYfK63o5gqGQgMFbPV3z6WkYlEK+0hnKpFHq
 Hgig==
X-Gm-Message-State: AOAM530DloGublNjZjli/4us1N3ERYAOPoeIuTxMPX9Db4llazDf0hKe
 C8ognN3AXAD00dG5DEosioDi4BtLw7KtpFndpMF7uG1KMXaMXjdkXlK/S8Mzo+BP7a1DV9DsM+G
 O73q7nFrss2qVWPG1dB0Qd62mhQGN
X-Received: by 2002:adf:e2cb:0:b0:203:7564:1076 with SMTP id
 d11-20020adfe2cb000000b0020375641076mr32602161wrj.199.1649847052081; 
 Wed, 13 Apr 2022 03:50:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRxfN1JAPTNpXMTTDU9DhECg4cctSX/rrDt8wkv7XgQMTGGJbHn9zb6tPrmr8j280opAJ2Jg==
X-Received: by 2002:adf:e2cb:0:b0:203:7564:1076 with SMTP id
 d11-20020adfe2cb000000b0020375641076mr32602150wrj.199.1649847051871; 
 Wed, 13 Apr 2022 03:50:51 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a1c2b04000000b0038a0e15ee13sm2157211wmr.8.2022.04.13.03.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 03:50:51 -0700 (PDT)
Message-ID: <2e183cc9-603d-f038-54aa-5601f11b0484@redhat.com>
Date: Wed, 13 Apr 2022 12:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] fbdev: Remove hot-unplug workaround for framebuffers
 without device
To: Thomas Zimmermann <tzimmermann@suse.de>, robh+dt@kernel.org,
 frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de, sam@ravnborg.org,
 linux@roeck-us.net, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220413092454.1073-3-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/22 11:24, Thomas Zimmermann wrote:
> A workaround makes fbdev hot-unplugging work for framebuffers without
> device. The only user for this feature was offb. As each OF framebuffer
> now has an associated platform device, the workaround is no longer
> needed. Remove it. Effectively reverts commit 0f525289ff0d ("fbdev: Fix
> unregistering of framebuffers without device").
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/core/fbmem.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index bc6ed750e915..bdd00d381bbc 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1579,14 +1579,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
>  			 * If it's not a platform device, at least print a warning. A
>  			 * fix would add code to remove the device from the system.
>  			 */
> -			if (!device) {
> -				/* TODO: Represent each OF framebuffer as its own
> -				 * device in the device hierarchy. For now, offb
> -				 * doesn't have such a device, so unregister the
> -				 * framebuffer as before without warning.
> -				 */
> -				do_unregister_framebuffer(registered_fb[i]);

Maybe we could still keep this for a couple of releases but with a big
warning that's not supported in case there are out-of-tree drivers out
there that still do this ?

Or at least a warning if the do_unregister_framebuffer() call is removed.

Regardless of what you chose to do, the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

