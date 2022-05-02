Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8105170B6
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AA310EDB3;
	Mon,  2 May 2022 13:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FD610EDDE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651498756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AACCYwEb3HAEwNDAWzh6kcVyACHhLSxVfI/MApFcd18=;
 b=JZ9N2QACNN0BuA91axT1qjmDIiNvHRKuHDXtMlZ9x3T5aCsFoM3/OkiNDVpJoEh2/b/2u8
 GQ+9ZlGz81W7E6zbhURArUo0XrbFfqHe1wlkHL2N2qHGDbO7J9WzNNfRqoWcOEwIlSWGXW
 l1bzL/ctyawmFPLM1H5OxVLH7sVKYhA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-alrShwazMKOQ4KzbY8S_TQ-1; Mon, 02 May 2022 09:39:16 -0400
X-MC-Unique: alrShwazMKOQ4KzbY8S_TQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 y13-20020adfc7cd000000b0020ac7c7bf2eso5319311wrg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 06:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AACCYwEb3HAEwNDAWzh6kcVyACHhLSxVfI/MApFcd18=;
 b=ipl9SlGBXszM9QV2iN4G3rQVGxv9gu45u1YW1KGd+wpFavR803GeS5ACUUPSVVGLvx
 aG4QKRYOeCwdysRJrhPf8EoYL+rnvtkgYLtbLB7loHThHpFD0ncMFqhdN5A07od7vCsa
 0eVZIb+JjfW74t75fugu5kI7CD6pPDMq35ZO08oYHucU25xjiOF/KXnZf9Epfu88808i
 kqe0ulSHYyTpEjZ3C7ZDatqQ73Jt40xIiGytKHHi7GEztBR8JkdDzcWJcwCYcJZtnVTK
 q9roPvtzSrKnaIaUGPsqoR/ffVOBuxq3O+pHyhej7mZBIDslW8LlJd5bvj+d27yvmbRb
 WNTw==
X-Gm-Message-State: AOAM5315FBlyAIgRfyd2x9uCXfRVVyyjcfO7R2axY2c3HfznpqpHGyii
 F43wG+JWxVdx81Zb9G4kDJqfw+h2TrUnQWFpAJ+ok6h8BIAFVDFDNRKTZA4DTKyt4NSUmdplkEh
 buY527GHD5TIoBsdl+qaDsWP77XIA
X-Received: by 2002:a5d:6949:0:b0:20a:e021:f8e0 with SMTP id
 r9-20020a5d6949000000b0020ae021f8e0mr9732267wrw.231.1651498754781; 
 Mon, 02 May 2022 06:39:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiFHiruw5PqOFfDYvA2cdleMn/Sl8zUlYotGSp7XuBWv4ZRfgdGg8OrKeSHP/woSkX0+a5Lw==
X-Received: by 2002:a5d:6949:0:b0:20a:e021:f8e0 with SMTP id
 r9-20020a5d6949000000b0020ae021f8e0mr9732248wrw.231.1651498754561; 
 Mon, 02 May 2022 06:39:14 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v22-20020adf8b56000000b0020c5253d8d4sm7052912wra.32.2022.05.02.06.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 06:39:14 -0700 (PDT)
Message-ID: <f4430a8a-1112-9f27-4c38-4fc852c811fd@redhat.com>
Date: Mon, 2 May 2022 15:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] fbdev: Make fb_release() return -ENODEV if fbdev was
 unregistered
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220502130944.363776-1-javierm@redhat.com>
 <20220502130944.363776-3-javierm@redhat.com>
 <193c9eef-af13-219c-e5e0-2cc9469bf562@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <193c9eef-af13-219c-e5e0-2cc9469bf562@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, Changcheng Deng <deng.changcheng@zte.com.cn>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/2/22 15:20, Thomas Zimmermann wrote:
> 
> 
> Am 02.05.22 um 15:09 schrieb Javier Martinez Canillas:
>> A reference to the framebuffer device struct fb_info is stored in the file
>> private data, but this reference could no longer be valid and must not be
>> accessed directly. Instead, the file_fb_info() accessor function must be
>> used since it does sanity checking to make sure that the fb_info is valid.
>>
>> This can happen for example if the fbdev driver was one that is using a
>> framebuffer provided by the system firmware. In that case, the fbdev core
>> could unregister the framebuffer device if a real video driver is probed.
>>
>> Reported-by: Maxime Ripard <maxime@cerno.tech>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Thanks.
 
> This seems like the correct thing to do in any case. Thanks for the 

Agreed, it's certainly a bug if not the same that was already reported.

> patch. Before merging, you should also add
> 
> Fixes: 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced 
> removal")

I thought about that but I don't think that's accurate since the bug is
not related to that commit. That might make easier to reproduce it but
is something that would happen anyway if for example someone attempted
to remove a module or unbind the device using the sysfs entries.

Maybe I can comment in the commit message that this change made it more
likely to occur and for that reason I'm adding a fixes tag.

> Reported-by: Junxiao Chang <junxiao.chang@intel.com>
>

Indeed.
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

