Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB631A9BA85
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 00:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CD210E87E;
	Thu, 24 Apr 2025 22:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Ar5kzUYz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC0910E87F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 22:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1745533087; x=1746137887; i=deller@gmx.de;
 bh=AFLbn6BkyIt0cpNGpcwjkoBgM9APv/gwamWZewyVfvc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Ar5kzUYz0Z/Ts+6adHY06N+Q3vfLWEGQ8s/V2fg0aH+YnqiBVfeQ4A3RwhIqFvOW
 rZZi4+f04KWTkgWtKcv20+hxtBhoKR4fr0jjdoU0NZ56mF8Bm+1ngoSpz6nEy7vLw
 ySxXTyD7Ukq5XJ8PqymaPOcy23Zdnac9WjfZOIUAfPrI+NFA97po6JVOjZMHMvpnV
 FnJkm8C2rJSCLaycsJOEurIOMRY8x/2UXLtHpAhu8abre8j6kV0MFd9YIseIYSDzP
 E0TUcDGmLB0boc9fksJSCRObxfQpmk4aWJlV/5nrsQbzgDsiiuXDdJuU9pLHo58lh
 Dvv+OSIwxAiFzJ6txg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.181]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDkm-1v0yn92bt2-00wyxb; Fri, 25
 Apr 2025 00:18:07 +0200
Message-ID: <16621cab-bc00-4b9a-8688-ffa6ac20105f@gmx.de>
Date: Fri, 25 Apr 2025 00:18:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/nvidiafb: Correct const string length in
 nvidiafb_setup()
To: Zijun Hu <zijun_hu@icloud.com>, Antonino Daplas <adaplas@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
References: <20250407-fix_nvidia-v1-1-843f8d031c7d@quicinc.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250407-fix_nvidia-v1-1-843f8d031c7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YskQzEHBdqm0bL8JpFo5p0qFRTwwjHHsrW7yyQGYeyRIbZES8Zt
 IpYsfrRHZbhSwfE5AqWYn/2l6vRcRpQqVN9bG6POAM3Cqi2cMKPYFnXJ2exUGXs0cqBRW29
 S5TKvWgUGCFnjcyG2glgJfDnZR1jrOXGBqTu1E7hUKMu5SaIYSnwihAxQLg4I2BZqsRndTv
 I1231JtFD0Pq6ryb8lZbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aulOwJdKc2A=;NlJCr+uuNclA7WOsP2DXARdEA0v
 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
 sE3O0kf7KLWpsAS0VLkBYS3uqNs0xtw=
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

On 4/7/25 13:55, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>=20
> The actual length of const string "noaccel" is 7, but the strncmp()
> branch in nvidiafb_setup() wrongly hard codes it as 6.
>=20
> Fix by using actual length 7 as argument of the strncmp().
>=20
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>   drivers/video/fbdev/nvidia/nvidia.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

applied.

Thanks!
Helge
