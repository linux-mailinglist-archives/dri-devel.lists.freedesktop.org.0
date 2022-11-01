Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD5614B1F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 13:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C1110E3B1;
	Tue,  1 Nov 2022 12:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA55E89146;
 Tue,  1 Nov 2022 12:50:39 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A1BO8Up005614; Tue, 1 Nov 2022 12:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=fazkPLkCZMIoAuAFYMkCHEm5CnX/XVVCJB84r6MGwMw=;
 b=IxwgzcWF5aEIBGTcF4iqWmG4KL7RCjG+rTjjdQwFlbnFHzr13O7ygfNppll3DgJR2wLx
 2PFvMFvA8Vhefe2sbeOK3vZSj85Ijs9dJdpWpG59bIdFZHSnLm+mHa1dnTMjGVLv57kp
 N5pkCTogqpvdqrQ5HUEQdVQ/Pgqh4lyiw8OUZPX6CfoXF4f95q+SMX8C4HQEzM6yVTT0
 jy7N5EzClh/7U26cQWniBwf7rhHClaGWX8PHTncrf7gxeYeDSUtmZOFuzbObucOS7Ggm
 Y2Ok5oQkUpdTbh5Npvd38O5nqTx4ECT2aajuLwesEFvLPYd+NPrSSPbewOee5LLXWsPA dA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kk13xgmj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 12:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0LwZM7fs3XSKfkd/YppHD/rdVNzkFbV9IB4y5ddLFsaBuR/dk9E2L9QNDXPpqK46CEKYWPtmfT6dDYIQfaVbsW9x0zYDjJLfyXBbAnd4sdg0Lr6cP3yyiRauO3f2OwcZc96KrzrcQuZPRMsOQ4olJ2t/I2M37/pGPwwb9iUOdqcBJZzCkUsg3zSeH9MTwj0KFX+LjAvykXJz4GXKSmmy6IN92zakhHNepvn1Zor1nPOjWQbXtWRBomY1nzhRv9jYIsdb3l0dexdqIhHv8dEIPtkWMZqNEelHwKvKCN0FS2cDouMfR+0noJKYHanC+t0QVoI5z7prO4SxoApc/TrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fazkPLkCZMIoAuAFYMkCHEm5CnX/XVVCJB84r6MGwMw=;
 b=JItoSAWzFxvuXMsRdT744k/9/AONvZ4ZoSR+kYvpuhu8C9uUqa0YvfZCRFSIbXoNzhxiHEHC6bRCyqaTbg0hUMw/hPYOvCvgEXunhkXbZm1+k5sF5F9uu8MC1kncq3ROE+Ji6J9D2STYDrP8okkPAbmdNoww73vD/K/56qfdTc1nZW54znvEo7DFsggGgpTDjOEvbEytXB4/egBBcYqEfRvhJ2ESXXgWopnl7YHHbmr5GZbUd8dXdCmXu7pT4T/UIhJiTDqDkTrcd97VDI4dNookDWZw3cYDNdFNLAxW2ovkl4bxXgTbWfC8RhBBfYSRl7ijLPxihYsNWcdi56Hbag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8142.namprd02.prod.outlook.com (2603:10b6:408:16a::19)
 by MW4PR02MB7316.namprd02.prod.outlook.com (2603:10b6:303:76::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 12:50:33 +0000
Received: from BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::60f2:dd20:67dc:8baf]) by BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::60f2:dd20:67dc:8baf%8]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 12:50:33 +0000
From: Kalyan Thota <kalyant@qti.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>, "Kalyan Thota (QUIC)"
 <quic_kalyant@quicinc.com>
Subject: RE: [v7] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Thread-Topic: [v7] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Thread-Index: AQHY7eC4mWSOUH55gUG42qiSkeB+FK4p8nIAgAARrsA=
Date: Tue, 1 Nov 2022 12:50:32 +0000
Message-ID: <BN0PR02MB814202C4286C360484813AAB96369@BN0PR02MB8142.namprd02.prod.outlook.com>
References: <1667300225-14367-1-git-send-email-quic_kalyant@quicinc.com>
 <20221101114304.3vsurukthhh34wmf@SoMainline.org>
In-Reply-To: <20221101114304.3vsurukthhh34wmf@SoMainline.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8142:EE_|MW4PR02MB7316:EE_
x-ms-office365-filtering-correlation-id: c424277a-cde1-46c6-d65a-08dabc07aa09
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JoK+ot8BJtLnzO6pY2cldgeYBL0BZ4xXzpTvv7GIF2Ysy9MpKjRdWDLBPo2T7DeZh9Cpm+dHxNk75hAI5z55gos7PcPQH4nULPXQsK22ZLp5VjpMmo4W97yluJ7XV7OgPb/260bh5HPbIFTkPTCDVSqAugIT7AI8OOyIxpPtC+D9hVPCJcSlIQGZWTWNKIjQVCfq9DFNjm0Dw8CJ/Q1KdpOu07J6NFS40cqDpdRJ9kXGILOA0CJ3wTisey+U0M+QQVhDobIJSb8O7sELHAS1EqDLj6rTkbnCxAKP5tFDdmKx35lPAYpRAZE0JQ7UP+C26AcuJ7NhLWIr4Zsu2+k6GgkhuY/54+4IIR34Sbrl93qZbzqpGeVoWT1kHQGQhmd3IbMlPd9U0+Ck9/17iH4MZfSkvHv6N6Jv53p+thVFacWNRu3nHKn5xllXbXA3icbilYhWVEEysuQwsudg+aNNY7Uqkr/qsHH8Ezk7bunezNPa1zIqS7JKTrG2oOWkZcrWgnz4i3oPXnuqGwyC5TIPO73RNAHO1D3JLvG+dfifMdAuI9C9pvH4ARawGoSfhQ9QQebpiWBP1X+g14Qq0MF0lsai/fvga9ScCA6zlFV4X1F5dx/mfjXd12zytPNilZZRreD9DIRcK2/yx+ELs/pwGzQxKL+iqblEBoJ/PHwmMIdA6JEfnxXlSsq0CJxwuCigdwZs4F4dm2cpgzAuxNNvRNTjGJd1Xnc/DqaNY6MrE4UDTnekZY0JuL47q5w4YvyTyWwbX8Tve7NUX7cxUaSdSWoB4dUMVOqw71ZI/YmCVB4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8142.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199015)(186003)(7416002)(5660300002)(52536014)(8936002)(2906002)(9686003)(55016003)(41300700001)(26005)(33656002)(122000001)(38070700005)(38100700002)(83380400001)(86362001)(54906003)(316002)(110136005)(107886003)(478600001)(71200400001)(4326008)(6506007)(7696005)(8676002)(66556008)(64756008)(66476007)(66446008)(76116006)(66946007)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rSiMoa6wM+NXDKDcfhi7i9qoNM8OXcVI5toaCSAtwEDtxo7XIgCxhhwCTR7j?=
 =?us-ascii?Q?SAoEr/darhRhvc/iMFwX+fW39xvH1RN5RJEFcF1vS6aJJqR4DCX5Ab83jcL3?=
 =?us-ascii?Q?8PlvqkJ1JUdZ/fg62ibegQgLvCNDrN3slui04m5pvFSPdmvxjcvCKwO40mAE?=
 =?us-ascii?Q?DJN1j5+CRY/cCF1Z073VbgVdCxXNWVGWlSEtGNLbUhZ/6GNXK8J4P/sqenrM?=
 =?us-ascii?Q?9DCHXIlz4GrpiXjfO/R1SLAYJKnzhY9fa39kjoakROeKIYC1R+2IQX6aCDbg?=
 =?us-ascii?Q?wUJnKWuxxSonYOhgKJEeMinVajdFUKnHUVGYwro9Dh37fAG6GD/C65Zz3EE2?=
 =?us-ascii?Q?51sppV1mJrBUDd/qoANpga2sWrJgz/4Jv6Z9T8XNXGezGMsUVWisk2ABHeAW?=
 =?us-ascii?Q?JhreUT0+ZhvdRGHyo9tOxu8/38TIGByS4N1veVl1X/QgfE14vp3jbk/2yQFD?=
 =?us-ascii?Q?ig60s90H6cRxz3UrxkEdqz/kA2BIqNfdZkcD4K8/8lRxi6EN9k8YolCmqJTw?=
 =?us-ascii?Q?eGLHxsRbQQeTm4Z0N9FEvep/1P62xNSnstWz0zHMUu0p7tan21sxrfUaupuu?=
 =?us-ascii?Q?4UFomusV1udolV88Wr9JiPOW19ViiLMuEMhJaJnghMI5OiA7wXe9LIpV8HZU?=
 =?us-ascii?Q?espsZQP0YJP5a+z0SrPI0zsLDRsini7FjfOgvz1tdxKWgJPrr6uDHA0QOy8L?=
 =?us-ascii?Q?DnnK9eo5M/QTQV1vsyr8LjwzyGaSmKZH7w8uEaadghbmnIbovRJ2Rzb5VF7O?=
 =?us-ascii?Q?cakzS7N6TtF+klsd2JSo1PIRO6/zCxF+kVZ2Gk64Ydbj8psx7kUUdCz65mLd?=
 =?us-ascii?Q?0/Z72+mERpBqezjqxw93qrArE1Yh3Gwbn6a068DwmTEXTtVDGlgxcasSvpr6?=
 =?us-ascii?Q?Km4nGUDuPDnoyeQlmC+BV8BqeN4BT1b26eD8mksm2SFMamJw0T5LiLPuKEur?=
 =?us-ascii?Q?P9+cDWuv3Szlydo6NXzHLxC5HFh1DV5878xiyVZm/n+cx4YariDDCEEWkaw2?=
 =?us-ascii?Q?O0zSTS3CgNgIgjKV3MQ35Ii9xX0S7Tw9jWBaebGnon9zH2m8/mNnAJwpSMEN?=
 =?us-ascii?Q?q7GrNVOLCL9s0BjWSJtuN3CNHosVBodmwMKXC1VpEz4NLLF6aJmIDRlRT4xD?=
 =?us-ascii?Q?EgC084RVijzng+M+R1LmhX1C+NLhYnszIhWtYjphnlCkMA7/CL/8AAwnSO0t?=
 =?us-ascii?Q?Nv1ZaJzDNUlUF3ze/RsRkEjkYQA0Y6EoUStiJMgGlSEdw59dvWEuHcWVO3Z9?=
 =?us-ascii?Q?oxApcVnpeAHW89HwFZhi/oqqsTifeUa/vxT+tD33EsC2utLepx5Bbhhv0mn2?=
 =?us-ascii?Q?QW85wkaiCJFuPGs8+w5QJkjJN8dlI1vGTONxUlQ8UM7wUPpgSwMRlcWXYzPH?=
 =?us-ascii?Q?ZH4WR9GNXRvjSQ85O/alvgvCXsvlfI0VBXnfWfZ0UsTjoeXkzHPI4aTV63cd?=
 =?us-ascii?Q?yaWjmTiysyRnQ4py4rWShZDzOCyZGK8fInOCjDOqBt+8ivSCQ9z5QYavtRH+?=
 =?us-ascii?Q?dbeY1EVKz1bN10zL5rOb9zZjqBxzezXi1zQ4OHf99t+pq3Xiqy2rNrduMJv/?=
 =?us-ascii?Q?wbaVIckei8t9+wAAikQBlvAwzlVNKZCI9kTxTw7WAYugQICg2FNow0ApUnwq?=
 =?us-ascii?Q?uQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c424277a-cde1-46c6-d65a-08dabc07aa09
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 12:50:32.9442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HnuECS9krFMhQ39p9ifSnAueDGrQBQvJoOYGJ4HZF+6FBdTCFmiB3xd9xfp1AK3UA0FN/PGlt2iHcjosbDG0JJSUoLQSuCXp7STgEQwlO/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7316
X-Proofpoint-ORIG-GUID: jq0hWzGXJOzkqf_7ScZzxFxvadD9yptQ
X-Proofpoint-GUID: jq0hWzGXJOzkqf_7ScZzxFxvadD9yptQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_06,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211010098
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, "Vinod
 Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



>-----Original Message-----
>From: Marijn Suijten <marijn.suijten@somainline.org>
>Sent: Tuesday, November 1, 2022 5:13 PM
>To: Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>
>Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; robdclark@gmail.com; dianders@chromium.org;
>swboyd@chromium.org; Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>;
>dmitry.baryshkov@linaro.org; Abhinav Kumar (QUIC)
><quic_abhinavk@quicinc.com>
>Subject: Re: [v7] drm/msm/disp/dpu1: add support for dspp sub block flush =
in
>sc7280
>
>WARNING: This email originated from outside of Qualcomm. Please be wary of
>any links or attachments, and do not enable macros.
>
>On 2022-11-01 03:57:05, Kalyan Thota wrote:
>> Flush mechanism for DSPP blocks has changed in sc7280 family, it
>> allows individual sub blocks to be flushed in coordination with master
>> flush control.
>>
>> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
>>
>> This change adds necessary support for the above design.
>>
>> Changes in v1:
>> - Few nits (Doug, Dmitry)
>> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
>>
>> Changes in v2:
>> - Move the address offset to flush macro (Dmitry)
>> - Seperate ops for the sub block flush (Dmitry)
>>
>> Changes in v3:
>> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
>>
>> Changes in v4:
>> - Use shorter version for unsigned int (Stephen)
>>
>> Changes in v5:
>> - Spurious patch please ignore.
>>
>> Changes in v6:
>> - Add SOB tag (Doug, Dmitry)
>>
>> Changes in v7:
>> - Cache flush mask per dspp (Dmitry)
>> - Few nits (Marijn)
>
>Thanks, but it seems like you skipped some of them.  I'll point them out a=
gain this
>time, including some new formatting issues.
>
>>
>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 ++-
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 46
>++++++++++++++++++++++++--
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  7 ++--
>>  5 files changed, 58 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 601d687..4170fbe 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -766,7 +766,7 @@ static void _dpu_crtc_setup_cp_blocks(struct
>> drm_crtc *crtc)
>>
>>               /* stage config flush mask */
>>               ctl->ops.update_pending_flush_dspp(ctl,
>> -                     mixer[i].hw_dspp->idx);
>> +                     mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
>>       }
>>  }
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 27f029f..0eecb2f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -65,7 +65,10 @@
>>       (PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>>
>>  #define CTL_SC7280_MASK \
>> -     (BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) |
>BIT(DPU_CTL_VM_CFG))
>> +     (BIT(DPU_CTL_ACTIVE_CFG) | \
>> +      BIT(DPU_CTL_FETCH_ACTIVE) | \
>> +      BIT(DPU_CTL_VM_CFG) | \
>> +      BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
>>
>>  #define MERGE_3D_SM8150_MASK (0)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 38aa38a..8148e91 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -161,10 +161,12 @@ enum {
>>   * DSPP sub-blocks
>>   * @DPU_DSPP_PCC             Panel color correction block
>>   * @DPU_DSPP_GC              Gamma correction block
>> + * @DPU_DSPP_IGC             Inverse Gamma correction block
>
>Here.
>
>>   */
>>  enum {
>>       DPU_DSPP_PCC =3D 0x1,
>>       DPU_DSPP_GC,
>> +     DPU_DSPP_IGC,
>>       DPU_DSPP_MAX
>>  };
>>
>> @@ -191,6 +193,7 @@ enum {
>>   * @DPU_CTL_SPLIT_DISPLAY:   CTL supports video mode split display
>>   * @DPU_CTL_FETCH_ACTIVE:    Active CTL for fetch HW (SSPPs)
>>   * @DPU_CTL_VM_CFG:          CTL config to support multiple VMs
>> + * @DPU_CTL_DSPP_BLOCK_FLUSH: CTL config to support dspp sub-block
>> + flush
>
>I even overlooked this in my review: all docs use spaces except these use =
tabs...
>Yet you use spaces here and didn't even align the text.
>
>Either use tabs in the line you add here, or replace the rest with spaces =
and align
>them again.
>
>>   * @DPU_CTL_MAX
>>   */
>>  enum {
>> @@ -198,6 +201,7 @@ enum {
>>       DPU_CTL_ACTIVE_CFG,
>>       DPU_CTL_FETCH_ACTIVE,
>>       DPU_CTL_VM_CFG,
>> +     DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
>>       DPU_CTL_MAX
>>  };
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> index a35ecb6..fbcb7da 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> @@ -33,6 +33,7 @@
>>  #define   CTL_INTF_FLUSH                0x110
>>  #define   CTL_INTF_MASTER               0x134
>>  #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
>> +#define   CTL_DSPP_n_FLUSH(n)                ((0x13C) + ((n) * 4))
>
>Here.
>
>>
>>  #define CTL_MIXER_BORDER_OUT            BIT(24)
>>  #define CTL_FLUSH_MASK_CTL              BIT(17)
>> @@ -110,9 +111,14 @@ static inline void
>> dpu_hw_ctl_trigger_pending(struct dpu_hw_ctl *ctx)
>>
>>  static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl
>> *ctx)  {
>> +     int i;
>> +
>>       trace_dpu_hw_ctl_clear_pending_flush(ctx->pending_flush_mask,
>>                                    dpu_hw_ctl_get_flush_register(ctx));
>>       ctx->pending_flush_mask =3D 0x0;
>> +
>> +     for(i =3D 0; i < ARRAY_SIZE(ctx->pending_dspp_flush_mask); i++)
>> +             ctx->pending_dspp_flush_mask[i] =3D 0x0;
>
>Any idea why the other `pending_xxx_flush_mask`s aren't cleared here?
>
Thank you for your comments Marijn. Other pending flushes are also need to =
be cleared; however I didn't want to include them in this patch, will post =
another change clearing the cached flush bits for other HW blocks.
Will wait for more comments on V7 and then will post V8 addressing your com=
ments.

>>  }
>>
>>  static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl
>> *ctx, @@ -130,6 +136,8 @@ static u32
>> dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>>
>>  static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl
>> *ctx)  {
>> +     int i;
>> +
>>       if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>>               DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
>>                               ctx->pending_merge_3d_flush_mask);
>> @@ -140,6 +148,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(stru=
ct
>dpu_hw_ctl *ctx)
>>               DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
>>                               ctx->pending_wb_flush_mask);
>>
>> +     for(i =3D 0; i < ARRAY_SIZE(ctx->pending_dspp_flush_mask); i++)
>> +             if (ctx->pending_dspp_flush_mask[i])
>> +                     DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH(i),
>> +                             ctx->pending_dspp_flush_mask[i]);
>> +
>>       DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);  }
>>
>> @@ -287,8 +300,9 @@ static void
>> dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,  }
>>
>>  static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx=
,
>> -     enum dpu_dspp dspp)
>> +     enum dpu_dspp dspp, u32 dspp_sub_blk)
>>  {
>> +
>>       switch (dspp) {
>>       case DSPP_0:
>>               ctx->pending_flush_mask |=3D BIT(13); @@ -307,6 +321,30 @@
>> static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>>       }
>>  }
>>
>> +static void dpu_hw_ctl_update_pending_flush_dspp_subblocks(
>> +     struct dpu_hw_ctl *ctx, enum dpu_dspp dspp, u32 dspp_sub_blk) {
>> +
>> +     if (dspp >=3D DSPP_MAX)
>> +             return;
>> +
>> +     switch (dspp_sub_blk) {
>> +     case DPU_DSPP_IGC:
>> +             ctx->pending_dspp_flush_mask[dspp-DSPP_0] |=3D BIT(2);
>
>Spaces around -, here and below.
>
>- Marijn
>
>> +             break;
>> +     case DPU_DSPP_PCC:
>> +             ctx->pending_dspp_flush_mask[dspp-DSPP_0] |=3D BIT(4);
>> +             break;
>> +     case DPU_DSPP_GC:
>> +             ctx->pending_dspp_flush_mask[dspp-DSPP_0] |=3D BIT(5);
>> +             break;
>> +     default:
>> +             return;
>> +     }
>> +
>> +     ctx->pending_flush_mask |=3D BIT(29); }
>> +
>>  static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32
>> timeout_us)  {
>>       struct dpu_hw_blk_reg_map *c =3D &ctx->hw; @@ -675,7 +713,11 @@
>> static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>>       ops->setup_blendstage =3D dpu_hw_ctl_setup_blendstage;
>>       ops->update_pending_flush_sspp =3D
>dpu_hw_ctl_update_pending_flush_sspp;
>>       ops->update_pending_flush_mixer =3D
>dpu_hw_ctl_update_pending_flush_mixer;
>> -     ops->update_pending_flush_dspp =3D
>dpu_hw_ctl_update_pending_flush_dspp;
>> +     if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
>> +             ops->update_pending_flush_dspp =3D
>dpu_hw_ctl_update_pending_flush_dspp_subblocks;
>> +     else
>> +             ops->update_pending_flush_dspp =3D
>> + dpu_hw_ctl_update_pending_flush_dspp;
>> +
>>       if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
>>               ops->set_active_pipes =3D
>> dpu_hw_ctl_set_fetch_pipe_active;  }; diff --git
>> a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> index 96c012e..ff4e92c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> @@ -148,13 +148,15 @@ struct dpu_hw_ctl_ops {
>>               enum dpu_lm blk);
>>
>>       /**
>> -      * OR in the given flushbits to the cached pending_flush_mask
>> +      * OR in the given flushbits to the cached
>> + pending_dspp_flush_mask
>>        * No effect on hardware
>>        * @ctx       : ctl path ctx pointer
>>        * @blk       : DSPP block index
>> +      * @dspp_sub_blk : DSPP sub-block index
>>        */
>>       void (*update_pending_flush_dspp)(struct dpu_hw_ctl *ctx,
>> -             enum dpu_dspp blk);
>> +             enum dpu_dspp blk, u32 dspp_sub_blk);
>> +
>>       /**
>>        * Write the value of the pending_flush_mask to hardware
>>        * @ctx       : ctl path ctx pointer
>> @@ -242,6 +244,7 @@ struct dpu_hw_ctl {
>>       u32 pending_intf_flush_mask;
>>       u32 pending_wb_flush_mask;
>>       u32 pending_merge_3d_flush_mask;
>> +     u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
>>
>>       /* ops */
>>       struct dpu_hw_ctl_ops ops;
>> --
>> 2.7.4
>>
