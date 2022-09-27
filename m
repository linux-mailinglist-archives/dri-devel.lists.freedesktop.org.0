Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ABE5EBED9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 11:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3D810E2AA;
	Tue, 27 Sep 2022 09:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2487C10E2AA;
 Tue, 27 Sep 2022 09:41:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R8uEVG000372;
 Tue, 27 Sep 2022 09:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=0ljJtOILSujp8l/AFOpv0wggUJqg7XpPa8yp/C0J5+8=;
 b=Kvyt3LyuYtBBA5cs4wg6V5VpXGCnx57miKzXy/MrH12XlEawLagxyB/AqF0vtjTvZGOe
 vOirqWOwFbkN4U3ZxxIZt6AbdHthtrQZx416E/YfxfOo2Nz2gdHyALMsinYo9Qi5zdMZ
 VVUYDZBdMoP6l+sVDZ3AkpDxdJmjR4ujS0n2zmjgjWuY8w6IJlKWySitVKt/+vnPeskO
 vnodL6f3VFYvzMyBXyh+q/TfO2qNfZo/sbBbKHVTOpC0CBEAfhOQ+wmY8wgnh8zipus7
 48qjeuhadk1rg7wXE3mUvWO2HadiDG/wDoZRvKPz5KLhoRQfKApeyAl2RTr6wGlaNzu/ Jw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3juq77h23q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 09:41:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdyBl2KTg3YaPRBQvqMUUVQqFvLGpvlm6AmvlIemVu63IubQDAsAmeeAORbTf3jVtdz2a/VN+q4GEEkKI2NQhCOTIX6hjUFLyprPHCtwdPwl5P6IwHA+Qda7zDULaHHmiTVK30tjSAHinkp+IzEM/cs6leVk/IJ16+hqdMFF7vRZ/0BJGZ4E6npKneBVqrSpg3EW6/YVpinA2IOWOzrqTe0mi1qpPd1mlmHadLvWGLH2Pd6yecDrd2dC1t+NvEbbMfdt2q9FzzfwRpNFIxSpVmimD3QtY+Zp5VlxAcDb65VsqdHdEkilpU22WTpUSTg5rDA+41ukcmcr+SlsWIr8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ljJtOILSujp8l/AFOpv0wggUJqg7XpPa8yp/C0J5+8=;
 b=KMGcM0u5oG1lM/adQIz80VyngPIjntWsVSIL83diRVp4DI0qKdx92kasrudStJQUV8HBLRJwMF8VfBXBqxKtCt0P5LnXCwkanL8xa6EbMGUQW456VlXT/TnQgVczUJED9uxjBUqWkC9c1Xw61taWeiSYItoX1JlK4p3Y6umRZ60DmROU1I6GKiIVouSdMDeZOTOGF6FOMFQhVNuHJj1GM/c3FYjXVsk1+hvCIkOYV8cTGk4PQ6O4pwRaBT2aO5SSh5GUcpnlNQG6lrJf3qCROZxOX46MGSfaYAAFh5T5ACfYzC6ZbwKlRSap5Jz/l4xeHZb8pFO70CWfd8qP9L9Oeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by MN2PR02MB6590.namprd02.prod.outlook.com (2603:10b6:208:1d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 09:41:44 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::223f:870b:a23:9abe]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::223f:870b:a23:9abe%6]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 09:41:44 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [v2] drm/msm: add null checks for drm device to avoid crash
 during probe defer
Thread-Topic: [v2] drm/msm: add null checks for drm device to avoid crash
 during probe defer
Thread-Index: AQHYdy5JIZknP2ToOUOfgpJqMFEL3q1QdyUAgHDpw4CAMhiscIAAN+SAgAAKckA=
Date: Tue, 27 Sep 2022 09:41:43 +0000
Message-ID: <BN0PR02MB81734C33B33066D5C4092CDAE4559@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1654249343-24959-1-git-send-email-quic_vpolimer@quicinc.com>
 <29ae886c-b2b2-2387-87cb-e4a885080418@linaro.org>
 <f70f9f1b-c835-7baf-974d-87f2bf6e4e53@linaro.org>
 <BN0PR02MB8173E3E88164E52AEF5AB1A1E4559@BN0PR02MB8173.namprd02.prod.outlook.com>
 <2a3b6824-7a76-308c-c7a7-cc7c6001dfcb@redhat.com>
In-Reply-To: <2a3b6824-7a76-308c-c7a7-cc7c6001dfcb@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|MN2PR02MB6590:EE_
x-ms-office365-filtering-correlation-id: 9c564d26-06de-451b-ab6a-08daa06c7cf7
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: syJ0+ZAF3fgjpERPtA+qo9T3/wU/bi9X83m/RK1A3ctV8wGnu7+3bX/Zl9GWf5ZuHZhMf+Jeou8oPZu+7+kap1yTdEljJU374YifjqzdmMo+1pN1SqaMOIfoN1F3jl/Pez9jRJ3UoPl841dLfMAJmfz826dFSLJH2n3Zd+qiF0Ufc8fk3qfu7NaCeKPBE4q1Wa8fbFzNsMvpsZx7/8NuCmU9YjmLgEuo2n6climu8+zd6rYMGRFJ0eXoVcPxkK4Dc5ythjWYnVtKFeIfhOd0T5zrK/HRxCHE/DuBhH0GB6mv8LOMb3njfLdnWjiTTj5V5xLZDJq+Ris7cM8JOELrAW+bLhDiS2Vi4xcwBqy9tDXH9Rotx+jtAWyntLONoYj79ktTr8gkc7o1cacyc8pHQcH6BUZwIzaFcnvTO+MrH7vKcvI5M6IPnJPt8eM4Ie9N5+UGpSHkCf4bP7j1TJCH6PAJaPIQrFsWcj5K8TuZU5QODYA6tmn2RhWDXD6/PDMk9T6MWb9gX/UXWba7fVUdGmvHP2GsPfvyjn4FgZSpwAsF7LjFL83Rze+6ezzDwgY7mxTEhMW8eBXIz+UnW2W3cWxbW6pTMl8mXQPE1lqv1Dabjmb5fMao9g2nm/1BizZgplS4fTzIMyygN/f1/IMZIVnF5J3xlqyjmIkbarEHHSfaC/yFCwXqJH5mVmjU9fskvxnUztN+77sTzSqk+oPafbSncs0P7oiDWJq4i73vKhJIRGYCjLxVWeO37kQRTQhqAiReYO7PrcGoSqg60agFRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199015)(66476007)(478600001)(8676002)(4326008)(38070700005)(64756008)(66446008)(66556008)(76116006)(71200400001)(316002)(66946007)(54906003)(33656002)(55016003)(110136005)(38100700002)(122000001)(107886003)(9686003)(186003)(7696005)(86362001)(6506007)(26005)(83380400001)(53546011)(8936002)(52536014)(5660300002)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGt2NHhVekdoWFRlQjhWWkZKQVJLVTB4MXdmMU5WRWZVWWxVRG1iQUJKQm5r?=
 =?utf-8?B?VElIanZROE5YWGZMbWV2NjFRZ0hCbDB0OG04b3kvaUVvblRjTjdEQjY2cTM2?=
 =?utf-8?B?OWVoc09NYTRlYmpFYnVMSEdjenlZNi96VjN4Y0dtd2pxOFRvY0xmUDE0N3pn?=
 =?utf-8?B?clhjQXp0VVkrRnpKL0xKMHdaVktmODgvSEZrMmRrd1V5VE1mbFBFUkI0YmFO?=
 =?utf-8?B?K0llTjhxbFY4UVJiY0J5b1p0MGFPVWJlNUcwTmJHamhCU1l6bWtleWtNTitj?=
 =?utf-8?B?WkxQTjhGQTlwZXFGMGhGZ1NtTUJaTHhpVEltMGM3YW9wbTNZd0Zxbm05OC9m?=
 =?utf-8?B?QTlwQ0kzb2JRdFE1K2FMZHJHWWJIYjlKK2lNRmJTOHZIaUJNYklNdTJsNy9U?=
 =?utf-8?B?ZjRuM1IxVGNhc0gxb1FXY3pQSDdiVExsU0dFNTQ4TjFQOE51empJUU9FV3NW?=
 =?utf-8?B?alQ4bG5sL2d2UGZYZGN6dUtmeFlJa0crWVlrejNGVnJ6QmhKR2ROZDhLODVS?=
 =?utf-8?B?dTM5NFdHTGx6MTlna25XNFJ1SXoxZWJ3MGY4aHhkQmlNNi9KMTQ0Nm95aUlw?=
 =?utf-8?B?UVNJTmZUNFBzOStXNE9xQ1JmS1pwTi9VWFF5VUxEZWpUdnFOQzZvNmNzbitM?=
 =?utf-8?B?bis1Q0t3Yis1NFJicjExb0M4SG9oVXlSV1NRM0VVbXBjajBvMTBhOG5HUURV?=
 =?utf-8?B?dTNreEhaWUpNVW9qbDhMaFF2ZEtFUmFvRC9TUlBKR2NrVWk1UFJCaTB1UFVu?=
 =?utf-8?B?NnViaGJNaXhpWTU4Mmo3ZUVGNnVZZitSZ1JBY0RLS1EyODE4d0EzbExrM2Q0?=
 =?utf-8?B?ZkwxYjlIalVKTDU2TFR2d1V5MWFUZzVlWHljMHFjTHR3Z2dEM3JNWmxBZHAz?=
 =?utf-8?B?bi9hZDUzUVFRTmM0b01sbzRSN1BsMmszTENsVWl5SDJxUloxalVmYWVBdnBs?=
 =?utf-8?B?N3Y2L240VVJBSGZCcXFzNTRGZ3lWTGN6cHBvSkhOaVRhMStRNjI5UDI4RGNI?=
 =?utf-8?B?T1lwYmJja2poOE1Mbzd1bGkwbXFHWWxUdXRVeS9VZDZVamtPZ0kvREZyKzM0?=
 =?utf-8?B?U0djQnNqZ2xlSHdXWUkvOFl1dVcybmVyNDVEbG5PdlhrUzVjTFRabWlIQ3h5?=
 =?utf-8?B?dnBYUys4ZlhZN3lLcWRncTVTbzFhM2RYd0JjbU5XWHVuOGpXdE9ySGxDT0NY?=
 =?utf-8?B?WURXWlpNaTBuMk1vSnc4bE1ib0E3d2wvd21hRXlNdXNqSDcxUFVtb2JyT0Zj?=
 =?utf-8?B?Y2dzSFFTM2Jua3RtMGlVMzhzb3dlendKcXc3aHgyaE0xMzFDeFdQVENzTmoy?=
 =?utf-8?B?a005WU5VaDdOMmNReGw4dkRCc3cxZ3NSY0pDaHB6VVowT0pKOVc4TTdUSHVV?=
 =?utf-8?B?ZS9ROTZUZnpHdThUZjk5SFlraXBPbGJqTmdOakQrUXAyYWFlRzh2aGFpa3dr?=
 =?utf-8?B?UldxSlBlbU8xY0tiYmFpV2NNOEplZjM1MXlrSThSTzhwUWtQYnRScXYrSlZ0?=
 =?utf-8?B?aHFhcmljcUVIblUyd0NHQXVZRUh1MWFFbkF3eW95b1hkcFhUVDBqaVFoWHBh?=
 =?utf-8?B?djh0UG14YnNXMWF5enhvUmNsT1pXSVM1dTFGNVlldVoyMStidG1YamRmVHg3?=
 =?utf-8?B?QVgwZURmcW5mMjFmaWJZTm1WK0JkVjM1L29Qa2pXV2ZEVW0xRWhuVnhJV1lr?=
 =?utf-8?B?bGxaQWxJcVdka0dkWHVMc3Y0VkZuem1CY1ozeU1CRlRMRk9TZmtMUG1lZWxD?=
 =?utf-8?B?RnZKWVQ3YTFYaG1TcEU1ZkdQWkJ0WmZteXhCQ0ZMS1RqK2RKbGtoLzQ2cGFt?=
 =?utf-8?B?S3dQSVRkaTgrejBIYmVXWVo2RTcyQy9pdkdGMTVhQ2ozVGw4bEQ5SkNKTWJl?=
 =?utf-8?B?V0loaUo3aUVpTjBncVNiWGNIU2theE56ZjBxM1pybzl1L2ZWbFJGZlV0eG9j?=
 =?utf-8?B?Y2dMcDd3WkY3aWY3OTB2TkZLVkw2MGdiU2p1aWpPNjlaRGVoeDc4N1VmaXpN?=
 =?utf-8?B?SXNNSmUxSHM1akRsNXRtQ2JNOGxmemtCTDFQaUlTamFKam9UT2JIa0dTclBi?=
 =?utf-8?B?WWMrMDdPdUhVeDJqb1FnQVZ4aDhsVFhyVjBSZDBWWFZCWnRnWWZaRnlRbzVo?=
 =?utf-8?B?eDZQUy9rNHJCNFlsaUpFdGdOQldaNS9ObEZTekhZbDZ3eUJCVXpQZ3MvQzM1?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c564d26-06de-451b-ab6a-08daa06c7cf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 09:41:43.9708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R0ATFlnEZdyqYybeU/yjeC1o3dRkXwkaNr8D/KzVOO9Pb7lkUc1tPc+fD8L8yGpZbA+nK6Dq+JKZpaMseSysNz6YMclDBkXUR/79nBX3OOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6590
X-Proofpoint-ORIG-GUID: 8DXC3nWms4VUV23Ow4tVGFUMHi0cTrRb
X-Proofpoint-GUID: 8DXC3nWms4VUV23Ow4tVGFUMHi0cTrRb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=917 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209270057
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
 Abhinav Kumar <abhinavk@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmF2aWVyIE1hcnRpbmV6
IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJl
ciAyNywgMjAyMiAyOjMzIFBNDQo+IFRvOiBWaW5vZCBQb2xpbWVyYSA8dnBvbGltZXJAcXRpLnF1
YWxjb21tLmNvbT47DQo+IGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZzsgVmlub2QgUG9saW1l
cmEgKFFVSUMpDQo+IDxxdWljX3Zwb2xpbWVyQHF1aWNpbmMuY29tPjsgZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJtLQ0KPiBtc21Admdlci5rZXJuZWwub3JnOyBmcmVl
ZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
Zw0KPiBDYzogZGlhbmRlcnNAY2hyb21pdW0ub3JnOyB2cG9saW1lckBxdWljaW5jLmNvbTsgQWJo
aW5hdiBLdW1hcg0KPiA8YWJoaW5hdmtAcXVpY2luYy5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOw0KPiBzd2JveWRAY2hyb21pdW0ub3JnOyBrYWx5YW50QHF1aWNpbmMuY29tDQo+
IFN1YmplY3Q6IFJlOiBbdjJdIGRybS9tc206IGFkZCBudWxsIGNoZWNrcyBmb3IgZHJtIGRldmlj
ZSB0byBhdm9pZCBjcmFzaA0KPiBkdXJpbmcgcHJvYmUgZGVmZXINCj4gDQo+IFdBUk5JTkc6IFRo
aXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3
YXJ5DQo+IG9mIGFueSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFj
cm9zLg0KPiANCj4gSGVsbG8gVmlub2QgYW5kIERtaXRyeSwNCj4gDQo+IE9uIDkvMjcvMjIgMDk6
MzEsIFZpbm9kIFBvbGltZXJhIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+PiBGcm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5v
cmc+DQo+ID4+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDI2LCAyMDIyIDI6MTEgUE0NCj4gPj4gVG86
IFZpbm9kIFBvbGltZXJhIChRVUlDKSA8cXVpY192cG9saW1lckBxdWljaW5jLmNvbT47IGRyaS0N
Cj4gPj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0tbXNtQHZnZXIua2Vy
bmVsLm9yZzsNCj4gPj4gZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IHJvYmRjbGFya0BnbWFpbC5jb207DQo+ID4+IGRpYW5kZXJzQGNocm9taXVtLm9yZzsgdnBvbGlt
ZXJAcXVpY2luYy5jb207DQo+IHN3Ym95ZEBjaHJvbWl1bS5vcmc7DQo+ID4+IGthbHlhbnRAcXVp
Y2luYy5jb20NCj4gPj4gU3ViamVjdDogUmU6IFt2Ml0gZHJtL21zbTogYWRkIG51bGwgY2hlY2tz
IGZvciBkcm0gZGV2aWNlIHRvIGF2b2lkIGNyYXNoDQo+ID4+IGR1cmluZyBwcm9iZSBkZWZlcg0K
PiA+Pg0KPiANCj4gWy4uLl0NCj4gDQo+ID4+IFZpbm9kLCBkbyB3ZSBzdGlsbCB3YW50IHRvIHB1
cnN1ZSB0aGlzIGZpeD8gSWYgc28sIGNvdWxkIHlvdSBwbGVhc2UNCj4gPj4gdXBkYXRlIGl0IGFj
Y29yZGluZyB0byB0aGUgY29tbWVudC4NCj4gPj4NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBw
YXRjaCBpcyBuZWVkZWQgYW55bW9yZSwgc2luY2UgQUZBSUNUIHRoZSBpc3N1ZSBoYXMNCj4gYmVl
biBmaXhlZCBieSBjb21taXQgMGE1OGQyYWU1NzJhICgiZHJtL21zbTogTWFrZSAucmVtb3ZlIGFu
ZA0KPiAuc2h1dGRvd24NCj4gSFcgc2h1dGRvd24gY29uc2lzdGVudCIpIHdoaWNoIGlzIGFscmVh
ZHkgaW4gdGhlIGRybS9kcm0tbmV4dCBicmFuY2guDQpZZXMgLCBJc3N1ZSB3aWxsIGJlIGZpeGVk
IHdpdGggdGhlICBjb21taXQgMGE1OGQyYWU1NzJhICgiZHJtL21zbTogTWFrZSAucmVtb3ZlIGFu
ZCAuc2h1dGRvd24pIC4gSGVuY2UgIHdlIGNhbiAgZHJvcCB0aGlzIHBhdGNoLg0KPiANCj4gLS0N
Cj4gQmVzdCByZWdhcmRzLA0KPiANCj4gSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzDQo+IENvcmUg
UGxhdGZvcm1zDQo+IFJlZCBIYXQNCg0KLSBWaW5vZCBQLg0KDQo=
