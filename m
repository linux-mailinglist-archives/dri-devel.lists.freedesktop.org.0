Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA96495DE0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 11:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A6110EA01;
	Fri, 21 Jan 2022 10:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1421B10EA01
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642761734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CdPdILngPzGrQBwtZZKW+7ixKah3Wpht/KCyewnhlCg=;
 b=DyGO5fJXBEBopxkz/x3CJZsbPKd4Ilon3ftou0x/COxHJeqN+ZDyT+0BkdzRrHLIOJAOiB
 K/DN/wrdkKHJ2d+GWNKBA97MJceV96aYGwpnsby7Xq53FlrF45zcf7ZBT/Wa5qU+adPI7v
 kvxCX0vW1cVVVVV+bqYivj28VM2bha8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-iyAV6sSbOFC7DAM2Qb1-mg-1; Fri, 21 Jan 2022 05:42:11 -0500
X-MC-Unique: iyAV6sSbOFC7DAM2Qb1-mg-1
Received: by mail-ed1-f69.google.com with SMTP id
 z9-20020a05640240c900b003fea688a17eso8740672edb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 02:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CdPdILngPzGrQBwtZZKW+7ixKah3Wpht/KCyewnhlCg=;
 b=guV19sh42zwRgd7ZcJOkkEN6ICQOVsXqzHvrXa57a49snAj9L7SwMAt3W+qk/rBzzi
 /EazvOrp3Y0GalI2JBi/4XfxqW7hYR1btgyn+usqxFJnkuCDdSMp5QhPLhb/eMV6T8JL
 gjWIbh4qKoldLJVGLF4UQs9w13DwTVex3o6/LueW9775uzJg+VSjDsXS7ue3jo5hidqP
 uDdVQoGKROAkW5Aqi60h3FtM/86iJKDeelzJX+5Vb63ccDcgkYD7O8tQwK3QN3E9spS3
 ElD6luRc4JOJcCjbyozTW0YM+vqUsD+qOsQxEWrYaVQ57TWzzm3o4ZxN7aCUv/vIZ+rS
 T0QA==
X-Gm-Message-State: AOAM533gj8NtYpqfBBpNxKPiH3Ylg+LGWQEwXEbW6I4bu8ayepU1fN9D
 Dh/sAmZ7MiH2U2I05Nr2UlXqeRr7hVmyJlNQ+bR52IHo3eVGY1ZWIGpuc2XWW6IEmZe6Ma8Xh6E
 9e19Ty7jX+gLGwEx/S1iEjlcFo+0i
X-Received: by 2002:a05:6402:31e9:: with SMTP id
 dy9mr3680090edb.65.1642761729926; 
 Fri, 21 Jan 2022 02:42:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwip9Cp2oVEYL+pg2NbsXqt2zQcoTWCMHysfXzR0VjzDHu2yy8g2b0X+EK52vUarXS+yjY5QQ==
X-Received: by 2002:a05:6402:31e9:: with SMTP id
 dy9mr3680084edb.65.1642761729806; 
 Fri, 21 Jan 2022 02:42:09 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id z10sm2504846edl.54.2022.01.21.02.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 02:42:09 -0800 (PST)
Message-ID: <faa591e3-19f3-1a8d-4e64-bc8cc94b82dc@redhat.com>
Date: Fri, 21 Jan 2022 11:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: linux-next: build warning after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20211015205422.53bec93d@canb.auug.org.au>
 <20220120141851.5503b65a@canb.auug.org.au>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220120141851.5503b65a@canb.auug.org.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stepen,

On 1/20/22 04:18, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 15 Oct 2021 20:54:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the drm-misc tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> Documentation/gpu/drm-kms-helpers:451: /home/sfr/next/next/drivers/gpu/drm/drm_privacy_screen.c:270: WARNING: Inline emphasis start-string without end-string.
>>
>> Introduced by commit
>>
>>   8a12b170558a ("drm/privacy-screen: Add notifier support (v2)")
> 
> I am still getting this warning.

Sorry I completely missed your original report on this between
all the other kernel related emails.

I'll prepare a fix for this coming Monday.

Regards,

Hans

