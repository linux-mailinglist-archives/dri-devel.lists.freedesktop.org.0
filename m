Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A3864354C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 21:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C730F10E29A;
	Mon,  5 Dec 2022 20:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2060410E29F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 20:09:56 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id n20so1319950ejh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 12:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=byt+6Yq2EaLbyXoYZ+ACDho3kUdzFwRWJcBHXY7JBeE=;
 b=eB0yoAA5tqcdHwitjX0cIu6RMwRyTFZx5x6UckB5WhVZ4iTdXt2f9sOIJjZtoE3EKu
 M2FMHf/xdjFhjkA6tVFEy4ZhxmIoXi4L3o8ZBDBn3LSUa6e4AYRaskOw/WybIOGk9jCh
 osEdGzctluiUuXmjzNsQOtulCz4z4maNU0Sq9GUtow/DT1J05SrJM8pWGFkVY5ontQSi
 w/1KAVOcQEC2hxSUAkrGjwcqgjM5ivaETkOqttqSP0RCkyvUJygdsrhj357cQ3sY8ZsT
 Vb766I4pW0ur/bWZbyNMPxxbO2sLhLY2XDPlapnmvMSgXf8TVN0Qfu8V/K5wPSK1uTYs
 n+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=byt+6Yq2EaLbyXoYZ+ACDho3kUdzFwRWJcBHXY7JBeE=;
 b=vEI66y4WznWaw5BUf5mYAeMiPuloVEE3v//hUrGOtCw7R/qIbVxb+wMogdZf5ZU5Hm
 1Ki1yYf5CEfSKRQiegaLwHzIhFZ6Os2JQCSwNF/uVi5dKo2sAe5Xcnw6zzGmytTfXpAj
 wlj705lE9LXrdhBtCSN2KvyTKoq0tLh5s3wUcQGGw926b93PGeL4XVYvlOkB/3syFDf1
 XA73GSsyyRrOYIdsg73Z4EXkvCw4ZgprSGzGrTqPdOJPdO/56wvVQ2SJdNqxMs4lg5Iz
 BjON2xs6q+ZpMHK7g7A4Vq8RLEdUAP0opJQZ3kg1NOze+4Ncr4gk1s7U0Fx/ssXq7mz3
 DeJw==
X-Gm-Message-State: ANoB5pkpHzE1lMfRLvIip3sw6qv+wbR/d6vw8DzuqpgEvKcfFV5/G0BN
 79sHalB9s2SFSqV0MtRH8JATwg==
X-Google-Smtp-Source: AA0mqf6hpf3x2YGZHsciPiFFZ9WTPQHOt/1Nl85YsaI6yp4AKdaqVL7TssXcL7VvJ/eu2CHIe6BxlQ==
X-Received: by 2002:a17:906:3993:b0:7ad:f5a9:ece3 with SMTP id
 h19-20020a170906399300b007adf5a9ece3mr71186272eje.635.1670270994685; 
 Mon, 05 Dec 2022 12:09:54 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 n20-20020aa7c694000000b0045726e8a22bsm176115edq.46.2022.12.05.12.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 12:09:53 -0800 (PST)
Message-ID: <9aaabc1f-6d7f-2e75-8831-30e88180f3bf@linaro.org>
Date: Mon, 5 Dec 2022 21:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: sa8295-adp: Enable DP instances
To: Bjorn Andersson <andersson@kernel.org>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
 <20221205174433.16847-14-quic_bjorande@quicinc.com>
 <b58f6935-b6ac-128b-2fec-a06dccc3210f@linaro.org>
 <20221205200236.2t25pv5abrgkrt5k@builder.lan>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221205200236.2t25pv5abrgkrt5k@builder.lan>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 05/12/2022 21:02, Bjorn Andersson wrote:
> On Mon, Dec 05, 2022 at 07:09:45PM +0100, Konrad Dybcio wrote:
>> On 05/12/2022 18:44, Bjorn Andersson wrote:
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> [..]
>>> +&mdss0_dp2 {
>>> +	status = "okay";
>> status should go last.
>>
> 
> Thanks for pointing that out. Would be nice if the computer told me
> that...somehow...
> 
>>> +
>>> +	data-lanes = <0 1 2 3>;
>>> +
>>> +	ports {
>>> +		port@1 {
>>> +			reg = <1>;
>>> +			mdss0_dp2_phy_out: endpoint {
>> That's quite a lot of indentation.. couldn't these endpoints be defined in
>> the SoC DT?
>>
> 
> The alternative would be to have the description of each DP controller
> split over multiple nodes and rely on the reader to stitch together the
> view of the node based on the label.
> Based on the naming of these labels they would at least be adjacent, so
> it wouldn't be that bad.
> 
> But I feel that there is enough DP-controller nodes in this board
> already; I've yet to describe the two USB Type-C controllers or the two
> DSI-DP bridges.
> So I don't know if it's worth optimizing indentation-level within each
> node like this.
> 
> 
> And we will end up mixing this optimization between DP controllers, USB
> Type-C nodes, QMP nodes, DSI-DP bridges.
Oh okay, I see, let's keep it as-is then.

Konrad
> 
> Regards,
> Bjorn
