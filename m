Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5055744A0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 07:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41171A2AD4;
	Thu, 14 Jul 2022 05:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9F7A2AD3;
 Thu, 14 Jul 2022 05:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657777242; x=1689313242;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4NKbmXxhlXJ2EzhZYmyUNHWWphemE+rKL52FLwRy3ew=;
 b=B9BO8JKy4MYh7EajcJwVG53Vgt9H5q0xNzltg4RttQMH30rtjuLqsA/l
 9P/eyppEMyKArReYE7dKNaSLnmcp8qM/NK7xpYivLe0h6ZU+yjReWDBtH
 eHdQ/50nQijVxVsgzrMU7W8cKQN+TyRW4b4qdIBowcyEmlWwxiAJMm9dr 8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Jul 2022 22:40:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 22:40:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 22:40:41 -0700
Received: from [10.216.13.53] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 13 Jul
 2022 22:40:33 -0700
Message-ID: <c022538d-c616-8f1a-e1c2-c11b5f0de670@quicinc.com>
Date: Thu, 14 Jul 2022 11:10:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sc7280: Update gpu register list
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 Taniya Das <quic_tdas@quicinc.com>, <quic_rjendra@quicinc.com>
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.5.I7291c830ace04fce07e6bd95a11de4ba91410f7b@changeid>
 <CAD=FV=XzvcjS51q78BZ=FPCEVUDMD+VKJ70ksCm5V4qwHN_wRg@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAD=FV=XzvcjS51q78BZ=FPCEVUDMD+VKJ70ksCm5V4qwHN_wRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Stephen
 Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/12/2022 4:57 AM, Doug Anderson wrote:
> Hi,
>
> On Fri, Jul 8, 2022 at 11:00 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>> Update gpu register array with gpucc memory region.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>
>> (no changes since v1)
>>
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index e66fc67..defdb25 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -2228,10 +2228,12 @@
>>                          compatible = "qcom,adreno-635.0", "qcom,adreno";
>>                          reg = <0 0x03d00000 0 0x40000>,
>>                                <0 0x03d9e000 0 0x1000>,
>> -                             <0 0x03d61000 0 0x800>;
>> +                             <0 0x03d61000 0 0x800>,
>> +                             <0 0x03d90000 0 0x2000>;
>>                          reg-names = "kgsl_3d0_reg_memory",
>>                                      "cx_mem",
>> -                                   "cx_dbgc";
>> +                                   "cx_dbgc",
>> +                                   "gpucc";
> This doesn't seem right. Shouldn't you be coordinating with the
> existing gpucc instead of reaching into its registers?
>
> -Doug
IIUC, qcom gdsc driver doesn't ensure hardware is collapsed since they 
are vote-able switches. Ideally, we should ensure that the hw has 
collapsed for gpu recovery because there could be transient votes from 
other subsystems like hypervisor using their vote register.

I am not sure how complex the plumbing to gpucc driver would be to allow 
gpu driver to check hw status. OTOH, with this patch, gpu driver does a 
read operation on a gpucc register which is in always-on domain. That 
means we don't need to vote any resource to access this register.

Stephen/Rajendra/Taniya, any suggestion?

-Akhil.


