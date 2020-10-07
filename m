Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C696E285B67
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 10:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB016E24D;
	Wed,  7 Oct 2020 08:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F9E6E24D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 08:58:26 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id l17so1310016edq.12
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 01:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=1Q/c93gwRC8NWIcrpGbHmBEju9vpCDDgwD1JgJaJq08=;
 b=ylBQHpMP2pFOFG12L/UhwucDzzYkPeIKpSso1EgYfgIxpaXHY3e49jfOGGUbweDdL0
 inCT10noh2vAiB4SahKIf2sudLsIeX7wERHu9zIvNcfnfTNy/0j3NofQU8kA2QY8d1Gj
 RYKdjCL0bs8Ld0r/9XqdRqGyuppIPqvml2e1kq+1JANoLP4dRbfs+cllDXcxFf8RIa3C
 3eSFDQY78tgAmWzzm1bTvtETvtD886xiidxC4NX0yvrnI7hOfaQdlLnZy4gASILx+VoO
 7wBjUXxEnEuumkm4LhQUE/2A7TyXwJ6Wk0Kdx0AT+uuDez9YhkAS43cHUeLt0V3ti6+J
 GNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=1Q/c93gwRC8NWIcrpGbHmBEju9vpCDDgwD1JgJaJq08=;
 b=Rwbji7hHx7jcLnwpXWp17sScjTmZ2d4Eu9ZBBqGSgyprpBix20IIUG7AJSbyrC9bid
 KHdilFAFWTHMr9lS0Xvfu5iJjKwq5mTITgzsvtAcqdUwqbmp+z2wJGG/zL3vzW3ECvDB
 AhOhVmU+PQSKdoZzb4iNiJLW0wCguDwaqg2B8w3vsjD/LiOnm4Eo+E/I6eoSpuUG8q0v
 0nb/Ui5F6Ruk+Wd6mQGbb+1teT/e4hIbaWG2cZappdbrlPTx3Amjk4EUzgf8dN3IXaOX
 pRat+VlsDJVLMddouJneL+U9ZZJSbjjIDz3Lhu1oEgohok+toNfBSBdoD3Q32v3Kpg5c
 0hwQ==
X-Gm-Message-State: AOAM533FHJ10GsnmZnIUvQ6b9QFQDaD3vt1cNWji1bsPOv72xvMJKZDc
 ydle0JHzkM0jUEKhvjAWmYNXAt8l82Nq7g==
X-Google-Smtp-Source: ABdhPJzpPO0FbAvD8oDecrw4S9xG7JzjwEkNzJ+IX8jHscm6aIs5wisxsl4RCkoojx5JXPquYNsZYQ==
X-Received: by 2002:a05:6402:2292:: with SMTP id
 cw18mr2542821edb.112.1602061104827; 
 Wed, 07 Oct 2020 01:58:24 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id f10sm983949edu.68.2020.10.07.01.58.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 01:58:24 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id t10so1238053wrv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 01:58:24 -0700 (PDT)
X-Received: by 2002:adf:f5c1:: with SMTP id k1mr2460780wrp.271.1602061103725; 
 Wed, 07 Oct 2020 01:58:23 -0700 (PDT)
MIME-Version: 1.0
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 7 Oct 2020 10:58:12 +0200
X-Gmail-Original-Message-ID: <CAAObsKCP+ve2ZdXQk62aTo70G9i9Vo17dh6k-fcY23NC=EYZxg@mail.gmail.com>
Message-ID: <CAAObsKCP+ve2ZdXQk62aTo70G9i9Vo17dh6k-fcY23NC=EYZxg@mail.gmail.com>
Subject: devfreq and panfrost on Allwinner H6
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
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
Cc: linux-sunxi <linux-sunxi@googlegroups.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2zDqW1lbnQsCgpIYXZlIGp1c3Qgbm90aWNlZCB0aGF0IG15IFBpbmUgSDY0IGJvYXJkIGhh
bmdzIHdoZW4gSSB0cnkgdG8gc2V0IHRoZQpwZXJmb3JtYW5jZSBnb3Zlcm5vciBmb3IgdGhlIEdQ
VSBkZXZmcmVxLgoKSXMgdGhpcyBhIGtub3duIGJ1Zz8KClRoYW5rcywKClRvbWV1Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
