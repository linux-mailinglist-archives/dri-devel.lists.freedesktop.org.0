Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57BD937D4B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 22:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE0E10E16A;
	Fri, 19 Jul 2024 20:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="mXBttteO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DB110E16A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 20:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1721421236; x=1722026036; i=markus.elfring@web.de;
 bh=PukH2qFKFXa2q7NpTYxCFyDmx5ddZ3D4vxBVtVFhw7k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=mXBttteOGXocaTLgoIKNri+abgQrTQC76NQSbNfbbkxb1QY4hvrrzB5InVwDoPby
 HkxY9w06hgyGNCBdbkmrKFHnfd/oD/0Xtz8/fnCnErv4Evp2fnuJ0XOdiABL/CMss
 7xmyCAsGJgEXawmSGipm0tmLE95FI+Feru1qyQXl7vq8j+jREe5XiZ/vmHGDzEv2N
 punlbhh3ktZ59jZWA5eRcQOpJf3SvKLLT+S4NGd57V7ZaMfRY8iia3H+SJ9pFskYC
 Cvc27NT5oHDwoZfjUmQnPnmmWzOuENb/1sLeqNvKnwGQGg7iLjZ8aHZ+S+GyRfirl
 Z/px0zY4Cry6Tuh41A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKdHC-1slKBs1r24-00LGh6; Fri, 19
 Jul 2024 22:33:56 +0200
Message-ID: <717a8269-95f5-4aae-913b-0108c6dac70e@web.de>
Date: Fri, 19 Jul 2024 22:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: George Yang <George.Yang@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Min Ma <min.ma@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Max Zhen <max.zhen@amd.com>,
 Sonal Santan <sonal.santan@amd.com>
References: <20240719175128.2257677-2-lizhi.hou@amd.com>
Subject: Re: [PATCH 01/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240719175128.2257677-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kKNMDZqIip+Hff6rrnmybURwGR/5xjlOIrFZOVFzSdr9YobNnSp
 ndqc/GyrDdD2WIe5Ra+7bUTj37meM5oH5US4C64IgmaaBbuBdydxmpcrr/3RIfX1dy2hrr5
 PTUS+rGhNxvJP8dTWYyDcXPcVSlMkgS+Km0pL/YpYR/RnKsXWVwvs4EKjNEkC5gmUABcNaY
 o405sLDzyYUb2fQxwyykA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N1p+GKVthvM=;CWF0JvLNwGvSsJUrVG8Y0AIbpaI
 AxXaeVkr+UndlCWofOfFkYccNcJ0Dhqm7kiPrjUIQ8gOXk2dL6oiJxMv5J7TdiA5BaLRU1Vhe
 MX28HqAMBKi/NfyO/+XKfY2SIRgUP6cVsKcgBkcF5oCu2D7/g5ImJMKPlryjgB6+0HVuWjGa3
 b3i9CaxCUH/oh0RYClr5ngS4g0V4ODYt3yivU/fF0h3JZgnj68eiL3DpAC6C+IT4AjvcfYQUm
 qraW3Z+CrCDflnBIoJQbkeJZie4IBX+5vVGqulFPTdam1Ganogj5+yBxj1mQIMHnDmE9+AqqO
 9Fbt6fr+5fo6rblO0TI4avzOiGfseiJe6JubV0KtkxSTytmvdd9/ISYVr3eaQgTjjuBTDn4UR
 JUgyy0BjeMqZZwVoKx8g1PA6vIkKmN9ibhSDwaFFKo91QmSrRLv6nT0xpBHCHi8TBU/unJjLN
 wcVjrdF1tzPwwNPMH4VmNG8zoGotIg4kVWuy46zhZOPqHJAhYThlW0PTplDlwQpYCmg1OPQIH
 ku/nLOyu4LL1D7JSWkA1SOLTZ6a01b4NYF5QcmmjWG2CdoEkN2pSsT0tzZ/Hn8NKD9zJTfy7q
 RdYBU4yerrol2VPDKygw6BkHz2GYGe53vZm5VC5gBabc65ZJVM5PndiuOvfyOAC1som4gmWGq
 GxmmuKL872Cpq92Xjk4NlGWLd25r6BJdz3Vbwf13MzUTTCGyd4YVV9Ry6NjH15jesFkQ+PAA5
 YMStiw96smBnpf68pmSfFrCNp8hByL8DHpEgNqzIOGqONORW4fdhF0Mc3KJgICQg+X6kEx+sB
 2DABJ130sO8UBt4zdh7D+Mmg==
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

=E2=80=A6
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -0,0 +1,182 @@
=E2=80=A6
> +static int aie2_init(struct amdxdna_dev *xdna)
> +{
=E2=80=A6
> +	release_firmware(fw);
> +	return 0;

I find the following statements more appropriate here
(so that a bit of redundant code can be avoided).

	ret =3D 0;
	goto release_fw;

=E2=80=A6
> +release_fw:
> +	release_firmware(fw);
> +
> +	return ret;
> +}
=E2=80=A6


Regards,
Markus
