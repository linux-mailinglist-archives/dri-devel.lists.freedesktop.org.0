Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A91B1E6CC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 12:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406E410E91B;
	Fri,  8 Aug 2025 10:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="Hvam+svn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E7210E91B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 10:50:40 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7e811828b2fso260200485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1754650239; x=1755255039;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2t4Nqy8A7Pvum+ZPz/AX/HM66sDG0qhG/ulIAizon6g=;
 b=Hvam+svnvh05EStEwo4YW0J7CZDehkkE/u06TzsLHaoCP24qfWGmJypwqbzhcjTLcx
 UkplV9Ca0X4i3KXc+C+x52mTa8ymjmTkkv5CXM1jBKX6QorH6FWhrPOUgTMBVTfJSBpv
 cM29LMYwnV7lMsgJqePQ/2Wppqhz8bBhMHV0iUToVIK/TeiYLETs+3LNub8OK7lA4dFg
 40UNfaLA9n9pumpXBeE7cHKwux6y3svOTVe14nqwrcyzG2Rut67R31e93Y8GGcujQ1qK
 PqmPXrPRJoduZKcktYh7+KVpEdzUG9RzqcN6OE4vhYX0cQcc3yZl8Kf5YusHo45eSyim
 EM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754650239; x=1755255039;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2t4Nqy8A7Pvum+ZPz/AX/HM66sDG0qhG/ulIAizon6g=;
 b=TjOiRSCddHDloz58Cg1bpD7UqbP26SWFRAwbF52RA0RToV3GDLo8/0yASyNxSi2+Qm
 GkflhT3WrEId7f8NsquO4cmCnz5hPf4xLyYOpsXEYCnuJFFhxpaokbjWEtE2YnoDECZt
 DUkKhTZT/rhH32Lcv4YzhuLGANkLCgfAodc32FhLINPKfH4AHdRDYPVpzaui59NBevgW
 cHwn6gnmKjIjUWPlDKQe9JV5bPOdX7EmFkJfnoQ/ZJg45Y07+aJd8vrYH6V1m1wB0itN
 g+cJ7NH7bdkeU0p1DdJjjRQKs8sP/E6+c3nHJjl2uW26tU4z2pQpicIkaw+XNv9zm5lv
 2e0g==
X-Gm-Message-State: AOJu0YyJLEbeQEAESbt7XRFQyUrjs6cpKERuGTLomwuTyvjyzQrUV4d8
 b7WXygdudBSO3lVgJpaA4Ram+ev9SSVT4rj8MZjIzT8jhoiuCCk1N3P37eKuUg6qFy8P1fDrXtX
 yf5fUyeri/Q7jBW6a2NWBHqcFMVQ1RN4Tv/g9cydvLw==
X-Gm-Gg: ASbGncvTlt5/wZLVuXxKmjzuPONxs8dnF4O/dNQ7TkDj2eh1j69XRS3OjYS1LPOxlpT
 dMBHHIAi7pYwxZSm7hHP2KZLHb/kKuObuUeQMWTNmtEJ0IcCTnOiChOu6QKpY8/FZJtBmuKY9+i
 d3Uq6VgjmXremrxe7Qx4mCIQDzwoNgxv0bfd7jlsHFokxIEJMJExU4n8NRrH6WXGRIFc6VWHTE1
 ih1Zw8=
X-Google-Smtp-Source: AGHT+IHKj7FBhJn4YvEWoDBBXtBvizyBf1uRp80BqxN8hVamn27Zko572Q6nuzWyGRHZWX8N75KkGWA1ysouHf3eFnM=
X-Received: by 2002:a05:620a:1587:b0:7e7:fdd2:cc58 with SMTP id
 af79cd13be357-7e82c684a08mr275759485a.15.1754650238850; Fri, 08 Aug 2025
 03:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250807162633.3666310-1-karunika.choo@arm.com>
 <20250807162633.3666310-7-karunika.choo@arm.com>
In-Reply-To: <20250807162633.3666310-7-karunika.choo@arm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 8 Aug 2025 11:50:27 +0100
X-Gm-Features: Ac12FXwZubGjX-KjBWAWJ55zqwf6_QveUqVQsmAMnzOas61qm-AzifcTiF3DvrM
Message-ID: <CAPj87rP9pETnxr_mVJ4OAwj_Vhh2yS75iQ5LDT7ddC5=a-kXkA@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] drm/panthor: Make MMU cache maintenance use
 FLUSH_CACHES command
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chia-I Wu <olvaffe@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karunika,


On Thu, 7 Aug 2025 at 17:27, Karunika Choo <karunika.choo@arm.com> wrote:
> @@ -585,6 +615,9 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>         if (op != AS_COMMAND_UNLOCK)
>                 lock_region(ptdev, as_nr, iova, size);
>
> +       if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
> +               return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);

Given that FLUSH_MEM and FLUSH_PT are the only ops which are ever
used, the below becomes dead code. Could you please just inline these,
so it's more clear what's actually going on? The (op !=
AS_COMMAND_UNLOCK) branch can also become unconditional, perhaps with
a WARN_ON() around unknown ops.

Cheers,
Daniel
