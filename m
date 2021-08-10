Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997863E5C97
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 16:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F173289728;
	Tue, 10 Aug 2021 14:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB06989728
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 14:11:01 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id c24so15069596lfi.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 07:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Q4ynKSZrlzxY6UgcjVFs5XU8y4Ot1KDO144fUqq/Tac=;
 b=WHkasInhxybnCNi2BzTg0K/0mK03T6Bj4uam9z5/GOep7FpH/K4xqY7oQZOyLMVVuz
 JrYl6NIFigl+r/dqpCFY512f1JAi49eIMEBjPDAmQQIhhyIsXWfaNFDHGKO2mHeM4ZS6
 SLMy9T9TcPlo6SosnTnaR3M7khZtSd0zyZEtKB4zGZKh8um1UxRFrbSQ50SEt/zWYoc5
 gyHexvD6k6FNmYvrCTl0T0eCth2wDBpc9sAqipC2vZEv6OgwL/H9+WvuCYhsUSTboV0U
 d4v0mo2CLSPO9csjdafZHEHLNyGERz8WgdrhTw1TMHf1LmYvA4qfUt+L1p+OKQuPNO3r
 Dt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q4ynKSZrlzxY6UgcjVFs5XU8y4Ot1KDO144fUqq/Tac=;
 b=m899q6XyN8FgjvITaKn8BDe0SjRkMWy+AwodXamLhL0FhgSBLAtk8XO0CaT3OycgKx
 wbxiAIu53IG+VJXxGMvhHidnCYVcVPHdi2tCMxbrCXLH3f1Pdif8hOM3p63yls5Ie2mf
 fEQSGOlRIYEUjptwBRANIXvzwvR8CXOn9RNcdli6NIsNT+fvpn8n7xEadATVvlsUxLbN
 CU5RdWZbj7lHey1bhz02t6WEX5T11MA25WO8MFxLr4ruSR0lgvHkxMvx8lMdJqn4nFmI
 XYY+nunSdvWUdyZDuRDX+ivFW2uwivBRO0MfrMP3CzwrJZixV1UeJ80x7mcwA5iw+EqS
 HTkA==
X-Gm-Message-State: AOAM532CCQu1jhrL2jYdeK4I/O5Yf0KAIu+RIvvkKwGmSfO0PXD4zmKc
 chHVehczH2Bow66tkpa+FSU=
X-Google-Smtp-Source: ABdhPJzqsS/2yGBkKpw4N+uQCqgP93F3TlP9ctQLZkS9vGFH7yjMmyd3O9i9iRV6/1t+B6QpdjlOmA==
X-Received: by 2002:a05:6512:6d3:: with SMTP id
 u19mr14671130lff.483.1628604658642; 
 Tue, 10 Aug 2021 07:10:58 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.232])
 by smtp.gmail.com with ESMTPSA id i3sm1470644lfr.217.2021.08.10.07.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 07:10:57 -0700 (PDT)
Subject: Re: [syzbot] general protection fault in udmabuf_create
To: syzbot <syzbot+e9cd3122a37c5d6c51e8@syzkaller.appspotmail.com>,
 christian.koenig@amd.com, dongwon.kim@intel.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 syzkaller-bugs@googlegroups.com, vivek.kasireddy@intel.com
References: <000000000000263db905c934be32@google.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <d7bd2585-ef80-d2ab-c474-acbe238c54a0@gmail.com>
Date: Tue, 10 Aug 2021 17:10:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <000000000000263db905c934be32@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/10/21 4:47 PM, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    7999516e20bd Add linux-next specific files for 20210806
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=10f15f8e300000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2f518e910b029c31
> dashboard link: https://syzkaller.appspot.com/bug?extid=e9cd3122a37c5d6c51e8
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1181099a300000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11b6fce9300000
> 
> The issue was bisected to:
> 
> commit 16c243e99d335e1ef3059871897119affc98b493
> Author: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Date:   Wed Jun 9 18:29:15 2021 +0000
> 
>      udmabuf: Add support for mapping hugepages (v4)
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12f73dc9300000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=11f73dc9300000
> console output: https://syzkaller.appspot.com/x/log.txt?x=16f73dc9300000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e9cd3122a37c5d6c51e8@syzkaller.appspotmail.com
> Fixes: 16c243e99d33 ("udmabuf: Add support for mapping hugepages (v4)")
> 
> general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
> CPU: 0 PID: 6603 Comm: syz-executor127 Not tainted 5.14.0-rc4-next-20210806-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:_compound_head include/linux/page-flags.h:187 [inline]
> RIP: 0010:get_page include/linux/mm.h:1203 [inline]
> RIP: 0010:udmabuf_create+0x664/0x16f0 drivers/dma-buf/udmabuf.c:236
> Code: 03 48 89 84 24 90 00 00 00 e9 38 01 00 00 e8 23 7a f7 fc 4d 89 f4 49 c1 e4 06 4c 03 24 24 49 8d 7c 24 08 48 89 f8 48 c1 e8 03 <42> 80 3c 38 00 0f 85 d3 0d 00 00 4d 8b 6c 24 08 31 ff 4c 89 eb 83
> RSP: 0018:ffffc90002d7fc70 EFLAGS: 00010202
> RAX: 0000000000000001 RBX: 0000000000000000 RCX: 0000000000000000
> RDX: ffff888023f69c80 RSI: ffffffff847e4f3d RDI: 0000000000000008
> RBP: 0000000000000000 R08: fffffffffffff000 R09: 0000000000000000
> R10: ffffffff847e50f5 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: dffffc0000000000
> FS:  0000000000935300(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000002000020c CR3: 0000000018d16000 CR4: 00000000001506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   udmabuf_ioctl_create drivers/dma-buf/udmabuf.c:305 [inline]

The problem is wrong error handling:

	hpage = find_get_page_flags(mapping, pgoff, FGP_ACCESSED);
	if (IS_ERR(hpage)) {
		ret = PTR_ERR(hpage);
		goto err;
	}

find_get_page_flags() return NULL on failure, so this patch should work:

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 8df761a10251..c57a609db75b 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -227,8 +227,8 @@ static long udmabuf_create(struct miscdevice *device,
  				if (!hpage) {
  					hpage = find_get_page_flags(mapping, pgoff,
  								    FGP_ACCESSED);
-					if (IS_ERR(hpage)) {
-						ret = PTR_ERR(hpage);
+					if (!hpage) {
+						ret = -EINVAL;
  						goto err;
  					}
  				}

I am not sure about ret value in case of failure, so I am looking for 
any reviews :)


>   udmabuf_ioctl+0x152/0x2c0 drivers/dma-buf/udmabuf.c:336
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   __do_sys_ioctl fs/ioctl.c:874 [inline]
>   __se_sys_ioctl fs/ioctl.c:860 [inline]
>   __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>   do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
>   entry_SYSCALL_64_after_hwframe+0x44/0xae


With regards,
Pavel Skripkin
