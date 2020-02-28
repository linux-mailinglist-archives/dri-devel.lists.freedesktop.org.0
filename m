Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D473017460F
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 11:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078886E1BC;
	Sat, 29 Feb 2020 10:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084336EF35
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 11:00:54 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id m7so4276254pjs.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 03:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eQW4bOKSHmU5l0Lbtw43hu3nzYBtiYhV3Cs9XK1O2js=;
 b=FqGcQt7M9LOBvJLQAHMcr8nvGS+3bKX4hNxcwMSYzAtUeT1qlioANW7evrFMu+f2VJ
 NyRZTZBvSogXJiEO/YbyZzLFeRo085fID3MW0eNGHbKIzSgeEy46OjTgwjce1eOv/OxZ
 0CiGSdsyQrHJmz3+NB5IKlJ551XeMEU/kXokhXrDsmB5mo5XYfS9kHKCLaZ7WuY/oSP1
 mC8X6o2xuyfUgq9LqY6GrlYSQn83HyJNvwAJZn3e+Vk5/+xxN1jwCiQp9RsgciCCwRPi
 9nl8vmdeSD2xu44v+UEPSaZVOsUXvaQ1pZWYxzHLlvkS2os8AY8baIJLxaEdrZ0JOYMU
 mzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eQW4bOKSHmU5l0Lbtw43hu3nzYBtiYhV3Cs9XK1O2js=;
 b=Ostll23mPcoDBCgeiK6lNBbwJpBMigXVqdSyUZLvFyCJDxiHMGh+poqKWX14ibCZaY
 D8PVybZeKLFrUQRrvg1kLur9c/+6sNBl8X2Ui+IejbvYiCAKrH3d4fVqLoyPCFUNUIeX
 BB05Iv8rUn6Mx7kjQivA7d2mHCVdEJFLh3texES+fjrOGTtE7vD/wtl3Zm0HtWjXkOvN
 9yEjahs5ftGq83uXG5OA3lcP/Oq8pPs7InKaLgvPVLtDquRTs5iGg+bz29fY7lyyCrld
 DhqONsnajI6GTcpF79rHNcYLTwfW6la+VkGFr6vmt/M0cuzbASdPHg2RW5WqYU34OuGw
 M46w==
X-Gm-Message-State: APjAAAUIhhWo24xFfD/eWvbAVlFKTqYkhIZgwhbJxq8Iahxhhb3qJ3rt
 RZexEHT5WOV6HaAsATj4PDk=
X-Google-Smtp-Source: APXvYqz82JUgk/ovz9no9ndPWLWIZDS2FJ4A6l9d3T+uSPQm6aLPld4kOwK3P9BJjBVf0EDJET2qYA==
X-Received: by 2002:a17:902:7004:: with SMTP id
 y4mr3518935plk.263.1582887654310; 
 Fri, 28 Feb 2020 03:00:54 -0800 (PST)
Received: from localhost.localdomain
 ([2408:821b:3c17:4ef0:cc67:a77c:4401:27bb])
 by smtp.gmail.com with ESMTPSA id s206sm10932554pfs.100.2020.02.28.03.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:00:53 -0800 (PST)
From: youling257 <youling257@gmail.com>
To: jun.zhang@intel.com
Subject: Re: [PATCH] ion_system_heap: support X86 archtecture
Date: Fri, 28 Feb 2020 19:00:12 +0800
Message-Id: <20200228110012.3578-1-youling257@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20190929072841.14848-1-jun.zhang@intel.com>
References: <20190929072841.14848-1-jun.zhang@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Feb 2020 10:13:17 +0000
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
Cc: devel@driverdev.osuosl.org, youling257 <youling257@gmail.com>,
 tkjos@android.com, gregkh@linuxfoundation.org, jie.a.bai@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bai@vger.kernel.org, linaro-mm-sig@lists.linaro.org, bo.he@intel.com,
 arve@android.com, he@vger.kernel.org, joel@joelfernandes.org,
 labbott@redhat.com, maco@android.com, christian@brauner.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

this patch no help for x86.

i have same problem on Androidx86 10.

[  846.089339] x86/PAT: NPDecoder-CL:11141 map pfn RAM range req write-combining for [mem 0x77c00000-0x77c07fff], got write-back
[  846.089756] x86/PAT: NPDecoder-CL:11141 map pfn RAM range req write-combining for [mem 0x77c08000-0x77c0ffff], got write-back
[  846.090062] x86/PAT: NPDecoder-CL:11141 map pfn RAM range req write-combining for [mem 0x77c10000-0x77c17fff], got write-back
[  846.090311] x86/PAT: NPDecoder-CL:11141 map pfn RAM range req write-combining for [mem 0x77c18000-0x77c1ffff], got write-back
[  846.091353] x86/PAT: NPDecoder-CL:11141 map pfn RAM range req write-combining for [mem 0x77c20000-0x77c27fff], got write-back
[  846.094230] x86/PAT: NPDecoder-CL:11141 map pfn RAM range req write-combining for [mem 0x77c00000-0x77c07fff], got write-back
[  846.095464] x86/PAT: NPDecoder-CL:11141 map pfn RAM range req write-combining for [mem 0x77c28000-0x77c2ffff], got write-back
[  846.099184] x86/PAT: .vorbis.decoder:11142 map pfn RAM range req write-combining for [mem 0x77c08000-0x77c08fff], got write-back
[  846.100383] x86/PAT: .vorbis.decoder:11142 map pfn RAM range req write-combining for [mem 0x77c10000-0x77c10fff], got write-back
[  846.103239] x86/PAT: .vorbis.decoder:11142 map pfn RAM range req write-combining for [mem 0x77c18000-0x77c18fff], got write-back
[  846.104483] x86/PAT: .vorbis.decoder:11142 map pfn RAM range req write-combining for [mem 0x77c30000-0x77c33fff], got write-back
[  846.104906] x86/PAT: .vorbis.decoder:11142 map pfn RAM range req write-combining for [mem 0x77c20000-0x77c20fff], got write-back
[  846.104987] x86/PAT: .vorbis.decoder:11142 map pfn RAM range req write-combining for [mem 0x77c30000-0x77c33fff], got write-back
[  846.109349] x86/PAT: NPDecoder-CL:11141 map pfn RAM range req write-combining for [mem 0x77c08000-0x77c0ffff], got write-back
[  846.109491] x86/PAT: NPDecoder-CL:11141 map pfn RAM range req write-combining for [mem 0x77c10000-0x77c17fff], got write-back
[  846.109965] x86/PAT: NPDecoder-CL:11141 map pfn RAM range req write-combining for [mem 0x77c38000-0x77c3ffff], got write-back
[  846.110136] x86/PAT: NPDecoder-CL:11141 map pfn RAM range req write-combining for [mem 0x77c40000-0x77c47fff], got write-back
[  846.111691] x86/PAT: .vorbis.decoder:11142 map pfn RAM range req write-combining for [mem 0x77c00000-0x77c00fff], got write-back
[  846.112631] x86/PAT: NPDecoder-CL:11141 map pfn RAM range req write-combining for [mem 0x77c30000-0x77c30fff], got write-back
[  846.114647] x86/PAT: .vorbis.decoder:11142 map pfn RAM range req write-combining for [mem 0x77c34000-0x77c37fff], got write-back
[  848.562022] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c00000-0x77c01fff], got write-back
[  848.562208] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c02000-0x77c03fff], got write-back
[  848.562587] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c04000-0x77c05fff], got write-back
[  848.562887] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c06000-0x77c07fff], got write-back
[  848.564765] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c08000-0x77c09fff], got write-back
[  848.567498] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c02000-0x77c02fff], got write-back
[  848.568559] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c00000-0x77c01fff], got write-back
[  848.569570] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c0a000-0x77c0bfff], got write-back
[  848.571470] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c04000-0x77c04fff], got write-back
[  848.573627] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c06000-0x77c06fff], got write-back
[  848.575635] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c08000-0x77c08fff], got write-back
[  848.576566] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c0c000-0x77c0cfff], got write-back
[  848.579950] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c00000-0x77c00fff], got write-back
[  848.581189] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c0d000-0x77c0dfff], got write-back
[  848.582210] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c0c000-0x77c0cfff], got write-back
[  848.582821] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c0d000-0x77c0dfff], got write-back
[  848.584509] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c0a000-0x77c0afff], got write-back
[  848.585061] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c0c000-0x77c0cfff], got write-back
[  848.585725] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c0c000-0x77c0cfff], got write-back
[  848.586834] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c04000-0x77c04fff], got write-back
[  848.587474] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c0c000-0x77c0cfff], got write-back
[  848.588119] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c0c000-0x77c0cfff], got write-back
[  848.589486] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c06000-0x77c06fff], got write-back
[  848.590083] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c0c000-0x77c0cfff], got write-back
[  848.591243] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c0c000-0x77c0cfff], got write-back
[  848.592301] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c08000-0x77c08fff], got write-back
[  848.592891] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c0c000-0x77c0cfff], got write-back
[  848.596420] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c00000-0x77c00fff], got write-back
[  848.596961] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c0d000-0x77c0dfff], got write-back
[  848.598486] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c0a000-0x77c0afff], got write-back
[  848.598598] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c0c000-0x77c0cfff], got write-back
[  848.599180] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c0c000-0x77c0cfff], got write-back
[  848.603080] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c04000-0x77c04fff], got write-back
[  848.604500] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c0e000-0x77c0efff], got write-back
[  848.604969] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c06000-0x77c06fff], got write-back
[  848.606555] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c0f000-0x77c0ffff], got write-back
[  848.607668] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c08000-0x77c08fff], got write-back
[  848.611666] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c10000-0x77c10fff], got write-back
[  848.612810] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c00000-0x77c00fff], got write-back
[  848.613929] x86/PAT: oid.aac.decoder:11197 map pfn RAM range req write-combining for [mem 0x77c11000-0x77c11fff], got write-back
[  848.683124] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c0d000-0x77c0dfff], got write-back
[  848.683259] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c0c000-0x77c0cfff], got write-back
[  848.683420] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c0e000-0x77c0efff], got write-back
[  848.683508] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c0f000-0x77c0ffff], got write-back
[  848.683583] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c10000-0x77c10fff], got write-back
[  848.683664] x86/PAT: MediaCodec_loop:11196 map pfn RAM range req write-combining for [mem 0x77c11000-0x77c11fff], got write-back
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
