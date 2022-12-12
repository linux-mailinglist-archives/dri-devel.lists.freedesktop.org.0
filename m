Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E1A649DF9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 12:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5837110E1AC;
	Mon, 12 Dec 2022 11:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D20510E1AC;
 Mon, 12 Dec 2022 11:35:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BC9WFbF027375; Mon, 12 Dec 2022 11:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=l0NfOg0dl2bu5SEEEFrxtRE2WPJBOm7iq1kloE3CUig=;
 b=ah6wUmiG/ZkzkQn8MQFESI/3gg05gP4ZB2DkUmHfTu84zYl5pJHLnMTXsdtRe8Tleqh2
 1Dwp2TT9w8ETRo9XN00BHoVwwj2w/qDsW7gcgzsw+K35Qlm97BbkyxUgfmwI/2A1kYMj
 wGM6h8jExx/yjd3WZZ7uXBU9RTMwKq66FdGSjkwAmHoKxsZdZbDMtCdPXJa7tyGvDsKK
 JhA8OEMw+i756SjSZGYwYwMBdsOv65jIbU2yEdcTkIn4fSEmBnKANTNfsgppWFhZBs6b
 HioedWWJTn4mtRyQt/F77Tmcj61kuBG2r47P05Wxvm9F9Pcp5asLQ+1zR4L5EtySohJp gg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mcjvnutym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 11:35:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxwkBx91jD3YfC89m4E9ncB4gunvcMjrZIrQH5ZiMV3LCo5Ydiy5FvHNCSGmMvlnPL6TA6I3bVfgc3pbXn6Ma9hhJ4UTRITvu3Xebjh0e+AY+0QKI7eeft+MwS08pDdIBcMw/6ZYfMHYM2IcQBb1xC1PUCV7MB5LtMZx9krHGuWlapwcMHZ3Q7eFqMrej+jnVS7fb8zgDAU3JBJptQlzAJl69xuhmZhOKlE4ku2c7eZnaCp3XimA7Xw8CHs8peY6x7dEaOkOFwLaXmD669WfcvAZ9JNBpY2bNeIs5H2jtEivCz4cYJTzrzjDlR2cGmHwJRM+Ki30QgnmdU000OFUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0NfOg0dl2bu5SEEEFrxtRE2WPJBOm7iq1kloE3CUig=;
 b=EGccUkSvW58+2ZHLjK6Bxzqj8OWpq2i86beu3UxkkrxyMY26VxKiYgcEf3m7rLs9OOPyiS2q2m1XdjbPuLknXTpL+XBzLpoar4TEhi3kw5OhJDd0gizOnVwJIkD+HyFX8WInGCtcuSWZ3exMIHr6qqCU2Q58WNM8mQjpWyJFVqpe5taRbiQNT9eA86l5jWhxyq+80/YSI3QnW56SzzS4SONbht+lOc0neilabpuTzp0hOVUaY4EsEiiQnJomHCtGeHRpKUb6LwFT0t+h1+moUH0RfZ6QM3dk8fxZr4X41ifO8iAWF+CiJ0snWofZLpDjioeGn/NzHj8MHfdgBHdr9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8142.namprd02.prod.outlook.com (2603:10b6:408:16a::19)
 by DS0PR02MB9221.namprd02.prod.outlook.com (2603:10b6:8:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 11:35:16 +0000
Received: from BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::881:65fa:f52a:480f]) by BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::881:65fa:f52a:480f%3]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 11:35:15 +0000
From: Kalyan Thota <kalyant@qti.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>, "Kalyan Thota (QUIC)"
 <quic_kalyant@quicinc.com>
Subject: RE: [v10] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Thread-Topic: [v10] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Thread-Index: AQHZCjvG/FWn27I6WESw0GNNpbh1v65idk8AgAFPmmA=
Date: Mon, 12 Dec 2022 11:35:15 +0000
Message-ID: <BN0PR02MB81425C5E341E0FF1C374A3A496E29@BN0PR02MB8142.namprd02.prod.outlook.com>
References: <1670417963-19426-1-git-send-email-quic_kalyant@quicinc.com>
 <20221207140832.6r2kznoulfek7yye@SoMainline.org>
In-Reply-To: <20221207140832.6r2kznoulfek7yye@SoMainline.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8142:EE_|DS0PR02MB9221:EE_
x-ms-office365-filtering-correlation-id: 25f8fc2c-5b38-45e8-e069-08dadc34f085
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +X1dt9aLY9L8WNA/26MOyyvPziOcVPIZ7zoH3X/bD3JbhNzxSZq+0ygovhB/yKheD87KyX6Q7C8v18Hl7LnSDNAqoGbyePC9f/cPYP+gqiN+WD20IiB8eXciABo01IRnaJ/zns7ehzdCsQ/f8gq7v5K6btoWMrQX9fTuIuvaKX1KmzOmSGSbumBgk+RIQzWq8+Rg1F40tP0VBP71kIlZPn9leqdZ9ySkOA/sut295QC1kY/Az9/StxPxKDdyDBj4acklf+lbWO9JjAjHMRqDxarRgrg7NiqeHCrZj1dzwOn0bNY8ORXStQFbASRamh/Mq2JUiM2XWLuOAnZ7Ily2/HamuP3sDekN7prbil+cOUyQ/GJsWfhi2TNCajaO+mP7Eu6o+CIEXz2/rKK0ycLHKZA055yf1NBgiknjnC6/G/8lFonDLnoBXtn/WtwI/9pU0xpp0IbcsKJX4V334f2zJJEk8F1WcmJX0cMlr1FllaYdlEBq/Jkp79CyIQVvqjEcRyFfpFulc7XWqUclhXqSKGBy0e6STAurCsFOStYU8ekkxNaalw1IrnmOr9GGx+2RE3U9TiK7dASIjxxX7UEkkbBLyHr9sIHiOOzLT5LjyjdBfp9vX04BsENrRn7V0aGGKl/tQZ+SFL94u8sGvTOU7en7sxY//aL/NO8k1alot5RUNPa2H55j53UskxrLF6RFb2BAnQtsmiP2oemW76cgag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8142.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199015)(66476007)(2906002)(33656002)(83380400001)(54906003)(86362001)(5660300002)(7416002)(52536014)(4326008)(8936002)(55016003)(122000001)(38100700002)(316002)(66556008)(38070700005)(76116006)(8676002)(66946007)(41300700001)(66446008)(64756008)(9686003)(107886003)(110136005)(186003)(6506007)(7696005)(478600001)(26005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cHeWi7vK6XvcAk7m+QAjHmzSTUska//w4CPkVLIpgcWi+JIyW4Xqv+rNK7oC?=
 =?us-ascii?Q?Gw47M+9KUgJz290URYBo83lyxJsZFalNf9aazRDcba8ozgR1ZyqpthyRdEj+?=
 =?us-ascii?Q?PsjP52m7m7rcDv1mcbq7k9muWt8DQe7+fwzPaEYPHAgEaCPE3mKl/O6QVTQt?=
 =?us-ascii?Q?GNdIz+CSmC+bx/My+Nzluz5f9hEyNfcnsuInltya5+wl4cSpEroeYQgMBdFv?=
 =?us-ascii?Q?zL3ZvUrpuXdg3Hwv6UvQMqvNc08pAukaf6sIiEINpRPF67IP9fbluLjiKALy?=
 =?us-ascii?Q?58nB69hmunIKnYMRxxH/HOtxSfPKRwwicm738s1RswTSJDY0lPZjKSl+P0Qb?=
 =?us-ascii?Q?onmppohCau7/U5y0y1BQFK/LACFFeC2DDXumUa1HP86cHNU+75XsguxFfz2v?=
 =?us-ascii?Q?Zgr3Kb0tHFMHMZy4sRh/8ahBj2BWp2iWq546ivMy+Ypzppzh4WMRvwbYRfFr?=
 =?us-ascii?Q?dbJbnozeH6D9ryy+HoPGE/Wc1R9ThRyIxCHBQikj3vhaaSjv8JgheE9Aqw2d?=
 =?us-ascii?Q?rbFnrguLTDbgutzELE114f5KQqEMAEfx51540c6vu3etQo6GB8RGW/Xsjj1b?=
 =?us-ascii?Q?KGKTVryCw2isn4vgNEKFZBHilLVCPJ8VUCS1P4OTPrdV2wQeueN4Mcrr7bD+?=
 =?us-ascii?Q?vgMDM1zMT16W5KfxsiM/AdNxF+omSRGAfyHOFhV8j1DlsOdKinkrFz4ky5ic?=
 =?us-ascii?Q?zdYpqlAiYRytXgh70Tja1MixhvTUVzMFXpUN9RussN3vG1w9oO76lNgbpX/M?=
 =?us-ascii?Q?FM9niYT9oLsyJTiHd2azKWvOk/Ok7RhlGHJY7rprrovOuxT0Ii318e9ZyoRo?=
 =?us-ascii?Q?flNkxNGGsJwxMV7/q8a4pU5NWiycgtLtBNw14jIu1yDd9YM3GbXTSU2M1q75?=
 =?us-ascii?Q?r/mwElcpIsf0WWfy6B4ocQ4R/ikYUtBzR8oMaNMzD3GJ+g9Bb/7Bj+wgb7IW?=
 =?us-ascii?Q?gX14xPhg/tGNJkMmwOiUh/IH5p/DLJHerV7usuIke5xAxRobcGScW1oABs73?=
 =?us-ascii?Q?QGIOZB+TNInvjFfDLjmHrumGhvej1YfCY4Ck+Zk9pKJ+CnaVlc1332VSakn4?=
 =?us-ascii?Q?yZGx9sdkVw8y5hlk9CpYicTfIDoiTK6b7TMxQpjYl1V8iNM5oqCpZwPCeLMj?=
 =?us-ascii?Q?xoYWuOA3M6rH7f91A+b23JK1Al1KohZun+N4LDBfvOzIG/+d3B2vWvXw+Pbo?=
 =?us-ascii?Q?IJLYe1WcJhautlBerNhzmtuYYTlHUnhBCeEpOsMQ7McRyJ8IZVAiwaUHSvIH?=
 =?us-ascii?Q?nscw1R4v2t5BuD8bKFEiNaSRYyHi+QDbIN6PzYuv20L1U+FA1jlIHU50lPcd?=
 =?us-ascii?Q?1GwVq76yaulF7gzhV5D+/nwMjbjOxoN+fUj6OX1hWgM9QCL8WJs81yrjpCBX?=
 =?us-ascii?Q?qJdUqG5SlQbEbVHtRFv9KeVr3kxWezt2a5PjKwpJzvTpFq/nJYxr7imspUnt?=
 =?us-ascii?Q?eRddVzUgeR9TxXQ5PLMxXI6Y2wSkPMoqOCTwHK24a2pS2/LzMPIP+0PM/57M?=
 =?us-ascii?Q?dUnSRyu93vPbeRy4g2vbB7YhLEMuRTD7qJy50srGezXd5SDowp5xEOmf8OjQ?=
 =?us-ascii?Q?M9edebw0+3YwYAKYetsMDGxJoW/gX29FGrMvqivRaWpM4XCOZk7+CELVOgmA?=
 =?us-ascii?Q?bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f8fc2c-5b38-45e8-e069-08dadc34f085
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 11:35:15.7593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8NlW+3LcKYPaK1K5P6duX8tdgcJMxtFpTrGN8DQkZG/XTQu+V3ynmqW24wmV8xQ64l2957ZXndYoVRptzvEI4eHR/5Ad7DWmvid4fTpfSeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9221
X-Proofpoint-GUID: R8cR_R3m-2wz_qGULe5z9qi8Z-53EcYG
X-Proofpoint-ORIG-GUID: R8cR_R3m-2wz_qGULe5z9qi8Z-53EcYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120107
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
>Sent: Wednesday, December 7, 2022 7:39 PM
>To: Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>
>Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; robdclark@chromium.org; dianders@chromium.org;
>swboyd@chromium.org; Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>;
>dmitry.baryshkov@linaro.org; Abhinav Kumar (QUIC)
><quic_abhinavk@quicinc.com>
>Subject: Re: [v10] drm/msm/disp/dpu1: add support for dspp sub block flush=
 in
>sc7280
>
>WARNING: This email originated from outside of Qualcomm. Please be wary of
>any links or attachments, and do not enable macros.
>
>On 2022-12-07 04:59:23, Kalyan Thota wrote:
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
>>
>> Changes in v8:
>> - Few nits (Marijn)
>>
>> Changes in v9:
>> - use DSPP enum while accessing flush mask to make it readable
>> (Dmitry)
>> - Few nits (Dmitry)
>>
>> Changes in v10:
>> - fix white spaces in a seperate patch (Dmitry)
>>
>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 ++-
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 44
>++++++++++++++++++++++++--
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  5 ++-
>>  5 files changed, 55 insertions(+), 5 deletions(-)
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
>> index 38aa38a..126ee37 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -161,10 +161,12 @@ enum {
>>   * DSPP sub-blocks
>>   * @DPU_DSPP_PCC             Panel color correction block
>>   * @DPU_DSPP_GC              Gamma correction block
>> + * @DPU_DSPP_IGC             Inverse gamma correction block
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
>> + * @DPU_CTL_DSPP_BLOCK_FLUSH  CTL config to support dspp sub-block
>> + flush
>
>The above uses tabs, why does this use spaces?
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
>> index a35ecb6..e801be1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> @@ -33,6 +33,7 @@
>>  #define   CTL_INTF_FLUSH                0x110
>>  #define   CTL_INTF_MASTER               0x134
>>  #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
>> +#define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
>>
>>  #define CTL_MIXER_BORDER_OUT            BIT(24)
>>  #define CTL_FLUSH_MASK_CTL              BIT(17)
>> @@ -113,6 +114,9 @@ static inline void
>dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
>>       trace_dpu_hw_ctl_clear_pending_flush(ctx->pending_flush_mask,
>>                                    dpu_hw_ctl_get_flush_register(ctx));
>>       ctx->pending_flush_mask =3D 0x0;
>> +
>> +     memset(ctx->pending_dspp_flush_mask, 0,
>> +             sizeof(ctx->pending_dspp_flush_mask));
>>  }
>>
>>  static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl
>> *ctx, @@ -130,6 +134,8 @@ static u32
>> dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>>
>>  static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl
>> *ctx)  {
>> +     int dspp;
>> +
>>       if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>>               DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
>>                               ctx->pending_merge_3d_flush_mask);
>> @@ -140,6 +146,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(stru=
ct
>dpu_hw_ctl *ctx)
>>               DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
>>                               ctx->pending_wb_flush_mask);
>>
>> +     for(dspp =3D DSPP_0; dspp < DSPP_MAX; dspp++)
>
>Space between for and (?
>
>> +             if (ctx->pending_dspp_flush_mask[dspp - DSPP_0])
>> +                     DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH(dspp - DS=
PP_0),
>> +                             ctx->pending_dspp_flush_mask[dspp -
>> + DSPP_0]);
>
>Shouldn't this loop as a whole check if _any_ DSPP flush is requested via
>`pending_flush_mask & BIT(29)`?  The other flushes don't check the per-blo=
ck
>mask value either (and could write zero that way) but only base this check=
 on the
>presence of a global flush mask for that block.
>
BIT(29) enables dspp flush only from DPU rev 7.x.x where hierarchal flush i=
s introduced. For other targets that supports CTL_ACTIVE, it's a NOP.
With the check "pending_flush_mask & BIT(29)", unintended DSPP registers fo=
r that CTL path will be programmed to "0" which is not correct IMO.
Secondly "pending_flush_mask & BIT(29)" although will not be true for DPU 6=
.x.x versions but can be confusing w.r.t code readability.
Let me know your thoughts.

>> +
>>       DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);  }
>>
>> @@ -287,8 +298,9 @@ static void
>> dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,  }
>>
>>  static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx=
,
>> -     enum dpu_dspp dspp)
>> +     enum dpu_dspp dspp, u32 dspp_sub_blk)
>>  {
>> +
>
>Empty line needed for?
>
>>       switch (dspp) {
>>       case DSPP_0:
>>               ctx->pending_flush_mask |=3D BIT(13); @@ -307,6 +319,30 @@
>> static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>>       }
>>  }
>>
>> +static void dpu_hw_ctl_update_pending_flush_dspp_subblocks(
>> +     struct dpu_hw_ctl *ctx, enum dpu_dspp dspp, u32 dspp_sub_blk) {
>> +
>
>And here?
>
>> +     if (dspp >=3D DSPP_MAX)
>> +             return;
>> +
>> +     switch (dspp_sub_blk) {
>> +     case DPU_DSPP_IGC:
>> +             ctx->pending_dspp_flush_mask[dspp - DSPP_0] |=3D BIT(2);
>> +             break;
>> +     case DPU_DSPP_PCC:
>> +             ctx->pending_dspp_flush_mask[dspp - DSPP_0] |=3D BIT(4);
>> +             break;
>> +     case DPU_DSPP_GC:
>> +             ctx->pending_dspp_flush_mask[dspp - DSPP_0] |=3D BIT(5);
>> +             break;
>> +     default:
>> +             return;
>> +     }
>> +
>> +     ctx->pending_flush_mask |=3D BIT(29);
>
>Can/should we define an _IDX for this, like is done with MERGE_3D_IDX,
>DSC_IDX, INTF_IDX and WB_IDX?
>
>> +}
>> +
>>  static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32
>> timeout_us)  {
>>       struct dpu_hw_blk_reg_map *c =3D &ctx->hw; @@ -675,7 +711,11 @@
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
>> index 96c012e..78611a8 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> @@ -152,9 +152,11 @@ struct dpu_hw_ctl_ops {
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
