Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43891B1303E
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 18:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D0310E144;
	Sun, 27 Jul 2025 16:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Tn8Ba/is";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1872 seconds by postgrey-1.36 at gabe;
 Sun, 27 Jul 2025 16:06:44 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E88910E144
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1753632395; x=1754237195; i=deller@gmx.de;
 bh=d21zzX0pNAMMRdXfibiEsSOgxH3t+4CXsQmufDnPi1U=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Tn8Ba/isq6Yv7PulLbom/BmDbiRM2DFEcsRFV9T8bdBHX7JW3uoVFlu2pkYtn6jv
 5V39dkjvBotEpBf1758GVmvLDWWcz9xZDTbNPHqWUe5ZxKZpWfwr6edsQ3PdQVdS4
 izjugs20iuKDpJZsqTVagGK/bsagso9GjaggLODz7VbqYYQKuksxrcEGeJ6FW79Lb
 Jh5cdPNk3XYkuDNJ37eD5x6nMjofKIyl1T3I7t/zAfgYu4VLCDjyANJwlF+7TuQit
 84weye0XEJuC4gGwB1qvOMh9ceK00DDeEw+bu+cFZuWUfhzfjrVLAzEbvrVkgra5H
 /RlvZo5YykrpkJesSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.22]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72sJ-1ulI1c0703-0041yA; Sun, 27
 Jul 2025 18:06:35 +0200
Message-ID: <aab3d187-9204-4908-afc8-2a7347b93006@gmx.de>
Date: Sun, 27 Jul 2025 19:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] fbdev: kyro: Convert to managed device resources
To: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>, tzimmermann@suse.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250709095354.931589-1-giovanni.disanti.lkl@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250709095354.931589-1-giovanni.disanti.lkl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FPweNK/F0zSfOcMa2I8iQ6YznyiKRBWSvHEItDunwZs44bGt4fk
 KzZYNErO4bSTlNY4lF1C+UcmbAAQKMqHcWOeWM6PSdQfpeFijJGfrDXA0Jmk/T1lixg1o/u
 HkISb64da/SRHHpWOaTxCY5rSCEmylaRK8uGf0mwDQ+fP7Dkv4WJTqDxPyLblyBz3CPmPR1
 ekv13Z8W9rGGFxL4TZ2XA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QZP/4pRALJY=;ChorN1+C3vgmYdd3rwdr3Cl2SS/
 8Bze5RoV/mAKuZ7QAnoEQg907t6PrLHVETKEiavR9cjjcnbN14+sU1Av7HXUGdii0FtKoSrsr
 VefhFLA7E+axMbbJjao6h6kmgbPN5Gob9GhDd6CzEOkvxtq/8EdbRNky7n8XHKV9lGwnBcsyZ
 YltDI6jrMkdzUopJ3WSjGwSyX7hbAHaLs8dmQabJ6NxRAq6kYvhOh/+MzBJ27cbPYHM9CoOo4
 BVceR/4CMQp8BSPPiRYXTwLZZvTk3Mdf/GWTR6fjH4Mq7WJ+22+F0qBzG6wbCrZBiCJVZOeNZ
 aXMXLpRF51V84I5Je29AHtezDP7Zfz/RI18E8QcQkaPu6XxAC04TWHbl3ongpSIdn/fn3fFXx
 3at+IeSmihu1oxFn+9FgI7F/cbY49bUy0z5+kmKGj5xct94TroGQk7lBpM4iwCl54US5Wj4uo
 9Yh/TEaKTgAzxEVCdnqNaFO9og+8nXQEjVsjQLNCTzj6OLw2qEL34EcAXK7ueh6gwhORMmEzf
 cjiq2t88SVb5HLhFqbdhRQJuKhYn8ryykl/C+3PEjB1Q7o+MVn1wblXnxznHC6pH4Ga+vJTvS
 qZONVZ3SXH33aD3KaBoxvVTulcXx5dSBbr4na5/ZiPbzPyq010qhII+E1KKbfCLS5JYpc7m7q
 PA/zx2G8KNnN2yc4BKP6zOOgVLA8EexgbDZ4k7v5YN9LStmja77mB8GPgEtBaVy/o7XLaQaJ5
 7QC4YnSZ+ye5EnGm1hYD1amS6TzZ9z5CmkeNfXB6xhJ/oomfNV10E1/Le5F/Oet/H/DvfkW+f
 DAblsvHryoHqTADMXr5IkBVEVKfEuFkbKR2hQDxYT3yfPjxi+A5+ko0SZMYYc7JUVEK8x53pl
 kUy4hOk3AHVujjQo/m7DEPsAAWC7b51qEx0F534b5bwsH+KMciw1U2Qp/pOHdOHa1kEfmg4+Q
 yqEaEuHpMeHZz18XzJ+a/Bi7mCas42/fx8JxWhpuCDRQ33eGXDo52xvFMBlnk2x6XXdhBTQs5
 yQeP6WZzGHkfUkGHydqixWnYb1H5eXax2lhU7Eo9CvpMsys5y0dV5/FarhsaEN29s+WQt/SLQ
 1H1vFx5yjinMhkwXMCIIQw4QBAJivJzdCz8fZccsta7VfcyojvojACKE8s8uTj7q5LLhejdpi
 PPybB9/fJYj4uiySVAz6NsHuXNqFMai0wHa1Junl9oSxns0nEj86LhqrgRPBfV1OqmFeUAmVt
 AuKae2xDCznauL67DmBtJ7LczyamtVQgPLUU8CzBk0yJY+PkyC0I2LFMjkblCkDkF4pYPWvoM
 PDP31vYX5d/LOQ85+PZbIzT+Bx4zfk4oKXzExBvA9J2DimdQqZ69XfHfCX0xctSlIsi3G0Q1P
 8298AWvzt8DDi75r+dybKW6dCjPF8i7kBnMDcNUjy1f5avNUBUsP99fN2deDP2kXVzu+bIQva
 hcdvi7vPcRInUwXEOnALUcYzhl4ESo+WsQ9k8xnai4/y40ymtaoDkS9zTVDmi/Cx6PD0cun+5
 dm9Vi1yJKXgDMoNsow+nfLfi3n1eqoWB2BHl26GTvsoEwZDfftxEky4QtvgLDr0KMrpjNJAYW
 cFWanIctM0y/iZ+2rV/agSPpwTNzpzj6f9DYM6OI6NFi3uoENkTP1dq+Im2uSExB9GNvXbUcl
 AJtaS7nCeEmmM8f+6OFkfm7l42EtLPbE/UvloTSTxLwdg7zbf/N3QOpLSKi6qcLNh/02v1ayj
 Ut7ZpN4jvX6+sPKNvxNwMcInU4tYxTepald2BxANcJ4sE7NqtrA8Amrf0uA+APiNs745Yui3O
 dDXVTP5uGqmRzvF+lEw/lgyt6rveVU+aGFF9XAtlFhnhybnY+dHVCcI0zaQ7jVJOyDcgqopxx
 Pw5o6Oazyw9wuNDXVsMqXT8WraiLoDtE7iKS36BY0EsM/Hi6eMdIwUpnEhsmFx6kdDvqBS8ku
 /XygxcaR6fYownIac3gIGhs/VOYovmtGKyV7VOkUBMKbv/uXx2rB4VWC0MJCyu7yiMSY56Xns
 y+VP5TYaMNVd+ePUWPXtgT/ltFoeXi3SGZnIIDqYEthJwCoERNZ9NE0JSfPhtC8JLHmZWjQLs
 8Pe3eOByOsGrhBKwcoAIpNh5T5FKNJP1xmrqYKvGx5lzDbOeZ+QePTOYa4ncdKDb4+uRSDrpf
 2HC5No73VNd93ofCceUf2eCvRDNXKZm2UoB14frKy2Ti9XsxvQrDbIeKfg8xvzkNPq+L6noRT
 YEoGA82g+iGPkE803Wd+Pt6ZX8BVAKjzKD2rPxqtHEV0WFJgggLRu5KeEBY828MFNws+aocE1
 /0uzZDlCzZmbxyHexPaUuZmIA0q8EodmXlQKUhsAvPDUgjC28r/YiD6hDxyrr61rtLmSJbLt9
 veE6z1OrAtU+Qk9YmHzoFw85W4mbUA5B/vBbrT925K3DUpxffmiqbDOcNejSfIBRERXJnzIT6
 JnBoyevi0UYNuD5wM6+oacw4w4uhTkBZn/GlBQXQ7xvoZOlsIFaSOhpRHpQquNbU610yO68xZ
 IQ0szGbybN6tZWsDhhA0N2YmM/W1UzYG0t5cgXV+LRtCWmFLtF4KKAb9QM/W3XhjRwEoT1kdL
 4HU9BgT2xiwbZLjUEdzKN3CebObHVuFQk3Wwj5UU11OeFOJAuJvWBotA7rZUbdXWKqZW/1QC5
 VxDClIogRFZqtitWCrGmYt8d1PQULXQpR7WviK2DjB5+mdTcIdJ0w+ha5dEtQ+eTlSA73PggJ
 x/W8IKQ8lxpXmQHHikzb2/FasJkNzmBUh5YCC/NFFHif6slcY4mSQN2H+xXnBLnEL10FRikrw
 LWhH8RtgkUamCzJDL9shQspYvroF3i4pB0UAhquLM/Lj7fSxygaUMi/+ruLrlkFt53USdT+8u
 B/BbKkwtAfscuHeRNNylpeGPkbe+dkEcw75krc/FsHE9UbBrDojOvBiQnsNa7fhdE1ud3f6fv
 pNgwkZpwUM4mnHPLnLv2WDCxzP/uxpY0w1chKWEXLkC84VZgO0DA7M+0CjO5g1neT+VBFo82d
 MAGpDKmYbqcEfBVUV/2aDC+z/vX/DaOS0cI5lnT797pG22LOfM8DARhPi5rX3hXmI+DJLcPBr
 xeTSN8az15D7dwWqv8UCAI9gXoTSAOpHGizOEj0VQxUrqAVADPITpPOJE6dOg+M+mg4mD89x6
 8uzbFGFi3iZIlo5GK+qakW/kjfAzxCEyxoF3Z9B4Zu9IY3+Le8Gfl3rML56efAWBrLpJRGDvA
 6IByeGfHjwGLlpmyjV03khUTbdqYUhkkt1gr5tnscYX6VrjUAA/aPcIrb0telkvJEL5KPLh2P
 iCRjQCKMXdG8+qJooSW+UA3YRyjrMD01evnqKdOsEqzY9klW4Sq/1hZ3YTPky+SKNu4a6kutR
 XS4XX7uQGN1FV0m1b4apM4sVPu93kv4vaUFLp+gAsEZdYEJw3sVrY7jcxwH2gsAHRdsOcdbjc
 xLpvosJC8NDkB1tz4673Cu1zy4YKHQzw=
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

On 7/9/25 11:53, Giovanni Di Santi wrote:
> This series aims to address the TODO item "Request memory regions in all
> fbdev drivers" from Documentation/gpu/todo.rst.
> Additionally, it also converts the kyro framebuffer driver to use manage=
d device
> functions.
>=20
> In summary, it converts the driver to use:
> 1. Managed PCI device enable and region request functions
> 2. Managed ioremap for MMIO registers
> 3. Managed ioremap_wc for screen memory
>=20
> This simplifies error handling and removes the need for manual cleanup
> in the remove function.
>=20
> Changes in v3:
> - Split into a patch series as suggested by Thomas Zimmermann [1]
> - Convert ioremap calls to devm_ variants
>=20
> Changes in v2:
> - Use pcim_enable_device() instead of pci_enable_device()
> - Use pcim_request_all_regions() instead of pci_request_regions()
> - Removed manual cleanup code as it's now automatic
>=20
> [1] https://lore.kernel.org/lkml/fd6403d7-93f4-4fa4-ad0d-3ab91cba8183@su=
se.de/
>=20
> Giovanni Di Santi (3):
>    fbdev: kyro: Add missing PCI memory region request
>    fbdev: kyro: Use devm_ioremap() for mmio registers
>    fbdev: kyro: Use devm_ioremap_wc() for screen mem
>=20
>   drivers/video/fbdev/kyro/fbdev.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

series applied to fbdev git tree.

Thanks!
Helge
