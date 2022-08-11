Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6458F51E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 02:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA1B12B61C;
	Thu, 11 Aug 2022 00:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB07E90032
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 00:14:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27ANfprg013343;
 Thu, 11 Aug 2022 00:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hYovFST2jWA0C0Fhfy50LhcbGZNSRZGprpAAMccayHg=;
 b=orPrVYSyOl1xuMqzEqt3saGtCXdVZmylQEKnb1P+Tff61NW/FyEW8C6QoJjkFcVXCXJY
 t0lDXBaeTQoAoLZbyWu8dHr5GjnIyIVU4GItq7LM7WZexV52dEK81T7e8wzyyBEYIqJB
 usLaSvgDiHo7AmtBQM+8MGJC9U9F7MY+3fb4dsUNNasVh1Vbv+uvlGbAPTP9QIgclVN0
 L7ktJGZB1WojZSiUIM+ckONHdcxS+dOOvwsLmjVGV7M/FQbBS8onbhJNokRQadyT3CNC
 deLAtZ8ZE2hNzPGmLWf3aSS1sh5MhT2ruazKpZMlGcdfIoolZsBUYd8tRDhZ4NSS3cuT JQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3huwr24btj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 00:14:44 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27B0Eg8n029065
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 00:14:42 GMT
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 10 Aug 2022 17:14:42 -0700
Received: from [10.71.111.52] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 10 Aug
 2022 17:14:41 -0700
Message-ID: <3e1346f6-999e-c8b3-d841-dcf713eac797@quicinc.com>
Date: Wed, 10 Aug 2022 17:14:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH libdrm v1 2/2] tests/modetest: Add support for writeback
 connector
Content-Language: en-US
To: Andy Yan <andyshrk@163.com>
References: <20220725192639.5437-1-quic_rohiiyer@quicinc.com>
 <20220725192639.5437-3-quic_rohiiyer@quicinc.com>
 <6d76f7bb.fcf.1823839180b.Coremail.andyshrk@163.com>
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
In-Reply-To: <6d76f7bb.fcf.1823839180b.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: XR7TaYB_Xjdl65ym2YJblas949RUb-V3
X-Proofpoint-ORIG-GUID: XR7TaYB_Xjdl65ym2YJblas949RUb-V3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_16,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100073
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
Cc: quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 hoegsberg@google.com, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On 7/25/2022 6:57 PM, Andy Yan wrote:
> 
> Hi Rohith:
> 
> 
> 
> 
> At 2022-07-26 03:26:39, "Rohith Iyer" <quic_rohiiyer@quicinc.com> wrote:
>> Add writeback support to modetest with the below options:
> 
>> +		case 'o':
>> +			pipe_args->dump = true;
>> +			dump_path = optarg;
>> +			break;
>> 		case 'P':
>> 			plane_args = realloc(plane_args,
>> 					     (plane_count + 1) * sizeof *plane_args);
>> @@ -2098,6 +2173,7 @@ int main(int argc, char **argv)
>> 			crtcs = 1;
>> 			planes = 1;
>> 			break;
>> +		case 'x':
>> 		case 's':
>> 			pipe_args = realloc(pipe_args,
>> 					    (count + 1) * sizeof *pipe_args);
>> @@ -2109,7 +2185,7 @@ int main(int argc, char **argv)
>>
>> 			if (parse_connector(&pipe_args[count], optarg) < 0)
>> 				usage(argv[0]);
>> -
>> +			pipe_args->custom = (c == 'x');
>> 			count++;
>> 			break;
>> 		case 'C':
>> @@ -2165,6 +2241,7 @@ int main(int argc, char **argv)
>>
>> 	if (use_atomic) {
>> 		ret = drmSetClientCap(dev.fd, DRM_CLIENT_CAP_ATOMIC, 1);
>> +		drmSetClientCap(dev.fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>> 		if (ret) {
>> 			fprintf(stderr, "no atomic modesetting support: %s\n", strerror(errno));
>> 			drmClose(dev.fd);
>> @@ -2208,6 +2285,8 @@ int main(int argc, char **argv)
>> 			if (set_preferred || count)
>> 				set_mode(&dev, pipe_args, count);
>>
>> +			writeback_config(&dev, pipe_args, count);
>> +
>> 			if (plane_count)
>> 				atomic_set_planes(&dev, plane_args, plane_count, false);
>>
>> @@ -2217,6 +2296,13 @@ int main(int argc, char **argv)
>> 				return 1;
>> 			}
> 
>>
> 
> 
> How do we make sure the writeback is finished?  Do we need a writeback fence here?

Thanks for pointing this out. We plan to have a function that polls on 
the writeback fence fd, until the writeback is finished. Let me know if 
you have something else in mind.

> 
>> +			/*
>> +			 * Since only writeback connectors have an output fb, this should only be
>> +			 * called for writeback.
>> +			 */
>> +			if (pipe_args->dump)
>> +				dump_output_fb(&dev, pipe_args, dump_path, count);
>> +
>> 			if (test_vsync)
>> 				atomic_test_page_flip(&dev, pipe_args, plane_args, plane_count);
>>
>> -- 
>> 2.31.0

Thanks,
Rohith
