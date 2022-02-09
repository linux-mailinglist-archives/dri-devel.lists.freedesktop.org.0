Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCCE4AF347
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 14:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFFE10E4E5;
	Wed,  9 Feb 2022 13:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA1110E4B2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 13:51:48 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f23so4312066lfe.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 05:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ItxbsqqZ51w/D/epSixZzIFV7AmBu7xGRDA55lqryGU=;
 b=XufQ0Oin2rtofkdcAkEcrbMtYdci1rpn0c6i8OorFCd+RiTJ+v1T5TtEECa2OqUkdb
 KUQAl5b5its8PMU/FCG05T6cGB2ge+vpBD8Vn0KEOn/7rBnctwrNG1wrnTN+uylOtVH1
 Ijk6UoxIEMI/tu9mHykERGAp92ASMofxZLbwSkmDf/jBRO3Uz+YSqSJ+i07VKKrZn1ba
 kHf/obdyQB7VYLkG01zet8yB1sRsH3k8q4pqafCoaTM/F1WSEfx3A/dNBSaKbwxU0bKF
 CrXa0tiUILTyVcANms6tDrU8lFGHNTTulC3LA28VQNAoXwx/kHp41wKXAKmPly1HG1Zu
 1VWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ItxbsqqZ51w/D/epSixZzIFV7AmBu7xGRDA55lqryGU=;
 b=SRpY0VzIqPyM3G+uOPVxgsJOHhC251FgRzimmoq3S14JEMZFPlSu6loX2UNX+ZDETE
 aFIrZOTp8vURbh08JiYRsmT2QcfRKrvLE+9QWDElKx/507B5xV/wh9C8cRh5q8pJk6Kl
 Kb0vcQmee4UI0qzE1U7fZI2GuzTDO7M/Tn1vie+EpnrXJtgX+VN+zmEeXqJGsV1uoLLT
 IYN/MupUEfup3/VHsbogRh6VTZ6udfwo4CSHwW58i8yrrH/sjL7SAK/GiqlqVlgjBIip
 wtKvKBL9E/u+OaW8pNvFFE3+SKLbOOVTDkN0r+Sa9eMw7RrIUS/qv+jbjldV/FzR1HTZ
 M2sw==
X-Gm-Message-State: AOAM533R49wT9uxe/erxCNIoWr1e1w7P9Nkpc4Yg7gFF1pR9JvIzMZOx
 dE13hQcfOldxWU4t7HsEQiM=
X-Google-Smtp-Source: ABdhPJxfDS3cnZ1ErsJpiGck1s0ltan6NqDwzuzAR2r7sb2rQ1sHLKwX/BMgIz6CH/aMTumdETtSJA==
X-Received: by 2002:a05:6512:3d0e:: with SMTP id
 d14mr1579636lfv.165.1644414706446; 
 Wed, 09 Feb 2022 05:51:46 -0800 (PST)
Received: from [192.168.1.11] ([94.103.224.201])
 by smtp.gmail.com with ESMTPSA id f26sm2367362lfm.251.2022.02.09.05.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 05:51:46 -0800 (PST)
Message-ID: <250ce1c2-95bf-3067-7bd6-5655038c5e69@gmail.com>
Date: Wed, 9 Feb 2022 16:51:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [syzbot] WARNING in component_del
Content-Language: en-US
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 syzbot <syzbot+60df062e1c41940cae0f@syzkaller.appspotmail.com>
References: <00000000000016f4ae05d5cec832@google.com>
 <000000000000a17f2305d77f4cb7@google.com>
 <YgPEtCGDlSrqa1fK@kuha.fi.intel.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YgPEtCGDlSrqa1fK@kuha.fi.intel.com>
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
Cc: rafael@kernel.org, gregkh@linuxfoundation.org, rafael.j.wysocki@intel.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, andriy.shevchenko@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heikki,

On 2/9/22 16:42, Heikki Krogerus wrote:
> On Tue, Feb 08, 2022 at 02:37:10AM -0800, syzbot wrote:
>> syzbot has bisected this issue to:
>> 
>> commit 8c67d06f3fd9639c44d8147483fb1c132d71388f
>> Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Date:   Thu Dec 23 08:23:49 2021 +0000
>> 
>>     usb: Link the ports to the connectors they are attached to
>> 
>> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14063168700000
>> start commit:   555f3d7be91a Merge tag '5.17-rc3-ksmbd-server-fixes' of gi..
>> git tree:       upstream
>> final oops:     https://syzkaller.appspot.com/x/report.txt?x=16063168700000
>> console output: https://syzkaller.appspot.com/x/log.txt?x=12063168700000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=266de9da75c71a45
>> dashboard link: https://syzkaller.appspot.com/bug?extid=60df062e1c41940cae0f
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15880d84700000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14de0c77b00000
>> 
>> Reported-by: syzbot+60df062e1c41940cae0f@syzkaller.appspotmail.com
>> Fixes: 8c67d06f3fd9 ("usb: Link the ports to the connectors they are attached to")
>> 
>> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> I'm guessing the component_add() is failing in this case. So I guess
> we need to consider the component_add() failures fatal in
> drivers/usb/core/port.c, which is a bit of a bummer. I'll send the
> fix.
> 

Seems something similar to your approach is already posted

https://lore.kernel.org/linux-usb/20220208170048.24718-1-fmdefrancesco@gmail.com/




With regards,
Pavel Skripkin
