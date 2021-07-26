Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220FF3D693E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 00:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25F96F47B;
	Mon, 26 Jul 2021 22:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8786D6F47B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 22:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627337308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3ZVq1kpmoMZ3R/6gix/K4fUv0JkzpoNFXjfr05HkgM=;
 b=YwKpA0FitQOOwFAB7S2S5g0VQKOuFIEL+VXcsV/FivRL6knDzsa7FkUsF6C6CtpCeEajQS
 49NzhxJIJNjkOP/wk2WOF7+areHtBQLEp94/I/Zz0cS2O7EiZ2eWqKonLQTV3yUHM/1TsV
 mjm+0lIaQ79h4mMMzQHtlxvKUVJ8GTg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-sckt5fZDM3-dU5YZJoc2ew-1; Mon, 26 Jul 2021 18:08:26 -0400
X-MC-Unique: sckt5fZDM3-dU5YZJoc2ew-1
Received: by mail-wm1-f70.google.com with SMTP id
 o26-20020a05600c511ab0290252d0248251so533181wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H3ZVq1kpmoMZ3R/6gix/K4fUv0JkzpoNFXjfr05HkgM=;
 b=hkeyWzs9Es1Htt4j7l2yaSmNqLq7ZVBzZq/31kPvxtWSFNbqJWajdHEGWUKxQF3aki
 JzJChqHyF3NQmx+CO9vmLjHJPLipRVHmWvnBgzSBdm7XGUB4H69bXXrEG7Nl69YN3fHj
 qnBIYMHrTY0Qcc/fASMJqU2j0eIyMpJEjxKODDccpTbtxYnyJPSivjXaTUcNekFRolO1
 2Gmyq8bB23ItPzR+4IK80eYThRydS23+9SKzN/TKDXpA9xbkBnwu+uBfjZFB8JGrqdQF
 D6b+3uEljSWb0rp0RUH2HIe+ifXvpbGbQW7OcT1Em+p+SkKZH0edkOpqtxwdBHmHn9G3
 a3/A==
X-Gm-Message-State: AOAM530xfu8glBYinsb0xvUQL5CaGdSKJ2r3o8kKy9GBgJuvhpX6gzcd
 iqDNC/cmdAO3DdkdDQxUrmsMiNtPmpVNmB84MBKv7MmpoBADonSSTsOiLgS/j0ECVJEayKL4NtT
 sDvMRR3NTTEBYAnE4ngSR44XABPIb+fXDF56lPSuzOcBUXbnZvKPia0fmoD7JKsN6ZntTCVfSty
 mwenc=
X-Received: by 2002:adf:ffc3:: with SMTP id x3mr17166724wrs.136.1627337305505; 
 Mon, 26 Jul 2021 15:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydwMhSffjmA36r2VGfX2fUoukfKlUFms6xe1NLjI1QjnQZC5ZwTwkonhLdNP4kl5NOyls1/Q==
X-Received: by 2002:adf:ffc3:: with SMTP id x3mr17166697wrs.136.1627337305238; 
 Mon, 26 Jul 2021 15:08:25 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id a16sm1134741wrx.7.2021.07.26.15.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 15:08:24 -0700 (PDT)
Subject: Re: linux-next: build failure due to the drm tree
To: Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20210726213600.4054-1-broonie@kernel.org>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <d9bcb407-8ccd-aa42-46d7-c32cd0adcf89@redhat.com>
Date: Tue, 27 Jul 2021 00:08:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726213600.4054-1-broonie@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Mark,

On 7/26/21 11:36 PM, Mark Brown wrote:
> Hi all,
> 
> Today's -next fails to build an arm64 allnoconfig:
> 
> aarch64-none-linux-gnu-ld: drivers/firmware/sysfb.o: in function `sysfb_init':
> sysfb.c:(.init.text+0xc): undefined reference to `screen_info'
> aarch64-none-linux-gnu-ld: drivers/firmware/sysfb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
> sysfb.c:(.init.text+0xc): dangerous relocation: unsupported relocation
> aarch64-none-linux-gnu-ld: sysfb.c:(.init.text+0x10): undefined reference to `screen_info'
> make[1]: *** [/tmp/next/build/Makefile:1276: vmlinux] Error 1
> 
> Caused by
> 
>   d391c58271072d0b0f ("drivers/firmware: move x86 Generic System Framebuffers support")
> 

Yes, this was already reported by the kernel test robot and posted a fix
a few days ago: https://lore.kernel.org/patchwork/patch/1465623/

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

