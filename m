Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A9B757119
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 02:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE28910E2BD;
	Tue, 18 Jul 2023 00:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678DF10E2BD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 00:51:38 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6b9a2416b1cso4039083a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 17:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689641497; x=1692233497;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lz+8CarDNbfuh8OfKKezu1WG0K0jECzwZysn86ImSis=;
 b=EZApaMs4gPJVrUIaeSPlMHa2Ubxx+ljVSgRceCanZxrxGNNKcrHVRdwxqf+J/i93eS
 bCVCmkZGoBTZIrpNuD7CYzc3Vd6qp+GujdSJoHFaZnudn11SQ22BfE3l/Rgd9in/Dlgq
 OxKFNtL93tIqLR/181oyic7HVL4EIEmsi6FsT2n1n8790US2gL6QHJke2g5bj7niI1YT
 47JlDZF/+b7YI7ApdN9OgTGyXQvEfGFHlRZ79pUoaS5fSUOdlnYK3KZN6KlM4PNB5G4D
 pZHZKTjVpoljidyzHjHOC6/wblYRuPi6qW6/WvfnrnEAP5HeSi57xsmv8NeKpRv+0OqW
 WVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689641497; x=1692233497;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lz+8CarDNbfuh8OfKKezu1WG0K0jECzwZysn86ImSis=;
 b=CiAd4pCR6Jrds4v6us1PmEDzKxRjIv1YnKnytRhu8hf2mr7AtiFAyCL74NRC/L27+X
 fbINadFD+tJz4UlUc6yRXmbOTYdmIpNUqdfQgP3gYnhMSkxQUjrqNixqh+flWx1gCxa2
 53UIcYnTYtoZ+UJsyGqDH/sayqrnOVTPgtr5TAFrsEB83ZsEyKW65Dlduq7tqF74Ir3V
 tGkQbnt5g0fCcGi63DpwNIPQOqvn0Ktt+xPF7iQ/W4PGYE3ZwKKTj++brkUDZ4vByTd5
 EphmNL94TlVtCZ1EriLdQMY1Yx3SPjIWJprMRiuIsF7Vbhch/Y+Z3DPCZdHp4H/6x2Yj
 0KLA==
X-Gm-Message-State: ABy/qLZd0eJDp9KyFEN6gm8NYex4OjON++hUcyg7WBR5jp/Y0XiJN1kc
 Mei+2Y9y5Xw8Fp9lcge6zOM=
X-Google-Smtp-Source: APBJJlGeBHqkRxL+zWXusQBpUdihf6v3b11hnUADferAFcbDtzk1JOfTMdtHdDSOktc+ANmDRfwJnQ==
X-Received: by 2002:a05:6358:6f97:b0:133:a8e:6feb with SMTP id
 s23-20020a0563586f9700b001330a8e6febmr9453004rwn.12.1689641496991; 
 Mon, 17 Jul 2023 17:51:36 -0700 (PDT)
Received: from [192.168.0.104] ([103.131.18.64])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a62e907000000b00673e652985esm53912pfh.44.2023.07.17.17.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 17:51:36 -0700 (PDT)
Message-ID: <e79edb0f-de89-5041-186f-987d30e0187c@gmail.com>
Date: Tue, 18 Jul 2023 07:51:24 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 hq.dev+kernel@msdfc.xyz
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Unexplainable packet drop starting at v6.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Linux Networking <netdev@vger.kernel.org>,
 Linux Intel Ethernet Drivers <intel-wired-lan@lists.osuosl.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Regressions <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Hi,
> 
> After I updated to 6.4 through Archlinux kernel update, suddenly I noticed random packet losses on my routers like nodes. I have these networking relevant config on my nodes
> 
> 1. Using archlinux
> 2. Network config through systemd-networkd
> 3. Using bird2 for BGP routing, but not relevant to this bug.
> 4. Using nftables for traffic control, but seems not relevant to this bug. 
> 5. Not using fail2ban like dymanic filtering tools, at least at L3/L4 level
> 
> After I ruled out systemd-networkd, nftables related issues. I tracked down issues to kernel.
> 
> Here's the tcpdump I'm seeing on one side of my node ""
> 
> ```
> sudo tcpdump -i fios_wan port 38851
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on fios_wan, link-type EN10MB (Ethernet), snapshot length 262144 bytes
> 10:33:06.073236 IP [BOS1_NODE].38851 > [REDACTED_PUBLIC_IPv4_1].38851: UDP, length 148
> 10:33:11.406607 IP [BOS1_NODE].38851 > [REDACTED_PUBLIC_IPv4_1].38851: UDP, length 148
> 10:33:16.739969 IP [BOS1_NODE].38851 > [REDACTED_PUBLIC_IPv4_1].38851: UDP, length 148
> 10:33:21.859856 IP [BOS1_NODE].38851 > [REDACTED_PUBLIC_IPv4_1].38851: UDP, length 148
> 10:33:27.193176 IP [BOS1_NODE].38851 > [REDACTED_PUBLIC_IPv4_1].38851: UDP, length 148
> 5 packets captured
> 5 packets received by filter
> 0 packets dropped by kernel
> ```
> 
> But on the other side "[REDACTED_PUBLIC_IPv4_1]", tcpdump is replying packets in this wireguard stream. So packet is lost somewhere in the link.
> 
> From the otherside, I can do "mtr" to "[BOS1_NODE]"'s public IP and found the moment the link got lost is right at "[BOS1_NODE]", that means "[BOS1_NODE]"'s networking stack completely drop the inbound packets from specific ip addresses.
> 
> Some more digging
> 
> 1. This situation began after booting in different delays. Sometimes can trigger after 30 seconds after booting, and sometimes will be after 18 hours or more.
> 2. It can envolve into worse case that when I do "ip neigh show", the ipv4 ARP table and ipv6 neighbor discovery start to appear as "invalid", meaning the internet is completely loss.
> 3. When this happened to wan facing interface, it seems OK with lan facing interfaces. WAN interface was using Intel X710-T4L using i40e and lan side was using virtio
> 4. I tried to bisect in between 6.3 and 6.4, and the first bad commit it reports was "a3efabee5878b8d7b1863debb78cb7129d07a346". But this is not relevant to networking at all, maybe it's the wrong commit to look at. At the meantime, because I haven't found a reproducible way of 100% trigger the issue, it may be the case during bisect some "good" commits are actually bad. 
> 5. I also tried to look at "dmesg", nothing interesting pop up. But I'll make it available upon request.
> 
> This is my first bug reports. Sorry for any confusion it may lead to and thanks for reading.

See Bugzilla for the full thread.

Thorsten: The reporter had a bad bisect (some bad commits were marked as good
instead), hence SoB chain for culprit (unrelated) ipvu commit is in To:
list. I also asked the reporter (also in To:) to provide dmesg and request
rerunning bisection, but he doesn't currently have a reliable reproducer.
Is it the best I can do?

Anyway, I'm adding this regression to be tracked in regzbot:

#regzbot introduced: a3efabee5878b8 https://bugzilla.kernel.org/show_bug.cgi?id=217678
#regzbot title: packet drop on Intel X710-T4L due to ipvu boot fix

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217678

-- 
An old man doll... just what I always wanted! - Clara
