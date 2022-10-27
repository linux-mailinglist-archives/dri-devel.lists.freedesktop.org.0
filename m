Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9A260F927
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 15:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5793310E639;
	Thu, 27 Oct 2022 13:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5F010E5F3;
 Thu, 27 Oct 2022 13:34:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RDIHBn012141;
 Thu, 27 Oct 2022 13:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=HntS9Gj7IkFb/POc0+sxwkuWhUtPg3L8aAafMz2X/q0=;
 b=bdZgarTkOMOIyalUwKGSfyiwgCIth5tuD9YcjXUQEgqZJRmCsZw5F9x3ndCQPM6IdywT
 oz//FT79YeHcD7YBIoyVJ9ZAAign2CGXkCVPoVZyZr0QrwqmRk0kFp80yKFRbE1bxbbW
 jcrlKrFpmKuYpIbcwhRmLzU4+BU7QlvOxCwjiQlHyIpV3TLLt3r5nh5+J9TO7TYepz4o
 NiDu85zgjqkPK2s2/iN2hpeW1+Oh3gV1YSmqgiz5ZqjXMDDhqKOGIwy/D7udNkrzQ2qQ
 wLf6iyts7uWtnMyvZT62oBoaOJFpKxrz1awpbY0PXDXfzcdr40PDKcLYMVzasi97gfTe lw== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kfahcb54g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 13:34:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bF4oVmAYbTR+yyKISNNt6fgeMbnE58UJQxZ4kGQpc+33gzW7qnX9q/fl0f1mCuFRV3Azthb4EuIZ6qXWJuFBc5ZEI8uWx9LZIm7RxIR8K1fW/PdNSlfcWsHOkSNBISOACtZghgssZ/RXHsUwhnOF632OPUtHCg/KCYKt+zCZAqiLJLXl3TaN74nND1tnRbQrA2susKKTtRaZV/b5OBKKiKHs+V6cvEWwHXkruozFY1vBFv4merE86UDx+dR25G2IymdAi/gAz2Kp7DraZroSzY2POzIseRrR6HEWSrkumesCqMHWJB87ePmN7cUWxBP/e14f7866YvLawgB1V44HYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HntS9Gj7IkFb/POc0+sxwkuWhUtPg3L8aAafMz2X/q0=;
 b=V/m0mzNeFul43hver0e+dxBu/dSqgA6jkC/MtXwNW0zv0bqteoDcv+vElwRHU52mq9e/jHAoPf3conqw+aNQW4EBSNjsfKXL7Z0NC9KA4Gtis96CqDfYEHjNnZFVhBfLVoyTj6MU41FiYMv8R8GexkorZmsJPSZix7hspwSddZecP98l+B8O8t/1pWtGJUUTjyX1Fdw9lsB1rSqZ4A/6is0vVyDZ8v2cPVQloM7RWdxSWc/KpqcvwaJLuJuFZbF+OUZKmws2MQDhYfLmAxinqmmLU8GtoWls7EgPF9dmKbsohDuKUMp6iQeHNJ/cSoRJe5NRA6rWbHqIPNU8FodyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by CH2PR02MB6598.namprd02.prod.outlook.com (2603:10b6:610:a7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 27 Oct
 2022 13:34:44 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::365b:898:5af:62d6]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::365b:898:5af:62d6%7]) with mapi id 15.20.5769.015; Thu, 27 Oct 2022
 13:34:44 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Vinod
 Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v8 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Thread-Topic: [PATCH v8 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Thread-Index: AQHY3jKacr4ce2QZ1kquBeIXIfkSRa4dvGqAgASYVLA=
Date: Thu, 27 Oct 2022 13:34:44 +0000
Message-ID: <BN0PR02MB8173F084DD0DDAD2E312CA6DE4339@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1665576159-3749-1-git-send-email-quic_vpolimer@quicinc.com>
 <1665576159-3749-2-git-send-email-quic_vpolimer@quicinc.com>
 <52e7a83b-bd83-ba63-55f9-a75cf549546d@linaro.org>
In-Reply-To: <52e7a83b-bd83-ba63-55f9-a75cf549546d@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|CH2PR02MB6598:EE_
x-ms-office365-filtering-correlation-id: 401a877b-0e05-4f83-fea6-08dab820022f
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wMHwrRCcCJFNXUFgOJEJj/Fl35TNQq3WSCFxII9PF22rCy0+Me1mzGs6RQtOJSO07c9ICwrR0oLxRX2ayObbQPxhhPKDZAVwcNGPf5jDsvDDnxWQ6+VXrCZCRnC8Kd8yAOvfvdN78KsC+7Uy6I+HsD3WucBM5I2zUXkFfyIoWbjd1QynRZlhPjg6FnA4/Hveg2itfJY6BNq3RiPQlZ7LH1EIrvwvC/8nI+nsyxIVzUD3eNP34+uN2HKFxPXCN6hmTUzV+/Nmt4NHMdYmwqYfDrxF/RYvMpRNF27OvcKC+mTr19KBfUOrxnJxkoTZpAWl7ra6ny4fU5qlBhBbuoS0NUZQ2ad7SIJ3o9B7RD7wfUhxnMWo2OHnR/NudM5+46xxBgR58VitRGavBykRt1zgNCS5jEVfqNHr4TTUAVOOEY8UL2GM+hnUkZCRWgiC8pYyqTg2zgyl9/XmWKocsqxSERjXjcenSbZwBcPUS6vacSQ2AGNKFUh+dLyq8f/wKWs8/KQRvVKpE8BsUl8JKr8XXaCfHAPtwxthoSnQKhsc6WzwfO2dKmrnKMwBpySsfx3oq4hfdgMsqZERDfdxqUhFuoN7IU6NrNP9OSPm2RHKhJC+q4wxE0SBG1xbSismBLGgFup5XkoLLdTEBUCiFDwlLFNwUAmJubGE44PAST4aLrn6XqpLh8styJgQRPT9F4LLmb6bDKSdUwiuAgoCYHIvNYnhuQOGpqhA9pehLi3WxFIhqJQ9Ib2Piu+y/J1JMNa8kMvBvFBkss7OoiIDBwUGTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199015)(53546011)(55016003)(71200400001)(478600001)(110136005)(86362001)(54906003)(33656002)(107886003)(316002)(76116006)(64756008)(7696005)(66556008)(66946007)(66476007)(66446008)(6506007)(38070700005)(4326008)(8676002)(9686003)(26005)(186003)(2906002)(52536014)(41300700001)(122000001)(5660300002)(38100700002)(8936002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1p5T0tuVjJ3cWltM0Y4dy9ERDNsV0kvSktDKzRNRzFESm1BaFRFMjRYRG43?=
 =?utf-8?B?R08rNm9kVGMycVVtSjdkVFp4SkJEdTluZUluTlRiZDhCODVGUnFOeDdIaVVD?=
 =?utf-8?B?RHFwRHRVaWtzS0RTOWJTRWVXR1IrOVJ1b1BhdThGV2FidHhkS1ZiSFRKZG44?=
 =?utf-8?B?Yk15K2F3cjNuV0xzQmlMdVFVZGlRZkF6OTZ0MDRHT2dpQmNsR3Z3VnVaQ1Fq?=
 =?utf-8?B?RmVrN2NzcmVzVm1laVdCSTZaSVZoeDBXcHNRM0lheE52anhOdWdFY0dLU0xt?=
 =?utf-8?B?TXE2N2NrQWx6c3IyZXNTU3NKcmNHa1JWUXFVYkVCNmdkM0VMQXR2L1MwL0J1?=
 =?utf-8?B?YnAxUTV4VHdOMWJkTlRMSXZTazZKVVBLejloSUhuclI5eVpTNXBOM2RMODhz?=
 =?utf-8?B?ZThHWjZnc1ZrcWdGZGhNakJnY1crWkZZYTF1TTFTR0o1NzkxUklVZTRxVU9r?=
 =?utf-8?B?d2gzQ21XenExdVFBaFNjNUNJNFZlSThSUnJkYm5EK3JmSk1sVnAyTm5scE44?=
 =?utf-8?B?MlBsWlZNNXdyUU1uUm5DRWF1S3RqVTBKL0ttWFpHUUF5UCtNYXNhMk1XeGp0?=
 =?utf-8?B?RkRxa3dLYWQrNFE2NjBEMkFOeS9vdUNxdmpPbmZVZ0ZlazkzcHJsRzgyYUVC?=
 =?utf-8?B?dk1KemllSG1Nam1laUlvSktsbWNLNXdRV3lyblVuWlFmOFhHTTdzYm5obEFF?=
 =?utf-8?B?QUxDWXhqcEY3a1pqc1pXaE1aR2tmZmpDTW9lb2xtckt2aEZsTmV0N2h6cUU3?=
 =?utf-8?B?U050UW1PdGpkeUhFYXdqZS9DTFh4bWlyVG0yamVlWTlzL3BwRU9aZy9tT3Ry?=
 =?utf-8?B?N3Z4aGZTUzc5RllCOUMzVzg3RTNUUWtwTG1ibWMxUC9ORjJLbWs2OHluM2Yx?=
 =?utf-8?B?Q3g4TDN3TnNTbFFWeEp0NlVmOUsrdkkyRmN0TEUwZmN5dFcxYXhYR1kzNVNi?=
 =?utf-8?B?NFdNOW90TWpHdzhjZWhqN2ptUm5zV3NHMExteTg1eDhYZ0xhTnJWK3FhQjJW?=
 =?utf-8?B?dGRqcGZlR3V2d1FXczdlRXpRem1YUGc1VmYvRmd1QVFRRFlteDJUWUpQUHdC?=
 =?utf-8?B?UmhzTDdHWSt1YkdJb1BJUU5GQmExT0tSTGZIUXdPSElZTW9CNHZvbTNwNnE0?=
 =?utf-8?B?dTUzRGNaL0MrZHA0b2RRVjZtTjN2YkNzRTlUR2ZmWHBWd1lFdml3eUh4MGZl?=
 =?utf-8?B?QW5OU1FOckZkTllMeElFRmhqbXI3Y0xnRm9TcFRiM0pFMjV0bCthTGU0eXdO?=
 =?utf-8?B?S0pKV0dmOWg3eHRLVS9xdnltQ0FrbjFzOGRUVDIxL3pjM25SVzQvUFczVFNm?=
 =?utf-8?B?SzRoTFU5dGgvajNmeXVWZFlTREMyTEM3LzZYMjlJR2N0VlhSNG0zblJnd0c4?=
 =?utf-8?B?dzd2SDhwNDhUWW5PS2hZQ2tSem9LNnp0NEo4OE8rdVdGUStaS2RGZ0cwcDNX?=
 =?utf-8?B?YmpVSTJLajRDaXArQ0NlSGwxNXR5RFpBTUtPd2JYaU82b3ZnbXVUbWhFU0l5?=
 =?utf-8?B?V1M1ZVRsc05qUjlJbFgwc1dEcUEzRm9tcGEyaWQrZVB2c2ZHVjBJUUN6cDc1?=
 =?utf-8?B?Zk90V1FDenZwaHFwYXJGOVBBenpvd3ZtWHp0a0xxWFNmNDBab0xJWGZud3ov?=
 =?utf-8?B?RjMvSHQ3aTlxNzAwSEZvRndBNkRWUmxIeE92QzJUVXJzdjV1ZmdXN0loWE90?=
 =?utf-8?B?RHJpWVVXcXdUeFhUQmQ4bWFtL1k2RTRSQWk3YjVJdDhmYnd5aFJMN1dGMmpG?=
 =?utf-8?B?bUhRbDlBdTBKb0lacmM3akRuQnU4enNtQXpxNDdOVWxta1UvMVlYUWFjb1F0?=
 =?utf-8?B?K3ZHcDNldndLS2srSTlCd3VETVRydW02TFlRaFFTRys2b2dDelZDS3lVbmJl?=
 =?utf-8?B?SzRtNVo3MWR1QTB0SHhoa0o0VG1PMTRIWkpzZmpiWnJGaExGdDgvQmtEZWRD?=
 =?utf-8?B?VVRVSEJWWXhUSFJpRUxKaDNXSDFSWW9KL3BaWWhYMW5qOFh5WFFxaUVZMFM5?=
 =?utf-8?B?VzIrSjJhbXFCOHcxKzNyaGtBdFN4T1lVaE4raW5qUVN1UDlJdmQ4YXhjOStG?=
 =?utf-8?B?RlNNRFdkUzA5T3dQUWM5Uk1HckdEdDUxTXJuL1pWenVvUElBbm5MeUhmN29l?=
 =?utf-8?B?dm5XRFpZQUdBeS81RnJEWm1oRDBiYk5xbHh5REtyenRwZ0lqeEplenJqeHd3?=
 =?utf-8?B?Znc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401a877b-0e05-4f83-fea6-08dab820022f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2022 13:34:44.1354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RZqSfR/2Vyq2vlJIRx3Xpb6oc3ulAX/qTWwcBg7qBogt1OMH1J2Sf9+1uE7ZSzbie2ojwnNfP9mrhoWg0nsfir3wtyAhYM5VD1Qw5khlZA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6598
X-Proofpoint-ORIG-GUID: cUT6WVyVf8dfyMgdsax4ZupwrANzpVLX
X-Proofpoint-GUID: cUT6WVyVf8dfyMgdsax4ZupwrANzpVLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210270073
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
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEbWl0cnkgQmFyeXNoa292IDxk
bWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyNCwg
MjAyMiA4OjUyIFBNDQo+IFRvOiBWaW5vZCBQb2xpbWVyYSAoUVVJQykgPHF1aWNfdnBvbGltZXJA
cXVpY2luYy5jb20+OyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgt
YXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyByb2JkY2xhcmtAZ21haWwuY29tOw0KPiBkaWFuZGVyc0BjaHJvbWl1bS5vcmc7
IHN3Ym95ZEBjaHJvbWl1bS5vcmc7IEthbHlhbiBUaG90YSAoUVVJQykNCj4gPHF1aWNfa2FseWFu
dEBxdWljaW5jLmNvbT47IEt1b2dlZSBIc2llaCAoUVVJQykNCj4gPHF1aWNfa2hzaWVoQHF1aWNp
bmMuY29tPjsgVmlzaG51dmFyZGhhbiBQcm9kZHV0dXJpIChRVUlDKQ0KPiA8cXVpY192cHJvZGR1
dEBxdWljaW5jLmNvbT47IEJqb3JuIEFuZGVyc3NvbiAoUVVJQykNCj4gPHF1aWNfYmpvcmFuZGVA
cXVpY2luYy5jb20+OyBBcmF2aW5kIFZlbmthdGVzd2FyYW4gKFFVSUMpDQo+IDxxdWljX2FyYXZp
bmRoQHF1aWNpbmMuY29tPjsgQWJoaW5hdiBLdW1hciAoUVVJQykNCj4gPHF1aWNfYWJoaW5hdmtA
cXVpY2luYy5jb20+OyBTYW5rZWVydGggQmlsbGFrYW50aSAoUVVJQykNCj4gPHF1aWNfc2JpbGxh
a2FAcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMDEvMTVdIGRybS9tc20v
ZGlzcC9kcHU6IGNsZWFyIGRwdV9hc3NpZ25fY3J0YyBhbmQNCj4gZ2V0IGNydGMgZnJvbSBjb25u
ZWN0b3Igc3RhdGUgaW5zdGVhZCBvZiBkcHVfZW5jDQo+IA0KPiBXQVJOSU5HOiBUaGlzIGVtYWls
IG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeQ0KPiBv
ZiBhbnkgbGlua3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4g
DQo+IE9uIDEyLzEwLzIwMjIgMTU6MDIsIFZpbm9kIFBvbGltZXJhIHdyb3RlOg0KPiA+IFVwZGF0
ZSBjcnRjIHJldHJpZXZhbCBmcm9tIGRwdV9lbmMgdG8gZHB1X2VuYyBjb25uZWN0b3Igc3RhdGUs
DQo+ID4gc2luY2UgbmV3IGxpbmtzIGdldCBzZXQgYXMgcGFydCBvZiB0aGUgZHB1IGVuYyB2aXJ0
IG1vZGUgc2V0Lg0KPiA+IFRoZSBkcHVfZW5jLT5jcnRjIGNhY2hlIGlzIG5vIG1vcmUgbmVlZGVk
LCBoZW5jZSBjbGVhbmluZyBpdCBhcw0KPiA+IHBhcnQgb2YgdGhpcyBjaGFuZ2UuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBWaW5vZCBQb2xpbWVyYSA8cXVpY192cG9saW1lckBxdWljaW5jLmNv
bT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRj
LmMgICAgfCAgNCAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9l
bmNvZGVyLmMgfCA0MiArKysrKysrKystLS0tLS0tLS0NCj4gLS0tLS0tLS0tLS0NCj4gPiAgIGRy
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmggfCAgOCAtLS0tLS0NCj4g
PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Ny
dGMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMNCj4gPiBp
bmRleCAxM2NlMzIxLi44ZWM5YTEzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9jcnRjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfY3J0Yy5jDQo+ID4gQEAgLTEwMjksNyArMTAyOSw2IEBAIHN0YXRpYyB2b2lk
IGRwdV9jcnRjX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiA+ICAgICAgICAgICAg
ICAgICovDQo+ID4gICAgICAgICAgICAgICBpZiAoZHB1X2VuY29kZXJfZ2V0X2ludGZfbW9kZShl
bmNvZGVyKSA9PSBJTlRGX01PREVfVklERU8pDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJl
bGVhc2VfYmFuZHdpZHRoID0gdHJ1ZTsNCj4gPiAtICAgICAgICAgICAgIGRwdV9lbmNvZGVyX2Fz
c2lnbl9jcnRjKGVuY29kZXIsIE5VTEwpOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+ICAgICAgIC8q
IHdhaXQgZm9yIGZyYW1lX2V2ZW50X2RvbmUgY29tcGxldGlvbiAqLw0KPiA+IEBAIC0xMDk5LDkg
KzEwOTgsNiBAQCBzdGF0aWMgdm9pZCBkcHVfY3J0Y19lbmFibGUoc3RydWN0IGRybV9jcnRjICpj
cnRjLA0KPiA+ICAgICAgIHRyYWNlX2RwdV9jcnRjX2VuYWJsZShEUk1JRChjcnRjKSwgdHJ1ZSwg
ZHB1X2NydGMpOw0KPiA+ICAgICAgIGRwdV9jcnRjLT5lbmFibGVkID0gdHJ1ZTsNCj4gPg0KPiA+
IC0gICAgIGRybV9mb3JfZWFjaF9lbmNvZGVyX21hc2soZW5jb2RlciwgY3J0Yy0+ZGV2LCBjcnRj
LT5zdGF0ZS0NCj4gPmVuY29kZXJfbWFzaykNCj4gPiAtICAgICAgICAgICAgIGRwdV9lbmNvZGVy
X2Fzc2lnbl9jcnRjKGVuY29kZXIsIGNydGMpOw0KPiA+IC0NCj4gPiAgICAgICAvKiBFbmFibGUv
cmVzdG9yZSB2YmxhbmsgaXJxIGhhbmRsaW5nICovDQo+ID4gICAgICAgZHJtX2NydGNfdmJsYW5r
X29uKGNydGMpOw0KPiA+ICAgfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2VuY29kZXIuYw0KPiA+IGluZGV4IDljNjgxN2IuLmQwNWIzNTMgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMNCj4gPiBAQCAt
MTMyLDExICsxMzIsNiBAQCBlbnVtIGRwdV9lbmNfcmNfc3RhdGVzIHsNCj4gPiAgICAqIEBpbnRm
c19zd2FwcGVkOiAgV2hldGhlciBvciBub3QgdGhlIHBoeXNfZW5jIGludGVyZmFjZXMgaGF2ZSBi
ZWVuDQo+IHN3YXBwZWQNCj4gPiAgICAqICAgICAgICAgICAgICAgICAgZm9yIHBhcnRpYWwgdXBk
YXRlIHJpZ2h0LW9ubHkgY2FzZXMsIHN1Y2ggYXMgcGluZ3BvbmcNCj4gPiAgICAqICAgICAgICAg
ICAgICAgICAgc3BsaXQgd2hlcmUgdmlydHVhbCBwaW5ncG9uZyBkb2VzIG5vdCBnZW5lcmF0ZSBJ
UlFzDQo+ID4gLSAqIEBjcnRjOiAgICAgICAgICAgIFBvaW50ZXIgdG8gdGhlIGN1cnJlbnRseSBh
c3NpZ25lZCBjcnRjLiBOb3JtYWxseSB5b3UNCj4gPiAtICogICAgICAgICAgICAgICAgICAgd291
bGQgdXNlIGNydGMtPnN0YXRlLT5lbmNvZGVyX21hc2sgdG8gZGV0ZXJtaW5lIHRoZQ0KPiA+IC0g
KiAgICAgICAgICAgICAgICAgICBsaW5rIGJldHdlZW4gZW5jb2Rlci9jcnRjLiBIb3dldmVyIGlu
IHRoaXMgY2FzZSB3ZSBuZWVkDQo+ID4gLSAqICAgICAgICAgICAgICAgICAgIHRvIHRyYWNrIGNy
dGMgaW4gdGhlIGRpc2FibGUoKSBob29rIHdoaWNoIGlzIGNhbGxlZA0KPiA+IC0gKiAgICAgICAg
ICAgICAgICAgICBfYWZ0ZXJfIGVuY29kZXJfbWFzayBpcyBjbGVhcmVkLg0KPiA+ICAgICogQGNv
bm5lY3RvcjogICAgICAgICAgICAgIElmIGEgbW9kZSBpcyBzZXQsIGNhY2hlZCBwb2ludGVyIHRv
IHRoZSBhY3RpdmUNCj4gY29ubmVjdG9yDQo+ID4gICAgKiBAY3J0Y19raWNrb2ZmX2NiOiAgICAg
ICAgICAgICAgICBDYWxsYmFjayBpbnRvIENSVEMgdGhhdCB3aWxsIGZsdXNoICYgc3RhcnQNCj4g
PiAgICAqICAgICAgICAgICAgICAgICAgICAgICAgICBhbGwgQ1RMIHBhdGhzDQo+ID4gQEAgLTE4
MSw3ICsxNzYsNiBAQCBzdHJ1Y3QgZHB1X2VuY29kZXJfdmlydCB7DQo+ID4NCj4gPiAgICAgICBi
b29sIGludGZzX3N3YXBwZWQ7DQo+ID4NCj4gPiAtICAgICBzdHJ1Y3QgZHJtX2NydGMgKmNydGM7
DQo+ID4gICAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsNCj4gPg0KPiA+ICAg
ICAgIHN0cnVjdCBkZW50cnkgKmRlYnVnZnNfcm9vdDsNCj4gPiBAQCAtMTI4OCw3ICsxMjgyLDcg
QEAgc3RhdGljIHZvaWQgZHB1X2VuY29kZXJfdmJsYW5rX2NhbGxiYWNrKHN0cnVjdA0KPiBkcm1f
ZW5jb2RlciAqZHJtX2VuYywNCj4gPiAgICAgICAgICAgICAgIHN0cnVjdCBkcHVfZW5jb2Rlcl9w
aHlzICpwaHlfZW5jKQ0KPiA+ICAgew0KPiA+ICAgICAgIHN0cnVjdCBkcHVfZW5jb2Rlcl92aXJ0
ICpkcHVfZW5jID0gTlVMTDsNCj4gPiAtICAgICB1bnNpZ25lZCBsb25nIGxvY2tfZmxhZ3M7DQo+
ID4gKyAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjOw0KPiA+DQo+ID4gICAgICAgaWYgKCFkcm1f
ZW5jIHx8ICFwaHlfZW5jKQ0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+IEBAIC0xMjk2
LDEyICsxMjkwLDEzIEBAIHN0YXRpYyB2b2lkIGRwdV9lbmNvZGVyX3ZibGFua19jYWxsYmFjayhz
dHJ1Y3QNCj4gZHJtX2VuY29kZXIgKmRybV9lbmMsDQo+ID4gICAgICAgRFBVX0FUUkFDRV9CRUdJ
TigiZW5jb2Rlcl92YmxhbmtfY2FsbGJhY2siKTsNCj4gPiAgICAgICBkcHVfZW5jID0gdG9fZHB1
X2VuY29kZXJfdmlydChkcm1fZW5jKTsNCj4gPg0KPiA+IC0gICAgIGF0b21pY19pbmMoJnBoeV9l
bmMtPnZzeW5jX2NudCk7DQo+ID4gKyAgICAgaWYgKCFkcHVfZW5jLT5jb25uZWN0b3IgfHwgIWRw
dV9lbmMtPmNvbm5lY3Rvci0+c3RhdGUgfHwNCj4gPiArICAgICAgICAgIWRwdV9lbmMtPmNvbm5l
Y3Rvci0+c3RhdGUtPmNydGMpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm47DQo+ID4NCj4gPiAt
ICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmZHB1X2VuYy0+ZW5jX3NwaW5sb2NrLCBsb2NrX2ZsYWdz
KTsNCj4gPiAtICAgICBpZiAoZHB1X2VuYy0+Y3J0YykNCj4gPiAtICAgICAgICAgICAgIGRwdV9j
cnRjX3ZibGFua19jYWxsYmFjayhkcHVfZW5jLT5jcnRjKTsNCj4gPiAtICAgICBzcGluX3VubG9j
a19pcnFyZXN0b3JlKCZkcHVfZW5jLT5lbmNfc3BpbmxvY2ssIGxvY2tfZmxhZ3MpOw0KPiA+ICsg
ICAgIGF0b21pY19pbmMoJnBoeV9lbmMtPnZzeW5jX2NudCk7DQo+ID4gKyAgICAgY3J0YyA9IGRw
dV9lbmMtPmNvbm5lY3Rvci0+c3RhdGUtPmNydGM7DQo+ID4gKyAgICAgZHB1X2NydGNfdmJsYW5r
X2NhbGxiYWNrKGNydGMpOw0KPiANCj4gU28sIHdoYXQgaWYgdGhlIHVzZXIgY29tbWl0cyB0aGUg
bW9kZSBzZXR0aW5nIGNoYW5nZSBvbiBhbm90aGVyIENQVSwNCj4gd2hpbGUgd2UgYXJlIGhhbmRs
aW5nIHRoZSB2YmxhbmsgY2FsbGJhY2sgaGVyZT8gQ2FuIHRoaXMgaGFwcGVuPw0KPiANCklmIHVz
ZXIgaXNzdWVzIGEgY29tbWl0IG9uIGFub3RoZXIgQ1BVLCBpdCB3aWxsIHdhaXQgaW4gdGhlIGRy
bV9hdG9taWNfaGVscGVyX3N3YXBfc3RhdGUNCmFzIGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9o
d19kb25lIHdoaWNoIGRvZXMgdGhlIGNvbXBsZXRlX2FsbCgmY29tbWl0LT5od19kb25lKSANCmZv
ciB0aGUgY3VycmVudCBjb21taXQgZGlkbid0IGZpbmlzaCB5ZXQuDQo+ID4NCj4gPiAgICAgICBE
UFVfQVRSQUNFX0VORCgiZW5jb2Rlcl92YmxhbmtfY2FsbGJhY2siKTsNCj4gPiAgIH0NCj4gLS0N
Cj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg0KVGhhbmtzLA0KVmlub2QgUC4NCg==
