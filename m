Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A16A44A9B09
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 15:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D3110E8BA;
	Fri,  4 Feb 2022 14:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED7B10E8BA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643985213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YE+7dcKVrnsXlJFwi4qc611YF3e/nMZjJd0WuHXGT7w=;
 b=DQxhyBGsZrIDFqF5CisQw36xF7ZViW78rfpUJHMQ4Z/lePoteFg8E1BYyHrPI+s/BSCZYx
 Qr8zFmKYyfS2+TcDTBeGAMfp7yG+kd7cKKQIYTh9zmiNJfLk6AejdYMlSfiQhavCo1SMgy
 oJH/DKyl5zr2j8KKnv9VKk6kVc64ZEk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-03HwviyPMhqmEK_O3_EuaQ-1; Fri, 04 Feb 2022 09:33:32 -0500
X-MC-Unique: 03HwviyPMhqmEK_O3_EuaQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 203-20020a1c02d4000000b0037b9ff5678cso410052wmc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 06:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YE+7dcKVrnsXlJFwi4qc611YF3e/nMZjJd0WuHXGT7w=;
 b=nuvkMlzolDjbs/mzoRosT+BaRQtMaV3t1xtPPVaos3NLCiuLZIGZm46AjIdI1g+xIN
 UGlybtsXsXDlPN8pwGh23um1J6WkqVnTqgMy61Vb4YkmdR7vAaV3puHm6l6qwLmlMNQG
 kGA45yKxxgkiJZhTnxGeji2lIskXKWz6xirgYjidZVM6helOawGlm2qMPj9yzxg2vJRG
 Fw7wVyTQ0p9kJxorALX/zhSS4FsVQ8M9pccYOuECu07YFQ1m8tPG9R45HSKnXcD+JJOZ
 77qj5WY+BAt7/AS0M9OzcXZBn3YRJunx3peOa45Swe2bm2XS8xdKqrYd1YGgYg+e7/45
 gHBQ==
X-Gm-Message-State: AOAM533n4ElNCkXCRkLPsmzkld0x6w2Pq3Y7vpcU4Z2u2k0fTtZuTOGu
 +4/FlE8hOAPAagAbETAedXJBSKlIaHzIwP1zSYMN8FM6ratzW352/6v+sul9ltsgQpl+AHM7bX+
 0NI3LdvaqUOnX88O5qQBU6udOci5g
X-Received: by 2002:a1c:4c08:: with SMTP id z8mr2506710wmf.42.1643985211600;
 Fri, 04 Feb 2022 06:33:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8Sf3LjiYWLzwA9+5siU+yJFBE/sxFNsjVMYQtNMWsluGofgOGAh6oxxtKiSCC9coLkWjFOA==
X-Received: by 2002:a1c:4c08:: with SMTP id z8mr2506694wmf.42.1643985211382;
 Fri, 04 Feb 2022 06:33:31 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id a9sm1992289wmm.32.2022.02.04.06.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 06:33:31 -0800 (PST)
Message-ID: <f7a5d15f-3a02-5698-01f9-e79970180d99@redhat.com>
Date: Fri, 4 Feb 2022 15:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/4] MAINTAINERS: Add entry for Solomon SSD130X OLED
 displays DRM driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-4-javierm@redhat.com>
 <Yf0wzOP/kaubDAhP@smile.fi.intel.com>
 <5892749f-0bb0-68f5-c3d2-8ceedfc6b162@redhat.com>
 <Yf03+MsbqRp+uQff@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yf03+MsbqRp+uQff@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/4/22 15:28, Andy Shevchenko wrote:
> On Fri, Feb 04, 2022 at 03:12:17PM +0100, Javier Martinez Canillas wrote:
>> On 2/4/22 14:57, Andy Shevchenko wrote:
>>> On Fri, Feb 04, 2022 at 02:43:46PM +0100, Javier Martinez Canillas wrote:
> 
> ...
> 
>>> Stray change?
>>
>> Sigh, I'm not sure how added that change. Just ignore it, I'll fix it
>> on v3 or when applying if there isn't another revision of this series.
> 
> I believe v3 is warranted due to the other patch review.
> 

Agreed. Thanks a lot for your feedback and comments.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

