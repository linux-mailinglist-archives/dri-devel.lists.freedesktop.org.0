Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE0148932D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A591212A810;
	Mon, 10 Jan 2022 08:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8442E12A80E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 08:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641802982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTtqqgqEgqdAKcrQmMy+dzzfB9vCY2HKmjeboto5lik=;
 b=ZUEK6EkDxzXUXxvZvIOHQJrQHdp929qZtdWmzPKwrlsbV9kaOdM4gvkOCp5ayWbrNlzoAF
 Pp67uESxSOXaVfR+ik20PiwatTaovEqViBYbhKpCClYP/VmevjsZ1Sft9iIpdSX36nn4UD
 8RkYB/aQSSjpFb5P6u7GmHYm/T0qPro=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-ofsUD6irOr-T3zj-e0CWSA-1; Mon, 10 Jan 2022 03:22:56 -0500
X-MC-Unique: ofsUD6irOr-T3zj-e0CWSA-1
Received: by mail-wr1-f70.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso3864466wra.18
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 00:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RTtqqgqEgqdAKcrQmMy+dzzfB9vCY2HKmjeboto5lik=;
 b=dh1eYy0IOR8p8Hl/Tu6Wren0M1vKQTSq2fNEv6Kanr99EwYTKn+KGccr6a+gVDw1I7
 iXrZcyEdwJ0urWQMPXw2YAr0m4ZrSBdWKDCE/kV8Bdxdj74V4kVkFMTk6F9gs//JkDPU
 0MtTwk/uJxbH/f5dD612FwejCrWbQH8mecDPx7SEAHPrtR/jZNdteiQQDUmsbYfrSqeZ
 GHfSqR2luXu98iGgzHyq+NCxwsg86EuPBqp/DVIhT9dYjbOIA8E6VMq8f8iMM7VBRrs9
 VkmvUqMJlpL/1yPnw4wgdqQbMNE+Hl3CMyiZg564SwB9Kg2R9vddAkkubGq02gaIJ88W
 qc5Q==
X-Gm-Message-State: AOAM533Ib3jXoQNggHKl0QG9xLCs34VsWibozm4MjQUTyUj0h4B1FtGa
 EqrXR+vl18hbTYKNuekTfYXJOpBu4hTrgbJlQn2Ghb32OTilitEwNFZn/QW83tVOZ07ks20r4G3
 iJmJMs/OQFXl9BUtIyc6fx4K9qpTE
X-Received: by 2002:a05:600c:35cf:: with SMTP id
 r15mr21069726wmq.106.1641802974982; 
 Mon, 10 Jan 2022 00:22:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqTRVHAzlE8gl4JuRggen+xQ8xv3xUsJdUs/ktUbxaGW2FHQEZBuwxWQJjglAEdtxgjuQAJw==
X-Received: by 2002:a05:600c:35cf:: with SMTP id
 r15mr21069711wmq.106.1641802974751; 
 Mon, 10 Jan 2022 00:22:54 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p12sm1925227wms.43.2022.01.10.00.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:22:54 -0800 (PST)
Message-ID: <3355ac8b-fd59-068c-e40e-bf8c54e5abde@redhat.com>
Date: Mon, 10 Jan 2022 09:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] video: vga16fb: Fix logic that checks for the display
 standard
To: "Kris Karas (Bug reporting)" <bugs-a21@moonlit-rail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220107110723.323276-1-javierm@redhat.com>
 <20220107110723.323276-2-javierm@redhat.com>
 <CAMuHMdXG3xOUrzOoRQVgpb4MmuQKJ1y3yPXv=p4AiNEohrzZug@mail.gmail.com>
 <4fac9803-50d2-0c83-8b49-a1b2058d7da0@moonlit-rail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <4fac9803-50d2-0c83-8b49-a1b2058d7da0@moonlit-rail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert and Kara,

On 1/9/22 21:20, Kris Karas (Bug reporting) wrote:
> Groetje, Geert,
> 
> Geert Uytterhoeven wrote:
>>
>>> -       par->isVGA = screen_info.orig_video_isVGA;
>>> +       par->isVGA = screen_info.orig_video_isVGA == VIDEO_TYPE_VGAC;
>> All non-x86 architectures (except for 2 MIPS platforms) treat
>> orig_video_isVGA as a boolean flag, and just assign 1 to it.
>> Hence this change would break them.
> 
> I see a bit of a conflict with using orig_video_isVGA as a boolean. All 
> the modern architecture-agnostic driver code, such as sysfb, 
> sysfb_simplefb, and efifb, all use and expect orig_video_isVGA to be an 
> integer.  On the other hand, the VGA driver for XEN first sets 
> orig_video_isVGA  = 1 (boolean), and then VIDEO_TYPE_VLFB or 
> VIDEO_TYPE_EFI (integer).  Overloading the definition for 
> orig_video_isVGA to be both boolean and integer - within the same file - 
> seems like a recipe for bugs to me.
>

Agreed with Kara on this. I believe the non-x86 arches should be fixed
to set it to the correct value.
 
> That said, I think that wrapping the par->isVGA code, above, within a 
> check for CONFIG_X86 seems safe and expedient.  But I would be much 
> happier if the non-x86 architectures would set it to a proper integer 
> value (even if fake) that coincidentally satisfies boolean "true", say 
> VIDEO_TYPE_VGAC; that way, there would be no confusion as to data type 
> in all the more recent architecture-agnostic framebuffer code.
> 

Yes, I'll post a v2 to do that but hopefully the CONFIG_X86 guard could
be dropped in the future once all the architectures are fixed.

> Kris
> 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

