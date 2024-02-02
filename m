Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE1847A0A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 20:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEDF10E181;
	Fri,  2 Feb 2024 19:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="o+eJO+PJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7116510E181
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 19:58:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412G02K5015342; Fri, 2 Feb 2024 19:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=s6h+VMG8k6lwwILACJ6bOGEvx3OOtYESLPMqob8ipVM=; b=o+
 eJO+PJ+BTuWC8cJwsgt533kKjJsQQ4DpsYLLx/K2tz4hAdHgw0JCyJ67OXtw8b01
 7zv87mGqloqFIzYU/BdG0fKXMIG/j+uWQcXSEtYcFge0ROrs+uZ4AUSzbvO/OHmw
 y7OLgTzLbeQtcBfe6dVa7iB4PopBl9TaKRQrvTMYDk0HqZm/nBbgS1Wo5gzn418k
 vgIqHRB6HrHIEbjLVOyhwsmRUTdaCDsgN/BoggsSCzuQkSmF48Ubt8aCLH1yV/qa
 t7z0KRdIzNfCgboDRtcGlrUyd74dRvoXQBFL4vm+3mEMFtZiXtXgdctDkgs7QCBg
 +zrdkxivRzjKdmnFP/jg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0ptwad3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Feb 2024 19:58:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 412JwhCg026279
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Feb 2024 19:58:43 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 11:58:43 -0800
Message-ID: <723449d6-9cc3-b068-5ab1-65043caf9ce7@quicinc.com>
Date: Fri, 2 Feb 2024 12:58:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: TI SN65DSI86 bridge chip DT binding maintainer
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
CC: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "Bjorn
 Andersson" <quic_bjorande@quicinc.com>
References: <b0c0de30-9ef7-5753-928e-f189038b7fb9@quicinc.com>
 <CAD=FV=WuHtHF7Lh5OBtnumeEFry9SPEm9cRgDKTATjtTmJegrw@mail.gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CAD=FV=WuHtHF7Lh5OBtnumeEFry9SPEm9cRgDKTATjtTmJegrw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8uj_bia-cJFg8V5LRHbtFbOr_t3Bmgzv
X-Proofpoint-GUID: 8uj_bia-cJFg8V5LRHbtFbOr_t3Bmgzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_13,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=518 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020146
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

On 2/2/2024 12:03 PM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Feb 2, 2024 at 10:29 AM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>>
>> Hi Doug,
>>
>> The DT binding for the TI SN65DSI86 [1] lists Sandeep Panda
>> <spanda@codeaurora.org> as the maintainer within the file.  This is no
>> longer valid because the @codeaurora domain bounces, and Sandeep appears
>> to have left the company.  As such the binding appears to be orphaned,
>> although the file itself is misleading because it needs to be updated.
>>
>> I'd like to find a new maintainer and from what I've seen on list, you
>> seem to be interested and active in this particular bridge chip.  I also
>> see that you are listed as a reviewer of the C code and binding within
>> MAINTAINERS.
>>
>> Would you be willing to volunteer to maintain the binding going forward?
>>
>> [1]: Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> 
> Yeah, this is fine. Officially "maintainership" is through the
> drm-misc tree, but I can have my name listed in the file. I'm already
> listed in the MAINTAINERS file as the reviewer for this file.
> 
> If you want to send a patch I can apply it, or I can post a patch and
> then apply once someone from Qualcomm gives it a Reviewed-by.

Awesome.  I'll send a patch out.  Thanks!

-Jeff
