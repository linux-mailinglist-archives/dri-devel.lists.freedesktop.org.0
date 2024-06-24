Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54DD914DD7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 15:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED8A10E116;
	Mon, 24 Jun 2024 13:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="mxK9HyWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A52410E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 11:33:04 +0000 (UTC)
X-Envelope-To: dmitry.baryshkov@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719228780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75G0OkMLqe4Ot81fVo3yHPQqIVOtvkVsPdLFfHdHxi0=;
 b=mxK9HyWvmS3iBkmkN7bcMVsuwKw67DmtU8BUB2NPcnLqlEwsdLKfveCmxmqp2668iGbrli
 11g6N4344Xx1ZvsMI2GOy8/o7yuvtFs4XI37pLLScINHpZPtBJvHJ/blxWbKxbjJ+jUvV2
 dxkxhbKkCLsA5vYw/3jT4n4R811pP0N41G3O68iWpo1nMayZ4TCs3lttEd2wq64K2CAS8n
 Pzzq4w60g3XFeGNAe3+2NuWwqY4f6jYa32QZwfdZ+2WN6+SY0J7Vpwk+nLOZJwn5zJfuMK
 SKSJ6pe++v8mrOxsJVl/zkxKCNzMK2l0cxn7dldmqG1QQQ2XJX+ONL533TdSnw==
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: andersson@kernel.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: frieder.hannenheim@proton.me
Message-ID: <722dab04-03f9-49ce-9c7c-4a3a9f898fc9@postmarketos.org>
Date: Mon, 24 Jun 2024 13:32:57 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] qcom: initial support for the OnePlus 8T
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Frieder Hannenheim <frieder.hannenheim@proton.me>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <ufc7sq5s5nymjncp5w2446dq5xcmmqbmsuubhpo2fxtsz5dpgg@xtqtmmsio6sr>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
In-Reply-To: <ufc7sq5s5nymjncp5w2446dq5xcmmqbmsuubhpo2fxtsz5dpgg@xtqtmmsio6sr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 24 Jun 2024 13:02:50 +0000
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



On 24/06/2024 07:18, Dmitry Baryshkov wrote:
> On Mon, Jun 24, 2024 at 03:30:24AM GMT, Caleb Connolly wrote:
>> Add bindings for the SM8250 OnePlus devices, a common devicetree,
>> touchscreen and display drivers, and a dts for the OnePlus 8T (kebab).
>>
>> The OnePlus 8 series is made up of 3 flagship smartphones from 2019,
>> featuring the Qualcomm X55 5G PCIe modem.
>>
>> This series introduces initial support for the 8T, adding drivers for
>> the 1080x2400 120Hz DSC panel and the Synaptics TCM Oncell touchscreen.
>>
>> The panel driver suffers from similar limitations to the LG SW43408
>> panel found on the Pixel 3, namely that after toggling the reset GPIO it
>> is not possible to get the panel into a working state.
> 
> Just to point it out: this is no longer true for SW43408. The panel
> wakes up and works after toggling the reset. It seems, there is an issue
> with one of the regulators, but not with the reset and/or panel startup.

Hmm ok, I've heard mixed reports then, I should try it out myself again.

I'll update the cover letter to reflect this. Thanks.
> 
>> Given the apparent prevelance of this issue, particularly with DSC
>> panels, I believe this is a bug in the core DSI code, and not a device
>> or panel specific issue. I think it is still useful to accept these
>> panel drivers into upstream since, from a users perspective, the panel
>> is fully functional just by leaving the reset GPIO alone and keeping the
>> regulator on. The only (theoretical) downside is worse battery life,
>> which is a small price to pay for a working display.
>>
> 
