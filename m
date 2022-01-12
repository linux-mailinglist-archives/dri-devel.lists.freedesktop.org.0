Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D431C48C349
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 12:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD6710E1B9;
	Wed, 12 Jan 2022 11:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A327A10E1B9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641987485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RZ/OOdpAGgV62HtjD3bMC3/ezB1HxaLvh507CGIQyfE=;
 b=TAbxfQ34m3WVYWhMzXVM+6iXRiVc17q+xmVtrFoLlhAnOGLBvusMCYtuHEX9PZGxSKskiv
 dWhndhIYuaw3OdPPm4yuwsVcao3LZu8fRQh3Zp84V811hoxFmHRHepT9y5FupJHRlL2rIJ
 aUFyIN4S4WIEPpkfR5PD8yxd9TVkywc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-CdcBsgLIM4WDxVEaqtEoTw-1; Wed, 12 Jan 2022 06:38:04 -0500
X-MC-Unique: CdcBsgLIM4WDxVEaqtEoTw-1
Received: by mail-wr1-f72.google.com with SMTP id
 q2-20020adfab02000000b001a3ed59eb96so414073wrc.20
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 03:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RZ/OOdpAGgV62HtjD3bMC3/ezB1HxaLvh507CGIQyfE=;
 b=c1QATFW8j7tsSIl11G1HPmZseyt77Tkl+UfQj7NRWX56SL5CzpKWgRruApYFlf7AeP
 VpOuzILklADjWWcRPBcm7K7m4EsmMG1DvQhU0quE+/wOFHOkyMcIW7rtBX7RH2eJeNL6
 Y3d2DE0yQL94X1NhaHIG4L1EBmMTlSBukDNjLCI8tVSzTQGAgvE0qR4oTpt7p99cFYcH
 sgtSnrxY3lyhPLw5qDjus7+Bfj5oDPZgJtIYpvJnAmgjbCfbkMErP6i1gdiufn2jPqHi
 6Dtr0y2nGykv2SCH6KPCd9OljBHUIhM+BsYSV+sthdZKBCIDKPbQZKywstR2piozu/Tz
 MmrQ==
X-Gm-Message-State: AOAM531a1KNTejsA3iVJIKZAAVUckdHEtoKR42YgeYfHfzJKnWj4ZI7r
 TiPzZlhQMklUicsvwIVaK6G0iczS8Bk1b/4yBJvFwqt6GE8/tt2FDSJgcN5hrplM6sR60nceK6/
 1jlpzTRG56Ekaif3GAznF7wgbFO4k
X-Received: by 2002:a05:600c:3b19:: with SMTP id
 m25mr6332965wms.100.1641987482740; 
 Wed, 12 Jan 2022 03:38:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCMtCBYnaCQK1iXFn85zR/lqJOVMZxN9oUrlR9Ead1HQenjTkkrnQCGumLIh+enmiNou0HhQ==
X-Received: by 2002:a05:600c:3b19:: with SMTP id
 m25mr6332946wms.100.1641987482542; 
 Wed, 12 Jan 2022 03:38:02 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id d16sm8380854wrq.27.2022.01.12.03.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 03:38:02 -0800 (PST)
Message-ID: <2155e11e-beec-f896-0ab5-d48bb860f335@redhat.com>
Date: Wed, 12 Jan 2022 12:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 0/2] video: A couple of fixes for the vga16fb driver
To: "Kris Karas (Bug reporting)" <bugs-a21@moonlit-rail.com>
References: <20220110095625.278836-1-javierm@redhat.com>
 <65a13d92-93fc-25d2-0009-b7e60f3392c4@moonlit-rail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <65a13d92-93fc-25d2-0009-b7e60f3392c4@moonlit-rail.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Kris,

On 1/12/22 03:19, Kris Karas (Bug reporting) wrote:
> Hi Javier, Geert, et al,
> 
> Javier Martinez Canillas wrote:
>> Changes in v2:
>> - Make the change only for x86 (Geert Uytterhoeven)
>> - Only check the suppported video mode for x86 (Geert Uytterhoeven).
> 
> I just updated Bug 215001 to reflect that I have tested this new, V2 
> patch against 4 systems, one more than last time - 2 BIOS/VGAC and 2 
> UEFI - and it works perfectly on all four.
> 
> Thanks, Javier, for the excellent work!
> I didn't test with non-X86, but the code appears to bypass the patch on 
> non-X86, so should work fine for Geert.
> 
> Kris
> 
> Tested-By: Kris Karas <bugs-a21@moonlit-rail.com>
>

Thanks a lot for testing again!

I've applied patch #1 to drm-misc-next and #2 to drm-misc-fixes.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

