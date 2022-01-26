Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA1F49C536
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 09:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3CF10E36E;
	Wed, 26 Jan 2022 08:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C483F10E36E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643185530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=440FgkXgCHAMbKC/iYJADapl1fZnVVa+IX4xnE02Kts=;
 b=Bh14UFUNQ4txJNGG25L6y7lb7Fwyu2kUv7LeH/V0LKwi4ohwU/KQz/pg1LWGUzEOcuJF69
 4JC5T7ceT6/kxOvC90Y5Cx8FVTPHyl8eZkgMybuqwxIBqYEwngiVXcSPE2REz37cKWifoj
 I3osiyf2FzIAYzWWbNEAkxmTRljYhi4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-woqTxZ2NOQ-TuLKSg8BDYg-1; Wed, 26 Jan 2022 03:25:29 -0500
X-MC-Unique: woqTxZ2NOQ-TuLKSg8BDYg-1
Received: by mail-wm1-f69.google.com with SMTP id
 f7-20020a1cc907000000b0034b63f314ccso2896267wmb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 00:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=440FgkXgCHAMbKC/iYJADapl1fZnVVa+IX4xnE02Kts=;
 b=mwcS7MwQMqSiOdxNtiQhsVqW1CVxbss/apqcdJkyp/gC6zv2VdQDQSyZQemjZXPq9S
 dwy4yEsd7OGGdRfS/Nj1UtshIisFcJFaEVfHZQ6ItzMuP+nBv2O/37nqjP1DnL5S7gVj
 u0P6ewXadLbJckrP7wF5MIEqX3QJyhvLs57qh+Gl5/Ie+Khi3PGLZ9gk8Ii/9W5TjZuf
 DfEGS2PwIsRubbFL0fVRNb8E0IHCIFCR3ZoA7BCj9+il98X8Z5Ovl1hfeABeZD1D4Fua
 mQv/TbAomF2lHV5iOaXjmJ+dx5c3pRzjG704CrM6N9E1i+Ioxcc/BrRWUnito1FbKiwq
 fmBA==
X-Gm-Message-State: AOAM532hdvJa5bdIbCdyF8B3NBf32qO0muPOqcgK3rBbl6St9ZOhI+yl
 Ea/og0di0frejDtvZa8xdoBJM8dp7N27veGjLjMM0cWCjjDXyXQCHVfsOQF+GsTzMrBMouqRTU8
 XX1nO9FSBc66me6oSZLNvAoFezIpw
X-Received: by 2002:a05:600c:4e01:: with SMTP id
 b1mr6313730wmq.97.1643185528399; 
 Wed, 26 Jan 2022 00:25:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0nxSgDr+rHQJ5DkmXXci2WlnMO5CxSppdclohkfn2HjF1BS+q4gY8ypCYaCWOtCjmbykX9Q==
X-Received: by 2002:a05:600c:4e01:: with SMTP id
 b1mr6313701wmq.97.1643185528090; 
 Wed, 26 Jan 2022 00:25:28 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id j13sm12984562wrw.116.2022.01.26.00.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 00:25:27 -0800 (PST)
Message-ID: <6fdcfbcf-0546-6b4f-b50f-cf2382ad746f@redhat.com>
Date: Wed, 26 Jan 2022 09:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/panel-edp: Allow querying the detected panel via sysfs
To: Doug Anderson <dianders@chromium.org>
References: <20220125135406.1.I62322abf81dbc1a1b72392a093be0c767da9bf51@changeid>
 <e89dbc7b-b3ae-c334-b704-f5633725c29f@redhat.com>
 <CAD=FV=U8VGnRXv8MgofKzZF22_x0_X3M+AMfyPQ1u=yTXnFBQA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAD=FV=U8VGnRXv8MgofKzZF22_x0_X3M+AMfyPQ1u=yTXnFBQA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, jjsu@chromium.org,
 lschyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 00:25, Doug Anderson wrote:
> On Tue, Jan 25, 2022 at 2:55 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:

[snip]

>> Should this new sysfs entry be documented in Documentation/ABI/ ?
> 
> I'm not sure what the policy is here. I actually don't know that I'm
> too worried about this being an ABI. For the purposes of our tests
> then if something about this file changed (path changed or something
> like that) it wouldn't be a huge deal. Presumably the test itself
> would just "fail" in this case and that would clue us in that the ABI
> changed and we could adapt to whatever new way was needed to discover
> this.
> 
> That being said, if the policy is that everything in sysfs is supposed
> to be ABI then I can add documentation for this...
>

I also don't know the policy, hence the question. But in any case, I
think that it could even be done as a follow-up if is needed.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

