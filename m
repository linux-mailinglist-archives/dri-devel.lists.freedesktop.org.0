Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92714DC4BD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 12:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F010910EA82;
	Thu, 17 Mar 2022 11:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CAB10EA82
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 11:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647516141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEoSz7AAiKghjz9qVXr4NOtovhAAAhgUZtpSN8iw34Y=;
 b=RlUslJd/KUKwxPYiifSxAj/o5STzvYLOV+EIkfbBJQqa3RaB0rZjIvO/FxoYyNrE8UIUv8
 QhqR8wtHd99ck6467nqN/R5aZElUt9OD2lsDKac1Bwsolw48+MqBs+b6Opwb9Fuikuvb2t
 Z1GnqQdwky6I1Kdmm2s8jomT/bMc88s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-bs3QQW9gPGmD2ZSWvhpP0A-1; Thu, 17 Mar 2022 07:22:20 -0400
X-MC-Unique: bs3QQW9gPGmD2ZSWvhpP0A-1
Received: by mail-wr1-f72.google.com with SMTP id
 q4-20020adfc504000000b00203e15159e8so1325300wrf.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 04:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QEoSz7AAiKghjz9qVXr4NOtovhAAAhgUZtpSN8iw34Y=;
 b=fVU4xknGXGZKbu0wqvC6xRyDSwEn9Hr7TcixFq7xLVycNeanoAu7yYeUDqH31b10Nj
 Jvvm8+OcJjdKN8w6HoJCihQXhdMghDWmzdadAb5A99VjtsT43KUecjlvMvEDR1K1lswb
 fRoawW1rVstDAz9FnFY4vHP2w8j5UHXqx7PATfnA0ZMGDBK9/HZqsXGACUn8rGMauy98
 UHblZoVVCh/9N9fj0H3+QpDv/D4exLtSmXj/Ez+nB+AacyCsOJMcqPp6rPl4mgknlb+f
 fYn05yI4dusiCRrE/rdHccRIJVa/y6fcWhiqJ1tR6NE7hl122hWexwc/FNi3uUCnEqXE
 UIXQ==
X-Gm-Message-State: AOAM530NNiK8/6VMHjnqFU1QK7q2YOxt1u560eis8OK/ZYBkgg++btRw
 z9LmaYZhnLOJmnlONaHgyBCjx/6Uv/bqRY7r1kSEocUzojLnZN624vQVzRQ9U/1HyYGQEqBAwLV
 lNcy594IMIBYo5VlTfdxydJTeOq0X
X-Received: by 2002:adf:e605:0:b0:203:d5f6:86f1 with SMTP id
 p5-20020adfe605000000b00203d5f686f1mr3310055wrm.689.1647516139107; 
 Thu, 17 Mar 2022 04:22:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW/NSLjkVDqNHoNB6Qk8HNunBT0QXw4v4wJ9GqJWC4CW8lzSq73gga5dYuo+CGC1TrzNeJ7g==
X-Received: by 2002:adf:e605:0:b0:203:d5f6:86f1 with SMTP id
 p5-20020adfe605000000b00203d5f686f1mr3310044wrm.689.1647516138891; 
 Thu, 17 Mar 2022 04:22:18 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d4bcd000000b001f0620ecb3csm3897610wrt.40.2022.03.17.04.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 04:22:18 -0700 (PDT)
Message-ID: <95d70bc0-491c-f208-5536-e1242a2d7d30@redhat.com>
Date: Thu, 17 Mar 2022 12:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] fbdev: Fix cfb_imageblit() for arbitrary image widths
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 m.szyprowski@samsung.com, geert@linux-m68k.org, sam@ravnborg.org
References: <20220313192952.12058-1-tzimmermann@suse.de>
 <20220313192952.12058-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220313192952.12058-3-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/13/22 20:29, Thomas Zimmermann wrote:
> Commit 0d03011894d2 ("fbdev: Improve performance of cfb_imageblit()")
> broke cfb_imageblit() for image widths that are not aligned to 8-bit
> boundaries. Fix this by handling the trailing pixels on each line
> separately. The performance improvements in the original commit do not
> regress by this change.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 0d03011894d2 ("fbdev: Improve performance of cfb_imageblit()")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

