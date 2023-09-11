Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0854D79A7F7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 14:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5389110E1A3;
	Mon, 11 Sep 2023 12:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA8F10E2E0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 12:39:09 +0000 (UTC)
Received: from [192.168.1.23] (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7697366072FE;
 Mon, 11 Sep 2023 13:39:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694435947;
 bh=MvnxIayMmPEsq2MzqcxVyvlilHrYAvXUGbuaSX/LxBs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LZ1l9Qf8rixIpz+94pqn/E7NIehaqLf/Jh8WJCYZmTcCqgTQa2ONJuqnA67jpdhKT
 X21KmOmasjXROM25ITuqounnLMzzSCjVDiqgkRV15kt1le7Q9n+vNhRFom03J7M9Zl
 dez0ecWl/mjrXet7A1BYTCEJOzEqwiiN/nTjyI6asZvlUm/uQIxpTaiZ5ofEePomjR
 +WL4/ZD/aGiRPfDFYvuWIeQ60STYhgwtQo/TZTdpNn6vdUJmPVUoilr+Wjx/dnSWng
 vV844qIYFJT5iAViLP2AG/G58VNVknnvHlDgnJQ6FRYCESGBwRdR1iSZJqVm7+wFf/
 YTI7qV/10AamQ==
Message-ID: <ca518c28-1375-9eaf-ffd4-bedf06810000@collabora.com>
Date: Mon, 11 Sep 2023 18:08:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/9] arm64: dts: qcom: apq8016-sbc: Add overlay for usb
 host mode
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, dri-devel@lists.freedesktop.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-3-vignesh.raman@collabora.com>
 <ca53e4cd-1c89-482d-9662-19926efb5b47@linaro.org>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ca53e4cd-1c89-482d-9662-19926efb5b47@linaro.org>
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
Cc: emma@anholt.net, virtualization@lists.linux-foundation.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, agross@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, daniels@collabora.com, linux-arm-msm@vger.kernel.org,
 mripard@kernel.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 andersson@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dmitry.baryshkov@linaro.org, guilherme.gallo@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Konrad,

On 11/09/23 17:20, Konrad Dybcio wrote:
> On 8.09.2023 17:22, Vignesh Raman wrote:
>> Due to the presence of the fastboot micro cable in the CI farm,
>> it causes the hardware to remain in gadget mode instead of host mode.
>> So it doesn't find the network, which results in failure to mount root
>> fs via NFS.
>>
>> Add an overlay dtso file that sets the dr_mode to host, allowing
>> the USB controllers to work in host mode. This dtso file will be used
>> in drm-ci, mesa-ci.
>>
>> Overlay DT file uses the sugar syntax [suggested by Dmitry Baryshkov and Maxime Ripard]
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> Signed-off-by: David Heidelberg <david.heidelberg@collabora.com>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
> For such a small change, maybe you can just use sed in your
> scripts to alter this?

This was the initial idea 
https://patchwork.kernel.org/project/linux-mediatek/patch/20230825122435.316272-3-vignesh.raman@collabora.com/

Since there was a review comment that CI should not make changes to the 
source tree before building, we went with DT overlay.

Regards,
Vignesh
