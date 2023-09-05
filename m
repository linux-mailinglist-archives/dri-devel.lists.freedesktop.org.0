Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E217921CD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 12:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807A410E186;
	Tue,  5 Sep 2023 10:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6B310E19B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 10:09:43 +0000 (UTC)
Received: from [192.168.1.23] (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 73F02660716C;
 Tue,  5 Sep 2023 11:09:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693908581;
 bh=PHDlogbWriNpSInDU6bgIDQgv8X9PfNf4xdH4kqZ9Sk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eQ77jxssWPUan9oBzIXWOuFcqRHIwZgu5AUK/namoH9kzlCuPUDvKCAxDWPHn9Q5+
 D3xfI2I2zg48ZwcE0p2Wsd5JJZxOMmajFxZWcv20Yr30f3EnUFO4kBnlZT5bmmzfj+
 PhthVN+NmbADogATjEMdgnWBQRZqoHZe4Tj6lbn1MeGwDArJ3AYlR2+cvQmpNkdOTs
 puY18CIyqzWoC6EBwxfSYDzW7Uaf77Oa0ft/WGm49VfAF5Q1u5VH8dddlrrssR6y0f
 0OJ7ZlIC7Xy2wvhqv1j0HR0o04z78w+PPS1skuLvbBuoP4mYovi4K88GhE+E6XJ81Q
 /0azjpFaYmK8Q==
Message-ID: <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com>
Date: Tue, 5 Sep 2023 15:39:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com>
 <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
 <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
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
Cc: robdclark@google.com, daniels@collabora.com, emma@anholt.net,
 gustavo.padovan@collabora.com, linux-arm-msm@vger.kernel.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry, Maxime,

On 05/09/23 14:13, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Sep 04, 2023 at 07:59:26PM +0300, Dmitry Baryshkov wrote:
>> On Mon, 4 Sept 2023 at 19:16, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>>>
>>> Force db410c to host mode to fix network issue which results in failure
>>> to mount root fs via NFS.
>>> See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
>>>
>>> Use fdtoverlay command to merge base device tree with an overlay
>>> which contains the fix for USB controllers to work in host mode.
>>>
>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>> ---
>>>
>>> v2:
>>>    - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
>>>
>>> ---
>>>   drivers/gpu/drm/ci/build.sh                         |  5 +++++
>>>   .../gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts  | 13 +++++++++++++
>>>   2 files changed, 18 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>>>
>>> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
>>> index 7b014287a041..92ffd98cd09e 100644
>>> --- a/drivers/gpu/drm/ci/build.sh
>>> +++ b/drivers/gpu/drm/ci/build.sh
>>> @@ -92,6 +92,11 @@ done
>>>
>>>   if [[ -n ${DEVICE_TREES} ]]; then
>>>       make dtbs
>>> +    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
>>> +        dtc -@ -I dts -O dtb -o drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>>> +        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo
>>> +        mv arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
>>> +    fi
>>>       cp ${DEVICE_TREES} /lava-files/.
>>>   fi
>>>
>>> diff --git a/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>>> new file mode 100644
>>> index 000000000000..57b7604f1c23
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>>> @@ -0,0 +1,13 @@
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +/ {
>>> +    fragment@0 {
>>> +        target-path = "/soc@0";
>>> +        __overlay__ {
>>> +            usb@78d9000 {
>>> +                dr_mode = "host";
>>> +            };
>>> +        };
>>> +    };
>>> +};
>>> --
>>> 2.40.1
>>
>> Can we use normal dtso syntax here instead of defining fragments manually?
> 
> What Dmitry is hinting about is to use the "Sugar Syntax". There a good documentation here:
> https://source.android.com/docs/core/architecture/dto/syntax


With the below DTO syntax,
/dts-v1/;
/plugin/;

&usb {
   usb@78d9000 {
     dr_mode = "host";
   };
};

Decoded dtbo file is,
/dts-v1/;

/ {

	fragment@0 {
		target = <0xffffffff>;

		__overlay__ {

			usb@78d9000 {
				dr_mode = "host";
			};
		};
	};

	__fixups__ {
		usb = "/fragment@0:target:0";
	};
};

With the previous fix using fragment we get,
/ {

	fragment@0 {
		target-path	 = "/soc@0";

		__overlay__ {

			usb@78d9000 {
				dr_mode = "host";
			};
		};
	};
};

Decoded apq8016-sbc.dtb file with the fix (setting dr_mode to host) is,
/dts-v1/;
/ {	
	soc@0 {
		usb@78d9000 {
			dr_mode = "host";
		};	
	};
};

How can set the target to "soc@0" using the DTO syntax? Otherwise 
fdtoverlay fails to apply the dtbo file with the base dtb.

Regards,
Vignesh
