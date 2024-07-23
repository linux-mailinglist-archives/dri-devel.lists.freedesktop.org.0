Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F47693A7C3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 21:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF79710E191;
	Tue, 23 Jul 2024 19:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="XlBep9ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDD910E191
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 19:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1721764066; x=1722368866; i=markus.elfring@web.de;
 bh=/DlLWB2Hi8qg00Gcs+GhwwxplxmqxKt2SOLUkNJ2Jf0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=XlBep9ipTOVtvILAo5sGcLrF4x9FILgxzGeHxYPKdRgHUhrZZcbkSXryFwLI8c90
 Dzx6nZN6phJWS+FyzhW8HnIqvfnENwRI9lKmakXWmjAOAouSl2wc8Bd2Tm31WydyT
 dmrlI7z6bQEUqlNJXfV0Y57kqgXuHyJmmsy0hWW/wrKS9fhUX4u8rvO4VICTXhldr
 qExThizW6T9dTJgYfq4Ior+lmTADyL2ASKJlfDvCb4w9vI5QlAoBTYWwIkmoq8tV4
 /HueSvGbSxm5bH+CQRviBSU0I0NCfxwBGnBXlw5FyY44F+wQBjLDQznGKY5707Txw
 1mhRuQ82w08ElCY9iw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MODiN-1sutgp1uhN-00Nz1V; Tue, 23
 Jul 2024 21:47:46 +0200
Message-ID: <5d2c6818-ed05-4e89-9405-859af5f3ede9@web.de>
Date: Tue, 23 Jul 2024 21:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/1] drm/loongson: Introduce component framework support
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240723183436.216670-1-sui.jingfeng@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240723183436.216670-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zi2dm3AwXyUPaRu3uzc/eWVXzSxbBhQH3Q9FWetpLiBu40som/F
 KomC+HH1opSplbkNM7rjlPJfjop0gIMSV1tO7Z5wRJpLj6esQLpEQwYZtJtnQqGfozfSOMY
 74IAJI1/fJDqz1pMLuiqZ5wvtRruxJHy4hTJfk1+kcv3jB1OJFQUFxcSQ/+ACKycmT4PAr8
 aRCipQ7z/wdbMiH82EgoA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W8ntKnAQjxw=;pxlaryYF1akGHYlc4KvPIkDIS80
 hfPb20gWE8TaUqi1oQzGQVafxaeeWX/C8M9crjh7XLLXwxzsbSC4A8sUdURIGdbJM/qmHjcVv
 009rsNprDN+i+qZ3jm8GSLpSzL9D/4f7vzjN0f7XNcXaCn2VHtyjqRjTj3HXkLJ1tDlz5Alym
 yGal4xR/+aFDeBPajN6cg52xfDvD7qKt1mfNodoXqnNR7fE0UrCwd0Tadg4stwe8rI2EyRowt
 ZQuVOIFg0I3D+dSBx7UcjTgN0mK2yOdDP1JSX+5H+7fL3AAghLIbXBj6vAK5oZjVWhFr1mATS
 5Q8uXfHFVEFsI5zm2nVJqYQg076pU5kx0rrI6XBl84Gif8MDpEglBFCNXSuVfRYyn3m1u20+e
 PX/uaCF2ptHhyT0GwcyfCEaNg8J0OUq2lDyDGtwb/SFJDj+hw6aTnXIJzxuy/LqW2wOeXg3Zx
 nBPtLEflkWCcl6PrnlR5FQF+mGFebMQx33XXginNq8hri3jf4oXp/QzdmVDuPFUgGLpL0xJVg
 j2TgyWIuda6egU0HWR76balP/bIPEmEI0cvWwCQLsWlYTwbhU3e8hIAqWyDW7vre72kLp0Um7
 ADXHGFwtCpBjyVP0HfDhlZVL4K9r+j11zpVDPPx+0O8fNpaymNimXUOSWNwyYjas/yQtq4hWf
 Rb10gBcHPOCtnH6ZwdAMbKIyr/N/UM6R0zO+J2BCrJ4Uyzmr2nCX7MqydnhGryULDWf4JC3ET
 nEn92YNYf0mmdcHW77p3IC3ydhteHdfnItd7lo6cuIt2NaE1fm+0OkaLEG+R4ttd/HGAPdJg0
 LaSCwePvRKZoEzZHLAiDcIEQ==
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
> v3 -> v4:
> 	* Tiny refinement and clean up.

I suggest to reconsider the need for a cover letter according to a single =
patch.

Regards,
Markus
