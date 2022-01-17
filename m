Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038FB4905CF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 11:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5D310E1B7;
	Mon, 17 Jan 2022 10:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADB110E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642414795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2Jwh6X9L+KjOaA4kG9lgML07Ljz7RAuTmgyF2gmzTk=;
 b=hDeQUcPeAJOXBs5atH6HAwl9kQExo2ca5HPbaHMSH3nF/EvVU55mqz1weiSGpITOj1Xyl9
 29KEDwYi5rMJCXjSI6aLP+sCudDF/z5h7nCveMHQFYXlgmT9Ue6Sua8LIjExy8MCb2vYna
 YFoYOiHyXuEqbBSTKreQrYKjP+Sgklw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-HgjONvw0MlKhSK6pdPnudQ-1; Mon, 17 Jan 2022 05:19:53 -0500
X-MC-Unique: HgjONvw0MlKhSK6pdPnudQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o185-20020a1ca5c2000000b003478a458f01so11893702wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 02:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M2Jwh6X9L+KjOaA4kG9lgML07Ljz7RAuTmgyF2gmzTk=;
 b=18fdIk/2FHcJ18DypFW/PgCOrjL9HJPHPva56XuALHeJEIIS+9L86bDH8f2UxW/0PP
 97benkks8HeZqujWfN3LwCzDwvVr7lV9cZHVT6bvs1jzvjeEURuu3EngIbxZzCWzp1K4
 Y9iuz9y0Y3olryKgeRpZyFB1zGBlPowNvNOu9mww5DwqT/lpyGQVoJnICq6EZZ0K0R/P
 qyZDv1OwYSbEOQ8ZTc0/hOrw6GAd8+KM/qsoZPz05C8IMBoM27DM5vsVdOMMyfpksCbw
 MT5pICw7Ku6ZXd8ezwxokQz308b/MJKdht1hGQ8cDZY9korIHVSbRSeSfceWlLkg7hOT
 hT/g==
X-Gm-Message-State: AOAM5334iYjnP+EoG0uwF9zVMdC+g+Lqsrm2voyA0dNiIOWgeR2BTr31
 udZVfFR90s71tVAOJLYiVHWZNTfh8ngivrd3sWGGuj4tnGrny6MIEF+w0LJTg2I39PwQOqZv6AX
 pvcJq9s+4kU5k0DyvMxrvaxkc5HYx
X-Received: by 2002:adf:b60d:: with SMTP id f13mr8447985wre.225.1642414791822; 
 Mon, 17 Jan 2022 02:19:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjvQUUb/H0EZLSZ3Ie0h6oeM1z//4qUyAexcNH+Hmg6QGgAM53E0ZxOy6w07KCaNZAYcAt7Q==
X-Received: by 2002:adf:b60d:: with SMTP id f13mr8447972wre.225.1642414791578; 
 Mon, 17 Jan 2022 02:19:51 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id z7sm15283605wrm.117.2022.01.17.02.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 02:19:51 -0800 (PST)
Message-ID: <fa7d7b0e-50bf-dc1b-a708-408de47b1e66@redhat.com>
Date: Mon, 17 Jan 2022 11:19:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "airlied@gmail.com" <airlied@gmail.com>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/17/22 11:02, Daniel Vetter wrote:

[snip]

>>  FRAMEBUFFER LAYER
>> -L:     dri-devel@lists.freedesktop.org
>> +M:     Helge Deller <deller@gmx.de>
>>  L:     linux-fbdev@vger.kernel.org
>> -S:     Orphan
> 
> Maybe don't rush maintainer changes in over the w/e without even bothering
> to get any input from the people who've been maintaining it before.
> 
> Because the status isn't entirely correct, fbdev core code and fbcon and
> all that has been maintained, but in bugfixes only mode. And there's very
> solid&important reasons to keep merging these patches through a drm tree,
> because that's where all the driver development happens, and hence also
> all the testing (e.g. the drm test suite has some fbdev tests - the only
> automated ones that exist to my knowledge - and we run them in CI). So
> moving that into an obscure new tree which isn't even in linux-next yet is
> no good at all.
> 
> Now fbdev driver bugfixes is indeed practically orphaned and I very much
> welcome anyone stepping up for that, but the simplest approach there would
> be to just get drm-misc commit rights and push the oddball bugfix in there
> directly. But also if you want to do your own pull requests to Linus for
> that I don't care and there's really no interference I think, so
> whatever floats.
>

I second that getting commit rights in drm-misc and pushing the changes
there makes much more sense than keeping a separate tree for fbdev.

Not only for the fbdev core and fbcon but also for fbdev drivers. There
is common for fbdev drivers bugs to be exposed after DRM changes, so it
is more convenient to push fixes for these through the same tree as well.

As an example, just last week I had to fix issues in the vga16fb driver
that started to occur after a change to support simpledrm in aarch64:

https://lore.kernel.org/all/20220111131601.u36j6grsvnir5gvp@houat/T/

If there is a separate tree for fbdev, then this would require to do
some coordination, share and merge immutable branches, etc for no
clear benefit.

Best regards,-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

