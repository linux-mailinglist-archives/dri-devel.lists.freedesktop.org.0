Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01134672E37
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 02:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA7410E885;
	Thu, 19 Jan 2023 01:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441F110E87F;
 Thu, 19 Jan 2023 01:33:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30J0gaEZ032172; Thu, 19 Jan 2023 01:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=55EcYJzI7tOUlGzXMatbAr1vmYRJdtUaIfzjiWkk3WI=;
 b=PJzSQQzBi58a1BHka2NorPWvuXAq1bPwtnumU4Mi+I5ehTLmQv2qvRzMkHZH6E86hYEr
 375pdcBJ8+87RefHJe2ilGzRtjEG2CbdwJ35glXylTBZ/BZo7iGZHZJ8J4/a9fG394A4
 4z+7w2iVCyGo+sX2XYvlhbOTF9fsallcZXuvbAk1sAyNph4eCPkbkbDyxGa7s0tCGZoh
 cLn22d1JF1TEb26kmoTqPcWSmMJDsT0eb9KbnZ0P+dONRWv5YsptxuV51W8+UXfI1wB5
 yzuwrnqtY/UKuxsq8J8rMbTRavqlqBKsCoAabVTXe4ADcsk9aKYQlEyesWHGg9dH/+pY UQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6e4r1tna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 01:32:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30J1WjbE005088
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 01:32:45 GMT
Received: from [10.110.108.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 18 Jan
 2023 17:32:43 -0800
Message-ID: <3bbd070a-6739-db35-79a4-141f738b2d8c@quicinc.com>
Date: Wed, 18 Jan 2023 17:32:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 09/10] arm64: dts: qcom: sc7180: Add support for HDCP
 in dp-controller
Content-Language: en-US
To: Mark Yacoub <markyacoub@chromium.org>, <quic_khsieh@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-10-markyacoub@google.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230118193015.911074-10-markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FYA6rF3trF_wnu1RPW7rw9u1Syspf478
X-Proofpoint-ORIG-GUID: FYA6rF3trF_wnu1RPW7rw9u1Syspf478
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1011 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190008
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
Cc: quic_sbillaka@quicinc.com, konrad.dybcio@somainline.org,
 jose.souza@intel.com, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, hbh25y@gmail.com, marex@denx.de,
 ashutosh.dixit@intel.com, sean@poorly.run, abhinavk@codeaurora.org,
 javierm@redhat.com, arun.r.murthy@intel.com, stanislav.lisovskiy@intel.com,
 agross@kernel.org, quic_jesszhan@quicinc.com, ankit.k.nautiyal@intel.com,
 lucas.demarchi@intel.com, swboyd@chromium.org, robh+dt@kernel.org,
 christophe.jaillet@wanadoo.fr, maxime@cerno.tech, rodrigo.vivi@intel.com,
 johan+linaro@kernel.org, tvrtko.ursulin@linux.intel.com, andersson@kernel.org,
 dianders@chromium.org, swati2.sharma@intel.com, manasi.d.navare@intel.com,
 tzimmermann@suse.de, bhanuprakash.modem@intel.com, dmitry.baryshkov@linaro.org,
 seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark

On 1/18/2023 11:30 AM, Mark Yacoub wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the register ranges required for HDCP key injection and
> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller. Now that these are supported, change the
> compatible string to "dp-hdcp".
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-14-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-14-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-10-sean@poorly.run #v5
> 
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Put the tz register offsets in trogdor dtsi (Rob C)
> Changes in v6:
> -Rebased: Removed modifications in sc7180.dtsi as it's already upstream
> 
> ---
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 178efaaa89ec..6f6fe5cb6563 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -817,6 +817,14 @@ &mdss_dp {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&dp_hot_plug_det>;
>   	data-lanes = <0 1>;
> +
> +	reg = <0 0x0ae90000 0 0x200>,
> +	      <0 0x0ae90200 0 0x200>,
> +	      <0 0x0ae90400 0 0xc00>,
> +	      <0 0x0ae91000 0 0x400>,
> +	      <0 0x0ae91400 0 0x400>,
> +	      <0 0x0aed1000 0 0x175>,
> +	      <0 0x0aee1000 0 0x2c>;
>   };

Can you pls point me to which tree you rebased this on top of?

The mdss_dp node looks different here: 
https://gitlab.com/linux-kernel/linux-next/-/blob/master/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi#L815

For the TZ regs the second entry is fine but any reason for the size of 
the first register space to be 0x175 instead of 0x174?



>   
>   &pm6150_adc {
