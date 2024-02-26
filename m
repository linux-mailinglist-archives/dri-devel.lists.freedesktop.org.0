Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9D5867AAE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5310E787;
	Mon, 26 Feb 2024 15:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G2ZtgY2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCA310E787
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708962536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XB2TRwyOPZ4MpC469uTrD2LaYCw03ZG9lAb31+BwZj4=;
 b=G2ZtgY2QelDyM+mFy0imRObxokvOXKKlQj7uz19AxkFCHJcE6R3ybsYWfeqZv6gl1U2fqd
 pCiJoM/gFMh33GuGTu/HvvZjtqf0u5ec1BqH/MSzPcWei7Pq1i4hcyEtItCfihDac+TM0Y
 ALwmBjoqhkqlIgE0ABZXr653DJGHFmU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-NkuVuxNSMIu1ISEoU2Bgmg-1; Mon, 26 Feb 2024 10:48:55 -0500
X-MC-Unique: NkuVuxNSMIu1ISEoU2Bgmg-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-68f74a0a3c7so49388316d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708962535; x=1709567335;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XB2TRwyOPZ4MpC469uTrD2LaYCw03ZG9lAb31+BwZj4=;
 b=NYzyE2Iaf9kgfeUhruiorN+si6UfZltT3tXjLIZnR18wM97R4Od5W6xmoj9fqk/Dx/
 kvoecvROTwowh3aKAEioGRLS44wjRTlnl7UXGbm78q0M+afrkJvKHAyfCEi51MQnbyFX
 rPX47opLncNvAYZUfqXnbOA7aOo8S/bF4UUbeprGBCJnqVrvaBDcd+xbbbRL/AveBsb/
 tHSVJa6McAuzi1mmj+jlkfPU+K0Ll6xdiDT8C3NGTvnssEYf/DuQfWuBWUT32+ImOLea
 Mjf/X33e7PztgbN3n6I1HYRK/YcP8yPN3Sh0xUswcvWMNvKyxUO2TVc6jPJEkKEeScOa
 bd5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPm6His1XovNIFgRENUXEhkbftCdvHeWUWaV2TNPPVjsRHh40zCBbifAijMHIM31pT7cbAYoPIy3Cq5elbwri1572LCWn1bYK/pc5pn87l
X-Gm-Message-State: AOJu0YzZZ95yu+pL1B5BZvwwsnUo0l7xdxhoqMFy9pi3rIhwY3EAe6NF
 7wU/hK8PsvaK+JP7Ru7HWLw0Ai5CrVGrQzpXChiF3z6NMJhw+AH67rcInDT5osBs5KbqynU42bW
 vR4tHmZ0H+EZN4lLvf7ciJgIPLt4II0/YseBC+u7Gm6gcsKiCADwWqEJaPT9XJFcP
X-Received: by 2002:a0c:9c86:0:b0:68f:9cd7:521 with SMTP id
 i6-20020a0c9c86000000b0068f9cd70521mr7468095qvf.30.1708962535131; 
 Mon, 26 Feb 2024 07:48:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFE3cHrLgsWDANJopb3qHNrAVGtuCMtGFhdeIBXbdNmh8ncWAWnn1WLbEmKkR5oeDI6CxkLog==
X-Received: by 2002:a0c:9c86:0:b0:68f:9cd7:521 with SMTP id
 i6-20020a0c9c86000000b0068f9cd70521mr7468074qvf.30.1708962534878; 
 Mon, 26 Feb 2024 07:48:54 -0800 (PST)
Received: from [192.168.9.34] (net-2-34-30-118.cust.vodafonedsl.it.
 [2.34.30.118]) by smtp.gmail.com with ESMTPSA id
 a10-20020a0c8bca000000b0068fda83f293sm3097135qvc.121.2024.02.26.07.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 07:48:54 -0800 (PST)
Message-ID: <03915b45-94f6-4863-8b11-d0e9dbd0283a@redhat.com>
Date: Mon, 26 Feb 2024 16:48:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marco Pagani <marpagan@redhat.com>
Subject: Re: [PATCH] drm/test/shmem: set a DMA mask for the mock device
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240226110028.28009-1-marpagan@redhat.com>
 <d65v7jy4natx22lacw6awmg6iecfr2hqk3puuz3qem5dfsvj2x@hh6vp265hm5p>
In-Reply-To: <d65v7jy4natx22lacw6awmg6iecfr2hqk3puuz3qem5dfsvj2x@hh6vp265hm5p>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2024-02-26 12:26, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Feb 26, 2024 at 12:00:27PM +0100, Marco Pagani wrote:
>> Set a DMA mask for the mock device to avoid warnings generated in
>> dma_map_sgtable().
>>
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Marco Pagani <marpagan@redhat.com>
> 
> I've submitted last week this patch:
> https://lore.kernel.org/all/20240221125324.718192-1-mripard@kernel.org/
> 
> Which should be equivalent, but fixes the issue for all users in the
> tree.

Hi, thanks for letting me know. Fixing this issue for all DRM tests that were
using platform devices through the helpers makes perfect sense to me. I'm a
little more thoughtful about setting the mask for all KUnit tests that use fake
devices since there may be specific use cases. Just one curiosity: why setting
the default mask manually instead of using one of the dma_set_*() functions?

Thanks,
Marco

