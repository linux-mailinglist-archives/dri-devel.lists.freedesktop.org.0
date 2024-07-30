Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EF6942329
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 00:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F86710E32C;
	Tue, 30 Jul 2024 22:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MuiEj0x2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A8710E1AD;
 Tue, 30 Jul 2024 22:56:19 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-70d1cbbeeaeso3675550b3a.0; 
 Tue, 30 Jul 2024 15:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722380179; x=1722984979; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=hpezHkvdjy1MlA+dO0gKXwYP8ordkQyr69OAF6y3Pjs=;
 b=MuiEj0x2Qw1khe/o3iY9L0HiHu5lyRtfnhfaDqNdlsOiAIwchAhM79yAvwymFXVLO4
 3s5vP01jpF76Et4ifXrcn2G7pTQHYT2B9Mf0FpvAUo/dQ8g6aYnplHlyg1JY805lfeqR
 k0dXSWcejIqgLkF3KRKO1G7TGfukZnemos7a2U4uGEUSOailfKzGB3swVIhhtYOTD21y
 nLFds1LHuminosBVeTyirMAUfbGXQXHcJq0UQxG/qGO+9XhSR6q+ihfY8+kG4NseEsCy
 hq9hjS2IVrtkc4FWe3szLB9xu5Pu3LJzOsOmrcIf1kqBC+xhNeJM1fGxH8LdR7ysicP5
 f63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722380179; x=1722984979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hpezHkvdjy1MlA+dO0gKXwYP8ordkQyr69OAF6y3Pjs=;
 b=jo5rFTsjJlhzJTZymtjsKM7I1HFbVELEdaVZtHZlo3fCDq2HCuEncg372cAwZWB4ZI
 20EtcUTfBD+/pvPBoQwH0jl/3h+LbS8SR/3t6KWKp3OM7KZeiXKRsngzPsL10YUYifQd
 68t0e4tcsjwJB9rQxCUUKpokL1lT+Sds8TNgUkrLcmUcwYrsgPuzyM9Dk/fPb7Zt4CDe
 hXvRA1qBM7jKB+WDjGZiCrQwEhhSvCCg8qYEi0esbTXe+t5226xR3o+JdEQlv1xhfL8I
 7DGd0W+WSxxJnlAK74flKwVX5KFGg34DUUT+sA2sE5xm8WHdv0K0pDtnZrHjDIDrhwKG
 GOhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWleKIogOxadpzfG3m3ennG0qSd2QFa1oGusa5UadBlBe29s4e1eSCvMlJrWbxR9Cn5f/pgBKOXSzZJIWEzN22Yul4OYxiyinXbdeZTSo05
X-Gm-Message-State: AOJu0YzzwrgXvz+8NVwrW15yNblavig7WP7Z587KBSYSniAuCySS6rGQ
 LqpVI1F0U7JNjDC6eg1Gh8ChRL1bSYAC+gRTdkVIT5UKCFdR+Isw
X-Google-Smtp-Source: AGHT+IEFsNvh6YZbrzZOxYWiNatZm9h2D+IzSj1fF1gCLZedtbzz+noDtkqPWsgKmSkEqz2qKNP5Kw==
X-Received: by 2002:a05:6a00:2e90:b0:705:9ddb:db6b with SMTP id
 d2e1a72fcca58-70ecea2ed28mr11584399b3a.13.1722380178823; 
 Tue, 30 Jul 2024 15:56:18 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net.
 [141.239.149.160]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead8a2bebsm8917764b3a.212.2024.07.30.15.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 15:56:18 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:56:17 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 christian.koenig@amd.com, ltuikov89@gmail.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 1/3] workqueue: Add interface for user-defined
 workqueue lockdep map
Message-ID: <ZqlvkdIoZAkVrvvx@slm.duckdns.org>
References: <20240730221742.2248527-1-matthew.brost@intel.com>
 <20240730221742.2248527-2-matthew.brost@intel.com>
 <ZqlqYLZWCiLKhVJf@slm.duckdns.org>
 <Zqlu8gq2d8mtn7rC@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zqlu8gq2d8mtn7rC@DUT025-TGLU.fm.intel.com>
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

On Tue, Jul 30, 2024 at 10:53:38PM +0000, Matthew Brost wrote:
> I didn't want to change the export alloc_workqueue() arguments so I went
> with this approach. Are you suggesting export a new function
> alloc_workqueue_lockdep_map() which will share an internal
> implementation with the existing alloc_workqueue() but passes in a
> lockdep map? That could work.

Yeah, add a new exported function which takes lockdep_map and make
alloc_workqueue() to call that with the embedded map. No need to make the
latter inline either.

Thanks.

-- 
tejun
