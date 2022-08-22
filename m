Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065B159C9AD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA038F97F;
	Mon, 22 Aug 2022 20:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E51994C0F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661199123;
 bh=Yr61DvE6j42KsMElufQGNSb79h22pZ+ZKTYiKvo0h3E=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZOXSbnMYN4szxajuG1iqeEVq1Okl5avFp794xqc9o1qMoThXRYsmgHG7Oq2A9b2Nx
 2d0p3epqapdTgDLt3lFtb2OUGx/Yjo9ioUIgIky+8ApIhoEayXXKYLd1Qn5JChxaH4
 BeTYLHA/++pQWLLwZ/AuCX3HYD2PbpEllTmJ3WLA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.190.222]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17UQ-1pREZF0zjG-012avd; Mon, 22
 Aug 2022 22:12:03 +0200
Message-ID: <b3c19a63-d9f8-028b-e59a-e428be1ed8be@gmx.de>
Date: Mon, 22 Aug 2022 22:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH -next] video: fbdev: chipsfb: add missing
 pci_disable_device() in chipsfb_pci_init()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20220819085752.1909541-1-yangyingliang@huawei.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220819085752.1909541-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iaJIJz9NwvfVUJgq3SuvteaGHMXdzmZFQ9lfmtKPDYvfREYcfas
 /M0rcTAP77PhKqc8UzkQyUQIwI+6i23y2lfeOK8n7iPfFdzrhIyAspwjm4AbwNKcGYLahC/
 CZhzRxdCNueumKvqKSYGXUPdyOE5kPzdg1oNdRXiM78urVk1r7/xVU2vetAEyRzSJSJ44zl
 0nkI60gpC5IjTSsJXdrEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:x6bOX75q4ds=:JnQwJlHAqjEpfC6l5T7/lD
 +aN2YBGR1An0UL1f/A10sJbh1ssBOZlFNc++tdxaJir4SjDOzoZMg0ay7FrkrbJfDiFFqqx4R
 q+Jyy/uAkdfdKCwQDHM4jgaCM8Tm5ivnRKG04KYPc5e41sKaka46j27QY6NFqor2jKfR3xHn4
 ebksuNkV9QBZfPGk/GrsmxqkdAhnT09Xyr0naowISC61sx0Ui8V2+9Xh5sZrZFpLqAYsbZCQ7
 Ds+N3Ac+lpIPpvs5J7qu3x+hfgTrc85nViqQ+qZ+wlC0SZ5LKbMdFbMIaSZzO0i2RNBtQQabq
 TvyyCezDgR0IL4Wc16Pi7BiDqhwpsXo/FCZ0bDVC8zvLOFDJCtxBPBkmktD6wYIHK0t+hcack
 hVE7ztN/Xt/22hoa8i2g7oHAeeoLnfRkBG3b2PGm85tHicRutTG/Sr3S5lBI6I0cTqsXK8idI
 z/0YICkVVzDkLyeRzNZRtwYrHY2OMNKydjZF1oW2Q0IAO+XANI9pBI82J1ovLziY4rk+U7R2M
 Z5zKagGbc0Ua4fVCBr9v6tEPA/J7kyoZcgVSTPuiyrRj0T+nxOkXAqIbwjrxX+lTV6lWs4KSL
 DM60CTiomIOApJD8KwRWkeuIPKBg15XrqUsPbZ5B0bdUFtg/DudJj9J/1J9N1wyYGJjRQfhIf
 d+Y4Ks9ymG7TSMRkJ85v4py0hbXKIQ+ujuAIqRpZL9eXKHcn2NAfrgDHZUNwUll+UeAGE70pQ
 0ughzFXEJLc0zpv5dqfew52+NDdu2BPKUmEszaXNaWvqPN3TKkuS15bUhbDSL0b1UvDHNciKi
 6rd3VzvREdvxvSauj9aWqvXWCbHeLl6ZXR9xxuV8rCpzQ1FSUsE/BfHt/dnnWlSNQXMAu+OaA
 wtbTUYPU9Th2XxmPJLyp/LI6HVWUNOnVCJm2EIfNP2RNXOkUJXp6h0JJOazXCSi3ueEVg+vk1
 28yrFxPL4Dhh2Piw7+lRDjqDBIxyjWu0tv/f6tpC5dQ0V03FPLYJBbwhsnwkrc95gvqC4aU8w
 xUd/nn/snTXaKznoudO+uthB/mn2RvAt0Kk4iVDPfiLgPu6BdJV6rbM5NRh0xIuHF8wifa4w6
 5J30C7iAiCGZjvgZrJbftLQoFYIR1k/+rRoEshTC76u5yfVlOtM1xsjYw==
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
Cc: mpe@ellerman.id.au, christophe.leroy@csgroup.eu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/19/22 10:57, Yang Yingliang wrote:
> Add missing pci_disable_device() in error path in chipsfb_pci_init().
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

applied.
Thanks!
Helge

> ---
>  drivers/video/fbdev/chipsfb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb=
.c
> index 393894af26f8..2b00a9d554fc 100644
> --- a/drivers/video/fbdev/chipsfb.c
> +++ b/drivers/video/fbdev/chipsfb.c
> @@ -430,6 +430,7 @@ static int chipsfb_pci_init(struct pci_dev *dp, cons=
t struct pci_device_id *ent)
>   err_release_fb:
>  	framebuffer_release(p);
>   err_disable:
> +	pci_disable_device(dp);
>   err_out:
>  	return rc;
>  }

