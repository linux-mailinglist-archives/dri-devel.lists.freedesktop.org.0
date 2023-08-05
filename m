Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193967716D0
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 23:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264F910E123;
	Sun,  6 Aug 2023 21:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BDF10E0BE;
 Sat,  5 Aug 2023 09:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1691228664; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=k65bXpFg59UkmcwFt/FZzawuToBa6mWZK+5iwuRrYcLyHOmcLUJwG+Nxs3uP0AOB/n
 ZTyfrVwrR1T0Z8xyT44lTxLcpzRqBuWCgQWXv9lMAYRgyL6yd1Yy+izLn7JBnmm1g9Zg
 7UJ2VrTRarHxVwYBqErte555diOYRxq18a+goGLih9k6MfVTRnt0AA/OsxQIHCPSOvpQ
 BIANJ+sc5jYykbYw73HT3A4lF/jHl7cozjCNgktdU3PmFTvOHGwbStJ+f/422IFE/aUF
 EtgNIxgqS0utbab2pE82S/u44w3OnvZDi9vgAc/kbAVXsOsJNlpJ6Wt4Z5ZiZz710ECm
 1w+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1691228664;
 s=strato-dkim-0002; d=strato.com;
 h=References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=GjUjP+DGWGUn/BiSDuX2B6VLpikBHTUWFpI5Xmu0UTA=;
 b=lGmi7VIe156KxIzW6uKdWZWWY0empbUZyPMOyvlH/rKs0s31Um20hgMQXGkeDJE29H
 g6kAe2hklgQ3M2k4EUl1zIviMzYLPbfx5SqQ6KvBmnqG3RB53GwSnkkUE1ApTtukF3d5
 TeJyz2HoMmn2RIUdNagrvhW/Rw+ocyyN91m+gnZLo2ixE4FPGbeQK5NRy7IEfBk2ePTK
 J65cQlL4vX+h6qkPRzyYwHdqopKbA0Iop0MBdU2l8sqjJGXjx3fr7h7U66EteneejoJ9
 xlBaUzEzQm1YcQ6qFW/JglETWDWks4bhmAlcz/KhKkNFdDop/rSsYFAbDNgiDfE8g9oJ
 SJXA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1691228664;
 s=strato-dkim-0002; d=kravcenko.com;
 h=References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=GjUjP+DGWGUn/BiSDuX2B6VLpikBHTUWFpI5Xmu0UTA=;
 b=L3psWUszTXjU+IowLlmpZHF4CMbvgXBrvdxRy8a6yLNrs46SmP9OsYVoUWILQOwx3J
 F9kmQ3oc9hI99MthD2//X5ajLTJsQNMyQT8Wkaz/MvddII+IoaugBtumOJKP572ufOjN
 vlXPvyU8MxYJoouBaf5GGuGqaZUWNeDPm+pAaADzWTLVNXlfoFwfGmKLniYCqyYcn1na
 KGmKMmnc9ddadHIyi+Svu/Ji8nhwPmLmlwmDb7HKBwrLcPURmeq78V8IqP+o7oSJCRjR
 lmkb0f+W/h/K5c5HnyGxlmmQw3BRpDXYgU2PKgNKjcLOELYzxz/RofiBN0uZd4/q3z15
 +dYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1691228664;
 s=strato-dkim-0003; d=kravcenko.com;
 h=References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=GjUjP+DGWGUn/BiSDuX2B6VLpikBHTUWFpI5Xmu0UTA=;
 b=TQp4xLYPqY1m2Az0TUmNocmSfPbvHUmVBzGK0RRhNesANRFj2jb7vFMwk1toD9cfFB
 cTlfGiWfiPTRTC+tGzCw==
X-RZG-AUTH: ":I2AFc2Cjaf5HiRB0lhnvZ9elhwku56KjVuxY6AZJWRy8C0aEhFGYVtZdsoywGOIVpSHY0o63PckPhiSO1IhQGG0mBjo18W4hBO/Ijw=="
Received: from p200300c7f704d301468a5bfffe84f964.dip0.t-ipconnect.de
 by smtp.strato.de (RZmta 49.6.6 AUTH) with ESMTPSA id dd2654z759iNY7J
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 5 Aug 2023 11:44:23 +0200 (CEST)
Date: Sat, 5 Aug 2023 11:44:22 +0200 (CEST)
From: Olaf Skibbe <news@kravcenko.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: nouveau bug in linux/6.1.38-2
In-Reply-To: <CACO55tvq=GoPJZxouiTT0tty9A0fEeyS1uGjWLHjfJgq=VA4ug@mail.gmail.com>
Message-ID: <3d58b37b-b6c2-7c4b-fa6b-3dac859dc20b@kravcenko.com>
References: <20be6650-5db3-b72a-a7a8-5e817113cff5@kravcenko.com>
 <c27fb4dd-b2dc-22de-4425-6c7db5f543ba@leemhuis.info>
 <CACO55ttcUEUjdVgx4y7pv26VAGeHS5q1wVKWrMw5=o9QLaJLZw@mail.gmail.com>
 <977ac5b0-4ab8-7782-10e1-b4bee6b58030@kravcenko.com>
 <CACO55tvq=GoPJZxouiTT0tty9A0fEeyS1uGjWLHjfJgq=VA4ug@mail.gmail.com>
User-Agent: Alpine 2.26 (DEB 649 2022-06-02)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 06 Aug 2023 21:43:47 +0000
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
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 nouveau@lists.freedesktop.org, 1042753@bugs.debian.org,
 dri-devel@lists.freedesktop.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Ben Skeggs <bskeggs@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 5 Aug 2023 at 01:09, Karol Herbst wrote:

> Mind checking if instead of reverting the entire commit that this is
> enough to fix it as well?
>
> https://gitlab.freedesktop.org/karolherbst/nouveau/-/commit/f99ae069876f7ffeb6368da0381485e8c3adda43.patch

This patch does fix the problem as well: Screen works.

Cheers,
Olaf
