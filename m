Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9F64ABAB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 00:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFDC10E29A;
	Mon, 12 Dec 2022 23:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7E710E29A;
 Mon, 12 Dec 2022 23:42:10 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCJRoxi026341; Mon, 12 Dec 2022 23:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=L/poYETk+wIVyz1oXWjHBXrsVN/2ZAsZsP2YCOt/i+A=;
 b=iAcr0dQWynlN367mCvsp3RfT1brcr1hECIrQmVeE31esGebBwOt+1gRTKQiQLJOSct7y
 5zPiBh5aE6Q/F4ZU+f/TucUe3SfIOjeUgXtbYNI9PeI6BeJ0S9v0Jmokg82ioQTOOi/o
 conXC5/IEeu2mQXGYCVJ5/e6Pt1BPqsWZGWBMB2VumyHqqYBIFZTyLD9CnpRPo4oV1bB
 FhxKGzZXA5DzU5KLV/GGAZEY+2dyquTWngTiExGEfJJ0cuwNzpjb+s/FVS38EmNQ3Vjn
 N2ECVNJQ6Hr8qmhFj9DLa6ChoGbtHVievuthtGFvL9byGbPzmeiu/RvEuvwxGmifZExp jw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mcjb95hmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 23:42:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BCNg0xq012161
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 23:42:00 GMT
Received: from [10.111.167.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 12 Dec
 2022 15:41:57 -0800
Message-ID: <a9e2f269-b9df-814f-adcd-f5577f590fa7@quicinc.com>
Date: Mon, 12 Dec 2022 15:41:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
 <5a3865ed-8847-db04-3d60-f35438250bef@linaro.org>
 <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
 <be1411e8-1d07-7643-977c-a306016fd660@linaro.org>
 <b6d90c1f-5365-7197-be63-96c3d8cf0746@quicinc.com>
 <e53844b7-601b-f355-302b-cc871962a446@linaro.org>
 <8b306c8f-3089-4aaf-7fc1-038a8330c89a@quicinc.com>
 <CAA8EJpr5RYyQa7xu1_xJ0F-dn-H9aOf0KE-CDgDCwnZu3HPgXg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpr5RYyQa7xu1_xJ0F-dn-H9aOf0KE-CDgDCwnZu3HPgXg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: O1WJpTrNUTLNvhSKUJjGEuvxD9McfxPt
X-Proofpoint-ORIG-GUID: O1WJpTrNUTLNvhSKUJjGEuvxD9McfxPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120204
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
Cc: devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 andersson@kernel.org, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robh+dt@kernel.org,
 vkoul@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On 12/12/2022 2:35 PM, Dmitry Baryshkov wrote:
> On Mon, 12 Dec 2022 at 19:51, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>>
>> On 12/8/2022 4:35 PM, Dmitry Baryshkov wrote:
>>> On 09/12/2022 02:22, Kuogee Hsieh wrote:
>>>>
>>>> On 12/8/2022 4:11 PM, Dmitry Baryshkov wrote:
>>>>> On 09/12/2022 01:38, Kuogee Hsieh wrote:
>>>>>>
>>>>>> On 12/8/2022 3:33 PM, Dmitry Baryshkov wrote:
>>>>>>> On 09/12/2022 00:36, Kuogee Hsieh wrote:
>>>>>>>> Add both data-lanes and link-frequencies property into endpoint
>>>>>>>>
>>>>>>>> Changes in v7:
>>>>>>>> -- split yaml out of dtsi patch
>>>>>>>> -- link-frequencies from link rate to symbol rate
>>>>>>>> -- deprecation of old data-lanes property
>>>>>>>>
>>>>>>>> Changes in v8:
>>>>>>>> -- correct Bjorn mail address to kernel.org
>>>>>>>>
>>>>>>>> Changes in v10:
>>>>>>>> -- add menu item to data-lanes and link-frequecnis
>>>>>>>>
>>>>>>>> Changes in v11:
>>>>>>>> -- add endpoint property at port@1
>>>>>>>>
>>>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
>>>>>>>
>>>>>>> Applying: dt-bindings: msm/dp: add data-lanes and link-frequencies
>>>>>>> property
>>>>>>> .git/rebase-apply/patch:47: trailing whitespace.
>>>>>>>
>>>>>>> .git/rebase-apply/patch:51: trailing whitespace.
>>>>>>>
>>>>>>>
>>>>>>> Also the dt_binding_check fails with an error for this schema. And
>>>>>>> after fixing the error in the schema I faced an example validation
>>>>>>> error. Did you check that the schema is correct and that the
>>>>>>> example validates against the schema?
>>>>>>
>>>>>> yes, but i run "make dt_binding_check
>>>>>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/dp-controller.yaml"
>>>>>> at mu v5.15 branch since
>>>>>
>>>>> I wouldn't ask you to post the log here. But I don't think that
>>>>> either of the errors that I see here is related to 5.15 vs 6.1-rc.
>>>>>
>>>>> In fact after applying this patch against 5.15 I saw the expected
>>>>> failure:
>>>>>
>>>>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml:
>>>>> properties:required: ['port@0', 'port@1'] is not of type 'object',
>>>>> 'boolean'
>>>>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml:
>>>>> properties: 'required' should not be valid under {'$ref':
>>>>> '#/definitions/json-schema-prop-names'}
>>>>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml:
>>>>> ignoring, error in schema: properties: required
>>>>>
>>>>>>
>>>>>> "make dt_binding_check" does not work at msm-next branch.
>>>>>
>>>>> I went ahead and just checked.
>>>>>
>>>>> `make dt_binding_check DT_SCHEMA_FILES=display/msm`  works cleanly
>>>>> in msm-next and reports a single example-related warning in
>>>>> msm-next-lumag. I pushed a patch to fix that warning (wich can
>>>>> hopefully be picked up by Abhinav into msm-fixes). So you can assume
>>>>> that both these branches have consistent error-free display/msm
>>>>> schemas.
>>>>>
>>>> I have clean msm-next branch (without my data-lines yaml patch
>>>> applied) and run "make dt_binding_check
>>>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/dp-controller.yaml",
>>>> then I saw below error messages.
>>>>
>>>> Have you run into this problem?
>>>
>>> No.
>>
>> Did you do anything to fix "older dtschema instance"?
> 
> I did not since I hadn't had such a problem. I can refer again to the
> steps I provided you beforehand. The email was sent 6 days ago. No
> answer from your side since that time.
> 
>> I had run  "pip3 install dtschema --upgrade" and still not work.
> 
> Can you please post a full log of this command?
> 
>>
>> D you know how to fix this problem?
>>
>> Thanks,
>>
>> kuogee
>>
>> sort: -:2: disorder: 2022.1
>> ERROR: dtschema minimum version is v2022.3
>> make[2]: *** [check_dtschema_version] Error 1
>> make[1]: *** [dt_binding_check] Error 2
>> make: *** [__sub-make] Error 2
> 
> Please add the output of:
> 
> which dt-validate
> dt-validate -V
> 
> And also a full log of your failing kernel build.
> 
> 
> 
>> I had run "pip3 install dtschema --upgrade" according Rob Herring response.
>> but it still shows same problem.
>> Please let know how can I fix this problem.
>>
>>>
>>>>
>>>>     HOSTCC  scripts/basic/fixdep
>>>>     HOSTCC  scripts/dtc/dtc.o
>>>>     HOSTCC  scripts/dtc/flattree.o
>>>>     HOSTCC  scripts/dtc/fstree.o
>>>>     HOSTCC  scripts/dtc/data.o
>>>>     HOSTCC  scripts/dtc/livetree.o
>>>>     HOSTCC  scripts/dtc/treesource.o
>>>>     HOSTCC  scripts/dtc/srcpos.o
>>>>     HOSTCC  scripts/dtc/checks.o
>>>>     HOSTCC  scripts/dtc/util.o
>>>>     LEX     scripts/dtc/dtc-lexer.lex.c
>>>>     HOSTCC  scripts/dtc/dtc-lexer.lex.o
>>>>     HOSTCC  scripts/dtc/dtc-parser.tab.o
>>>>     HOSTLD  scripts/dtc/dtc
>>>> sort: -:2: disorder: 2022.1
>>>> ERROR: dtschema minimum version is v2022.3
>>>> make[2]: *** [check_dtschema_version] Error 1
>>>> make[1]: *** [dt_binding_check] Error 2
>>>> make: *** [__sub-make] Error 2
>>>
>>> This means that somewhere in your path you have an older dtschema
>>> instance.
>>>
>>> When you sent me a question regarding this error, I asked for the
>>> additional info. You provided none. Instead you went on sending the
>>> untested patch that doesn't work.
>>
>> since i can not test it on msm-next so that I did test it at my v5-15
>> branch.
> 
> Wrong.
> 
>>
>> besides, i think i have to sent the whole series patches include this
>> one to address your new comments on other patch.
>>
>> is this correct?
> 
> No. Please fix your system first, validate your patches and send them
> afterwards. You can not expect others to do your job.
> 

Just finished working with kuogee on this. This issue had been reported 
by few others earlier (example 
https://lore.kernel.org/lkml/bc9be279-a130-d5e7-4397-bbb389d14403@intel.com/T/).

So let me summarize the fix:

1) We do need up upgrade the dtschema first

pip3 install git+https://github.com/devicetree-org/dt-schema.git@main

2) Python version issues were hitting some of the developers so even if 
we had the right version installed the PATH wasnt pointing to the right one

3) We had to install yamllint

We have documented these now for the benefit of others internally.

With all these 3 done, we can compile msm-next-lumag using
make dt_binding_check DT_SCHEMA_FILES=display/msm

Apologies for the setup issues on our end. These are resolved now and 
kuogee will post a v12 for this.

Thanks

Abhinav
> --
> With best wishes
> Dmitry
