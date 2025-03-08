Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529B6A57E8B
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 22:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C0310E185;
	Sat,  8 Mar 2025 21:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="nJLiYOtE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FECA10E185
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 21:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1741469178; x=1742073978; i=deller@gmx.de;
 bh=I3lgknlUNHEVj5zQIxnyrNmsL7ozdFmzN3m8RrWc3IY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=nJLiYOtEuyeBzySCFjZPIrvPJ8eyyEzeD+LS9cW2GNzQQy9DWAiQ5GWnEXcAciQK
 RtefVBGnQ51QiTURxE5t+7taYANYxH5ai87pa2jRiL0EdLwiK2ogN+wb4D0VDSKkk
 WOO//TkWS5XlaoJm3XoMkOLObbF/88VcjsLTZebbPJPWRXmQxpwOa0b5zswsDZTw8
 8npz5rHSFCpl7OJoXH6HSCVlEF4HcVAm+wTmPmeLdoYIfwDJ8Mbqu1lZmGFyJQlS/
 OleETEH98QNg4EXkWplOo6MrL3FPU02037eDLhWbe/saqoO/Utro+9F6iiexq//8F
 l1ug5DjTfW4PZAEY3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjS9C-1tOofA1oKI-00gN93; Sat, 08
 Mar 2025 22:26:18 +0100
Message-ID: <f3e36573-e370-4f70-94d8-7a240d366e60@gmx.de>
Date: Sat, 8 Mar 2025 22:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] video: au1100fb: Move a variable assignment behind
 a null pointer check in au1100fb_setmode()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Antonino Daplas <adaplas@pol.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Yihao Han <hanyihao@vivo.com>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
 <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
 <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C5tFhocLZ9Cyr0RTz7xybHr6k+B+bg56GkUhvUtn2P48DOT9VQ8
 2ilqi6Jqg7GmYQIoh6ClwZDuCRL0WWZRrAQwRbdrxhQK63qFlL0gaG+/f8fia+eaMkXGU9A
 SO80u3O5Y0nmNDYVKqIxLBaNDsnQj/qTO78b5lgcvNSYrAGGCL/JVL0Iktn6ZzL/x1fJkOK
 3ULv/tX0hZkF//Rog+YQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IwnKJ7EsMes=;exxIbdJWGIHqteW1BHQ05ATTbTm
 Edycjeh0/Zqx8anVn1blG014GtWPCy4ni9+8MaZpsG3EFCByj5PALrxy3834xNVV1pfuS5/mH
 OsbyvKQOkAKK6B70B4iKpX/fzzxqFNa2f1xWLbClFUZ+BWG9BxrvF+f2ULHraVwZHpDnqVp1I
 kuG9CwbFfV1IaHRT4R9xPRsnVM30rhA999B2IUZjkW0ZJXvOG92fUwsxVXz5SqDky+jDAtIFC
 nYhzhz5B/rK++zpGQIyrN0Z3JeGIGmWnr+cdnDeYnJ2Xi9eK2wm0JAnPESyQiz20qm2Q9lFue
 CgrHAknrlf1BtyM4yDAUVHI8vFnBDbVEBBhJ++d1oQPlP8Kl42RogXW82euoN4l2xR5xDMSst
 Km4Ik9Ws14OZ6RPJsT4Ikc+uWazxgNXjIy/KiMBj/l9QWzg1UNNldu8p2hjgbe4kgjXf78k4V
 1/QfXZt+1pTu7shmrG/H8T76/KNtTvtsywyOKT4jEUua72oXt1HPC0uva0IyWggKNnjvN6T70
 vZCdwXVdkqn0b343qfYEIwBF3jFOwbfaZGf5oZ0VSmUy8rl+l+lkMCO60+u/r2hZgUlmg271w
 GH9ESdjFrtxV6b/MIpzLLM+2ak1XuUQkWgx20KFr+nVyTIy5k8Lx4tILhyC2QeiZKBMiXOSb2
 KmKa84YUXWTOSupoybYT/EeYlG4M59lbM2qSbN3PNQSJN7aEa7x7KJ0aR4wAUdq2CpxupNMbc
 8T4ckFwnmqRrbansF93YmSpg1MRbRFeA0zhYnsSIBs80YF/p4UNQOfSIk3uGR3pmHw+dvXSJk
 Uuu9SqLgNAG4f0LFESMxJuiDiPpAK4i/n4Z8w/3JxyW3h93jGataM8q1r/jW+1pwFYMr/iUsf
 MSVIVUUbt+RXesDh39rTP44OUKVRTjsy6CEYKPhWUh71+CdtDbvfEEobY2/xjlK9fdwJm6SLd
 C26CC2m6rUggzXJGPjwUjZnLVeO+spzQtgUXx6/1+DQT88XfWosO2xr1MWMkCsTCG7Vss5hR+
 whEqtGaMdmmjLR0cllR9ULfsaLOQJZMk2qSeF4C2mSBKU+vyNyHv+oKi77xvgdAIFKuhwgjMs
 sb7q4KLXboTHuO/W9VYujSwIepUDfhtpx7G+Bwa+vhl14oWULMsJItSBhXkIhpp5c5ade48W9
 9lUPudvOb4kxcDNfNx3sxscnUpxewPrX5hlkrjJcG44aZtCpHJi9w095wFujbLYIU6fIncJdu
 /1AwEWg2sy15FeDzSJ3kDtbk5EI08uhHbPjGgZFvgHaoT1LNP8nAqjP1jxnxn986CFwEK4pym
 OMPBEee1G3BXaYGQ2GoFuwMyUbslE1vhHFWBIlPUg8x0QRA1yJ/mrMn+1Q9YbaCiPjs+TwEkV
 7yUdWbeFWefTABSSzs/QU0yxp6vdqa8+dMdTRkllZCILNeMOQBklkprm3f
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

On 3/3/25 10:19, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sun, Mar 02, 2025 at 07:02:12PM +0100, Markus Elfring wrote:
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Thu, 13 Apr 2023 21:35:36 +0200
>>
>> The address of a data structure member was determined before
>> a corresponding null pointer check in the implementation of
>> the function =E2=80=9Cau1100fb_setmode=E2=80=9D.
>>
>> Thus avoid the risk for undefined behaviour by moving the assignment
>> for the variable =E2=80=9Cinfo=E2=80=9D behind the null pointer check.
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Fixes: 3b495f2bb749 ("Au1100 FB driver uplift for 2.6.")
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

applied to fbdev git tree (with minor modifications to commit
message and without stable tags).

Helge
