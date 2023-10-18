Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA02D7CD3EC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 08:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7156810E386;
	Wed, 18 Oct 2023 06:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BC210E386
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 06:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1697609635; x=1698214435; i=deller@gmx.de;
 bh=aiQnF00WLUlR+T8teon88KQG+hnCc8506bmCnLK0Jsg=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=jdQAZG+s1LIElSebT/7CYqeDkyHJj2gz1U0+M+XSI7D2oqZYTRG4STJfkVmv3w1r
 0cv0fZhQAyoyMmc8roGLZ6V0qnuTqNpQU8K/tD5LBWO+Jkn8Q9BweqnMtbBGSXQSY
 KnQrdz0portTFu+9LQUppLOQQngtqC7nJCjdOCcBewB01KxzsXZnKiPVnvXoFlV54
 WptnHSq/EP6rMTS0lBepfb9C6nKeGgNsxJ9VYBd8ELpvdiZ1rJdKrvN+cShgnJHcH
 kmfD7nqiO3zvQjw6jNzpfQ8gOcnmuN4pnCu3v0mk2ZQBT+MpHkjUNGNKbmyXkfDGf
 H+7jMKpvs3Quo86eHw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.146.99]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDJd-1rJkuy1OtL-00qj9y; Wed, 18
 Oct 2023 08:13:55 +0200
Message-ID: <ccdcd70e-ab34-423a-81ca-6075eef3f01a@gmx.de>
Date: Wed, 18 Oct 2023 08:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] fbdev: omapfb: Replace custom memparse()
 implementation
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231018034725.1124006-1-andriy.shevchenko@linux.intel.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231018034725.1124006-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WaGrcFfwYX1kUNbb5/zPXo3O4E3um35AOgPe2Df4WGdCNBlwcGx
 CdnOlSqNRTfKtnf7rWaiaCPGpU53rJuT2K8h1eVM1i1+683chfJbIFwgzdk3bCrqy6dz9GB
 MrLdbSkh34fA1mLyuW+xfzigmSsgvNnwiw/FZmbLw9XNfQDYYSF1MjuWEMBOSWSfcTo0IFL
 GRx2pY47/GmEL6IoS5bAA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mmfgNQPg9gs=;prjIfQdbz0iR9AU0t+0HM+2qkkM
 X2+zfo4zrS2AWOe4CAj+DAcHC4Hr6ObJyd8UqaVGXGnUHA20cueUhKhdN+6GNMW39tbqHM09i
 CIW6zFuL/MTwa5QtEYHL3TDJIc6ujzMq+kbMLaIuLGnxfTVFDfOD/11dmULQ6o5efctfFSKi8
 bJnDh9pFLj8A7M2jy3ATjV1+xGFNt617EaqFcsIicn5syasXLgqdqsFNShSFiuABoesqwWDHS
 6wJAcZBvn7vUPnmOT17Dz9FtWbGRKlHy+hHGXNcepzQHQxhOo/TsOVrzL4izsDoUiEavUEH2T
 B97Al7Is52S9OQpmsm71weXJ5T45X689UJhnYu6Ok9P6EtXAGgm10uuZEqTY7RgEf2gScBVtR
 UOGYd4yQvOEWGTspNEpgsV2uGDjI4urlkmA+i4TVN0AnbiIraCJTBhCYdjvsAwNSkRS8RLSJQ
 du1+iSs/0SdveLkAfjD8nLE7tS2TEn94cupZmrMcOZ9vCsmVfMWteXpGVP8sOEEWrSrSsPalU
 MyKWgLr4jSzJ6A5PXZoYigKl4gXSfPoN5R+xcekezJ57shKp7wF9Ho/iEAhi5LddES7c2EQI4
 SJ4d7hKg6dXaijVePBnVB8SvWg/xhvn/U9Aeg52zJveCdNUeRvMQ5wS4f41JpoiUIgVHYiESl
 j1UZYX4LpvtSaARAl9Aoqyr7Ej7oAn0PWfq3iGxyx7PYXzrey8NLMwzzCb+ZXmbxWu1C+IPIc
 SBU+K39/0D8y0UFyJROIGbfwAss68Sz9Umih4h2WteZN8JGH6whUAQx7TMeNcMlz3I3gV13fs
 U+ivgKGbydlLNyxdmdxtbj+4z4XlMTHmMbGuZ7dQWrUfeGzpOQg6QBixP9TxhpSP51h7hmy58
 XU0DURoA6bjvPGKRDgF1v7TI+oKspH+trK9nXCyEhMv4ns3BXwD97+brGEhd2rk2O/KL6IyUw
 7v1h+TD/IUY3BCVaItK79Y8PUeg=
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

On 10/18/23 05:47, Andy Shevchenko wrote:
> Our library has memparse() for parsing numbers with respective suffixes
> suitable for memory sizes. Use it instead of custom implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/video/fbdev/omap/omapfb_main.c | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)

both patches applied.

Thanks!
Helge
