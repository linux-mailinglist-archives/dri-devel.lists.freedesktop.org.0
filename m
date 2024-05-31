Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2A8D6745
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 18:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5722B10E0E4;
	Fri, 31 May 2024 16:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="C1jqMh91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FC310E0E4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 16:51:27 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9DVbd016906;
 Fri, 31 May 2024 16:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2yALGhrqIJdnboggYEQ7s0oOkdMXFFvfY29GvTJKsx4=; b=C1jqMh91/HCNLsYp
 6vA0b0uij5adV0DIGh+mSk2889fAxxDFCLr2tEFroOAekW1b1SAR9R0h8CxXf/3s
 qNLZTplUe2tBKjI+dRyPBEdO0GkzhRPsBtNBP63nOKbwAsUDu3OSUm8RH+/hAh60
 0b14QBs37+7EEtSSY1IIFOQapbMiJ9B/RHwPwyxU7hSrSoDe8KHYv+s50BJtfsqT
 NEC7McfWpq3/h+LgAfd716kHhmnQouXV9wZpoVL56718AxTZOxzuHH7Y60JH+o3V
 CNksDFkaKKHohU0kpyZyp56R/+kOUTd8yz8FnkweMwrdv7D2FlOov7n3O+U9kVB9
 unkUNw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf23stb7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 16:51:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VGpIGm017814
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 16:51:18 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 09:51:17 -0700
Message-ID: <197777e0-e6e1-7004-be27-edb98f8a235e@quicinc.com>
Date: Fri, 31 May 2024 10:51:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
 <7428a2f7-befc-6db8-76f4-3ca8dc12d31c@quicinc.com>
 <CAD=FV=Xcq-p5OxSnDJVF-Wp88ZfXOaOKJmh941ymy-f0wkhdhw@mail.gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CAD=FV=Xcq-p5OxSnDJVF-Wp88ZfXOaOKJmh941ymy-f0wkhdhw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: UnRxngflkST1yO4Wn85mX4qBzF_yXrRa
X-Proofpoint-GUID: UnRxngflkST1yO4Wn85mX4qBzF_yXrRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310127
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

On 5/31/2024 10:20 AM, Doug Anderson wrote:
> Hi,
> 
> On Fri, May 31, 2024 at 9:18 AM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>>
>> On 5/30/2024 5:12 PM, Dmitry Baryshkov wrote:
>>> There are two ways to describe an eDP panel in device tree. The
>>> recommended way is to add a device on the AUX bus, ideally using the
>>> edp-panel compatible. The legacy way is to define a top-level platform
>>> device for the panel.
>>>
>>> Document that adding support for eDP panels in a legacy way is strongly
>>> discouraged (if not forbidden at all).
>>>
>>> While we are at it, also drop legacy compatible strings and bindings for
>>> five panels. These compatible strings were never used by a DT file
>>> present in Linux kernel and most likely were never used with the
>>> upstream Linux kernel.
>>>
>>> The following compatibles were never used by the devices supported by
>>> the upstream kernel and are a subject to possible removal:
>>>
>>> - lg,lp097qx1-spa1
>>> - samsung,lsn122dl01-c01
>>> - sharp,ld-d5116z01b
>>
>> Ok to drop the sharp one I added.  It should be able to be handled by
>> the (newish) edp-panel, but I think the TI bridge driver needs some work
>> for the specific platform (no I2C connection) to verify.
> 
> Is the platform supported upstream? If so, which platform is it? Is
> the TI bridge chip the ti-sn65dsi86? If so, I'm confused how you could
> use that bridge chip without an i2c connection, but perhaps I'm
> misunderstanding. :-P

Yes, the platform is upstream.  The 8998 laptops (clamshell).  It is the 
ti-sn65si86.  I suspect the I2C connection was not populated for cost 
reasons, then determined its much more convenient to have it as every 
generation after that I've seen has the I2C.

If you check the datasheet closely, the I2C connection is optional.  You 
can also configure the bridge inband using DSI commands.  This is what 
the FW and Windows does.

So, the DT binding needs to make the I2C property optional (this should 
be backwards compatible).  The driver needs to detect that the I2C 
connection is not provided, and fall back to DSI commands.  Regmap would 
be nice for this, but I got pushback on the proposal.  Then I got 
sidetracked looking at other issues.

-Jeff

