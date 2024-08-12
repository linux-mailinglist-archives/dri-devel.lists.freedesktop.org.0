Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F694F877
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 22:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FA610E164;
	Mon, 12 Aug 2024 20:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Sjom9alj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38D510E164
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 20:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1723495921; x=1724100721; i=wahrenst@gmx.net;
 bh=GvKCeLBsyOIB8oIBg+Q6t3zEGAuc8wQHMxIvLCTbwTI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Sjom9aljNiYSXt4/TV7FudxctU39/Tq2W74NPg4PYxF2kDjaU9OI+BC7xOiXlzzV
 iWq0FxysnId4FFG9QWFS3sLEphqCHsr5P0z/rK9m+CugtuzzJJ3wdLKrj1pBW2Hcf
 Wnf7psK+fYzNjkhxpFoQfCsBBFZ2jhVqOp0YPZ23aYjexU2FAEytCN8yxcoUlKf5H
 X5Qog1k1BTvrflXb/Z9fhyJmhzNGBb49cHxfidzHPp+0F3mEGlVmLontiHMwRVfUs
 b+D+Zx99UO5+VKpGPXstOevQd64Zod2frROPRigwsxPUDtEdl9HSOjesZzTvyORef
 S6SUKDyfIS+4o4RuHg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9T1-1sV3IW31Xt-009GBI; Mon, 12
 Aug 2024 22:52:01 +0200
Message-ID: <d4f111e2-9695-412d-9993-8f5d31c8a545@gmx.net>
Date: Mon, 12 Aug 2024 22:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 01/16] firmware: raspberrypi: Improve timeout warning
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Jiri Slaby <jirislaby@kernel.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728114200.75559-2-wahrenst@gmx.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240728114200.75559-2-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ZfNPP2zjk2FxGLvWamEJ65EQOEHr/+kJILjZGfdpf87+gGx5/C3
 64V1HtPFKiFRkZVlVx5iVKl9HgMhRU2I9im9qQoG56Af8h70c4JuH5HOWxJGLmSGFl+fCuz
 3Oq0mxvwqX/IEB9L2w3qr0bc30x11suNvAUSsPhQGcw3O0Fdjl6x/svM5cPwcfnqLhU0k/C
 tDwrcWM2zA55RjyVtr1JA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QxCy4izLLjY=;VF0kReEZPhZaLGTrfcaQty/QKj7
 UifCvvx+SLuDS3BGH/JKVmzvbgxjfYMTuiaoiGK5ryEFzhcYD1W4kxp0xttxQgmwC6L5cECWp
 YnjEvCvFvuhu0Fpq5G8NtGB+3IFsOiqQ5pz5Abbyvc2B0cRAHxl73b+A8UdKAz//PbdhqoMzi
 2UQhPxU3LgqZXXGGwwi6zYlsBsFv67U2ciIUB7iKcBWbwv0WK1XuAfmgIPjdDwS/p9mC48hEH
 ijEGD6bBKXmtUPUW0VHSMfPF3KcRskrHg5GFaztguP/XKg6lR8PVwhqJwwHwYDi4t0ZXTwc8B
 /WdDsOKDWrWrD0c8cQUYvghNckD5OTt5OsLZcewSOpQ6CiY80Mcjg8vZpkb/OICg9/z2TaIb7
 lLx+k/HnJZCG27LHhGw0KSH8ELFD3BsYRzn5/Cf+/2tZlSs0+PcIJBBfGLQACm1yjlmjGuYyU
 MGPkmbwyxnlHeCTgr9WGN0I2LP5n27BMQzr/nvmxbh6mrFpU6nDTiBiIj7rhOHn2v6E12rJ1H
 HPCLxP9TC5HfJyKg1nkinWxUuFvzr+FgXHyhV23C0JLw+SGKxF7QTcQVfrHE/yXTjoAMn9wxs
 5ehFhzAGR01x91r9GuJzTstArcoTP+uVGcwXxnUXAgpQC6ov14e70lhN5zydwcWo0bhsWiUBN
 sh8YsNcyrRGliwu3k9TfcgJQlvyFmT6b0viXzPSNIWaBecUWJOkdGXlO8nXq8Wf5SO4zgcqB6
 B18i0+SNEyXIdyKAPI0PmynEDFo3j7xspJvpav8uRCSm3ttxugQ3IpeCCgEuP9V3Q+9fTsC6y
 m76aGkNl/8GkkRbtl2mlunOQ==
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

Hi Florian,

Am 28.07.24 um 13:41 schrieb Stefan Wahren:
> Recent work on raspberry-power driver showed that even the
> stacktrace on firmware property timeout doesn't provide
> enough information. So add the first tag name to the warning
> to be in line with a status error.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Are there any concerns, because i assumed this patch would go via your tree?

Best regards
> ---
>   drivers/firmware/raspberrypi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
> index ac34876a97f8..18cc34987108 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -62,7 +62,6 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 chan, u32 data)
>   			ret = 0;
>   		} else {
>   			ret = -ETIMEDOUT;
> -			WARN_ONCE(1, "Firmware transaction timeout");
>   		}
>   	} else {
>   		dev_err(fw->cl.dev, "mbox_send_message returned %d\n", ret);
> @@ -125,6 +124,8 @@ int rpi_firmware_property_list(struct rpi_firmware *fw,
>   		dev_err(fw->cl.dev, "Request 0x%08x returned status 0x%08x\n",
>   			buf[2], buf[1]);
>   		ret = -EINVAL;
> +	} else if (ret == -ETIMEDOUT) {
> +		WARN_ONCE(1, "Firmware transaction 0x%08x timeout", buf[2]);
>   	}
>
>   	dma_free_coherent(fw->chan->mbox->dev, PAGE_ALIGN(size), buf, bus_addr);
> --
> 2.34.1
>

