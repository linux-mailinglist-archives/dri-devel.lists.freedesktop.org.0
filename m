Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E3391B800
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 09:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A11A10E168;
	Fri, 28 Jun 2024 07:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="A78BQxXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B7E10E13D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 07:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1719559007; x=1720163807; i=deller@gmx.de;
 bh=BVCvxso8LWcDBYVgY2qR9LImDTuBOXdQaYFxMSV7Poc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=A78BQxXc9VkBkMEX/sLHLzPceiNsRLnEajv/nSvoQDQKk6nwv8WvFqmENu6Z7iVJ
 3J6Z6IQUYYeTpiWDfIkkzsb9OmNGkDPyrjMNpEan/GpW3rCUKm0gV78xdtbat73Gx
 48uQsEvZTGbCXbfc2vSjdLxFmdbJW7xFLImM1fWcCspO58SmVMZwp4gtfYmG5K7MG
 MaDrgXw/+y/umPnUByR92FGHZcHNG1OdAN6VsjdEqq0KU0QDzQPi0DfoIiDdrNWnR
 DR9LGXC+hO+9c5hr7vyhfboTScIge+2qjK71tJHGAANS2RS3oB3RM57d9fgxNgFlI
 0/JFw1wQzXBOogB4DA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.78]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M59C8-1sLzv03e68-004JhY; Fri, 28
 Jun 2024 09:16:46 +0200
Message-ID: <72418d4e-76ac-44ae-9f4a-f314d925f928@gmx.de>
Date: Fri, 28 Jun 2024 09:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: omap2: Return clk_prepare_enable to transfer the
 error
To: Chen Ni <nichen@iscas.ac.cn>, laurent.pinchart@ideasonboard.com,
 kuninori.morimoto.gx@renesas.com
Cc: linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240628032812.280895-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240628032812.280895-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dx4qoQlPZaG6FI2b4ClufdZB9k9eYU8N+FyxceWck9YLG9mnnvO
 cLvm3Jjf3/GL3vdpDT3+wZIiB18yfBzs+cSnGdz1cATRfzYcWPoaG48DYmWw0LZLP2uB+hl
 Xz1dsb005pu3di56zns6CUzjK67p2JnASgQUHLCr8PybEKwHqP9Fan+NRl6E0W6a+mS3n9Z
 YACq+irr0j5MqkfxnQFMg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3LYUJZkI6qQ=;SZ013v6RcqX/uXL1yPPXZ2LVXAM
 hV96OijzHdb9eYhtjVlvsYFhuZ4upnwebPkwdFeSVQuLgmpulCUVs40DJZ9eVd6+2idD50CN3
 ZT2OyFT/d7pPu8EKJPtsqlmco3WtVrHQmRP83ukosUNmPqFqwcRZ7uUTWIMlZNBOVfTCX4wEp
 4SE+Yg3u1pK/K/vVfoS33jhjtFumUN188DQa6UrZEytSdsJ1dJgfZ40oFYgmvnvZ/ir4gBWKh
 DxEb8oPZjMXirKy2ExwYPZG6TiyiJPYoSjn1UaNMYtnliNCHCYGKnR3491j8T/XICjVNxVDy5
 oRFffHXehNR431+BXnwv+NEGTq2YtnX9HCDNovCNOW3NG619g5yocmwWZillPb7AAUrR+6C7d
 e8GrtREfjAOXsI0HwejhNNurTnc4NAzvPsBF7LsXDC5JMWoptL2Z8sDNZCtZ8BmoVvdWhF1RJ
 7pSNdREXqONcwmtX2liPGzwpvT19ANw+pr1SqrVKgZ36+rWMWbLnMKbQrRNg4dhC7YXmpksd7
 lKjsDKihYhv4eSUjjYe9Dq9hrOfPN3P6ZlCnQF1a3Caadj3cyrm7gY929Nih2JccIwl5oUsOq
 VE1nI9dq2U3PP8Ek91kEfdayj/w95HhhBV5GjDr+vW/E8rBtC2O/qwrLGnxz+gVpct4T4OpmA
 7zOb+fb0Qe0ct5526Jm0RJ/jaiEtQ+9P1WxUrDRk+BCjOEF9qSs5vzLZJxxyoBmslEP2voYxr
 mg/OqxT7V7H+Zg5vxQXGTNAVQKe6CkKE+1Tpb0xyDl4uQTPEhDQIu1hIz3owAyR9QJMq9tTkQ
 uAx2yRizO8u+LmSkAxHNqVhajdc5Dp4C8lloHVIje+trU=
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

On 6/28/24 05:28, Chen Ni wrote:
> Return clk_prepare_enable() in order to transfer the error if it fails.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/video/fbdev/omap2/omapfb/dss/venc.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

applied.
Thanks!
Helge

