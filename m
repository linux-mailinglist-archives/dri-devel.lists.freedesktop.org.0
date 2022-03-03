Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C964CB935
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9EC10EF60;
	Thu,  3 Mar 2022 08:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F315D10EF58
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646296687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7VbL5lT53mUztHyArx9pP7wyihmJ4M3NPqTtcvOQ2VI=;
 b=X6hNB79T/AP8VlAWg15d9IveEEkZKNhsAeiO9I6craiqet1W8RrTPyfV5gZ9nJKXHgQPPl
 TBRWekikCjQwAjodNsYphOZlFRzCV6Pcl0HNESx98t5F2G5sXeOjhzKAv006v4Z+aEwxhT
 gNd3ewXtXz1jVrkxqXHaIePQQAm/jbQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-NXfKnH30NoqvnamIYH8sVA-1; Thu, 03 Mar 2022 03:38:06 -0500
X-MC-Unique: NXfKnH30NoqvnamIYH8sVA-1
Received: by mail-wr1-f69.google.com with SMTP id
 p18-20020adfba92000000b001e8f7697cc7so1744792wrg.20
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 00:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=7VbL5lT53mUztHyArx9pP7wyihmJ4M3NPqTtcvOQ2VI=;
 b=FjI6NvyjBGkP7HDN4RYjS4Uqd9tjOsqUtOgoN+uejdFw7Ppsa4C6MpL82w7zZPd7eQ
 bhqD/gKfYRfVwRjoqHH1RcBfjDgoTzVWeX6D2FueBsRt03vqcgEWDXl2Fr3sOjm0M+Mi
 ps5m5Gb8AvKqScwHWUoJ6jt3LinUJUbb5/F1rLqO2DU6bA8LUotJChCYasxRR3m9SkHx
 wK3cY3rP7uExWZf4rL2LJw3qSJkiu/cUp/9zKMswQJtqfo0EM5p2VcJQxCefuh3WNwze
 R65isYDlGiJvhNr9VfY+PWlnq9NNmzhaiPA8RAcg52z+zbpFMnqS0tQcF2L7qpWyQjPM
 lPpQ==
X-Gm-Message-State: AOAM532Ft5RHwSZxVq5ywxpaace921svRetEAbLrBkjCm2fpcTBXTTqx
 Ugpc3cbAPgTXIGS1FvVQSleCmW66CQHYFx8yH1cP1vskkgMKS0mcNkjDDF6W0ROQq5dqBni8t88
 h3I2JBW0PTd65eyd4rWV22MBwjbz7
X-Received: by 2002:a5d:47a4:0:b0:1f0:46e4:19bc with SMTP id
 4-20020a5d47a4000000b001f046e419bcmr4066496wrb.601.1646296684782; 
 Thu, 03 Mar 2022 00:38:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/AOr9kcfSCL6dEmzp2KPAxB6X5N/u/fMMDoNJCyjfqcaaRT42zcBqSgBSliGMWF1kL7ADpA==
X-Received: by 2002:a5d:47a4:0:b0:1f0:46e4:19bc with SMTP id
 4-20020a5d47a4000000b001f046e419bcmr4066475wrb.601.1646296684567; 
 Thu, 03 Mar 2022 00:38:04 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a5d590f000000b001f04b96f9a9sm1338936wrd.42.2022.03.03.00.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 00:38:04 -0800 (PST)
Message-ID: <8cef7451-ac6a-9ca5-b521-1eec53d30880@redhat.com>
Date: Thu, 3 Mar 2022 09:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH][next] drm: ssd130x: remove redundant initialization of
 pointer mode
From: Javier Martinez Canillas <javierm@redhat.com>
To: Colin Ian King <colin.i.king@gmail.com>
References: <20220302175309.1098827-1-colin.i.king@gmail.com>
 <CAFOAJEfS9dMY5nudeFxtwchTtLnBCh7N4qKaCdqvaodnRUFKzA@mail.gmail.com>
In-Reply-To: <CAFOAJEfS9dMY5nudeFxtwchTtLnBCh7N4qKaCdqvaodnRUFKzA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/2/22 19:29, Javier Martinez Canillas wrote:
> Hello Colin,
> 
> Thanks for the patch.
> 
> On Wed, Mar 2, 2022 at 6:53 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>>
>> Pointer mode is being assigned a value that is never read, it is
>> being re-assigned later with a new value. The initialization is
>> redundant and can be removed.
>>
> 
> Indeed.
> 
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>

Pushed to drm-misc-next (with fixed drm/ssd130x subject prefix).

Thanks!
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

