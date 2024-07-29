Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672BE93EEF0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 09:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09C110E1FD;
	Mon, 29 Jul 2024 07:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="kjv8p/go";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E103A10E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 07:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1722239327; x=1722844127; i=markus.elfring@web.de;
 bh=3dLNP6ha5L8O6bnFV3P1s/tNTDR77O8ngc2Z3LIdL5M=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kjv8p/goYjNyWD65H5F25SISxM9y/D49LA4z5+CY0fcTPOWoPHFfgid+uLTnFtzN
 QrTRds5FdYF3Hv0ANHjJfZY52GSrVomdjTr8SuHMrAY+WAWgV7huEGQX7geY270/8
 f0gffgqJsOheq0ObrTUa528+jeaI09h8zHtzsrYbDomNQB0yzppcAi7jPzm6pwOa0
 NvMo11vNgf75qczkPY3B3UUbhq8WfbHl+lufwRSnpy2ubgm0Yhp2GlHgbSiHQCv/G
 79YznWq84XDlqHZCdfdpAo0nqlcbV6JxLeDHgTh/wVES5T7I42KFvO3vM+cmz+SaC
 tnfxtZ43ZEcwwFOBXg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7gXQ-1sBuiz3REw-0153pK; Mon, 29
 Jul 2024 09:48:47 +0200
Message-ID: <439e8600-91ef-4c48-8d5d-f02a497718c4@web.de>
Date: Mon, 29 Jul 2024 09:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/loongson: Add dummy gpu driver as a
 subcomponent
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240728152858.346211-1-sui.jingfeng@linux.dev>
 <20240728152858.346211-3-sui.jingfeng@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240728152858.346211-3-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DwFf8raUcUPakBgYkEZ+Z0vYtFpYB9XQZqXPfzuXX9SQlG0bSwj
 B/ay3HNglCy9UCqpGRbZz29AeJT5NcnhwlyTGUMUDUx2ZkxZ/P4yfbCApSz+3c9PMN3oymI
 A01YRd4EhsZ3hRsQVEcb5qFGCcRNNvPvxDGUMuctioORxXk5rDdBsKhldMN7sFF3Fb50fqi
 3CHQPG70gH2yS93s/W1Yw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:k8BcT9I67pU=;hgr4dPf7d473opHP9W3cu+dMEq4
 DjiIkqCSYVI6xTaYBbntODw2f4NxoqEBhl2xFaqg8XvZ/4ldW0vdbXLZxmzhg4AgJ8a3sN7Mm
 HlwgDxOi9c+uIMLXKDq0sd08t9QeE/4kB8MMDco5J//JWpRukBIkrW6UdRAolu5Ic/snxkCSD
 abwhIfFHwqUqOYkSYQ5S7ujMnnxWQ/oQudtBRUbWxLW3N/DB1tSav7U30SnxNx+IDVdsFoqOu
 Vfmznw02ZmdsY7D+EMWZrlzyiU1Lf4a0hQ3uSKyV7gidaw0XVLmIwe843bKO0kJaC/Is5SvAZ
 ww/Trww2NYJ1VJgErNcbcKFcFp/1JnENn97k7v8TixNBIGo75VPMDetD1GQdm6JDTZYyi1dgl
 Mfpv+4g7Un13jZIDHcs86y/1EPFDHDFAktQZWhdtVQCOlvLrTh6eYkHWhsfPe3kRX/hzo+d+8
 psJ58/iq17ZcS4bRjLcv4YmKU2uz/iZefER8phA1Gbu9W5sMZWSNWIOWJhgTb+qiEIXc52NaF
 kox/KA8YldML/plCLLQ7BpwFH9psNzmJlDMKDtadV4fZHw3Teyn5YLDRw7AJsNb1DTYZiD3LS
 297O2guBLwGtIreaIAjpBm+FSTD9Y0GTd9icZBLVou4Gy1Jck64tfvgsAPmtXLNjGr+lE2tAf
 QzxbkCXPOU95QuO0VZO9keW8UFh01yujj1ctbU1eZJj1VdSt4N7AJCbQ7m5yifeS705/ODFs7
 V8mOMVJyFLPzDgF9QRwUvoa+H7Rxj7wERnJZCjy2l7vRJRTCB8IJIj06yefTcr+f+P8CwfcTE
 53JPTCwBSXmmY5V7kz/ENQew==
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
> +++ b/drivers/gpu/drm/loongson/Makefile
> @@ -17,6 +17,9 @@ loongson-y :=3D \
>  	lsdc_probe.o \
>  	lsdc_ttm.o
>
> +loongson-y +=3D \
> +	loonggpu_pci_drv.o
> +
>  loongson-y +=3D loongson_device.o \
=E2=80=A6

Why do you propose to adjust the macro contents multiple times here?
(Can it be sufficient to specify the desired file dependencies directly?)

Regards,
Markus
