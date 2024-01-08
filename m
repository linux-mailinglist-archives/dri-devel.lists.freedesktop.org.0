Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2751826A7D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130B710E193;
	Mon,  8 Jan 2024 09:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC74210E193
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1704705396; x=1705310196; i=deller@gmx.de;
 bh=nR8LWbVL4Ovc4j7fwlVmQLTbbIaHJL75PogZk9k9tz8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=FijPyoTHy+EgEFLIwByedii6stk8M9SDsSLQQRyLHhPDDtyKcb7CENStd/HsUcxO
 F4dsreIiDVCKTrhBwBN0D/hLbuVuNug25+BRVO9IBHOZsEQZQ08jlifgIemk1P4uS
 VTdV8DQt0phy05l5ebB3ys3hEj1Us2hYzfiebpa5XO5SGME/o3zeMysVlbyZ55OAR
 zIMwzwNhTLT7WUpzGRZCADgXAKhVUld5CPtq6ILW3Ficlkis7zBlG3043j3wcODhg
 3cADCWssek0Uwi3W0cJHeX00prSf7SjIpVXdSwW+RN2TIVhvaYBUGHYgIR/bFfaVr
 YXDYKLQqEUbS+J/uhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.148.84]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7zFZ-1r8crf35Wt-0151KL; Mon, 08
 Jan 2024 10:16:36 +0100
Message-ID: <167cf934-1115-47ca-8137-a8ea4ba2baec@gmx.de>
Date: Mon, 8 Jan 2024 10:16:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/sis: Remove dependency on screen_info
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com
References: <20240103121352.4893-1-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240103121352.4893-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZyebWvq2FE2eh6dpSGmaaazdNz6wH3HMqeWN2tiyD4Q615bkgdi
 bkrTf3J2dtp699IgDBZEvdnIitYBCrZwKWRIM0ewSCsTh3+VzYW1LyZX291/qbSU4YZpgll
 jlZwtasxtJUzii4+DhCZHexSYQfPm0YRC0cYMAit4tj/eVwdYTITXVVES121Zh8/GSJe8EM
 IjFSk4cEhGmKVNZXs8upQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XrTYvApXHWY=;GXscgwbtlsEF5Z2xBEZrRhe2Bsk
 97m2D+jq/0r0QyYYEy4NuUbeF4N89wqklXEPQd+oz8jGHiRM1bEGsHRRAmR6PciRwWznxTmyy
 H1ZK7DV1tnDasrkPmVPuBg6zP2wp0aD/mdeGdYNzWpppEg+vsfgN6+ekMUeMFvJQZioLKx0/E
 sEp4tosX0Mtm85sMmqS0tlmgkxGpscNLkWrJPQvgNvDqrHT0Ep3rKtP5VkVo3G1VZ6DhcuFne
 34zGxlXRbDUbQAmcmtmROJmSKFdSvP2k+sTg5HJf1IO78nuzbrZOlku4iwrQ1ycK/DedfjMfo
 KvgHSvQ+g4cPKKX24kCCROONyEhC+0Yt5IQrSxeQ9o86NtltpD+H9fJzQERWzpCaQhJvqUXfl
 BOiqs/vtzpbyPwgl0enklz7bETbPT3sIu+CvV7Q1mrcCU5XtU5+ooY9reZVs3MoHqMgW1GuOY
 djOaqk51wn5ebl4oHUcuC9kgwXhKNst6dgauVaHqP5RzE3+HgllTYNUgy07RcJFSpAWHSJM8F
 /N+P0h1ooLPcbZyMlSPSqzClF7Y882RO1swOI2+79p9uHFR0pX0vXBvDq3TIR6nadNty0YoaC
 Hx4eCtaz5HQfyuzgFchqJ8RlWVVhaNP8kSZWvsHlZWmd+mvQUqNQe2c+ZMMiNkKUewHWtmRD5
 TAEG5gGt0sRUHUASAmNMz6nrczxsM3RIKNgFi4SYMemoH9tBAmaz3k3y3DkXVnmgGZIWmyXwq
 UCfvoyFnlFLibduY1oEgCYVEAbaO2KaM3k8LC9bF1jFihbD07RZ0WBb5u1MRj49keylPx5UJr
 o5TJbifwU+/fXB3yDFvRlxotUw9xr66NzsdLGxi89gYnv3HwRaoadsDsoL7I6fioAd6Oy6coo
 5yzoy7IY8u/tQY2bBUJachY7qeLRvXM36KzGZjEkGF+S8PA4Z7jjdD/XfFz91eue1g/iC2XCy
 URJkT4U51iDw613P7hTrCVBFb+g=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/3/24 13:13, Thomas Zimmermann wrote:
> When built-in, the sis driver tries to detect the current display mode
> from the global screen_info state. That state is only for architecture
> and firmware code. Drivers should not use it directly as it's not
> guaranteed to contain valid information.
>
> Remove the mode-detection code from sis. Drivers that want to detect a
> pre-set mode on probe should read the hardware registers directly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/sis/sis_main.c | 37 ------------------------------
>   1 file changed, 37 deletions(-)

applied to fbdev git tree.

Thanks!
Helge
