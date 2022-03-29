Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B64EB582
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 00:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F79D10E360;
	Tue, 29 Mar 2022 22:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A26E10EFA8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 22:02:40 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q5so25256119ljb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 15:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to;
 bh=GFh+hu29pLGd1yFJqG3TD5ib8w39W4JQGiYky9bmdEA=;
 b=Uul80CmlA5J9+LprVKWbEBNT+SmpX7fuHJuj2ZcNq5lQoGbXiK7l08X9mWZUnyQ9xj
 JGG6phzP2JIgAVM7Ck+/uPDofSFZS9DiEe+vTdfqlpktGqi5ac7BkNwpDuVFGoxB1j/L
 kiTUpYuWVv1NpO5CD/u3+wXPH+VkKXOxXU0EKfbfEIs9OIrNH5DeSfkqq0ywl+G16oUs
 EjjTffPfQWSLwPTUxIsp9apeOAkSzbzkNz+6u6mon973oumaMEcdCiHqApsz0Veblhsd
 qGyeBpLbqSDPrXgY78vgDjWeIZHmYGtPl54GxQn+x5B1VeLWM6M7Ui77iW8/TQ/Q1xEu
 yH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to;
 bh=GFh+hu29pLGd1yFJqG3TD5ib8w39W4JQGiYky9bmdEA=;
 b=4uvVcUariNiyF/2ioIUrXQSs3Gr2qr8YuE+x9g/jDRvYqJ+zIRADT/UIYWHV7Z67fz
 z69ypb1+DZGC+cQ0KjfaShDewHHU3sEdVlGBif+jLlxRrBJU8fHg3h4A6oi2Jtnhfonr
 FIHFgitH4WjP6tOwpXtjq8eXjOmUfV8vczujn16YPhdXtHJsHtCAXGWKu/FLidH6n97I
 9kBmLut6GunIdU4NoTrKgGzFMS/F/JoQWxrOioKeL/ukQOPCMQDdSpGSVzQHkt4Rg0JF
 3q1mLW1ytsPItjBnlBcIdQ5kGEA+vOjd5NksY/eini/HA1uPsg02lhBoqyCE1motPv4L
 Hm9g==
X-Gm-Message-State: AOAM530a6/XYUk/gyTauKs9Vct0gbV2I5B7omurv7w2Vejd2SP6xJbvY
 0XBRqgVwhMqhejh3PE3vvIM=
X-Google-Smtp-Source: ABdhPJwoHVOneGk1MKkV++hihnKGasRhaKJqXGRhP23iN10zifJJPhye88xL0pFF5DtY6cv59xPRXg==
X-Received: by 2002:a2e:b7c1:0:b0:249:7a91:bba1 with SMTP id
 p1-20020a2eb7c1000000b002497a91bba1mr4503477ljo.276.1648591358215; 
 Tue, 29 Mar 2022 15:02:38 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.225])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a196d02000000b004488dae6d45sm2114104lfc.52.2022.03.29.15.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 15:02:37 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------787Zf0iirh0AwihTJK1ygKXK"
Message-ID: <419a9bb8-cb68-8add-e7be-275a48b2126d@gmail.com>
Date: Wed, 30 Mar 2022 01:02:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [syzbot] general protection fault in dma_fence_array_first
Content-Language: en-US
To: syzbot <syzbot+5c943fe38e86d615cac2@syzkaller.appspotmail.com>,
 christian.koenig@amd.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, gustavo@padovan.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 syzkaller-bugs@googlegroups.com
References: <0000000000008eedfe05db620952@google.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <0000000000008eedfe05db620952@google.com>
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
--------------787Zf0iirh0AwihTJK1ygKXK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/30/22 00:23, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    8515d05bf6bc Add linux-next specific files for 20220328
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=1694e21b700000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=530c68bef4e2b8a8
> dashboard link: https://syzkaller.appspot.com/bug?extid=5c943fe38e86d615cac2
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1467313b700000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=121b7cb9700000
> 
> The issue was bisected to:
> 
> commit 519f490db07e1a539490612f376487f61e48e39c
> Author: Christian König <christian.koenig@amd.com>
> Date:   Fri Mar 11 09:32:26 2022 +0000
> 
>      dma-buf/sync-file: fix warning about fence containers
> 

There is ZERO_PTR dereference caused by passing 0 to krealloc_array(). 
Code should not try to reduce allocated memory area if index is equal to 0

#syz test:
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master




With regards,
Pavel Skripkin
--------------787Zf0iirh0AwihTJK1ygKXK
Content-Type: text/plain; charset=UTF-8; name="ph"
Content-Disposition: attachment; filename="ph"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9zeW5jX2ZpbGUuYyBiL2RyaXZlcnMvZG1h
LWJ1Zi9zeW5jX2ZpbGUuYwppbmRleCBiOGRlYTRlYzEyM2IuLjYwY2I0MjY2ZTc3ZiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL3N5bmNfZmlsZS5jCisrKyBiL2RyaXZlcnMvZG1h
LWJ1Zi9zeW5jX2ZpbGUuYwpAQCAtMjY0LDcgKzI2NCw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc3lu
Y19maWxlICpzeW5jX2ZpbGVfbWVyZ2UoY29uc3QgY2hhciAqbmFtZSwgc3RydWN0IHN5bmNf
ZmlsZSAqYSwKIAlpZiAoaW5kZXggPT0gMCkKIAkJYWRkX2ZlbmNlKGZlbmNlcywgJmluZGV4
LCBkbWFfZmVuY2VfZ2V0X3N0dWIoKSk7CiAKLQlpZiAobnVtX2ZlbmNlcyA+IGluZGV4KSB7
CisJaWYgKGluZGV4ICYmIG51bV9mZW5jZXMgPiBpbmRleCkgewogCQlzdHJ1Y3QgZG1hX2Zl
bmNlICoqdG1wOwogCiAJCS8qIEtlZXAgZ29pbmcgZXZlbiB3aGVuIHJlZHVjaW5nIHRoZSBz
aXplIGZhaWxlZCAqLwo=

--------------787Zf0iirh0AwihTJK1ygKXK--
