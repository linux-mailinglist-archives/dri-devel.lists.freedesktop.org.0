Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA66C03975
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 23:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B004A10E95F;
	Thu, 23 Oct 2025 21:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="aZGpdS4W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4210C10E11F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 19:11:44 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4710683a644so10156935e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1761246703; x=1761851503;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YC021s3hSX0b6kL+FC7sXtMbVcQNzXKMZzcCBREO6dA=;
 b=aZGpdS4WYpyxW5pssce9TTYH/30psDV5EnkLUjC0cmeIYnzw7QEnlbo9Tc8Iht+Kzw
 mZYZo9KafufMwYNgoZGHTI4wcereLWEQ+kznQ7cxR2sVPifwzdkld7QWkYij+3y9gGoj
 +9H0eC2pGbXwEWeUxwgckMh822V4B8+IKKckCLo0kzcCIZa3K9OJqB4DgZS0ifM3jpXN
 7R6YifvXUxLAqZuG60y7bMmfqyG/yYkIzwx26/4To744tXmrP9VuVuACwuDAfHO/PWEN
 xpva9pTvWzEonFKnHBh011rN0HxKHr/p/4dl0Y11+YBmOmanckgLoqXlwFKAaCjcxep2
 SYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761246703; x=1761851503;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YC021s3hSX0b6kL+FC7sXtMbVcQNzXKMZzcCBREO6dA=;
 b=qvBYTW6NhRAwZ3VwFfol6n+2qlT2MtL75+c4ZsvgzGkg139YRAYl+zLx91+VNO+ii1
 WqXDF9WWZl8K99n4ykD6b3PkDkvhWunQzhakgX9fmSKy3ruKZBTzTrIyhoohlKLHUvuf
 GGEAH3/QtbdqKiVJyd+eLbzzv2vmL6mieLE3yRNPocSq2O6xB5dqOwrgz2fXcVBaGcGc
 KGtXDE5JBLVBUsfDDEdwPv8fDZ68lD79fV7lJrQfe3OEpAUDd84GH8HAjHC8XQY/lDmI
 Z0NW9yuRcFjtNbTQ1/2vSPvtyFbSFHQEkmE/hifSMC7ev/Sv/AXMYflxzCUPkAYVztJJ
 NBsg==
X-Gm-Message-State: AOJu0YxcYf1cPGIT5c+m1RZ2OT70HxlPz4ZiFJlxHrEh+SO8MsnsaDZL
 5lkcYkVizkGBs79+3G2K+PdbNKOhgQYgnLJW6m9QB4P+ZTlaa1xQgr0=
X-Gm-Gg: ASbGncsSm0L07P4fg0RbyrSXtI7/ylSCd8ZjKYQmAmkokE2w/fv3b9jgRm8qTAW7M1l
 BxCxaMNudV9quxmYGDP8VCTrmRWGF4twf6jdLEUnBzivae5rUtcCOXgXs6ONbtyTWuXCCDAiUrT
 eFCovS7KTJNZK7KmOz+wcYGQjVgnObOh/K2L7pPW3Tp7A662a3NQwBkIQA8PIDKVxa0g6zz29PF
 iATpTsbEqtxcNhzqHfQVLoGikdfFQQBWGcZvoR3nwDQigDaoMFL0CoI07pWS3Kycec18QjCvxZt
 AFPvbXKw/PdBAfKa9pjxOcVGdTzt82hcaX+fJTMFWjhhxua/MHqQa/9czCsjot4Eaq0igfGU7j6
 Miz6VmaQhlBL4kG56o3gqqLMiGxSP1JNkqZbU6jJ+Lg4/txipBydGZKKrY1sAKvZwi1wXM7tg72
 iEVHK250TmWLQ561RfvOt6Oyg5XLXCUJuLqWGTEC7+A/6sxDWz7LXFG75yD5yB3k4=
X-Google-Smtp-Source: AGHT+IFNsNEq2TdqKr0cvqPqFFbm5Iwue3LIAxDBLdoZa+wyAY95ssAJ4sXZtAPUqqOIfIkrYHRO3Q==
X-Received: by 2002:a05:600c:c3:b0:46f:cdfe:cd39 with SMTP id
 5b1f17b1804b1-475c6f69890mr34045225e9.16.1761246702297; 
 Thu, 23 Oct 2025 12:11:42 -0700 (PDT)
Received: from [192.168.1.3] (p5b2b4069.dip0.t-ipconnect.de. [91.43.64.105])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf15b10sm60824215e9.11.2025.10.23.12.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 12:11:41 -0700 (PDT)
Message-ID: <270ce9a3-5067-4ef8-9205-414b5667cf3a@googlemail.com>
Date: Thu, 23 Oct 2025 21:11:41 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [REGRESSION][BISECTED] Screen goes blank with ASpeed AST2300 in
 6.18-rc2
To: Thomas Zimmermann <tzimmermann@suse.de>, regressions@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20251014084743.18242-1-tzimmermann@suse.de>
 <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
 <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
 <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
 <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
 <5f8fba3b-2ee1-4a02-9b41-e6e1de1a507a@googlemail.com>
 <e2462c92-4049-486b-92d7-e78aaec4b05d@suse.de>
 <3ca10b2e-fb9c-4495-9219-5e8537314751@googlemail.com>
 <329a9f97-dd66-49c2-bc42-470566d01539@suse.de>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <329a9f97-dd66-49c2-bc42-470566d01539@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Oct 2025 21:45:32 +0000
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

Hi Thomas,

Am 23.10.2025 um 14:46 schrieb Thomas Zimmermann:
[...]
> I've been able to reproduce the problem with an AST2300 test system. The attached patch fixes the problem for me. Can 
> you please test and report on the results?

Great! - this patch on top of 6.18-rc2 fixes the issue for me, too. Thanks very much for your effort!

Tested-by: Peter Schneider <pschneider1968@googlemail.com>

Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
