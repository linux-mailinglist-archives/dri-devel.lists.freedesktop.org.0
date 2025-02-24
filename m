Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC5CA42194
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B9210E4F8;
	Mon, 24 Feb 2025 13:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nsjpHz21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18C110E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 08:52:09 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so26059355e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 00:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740387128; x=1740991928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=rfttPucZes4uslCtilxnixZCmYMBBrCsgPvpifvl92U=;
 b=nsjpHz214eq0iBZgbFiH623GPu4lCCt+q8sM5Ihxi645pLHWGvJBbQEGg8bIOxr5lx
 US4ahhu8D6ra8H72e8sAkN2MwZ/0r7Fh/w3FcNqjDjUUYPn65kMyVj2EP2id4bhiDvlr
 hRDItUO9q0hbq0y0BTVDlMeKysSpS9T5k+AGgXyYkmE97fs7PA4P7zT2j9sUlFcGuerK
 h2Keg/CrJ72Kj1nW8XNJAKVkQSRKtlFogv5OikYkubyuXR05+Yyeyf4heMHWLk9DK2oU
 jfgHIGyTLWOecw7y/wCkBk1RLYVLnOc5aKXXtvxoxofRGhBVdXCYgBr0abRaK7zql8Yz
 3lGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740387128; x=1740991928;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rfttPucZes4uslCtilxnixZCmYMBBrCsgPvpifvl92U=;
 b=K8Vky/CB5srye56JwesDSLNnIc9i2apubbnrqDcjkQdZbiVyhPBZbSyxIw71Zy59YK
 DlixQGqRmxFntADrZ5hM6m5Z7DPq5qAn5nsRUhjQObalG6XVt5eUwnM9a03PoacFf1OW
 5aByySzdaq8+XhyHRJeH5+THY0FMbe2TMrFj2xTJBiYggHktsNQK5/wzkYbYooEWP32I
 0c/H+YaB+zWw3C/+wirOIaaldueCZWmRu+dWTBxpOT7XE+7rOD4wcFjb98bIZwDs3lwg
 1yugsH1tdFQIlsZkjCH2xOZfaqNBMJZZBwj6/CONDJ9fJ7hDL7s7RbcpEChWC/Lncmee
 a1og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYdwfRex1pHoJwU7WAx5y3b8L9yoyK5IPSvGIGmK5Dnds/qug/nz0NnE4ex9kmkm/yt9147I/Ikjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8tVyt6TRng7dn2GZKenkb2ZDDzDzGr+LzSFoX7+Ve5+vnkUOF
 JeAUJZIrydWRWfZ7JhWpi18J7BqjegxSbmCWCenLKC5jT1j8zzsqw6p0ofzlOuk=
X-Gm-Gg: ASbGncsqB3yGoNaznbOuZPmRa+L4CbD4Jo6eu8lgpmA46VBgHvOEvJHvW5hipvkHGSB
 mO3JAIG4o17Fkq9KM9jf3s+o4XlxXpymyYPAyvKoS8GDrTlSUpmXnkNlb3n6AFi7dc4FniGPf6f
 HrqhyuvIRuG8IjDk3j5CUhVa9h7W8Kq3InWrW2LDzUW3XCx39w6k+AeXFHt26MYL13QlQ20+xGn
 8KyHFIYIg1jLh9edrKIYdxRoSG44trwm5UjsiNPEF2xpaXA/xdcQeyS2L8pncYUYtiUPJtPMpsN
 r8ydnzkFNakyVXgbzU8qTEGZZD9UdPkgVWfEzfELrdJoDll1eUOCQUg9SBuRqxlVojXY4tOIkKi
 1hpM=
X-Google-Smtp-Source: AGHT+IGc4DlL71WulAAnKcQ9CzF1y/33BchgEuu9bZ5o2bSiiIB3/0bTM2b5M5+480mvGS24HXxp7w==
X-Received: by 2002:a05:600c:19ce:b0:439:a1c7:7b2d with SMTP id
 5b1f17b1804b1-439aeae05fbmr98203575e9.4.1740387128219; 
 Mon, 24 Feb 2025 00:52:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:825b:5392:ef70:cc0b?
 ([2a01:e0a:982:cbb0:825b:5392:ef70:cc0b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce65dsm99552155e9.1.2025.02.24.00.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 00:52:07 -0800 (PST)
Message-ID: <794bf229-df4a-41f3-a8a4-8b1362eb7f04@linaro.org>
Date: Mon, 24 Feb 2025 09:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
To: kernel test robot <lkp@intel.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
References: <20250110074458.3624094-3-christianshewitt@gmail.com>
 <202501210513.GCec6kts-lkp@intel.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <202501210513.GCec6kts-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 20/01/2025 22:56, kernel test robot wrote:
> Hi Christian,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.13 next-20250120]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hewitt/Revert-drm-meson-vclk-fix-calculation-of-59-94-fractional-rates/20250110-154701
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250110074458.3624094-3-christianshewitt%40gmail.com
> patch subject: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
> config: arm-randconfig-r072-20250118 (https://download.01.org/0day-ci/archive/20250121/202501210513.GCec6kts-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210513.GCec6kts-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501210513.GCec6kts-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/gpib/fmh_gpib/fmh_gpib.o
>>> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/meson/meson-drm.ko] undefined!
> 

Please use do_div() when dividing 64bit numbers to please 32-bit platforms.

Neil
