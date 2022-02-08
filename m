Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A19A4AD868
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 13:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F3910E51A;
	Tue,  8 Feb 2022 12:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82C110E51A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 12:39:09 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id o17so24280552ljp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 04:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=HHy+eZQQMBsL1hI8tFLznDb4XcFfyuw3s8T6+48nfm8=;
 b=PZ0gNesx5cRn5kgwjQIk7wsoVsH9H1A/4CLxTNQyUFpZSzlVEB//gtDX+j4DbsKegH
 26KWKRuKCw9RiObMPM/DlPjn5mRI4zhtkNGu3Mc9kRHriMCVyVqpc+SFhlNvuPgjxBBd
 uJnr43pI8P0fypehT/G1vmnbXZHrV+9H1oacBB2HztS1IxZqXOgf7XhQ/oP/g04Ku/on
 ghHg0s9sN9Z9j2NMsVSa5PxjamA6UUUlM0qfjHtvrkvhXHPbcW1lz2+R1SzBnOUem5Lz
 4oM2RaY3QqYUs3eidJTF2Ed1sMs9ICF9QSZFk7PHosWkfhn/0z5Qb3GholKUZEHtFMD3
 ovtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HHy+eZQQMBsL1hI8tFLznDb4XcFfyuw3s8T6+48nfm8=;
 b=IGFBWw5EmG2iruNaVXO+WMSC83FJ20LfRf3QAWUGIsRolm+NX6TojknxiXLMkFMZMJ
 LnpuVg7erj5joOfk0nezOeXKyL1EWjYotUgAtznf9YCN3opDU01b6t45HDU3aENKDyE9
 SVkOyaNoNvO0EjFZmWrsPcw8moXVrDbE0FI/KnoQ6bPSsgzukrDdGIlOPTeuYCzfhjG7
 UF344jKcFTGUe+kTlrOGAZwipPlx3SP24Bc7AZaLGLav5hlrFpP/+xDcwG08AFID0l6p
 D/+ARYjj7rfaCoXc0LsIxyacCMjjlKVqkSRvRVWsvVhTouABKsBMrDPaXLyFO9zcbumx
 KpAw==
X-Gm-Message-State: AOAM530zvXNZoECRMFqIGypY7LPPRwnuCpp0LO/8B7BkaMu/kfkMjavD
 ysQicgu1eVs80ivx4pckG/8=
X-Google-Smtp-Source: ABdhPJz+pkAXcU1Voc6yQ9GOqOX+yzXIwELkhK4vUxSyWCDPSidyNSqQse9jaiASwRTaoc4jBwWNjw==
X-Received: by 2002:a2e:b98a:: with SMTP id p10mr2726398ljp.195.1644323947798; 
 Tue, 08 Feb 2022 04:39:07 -0800 (PST)
Received: from [192.168.1.11] ([94.103.224.201])
 by smtp.gmail.com with ESMTPSA id f15sm1906287lfg.230.2022.02.08.04.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 04:39:07 -0800 (PST)
Message-ID: <b92fb04b-e28b-4c55-8891-61e6c3fc022f@gmail.com>
Date: Tue, 8 Feb 2022 15:39:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [syzbot] WARNING in component_del
Content-Language: en-US
To: syzbot <syzbot+60df062e1c41940cae0f@syzkaller.appspotmail.com>,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rafael@kernel.org,
 syzkaller-bugs@googlegroups.com
References: <00000000000016f4ae05d5cec832@google.com>
 <0000000000001e4c2e05d77cfcbb@google.com>
 <YgJifE4GcWXS9p2H@phenom.ffwll.local>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YgJifE4GcWXS9p2H@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Daniel,

On 2/8/22 15:30, Daniel Vetter wrote:
> On Mon, Feb 07, 2022 at 11:51:29PM -0800, syzbot wrote:
>> syzbot has found a reproducer for the following issue on:
>> 
>> HEAD commit:    555f3d7be91a Merge tag '5.17-rc3-ksmbd-server-fixes' of gi..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=130a0c2c700000

(*)

>> kernel config:  https://syzkaller.appspot.com/x/.config?x=266de9da75c71a45
>> dashboard link: https://syzkaller.appspot.com/bug?extid=60df062e1c41940cae0f
>> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15880d84700000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14de0c77b00000
>> 
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+60df062e1c41940cae0f@syzkaller.appspotmail.com
> 
>  From a quick grep usb seems to have indeed gained some component code, and
> I'm not aware of any drm usb drivers using component. So I think this is
> an usb issue, not a drm one.
> 

It looks like missing error handling. syzbot injected allocation failure 
inside component_add(), but usb_hub_create_port_device() just prints 
warn message in case of component_add() failure (see log (*))

And then calling component_del() on non-added item causes WARN_ON()

Can't prove my thoughts, since there is no repro :(




With regards,
Pavel Skripkin
