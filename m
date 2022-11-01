Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804F5614861
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 12:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6916710E37F;
	Tue,  1 Nov 2022 11:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE8710E381;
 Tue,  1 Nov 2022 11:16:43 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A1BGfPe020934; Tue, 1 Nov 2022 11:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=z4YC2Td9FUGul16YePM5kJyrxIskL56gWcP/EzkvyyI=;
 b=I3oIhOytNX3EOmh0s6ygnVzYbtPSDy7XU6SLITYdTXcPOu9eoAtU+3X93hDFvIoN1xnb
 Ey8+M9xJYLaajy7lRaDiP9GUmxM2RDb9KPNjP7HJwOwowFl3bPRSDaqL71ujPqn06sjz
 5UC+ZZFlOLedEcLcTjPe5ln+Zo6or+tGiQfl6sWLY3tF0BazTp4spDYQqeAT9by/juk1
 OqkAy/sh/mC8OVEtxT/raQuiN36JGTo4Idmjxk2DdT6hPH4iWc3SkblJl0k4qid4fbmT
 tkDVtRJUg7NofHXhZ+/TWC1nnxCJBMJZ9mkpIaollcPcJPeToYe8eTzJIoy289XfLmkf nw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kjw8qh1h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 11:16:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtSPyW/1eF1KBOI5m3Mcj1cBMdh3Pxxy3sPtSweCwSp2lqRZcEjcAfCDlA0qvxVZstI5hJdjOgSMJBugitAY4hqAArYc3LmWE2Tb3PybIf2hM8lfDnl9YSmpN05KakL2m5MznKCpxo12riFEkV8vtbyhTbUeDN2TS7OoHpG1P+Fk30zqCqN2AYnLyjEJa2jB5di+LZQLtj/zSx250mk5QwHD9YplRgyHZxExSih2phfudnF4ShLP+MFXZVRAKw3qla1mLCgMw8CQx1wFyYgfOHas5vDQunG8kTf644+sBBzBlSHCs3ysdVi0dkyYpV82KnO9ova57uxL84ms9vcsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4YC2Td9FUGul16YePM5kJyrxIskL56gWcP/EzkvyyI=;
 b=BS3HXi9/dRy5471ry8tLEf8TJ6etTNWoFG2seRG/z5Z7aTK0wvfRg7nRqSJfYGvoLlcHZpMk3fhlyh9dVkem3Sboq2kJkiEfu9TV6KTlM96xysZMHgsMuHRZZnZjy8zcjAoH5Yqw7cbaSqWg6/KGeSXHhYe4oNddkB9fqvvE6DjxuPNiIzn44FPV29nMg8mvHIU4V8nA2yMSJjJHMlMY3rKqelRW8GD5COXs7oT40ya6ZsLWzugxRElG86AYHYFDDvspw7/ay/jdIfRp/uu9vst4RKt36XAPS8qVuKAoeVxgJyUEeSF05ltcljTzDYE2RwR+k92iGgAzpw/686g8Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by MN2PR02MB6957.namprd02.prod.outlook.com (2603:10b6:208:203::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 11:16:37 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::365b:898:5af:62d6]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::365b:898:5af:62d6%8]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 11:16:37 +0000
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
Thread-Index: AQHY3jKacr4ce2QZ1kquBeIXIfkSRa4dvGqAgASYVLCAAEVMgIAHb38g
Date: Tue, 1 Nov 2022 11:16:37 +0000
Message-ID: <BN0PR02MB817324C2174A1FE3DBC6F853E4369@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1665576159-3749-1-git-send-email-quic_vpolimer@quicinc.com>
 <1665576159-3749-2-git-send-email-quic_vpolimer@quicinc.com>
 <52e7a83b-bd83-ba63-55f9-a75cf549546d@linaro.org>
 <BN0PR02MB8173F084DD0DDAD2E312CA6DE4339@BN0PR02MB8173.namprd02.prod.outlook.com>
 <780a3aeb-2e7f-b3ca-be58-ab24bd06d805@linaro.org>
In-Reply-To: <780a3aeb-2e7f-b3ca-be58-ab24bd06d805@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|MN2PR02MB6957:EE_
x-ms-office365-filtering-correlation-id: 72c09b5b-4534-4f40-9b97-08dabbfa8afc
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: anIgh2LDd3snNrdHH+n0Wx5lH9vmCZi52qSy9BC30gx4rvmkufFVu2ZJoL5OH9OtHMB/xioLLOtSccp3BAuv9jGUMX4iwjNlgcAO4NgMojKvc+Rc3KO717ByL9ysuc8OoYu9gIYkMINJygLrqU895lB7LSwblfV2sAknKzQ9U/NfFRKYYrXbmZZsC1ad515UPCESdA02BUehKsK72Hg87dOsD7P5DOePIWcM0F+H7wrOWl8flT/bbws9P+Bjlf35F3dhc3VK5vJ9btsbqV+NZKbABsi2AmLLEu9DGuQGFm1Pg8TrHJFGijpMgH5UfEGaqQW5PpkS+xEW/LLY24cGo8FKe6uavG6/c/7S6vXx6u11jJwb2opTOPGKAU8+Q3WhvUdRU7MqOmL/HliYXVJYQsPC17EgweK+v89Jk6WTyEucMgQ7Y4XhHDl//JoqS74l/Anl5y6El9pOtx4PTVghXFppl8AF/yHDIj7asbcyMYwEJSP7wDF3s1zMJE6S8h9/AzXR2KUY3YT0TS9r66oo5fHThZN1OezfEBemtqVB8SJLJ6BkKZLPMQBqZJN707bulDW9MhCmDGX/CzBWoRS1ObCCinWIb0iN6HkDEsdTudzlno3aH7Mr4rRZTcn6EYagZOORndNpWZ8xd0R4khiMFDyQTNcT/wA6dSLELE+Jcv9nKhLIbumv+Lww88mQ0Nx3529ASKkg6u++qlhUwIWVSAOmPj3LcARRDRN85j8zLayqpqB+y+ds1o7z+I5AfUZp20um4vLHP5VgseYUK/Rs30gG8g9sxIMg3BbKl9ZdSaQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199015)(33656002)(86362001)(38070700005)(122000001)(38100700002)(53546011)(83380400001)(26005)(6506007)(2906002)(55016003)(478600001)(7696005)(186003)(107886003)(9686003)(316002)(66476007)(71200400001)(966005)(54906003)(66446008)(5660300002)(64756008)(8676002)(41300700001)(66946007)(4326008)(76116006)(52536014)(110136005)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3NSenFqU0ZkUVVyZUkxTG91cHV3Ny9NTUVJTkpocmFPZWdaTjdOamhMd3ds?=
 =?utf-8?B?aDdEcWxsY2N5cGlzS2grVnRJVElIRVVtSkRDVHFMOFBKZzFCSVdXeUxhemsr?=
 =?utf-8?B?b0JGT1ZwMzcrZnljaU5kLzVpeElzbDJmOGhmMmVMVE9tenBQcTBEOWZsTFR0?=
 =?utf-8?B?aS9zNzdWNEZSNEZtSXlPYnVOT0lLWGJpWUhtZFBPNjI2UFNhaVFuczBxY0Iv?=
 =?utf-8?B?TVQwRHoyMVBtWWd0SStYTDFTYzd5QXdXdXFXSGVzQ3NGRTlMbi9uZHQ1cExR?=
 =?utf-8?B?MWJ2dm1PQlZXOWs4S3g2T0VHNlJRV0FDZFd0cVVoaHBNS1dpa3dZUWRHd1JD?=
 =?utf-8?B?bkN1OGxvR2NFTUkrRk43aHJoRGo4dGZLT0xBaWZMUklNU1g0NFFRVG5yVTFO?=
 =?utf-8?B?K0d6TzNHRTEvM0lUZzVZNUdLa2RZdzFObk1NN2VWeEZ0RXI1S0xseVAvalY4?=
 =?utf-8?B?OFpPTmRlUldYTmJ4M1VBSUZuRUhHVnBXcm84SXNmaFFXNlc1OHRraXRrRldP?=
 =?utf-8?B?b3BuTXprTURGc3FvRUp3Nkt0SWt4ZXNDTjBITnFLanlJRzZSSGpub21rYkF4?=
 =?utf-8?B?ZDY4TlI4dUJNSERsdC9jV0hlemN5bzNMcEZXa3ZCaFF6YXl0MnZLZWdJNXBC?=
 =?utf-8?B?a0RtSGpNOE4ydHhVM011bENIU1owZEI5VDlHUk10VkZ4Mkh3V25zUENDTjRa?=
 =?utf-8?B?M3hFS3NaMkIrRXlKY1NDSXl2N1ZmZHViTmxyTWdkVDR4ZU5MS1JBekdNWEZ4?=
 =?utf-8?B?YUhCZFBMNHFxVzFpSENmWjE2cGxDOGZkSC9PMnh3blFJUEVoaUVxUWt6ZmNU?=
 =?utf-8?B?cm12QU03QnJmanlaYkUvUXBHdnIxUUJqaU1yam9uT3U4Y0IyL3RHWDd5bUxi?=
 =?utf-8?B?SUZZelRQd0sxRzhrcVM5cDJ3N2pJVmJ0VUxCc3N3bGZIa0hpSjlDSWZpSHdh?=
 =?utf-8?B?dzhKQ1VCbnRlbXBjY3hQMEFuenlGV1BjMWZwSVNFMW5GWWprdzVsZ1MzRnBT?=
 =?utf-8?B?dlBzOUpUMk5FZ25HVGNpSWczUnZXbXF1TXZ6WHl1SmVmOEdiTXdLcmVUOHlP?=
 =?utf-8?B?WUlCMnM2UGo4Yml3WmhmdGtqSzM3VWlJeTBKU0k4d2Ixakx1K0NPa2JQRFZT?=
 =?utf-8?B?QUJtQVh6VzhpNnZqWWR3Q2tmQ3VNUE5CMHNNdnQ4K3kzaVgya3lCKzhDUFFu?=
 =?utf-8?B?OFhGK3ZHaTE2bGJwRjVGcjZjYllBOXBldUVxamFXZFJBR2lhKzQrREljaVRp?=
 =?utf-8?B?SjcrbU56WUtLbkVpN1JlVFdoWTYwTnFOL29GWWM1WDNPRjVHZ0VIeXp2aHJK?=
 =?utf-8?B?V2hYQ04zZTZabFZKdERnTzZFbGxzYndHNk1tSi9DQ0MyUWU1NmlCRlVxRDBi?=
 =?utf-8?B?bCs0OU5UZS9FY0xjdXNmT0hOTUdnVHg1b2ZZMHEyL3RaekVyb0J0eWFmaWlO?=
 =?utf-8?B?NFJabHJJbHB0Y3lxOFRMTTIxQ0VmMFJXNGtvckRqNUg5L0JGRzRhNXh1Yjhm?=
 =?utf-8?B?alpIOXhkYlJpcFlndTlaU01IeElmdE1rYUJ3S0QxZkpEc2dFeHZjQ3dscG9a?=
 =?utf-8?B?dHlBTkJBajhwM01DR2pETENQUjAwVE1DQ0hiaEVITGhTdkpKNjVMakJjejdL?=
 =?utf-8?B?WVFrQVI4blc2enU2dVlKNEtiMUdneXBYMUNEK3BtQ0Ezb0M1bHpQMGM4UDFL?=
 =?utf-8?B?SXNqZ3BBOVJiTFRWTjJxVEdwNEtKSS8rSXNMK1BLU0xOWjVUTUxWYlZ4SFN2?=
 =?utf-8?B?cklYTmhDc0M0ZXRwSDhLRDBxck5EaUNHSXRUbGFGNGlUODZveVQrMXJlL2Zu?=
 =?utf-8?B?MDdWZWlJY0R4My9NOVdZRWhkUEpHamJldjZFZ0s5ZnJxOFFrdlFPVEJsamlm?=
 =?utf-8?B?TGxES0s2Qy9Hc3NXN2dtNThjb3JTT0pFVVJuVVBmamVzS2JxWGFyTGFENmQ1?=
 =?utf-8?B?bjAzeUpmN3Z3TFhTK2FReFRCK3N0eWFzR2ZiUjhtZFB0L2x2eUJGbXJXT3pE?=
 =?utf-8?B?TFBUbGlabW5Yc3hmdFpwVC92cldvNUxXLzlOeHlyazBRNlZmWDduY0l1SElO?=
 =?utf-8?B?VW5JR3o3d1N1RmFUa1RJY3BsQ3h0YmM3QjdiWE5ETWNCVXhqRjg3WDhvNmVO?=
 =?utf-8?B?UXBZQm9DTXFpTmZ6OTVGQWhmRXM0N3ZZTFNUcU5qa2VYWkxkRXA0VWR0MlAv?=
 =?utf-8?B?RVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c09b5b-4534-4f40-9b97-08dabbfa8afc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 11:16:37.3750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HGQDmsScoahXc+Sw3d3VaqCE3YEObpv1iME7rLzFrV6JGiE0Q7O7lCZdyzMnW5y6Xdtzec+8gqh0UPUDD8+K5RXi2Dx+6JAJ0VNlGo/pQOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6957
X-Proofpoint-GUID: _OpqORwvYsKYXO8x74KzxZLtkhu37OGe
X-Proofpoint-ORIG-GUID: _OpqORwvYsKYXO8x74KzxZLtkhu37OGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_06,2022-11-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010086
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2Jl
ciAyNywgMjAyMiAxMToxMSBQTQ0KPiBUbzogVmlub2QgUG9saW1lcmEgPHZwb2xpbWVyQHF0aS5x
dWFsY29tbS5jb20+OyBWaW5vZCBQb2xpbWVyYSAoUVVJQykNCj4gPHF1aWNfdnBvbGltZXJAcXVp
Y2luYy5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0tDQo+
IG1zbUB2Z2VyLmtlcm5lbC5vcmc7IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyByb2JkY2xhcmtAZ21haWwuY29tOw0KPiBkaWFuZGVyc0BjaHJvbWl1bS5vcmc7IHN3
Ym95ZEBjaHJvbWl1bS5vcmc7IEthbHlhbiBUaG90YSAoUVVJQykNCj4gPHF1aWNfa2FseWFudEBx
dWljaW5jLmNvbT47IEt1b2dlZSBIc2llaCAoUVVJQykNCj4gPHF1aWNfa2hzaWVoQHF1aWNpbmMu
Y29tPjsgVmlzaG51dmFyZGhhbiBQcm9kZHV0dXJpIChRVUlDKQ0KPiA8cXVpY192cHJvZGR1dEBx
dWljaW5jLmNvbT47IEJqb3JuIEFuZGVyc3NvbiAoUVVJQykNCj4gPHF1aWNfYmpvcmFuZGVAcXVp
Y2luYy5jb20+OyBBcmF2aW5kIFZlbmthdGVzd2FyYW4gKFFVSUMpDQo+IDxxdWljX2FyYXZpbmRo
QHF1aWNpbmMuY29tPjsgQWJoaW5hdiBLdW1hciAoUVVJQykNCj4gPHF1aWNfYWJoaW5hdmtAcXVp
Y2luYy5jb20+OyBTYW5rZWVydGggQmlsbGFrYW50aSAoUVVJQykNCj4gPHF1aWNfc2JpbGxha2FA
cXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMDEvMTVdIGRybS9tc20vZGlz
cC9kcHU6IGNsZWFyIGRwdV9hc3NpZ25fY3J0YyBhbmQNCj4gZ2V0IGNydGMgZnJvbSBjb25uZWN0
b3Igc3RhdGUgaW5zdGVhZCBvZiBkcHVfZW5jDQo+IA0KPiBXQVJOSU5HOiBUaGlzIGVtYWlsIG9y
aWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeQ0KPiBvZiBh
bnkgbGlua3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4gDQo+
IE9uIDI3LzEwLzIwMjIgMTY6MzQsIFZpbm9kIFBvbGltZXJhIHdyb3RlOg0KPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnku
YmFyeXNoa292QGxpbmFyby5vcmc+DQo+ID4+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyNCwgMjAy
MiA4OjUyIFBNDQo+ID4+IFRvOiBWaW5vZCBQb2xpbWVyYSAoUVVJQykgPHF1aWNfdnBvbGltZXJA
cXVpY2luYy5jb20+OyBkcmktDQo+ID4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGlu
dXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+ID4+IENjOiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyByb2JkY2xhcmtAZ21haWwuY29tOw0KPiA+PiBkaWFuZGVyc0Bj
aHJvbWl1bS5vcmc7IHN3Ym95ZEBjaHJvbWl1bS5vcmc7IEthbHlhbiBUaG90YSAoUVVJQykNCj4g
Pj4gPHF1aWNfa2FseWFudEBxdWljaW5jLmNvbT47IEt1b2dlZSBIc2llaCAoUVVJQykNCj4gPj4g
PHF1aWNfa2hzaWVoQHF1aWNpbmMuY29tPjsgVmlzaG51dmFyZGhhbiBQcm9kZHV0dXJpIChRVUlD
KQ0KPiA+PiA8cXVpY192cHJvZGR1dEBxdWljaW5jLmNvbT47IEJqb3JuIEFuZGVyc3NvbiAoUVVJ
QykNCj4gPj4gPHF1aWNfYmpvcmFuZGVAcXVpY2luYy5jb20+OyBBcmF2aW5kIFZlbmthdGVzd2Fy
YW4gKFFVSUMpDQo+ID4+IDxxdWljX2FyYXZpbmRoQHF1aWNpbmMuY29tPjsgQWJoaW5hdiBLdW1h
ciAoUVVJQykNCj4gPj4gPHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb20+OyBTYW5rZWVydGggQmls
bGFrYW50aSAoUVVJQykNCj4gPj4gPHF1aWNfc2JpbGxha2FAcXVpY2luYy5jb20+DQo+ID4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjggMDEvMTVdIGRybS9tc20vZGlzcC9kcHU6IGNsZWFyIGRwdV9h
c3NpZ25fY3J0Yw0KPiBhbmQNCj4gPj4gZ2V0IGNydGMgZnJvbSBjb25uZWN0b3Igc3RhdGUgaW5z
dGVhZCBvZiBkcHVfZW5jDQo+ID4+DQo+ID4+IFdBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRl
ZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZQ0KPiB3YXJ5DQo+ID4+IG9mIGFu
eSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KPiA+Pg0K
PiA+PiBPbiAxMi8xMC8yMDIyIDE1OjAyLCBWaW5vZCBQb2xpbWVyYSB3cm90ZToNCj4gPj4+IFVw
ZGF0ZSBjcnRjIHJldHJpZXZhbCBmcm9tIGRwdV9lbmMgdG8gZHB1X2VuYyBjb25uZWN0b3Igc3Rh
dGUsDQo+ID4+PiBzaW5jZSBuZXcgbGlua3MgZ2V0IHNldCBhcyBwYXJ0IG9mIHRoZSBkcHUgZW5j
IHZpcnQgbW9kZSBzZXQuDQo+ID4+PiBUaGUgZHB1X2VuYy0+Y3J0YyBjYWNoZSBpcyBubyBtb3Jl
IG5lZWRlZCwgaGVuY2UgY2xlYW5pbmcgaXQgYXMNCj4gPj4+IHBhcnQgb2YgdGhpcyBjaGFuZ2Uu
DQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogVmlub2QgUG9saW1lcmEgPHF1aWNfdnBvbGlt
ZXJAcXVpY2luYy5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9jcnRjLmMgICAgfCAgNCAtLS0NCj4gPj4+ICAgIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMgfCA0MiArKysrKysrKystLS0tLQ0KPiAtLS0t
DQo+ID4+IC0tLS0tLS0tLS0tDQo+ID4+PiAgICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfZW5jb2Rlci5oIHwgIDggLS0tLS0tDQo+ID4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jDQo+ID4+IGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYw0KPiA+Pj4gaW5kZXggMTNjZTMyMS4u
OGVjOWExMyAxMDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9jcnRjLmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9jcnRjLmMNCj4gPj4+IEBAIC0xMDI5LDcgKzEwMjksNiBAQCBzdGF0aWMgdm9pZCBkcHVfY3J0
Y19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0Yw0KPiAqY3J0YywNCj4gPj4+ICAgICAgICAgICAgICAg
ICAqLw0KPiA+Pj4gICAgICAgICAgICAgICAgaWYgKGRwdV9lbmNvZGVyX2dldF9pbnRmX21vZGUo
ZW5jb2RlcikgPT0NCj4gSU5URl9NT0RFX1ZJREVPKQ0KPiA+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICByZWxlYXNlX2JhbmR3aWR0aCA9IHRydWU7DQo+ID4+PiAtICAgICAgICAgICAgIGRwdV9l
bmNvZGVyX2Fzc2lnbl9jcnRjKGVuY29kZXIsIE5VTEwpOw0KPiA+Pj4gICAgICAgIH0NCj4gPj4+
DQo+ID4+PiAgICAgICAgLyogd2FpdCBmb3IgZnJhbWVfZXZlbnRfZG9uZSBjb21wbGV0aW9uICov
DQo+ID4+PiBAQCAtMTA5OSw5ICsxMDk4LDYgQEAgc3RhdGljIHZvaWQgZHB1X2NydGNfZW5hYmxl
KHN0cnVjdCBkcm1fY3J0Yw0KPiAqY3J0YywNCj4gPj4+ICAgICAgICB0cmFjZV9kcHVfY3J0Y19l
bmFibGUoRFJNSUQoY3J0YyksIHRydWUsIGRwdV9jcnRjKTsNCj4gPj4+ICAgICAgICBkcHVfY3J0
Yy0+ZW5hYmxlZCA9IHRydWU7DQo+ID4+Pg0KPiA+Pj4gLSAgICAgZHJtX2Zvcl9lYWNoX2VuY29k
ZXJfbWFzayhlbmNvZGVyLCBjcnRjLT5kZXYsIGNydGMtPnN0YXRlLQ0KPiA+Pj4gZW5jb2Rlcl9t
YXNrKQ0KPiA+Pj4gLSAgICAgICAgICAgICBkcHVfZW5jb2Rlcl9hc3NpZ25fY3J0YyhlbmNvZGVy
LCBjcnRjKTsNCj4gPj4+IC0NCj4gPj4+ICAgICAgICAvKiBFbmFibGUvcmVzdG9yZSB2Ymxhbmsg
aXJxIGhhbmRsaW5nICovDQo+ID4+PiAgICAgICAgZHJtX2NydGNfdmJsYW5rX29uKGNydGMpOw0K
PiA+Pj4gICAgfQ0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9lbmNvZGVyLmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfZW5jb2Rlci5jDQo+ID4+PiBpbmRleCA5YzY4MTdiLi5kMDViMzUzIDEwMDY0NA0KPiA+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0KPiA+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0KPiA+Pj4g
QEAgLTEzMiwxMSArMTMyLDYgQEAgZW51bSBkcHVfZW5jX3JjX3N0YXRlcyB7DQo+ID4+PiAgICAg
KiBAaW50ZnNfc3dhcHBlZDogIFdoZXRoZXIgb3Igbm90IHRoZSBwaHlzX2VuYyBpbnRlcmZhY2Vz
IGhhdmUNCj4gYmVlbg0KPiA+PiBzd2FwcGVkDQo+ID4+PiAgICAgKiAgICAgICAgICAgICAgICAg
IGZvciBwYXJ0aWFsIHVwZGF0ZSByaWdodC1vbmx5IGNhc2VzLCBzdWNoIGFzIHBpbmdwb25nDQo+
ID4+PiAgICAgKiAgICAgICAgICAgICAgICAgIHNwbGl0IHdoZXJlIHZpcnR1YWwgcGluZ3Bvbmcg
ZG9lcyBub3QgZ2VuZXJhdGUgSVJRcw0KPiA+Pj4gLSAqIEBjcnRjOiAgICAgICAgICAgIFBvaW50
ZXIgdG8gdGhlIGN1cnJlbnRseSBhc3NpZ25lZCBjcnRjLiBOb3JtYWxseSB5b3UNCj4gPj4+IC0g
KiAgICAgICAgICAgICAgICAgICB3b3VsZCB1c2UgY3J0Yy0+c3RhdGUtPmVuY29kZXJfbWFzayB0
byBkZXRlcm1pbmUgdGhlDQo+ID4+PiAtICogICAgICAgICAgICAgICAgICAgbGluayBiZXR3ZWVu
IGVuY29kZXIvY3J0Yy4gSG93ZXZlciBpbiB0aGlzIGNhc2Ugd2UgbmVlZA0KPiA+Pj4gLSAqICAg
ICAgICAgICAgICAgICAgIHRvIHRyYWNrIGNydGMgaW4gdGhlIGRpc2FibGUoKSBob29rIHdoaWNo
IGlzIGNhbGxlZA0KPiA+Pj4gLSAqICAgICAgICAgICAgICAgICAgIF9hZnRlcl8gZW5jb2Rlcl9t
YXNrIGlzIGNsZWFyZWQuDQo+ID4+PiAgICAgKiBAY29ubmVjdG9yOiAgICAgICAgICAgICAgSWYg
YSBtb2RlIGlzIHNldCwgY2FjaGVkIHBvaW50ZXIgdG8gdGhlIGFjdGl2ZQ0KPiA+PiBjb25uZWN0
b3INCj4gPj4+ICAgICAqIEBjcnRjX2tpY2tvZmZfY2I6ICAgICAgICAgICAgICAgIENhbGxiYWNr
IGludG8gQ1JUQyB0aGF0IHdpbGwgZmx1c2ggJiBzdGFydA0KPiA+Pj4gICAgICogICAgICAgICAg
ICAgICAgICAgICAgICAgIGFsbCBDVEwgcGF0aHMNCj4gPj4+IEBAIC0xODEsNyArMTc2LDYgQEAg
c3RydWN0IGRwdV9lbmNvZGVyX3ZpcnQgew0KPiA+Pj4NCj4gPj4+ICAgICAgICBib29sIGludGZz
X3N3YXBwZWQ7DQo+ID4+Pg0KPiA+Pj4gLSAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjOw0KPiA+
Pj4gICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7DQo+ID4+Pg0KPiA+Pj4g
ICAgICAgIHN0cnVjdCBkZW50cnkgKmRlYnVnZnNfcm9vdDsNCj4gPj4+IEBAIC0xMjg4LDcgKzEy
ODIsNyBAQCBzdGF0aWMgdm9pZA0KPiBkcHVfZW5jb2Rlcl92YmxhbmtfY2FsbGJhY2soc3RydWN0
DQo+ID4+IGRybV9lbmNvZGVyICpkcm1fZW5jLA0KPiA+Pj4gICAgICAgICAgICAgICAgc3RydWN0
IGRwdV9lbmNvZGVyX3BoeXMgKnBoeV9lbmMpDQo+ID4+PiAgICB7DQo+ID4+PiAgICAgICAgc3Ry
dWN0IGRwdV9lbmNvZGVyX3ZpcnQgKmRwdV9lbmMgPSBOVUxMOw0KPiA+Pj4gLSAgICAgdW5zaWdu
ZWQgbG9uZyBsb2NrX2ZsYWdzOw0KPiA+Pj4gKyAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjOw0K
PiA+Pj4NCj4gPj4+ICAgICAgICBpZiAoIWRybV9lbmMgfHwgIXBoeV9lbmMpDQo+ID4+PiAgICAg
ICAgICAgICAgICByZXR1cm47DQo+ID4+PiBAQCAtMTI5NiwxMiArMTI5MCwxMyBAQCBzdGF0aWMg
dm9pZA0KPiBkcHVfZW5jb2Rlcl92YmxhbmtfY2FsbGJhY2soc3RydWN0DQo+ID4+IGRybV9lbmNv
ZGVyICpkcm1fZW5jLA0KPiA+Pj4gICAgICAgIERQVV9BVFJBQ0VfQkVHSU4oImVuY29kZXJfdmJs
YW5rX2NhbGxiYWNrIik7DQo+ID4+PiAgICAgICAgZHB1X2VuYyA9IHRvX2RwdV9lbmNvZGVyX3Zp
cnQoZHJtX2VuYyk7DQo+ID4+Pg0KPiA+Pj4gLSAgICAgYXRvbWljX2luYygmcGh5X2VuYy0+dnN5
bmNfY250KTsNCj4gPj4+ICsgICAgIGlmICghZHB1X2VuYy0+Y29ubmVjdG9yIHx8ICFkcHVfZW5j
LT5jb25uZWN0b3ItPnN0YXRlIHx8DQo+ID4+PiArICAgICAgICAgIWRwdV9lbmMtPmNvbm5lY3Rv
ci0+c3RhdGUtPmNydGMpDQo+ID4+PiArICAgICAgICAgICAgIHJldHVybjsNCj4gPj4+DQo+ID4+
PiAtICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmZHB1X2VuYy0+ZW5jX3NwaW5sb2NrLCBsb2NrX2Zs
YWdzKTsNCj4gPj4+IC0gICAgIGlmIChkcHVfZW5jLT5jcnRjKQ0KPiA+Pj4gLSAgICAgICAgICAg
ICBkcHVfY3J0Y192YmxhbmtfY2FsbGJhY2soZHB1X2VuYy0+Y3J0Yyk7DQo+ID4+PiAtICAgICBz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZkcHVfZW5jLT5lbmNfc3BpbmxvY2ssIGxvY2tfZmxhZ3Mp
Ow0KPiA+Pj4gKyAgICAgYXRvbWljX2luYygmcGh5X2VuYy0+dnN5bmNfY250KTsNCj4gPj4+ICsg
ICAgIGNydGMgPSBkcHVfZW5jLT5jb25uZWN0b3ItPnN0YXRlLT5jcnRjOw0KPiA+Pj4gKyAgICAg
ZHB1X2NydGNfdmJsYW5rX2NhbGxiYWNrKGNydGMpOw0KPiA+Pg0KPiA+PiBTbywgd2hhdCBpZiB0
aGUgdXNlciBjb21taXRzIHRoZSBtb2RlIHNldHRpbmcgY2hhbmdlIG9uIGFub3RoZXIgQ1BVLA0K
PiA+PiB3aGlsZSB3ZSBhcmUgaGFuZGxpbmcgdGhlIHZibGFuayBjYWxsYmFjayBoZXJlPyBDYW4g
dGhpcyBoYXBwZW4/DQo+ID4+DQo+ID4gSWYgdXNlciBpc3N1ZXMgYSBjb21taXQgb24gYW5vdGhl
ciBDUFUsIGl0IHdpbGwgd2FpdCBpbiB0aGUNCj4gZHJtX2F0b21pY19oZWxwZXJfc3dhcF9zdGF0
ZQ0KPiA+IGFzIGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9od19kb25lIHdoaWNoIGRvZXMgdGhl
DQo+IGNvbXBsZXRlX2FsbCgmY29tbWl0LT5od19kb25lKQ0KPiA+IGZvciB0aGUgY3VycmVudCBj
b21taXQgZGlkbid0IGZpbmlzaCB5ZXQuDQo+IA0KPiBZZXMuIEJ1dCB0aGVyZSBpcyBubyBpbnRl
cmxvY2sgYmV0d2VlbiBjb21taXQtPmh3X2RvbmUgYW5kIHZibGFuayBJUlENCj4gcHJvY2Vzc2lu
ZywgaXNuJ3QgaXQ/IFRoaXMgY2FsbCBoYXBwZW5zIHdoZW4gRFBVIHByb2Nlc3NlcyB0aGUgdmJs
YW5rDQo+IElSUSwgc28gbm9ib2R5IHN0b3BzIG90aGVyIGNvcmUgZnJvbSBzd2FwcGluZyB0aGUg
ZW5jb2RlIHN0YXRlIG9uDQo+IGFub3RoZXIgY29yZS4NCg0KaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFybS1tc20vcGF0Y2gvMTY2NzMwMDM2MS0xNDU3Mi0xLWdp
dC1zZW5kLWVtYWlsLXF1aWNfa2FseWFudEBxdWljaW5jLmNvbS8NCihkcm0vbXNtL2Rpc3AvZHB1
MTogcmVnaXN0ZXIgY3J0YyBjb2xvciBtYW5hZ2VtZW50IHRvIGZpcnN0IGNydGMgaW4gdGhlIGxp
c3QpDQoNClRoZSBhYm92ZSBwYXRjaCBwaW5zIDEgY3J0YyB0byAxIGVuY29kZXIsIHNvIGl0IHdp
bGwgYmUgc2FmZSB0byBhc3N1bWUgdGhhdCBjcnRjIHdvbnQgY2hhbmdlLg0KDQo+ID4+Pg0KPiA+
Pj4gICAgICAgIERQVV9BVFJBQ0VfRU5EKCJlbmNvZGVyX3ZibGFua19jYWxsYmFjayIpOw0KPiA+
Pj4gICAgfQ0KPiA+PiAtLQ0KPiA+PiBXaXRoIGJlc3Qgd2lzaGVzDQo+ID4+IERtaXRyeQ0KPiA+
DQo+ID4gVGhhbmtzLA0KPiA+IFZpbm9kIFAuDQo+IA0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVz
DQo+IERtaXRyeQ0KDQpUaGFua3MsDQpWaW5vZCBQLg0K
