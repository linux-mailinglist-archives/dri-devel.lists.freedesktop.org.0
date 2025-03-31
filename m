Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A81BA76C30
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 18:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACADE10E468;
	Mon, 31 Mar 2025 16:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="O9NZqgw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2723810E492
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1743439715; x=1744044515; i=markus.elfring@web.de;
 bh=l3A6fQIul5oJ7bHGs/rref7U3MM7aEcG6y1nK2fWykA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=O9NZqgw5yW9GeUqgjwQlMS9oxelL12j90TxTCo5mnaoYIjBMJeMuDgHQ0sfWd0u0
 Y+97FrOdVeupna5JIfhAZERtZPrWcoKWbtcjGPq6EZ8Grp65ZXiSnn1FkvP2V6BjL
 aoBr3pOfNRzdnWqAl784BKScmEvecRWk+tEkeRtaUSmtxiMMPW2Ap0Qo1qsqMPSGq
 D1Fg6d8A26b/4xHFp6ZEmERy1j5NGb6CxI/kkYM3Y+rL9p+qo1Wt9UwxWp6NU1xrg
 0kHs6ChcsBeQ8zSRFeSnApFiujwEMyjNiEO01NNRC7YLd7aJ4RkJfi4GObXckJu1p
 EWLg19OotDCInxLf6Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MMpCg-1tiipj1JnY-00J5yj; Mon, 31
 Mar 2025 18:48:35 +0200
Message-ID: <17c07117-36a6-4fab-aca8-a4cd3a67f2b0@web.de>
Date: Mon, 31 Mar 2025 18:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Daniel Thompson
 <danielt@kernel.org>, Helge Deller <deller@gmx.de>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>
References: <20250331141654.12624-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v2] backlight: pm8941: Add NULL check in wled_configure()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250331141654.12624-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AUWM+maq9tcBe/mWR8Zs3MqF4GCROi9IeCzUazeKrnvu7/KZwiS
 B7w/0xy7fGgnHZeTmSR0izEvnTM87cKipZJH1hDCYYlETKm0L4XWgBc/6qvJVUULDd8Xevj
 jJNnE3mywQWpSHiB9dpdbKf+qjZPsdiAWri59QhikoWKKB8jDdwBunLWS8Z/c7jqFzjVFyP
 UGAkHZbALjniQ97VQk3+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SRCcPfgiUNY=;B3BVqxG5bQIJ3u5mi+9dPYWODkM
 442p39lLFzdEzjToNBAEbeoEOWnAbebT2S3tFK1QOSu5NHIEbBVqPPvFdJhdcmSzUo88rpMge
 Yg0nW4D1PeupO2BLVI9RJ6KL9eBpd4HvAKA7L9x4hWnChyxkWVNDh49VUm4TTVcv4ueeqXWdb
 mMWFsEt8YM5VXDY+PF+A+O9oD0E5GJv6T5/iNcP0iPr3cnq984uZzeP44SMlgtk1ArMMmI2ts
 vyCRAGPidFpsemML6+y0M+PUpL/lM4YaIZxJ4EiIkaF9B2KCCm55k2aUP5XHPsRX/NmlcMqZ0
 dXgJ9NOvLklTQQW3LdHinnQYYrSZu0nB7HIqvjDE4XtGSKJJo4x7/qsAp4NoL0hEExPqDcIhS
 wZFgh4yZ26lDl48FJ6kIV8olc/tVCcerkiIP/KrPfW+vIScTgcVxGlyFgRhSIooHfOn3f8eFJ
 QFQwFZXf/o17L8cNoePthvOE2+rPOLR0dOeO9VGpZE1fQUn8Q13TDd0ofPphYSXppI5wu/UuU
 m+3Dc/wOKwo8/qY6LQnqfHaFdqg6nmnLfoBGAcGY64QC/qfwCeusZM9VTDUwqryYgUyTW9sO8
 U5ElzEROkAW5H2syZYg2jbHlMeH0jmEGZNCh7MNmwnqLNdmAADgzjXdoh4Zw/GU6S0C1bCzOy
 0PBmU1/Of2cMm8pSM2JamnWRi+nKJh1oowmSmpzEmM71lKuBXxRbqoJ+O8Wf2Plq65TIVS4sW
 ioKIAc4tJ4dEK2IiO//QIMkQiYj78e1sTF9p9/54MnMaQVZwGcukt2/rvbnb00ypPuP74wR1C
 8md3fBM2w1Xv9XrFIIaR3pR5Ci9EZ7xymJAYUO9VFZXnXtpJT5BJikLlKas1pSHRELS5e9+d9
 mN8BB1+T244GT0jt2VfcM+vrc6nLGgnhq/I+e2zm3SW52jf5m/Cm0XuVwxqi3l0TX2H8Karj/
 pE6iTtOC607bjcRMgktoSW4YVWacHT3sKG1ylRWPSMIDIwVRviBdRmvIIp9tSVJIE95tYO7vd
 WZGFA2wATnIb9FZ4NwpxQoJc4NKta1hZcXfSywm2psBEAXXMzHHwCpAzzsaTsQ0CEkmCd6cTp
 JA32EdpeGR4MqtNIzr8LmgUjQj0adW0978zf8H7DC2io5zvPXIZkNOcMxuJq0M3LFbGF6jPlZ
 EF0H4z0YjA15hfM+V5JdBs/HjceUaJ3q70IRgohYYo8ip9uXwRkhm2FDA4kiPJtoP+RVY4K9p
 XbND0ATjLLzNH/T3rZengQyIXGVe+lfXpv1YJplXwo9uO5O4x2zRPE8AwPGD6XaUBhceeR6YG
 dmOghn6ZqQXjmSckDFdoRxVJN0TQCi/YPUxXi7XgZb1dZlKhdCTpn/DXT0PG/kbII+t33mIrJ
 cGllZ2Mi2bv7Y8seAHnOOTSam5+bQeV2oZ16QVfFUu/9rqqHcvOwoLeDwR6wyH1bXkg5sjJ9u
 YbarsZly/fYC9XWexUJu06i0yzPWjRfit0h2Pqvd/Sv2nPLY6
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

> devm_kasprintf() return NULL if memory allocation fails. Currently,

                 call?                               failed?


> wled_configure() does not check for this case, leading to a possible NUL=
L
> pointer dereference.

You may omit the word =E2=80=9Cpossible=E2=80=9D in such a change descript=
ion.
(Would questionable data processing happen in other function implementatio=
ns?)


> Add NULL check after devm_kasprintf() to prevent this issue.

Do you complete the error/exception handling also with the statement =E2=
=80=9Creturn -ENOMEM;=E2=80=9D?

Regards,
Markus
