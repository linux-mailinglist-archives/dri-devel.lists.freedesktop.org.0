Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7947716D9
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 23:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9560D10E197;
	Sun,  6 Aug 2023 21:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 141449 seconds by postgrey-1.36 at gabe;
 Fri, 04 Aug 2023 12:48:39 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1656410E6E7;
 Fri,  4 Aug 2023 12:48:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1691153230; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=fPPfv7Wf/FPOe0PdLkcNWUDqB504GCex5b6XdweL4YxnJv+RFTy4CwiRsab2hEgo/L
 es3BMNAc2VeihGIszGXKR4L7dDPDX9mg7cCIpPki0BjjqFQEuuxdwTT/0uNJWF/KK/rN
 HuEZ1S98YS+p+rnr8OULRTSi8+/Uymuinq/pp6n5fUGIOfrygdQY4a31VmSD1wkN5cYP
 KXhwQ/MyqXFkOS2l0LwCXL4gOUcPFyNzBRudAk1NMrY8kgaTAvQBjXRUTS+8hPxt6bmZ
 ZhHbqf5F81dYQkZ7a8SpjNRl2kD3P2wQDseDluqln8M1Bs8gIPL2KdUIeJZ08k+Q6dz4
 TABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1691153230;
 s=strato-dkim-0002; d=strato.com;
 h=References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=9EYPZh3bK4/rfwAilTxfULasm0qSCr/n1iUN2yQEIqw=;
 b=ODI6w+7xrbc1jEyW1ONt9mGBMp9KjaXKL5ffdUkSVo9d2yQaHChirp30CJu3CBvGUE
 9HmBtNCMoFtU8EEKcrx1exVtasMuv3z2Y1w15Ii/X+zVPP9Psv/jeTPe8Br8LeoatpEo
 n47unxX1OU6e6d8BWzp5LtTuwYfOBgXjHRCpeqtpYnfYg9Vqt5sP96DGLLyTHcAGIUSK
 Mh0EUo2PAPrs0zdIA2SK0/PHwbHFo8qkOgvbwRJF0SeNWxdQe8LAC8ekGc2HV70ULHuu
 Dihv6z/GtdjVGxi8KaHjcKnj4fpf/N9NZ99eGgKQVdgybuqKiJEYZwKuTpa85SI7htZh
 6aKw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1691153230;
 s=strato-dkim-0002; d=kravcenko.com;
 h=References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=9EYPZh3bK4/rfwAilTxfULasm0qSCr/n1iUN2yQEIqw=;
 b=TqP2h85NJh2aEUoJOlpNH4jD4fVeXC9Q6PdsyJuA/BG7vvkQCKJrfA9Hcfy9G7Ay7R
 /I6a3O5rvESDswGGPi7vz8RSM9d0osvWgtrYqy8oY4Ym7r40oYwH8tJLm4uKqziyIhQp
 vqk5El8IZEpNO62k/kt7Fsub/ClLMmzMjH9FBHWswEinm6q2RrP3vDDDMN90IpBxhd3d
 dGwSSrkPrgTwcUbxbLDyK9x4fZGz5Z5Qlc4oslNa/OyvH0ay7RyqHbVKSFUE1AO08Dso
 fZhb751cJoUjZs+mI0PZIZdCywMeeKUCJH8shC5+gXsA/dQnmFmCl2UzfVJ/6awrbTVt
 T0ug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1691153230;
 s=strato-dkim-0003; d=kravcenko.com;
 h=References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=9EYPZh3bK4/rfwAilTxfULasm0qSCr/n1iUN2yQEIqw=;
 b=HDQWQS8l+d70MoVSgEaj3hlj6tipBNWp3rmySPugmybXsoFbfiuW4pdizNDCMZWTJW
 RkaT62lHLgj7q6st+NBQ==
X-RZG-AUTH: ":I2AFc2Cjaf5HiRB0lhnvZ9elhwku56KjVuxY6AZJWRy8C0aEhFGbVIvMVnbXlOZqFTX/PnlW"
Received: from duane.cam.uni-heidelberg.de
 by smtp.strato.de (RZmta 49.6.6 AUTH) with ESMTPSA id dd2654z74ClAWsx
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 4 Aug 2023 14:47:10 +0200 (CEST)
Date: Fri, 4 Aug 2023 14:46:54 +0200 (CEST)
From: Olaf Skibbe <news@kravcenko.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: nouveau bug in linux/6.1.38-2
In-Reply-To: <CACO55ttcUEUjdVgx4y7pv26VAGeHS5q1wVKWrMw5=o9QLaJLZw@mail.gmail.com>
Message-ID: <0a5084b7-732b-6658-653e-7ece4c0768c9@kravcenko.com>
References: <20be6650-5db3-b72a-a7a8-5e817113cff5@kravcenko.com>
 <c27fb4dd-b2dc-22de-4425-6c7db5f543ba@leemhuis.info>
 <CACO55ttcUEUjdVgx4y7pv26VAGeHS5q1wVKWrMw5=o9QLaJLZw@mail.gmail.com>
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

On Fri, 4 Aug 2023 at 14:15, Karol Herbst wrote:

> mind retrying with only fb725beca62d and 62aecf23f3d1 reverted?

I will do this later this day (takes some time, it is a slow machine).

> Would be weird if the other two commits are causing it. If that's the 
> case, it's a bit worrying that reverting either of the those causes 
> issues, but maybe there is a good reason for it. Anyway, mind figuring 
> out which of the two you need reverted to fix your issue? Thanks!

I can do this. But if I build two kernels anyway, isn't it faster to 
build each with only one of the patches applied? Or do you expect the 
patches to interact (so that the bug would only be present when both are 
applied)?

Cheers,
Olaf
