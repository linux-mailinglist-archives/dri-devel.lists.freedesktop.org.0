Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E88243B0CE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C5289DA5;
	Tue, 26 Oct 2021 11:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2424D89DA5;
 Tue, 26 Oct 2021 11:11:19 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id m17so1037321edc.12;
 Tue, 26 Oct 2021 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=JPOvYqRsTd6hH+QudT30SRERffzgPerYni6Jdff9oRU=;
 b=MWSxILcHi2y+6fCPgt5ungr9Kgd8mQtZH3DVi1gPSs2GGt/5a/g4OZ+WRUv5aWz8Cc
 Zf0zL7ylwD/1ddccWzexa97Q8hff5El6jOlQcLzdkfP53PDHppa/DeRupP2zMlpYpPD/
 EBFMhWrffR5RUvzN3TpUhgLna1Ws+HzYsbURc9QzaY1UbL/wmbt+CePGPve83v7JStwY
 IK09DxlfIPS/uIwAzJePpJK73AZiWL0cIaaBjbJKi2r0d8sgEMJ2/7LPn5cm/k9CAhr0
 vEJNU4q3nTxo96NDazq80jvjstbK0m9u3PbwwFZ1ID6u/AaUrTa+BzUT7zG9oyWPjevd
 cBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JPOvYqRsTd6hH+QudT30SRERffzgPerYni6Jdff9oRU=;
 b=fIVmTbWHhHmp+RRkjQRYNz0SlCwCnZB5uZ6LGMWoWriQwP2zIXvpbPlyTEVSWuRhK+
 ARVUKAqubQbmhTh0XJyBRM6w3AB19ku5fUQWJaJNirO7gM7zH+uboCO3Ythnu5Im1U3W
 q81lYpuykX8zqP8dAbX0gPdLEMsY7fX6wO/Ap2dK2YVOlLCKzXl4SpR/YQs2tVxMNvpQ
 3ZFQnoKOYKkmDgF1soZOYAj0yDZSDS3H2pWtqKM8yY0KdYldphCQWLm1RVmSZc0GwFtE
 hZaSj3MqLgy/C6nvHn01zJ4gCLo+RDWWEjA+NKpBRHDcp+i0tJsUCi9WbrcoKSDNaNgL
 byhw==
X-Gm-Message-State: AOAM531FWYxXxztZ6nJZTINmxfdBS7aKLV8wrM/GOqgubjXhoaiKEyeB
 U/753Dgzoba763S1IBSbwkrbj4f8FJw=
X-Google-Smtp-Source: ABdhPJzvhdVVkkri+2wAVfM5CfHxPowr1bH3W/oSdIE+IHZ68DSZpTC/Abi469voKNUHd6mE2EKoNQ==
X-Received: by 2002:a05:6402:288a:: with SMTP id
 eg10mr15553706edb.190.1635246676605; 
 Tue, 26 Oct 2021 04:11:16 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4969:85a5:71fe:e4fa?
 ([2a02:908:1252:fb60:4969:85a5:71fe:e4fa])
 by smtp.gmail.com with ESMTPSA id sd2sm4996116ejc.69.2021.10.26.04.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 04:11:16 -0700 (PDT)
Subject: Re: Two minor etnaviv DMA-buf cleanups
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: linux+etnaviv@armlinux.org.uk, l.stach@pengutronix.de,
 Daniel Vetter <daniel@ffwll.ch>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211025080532.177424-1-christian.koenig@amd.com>
Message-ID: <ad81868b-5b6f-65b2-70b8-26ac5d95716b@gmail.com>
Date: Tue, 26 Oct 2021 13:11:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025080532.177424-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Just a gentle ping on those two.

The changes are straight forward and I just need an ack.

Adding Daniel, maybe he has a minute :)

Cheers,
Christian.

Am 25.10.21 um 10:05 schrieb Christian König:
> Hi guys,
>
> just two minor cleanups related to the new DMA-buf iterators. Can I get an rb or ack-by for that?
>
> Thanks,
> Christian.
>
>

