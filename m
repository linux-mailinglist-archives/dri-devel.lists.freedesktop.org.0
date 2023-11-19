Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C497F08F3
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 21:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF3710E0E8;
	Sun, 19 Nov 2023 20:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AEF10E0E8;
 Sun, 19 Nov 2023 20:51:59 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507bd644a96so5179478e87.3; 
 Sun, 19 Nov 2023 12:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700427117; x=1701031917; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=uu9XWxOM4gpFfh/NFjHiFzJcxz5jo+VBF/7USM4yGiU=;
 b=BjRMknig0Ch2SEgaJgTWj1Ee8/8BFIOpf7fMW7fZdFQK0CgJppb56RhGMuawknUR/b
 0tL6FrISu6l7vBfdgPN4/b8PZSEeNeDb8fE524XDiRvNJyDvGsOoENRDcSOTpGyu5E2M
 hzu/fgHOJfwfKlB+f/URZAYUKJ5kbjKzvYk+kJOIFy7e+3RefR9X86BeBHlwNgxI2dbS
 M3s4Lx1SccrmJfE+GFAxanp2hntsgykx+3vvDoPpDR1Orvy0i5Mba+M4VpkdAu/FtoIA
 jYFrjjQZdy31+g0nYERuboPZfIZ9DAXs3JbaC7+x9wwx3Fr9X+2X42VQefpa9JUrqzeN
 9fVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700427117; x=1701031917;
 h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uu9XWxOM4gpFfh/NFjHiFzJcxz5jo+VBF/7USM4yGiU=;
 b=vW4Tref1CTmlR5Gl0T++QAaEZdmfbY8A3QMaPyei/dllUcIQjJmG4F1V+DRMvesZJU
 RHGf6TUxCvw7MvkgnfuzfwFS5yUkw4nSB923HI4tpyaTJkfXHUlyvJxWsHhybiT9zSZM
 RT3wRidGo3YOMJ9l7n1i1w60Q9ZLxppswki6aIHw5kcCMA3vIdCw666lzGq9KXcpgHSn
 NtWOKE6GdBfoScxoXQq0LcH35i535q6PbnRjrlPfnPYpfDZRqXi4BR3dHSWnSpkK9fSt
 XR6E9Nogamwk6I5zB3c5J5pg1Dsb4G6i3ZIbR9H16ITrmDNDsoNunJM5cK8kV+l82djo
 E3qA==
X-Gm-Message-State: AOJu0Ywm+tFmJavaxnnLMGx5tdaf1jQZzyI9aVcDGJ4zrx9BBkUfJ7kD
 16+g2iF8bpnmaSW5zs7q9xQ=
X-Google-Smtp-Source: AGHT+IGkcUNAKJspmSgawNPYtDADP2ghxS0J5OcNfogBhKT1Lxa0wlmDoysvJFNbsGkprNkSEa8XVg==
X-Received: by 2002:ac2:5312:0:b0:507:9a93:84df with SMTP id
 c18-20020ac25312000000b005079a9384dfmr4300199lfh.25.1700427116798; 
 Sun, 19 Nov 2023 12:51:56 -0800 (PST)
Received: from ?IPV6:2a01:c23:bde4:3e00:9589:aeb1:adc4:e0f?
 (dynamic-2a01-0c23-bde4-3e00-9589-aeb1-adc4-0e0f.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:9589:aeb1:adc4:e0f])
 by smtp.googlemail.com with ESMTPSA id
 a16-20020a50e710000000b00532eba07773sm2861341edn.25.2023.11.19.12.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Nov 2023 12:51:56 -0800 (PST)
Message-ID: <bd4be069-b86d-4a69-aa0f-71257f93691f@gmail.com>
Date: Sun, 19 Nov 2023 21:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 00/20] remove I2C_CLASS_DDC support
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Helge Deller <deller@gmx.de>, Wolfram Sang <wsa@kernel.org>,
 intel-gfx@lists.freedesktop.org
References: <20231119112826.5115-1-hkallweit1@gmail.com>
 <e40b913f-379f-4b6e-a0d2-844887a17284@gmx.de>
 <b336a8e3-44e7-4f56-a950-5155675b5628@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
In-Reply-To: <b336a8e3-44e7-4f56-a950-5155675b5628@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqin Liu <yongqin.liu@linaro.org>, amd-gfx@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, linux-sunxi@lists.linux.dev,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jocelyn Falempe <jfalempe@redhat.com>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, John Stultz <jstultz@google.com>,
 freedreno@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19.11.2023 21:48, Heiner Kallweit wrote:
> On 19.11.2023 21:28, Helge Deller wrote:
>> On 11/19/23 12:28, Heiner Kallweit wrote:
>>> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
>>> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
>>> Class-based device auto-detection is a legacy mechanism and shouldn't
>>> be used in new code. So we can remove this class completely now.
>>>
>>> Preferably this series should be applied via the i2c tree.
>>
>> The fbdev changes look at least ok so far, so:
>> Acked-by: Helge Deller <deller@gmx.de>   #fbdev
>>
> I think this refers to patch 5 of the series. Could you please reply
> to patch 5 instead of the cover letter with your acked-by so that
> patchwork gets it right? Thanks!
> 
Sorry, just looked at where you are in To, not Cc.
So your ack includes patches 6, 9, 10, 13?

>>
>>> v2:
>>> - change tag in commit subject of patch 03
>>> - add ack tags
>>> v3:
>>> - fix a compile error in patch 5
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>
>>> ---
>>>
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c           |    1 -
>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
>>>   drivers/gpu/drm/ast/ast_i2c.c                     |    1 -
>>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c         |    1 -
>>>   drivers/gpu/drm/display/drm_dp_helper.c           |    1 -
>>>   drivers/gpu/drm/display/drm_dp_mst_topology.c     |    1 -
>>>   drivers/gpu/drm/gma500/cdv_intel_dp.c             |    1 -
>>>   drivers/gpu/drm/gma500/intel_gmbus.c              |    1 -
>>>   drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c        |    1 -
>>>   drivers/gpu/drm/gma500/psb_intel_sdvo.c           |    1 -
>>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |    1 -
>>>   drivers/gpu/drm/i915/display/intel_gmbus.c        |    1 -
>>>   drivers/gpu/drm/i915/display/intel_sdvo.c         |    1 -
>>>   drivers/gpu/drm/loongson/lsdc_i2c.c               |    1 -
>>>   drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c           |    1 -
>>>   drivers/gpu/drm/mgag200/mgag200_i2c.c             |    1 -
>>>   drivers/gpu/drm/msm/hdmi/hdmi_i2c.c               |    1 -
>>>   drivers/gpu/drm/radeon/radeon_i2c.c               |    1 -
>>>   drivers/gpu/drm/rockchip/inno_hdmi.c              |    1 -
>>>   drivers/gpu/drm/rockchip/rk3066_hdmi.c            |    1 -
>>>   drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c            |    1 -
>>>   drivers/video/fbdev/core/fb_ddc.c                 |    1 -
>>>   drivers/video/fbdev/cyber2000fb.c                 |    1 -
>>>   drivers/video/fbdev/i740fb.c                      |    1 -
>>>   drivers/video/fbdev/intelfb/intelfb_i2c.c         |   15 +++++----------
>>>   drivers/video/fbdev/matrox/i2c-matroxfb.c         |   12 ++++--------
>>>   drivers/video/fbdev/s3fb.c                        |    1 -
>>>   drivers/video/fbdev/tdfxfb.c                      |    1 -
>>>   drivers/video/fbdev/tridentfb.c                   |    1 -
>>>   drivers/video/fbdev/via/via_i2c.c                 |    1 -
>>>   include/linux/i2c.h                               |    1 -
>>>   31 files changed, 9 insertions(+), 47 deletions(-)
>>>
>>
> 

