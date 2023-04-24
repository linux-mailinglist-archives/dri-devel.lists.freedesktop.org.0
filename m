Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B48A6EC936
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 11:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C50A10E43F;
	Mon, 24 Apr 2023 09:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCAD10E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1682329429; i=deller@gmx.de;
 bh=FHjYBg4NiAOiwz2WyLL8oych2ductNrKsA7W77JnpvY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=fI/x9hKE8J/nrtLbh0AvQAHxcyTyCKmPFoEwfLiantaRQ+lRbnj/8zSJCBiZjOUMP
 DuRZnHHmLFiB2LXxCkDDm0lD/3SG+nzf06WObmafSFTCxTGhlSUJ9+fG3R+aQe7JRk
 uqF4PdjS394lFaY16k7DJ9L4gMR2JnGEt80UuH7/xmHAP6jo6X5Xw8S4RdejVANwQQ
 A0QK5p9GU3vc5rOtR8+VuKQJBN8sg67PH4dpWpfmD1gkn/P/BfHYLCd2dUXdWBEL5O
 VBtY/MNLNWaNNv9fFW7pqSxVt/HDVdS33P36BaZ/A4a6PjITXiyOazOR+aqcPMGhkH
 oks1hKbTwKm+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.153.242]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9Bu-1qboPL3G6Q-00oHvR; Mon, 24
 Apr 2023 11:43:49 +0200
Message-ID: <8027fd8f-6e99-aae7-85a1-3be4c9fac8a0@gmx.de>
Date: Mon, 24 Apr 2023 11:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/3] fbdev: Set missing owner fields in fb_ops
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, geert@linux-m68k.org
References: <20230424085825.18287-1-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230424085825.18287-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:43f3kKWCK86xmG24dJC4dDpRYwSwsqvLizGYnCgPkKnX1Sb4VLQ
 iMOlKOWhPrx1piaDxup49hJej0rDnfB59oa08xyxTbuxuIkoP6aJj3VQQd+p5KteZpouVOx
 3WDisypXG6Rua3Soolst+8QjhMSWXWUrM9hiplejTPf/2IUWgOgsQ7cq86sYKe7K8uUk0ce
 Ip0fwALjlYjbr5r+0F5RQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1WWx4g9Ba3M=;bwBSUAj+ZXwoKoEmLNzkH2p6dzv
 TuleNe3F64OudF81OhNYHB6wpej9TYJPm6oML7hNpoj/HaTapwkLb3AgfO6b+MLU9Kvu8s5Ev
 1J9/liOcr73nu6JD36kyMP5/GtP1omrL9FQcDjTdmD/rMGAlURV9LEMGUbKllkrYYctchG6xk
 +yNbMyLT/hBLeCsuhyvMVOYgblRzq550esbgvl4HheG8YWb78NR8FB3yP8W7ko2BNY2LG+pL1
 ai9J3mAqOTns2WLN8Oi5+24iznNZMEqVQTMydLVV+ZnfFsI/zvy+fc5QDPaq0wB7/90wB7hkP
 kNGPo2ii4XJy1BEAp5Cxb70NWbVTKveMGGVwRSJg0qdmxwZz1VXjo7o9BeNXt5AF68FnPpaXE
 4jBKrId/dcgJJ9fVQ2rYya4AWYB67GITH3vUBwfFXQouyTDJFZh8tqba7cAxADzOADP/GVMC5
 fj9iuH7E1wGlq6mZneKuQ9m2FNu3ryvzT3SSc28biaATpzK8hpzBKcTRD76H7NyavbOOQmI7s
 v628RfbstuNW9q+sB3bmEgaaFmocRQERL2o5NbnLVzoam3MXyAS9J3kF1dWH5MW60uRMVxjXo
 7N81mN5s+C5EEUi7/JRJXmB41+bW4Agz3o6q27QYQ8AZYRCZ13HYo1EdK3wsIZFsmgLRGxULE
 BjE1pj/5uJXUEd0aIRTv1pPb9j+UobcZVOt45AWTx+MoN9qpw24tOO0+L8U4ugAozGI/yTrB9
 1vuw4mbXKv/KbOiKezQwuTCL85nRwwPNcn0tmuVnrii7iS97Nq0Xcs6eVHzmv1dZ+WeEo23hm
 vNWNYqrceYDF3FzCXZL0eAgFDQhZm86ZNHTTXxAj013EBL4YDoDodnx2ugIM2v3Nrula2HOcc
 EUwwATy4V56ZssoHRLCM1Ix13+bJUk4hYujdUwoIu/GYjeebMp8Q2i4CDjlKbeh+JUSgLqSRI
 u6zsqGIztDPJNR4SRmhhZC9ZlYQ=
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/24/23 10:58, Thomas Zimmermann wrote:
> Set the owner field of various drivers' fb_ops instance. The
> setting is required by fbcon, which acquires a reference on the
> fbdev driver's module. Otherwise, users could attempt to unload
> the module while it's still in use.
>
> Thomas Zimmermann (3):
>    fbdev/68328fb: Init owner field of struct fb_ops
>    fbdev/ps3fb: Init owner field of struct fb_ops
>    fbdev/vfb: Init owner field of struct fb_ops
>
>   drivers/video/fbdev/68328fb.c | 1 +
>   drivers/video/fbdev/ps3fb.c   | 1 +
>   drivers/video/fbdev/vfb.c     | 1 +
>   3 files changed, 3 insertions(+)
>

Series applied.

Thank you!
Helge
