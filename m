Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A838B68DAC1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 15:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC14210E528;
	Tue,  7 Feb 2023 14:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0903710E512;
 Tue,  7 Feb 2023 14:28:19 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317EJMaS030489; Tue, 7 Feb 2023 14:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=jf9enrkGx/6ayqn05J1SZP8pE3Z1OPtaLuieiegnY1Y=;
 b=DI2NySMTY1wOWLGVU4rW7B71ud987NQjOFa6uhp2EqqkLtyX0B1ZP77TmVMXa3Dzf8qj
 KFw/DNYsjuMCvYHkp1DB0N9cY22vPZlWBuxx06tT0ryoV4CF6dqP6HwlzBqujlrmte9K
 L63n+Mz9Ks1PET6C8uIY1tKA5wqBV8j23GdfLNl/tKbYWzU6ocgD224T2ssQ2tH7x2Rv
 f2hpSEpPIZiUse8vqkUsjF66iiGX7yG3OmThq6mWzd4kcBQThn3b1Tj4B8FFohZ4cG0S
 DBzurlXShGrjMvTtxxfqfE1RsldzR8tlX8pWeTFJ80X0tr4haFm7eEk1kMxhTP+MNDja BQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkmnnrfr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 14:28:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h85/bWsVVP0EmUyodyYgRZIBMc5jFC5TDLLdvhRguIUxSe7NLxwQ++yrdsJ4HJ2CBwkLuvm1REQ4gPaNdZJNM9mDmSSwD4sCnYVU1gHEdieGa2rywUIzeuknduZUqkONVk4c/ys4EHiOQLZ/OidFkzop553UWhTC29eKkZoYSz3mE6ogEd4lIYD/wtzjzLF3TnkzC/JS0Gibn5CsKzjdW1xWRfF+RIjy4LyakvJdy4GUI+4cTLF9NTDaYgImytgEyB2ggM/cCNXXsay6jmCupz5ZZ9Eq9UTBZsWtpSKIOmWKb68pSmiBq2a4E7rqMCX2du8ovFQIevEeJDUYkkUrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf9enrkGx/6ayqn05J1SZP8pE3Z1OPtaLuieiegnY1Y=;
 b=f0TcXM6XA4eokxYgV4ZKVS+5Q8IQBDi1zw0Uhxf2VmVdEWyWia3z3gQT6vFZdibBUSD30bjgwTUj/n0YLIbTi5pHqGz5hB9RV2IYxvqfBidzbJyiyoY2UYjGm51r2YPChSyqA67b/a9ry6qKYi1jVmKoJTxLj5w1yJswpW83GKzDV/c6fxmvjhmYZ92rHC4Ny8mRepoOJYca8GZs0Ft67JkdbWo9spOJpbA2uDYtNMwxWv6vT894sdksYq6jyYDZugAQpvg7MrSXSkvMv4Z4KrU7yZb8OPm394R14wpN7dxnJBJUtgRSGjt0SIPGkNvGMoyKIcxsfmvcXGaFCWh5Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by SA1PR02MB8590.namprd02.prod.outlook.com (2603:10b6:806:1fd::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 14:28:13 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::d5de:8903:d3c3:8436]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::d5de:8903:d3c3:8436%8]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 14:28:13 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Vinod
 Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v12 09/14] drm/msm/dp: disable self_refresh_aware after
 entering psr
Thread-Topic: [PATCH v12 09/14] drm/msm/dp: disable self_refresh_aware after
 entering psr
Thread-Index: AQHZNL1NGOEc+Lhw7kmGg8fzonUgXK64e0MAgAsbfLA=
Date: Tue, 7 Feb 2023 14:28:13 +0000
Message-ID: <BN0PR02MB8173FF10EF6F1522C52F30E4E4DB9@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1675091494-13988-1-git-send-email-quic_vpolimer@quicinc.com>
 <1675091494-13988-10-git-send-email-quic_vpolimer@quicinc.com>
 <670d0a87-a932-6f33-b363-5499dc7ff29f@linaro.org>
In-Reply-To: <670d0a87-a932-6f33-b363-5499dc7ff29f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|SA1PR02MB8590:EE_
x-ms-office365-filtering-correlation-id: 89f4976a-327d-450e-1ca2-08db09178bbe
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1lSUquCVq7mDTJ5VelF4nMuJ1zAqkfvfGS1rHHLL9imewgO/9H9R6nRDOVRkqXP5toaevun3zfGV3zSuCqE6MybMoXbouwPwbR/MpCfTN9AXsXuX4vkMbSPQhe6uCaN/MSF4o7a6uqO/iLQWNH1+VS3X/4GuPqRBNvfbQLQZ6ORd6DaaqbyQT73jQ2LUWz0k9N9qrD+O1JlyDHAtNFKGqC0jK9jhDktOc0c/NdwrYQueCNQ1eKGNxJy5i97fJBasCpHDmjLNuNDufdisWOH1XQFQUqLGp95TmWMnglgVNtq67q8enY+Sl9yGKznNXGD1iou3nPvAEqS8fMpZYJtCF41AwEIfv9r4snIfvaXqxAKVYfU3+dgHTuHPaLC+ImrSnbODtBs+0cA9zyUXZ6ZHQlJfvzevIKXHUoo3HiP5z9V6krqMVKlh1x7gI7FfEV311pR86XhbvFHuAJfj6LVfLX/yU/RaqrpPRtuIv8AS0Mc7JmB2bCyDiGrS3c3PjcIBmfRtgSFsFSUMJVht1SgHVnUzYqQ27Ig/8D1KnxhbReKdW3MDNTgFRp8xFoU2yiemNJKxCJc7f7mBJU+X7s23DFXtRtdwP8iuA7hNUK+EpVAPHn71t1sYmPH5QI/gV7RGSHJriRCAPO3zsJzFup4qIJtCBZK+7s6yzn0IWL5Yy6PKhkrIhtVICa9Mac9LPS+w+UtDmrRIzizpYHk6l40hHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199018)(2906002)(33656002)(83380400001)(7696005)(71200400001)(107886003)(53546011)(26005)(186003)(6506007)(9686003)(478600001)(76116006)(64756008)(66476007)(66556008)(66946007)(66446008)(4326008)(8676002)(5660300002)(86362001)(55016003)(52536014)(8936002)(41300700001)(316002)(54906003)(110136005)(122000001)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW9JU0JQOEdxU2ErZXdNZzVIcUxaZ2VBL002bGRKenE2WUV3NDFGVUJ5UHNq?=
 =?utf-8?B?Z1pJMGJEbG9UejUyWjhEL1gwSWprVFBYZitmWEFSamg0NlEwcUJMYjNUNitV?=
 =?utf-8?B?eGNKTTdMVWt6U296Wit6b3h5clZjYTJVZHBjRm1nblNFQ1RGaE9kV0NOZmI1?=
 =?utf-8?B?eW90R1EvRldXUXdsZFRqWFBuZDZneEh0WlY2aG1VdTJ4ZVQ1NFlJVTF5WUFq?=
 =?utf-8?B?WnpGWlVjQnV2NjNDNFhkY3VhM2wrS2ZmMjJ3eXhVU1FFbUZJcWMzSlpqbGwy?=
 =?utf-8?B?U3EwTWcwa2N5d0lBSUQ2M2RzWXNjZHBCSUpnMFlGQVNPaFdmODNoRkVKcW1v?=
 =?utf-8?B?MHJUU3FoK1BQVThYemowZ3VCcDB6ZjlxT0FwWkFrTmhUZjYreDhLd1RwaE9P?=
 =?utf-8?B?S1BGQlA1RXYwb0szNnVmTmRoY2dNdXcwNHFVaXB2Z241Y2R6LzVVcCs4WEE1?=
 =?utf-8?B?OVY5Rm43aDdOY283bUNOaC93YkhMdVN2eHF2bDhsZnZEdyt2S2tkcGE3ZkVH?=
 =?utf-8?B?UFhyMHdoOXppYjZSRUYrZWs2ejFiSThjaDJKdXJ4S29pZUZGRi9ZTEExMTRn?=
 =?utf-8?B?bll1UXZ5Zzh0SGgzNElxQmZ3bEU1WDNRV0JnWVdDZFdMVzJXNTJDdUg3Y3BT?=
 =?utf-8?B?SldHUkRSYlEwQ1Zkc1c1Q25NcGR6UjJFbGlEN2RudXhscXNqa25VeTU5VEo5?=
 =?utf-8?B?dy95enlQRUorZ2EvYTJrbXNrblh5eTFrS0wxdS9ndGhHR09EMDZ1dW0ybW43?=
 =?utf-8?B?M0VmTnhzMG9RZktWSWszYzFyN1dDbmI4MHI4aVlMQ0l3eFRxVnl2SnRvclRt?=
 =?utf-8?B?cjAvTUprbDZreVFVUjdhOVF5YjZlem1jbkZYTzcvNGUwY0VLMUxsOUp4anMx?=
 =?utf-8?B?akVXc3lhbHBtb2c0YUVBUGMzSXRRaWlNWTZKWkxHVlBXUUVTU3NXdkFmdGFw?=
 =?utf-8?B?WmxUYlVMYzJzMnVYemU3UlRNM21iVlBjZ2xOMGx6Wkk4bng3RzBJLzJFeVBU?=
 =?utf-8?B?L29FYmxsMituMVNYK3FVT05kUTh0ZU9Ca05UYXhzNU4rSXZ6VXYwOHNaby9G?=
 =?utf-8?B?bjFNWE9uVXdvbjN4TGpuYktpZDlvMVlFd0tkV1Exek5tT3RqT20wcy9vZGQv?=
 =?utf-8?B?T3d2WDRBYVlhYXNQclV4Wmh0TTNGVjFoQzZYbldKekJxYjhmU2JUenhzVWRI?=
 =?utf-8?B?d29JbjRGZGhiUExyVlZNMllRaVJBM1E0TGM3YWQ5UXM3bVNHS1ZaUERERnE1?=
 =?utf-8?B?K1JTaFZSY3p0d2htK0MxOWpQUTlTK09GQzZ1aERPbHB4L0Z2V25LSEZ1N2U4?=
 =?utf-8?B?UWVJRzhqYzRLdXFGYVRIODRCejQweUE2WEtXaUdLVGxXRXVUWlI4ekYyUU9K?=
 =?utf-8?B?dEFhQWNqWDFhOUtzc3FFMHNjaFl3akViOEFiaWV4aWl5WVQ5dzNPR3J4UWhj?=
 =?utf-8?B?SjFtMkpFOTFQVTlkSmd6TlV3SC90TFA4amZTK25lSkFKbGVrNnBkZnhHdk85?=
 =?utf-8?B?UmpkMmpPdUE2d1BoblVXYjZXeitwZnZIeUZVV2daR3grWDRBakVyVnJzQ01V?=
 =?utf-8?B?VFVKU2xKM1pvRm5ob1lxR21BSzdxdFBWMGNNNXkvMzZzSVFEZWtUMXFrZksy?=
 =?utf-8?B?c3psNTE3VkhMWXNvQVF4R2lDcDlta3VNOU04aDJDbTA5a0dIQjVDaHNIdVlE?=
 =?utf-8?B?dXZiVDU0aHdwQkZ5TlNRWTI1WURIRTlSSk1wRjVoT3JDNU9iRmNFVmhlY1F0?=
 =?utf-8?B?OG10NFZCU01SL3RvOGR1Tk1CUFh5Ry9tLzNERS9ra3JBNmVwMTZiSEh0YVJ5?=
 =?utf-8?B?eTRLdXg2MmRIc01BSVFIS1RkbG1kZDgyZDA4Nys1dTV4ZmdINWxyNlRaOU9h?=
 =?utf-8?B?Z3Q2bmgwT29OM05pMm02U0VxUUplbDljZTBuOTRnNUo4dFltNWV6dER6NzVp?=
 =?utf-8?B?OCtLa0t5Z212ZENnUXlFOXV3U1ZIUnhEWGFzQUJHRjhJNlJrOWxLUVhoNlRD?=
 =?utf-8?B?NkdiNTlZS2lGUC9kMUI0TDQzbFE5em1kbUZ1VlZFeTlVNTJpN0VLdXhHSHVq?=
 =?utf-8?B?QWtWVEc3dDA4MDJxV1J0aWI5UzBDWWZWMW5kQXordTU3dEV1TmhHMFliTllN?=
 =?utf-8?B?cWVwV05Zdit6c21ZaUNsTHVkcjZhY1lrcEhZTkw3bzJ0NitBeDcwOFNtUkkw?=
 =?utf-8?B?ekE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: prgHl5crKVKWksusdXgsXIagM4bq75wDg+G/OwtYiEfblpsOe7v8FZETbMjag5ZtZkNg+kSH71n7ECK7WCG7zjCGvbledc56hZSDnWnhejVhuBxnuud0Rqav+N7xWP+GCMSaodtoJsLItrHoQ2yIaJGwC8KY29gYAfEdV2IBoXqs1FEpZk/RAGhdxGLFq3vgpMD9IH6SCGUnHBvk4v9EhTo4o2bVz8bP/SjWg/XGX3AciOH2D6OS/801wKSGhuK1EGiiYcwn7v6O+/ytpsM3Ebwc5VmGHm7J8K0YoMsQLGYVhKI0dbr7JVHGfErdro+YAn7SAJENfdZYbqvVeZMCbJVxj0U1HJZAXWmgB1yrwpf0jWdh9ciYjgDt+ZSYMLdMgDbIC7JNP+/9h2FRIrIQZCHKGNYT/lmZmnjZl1TcbnYFxSyWiaJ1BSd7dc7/Y/4Hc295/lNDgoCV5cj062zNqgG+nQZaI+kCaD5WZZDLpcHTY1VthE/zSudMAJVLhbqWD/V8VbBafoewmX+SoP38HpHDMrug6IPo9wF1RsyFHhuTZulirTd7wqmw4LaGRLshRsnJvtpkp+OL5KGL5JrDjwCWHXZfw524TCkZn6Lg8oc5qpbF9vYUachred+h4f7Z+3zZfqnKmsEDq0/y3gOhJSadAIjiufiB1xJDW/XlRCPXOuWTSspKKyYCWLmPaiNWv93BBHcVgbXk1ieDG1ZtsdEwMfnpz9s16F2zZ57Nuq76wgO+Yb7PPqOoWR3hXSRJQ1zoLmRRvQkqFTa1LUg19NjokZzEGVP8921aPKDwhavaGVKBXl6E+8cbKDxRMBdWVnUHPiT6NyJVFtORaSTY/CblG+JB0ulgRsm8GVRYD7r0KGKf8T4it5CojYJiefifXfFhf5aP5db1Bub9Eg25t4RatN3z5vStffxFhWxsHkM=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f4976a-327d-450e-1ca2-08db09178bbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 14:28:13.5822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7NPrZjk6+YQBqgJ7QuoUbhGF4T9hUdICF9jtozVg8p9as97nckDnZpea5+N3X8qhM7km/oWOd+jRhGMvMsujm1ann7DLiHWJkm+j/uqgY8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8590
X-Proofpoint-ORIG-GUID: sgTPq1GuRrikJC_ojb9kLd8BxvpgpKXh
X-Proofpoint-GUID: sgTPq1GuRrikJC_ojb9kLd8BxvpgpKXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_06,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxlogscore=567 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070129
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5
IDMxLCAyMDIzIDY6MTkgUE0NCj4gVG86IFZpbm9kIFBvbGltZXJhIChRVUlDKSA8cXVpY192cG9s
aW1lckBxdWljaW5jLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBs
aW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsNCj4gZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IFNhbmtlZXJ0aCBCaWxs
YWthbnRpIChRVUlDKSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT47IGxpbnV4LQ0KPiBrZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyByb2JkY2xhcmtAZ21haWwuY29tOyBkaWFuZGVyc0BjaHJvbWl1
bS5vcmc7DQo+IHN3Ym95ZEBjaHJvbWl1bS5vcmc7IEthbHlhbiBUaG90YSAoUVVJQykgPHF1aWNf
a2FseWFudEBxdWljaW5jLmNvbT47DQo+IEt1b2dlZSBIc2llaCAoUVVJQykgPHF1aWNfa2hzaWVo
QHF1aWNpbmMuY29tPjsgVmlzaG51dmFyZGhhbg0KPiBQcm9kZHV0dXJpIChRVUlDKSA8cXVpY192
cHJvZGR1dEBxdWljaW5jLmNvbT47IEJqb3JuIEFuZGVyc3NvbiAoUVVJQykNCj4gPHF1aWNfYmpv
cmFuZGVAcXVpY2luYy5jb20+OyBBYmhpbmF2IEt1bWFyIChRVUlDKQ0KPiA8cXVpY19hYmhpbmF2
a0BxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTIgMDkvMTRdIGRybS9tc20v
ZHA6IGRpc2FibGUgc2VsZl9yZWZyZXNoX2F3YXJlDQo+IGFmdGVyIGVudGVyaW5nIHBzcg0KPiAg
DQo+IE9uIDMwLzAxLzIwMjMgMTc6MTEsIFZpbm9kIFBvbGltZXJhIHdyb3RlOg0KPiA+IEZyb206
IFNhbmtlZXJ0aCBCaWxsYWthbnRpIDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPg0KPiA+DQo+
ID4gVXBkYXRlZCBmcmFtZXMgZ2V0IHF1ZXVlZCBpZiBzZWxmX3JlZnJlc2hfYXdhcmUgaXMgc2V0
IHdoZW4gdGhlDQo+ID4gc2luayBpcyBpbiBwc3IuIFRvIHN1cHBvcnQgYnJpZGdlIGVuYWJsZSBh
bmQgYXZvaWQgcXVldWluZyBvZiB1cGRhdGUNCj4gPiBmcmFtZXMsIHJlc2V0IHRoZSBzZWxmX3Jl
ZnJlc2hfYXdhcmUgc3RhdGUgYWZ0ZXIgZW50ZXJpbmcgcHNyLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogU2Fua2VlcnRoIEJpbGxha2FudGkgPHF1aWNfc2JpbGxha2FAcXVpY2luYy5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogVmlub2QgUG9saW1lcmEgPHF1aWNfdnBvbGltZXJAcXVpY2luYy5j
b20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2RybS5jIHwgMjUg
KysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IEFzIEkgc3RhdGVkIGluIHYxMSdzIGRpc2N1
c3Npb24sIEkgZG8gbm90IGxpa2UgdGhlIHdheSB0aGlzIGNoYW5nZSBwbGF5cw0KPiB3aXRoIHRo
ZSBzZWxmX3JlZnJlc2hfYXdhcmUuIFBsZWFzZSBmaW5kIGFub3RoZXIgd2F5IHRvIHdvcmsgYXJv
dW5kIHRoZQ0KPiB0aW1pbmcgaXNzdWUgKGxldCdzIHByb2JhYmx5IGNvbnRpbnVlIHRoZSBkaXNj
dXNzaW9uIGJhY2sgaW4gdjExKS4NCj4gDQpDdXJyZW50bHkgd2UgYXJlIG5vdCBhYmxlIHRvIHJl
cHJvZHVjZSB0aGUgaXNzdWUgd2l0aCBLQVNBTiBlbmFibGVkIGFuZCBtaW5pbXVtIGNwdSBmcmVx
dWVuY3kgYnVpbGRzLg0KV2UgY2FuIHJldmlzaXQgdGhpcyBwYXRjaCBpZiBpdCBpcyByZXByb2R1
Y2VkIGluIGZ1dHVyZS4gTWVhbndoaWxlIEkgdGhpbmsgb24gaGFuZGxpbmcgaXQgaW4gYSBkaWZm
ZXJlbnQgd2F5Lg0KQ2FuIHdlIG5vdCBjb25zaWRlciB0aGlzIHBhdGNoIGZvciBjdXJyZW50IG1l
cmdlPw0KDQo+IC0tDQo+IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQoNClRoYW5rcywNClZp
bm9kIFAuDQo=
