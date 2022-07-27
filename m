Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19952582261
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 10:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BCBC2FD2;
	Wed, 27 Jul 2022 08:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD5CC2B64
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 08:47:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5A0BCCE20A0;
 Wed, 27 Jul 2022 08:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1CAC433C1;
 Wed, 27 Jul 2022 08:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658911651;
 bh=4GuO28BznivsDSDth2Dn8Mdw0gdA1bj+aNBMQfgsvzg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Qeiw6FahKTgJxAZujGiIyCQtO+OAtKfwtkI6PQP5YfplD2wNjTCPeJ2JzgncmNsTO
 Uobyom2VtiwNQ3CMnMPODLwx/f3zupqWRpaATCXrl6BEdsvKxAZi9RHJTiatpKtnxa
 JH73JF7l4G5B7C7IakWFO1jJNJz35dgP2fAKOHzTQdCVIEVEF/6Y98W4V32yAw0om2
 RlO1LY3XhAEjlpApVFlwpgvPMAy9cjVuKVV+FLs4pWjC5A8cQa1QPQlMlSZJhRMV1w
 zXxSkrCrX0fU7VpEDRbhwdYfFsGpphxXfbNBmCSHAh6uf6sX8IssuiC51ma3iWs8gU
 IS6LsrY+dIRlA==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: add sdm845-google-blueline (Pixel 3)
References: <20220718213051.1475108-1-caleb@connolly.tech>
 <20220718213051.1475108-3-caleb@connolly.tech>
 <d8f24aca-2cdf-413f-2b30-ad41b81be1a5@linaro.org>
Date: Wed, 27 Jul 2022 11:47:25 +0300
In-Reply-To: <d8f24aca-2cdf-413f-2b30-ad41b81be1a5@linaro.org> (Dmitry
 Baryshkov's message of "Tue, 19 Jul 2022 01:13:38 +0300")
Message-ID: <87o7xbosbm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Caleb Connolly <caleb@connolly.tech>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, ath10k@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ ath10k list

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On 19/07/2022 00:30, Caleb Connolly wrote:
>
>> From: Amit Pundir <amit.pundir@linaro.org>
>>
>> This adds an initial dts for the Blueline (Pixel 3). Supported
>> functionality includes display, Debug UART, UFS, USB-C (peripheral), WiFi,
>> Bluetooth and modem.
>>
>> Bootloader compatible board and msm IDs are needed for the kernel to boot
>> with Pixel3 bootloader, so those are added.
>>
>> GPIOs 0 through 3 and 81 through 84 are configured to not be accessible
>> from the application CPUs, so we mark them as reserved to allow the Pixel 3
>> to boot.
>>
>> The reserved-memory locations where obtained from downstream using
>> kernel logs:
>> https://gist.github.com/calebccff/090d10bfac3cb9e9bd98dda30b054c96
>>
>> The rmtfs region is allocated with UIO, making it technically "dynamic".
>> It's address and size can be read from sysfs:
>>
>> blueline:/ # cat /sys/class/uio/uio0/name
>> rmtfs
>> at /sys/class/uio/uio0/maps/map0/addr
>> 0x00000000f2701000
>> blueline:/ # cat /sys/class/uio/uio0/maps/map0/size
>> 0x0000000000200000
>>
>> Like the OnePlus 6, it needs 1kB reserved on either side of the rmtfs
>> memory to workaround some XPU bug which would otherwise cause erroneous
>> XPU violations when accessing the rmtfs_mem region.
>>
>> For wifi, the pixel 3 reports a board-id of 0xFF, and downstream
>> only includes a single bdwlan file. The qcom,ath10k-calibration-variant
>> property is set to ensure that the correct calibration data is used.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> [AmitP: Cherry-picked and refactored from Bjorn's db845c dts
>>          ("arm64: dts: qcom: Add Dragonboard 845c") https://lkml.org/lkml/2019/6/6/7]
>> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
>> [sumits: merged commits to add board and msm ids, gpio range reservation,
>>    ufs device-reset gpio and adaptation to v5.5+ changes]
>> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
>> [vinod: Add display nodes]
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> [caleb: remove db845c bits, cleanup, add reserved-memory for modem/wifi]
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>
> Thanks for your patch, few minor items to improve.

[...]

>> +&wifi {
>> +	status = "okay";
>> +
>> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
>> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
>> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
>> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>> +
>> +	qcom,snoc-host-cap-8bit-quirk;
>> +	qcom,ath10k-calibration-variant = "google_blueline";
>
> Ideally Kalle Valo should bless this string, added him to the Cc list.
> Could you please submit the board file to the ath10k (see [1] for the
> description and [2] for an example).

Thanks for CC. I prefer "google-blueline" but that's really a cosmetic
issue.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
