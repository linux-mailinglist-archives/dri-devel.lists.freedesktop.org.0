Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADBC9D4FD8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 16:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B2210E98D;
	Thu, 21 Nov 2024 15:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C6OMM+av";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D99210E98D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 15:37:55 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5cfc035649bso1464183a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 07:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732203474; x=1732808274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wglTG1AjoEedTAO/LdRXi9+eQznoDs5r8oxQSUYVkgQ=;
 b=C6OMM+avFva5HK2p3uA+y6kZp7W5VPTrcwOoj3RcaxVZz7JGz0lSI6iFvnB7K8954b
 o1BX5+BOhk02D3QAhGzfScbwpuYhMzIIH4hB/tBeKyzmVXSM8bObznJt2u41N6Ap87/S
 jSPfIX32uhjIqrRHiais1DqwnctWHObVDL1Ai6W+ZOrWuEFDBtjrT6AJ40pa51rQQeYo
 I5q/DyTbtjVYlYGY0qRy8Z1iR3qSEUm3xhz7n7lqozFf+2yr5okr+vQCP7cLUwt1p3Fz
 rcMNtmkAN4qJFPK1U4kkWqHBWIV7FxOdVDY15hr/+yhgNRi4uSce2t2I2YNMKNYXQ60h
 LgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732203474; x=1732808274;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wglTG1AjoEedTAO/LdRXi9+eQznoDs5r8oxQSUYVkgQ=;
 b=nnR37NnC7OMADArbN0+24p4I6mfLyovBVrixSmjLsndl7DThh6PxlEl5jwVvk7l32w
 7jKFphslt3+fPMmxbafaKr1K8FyiqBZip86ocHZNxZxAQZSI3c5QUlrgQX+5l8oD/v1a
 fe80EIomd4+CVHxbgpf5f4cyCLgxlIIn2DbuIPhj9NcJ5trFcDbDGH2iqTPFiBtoQbxM
 w2xBOsFCdUWfwt1T3SRHw6lnwX73tXy9e5SbSaY483Pn67MZfkFvqfy4Zu4vG5FMAMeO
 hIksz7Y0HwxYnrA+PnIZ8pfAdB4+1PFn/ai8xMwPnyMLhhNxGbgqtrtxI/eXh7mUDefD
 zfKA==
X-Gm-Message-State: AOJu0YxN8M32eluRrS8YOsy7lLjIT6tnFc8xbjYTV9T4ynnPJB+qD3hX
 P5/LYjHaoNnL9qPspqAfchla0CmCVO8/zpw6+W0uYpT41y/GxnC1
X-Gm-Gg: ASbGncui+3CmrtwOYxKkfq3b7s/2DU0SjM7w7YYMCVbm1cA4WGhNTuKtRedO96H1mo7
 /PvjIf3auBPfoRCQTgzMKFcB5uQS9RnjJUprEUM7vSC0JlsLFvmh4MpUg528yFl4ra/EfwsQP/a
 Cc4He+z4be+yVDvkntMt/1kFZFIx6bXV3Xx9oFptYmF3TyyzeTQxv9XMgXsZLwVrfc/7TcWp+j9
 Qou9U+xeqoUHT5X7GE+CSEX0osriyAXrqQ/8d+EmNtM31jqnDk=
X-Google-Smtp-Source: AGHT+IE4Vo20qkJ/S7ZXsIHqruUkrGy/FNTj1vtn6NQozHSObPQ6nbdR7JDOHR5WQxM5Nu+ea/ZqlA==
X-Received: by 2002:a17:906:d54c:b0:a9a:c57f:964f with SMTP id
 a640c23a62f3a-aa4dd551548mr683639966b.16.1732203473699; 
 Thu, 21 Nov 2024 07:37:53 -0800 (PST)
Received: from [192.168.1.100] ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f4380231sm93034966b.198.2024.11.21.07.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 07:37:53 -0800 (PST)
Message-ID: <d95d3972-6280-398f-047f-23f19e1f9e5a@gmail.com>
Date: Thu, 21 Nov 2024 16:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [git pull] drm for 6.13-rc1
To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CAPM=9txbfH8vf-YjwTXEYL729a6r2eeLBxCJc3MSD-t5jXVA-w@mail.gmail.com>
Content-Language: en-US
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <CAPM=9txbfH8vf-YjwTXEYL729a6r2eeLBxCJc3MSD-t5jXVA-w@mail.gmail.com>
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



On 21. 11. 24 01:25, Dave Airlie wrote:

> This is the main drm pull request for 6.13.
> 
> I've done a test merge into your tree, there were two conflicts both
> of which seem easy enough to resolve for you.
> 
> There's a lot of rework, the panic helper support is being added to
> more drivers, v3d gets support for HW superpages, scheduler
> documentation, drm client and video aperture reworks, some new
> MAINTAINERS added, amdgpu has the usual lots of IP refactors, Intel
> has some Pantherlake enablement and xe is getting some SRIOV bits, but
> just lots of stuff everywhere.
> 
> Let me know if there are any issues,

The patch at [1] is needed to avoid build failure with the current mainline.

[1] https://lore.kernel.org/lkml/20241010153855.588ec772@canb.auug.org.au/

BR,
Uros.
