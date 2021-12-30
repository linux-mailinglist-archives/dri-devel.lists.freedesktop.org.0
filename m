Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDFB481CA8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 14:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3147110E2D2;
	Thu, 30 Dec 2021 13:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0708C10E2D2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 13:53:25 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id h2so44056969lfv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 05:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to;
 bh=OTSybf/FehI6pYOln3P9eF9NWxZwb34ljQ3EhfbORfY=;
 b=dVlRNmU91czZpmVfSBFodQPJyUm7fPAk9/SKokWAHQBr/mqCFDsQ/8CPrIqIuY+yzs
 7EM082dH5CFiVciaNy2eab6C38Y3gmViomkTIC9i0N8OFtYir1oXkGgFZ/IbPKevSrH4
 RJO7gzqdZb70khUL3IwucXOj0gL9oh7FIJX6IyUzckvlg+lO8+pCNmlXDy+iRlgatyAx
 eNn8GsaFho2S6zdHS8xGcPEwU8GOCzIRhPkNUzZTQqv+YA2NjZGWKBgaCffDnGjfZuHF
 dJMpcAk4t3KSTukWvptRb7BTiuC3PX80VlU0nXKUCtXRWk/j1iXjOrvprGjPzUf1+cCr
 /5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to;
 bh=OTSybf/FehI6pYOln3P9eF9NWxZwb34ljQ3EhfbORfY=;
 b=OQSF6bYU7HT+HApnfG+4EL/i7MunOE9+IJI4FPL0kfgbfvHptV9z5qfb4s7nRmQJSR
 dGMLSRYBBJbIEPQnjHeyHDf8NNCx0Clvj36BQjj5zrAtTH5RNe98BxJozytQpZ3ql2bV
 DKFuva87D9YNqMhlp/lg8xnOc/Ac6xvER/xky4b/N5u8PiNextLCBgPHQri0o1kTpNqy
 24QymNQfc7XpVVI9Rm813dsa4ArUgbKdI+yiLbVrSD4oGSaaA28O5JUGjactGQulPDid
 hR7I/R37VYOABgk+Xk/cHcs6RU+Fkdm5Vr0QgQebuGvokeruscBGrfmhfTgbugU1UdP9
 xTtg==
X-Gm-Message-State: AOAM531LUYalWe9Yv+WIk+CAfyBk+jkgpe3mn/CEsMELNXCtehrULcVE
 gHbXdiXeQAFm13vdtWP7zuI=
X-Google-Smtp-Source: ABdhPJzhYhe9+iV9lTrCPZXRK8GG575ZUASfEQaxOXdr+TjG+93c5iKi1GDwVUnRQE2jwCHvlE4ydw==
X-Received: by 2002:a05:6512:2216:: with SMTP id
 h22mr26787332lfu.155.1640872404331; 
 Thu, 30 Dec 2021 05:53:24 -0800 (PST)
Received: from [192.168.1.11] ([94.103.235.97])
 by smtp.gmail.com with ESMTPSA id by6sm1346843ljb.78.2021.12.30.05.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 05:53:23 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------dCX0IlaUbMjKeidKwYkueUP0"
Message-ID: <83bf58b6-ace2-2db8-4f8b-322e78a3e198@gmail.com>
Date: Thu, 30 Dec 2021 16:53:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [syzbot] general protection fault in
 sg_alloc_append_table_from_pages
Content-Language: en-US
To: syzbot <syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, kraxel@redhat.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 syzkaller-bugs@googlegroups.com
References: <000000000000b0a1a605ce3ec5ad@google.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <000000000000b0a1a605ce3ec5ad@google.com>
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

This is a multi-part message in MIME format.
--------------dCX0IlaUbMjKeidKwYkueUP0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/21 19:51, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    717478d89fe2 Merge tag 'riscv-for-linus-5.15-rc5' of git:/..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=12489abf300000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=32e6048063923b7b
> dashboard link: https://syzkaller.appspot.com/bug?extid=2c56b725ec547fa9cb29
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=167b9e4f300000
> 
> The issue was bisected to:
> 
> commit 284562e1f34874e267d4f499362c3816f8f6bc3f
> Author: Gurchetan Singh <gurchetansingh@chromium.org>
> Date:   Tue Dec 3 01:36:27 2019 +0000
> 
>      udmabuf: implement begin_cpu_access/end_cpu_access hooks
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12d68447300000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=11d68447300000
> console output: https://syzkaller.appspot.com/x/log.txt?x=16d68447300000
> 

zero ubuf->pagecount will cause kmalloc_array() to return ZERO_PTR, that 
is unsafe to deref

#syz test
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master



With regards,
Pavel Skripkin
--------------dCX0IlaUbMjKeidKwYkueUP0
Content-Type: text/plain; charset=UTF-8; name="ph"
Content-Disposition: attachment; filename="ph"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2RtYS1i
dWYvdWRtYWJ1Zi5jCmluZGV4IGM1N2E2MDlkYjc1Yi4uZTczMzA2ODRkM2I4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi91
ZG1hYnVmLmMKQEAgLTE5MCw2ICsxOTAsMTAgQEAgc3RhdGljIGxvbmcgdWRtYWJ1Zl9jcmVh
dGUoc3RydWN0IG1pc2NkZXZpY2UgKmRldmljZSwKIAkJaWYgKHVidWYtPnBhZ2Vjb3VudCA+
IHBnbGltaXQpCiAJCQlnb3RvIGVycjsKIAl9CisKKwlpZiAoIXVidWYtPnBhZ2Vjb3VudCkK
KwkJZ290byBlcnI7CisKIAl1YnVmLT5wYWdlcyA9IGttYWxsb2NfYXJyYXkodWJ1Zi0+cGFn
ZWNvdW50LCBzaXplb2YoKnVidWYtPnBhZ2VzKSwKIAkJCQkgICAgR0ZQX0tFUk5FTCk7CiAJ
aWYgKCF1YnVmLT5wYWdlcykgewo=

--------------dCX0IlaUbMjKeidKwYkueUP0--
