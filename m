Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F199F4054
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 03:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD54510E24A;
	Tue, 17 Dec 2024 02:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hZz8EKB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461E810E24A;
 Tue, 17 Dec 2024 02:06:32 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGMPkbk012227;
 Tue, 17 Dec 2024 02:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ag2sg6/buls7Kg6qyOP9mJOVZzVRlJNPzB9bs1aS+rU=; b=hZz8EKB/XclcAkmJ
 nB3SscyPSRTxBCZ3Sl7WR8vxCKHYgtc8K9QKACQemHESZJnZsoh7SLOmH8+awoo2
 NTH6SUkZAUP25eLG6EGzXasUGp8Z/rsRd/Fw4mUqCLhu3WU8aL8YNvLS1FZOAMwa
 UcC6pZeRIMGuxZQfIGSn2o4+HD0Dax9iMuEf2e+FqLVuTbG4DEpAxcJ5F9DFUYw2
 24gazPchY1sNm8jihilaDV1+J37kk9PcvR8bcGsByR9V3BEGccxnNEFSgol4xebi
 CFyvZmMiv6cIdkwF4CmYsR8Lugo8mQjswvaohaPPP+OiNgKekdrOxlCXoQkn0+JX
 wvfC3g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jw068d96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 02:06:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH26LNo004726
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 02:06:21 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 18:06:20 -0800
Message-ID: <44fbe707-c4e4-48fe-9a15-16e3c78db5d6@quicinc.com>
Date: Mon, 16 Dec 2024 18:06:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/25] drm/tests: Add test for drm_crtc_in_clone_mode()
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-2-fe220297a7f0@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-2-fe220297a7f0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xn18HXRWSpSPts8tt2OH4Z0U2XtowoTm
X-Proofpoint-GUID: xn18HXRWSpSPts8tt2OH4Z0U2XtowoTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170016
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



On 12/16/2024 4:43 PM, Jessica Zhang wrote:
> Add kunit test to validate drm_crtc_in_clone_mode() helper
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/tests/drm_atomic_state_test.c | 62 ++++++++++++++++++++++++++-
>   1 file changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_atomic_state_test.c b/drivers/gpu/drm/tests/drm_atomic_state_test.c
> index be1f780249450ead7fbfd19ea98c96b442a94478..79bc5a9aedbf77aaf4b369a5fe62b6344e6859cf 100644
> --- a/drivers/gpu/drm/tests/drm_atomic_state_test.c
> +++ b/drivers/gpu/drm/tests/drm_atomic_state_test.c
> @@ -17,6 +17,12 @@
>   
>   #define DRM_TEST_CONN_0 BIT(0)
>   
> +struct drm_clone_mode_test {
> +	const char *name;
> +	u32 encoder_mask;
> +	int expected_result;
> +};
> +
>   static const struct drm_display_mode drm_atomic_test_mode = {
>   	DRM_MODE("1024x768", 0, 65000, 1024, 1048,
>   		 1184, 1344, 0, 768, 771, 777, 806, 0,
> @@ -227,17 +233,71 @@ static void drm_test_check_connector_changed_modeset(struct kunit *test)
>   	KUNIT_ASSERT_EQ(test, modeset_counter, initial_modeset_count + 1);
>   }
>   
> +/*
> + * Test that the drm_crtc_in_clone_mode() helper can detect if a given CRTC
> + * state is in clone mode
> + */
> +static void drm_test_check_in_clone_mode(struct kunit *test)
> +{
> +	bool ret;
> +	const struct drm_clone_mode_test *param = test->param_value;
> +	struct drm_crtc_state *crtc_state;
> +
> +	crtc_state = kunit_kzalloc(test, sizeof(*crtc_state), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, crtc_state);
> +
> +	crtc_state->encoder_mask = param->encoder_mask;
> +
> +	ret = drm_crtc_in_clone_mode(crtc_state);
> +
> +	KUNIT_ASSERT_EQ(test, ret, param->expected_result);
> +}
> +
> +static void drm_check_in_clone_mode_desc(const struct drm_clone_mode_test *t,
> +				      char *desc)
> +{
> +	sprintf(desc, "%s", t->name);
> +}
> +
> +static const struct drm_clone_mode_test drm_clone_mode_tests[] = {
> +	{
> +		.name = "in_clone_mode",
> +		.encoder_mask = DRM_TEST_ENC_0 | DRM_TEST_ENC_1,
> +		.expected_result = true,
> +	},
> +	{
> +		.name = "not_in_clone_mode",
> +		.encoder_mask = DRM_TEST_ENC_0,
> +		.expected_result = false,
> +	},
> +};

I think now, this series also depends on 
https://patchwork.kernel.org/project/dri-devel/list/?series=916960 for 
these ENC defines. Please indicate it in the cover letter and if we get 
an ack to merge it through msm tree, we can absorb in in this series itself.

LGTM otherwise,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> +
> +KUNIT_ARRAY_PARAM(drm_check_in_clone_mode, drm_clone_mode_tests,
> +		  drm_check_in_clone_mode_desc);
> +
>   static struct kunit_case drm_test_check_modeset_test[] = {
>   	KUNIT_CASE(drm_test_check_connector_changed_modeset),
>   	{}
>   };
>   
> +static struct kunit_case drm_in_clone_mode_check_test[] = {
> +	KUNIT_CASE_PARAM(drm_test_check_in_clone_mode,
> +			 drm_check_in_clone_mode_gen_params),
> +	{}
> +};
> +
>   static struct kunit_suite drm_test_check_modeset_test_suite = {
>   	.name = "drm_validate_modeset",
>   	.test_cases = drm_test_check_modeset_test,
>   };
>   
> -kunit_test_suite(drm_test_check_modeset_test_suite);
> +static struct kunit_suite drm_in_clone_mode_check_test_suite = {
> +	.name = "drm_validate_clone_mode",
> +	.test_cases = drm_in_clone_mode_check_test,
> +};
> +
> +kunit_test_suites(&drm_in_clone_mode_check_test_suite,
> +		  &drm_test_check_modeset_test_suite);
>   
>   MODULE_AUTHOR("Jessica Zhang <quic_jesszhan@quicinc.com");
>   MODULE_DESCRIPTION("Test cases for the drm_atomic_helper functions");
> 
