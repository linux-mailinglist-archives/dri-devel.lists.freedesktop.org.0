Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F1737C88
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD6210E0BB;
	Wed, 21 Jun 2023 07:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569C110E0BB;
 Wed, 21 Jun 2023 07:55:53 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1acfce1fc0bso1076761fac.2; 
 Wed, 21 Jun 2023 00:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687334152; x=1689926152;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=chdbH7mNzgkmuCyhA12j8pNPXGXQu3niNcq2qlGIJcs=;
 b=LbxvhVwpNqssBmWSmVTSBoOqM3MlXb7DhtqbUE7LEO6cnbME5IpO64HbS9T7taeDtX
 ailK4VhS9N0EesSXQmFC2QE4SQ5fNtqKFY+87AtZ9U8ZOskme0FDpgkPTSs5lr+hUyTe
 /Qgvw0ssaER5tRu6uE15GBqc/dQxMJ55TBZdwRPyB3zbeMf7Q6bRTMeZwu/GgnYrbhr7
 3sLqgkfyMTQCMhfCqGuLSseBFInIkpKzb76bqT5LDq7xMCwTcqeAGPmEB0OZZt+xemG0
 Hrlyp5maNwnixWVnA2DEu7A7EBtV9+EE+D94ZZ0WxqnqI5Tfbf1qH/2/HAGL8ZztSsCu
 HyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687334152; x=1689926152;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=chdbH7mNzgkmuCyhA12j8pNPXGXQu3niNcq2qlGIJcs=;
 b=fO7IuGOO63BIIeQ4W6g9o15r7KAjN8fQMMXZ6SPInogOQFgMb0T+MoDGAFce6s1tD9
 AYi3yFtXfteR/vyVu9cyaVRRfkmXMQybgfYN3DUQk8TEHPmG1SGLRmIUUFMbAJBVIKi+
 vbuKCNqsGEwdUCpZDoE9aUKMojspxc3Gs6Bm7tqGPdZSJl4FsY+pmWYIdLfMdOXMsOca
 Xq5H+qs565DMMjRXn5ybxwAw3f8PVoRKAUDOzC9YeJ3VhZ5co9SFp+wfnheNWC0AF+fw
 mU1YnIbxtXvEIfyodBizNzBAXh4JlEVGLdZIbCfJzAZcGw48YC6zoZMWOyKbYrDsn5Qo
 1gDw==
X-Gm-Message-State: AC+VfDz0CnFrbQ9Acg2nhmT9JahoJ0UBL8QN7lWgAdnVM58mnUx3BO2B
 IQ+fRcrYI4P78XlxFahDYxe01T2YI5PCEA/C/6ysfqkCI/h7dQ==
X-Google-Smtp-Source: ACHHUZ6hf43JL8/RjRnBEVRErt7bEY91oQCXLhTfpmTCVuL+A1sbzEX1l/BiasLu5n6sDvOOkVw+A4kp6AMZvTIKafo=
X-Received: by 2002:a05:6870:343:b0:1aa:1c3f:4e7 with SMTP id
 n3-20020a056870034300b001aa1c3f04e7mr4918564oaf.57.1687334151934; Wed, 21 Jun
 2023 00:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230620094716.2231414-1-18949883232@163.com>
In-Reply-To: <20230620094716.2231414-1-18949883232@163.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 21 Jun 2023 09:55:40 +0200
Message-ID: <CAH9NwWdfK0DkDA-Fi6TRrS4orm-HbAqBLDpYcMKd69dU6Jh+CA@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] drm/etnaviv: Add pci device driver support
To: Sui Jingfeng <18949883232@163.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

>
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> There is a Vivante GC1000 (v5037) in LS2K1000 and LS7A1000, this GPU is a
> PCI device, and it has 2D and 3D cores in the same core. This series is
> trying to add PCI device driver support to drm/etnaviv.
>

Is it possible to get the lspci output for the GPU? Something like
this: sudo lspci -vvv -s ...


thanks
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
