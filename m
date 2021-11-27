Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463A445FE43
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 12:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB7F6E213;
	Sat, 27 Nov 2021 11:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EAE6E5D5
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638012204;
 bh=Nlv+YwyrFp5/js3l2+n5LajMQJNLn1j+N2+/9mUdcKg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Pc109KAd4tB6rAGhwn6DyK/PMK67C2IS6q2vz2aVy4FJL7bWaFqZ8psdpzR0KlsrC
 t+YeKiQHYn2+ssBHpwOEgasTIXyM3z1UU2Tyb/xi2iJoE0OIt780qv1NE0PzXxnUBf
 bzjTGJFU2lShKbYZ5VNBwTDcJ7OxrDj0oVLxW4FM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.151.211]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKGP-1mp1rS0ycL-00Fnwd; Sat, 27
 Nov 2021 12:14:15 +0100
Message-ID: <ccc69a65-e0af-1c0d-282a-77f74e2cb918@gmx.de>
Date: Sat, 27 Nov 2021 12:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] agp: parisc-agp: fix section mismatch warning
Content-Language: en-US
To: Rolf Eike Beer <eike-kernel@sf-tec.de>, dri-devel@lists.freedesktop.org,
 Randy Dunlap <rdunlap@infradead.org>
References: <20211127045757.27908-1-rdunlap@infradead.org>
 <2606759.mvXUDI8C0e@eto.sf-tec.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <2606759.mvXUDI8C0e@eto.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s/S3hVajaXU3IFbl/RCCQTkAOGE9EEE7socUcPTMvRQQ4v/GUMR
 3fQe+2FN/Hv4bcXs1X9tfeHopkPSNOFiEBN+5r7758JijR77xsCVO4iRPZZq1iNV2mWvt96
 B6mH8ednX6CVse3PtltSCsxCUHocbwpK7FevL5p5iUKbu4PR6Q1g+9APs9T70OiO2Mh7cBl
 9R3/zewuQ+sgpG8WW7ViA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BEOL0kZ7XPo=:kYKV1F1Ewttj+/oVlZuwn2
 i1vOs3h0W9eqOUyKMFCEEPeqaXHXEhRE29NO2OS92f/vUoa5uZPVaCjwN4thgbYFCoUpdAOJv
 uuMqkDmdIsv5wgy5/VJqhuT4sJZgMj1XkMLDqlgGvocfpY1GBA1xr6EaY781tMvIpLnw7w+Cf
 RuEU/x2e/dIDD6PybdJHR7PJAHZoZ5asUmTCXhf4PFPV9LpnQyDVRwh34Go+ovWX4wlkQQmzz
 K6ehdiHDaMD2qt1nA0IilaokuVHP8rsptm1P9r7bB+oeWJdtCO54ruXWeKVzyEVYvpro9hgjG
 slQBRQrxYeMFDGR0Hxs880RAQPCr6R91TNHO4D8z7X79WfKRw3oi8ZhfMZgzw4TM6uhmwkEss
 Uw7V+3HuxBqUCznTobgJT5uV9sS3e0S1Q1Ma/fPNEDoKJ3aex50fXbgLny8gP/gpPpa7aC7Bj
 paVKuSVhmO20l3sPcEm86iuW5PyyKlkgn3N98CbQp2441tclCBLc3ZhlnUoAx2IeTIOy/MnuH
 oOKflqlMlG0qI24WIRLddA9STy8jtZ75TWownP82nJs5+OoXbd6TxTgrcWjDPSRI2sNED8E0p
 LqOxp3f90qRchRmh5A81bsINzNsLjocS9eY727Pw/Xdoqh65CHjWA+uoYVQU33630Ke95JwB9
 YfT2nigN1tn9DSP48iliEV9cP05s/6gf+XNhmjx2ijx27cDGHvNADwWP3OVMzRbdD7niFZzGk
 qMT6HOj5iGA11JxEiigG95RqKfixd9AZAPc06Jh0zd9ncHjkj2p6qTBD6qR7couYV3uB+SfIO
 gmG47dJpPvyXXXEqzEEMUdxLx6pW85Vu3MHekYSxR6yh7h551J4kz1f0DiZRqnBqC1xgeatjT
 fu20RoZRpYf5t6b2F/4tP3y7fZ/syyqwkU5AZlryFw2Umlm45GZae9p+xo7Nxmd/bBVbppaKx
 1EKpV57hPioxDxaipuAI3TapOnHWcXOzZPlfs3UZWvjn/ejYJ/onO7UpeMqA8fShW5Gtkfjgy
 XRCCZs0+rOWNbKvuf/oaHe8a5Elhr2ZH3MvNtELO42kj8A0KRBw/c+7j6sUuDQvgs+PsGu/Fz
 dHZk4R2STq0v/c=
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
Cc: Kyle McMartin <kyle@mcmartin.ca>, David Airlie <airlied@linux.ie>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 kernel test robot <lkp@intel.com>, linux-parisc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/27/21 11:56, Rolf Eike Beer wrote:
> Am Samstag, 27. November 2021, 05:57:57 CET schrieb Randy Dunlap:
>> Fix section mismatch warning in parisc-agp:

Thanks Randy!

> Too late ;)
>
> https://lore.kernel.org/linux-parisc/20211126154754.263487-1-deller@gmx.=
de/

Being late doesn't matter!
I'm really happy about all patches which are sent in for parisc and in the=
 past
often I applied the late-sent-in patches instead of mine, simply because t=
he
commit message was much better than mine.

So, patches are always welcome.

Helge
