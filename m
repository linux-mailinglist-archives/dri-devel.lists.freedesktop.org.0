Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F153C642B6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC5189BFC;
	Wed, 10 Jul 2019 07:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF706E04A;
 Tue,  9 Jul 2019 07:22:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f9so19745791wre.12;
 Tue, 09 Jul 2019 00:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eTTGtdAf9D8hMWA6RdwU6DYctiL/OmG776vwkKDwCdY=;
 b=UcJVAXCvYm0pqJUl95t2yA7ML6KPVjkZHda7ZZv2TFGm/erb4ifx9vDcvI+nKX9cMq
 g2c5nSzCq9yp1MKtJAJgif+2z/Ny2RBO6CcTar0Q1pGMkSgJ1iU/cih1wbK9iIK9hwad
 DYD6qCgoSzhZ5bYIYxAjhl5v5zOIQHKlTnddDY04v8muRuezQvo7zU1wuViA/dhWtQxr
 ODMI29BzTFedli5U0Adf4GNY0AEH6PNe/Yxel18WaAAtq5J0J8PDxi6HToKvuYkE1o2H
 BJpdGnJwyh7rtUAtAioB+wpFRSQH32o4X7fINi8psYAC6LDRZCA+7O5r0m5jeg1KNJ7d
 LnYw==
X-Gm-Message-State: APjAAAUC0ldapnFjZC8qzDjDHh3O7o7YuwDbzykkWtt1y0ZV6pF7IZ6h
 y6f5gXqVjsdBCaI+lxnZkUE=
X-Google-Smtp-Source: APXvYqwpHuI9CWOWbco5N6jY+5LAeHjro1s1YTciZRy3YWL+F5Pp3hdmj4NAX2bBfyJX0mNGYk9vdQ==
X-Received: by 2002:adf:e28a:: with SMTP id v10mr23876027wri.178.1562656969476; 
 Tue, 09 Jul 2019 00:22:49 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id l8sm32824144wrg.40.2019.07.09.00.22.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 00:22:48 -0700 (PDT)
Date: Tue, 9 Jul 2019 00:22:47 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 0/7] amdgpu clang warning fixes on next-20190703
Message-ID: <20190709072247.GA92551@archlinux-threadripper>
References: <20190704055217.45860-1-natechancellor@gmail.com>
 <CADnq5_MGzLLMNPSQXpdxwrBpvsp7Fd1KdExS-K4yNeDBQYEGMg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_MGzLLMNPSQXpdxwrBpvsp7Fd1KdExS-K4yNeDBQYEGMg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eTTGtdAf9D8hMWA6RdwU6DYctiL/OmG776vwkKDwCdY=;
 b=D9zLoQTk2FJgkaohPSj2m1p1zwZI89NM//MF5PYnexgpgf4SiMH++rB5G5zVRxXhKr
 kYMteY2oyg2s8jY63/dsh9yMpX9CH7oYiLuARTVAqyvfM6mPxUEMXqwp6gJcF5qkCL1M
 1uCTJTTO+JhaYlbZ3q1P641qfafCLT3h+eVzHQkSA0iib/gyjCM884tf0Lp+lMFILUg4
 2ktc9iGkbEddgkAadHYi4SXOYsJOY2Jsh029gb4Ngmj8WpSmj+J69E2/ZuauZirjIO4t
 4ZqbT+H3xpjVasdiStsr8xD/UOZZKphkpHkshKaRkYKSC1l/3jT3N5m7Q7QMTM7l/c1v
 lVww==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: clang-built-linux@googlegroups.com, Leo Li <sunpeng.li@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMTE6NTU6NTBBTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IEFwcGxpZWQgdGhlIHNlcmllcy4gIHRoYW5rcyEKPiAKPiBBbGV4CgpUaGFuayB5b3Ug
OikKCkkgZG9uJ3Qgc2VlIHRoZSBlbnVtIGNvbnZlcnNpb24gb25lcyBpbiB5b3VyIGN1cnJlbnQg
dHJlZS4gSWYgdGhleQppbmRlZWQgY2F1c2VkIGlzc3VlcywgY291bGQgeW91IGd1eXMgcGxlYXNl
IGxvb2sgaW50byBmaXhpbmcgdGhlCndhcm5pbmdzIHByb3Blcmx5IHlvdXJzZWx2ZXMgKG1heWJl
IHNvbWV0aGluZyBsaWtlIEFybmQncyBwYXRjaD8pCm9yIGxldCBtZSBrbm93IGhvdyB5b3Ugd291
bGQgbGlrZSB0aGVtIGZpeGVkIChleHBsaWNpdCBjYXN0cywgY2hhbmdpbmcKdHlwZSB0byBpbnQs
IGV0Yyk/CgpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzE2NDY2LwoK
Q2hlZXJzLApOYXRoYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
