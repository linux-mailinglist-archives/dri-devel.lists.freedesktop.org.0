Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A64211F542
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 02:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D94E6E20E;
	Sun, 15 Dec 2019 01:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED9E6E20E
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 01:22:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c9so2961962wrw.8
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 17:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Hj7U+XUqIX2+wucN/ZFiZkj4EO3Zj4YrKkND2o1pNM=;
 b=jHXB9SoJFvzkDJ8aVurwTGrJQHwaL0RTbBYe10XjRPy280PXaQ1S4OP2Zl6DPeRjP8
 YOmzY64IM37aN1I444tOzGbl7h/8Sr1I8V7w3we6GeRpNP3EnauEbKSsUJ3n5KBpF22I
 OxBuuMLtZOGI18Lnphx9B2mx59ww28qFAf5bKrTdMFwmYsVOFkl10zV6QipY03CWNaNX
 Y3yu0XrnOeE0ZGzgPxwzQeoXGroW0clDGeleS8RrsTeXCLrdIZmCuYX3c7o4YlfSn7li
 U68XsGZDfkZ6G1GFmXbqke5oHXzVZWXc4R87/WRwEOYkUJ1WxNrRrxNoh2BgfWcjMN8V
 4P+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4Hj7U+XUqIX2+wucN/ZFiZkj4EO3Zj4YrKkND2o1pNM=;
 b=qsH5kCaUgyN//CPBUi7mMYtZ3paYAj+AWWnNI23WU8HbP9yUpi9yHRC0hPJNIvYWgV
 /3XnFz+Hrxv+AxXLGbvnvE9Ymk66EouRYbfvdHXpJ/eySsOQTpWAiaIjFwI1+JpldcNP
 cuYBkVa4ocJ9MTTwG+NJ0sxrsRslgMJTRM009wksXPnMFmp+b6vUEGKUJgcV70OpH2v6
 itYc8PlLIVYWcUn1gMa1Im3Sew9wr2MNyDctX/4S96KsG4nzYUTfDKYL+abxxNotXOBV
 4GCF7SZfa69kV1Ymnve6sPlBnbVMS81PA8CYXpMj2LcIyrojTzxEkiz4prNy8ct8alPx
 x7Hw==
X-Gm-Message-State: APjAAAWP1bBHO3Cl2spW1+pO7zbKIfDa0PHhiVVojrjYu6+nUefNC5PS
 z3vXkXtdZ9Gl3Mbu/mdxim8=
X-Google-Smtp-Source: APXvYqxKZ+sbHRr9CUolFbLbFhffrrzSO39+3PdM5xmUoM1TTO5j97aT6Xaxmj4IpRGcsgPQGNjgcw==
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr22339274wrp.182.1576372967583; 
 Sat, 14 Dec 2019 17:22:47 -0800 (PST)
Received: from ziggy.stardust ([95.169.225.199])
 by smtp.gmail.com with ESMTPSA id j12sm16671206wrw.54.2019.12.14.17.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Dec 2019 17:22:46 -0800 (PST)
Subject: Re: [PATCH v20 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
To: Ulrich Hecht <uli@fpond.eu>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, jitao.shi@mediatek.com
References: <1570436549-8694-1-git-send-email-uli@fpond.eu>
 <1570436549-8694-3-git-send-email-uli@fpond.eu>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFP1zgUBEAC21D6hk7//0kOmsUrE3eZ55kjc9DmFPKIz6l4NggqwQjBNRHIMh04BbCMY
 fL3eT7ZsYV5nur7zctmJ+vbszoOASXUpfq8M+S5hU2w7sBaVk5rpH9yW8CUWz2+ZpQXPJcFa
 OhLZuSKB1F5JcvLbETRjNzNU7B3TdS2+zkgQQdEyt7Ij2HXGLJ2w+yG2GuR9/iyCJRf10Okq
 gTh//XESJZ8S6KlOWbLXRE+yfkKDXQx2Jr1XuVvM3zPqH5FMg8reRVFsQ+vI0b+OlyekT/Xe
 0Hwvqkev95GG6x7yseJwI+2ydDH6M5O7fPKFW5mzAdDE2g/K9B4e2tYK6/rA7Fq4cqiAw1+u
 EgO44+eFgv082xtBez5WNkGn18vtw0LW3ESmKh19u6kEGoi0WZwslCNaGFrS4M7OH+aOJeqK
 fx5dIv2CEbxc6xnHY7dwkcHikTA4QdbdFeUSuj4YhIZ+0QlDVtS1QEXyvZbZky7ur9rHkZvP
 ZqlUsLJ2nOqsmahMTIQ8Mgx9SLEShWqD4kOF4zNfPJsgEMB49KbS2o9jxbGB+JKupjNddfxZ
 HlH1KF8QwCMZEYaTNogrVazuEJzx6JdRpR3sFda/0x5qjTadwIW6Cl9tkqe2h391dOGX1eOA
 1ntn9O/39KqSrWNGvm+1raHK+Ev1yPtn0Wxn+0oy1tl67TxUjQARAQABtClNYXR0aGlhcyBC
 cnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPokCUgQTAQIAPAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AWIQTmuZIYwPLDJRwsOhfZFAuyVhMC8QUCWt3scQIZAQAKCRDZFAuy
 VhMC8WzRD/4onkC+gCxG+dvui5SXCJ7bGLCu0xVtiGC673Kz5Aq3heITsERHBV0BqqctOEBy
 ZozQQe2Hindu9lasOmwfH8+vfTK+2teCgWesoE3g3XKbrOCB4RSrQmXGC3JYx6rcvMlLV/Ch
 YMRR3qv04BOchnjkGtvm9aZWH52/6XfChyh7XYndTe5F2bqeTjt+kF/ql+xMc4E6pniqIfkv
 c0wsH4CkBHqoZl9w5e/b9MspTqsU9NszTEOFhy7p2CYw6JEa/vmzR6YDzGs8AihieIXDOfpT
 DUr0YUlDrwDSrlm/2MjNIPTmSGHH94ScOqu/XmGW/0q1iar/Yr0leomUOeeEzCqQtunqShtE
 4Mn2uEixFL+9jiVtMjujr6mphznwpEqObPCZ3IcWqOFEz77rSL+oqFiEA03A2WBDlMm++Sve
 9jpkJBLosJRhAYmQ6ey6MFO6Krylw1LXcq5z1XQQavtFRgZoruHZ3XlhT5wcfLJtAqrtfCe0
 aQ0kJW+4zj9/So0uxJDAtGuOpDYnmK26dgFN0tAhVuNInEVhtErtLJHeJzFKJzNyQ4GlCaLw
 jKcwWcqDJcrx9R7LsCu4l2XpKiyxY6fO4O8DnSleVll9NPfAZFZvf8AIy3EQ8BokUsiuUYHz
 wUo6pclk55PZRaAsHDX/fNr24uC6Eh5oNQ+v4Pax/gtyybkCDQRd1TkHARAAt1BBpmaH+0o+
 deSyJotkrpzZZkbSs5ygBniCUGQqXpWqgrc7Uo/qtxOFL91uOsdX1/vsnJO9FyUv3ZNI2Thw
 NVGCTvCP9E6u4gSSuxEfVyVThCSPvRJHCG2rC+EMAOUMpxokcX9M2b7bBEbcSjeP/E4KTa39
 q+JJSeWliaghUfMXXdimT/uxpP5Aa2/D/vcUUGHLelf9TyihHyBohdyNzeEF3v9rq7kdqamZ
 Ihb+WYrDio/SzqTd1g+wnPJbnu45zkoQrYtBu58n7u8oo+pUummOuTR2b6dcsiB9zJaiVRIg
 OqL8p3K2fnE8Ewwn6IKHnLTyx5T/r2Z0ikyOeijDumZ0VOPPLTnwmb780Nym3LW1OUMieKtn
 I3v5GzZyS83NontvsiRd4oPGQDRBT39jAyBr8vDRl/3RpLKuwWBFTs1bYMLu0sYarwowOz8+
 Mn+CRFUvRrXxociw5n0P1PgJ7vQey4muCZ4VynH1SeVb3KZ59zcQHksKtpzz2OKhtX8FCeVO
 mHW9u4x8s/oUVMZCXEq9QrmVhdIvJnBCqq+1bh5UC2Rfjm/vLHwt5hes0HDstbCzLyiA0LTI
 ADdP77RN2OJbzBkCuWE21YCTLtc8kTQlP+G8m23K5w8k2jleCSKumprCr/5qPyNlkie1HC4E
 GEAfdfN+uLsFw6qPzSAsmukAEQEAAYkEbAQYAQgAIBYhBOa5khjA8sMlHCw6F9kUC7JWEwLx
 BQJd1TkHAhsCAkAJENkUC7JWEwLxwXQgBBkBCAAdFiEEUdvKHhzqrUYPB/u8L21+TfbCqH4F
 Al3VOQcACgkQL21+TfbCqH79RRAAtlb6oAL9y8JM5R1T3v02THFip8OMh7YvEJCnezle9Apq
 C6Vx26RSQjBV1JwSBv6BpgDBNXarTGCPXcre6KGfX8u1r6hnXAHZNHP7bFGJQiBv5RqGFf45
 OhOhbjXCyHc0jrnNjY4M2jTkUC+KIuOzasvggU975nolC8MiaBqfgMB2ab5W+xEiTcNCOg3+
 1SRs5/ZkQ0iyyba2FihSeSw3jTUjPsJBF15xndexoc9jpi0RKuvPiJ191Xa3pzNntIxpsxqc
 ZkS1HSqPI63/urNezeSejBzW0Xz2Bi/b/5R9Hpxp1AEC3OzabOBATY/1Bmh2eAVK3xpN2Fe1
 Zj7HrTgmzBmSefMcSXN0oKQWEI5tHtBbw5XUj0Nw4hMhUtiMfE2HAqcaozsL34sEzi3eethZ
 IvKnIOTmllsDFMbOBa8oUSoaNg7GzkWSKJ59a9qPJkoj/hJqqeyEXF+WTCUv6FcA8BtBJmVf
 FppFzLFM/QzF5fgDZmfjc9czjRJHAGHRMMnQlW88iWamjYVye57srNq9pUql6A4lITF7w00B
 5PXINFk0lMcNUdkWipu24H6rJhOO6xSP4n6OrCCcGsXsAR5oH3d4TzA9iPYrmfXAXD+hTp82
 s+7cEbTsCJ9MMq09/GTCeroTQiqkp50UaR0AvhuPdfjJwVYZfmMS1+5IXA/KY6DbGBAAs5ti
 AK0ieoZlCv/YxOSMCz10EQWMymD2gghjxojf4iwB2MbGp8UN4+++oKLHz+2j+IL08rd2ioFN
 YCJBFDVoDRpF/UnrQ8LsH55UZBHuu5XyMkdJzMaHRVQc1rzfluqx+0a/CQ6Cb2q7J2d45nYx
 8jMSCsGj1/iU/bKjMBtuh91hsbdWCxMRW0JnGXxcEUklbhA5uGj3W4VYCfTQxwK6JiVt7JYp
 bX7JdRKIyq3iMDcsTXi7dhhwqsttQRwbBci0UdFGAG4jT5p6u65MMDVTXEgYfZy0674P06qf
 uSyff73ivwvLR025akzJui8MLU23rWRywXOyTINz8nsPFT4ZSGT1hr5VnIBs/esk/2yFmVoc
 FAxs1aBO29iHmjJ8D84EJvOcKfh9RKeW8yeBNKXHrcOV4MbMOts9+vpJgBFDnJeLFQPtTHuI
 kQXT4+yLDvwOVAW9MPLfcHlczq/A/nhGVaG+RKWDfJWNSu/mbhqUQt4J+RFpfx1gmL3yV8NN
 7JXABPi5M97PeKdx6qc/c1o3oEHH8iBkWZIYMS9fd6rtAqV3+KH5Ors7tQVtwUIDYEvttmeO
 ifvpW6U/4au4zBYfvvXagbyXJhG9mZvz+jN1cr0/G2ZC93IbjFFwUmHtXS4ttQ4pbrX6fjTe
 lq5vmROjiWirpZGm+WA3Vx9QRjqfMdS5Ag0EXdU5SAEQAJu/Jk58uOB8HSGDSuGUB+lOacXC
 bVOOSywZkq+Ayv+3q/XIabyeaYMwhriNuXHjUxIORQoWHIHzTCqsAgHpJFfSHoM4ulCuOPFt
 XjqfEHkA0urB6S0jnvJ6ev875lL4Yi6JJO7WQYRs/l7OakJiT13GoOwDIn7hHH/PGUqQoZlA
 d1n5SVdg6cRd7EqJ+RMNoud7ply6nUSCRMNWbNqbgyWjKsD98CMjHa33SB9WQQSQyFlf+dz+
 dpirWENCoY3vvwKJaSpfeqKYuqPVSxnqpKXqqyjNnG9W46OWZp+JV5ejbyUR/2U+vMwbTilL
 cIUpTgdmxPCA6J0GQjmKNsNKKYgIMn6W4o/LoiO7IgROm1sdn0KbJouCa2QZoQ0+p/7mJXhl
 tA0XGZhNlI3npD1lLpjdd42lWboU4VeuUp4VNOXIWU/L1NZwEwMIqzFXl4HmRi8MYbHHbpN5
 zW+VUrFfeRDPyjrYpax+vWS+l658PPH+sWmhj3VclIoAU1nP33FrsNfp5BiQzao30rwe4ntd
 eEdPENvGmLfCwiUV2DNVrmJaE3CIUUl1KIRoB5oe7rJeOvf0WuQhWjIU98glXIrh3WYd7vsf
 jtbEXDoWhVtwZMShMvp7ccPCe2c4YBToIthxpDhoDPUdNwOssHNLD8G4JIBexwi4q7IT9lP6
 sVstwvA5ABEBAAGJAjYEGAEIACAWIQTmuZIYwPLDJRwsOhfZFAuyVhMC8QUCXdU5SAIbDAAK
 CRDZFAuyVhMC8bXXD/4xyfbyPGnRYtR0KFlCgkG2XWeWSR2shSiM1PZGRPxR888zA2WBYHAk
 7NpJlFchpaErV6WdFrXQjDAd9YwaEHucfS7SAhxIqdIqzV5vNFrMjwhB1N8MfdUJDpgyX7Zu
 k/Phd5aoZXNwsCRqaD2OwFZXr81zSXwE2UdPmIfTYTjeVsOAI7GZ7akCsRPK64ni0XfoXue2
 XUSrUUTRimTkuMHrTYaHY3544a+GduQQLLA+avseLmjvKHxsU4zna0p0Yb4czwoJj+wSkVGQ
 NMDbxcY26CMPK204jhRm9RG687qq6691hbiuAtWABeAsl1AS+mdS7aP/4uOM4kFCvXYgIHxP
 /BoVz9CZTMEVAZVzbRKyYCLUf1wLhcHzugTiONz9fWMBLLskKvq7m1tlr61mNgY9nVwwClMU
 uE7i1H9r/2/UXLd+pY82zcXhFrfmKuCDmOkB5xPsOMVQJH8I0/lbqfLAqfsxSb/X1VKaP243
 jzi+DzD9cvj2K6eD5j5kcKJJQactXqfJvF1Eb+OnxlB1BCLE8D1rNkPO5O742Mq3MgDmq19l
 +abzEL6QDAAxn9md8KwrA3RtucNh87cHlDXfUBKa7SRvBjTczDg+HEPNk2u3hrz1j3l2rliQ
 y1UfYx7Vk/TrdwUIJgKS8QAr8Lw9WuvY2hSqL9vEjx8VAkPWNWPwrQ==
Message-ID: <205790a3-7186-048f-bcf6-ebb461563b04@gmail.com>
Date: Sun, 15 Dec 2019 02:22:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1570436549-8694-3-git-send-email-uli@fpond.eu>
Content-Language: en-US
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
Cc: mark.rutland@arm.com, stonea168@163.com, ajaykumar.rs@samsung.com,
 architt@codeaurora.org, vpalatin@chromium.org, cawa.cheng@mediatek.com,
 yingjoe.chen@mediatek.com, devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, seanpaul@chromium.org,
 eddie.huang@mediatek.com, rahul.sharma@samsung.com, kernel@pengutronix.de,
 galak@codeaurora.org, enric.balletbo@collabora.com, andy.yan@rock-chips.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/10/2019 10:22, Ulrich Hecht wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> This patch adds drm_bridge driver for parade DSI to eDP bridge chip.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> [uli: followed API changes, removed FW update feature]
> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
> ---
> 
> Changes since v19:
>  - fixed return value of ps8640_probe() when no panel is found
> 
> Changes since v18:
>  - followed DRM API changes
>  - use DEVICE_ATTR_RO()
>  - remove firmware update code
>  - add SPDX identifier
> 
> Changes since v17:
>  - remove some unused head files.
>  - add macros for ps8640 pages.
>  - remove ddc_i2c client
>  - add mipi_dsi_device_register_full
>  - remove the manufacturer from the name and i2c_device_id
>  
> Changes since v16:
>  - Disable ps8640 DSI MCS Function.
>  - Rename gpios name more clearly.
>  - Tune the ps8640 power on sequence.
> 
> Changes since v15:
>  - Drop drm_connector_(un)register calls from parade ps8640.
>    The main DRM driver mtk_drm_drv now calls
>    drm_connector_register_all() after drm_dev_register() in the
>    mtk_drm_bind() function. That function should iterate over all
>    connectors and call drm_connector_register() for each of them.
>    So, remove drm_connector_(un)register calls from parade ps8640.
> 
> Changes since v14:
>  - update copyright info.
>  - change bridge_to_ps8640 and connector_to_ps8640 to inline function.
>  - fix some coding style.
>  - use sizeof as array counter.
>  - use drm_get_edid when read edid.
>  - add mutex when firmware updating. 
> 
> Changes since v13:
>  - add const on data, ps8640_write_bytes(struct i2c_client *client, const u8 *data, u16 data_len)
>  - fix PAGE2_SW_REST tyro.
>  - move the buf[3] init to entrance of the function.
> 
> Changes since v12:
>  - fix hw_chip_id build warning
> 
> Changes since v11:
>  - Remove depends on I2C, add DRM depends
>  - Reuse ps8640_write_bytes() in ps8640_write_byte()
>  - Use timer check for polling like the routines in <linux/iopoll.h>
>  - Fix no drm_connector_unregister/drm_connector_cleanup when ps8640_bridge_attach fail
>  - Check the ps8640 hardware id in ps8640_validate_firmware
>  - Remove fw_version check
>  - Move ps8640_validate_firmware before ps8640_enter_bl
>  - Add ddc_i2c unregister when probe fail and ps8640_remove
> 
> 
>  drivers/gpu/drm/bridge/Kconfig         |  12 +
>  drivers/gpu/drm/bridge/Makefile        |   1 +
>  drivers/gpu/drm/bridge/parade-ps8640.c | 672 +++++++++++++++++++++++++++++++++
>  3 files changed, 685 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/parade-ps8640.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 1cc9f50..61c6415 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -82,6 +82,18 @@ config DRM_PARADE_PS8622
>  	---help---
>  	  Parade eDP-LVDS bridge chip driver.
>  
> +config DRM_PARADE_PS8640
> +	tristate "Parade PS8640 MIPI DSI to eDP Converter"
> +	depends on DRM
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL
> +	help
> +	  Choose this option if you have PS8640 for display
> +	  The PS8640 is a high-performance and low-power
> +	  MIPI DSI to eDP converter
> +
>  config DRM_SIL_SII8620
>  	tristate "Silicon Image SII8620 HDMI/MHL bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 4934fcf..14660ab 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
>  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
>  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
> +obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
>  obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
>  obj-$(CONFIG_DRM_SII902X) += sii902x.o
>  obj-$(CONFIG_DRM_SII9234) += sii9234.o
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> new file mode 100644
> index 0000000..ac27010
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -0,0 +1,672 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/firmware.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +#include <asm/unaligned.h>
> +#include <drm/drm_panel.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#define PAGE1_VSTART		0x6b
> +#define PAGE2_SPI_CFG3		0x82
> +#define I2C_TO_SPI_RESET	0x20
> +#define PAGE2_ROMADD_BYTE1	0x8e
> +#define PAGE2_ROMADD_BYTE2	0x8f
> +#define PAGE2_SWSPI_WDATA	0x90
> +#define PAGE2_SWSPI_RDATA	0x91
> +#define PAGE2_SWSPI_LEN		0x92
> +#define PAGE2_SWSPI_CTL		0x93
> +#define TRIGGER_NO_READBACK	0x05
> +#define TRIGGER_READBACK	0x01
> +#define PAGE2_SPI_STATUS	0x9e
> +#define SPI_READY		0x0c
> +#define PAGE2_GPIO_L		0xa6
> +#define PAGE2_GPIO_H		0xa7
> +#define PS_GPIO9		BIT(1)
> +#define PAGE2_IROM_CTRL		0xb0
> +#define IROM_ENABLE		0xc0
> +#define IROM_DISABLE		0x80
> +#define PAGE2_SW_RESET		0xbc
> +#define SPI_SW_RESET		BIT(7)
> +#define MPU_SW_RESET		BIT(6)
> +#define PAGE2_ENCTLSPI_WR	0xda
> +#define PAGE2_I2C_BYPASS	0xea
> +#define I2C_BYPASS_EN		0xd0
> +#define PAGE2_MCS_EN		0xf3
> +#define MCS_EN			BIT(0)
> +#define PAGE3_SET_ADD		0xfe
> +#define PAGE3_SET_VAL		0xff
> +#define VDO_CTL_ADD		0x13
> +#define VDO_DIS			0x18
> +#define VDO_EN			0x1c
> +#define PAGE4_REV_L		0xf0
> +#define PAGE4_REV_H		0xf1
> +#define PAGE4_CHIP_L		0xf2
> +#define PAGE4_CHIP_H		0xf3
> +
> +#define PAGE0_DP_CNTL	0
> +#define PAGE1_VDO_BDG	1
> +#define PAGE2_TOP_CNTL	2
> +#define PAGE3_DSI_CNTL1	3
> +#define PAGE4_MIPI_PHY	4
> +#define PAGE5_VPLL	5
> +#define PAGE6_DSI_CNTL2	6
> +#define PAGE7_SPI_CNTL	7
> +#define MAX_DEVS		0x8
> +
> +struct ps8640_info {
> +	u8 family_id;
> +	u8 variant_id;
> +	u16 version;
> +};
> +
> +struct ps8640 {
> +	struct drm_connector connector;
> +	struct drm_bridge bridge;
> +	struct edid *edid;
> +	struct mipi_dsi_device *dsi;
> +	struct i2c_client *page[MAX_DEVS];
> +	struct regulator_bulk_data supplies[2];
> +	struct drm_panel *panel;
> +	struct gpio_desc *gpio_reset;
> +	struct gpio_desc *gpio_power_down;
> +	struct gpio_desc *gpio_mode_sel;
> +	bool enabled;
> +
> +	/* firmware file info */
> +	struct ps8640_info info;
> +	bool in_fw_update;
> +	/* for firmware update protect */
> +	struct mutex fw_mutex;
> +};
> +
> +static const u8 enc_ctrl_code[6] = { 0xaa, 0x55, 0x50, 0x41, 0x52, 0x44 };
> +static const u8 hw_chip_id[4] = { 0x00, 0x0a, 0x00, 0x30 };
> +
> +static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
> +{
> +	return container_of(e, struct ps8640, bridge);
> +}
> +
> +static inline struct ps8640 *connector_to_ps8640(struct drm_connector *e)
> +{
> +	return container_of(e, struct ps8640, connector);
> +}
> +
> +static int ps8640_read(struct i2c_client *client, u8 reg, u8 *data,
> +		       u16 data_len)
> +{
> +	int ret;
> +	struct i2c_msg msgs[] = {
> +		{
> +		 .addr = client->addr,
> +		 .flags = 0,
> +		 .len = 1,
> +		 .buf = &reg,
> +		},
> +		{
> +		 .addr = client->addr,
> +		 .flags = I2C_M_RD,
> +		 .len = data_len,
> +		 .buf = data,
> +		}
> +	};
> +
> +	ret = i2c_transfer(client->adapter, msgs, 2);
> +
> +	if (ret == 2)
> +		return 0;
> +	if (ret < 0)
> +		return ret;
> +	else
> +		return -EIO;
> +}
> +
> +static int ps8640_write_bytes(struct i2c_client *client, const u8 *data,
> +			      u16 data_len)
> +{
> +	int ret;
> +	struct i2c_msg msg;
> +
> +	msg.addr = client->addr;
> +	msg.flags = 0;
> +	msg.len = data_len;
> +	msg.buf = (u8 *)data;
> +
> +	ret = i2c_transfer(client->adapter, &msg, 1);
> +	if (ret == 1)
> +		return 0;
> +	if (ret < 0)
> +		return ret;
> +	else
> +		return -EIO;
> +}
> +
> +static int ps8640_write_byte(struct i2c_client *client, u8 reg,  u8 data)
> +{
> +	u8 buf[] = { reg, data };
> +
> +	return ps8640_write_bytes(client, buf, sizeof(buf));
> +}
> +
> +static void ps8640_get_mcu_fw_version(struct ps8640 *ps_bridge)
> +{
> +	struct i2c_client *client = ps_bridge->page[PAGE5_VPLL];
> +	u8 fw_ver[2];
> +
> +	ps8640_read(client, 0x4, fw_ver, sizeof(fw_ver));
> +	ps_bridge->info.version = (fw_ver[0] << 8) | fw_ver[1];
> +
> +	DRM_INFO_ONCE("ps8640 rom fw version %d.%d\n", fw_ver[0], fw_ver[1]);
> +}
> +
> +static int ps8640_bridge_unmute(struct ps8640 *ps_bridge)
> +{
> +	struct i2c_client *client = ps_bridge->page[PAGE3_DSI_CNTL1];
> +	u8 vdo_ctrl_buf[3] = { PAGE3_SET_ADD, VDO_CTL_ADD, VDO_EN };
> +
> +	return ps8640_write_bytes(client, vdo_ctrl_buf, sizeof(vdo_ctrl_buf));
> +}
> +
> +static int ps8640_bridge_mute(struct ps8640 *ps_bridge)
> +{
> +	struct i2c_client *client = ps_bridge->page[PAGE3_DSI_CNTL1];
> +	u8 vdo_ctrl_buf[3] = { PAGE3_SET_ADD, VDO_CTL_ADD, VDO_DIS };
> +
> +	return ps8640_write_bytes(client, vdo_ctrl_buf, sizeof(vdo_ctrl_buf));
> +}
> +
> +static void ps8640_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	struct i2c_client *client = ps_bridge->page[PAGE2_TOP_CNTL];
> +	struct i2c_client *page1 = ps_bridge->page[PAGE1_VDO_BDG];
> +	int err;
> +	u8 set_vdo_done, mcs_en, vstart;
> +	ktime_t timeout;
> +
> +	if (ps_bridge->in_fw_update)
> +		return;
> +
> +	if (ps_bridge->enabled)
> +		return;
> +
> +	err = drm_panel_prepare(ps_bridge->panel);
> +	if (err < 0) {
> +		DRM_ERROR("failed to prepare panel: %d\n", err);
> +		return;
> +	}
> +
> +	err = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
> +				    ps_bridge->supplies);
> +	if (err < 0) {
> +		DRM_ERROR("cannot enable regulators %d\n", err);
> +		goto err_panel_unprepare;
> +	}
> +
> +	gpiod_set_value(ps_bridge->gpio_power_down, 1);
> +	gpiod_set_value(ps_bridge->gpio_reset, 0);
> +	usleep_range(2000, 2500);
> +	gpiod_set_value(ps_bridge->gpio_reset, 1);
> +
> +	/*
> +	 * Wait for the ps8640 embed mcu ready
> +	 * First wait 200ms and then check the mcu ready flag every 20ms
> +	 */
> +	msleep(200);
> +
> +	timeout = ktime_add_ms(ktime_get(), 200);
> +	for (;;) {
> +		err = ps8640_read(client, PAGE2_GPIO_H, &set_vdo_done, 1);
> +		if (err < 0) {
> +			DRM_ERROR("failed read PAGE2_GPIO_H: %d\n", err);
> +			goto err_regulators_disable;
> +		}
> +		if ((set_vdo_done & PS_GPIO9) == PS_GPIO9)
> +			break;
> +		if (ktime_compare(ktime_get(), timeout) > 0)
> +			break;
> +		msleep(20);
> +	}
> +
> +	msleep(50);
> +
> +	ps8640_read(page1, PAGE1_VSTART, &vstart, 1);
> +	DRM_INFO("PS8640 PAGE1.0x6B = 0x%x\n", vstart);
> +
> +	/**
> +	 * The Manufacturer Command Set (MCS) is a device dependent interface
> +	 * intended for factory programming of the display module default
> +	 * parameters. Once the display module is configured, the MCS shall be
> +	 * disabled by the manufacturer. Once disabled, all MCS commands are
> +	 * ignored by the display interface.
> +	 */
> +	ps8640_read(client, PAGE2_MCS_EN, &mcs_en, 1);
> +	ps8640_write_byte(client, PAGE2_MCS_EN, mcs_en & ~MCS_EN);
> +
> +	if (ps_bridge->info.version == 0)
> +		ps8640_get_mcu_fw_version(ps_bridge);
> +
> +	err = ps8640_bridge_unmute(ps_bridge);
> +	if (err)
> +		DRM_ERROR("failed to enable unmutevideo: %d\n", err);
> +	/* Switch access edp panel's edid through i2c */
> +	ps8640_write_byte(client, PAGE2_I2C_BYPASS, I2C_BYPASS_EN);
> +	ps_bridge->enabled = true;
> +
> +	return;
> +
> +err_regulators_disable:
> +	regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> +			       ps_bridge->supplies);
> +err_panel_unprepare:
> +	drm_panel_unprepare(ps_bridge->panel);
> +}
> +
> +static void ps8640_enable(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	int err;
> +
> +	err = drm_panel_enable(ps_bridge->panel);
> +	if (err < 0)
> +		DRM_ERROR("failed to enable panel: %d\n", err);
> +}
> +
> +static void ps8640_disable(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	int err;
> +
> +	err = drm_panel_disable(ps_bridge->panel);
> +	if (err < 0)
> +		DRM_ERROR("failed to disable panel: %d\n", err);
> +}
> +
> +static void ps8640_post_disable(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	int err;
> +
> +	if (ps_bridge->in_fw_update)
> +		return;
> +
> +	if (!ps_bridge->enabled)
> +		return;
> +
> +	ps_bridge->enabled = false;
> +
> +	err = ps8640_bridge_mute(ps_bridge);
> +	if (err < 0)
> +		DRM_ERROR("failed to unmutevideo: %d\n", err);
> +
> +	gpiod_set_value(ps_bridge->gpio_reset, 0);
> +	gpiod_set_value(ps_bridge->gpio_power_down, 0);
> +	err = regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> +				     ps_bridge->supplies);
> +	if (err < 0)
> +		DRM_ERROR("cannot disable regulators %d\n", err);
> +
> +	err = drm_panel_unprepare(ps_bridge->panel);
> +	if (err)
> +		DRM_ERROR("failed to unprepare panel: %d\n", err);
> +}
> +
> +static int ps8640_get_modes(struct drm_connector *connector)
> +{
> +	struct ps8640 *ps_bridge = connector_to_ps8640(connector);
> +	struct edid *edid;
> +	int num_modes = 0;
> +	bool power_off;
> +
> +	if (ps_bridge->edid)
> +		return drm_add_edid_modes(connector, ps_bridge->edid);
> +
> +	power_off = !ps_bridge->enabled;
> +	ps8640_pre_enable(&ps_bridge->bridge);
> +
> +	edid = drm_get_edid(connector, ps_bridge->page[0]->adapter);
> +	if (!edid)
> +		goto out;
> +
> +	ps_bridge->edid = edid;
> +	drm_connector_update_edid_property(connector, ps_bridge->edid);
> +	num_modes = drm_add_edid_modes(connector, ps_bridge->edid);
> +
> +out:
> +	if (power_off)
> +		ps8640_post_disable(&ps_bridge->bridge);
> +
> +	return num_modes;
> +}
> +
> +static const struct drm_connector_helper_funcs ps8640_connector_helper_funcs = {
> +	.get_modes = ps8640_get_modes,
> +};
> +
> +static enum drm_connector_status ps8640_detect(struct drm_connector *connector,
> +					       bool force)
> +{
> +	return connector_status_connected;
> +}
> +
> +static const struct drm_connector_funcs ps8640_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.detect = ps8640_detect,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +int ps8640_bridge_attach(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	struct device *dev = &ps_bridge->page[0]->dev;
> +	struct device_node *in_ep, *dsi_node = NULL;
> +	struct mipi_dsi_device *dsi;
> +	struct mipi_dsi_host *host = NULL;
> +	int ret;
> +	const struct mipi_dsi_device_info info = { .type = "ps8640",
> +						   .channel = 0,
> +						   .node = NULL,
> +						 };
> +
> +	ret = drm_connector_init(bridge->dev, &ps_bridge->connector,
> +				 &ps8640_connector_funcs,
> +				 DRM_MODE_CONNECTOR_eDP);
> +
> +	if (ret) {
> +		DRM_ERROR("Failed to initialize connector with drm: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_connector_helper_add(&ps_bridge->connector,
> +				 &ps8640_connector_helper_funcs);
> +
> +	ps_bridge->connector.dpms = DRM_MODE_DPMS_ON;
> +	drm_connector_attach_encoder(&ps_bridge->connector,
> +					  bridge->encoder);
> +
> +	if (ps_bridge->panel)
> +		drm_panel_attach(ps_bridge->panel, &ps_bridge->connector);
> +
> +	/* port@0 is ps8640 dsi input port */
> +	in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> +	if (in_ep) {
> +		dsi_node = of_graph_get_remote_port_parent(in_ep);
> +		of_node_put(in_ep);
> +	}
> +
> +	if (dsi_node) {
> +		host = of_find_mipi_dsi_host_by_node(dsi_node);
> +		of_node_put(dsi_node);
> +		if (!host) {
> +			ret = -ENODEV;
> +			goto err;
> +		}
> +	}
> +
> +	dsi = mipi_dsi_device_register_full(host, &info);
> +	if (IS_ERR(dsi)) {
> +		dev_err(dev, "failed to create dsi device\n");
> +		ret = PTR_ERR(dsi);
> +		goto err;
> +	}
> +
> +	ps_bridge->dsi = dsi;
> +
> +	dsi->host = host;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> +				     MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->lanes = 4;
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret)
> +		goto err_dsi_attach;
> +
> +	return 0;
> +
> +err_dsi_attach:
> +	mipi_dsi_device_unregister(dsi);
> +err:
> +	if (ps_bridge->panel)
> +		drm_panel_detach(ps_bridge->panel);
> +	drm_connector_cleanup(&ps_bridge->connector);
> +	return ret;
> +}
> +
> +static const struct drm_bridge_funcs ps8640_bridge_funcs = {
> +	.attach = ps8640_bridge_attach,
> +	.disable = ps8640_disable,
> +	.post_disable = ps8640_post_disable,
> +	.pre_enable = ps8640_pre_enable,
> +	.enable = ps8640_enable,
> +};
> +
> +/* Firmware Version is returned as Major.Minor */
> +static ssize_t fw_version_show(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	struct ps8640 *ps_bridge = dev_get_drvdata(dev);
> +	struct ps8640_info *info = &ps_bridge->info;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%u.%u\n", info->version >> 8,
> +			 info->version & 0xff);
> +}
> +
> +/* Hardware Version is returned as FamilyID.VariantID */
> +static ssize_t hw_version_show(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	struct ps8640 *ps_bridge = dev_get_drvdata(dev);
> +	struct ps8640_info *info = &ps_bridge->info;
> +
> +	return scnprintf(buf, PAGE_SIZE, "ps%u.%u\n", info->family_id,
> +			 info->variant_id);
> +}
> +
> +static DEVICE_ATTR_RO(fw_version);
> +static DEVICE_ATTR_RO(hw_version);
> +
> +static struct attribute *ps8640_attrs[] = {
> +	&dev_attr_fw_version.attr,
> +	&dev_attr_hw_version.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group ps8640_attr_group = {
> +	.attrs = ps8640_attrs,
> +};
> +
> +static void ps8640_remove_sysfs_group(void *data)
> +{
> +	struct ps8640 *ps_bridge = data;
> +
> +	sysfs_remove_group(&ps_bridge->page[0]->dev.kobj, &ps8640_attr_group);
> +}
> +
> +static int ps8640_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct ps8640 *ps_bridge;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *port, *out_ep;
> +	struct device_node *panel_node = NULL;
> +	int ret;
> +	u32 i;
> +
> +	ps_bridge = devm_kzalloc(dev, sizeof(*ps_bridge), GFP_KERNEL);
> +	if (!ps_bridge)
> +		return -ENOMEM;
> +
> +	/* port@1 is ps8640 output port */
> +	port = of_graph_get_port_by_id(np, 1);
> +	if (port) {
> +		out_ep = of_get_child_by_name(port, "endpoint");
> +		of_node_put(port);
> +		if (out_ep) {
> +			panel_node = of_graph_get_remote_port_parent(out_ep);
> +			of_node_put(out_ep);
> +		}
> +	}
> +	if (panel_node) {
> +		ps_bridge->panel = of_drm_find_panel(panel_node);
> +		of_node_put(panel_node);
> +		if (IS_ERR(ps_bridge->panel))
> +			return PTR_ERR(ps_bridge->panel);
> +	}
> +
> +	mutex_init(&ps_bridge->fw_mutex);
> +	ps_bridge->supplies[0].supply = "vdd33";
> +	ps_bridge->supplies[1].supply = "vdd12";
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ps_bridge->supplies),
> +				      ps_bridge->supplies);
> +	if (ret) {
> +		dev_info(dev, "failed to get regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ps_bridge->gpio_mode_sel = devm_gpiod_get_optional(&client->dev,
> +							     "mode-sel",
> +							     GPIOD_OUT_HIGH);
> +	if (IS_ERR(ps_bridge->gpio_mode_sel)) {
> +		ret = PTR_ERR(ps_bridge->gpio_mode_sel);
> +		dev_err(dev, "cannot get mode-sel %d\n", ret);
> +		return ret;
> +	}
> +
> +	ps_bridge->gpio_power_down = devm_gpiod_get(&client->dev, "sleep",
> +					       GPIOD_OUT_LOW);
> +	if (IS_ERR(ps_bridge->gpio_power_down)) {
> +		ret = PTR_ERR(ps_bridge->gpio_power_down);
> +		dev_err(dev, "cannot get sleep: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Request the reset pin low to avoid the bridge being
> +	 * initialized prematurely
> +	 */
> +	ps_bridge->gpio_reset = devm_gpiod_get(&client->dev, "reset",
> +					       GPIOD_OUT_LOW);
> +	if (IS_ERR(ps_bridge->gpio_reset)) {
> +		ret = PTR_ERR(ps_bridge->gpio_reset);
> +		dev_err(dev, "cannot get reset: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
> +	ps_bridge->bridge.of_node = dev->of_node;
> +
> +	ps_bridge->page[0] = client;
> +
> +	/*
> +	 * ps8640 uses multiple addresses, use dummy devices for them
> +	 * page[0]: for DP control
> +	 * page[1]: for VIDEO Bridge
> +	 * page[2]: for control top
> +	 * page[3]: for DSI Link Control1
> +	 * page[4]: for MIPI Phy
> +	 * page[5]: for VPLL
> +	 * page[6]: for DSI Link Control2
> +	 * page[7]: for spi rom mapping
> +	 */
> +	for (i = 1; i < MAX_DEVS; i++) {
> +		ps_bridge->page[i] = i2c_new_dummy(client->adapter,
> +						   client->addr + i);

I think this has changed to i2c_new_dummy_device().

Are you planning to rebase and respin the series?

Regrads,
Matthias

> +		if (!ps_bridge->page[i]) {
> +			dev_err(dev, "failed i2c dummy device, address%02x\n",
> +				client->addr + i);
> +			ret = -EBUSY;
> +			goto exit_dummy;
> +		}
> +	}
> +	i2c_set_clientdata(client, ps_bridge);
> +
> +	ret = sysfs_create_group(&client->dev.kobj, &ps8640_attr_group);
> +	if (ret) {
> +		dev_err(dev, "failed to create sysfs entries: %d\n", ret);
> +		goto exit_dummy;
> +	}
> +
> +	ret = devm_add_action(dev, ps8640_remove_sysfs_group, ps_bridge);
> +	if (ret) {
> +		dev_err(dev, "failed to add sysfs cleanup action: %d\n", ret);
> +		goto exit_remove_sysfs;
> +	}
> +
> +	drm_bridge_add(&ps_bridge->bridge);
> +	return 0;
> +
> +exit_remove_sysfs:
> +	sysfs_remove_group(&ps_bridge->page[0]->dev.kobj, &ps8640_attr_group);
> +exit_dummy:
> +	while (--i)
> +		i2c_unregister_device(ps_bridge->page[i]);
> +	return ret;
> +}
> +
> +static int ps8640_remove(struct i2c_client *client)
> +{
> +	struct ps8640 *ps_bridge = i2c_get_clientdata(client);
> +	int i = MAX_DEVS;
> +
> +	drm_bridge_remove(&ps_bridge->bridge);
> +	sysfs_remove_group(&ps_bridge->page[0]->dev.kobj, &ps8640_attr_group);
> +	while (--i)
> +		i2c_unregister_device(ps_bridge->page[i]);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id ps8640_i2c_table[] = {
> +	{ "ps8640", 0 },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i2c, ps8640_i2c_table);
> +
> +static const struct of_device_id ps8640_match[] = {
> +	{ .compatible = "parade,ps8640" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, ps8640_match);
> +
> +static struct i2c_driver ps8640_driver = {
> +	.id_table = ps8640_i2c_table,
> +	.probe = ps8640_probe,
> +	.remove = ps8640_remove,
> +	.driver = {
> +		.name = "ps8640",
> +		.of_match_table = ps8640_match,
> +	},
> +};
> +module_i2c_driver(ps8640_driver);
> +
> +MODULE_AUTHOR("Jitao Shi <jitao.shi@mediatek.com>");
> +MODULE_AUTHOR("CK Hu <ck.hu@mediatek.com>");
> +MODULE_DESCRIPTION("PARADE ps8640 DSI-eDP converter driver");
> +MODULE_LICENSE("GPL v2");
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
