Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C3A7E48D3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 19:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A190E10E63C;
	Tue,  7 Nov 2023 18:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B4910E659;
 Tue,  7 Nov 2023 18:54:43 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-991c786369cso913789066b.1; 
 Tue, 07 Nov 2023 10:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699383282; x=1699988082; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B2hvz0OzI5g7bYGlIcmckfX24uIYxMQQKtI3lgxHhmw=;
 b=hynOTXxPHxbnkWX1BQi/+aHfHQVRX4IpqsCuaDSoDq7HIbR+MkNU4UK6DSUBRALyyj
 wWdmKkrR1gzmC11nBKL6IsEJS7xj+fNP9+mlBWlS2fG6xqiM1KXJtRWaiDz/MH/dcani
 AwJT3doe5zQow9dWiISSnfzgOxGWFQbaIQpwEqppROwZ+JLhzQj/UNM0B66qWDbpHC2z
 hSmIqzU1gb+vaRdQBO+wDAYGVungegyvHrCLVo7HPMTibc6otHCcqxMVRoS6ks9wimaD
 wMZH7p2pRfxkeuca28XUYrmW5mwvgIm2I/0UJZYMVnjl2K/Yaue6lDFkkKuw8fJHBJ0c
 oMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699383282; x=1699988082;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B2hvz0OzI5g7bYGlIcmckfX24uIYxMQQKtI3lgxHhmw=;
 b=pyu+uMax9tv5CdtMzRZINWrDa5gSfzBJS0hKRiy5tw8fy7ChbptdopvtinLj3YOTsV
 EgINfUySIib+l9i269jeEHzwyoAts+12j6RdvAIHNsO9SLQmCpJhd0H9lGch8CEmQDk1
 Um0SB5BTmlhImNI27kq3PlhEyeBZEVOKsbgyQFIyTBM8W3GXIkkxf7xOmef6mK7HyLkn
 Ur1I9PPZNALu0eJ8HQvBGPHNdMiFIDaYyR/zlEgLy6nJsidyalZMo1PQhnUY8PjQvSBV
 HVlSwP8AoJNMQZsS1CaA01qsFGkn+35CISYsigcmGsuR6u+Q8tonXgsA5JAdbR8zWsmd
 B5ng==
X-Gm-Message-State: AOJu0Yy3nyr2qt8aQ5xtQZcJkos+JHYFXHK5eoo31LWvb9K4ZNn+ulGy
 /UnIDsPsBEk5h2yr5SgVGHnP5zo6jmXle9oL6w/K9qLi
X-Google-Smtp-Source: AGHT+IEF4+87zNKhRij8dkcbr1vcGbTCGZbpDbxrvh5hQS/PSRbxwz/Qz9sd+PBu5xNIpqeRrrxyOrrpb18hqynK66c=
X-Received: by 2002:a17:907:1c22:b0:9e2:9809:203d with SMTP id
 nc34-20020a1709071c2200b009e29809203dmr1897565ejc.5.1699383281574; Tue, 07
 Nov 2023 10:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20231031051943.1957328-1-airlied@gmail.com>
 <20231031051943.1957328-4-airlied@gmail.com>
 <5b0b5a7fefa8aac31659e7ade0811f835c576511.camel@nvidia.com>
In-Reply-To: <5b0b5a7fefa8aac31659e7ade0811f835c576511.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 8 Nov 2023 04:54:29 +1000
Message-ID: <CAPM=9tyvAPf2iNZ6utEN9FuE_wo17u4D9uCMXJSd0+w3VPHcLw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 3/3] nouveau/gsp: add some basic registry
 entries.
To: Timur Tabi <ttabi@nvidia.com>
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Nov 2023 at 04:51, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Tue, 2023-10-31 at 15:18 +1000, Dave Airlie wrote:
>
> +       strings = (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
>
>
> I get a UBSAN index-out-of-bounds error on boot at this line.
>
> [ 17.765746] nouveau 0000:65:00.0: gsp: cmdq: wptr 1
> [ 17.765748] ================================================================================
> [ 17.774170] UBSAN: array-index-out-of-bounds in drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1065:33
> [ 17.783449] index 2 is out of range for type 'PACKED_REGISTRY_ENTRY [*]'
> [ 17.790132] CPU: 0 PID: 234 Comm: kworker/0:4 Not tainted 6.6.0-rc5+ #1
> [ 17.790135] Hardware name: ASUS X299-A/PRIME X299-A, BIOS 2002 09/25/2019
> [ 17.790136] Workqueue: events work_for_cpu_fn
> [ 17.790143] Call Trace:
> [ 17.790145] <TASK>
> [ 17.790148] dump_stack_lvl+0x48/0x70
> [ 17.790155] dump_stack+0x10/0x20
> [ 17.790156] __ubsan_handle_out_of_bounds+0xc6/0x110
> [ 17.790160] r535_gsp_oneinit+0xf81/0x1530 [nouveau]
> [ 17.790292] ? __dev_printk+0x39/0xa0
> [ 17.790295] ? _dev_info+0x75/0xa0
> [ 17.790298] tu102_gsp_oneinit+0x9b/0xd0 [nouveau]
>
> I'm not sure what the fix is.  Do we need __attribute__((no_sanitize("array-bounds"))) on PACKED_REGISTRY_TABLE?

yes that is probably the right answer for this, if we want to reuse
the structs that we get from the nvidia driver.

Dave.
