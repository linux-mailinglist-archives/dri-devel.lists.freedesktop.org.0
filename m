Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D7449C875
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33A910E8AB;
	Wed, 26 Jan 2022 11:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8AB10E8AB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643195915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=srD1l04gPQ84q1XF/RWjCuwwGgitsqKSn4fv06ciBhg=;
 b=BOq1JhOQ6S5CBzLMafGtyDPZsi8Ip66bN/ZQDczOdtou3QFz8vfAU11O/uvZAnsl88tyn9
 Ag42FArFJKYuGyZuX70P6b9Ab/o+uOchbFdPmeNwH6msPuJ+Kn4/Jd5ehWfnxDEPKMlIPe
 aunQR60Au1OiUBAx5idNc5eDjDW2gCU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-juNFBo25N0axq2mr8LoF5Q-1; Wed, 26 Jan 2022 06:18:33 -0500
X-MC-Unique: juNFBo25N0axq2mr8LoF5Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 t13-20020adfa2cd000000b001d09443ee4fso4161034wra.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 03:18:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=srD1l04gPQ84q1XF/RWjCuwwGgitsqKSn4fv06ciBhg=;
 b=Xo0N0+aG0d9HrW/dvxb37t0xwME2XkzF8tsvJ+NZmQ/yk4dQnXRWZP9mGCSNJJSDjM
 okz2v1lyAC06E0oufV/ja+ytz++lqJz8X0uDu+B1adK/1Ok65mg2EWAI3psn1svIOdAz
 aJHWULKUdLq8f5qkop/KzFGhrLj55DZbRh4x33kPFtNeK4nmxUflKiGORWvdXz5H1mFP
 C7w50Fv9QySrKk9mBiKfS68fCR9htGGUgsLme94fpjyuZE1jfvbclNcENH/jw8ToPFD4
 JrilQw7zOsl6ZJyzMA+sfDdmDmXFLF55LPz9iLE0SzG1I5dpj/nHam1MLk/Fz5DYvN1D
 ntjA==
X-Gm-Message-State: AOAM533BBakDnzPiAikThovY1if3limou5v/4+RGUhn4zUNVmFqlCqro
 Gl4RQVK2Y5iAJgEvGpZzpCyVm3A0LBkh3wJ4GSMvpZvbYrQ6AjsY0a+T7Ue2CAAOt7CEu6C0Ixo
 1wZISWbKVUo9v0S1zvGkg35YBx2K4
X-Received: by 2002:a05:6000:156d:: with SMTP id
 13mr1586784wrz.66.1643195912596; 
 Wed, 26 Jan 2022 03:18:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvCzW4Jn73KJItw350M3F/f6JTN+7T8OA7kDxsaF2hqvwBivMpTbBXPxCTm3unY1Mql6OAYg==
X-Received: by 2002:a05:6000:156d:: with SMTP id
 13mr1586760wrz.66.1643195912374; 
 Wed, 26 Jan 2022 03:18:32 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id i17sm19005103wru.107.2022.01.26.03.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 03:18:32 -0800 (PST)
Message-ID: <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
Date: Wed, 26 Jan 2022 12:18:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Helge Deller <deller@gmx.de>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 11:59, Helge Deller wrote:
> On 1/26/22 11:02, Andy Shevchenko wrote:

[snip]

>> P.S. For the record, I will personally NAK any attempts to remove that
>> driver from the kernel. And this is another point why it's better not
>> to be under the staging.
> 
> I agree. Same as for me to NAK the disabling of fbcon's acceleration
> features or even attempting to remove fbdev altogether (unless all
> relevant drivers are ported to DRM).
> 

But that will never happen if we keep moving the goal post.

At some point new fbdev drivers should not be added anymore, otherwise
the number of existing drivers that need conversion will keep growing.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

