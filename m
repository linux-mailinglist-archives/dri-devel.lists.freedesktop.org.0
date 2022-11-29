Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5032163D130
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 09:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE35310E41D;
	Wed, 30 Nov 2022 08:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018F210E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 17:08:33 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id q71so13602137pgq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 09:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cfz3Mcgxkqb1OqUShW9AvM1bJWJ5IVPUimuhgnHTUfM=;
 b=aB+ZuGMOzbK18zkd0jlC4zEUTSM38tp9K/bCtuVmGeRWETnLRpEwg6Cfsis6G/o8YB
 2HqB7jorwoOw6h/LjLMxu5ed5EZE92927W/9yhpp/QruynXSUNxJp0OMoVkixJnRoaDz
 PSuOZAOkF9I4gSS32lclTss+2DBuTn/ncV2ntYH8YMzg9PF3tm8qf0hVKILYBg2UDCmD
 wbUFp/1Fi7NjOLDWJsNeD/wtnDvCVPYo4knWim39AeNTc1EFLvMkEGW6VYwyktGtW5Qx
 +UBWGG0y4yJft2CYMgbAUi9qHrNg41pvQg2NXxZ0NdMCIm2c1JLzlQ89YLhdvsbn7Bys
 PI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cfz3Mcgxkqb1OqUShW9AvM1bJWJ5IVPUimuhgnHTUfM=;
 b=qvKS4zpyDRdpD1hINuCkoq+0yxwajuGp1ib2emCMKpKNktR6JWVMLTWJ85X8+o7Ev+
 F2wNK6x2yclJILGjVWIm8CoDG1QMjqfrTf3U1nB+RrSq668ka4/SS5Zh4tpdgT2Phzo1
 dDxc6ksW+wmM3CkJ2Ap0ufHmEA1grJJ4qmhb+NpLxxNgk1WpLiyvG4wbuetVcC1qcg2B
 +uV5Y2Ix40F79R9enTW5K0JLx4003Odde+AzJsryHzZMoCXo6vu4ctEQMIRRnhiTd5Js
 W7Q8aNm0GFsKCiIAzdXs9en+hiMe1aMiPI11TjBYa3vRdzyTPExe0EJ3Axfr+E3UAllZ
 6kCg==
X-Gm-Message-State: ANoB5pnnO5mZdH9CDLJhqYA2aSUaMRFOfmAZMbapFdzsOP4DFyA+nyA1
 fIb1FrCRZ7g9kYQeCCFJfSM+5g==
X-Google-Smtp-Source: AA0mqf5swFLksPgiEDo6TRTvtGl0tdoW1L9fhbh0pRyA3vgdzDg/DHK7jSPhCQbx1VNNnHFBlq3wIw==
X-Received: by 2002:a63:ce58:0:b0:473:e2bb:7fc0 with SMTP id
 r24-20020a63ce58000000b00473e2bb7fc0mr33307253pgi.604.1669741713274; 
 Tue, 29 Nov 2022 09:08:33 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a63e157000000b00434272fe870sm8633883pgk.88.2022.11.29.09.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 09:08:32 -0800 (PST)
Message-ID: <9044e2b7-193f-ade4-b4a3-69e40b12088a@kernel.dk>
Date: Tue, 29 Nov 2022 10:08:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 0/5] Fix probe failed when modprobe modules
Content-Language: en-US
To: Li Zetao <lizetao1@huawei.com>
References: <20221128021005.232105-1-lizetao1@huawei.com>
 <20221129160615.3343036-1-lizetao1@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20221129160615.3343036-1-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Nov 2022 08:58:34 +0000
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
Cc: lucho@ionkov.net, david@redhat.com, jasowang@redhat.com,
 linux_oss@crudebyte.com, pmorel@linux.vnet.ibm.com,
 dri-devel@lists.freedesktop.org, gurchetansingh@chromium.org,
 edumazet@google.com, kraxel@redhat.com, kuba@kernel.org, pabeni@redhat.com,
 asmadeus@codewreck.org, st@redhat.com, ericvh@gmail.com, rusty@rustcorp.com.au,
 linux-block@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 stefanha@redhat.com, airlied@redhat.com, cornelia.huck@de.ibm.com,
 virtualization@lists.linux-foundation.org, pankaj.gupta.linux@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/29/22 9:06 AM, Li Zetao wrote:
> This patchset fixes similar issue, the root cause of the
> problem is that the virtqueues are not stopped on error
> handling path.

Not related to just this patchset, but guys, Huawei really *REALLY* need
to get the email situation sorted. I'm digging whole/half patchsets out
of spam every morning.

This has been brought up in the past. And no, the cloud variant of
the email also doesn't work properly.

Talk to your IT department, get this sorted once and for all. You risk
your patches being dumped on the floor because people don't see them,
or only see small parts of a patchset. And it's really annoying to have
to deal with as a recipient.

-- 
Jens Axboe


