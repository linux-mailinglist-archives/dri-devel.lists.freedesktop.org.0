Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB434C1DD2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 22:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD3510EF46;
	Wed, 23 Feb 2022 21:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CCB10EF46
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 21:35:37 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id c1so6596226pgk.11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 13:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ac/BcOmu5MdCFvS6JemgJvEoEjf0jHjFl+jOA9n59Gc=;
 b=N/wTJKNAsZAb2+DXd9uj0Oou2P7XETVHuE1paOj0Y2ML35z//aC0r2GJr2MClR45rT
 psUelX9t/gf+vG1bABjgortKasTe6wAnmupXsSu/4KcTbxxVICoUAubvvdtii7xUimVc
 8C4S8d4njpOej0HVoqsGPUQfZE8YrknKb7f1sAz4nm/Ktor/SJqUj0vEc/FU6E5Zvu0O
 4Kem6g2f7Et8fjdHNgEQZFvJg3YG/xxhXy6rZJjFlWPucfwsvmYFkHIhomLnV7grI4ZH
 LxAr7q5qUVwdPN8kuX5Vp4AiLcjrqqz5yogchFGVxCk2ht/xGRHMhvwX/lAU+L5K2YPn
 gYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Ac/BcOmu5MdCFvS6JemgJvEoEjf0jHjFl+jOA9n59Gc=;
 b=rVZidK+bdiUeVtbMfcuBkE+RPQZBtLC38oLarIgxeDn4gBIYyeBOLJcNhgU8TYwSH2
 YHFjicgkrkmtKOnSLxRBJZ8P5f0z67FB5MEtrvJKdMSUAzQbIc3Tp8veDJTXuW3QjHlL
 9G8XVvS6yQPsh5X5H9s+0y0d2A14/tX63m47ETyHRoN5+MRL7GaEFRy2NeYnkYa/brcp
 OEJOQzUAH9W3SJ/6oGQ7GtwJvmpKoZlsSA9osVTBdC9ouq4p51kWD9CsxGQZTTQhWaM0
 darkShlnby5d/S99WvBA2PFaI521CeHEqAnRQxJayDzA/SnlZKl1foucZx4esoB2CDAr
 pZ5g==
X-Gm-Message-State: AOAM533uc+qUr6RyesMr/VpfnCT7BYXywNE2VXR7H3yw7OfWLBRfzsXZ
 AqRTj37/3Czk28pOUWrR15o=
X-Google-Smtp-Source: ABdhPJymrFlposXdBgHft7TUiaq7uyEHdUjCbKVRK+0wR1l8SoJwKXsQ28HBNk21IZoHVJX0D6QP+g==
X-Received: by 2002:a63:af02:0:b0:375:57f0:8af1 with SMTP id
 w2-20020a63af02000000b0037557f08af1mr1247422pge.188.1645652137012; 
 Wed, 23 Feb 2022 13:35:37 -0800 (PST)
Received: from localhost
 (2603-800c-1a02-1bae-e24f-43ff-fee6-449f.res6.spectrum.com.
 [2603:800c:1a02:1bae:e24f:43ff:fee6:449f])
 by smtp.gmail.com with ESMTPSA id m13sm518443pfk.202.2022.02.23.13.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 13:35:36 -0800 (PST)
Date: Wed, 23 Feb 2022 11:35:35 -1000
From: Tejun Heo <tj@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] workqueue: Warn flush attempt using system-wide
 workqueues
Message-ID: <Yhaop3T53bHo7v2I@slm.duckdns.org>
References: <71d6f14e-46af-cc5a-bc70-af1cdc6de8d5@acm.org>
 <309c86b7-2a4c-1332-585f-7bcd59cfd762@I-love.SAKURA.ne.jp>
 <aa2bf24e-981a-a811-c5d8-a75f0b8f693a@acm.org>
 <2959649d-cfbc-bdf2-02ac-053b8e7af030@I-love.SAKURA.ne.jp>
 <YgnQGZWT/n3VAITX@slm.duckdns.org>
 <8ebd003c-f748-69b4-3a4f-fb80a3f39d36@I-love.SAKURA.ne.jp>
 <YgqSsuSN5C7StvKx@slm.duckdns.org>
 <2f887679-c783-bf18-a2aa-aa9a709bfb38@I-love.SAKURA.ne.jp>
 <CGME20220223212048eucas1p1fab5e35ff398eff57808a8f1125dd15f@eucas1p1.samsung.com>
 <4e5fe60d-abbb-6e73-b8cc-c3e1a314fbce@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e5fe60d-abbb-6e73-b8cc-c3e1a314fbce@samsung.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bart Van Assche <bvanassche@acm.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org,
 DRI mailing list <dri-devel@lists.freedesktop.org>, jgg@ziepe.ca,
 Haakon Bugge <haakon.bugge@oracle.com>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 23, 2022 at 10:20:47PM +0100, Marek Szyprowski wrote:
> Hi All,
> 
> On 17.02.2022 12:22, Tetsuo Handa wrote:
> > syzbot found a circular locking dependency which is caused by flushing
> > system_long_wq WQ [1]. Tejun Heo commented that it makes no sense at all
> > to call flush_workqueue() on the shared workqueues as the caller has no
> > idea what it's gonna end up waiting for.
> >
> > Although there is flush_scheduled_work() which flushes system_wq WQ with
> > "Think twice before calling this function! It's very easy to get into
> > trouble if you don't take great care." warning message, it will be too
> > difficult to guarantee that all users safely flush system-wide WQs.
> >
> > Therefore, let's change the direction to that developers had better use
> > their own WQs if flushing is inevitable. To give developers time to update
> > their modules, for now just emit a warning message when flush_workqueue()
> > or flush_work() is called on system-wide WQs. We will eventually convert
> > this warning message into WARN_ON() and kill flush_scheduled_work().
> >
> > Link: https://syzkaller.appspot.com/bug?extid=831661966588c802aae9 [1]
> > Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> 
> This patch landed in linux next-20220222 as commit 4a6a0ce060e4 
> ("workqueue: Warn flush attempt using system-wide workqueues"). As it 
> might be expected it exposed some calls to flush work. However it also 
> causes boot failure of the Raspberry Pi 3 and 4 boards (kernel compiled 
> from arm64/defconfig). In the log I see one call from the 
> deferred_probe_initcall(), but it isn't critical for the boot process. 
> The deadlock occurs when DRM registers emulated framebuffer on RPi4. 
> RPi3 boots a bit further, to the shell prompt, but then the console is 
> freezed. Reverting this patch on top of linux-next 'fixes' the boot.

Tetsuo, can you please revert the patch? The patch is incorrect in that it's
triggering also on work item flushes, not just workqueue flushes.

Thanks.

-- 
tejun
