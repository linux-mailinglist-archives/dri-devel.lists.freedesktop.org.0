Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 287F468DAA5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 15:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813D110E52C;
	Tue,  7 Feb 2023 14:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B479510E512;
 Tue,  7 Feb 2023 14:26:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317D0Nok011239; Tue, 7 Feb 2023 14:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=qd41sQtZPphw9XhfTQUSN0Iunc5tRoMtBod4sNl4bvo=;
 b=fiDYOFyf062HDdbPQKlCVWaKrtkIRBac53YbPZtcvgC4qaOFCuTOfJUIXQd+Smywra0+
 hPLF+EJJVaZG9WlNPp/5lZ7QuCiOuseeeig0lTvIGJvuiXzzrC8MGBTtn6lb9P6/vJBA
 EZDP+g4qpq4/2Ro3CgyoIc/xIGRhoxgiCwfAwSq7R/wk2BVN3MKqywIz3D09mDVo/8EA
 IrgtZ8gp0QtpvZNdTZ7oASJwUR0eem8o8GukkFjJ6qWO4eg26GX+GItp2V7WgQCDYJfl
 j6UixznPIzJjLmqDs7/POlO4/0I4PgKUBSd4t7dhrVmeKoeuehXMYRvVGieQb3dncg64 jw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkd8m1f9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 14:26:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hbbz6gNiVvMejg0gpVmWN53As2wqJ8qTaFHGf+3LXO89CnEx+0f7sKTCTQuaQ2pFJOaKekXeNQg/Y+93Kaa8hhks+u+Sdaqoe9XJYcsYUGJ7kMN3uNHciIz1U1LVc4H3+JzWN8z7yxBkto5pSzY897f0Z774+/VYTPog+Y2p79sMyjdvYqjjev3wkha9pSKJxWwuYS79qUDQQtnbcotn8vkyI1Mvh/ubE5Un8tqY1BXFtNdhjpQaWDxusPIE1Kvt/r8mbYycwe5j/I73juxQhLv38OaYsMhR1RtSzBkPN2+IHkQRPFQrxtCF5dKgvRMplmPl9TAAgxciQDaWxfUS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qd41sQtZPphw9XhfTQUSN0Iunc5tRoMtBod4sNl4bvo=;
 b=ZXJOHhUpMYl/tTxc+o0tJT7kVgY7mDHwXj9UlndeNjR2wNuLXtUf4NKrU5iQvXddoYTNjF6OJx8H33DRJ1IvjAFBl7kS4G130Nhw4Nu4t4V3gr9qMdIbmMniPieiN95MahA0lvTZnXe0Kx+SmUk5LgDybhdQhfJEoG6eGIQMpKqMN1F0tCzHj1MT5Y6oE+wo7Fbg77VKxrAGXOE+pBnMpejtczur5QG8n9eXPUVqnOIspFsakFairJQu2iNHrBcAZ11JRES9OSgJ/H+Hy9jSrMypfyJELVgEMO86yb09TBX9uoeG37mXohuCB4yob5ajSLU7ZuK8K3dioe5Vk7C4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by SN4PR0201MB8790.namprd02.prod.outlook.com (2603:10b6:806:201::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 14:26:03 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::d5de:8903:d3c3:8436]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::d5de:8903:d3c3:8436%8]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 14:26:03 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Vinod
 Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v12 13/14] drm/msm/disp/dpu: add PSR support for eDP
 interface in dpu driver
Thread-Topic: [PATCH v12 13/14] drm/msm/disp/dpu: add PSR support for eDP
 interface in dpu driver
Thread-Index: AQHZNL1c6xcAIDgDn0SrTgi8rWZJb664fgiAgAsXwaA=
Date: Tue, 7 Feb 2023 14:26:03 +0000
Message-ID: <BN0PR02MB81732F599DBA2D68A4B542DAE4DB9@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1675091494-13988-1-git-send-email-quic_vpolimer@quicinc.com>
 <1675091494-13988-14-git-send-email-quic_vpolimer@quicinc.com>
 <60af517c-e22d-780c-221c-4df41f1e7c5c@linaro.org>
In-Reply-To: <60af517c-e22d-780c-221c-4df41f1e7c5c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|SN4PR0201MB8790:EE_
x-ms-office365-filtering-correlation-id: b2cc7ea0-ffe6-40e1-8212-08db09173e49
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UClqxDF/j4SJ8Jt7BXDLZEVTpG8wn5ef5q3N/s48BwOQ3MGKVYSOXAqMDxY55ibAwU4KMizx7IOmB2Psx3SH+UMgT+TMU894ktAJbEs3jfsoUQt/CDq8Dc1FO6mmXB+k4ATsDYKJ70Ws2Q/9a65PC7SI8D2HVyEOS7ewuwuX15QFnqW+ycHA8UYHZ5sAgXzW+BJMwJeLYxy4kEmFajVCp7BpBiRTAvfFxvQ/7dgNi0yqG8xHzn7+swuV5CjF9A3hZ091rNom34rDEEobQlPuvjCGzCy5Q/NovUoDXmDcYCm8gdr4RKjKuuD0Ebhhuo6x6NmOGIDUOMeGA2psMe4X6Yl4xFAlpP4EvR3Yg75/TGyPbjuxxclEmX3TjfTb6OpqSy23iUpTw2Bx3TxwNk33Zu9t8Cq6Yv7P/QQOEb4D7X9S1OI8zlYbG3oFDQDoPiIV9V8fzxj0jvsewZesf9qAZZf7wHaaHoF8EMAbxlNBnNhegQbNXXvKerQHP28llhPOgCrg56w3cMKk7Kn8jhrkpcGltcbl0/XuuATE+wdo5+8WuA3+nEoiqZjsJDOXpVCIXsOaAJyrJn1dB6dwMB7q7M0KLr1D4wPv+7U/ZlrghutzfMbLvyDgfNsY6K1PjU/qnAc2Qp7zmCB2T1+LCOngqm21ZI3gDFNz62rb+FB80wxTibSu3smA4EKBFIf44nOYLUZItYjjGyUnU4M9de4hJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199018)(71200400001)(7696005)(54906003)(38100700002)(110136005)(122000001)(33656002)(38070700005)(9686003)(86362001)(186003)(26005)(478600001)(53546011)(6506007)(107886003)(83380400001)(55016003)(52536014)(4326008)(66476007)(66556008)(41300700001)(8676002)(66446008)(64756008)(2906002)(66946007)(8936002)(5660300002)(316002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlgzQlJBNjFOUDZOWHMrb20wREdWSGlJMHA4eHFMWGltQmloMWtMemlIVUlG?=
 =?utf-8?B?aWI3eUthUEVuT1J5WWFtNGVOS2U0WTZ2YjU2UmM2bWRqenFvRGdTdFZvZ3Zm?=
 =?utf-8?B?ckJJYjBQdUZhMXdDZU96aUNmZHZwRC9zQ2sydGZiUE5tclhBdjNYZTVSRWxR?=
 =?utf-8?B?RTRDWWxac1V6SVlRNTU2akVkOVpzUVIxTWNSa0pYN1F5SlVwcTlXNWJ2ZFda?=
 =?utf-8?B?MGhzMjJGZEZuZW1BOEJCVDVoMHBSUCsrYllJVE1IbmpLbUNDR1B1Q25wdVor?=
 =?utf-8?B?MVNDTFJ3Q0JiV1ZBRE41SWZ1WDVsLy9lUnJEYzhtb2k5NEE3NVFva3hSVm9j?=
 =?utf-8?B?em80dEZzWU43aXphenFJTmNrMlhoMjdvVnZJUHRyUEYzVTNKQ01aZUxkeHk0?=
 =?utf-8?B?MGdUZWc3NldmMXIvRytPTDB5SG9WK0N5K1B0WFdhcmU0SEIwaGdhNFFZZEtJ?=
 =?utf-8?B?eHpFdXVhWkRkQ1NjZlZ6R3pQM29IdkF5RjI4dFhqMEh5dUR3azg4bHBhUHZR?=
 =?utf-8?B?bml6emllSzk5UlF1Q3ZXT2tsTjVLeTVQcFcweFllbk5wZ2ZOSG1pd3dFSWxF?=
 =?utf-8?B?LzNaK2NzanZFR2NtQjQ2UUJ5OUlqek9WUnpHekxWN1o1Sm9kK2FqZjdZYUlm?=
 =?utf-8?B?MTVNZ2pnN2dsSkZOZmpjdzJoWWloT2tkS1JGcHpENTQ0Yzl2ZjRMK3l6RGF1?=
 =?utf-8?B?SEx1WjZMei82SlQ1bFZwanlFeTMwZUhUZFlvMXFHTnJqU3pYS2NQdWtsemhl?=
 =?utf-8?B?aFpibXBkZFhEaHhUUXJFNGZaOEJGRDJVUkN2M3FzaUtnVU5tdjM0MXJoT29u?=
 =?utf-8?B?eHNSNE5YVWtTSVVxUndOY3lsTmJVblRmQjNKcCtqWHh1aFVHNXRITGdJWlI0?=
 =?utf-8?B?ajFadnVUQW0ybkU3NGJqY0FxeTVISFU5ZCtFa0NYbTFicm1VcEdNTE85QUgz?=
 =?utf-8?B?ZkJBRy9BNkxKTXVCSXg4bkhEbXBncWhJS0wzMjFTWlhWMVE0UHc0T0NhbXVm?=
 =?utf-8?B?TEYwYS9IVlY0UFpDWjlWV3lqL3FkL0pVa0hYSUVPVklwbnJCb3VKWVZYTnpl?=
 =?utf-8?B?VTVacDNxOStDdy90OUgwa21yaENzZGhPc3lFZy9mRmdxMkpnU1EzanJPSFRk?=
 =?utf-8?B?TXA5ZC9CRTVLQUtFU0xYLzR0bVBGZjFoMG9rLzRxUVJnZzZRNWFVRjRzMEhF?=
 =?utf-8?B?RUY4dXFSQUNobjV2STNGMnFldzVEZmY3NDQ0clJ1VmNSR2JDUG1PL0hnbm5i?=
 =?utf-8?B?ZGlsanVHU2gvZ0QyWkRXUkdjNmZ1a2ZZOXZQKzVYTG1DT0ltUjdoVHpHN2F5?=
 =?utf-8?B?bWpNeFBMSFV0ZTltWjVvc2pFRTYxdTRDc1Rhai9SQTRNQmlFS1pmb0NVajlU?=
 =?utf-8?B?MlFuZHZ3RktxTTJrdkx0dm9jT3FUMllCWVEvVWJTaTVkWXVIN0RlQm5uSmI4?=
 =?utf-8?B?SHdVaktzYnlMV1hYMzdwaktvcGttQnNPUUY2TURWS2FJNUVheUZwcEpuaG5Y?=
 =?utf-8?B?djhBcU5BcjhZbUhpZnRqOWZUdlJkVjBTSG5mTXJ6QmFqZ2toNjV5VzJEY2Nv?=
 =?utf-8?B?dXU2SnExOEJHTk9IY3IvZlI3S0VKV0xsSXpxdWlzc2kvOUVjTXFTU0oxTUdv?=
 =?utf-8?B?ZWx3STQrVzNTUzVXWTFlV21XNGVmQXBQaDVmVTJRc3kvQnpPWG1NYjVMYzVD?=
 =?utf-8?B?Z1NsTmluRndMOHJiRTBsZFBsaEJwUGVZYlEweldaS1crRFJ2YjJOdTcxbU5O?=
 =?utf-8?B?OG5FZDdsU0VPUGFZQ3Jma0dpbHNJTG9vazVQNld6ZkZ2M1BYQ0xGQ1VwYmFi?=
 =?utf-8?B?SHdrSUpjSmdqYVJ5b2N3d042NDhWeHZxeTNxU0txZ2VITHlONVU4a3JKUGg0?=
 =?utf-8?B?K1ZZd0pReTI2eGhIWHc0T0RXNk03azU5SXF5dXJqYXVkSkFWSU1pVmZIUXM3?=
 =?utf-8?B?MmNZOEdTeE5zT2tQQWNDTWRvNnljNVBKVkN5aVo3K2tiamRZZFZGZko0ZE1z?=
 =?utf-8?B?bi9ibUdIUXY5Ymd1TkpIQmdBYnVSZ08wdlVHNDVLZzdmRnIxeU40R3o3U0Fl?=
 =?utf-8?B?TmxWZHVtMUE0SmNCaXNmRVNZTzB4MWFUTTBhYkZrcU9tU21mQTFBbmZNNkQ2?=
 =?utf-8?B?TU5kejU4ZTlGNWNDNU1PWTlXbWNsS0N1NTNFZDgxbmo0NnRvdFFFMkg3Mk4x?=
 =?utf-8?B?cVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 4j0dA9q1vjLdyqJ8HzitdaYVQqqN/jQikY7Y1r19uxDdhrOkaXxdmJrhXV7vmDvsEZxUwNSWyXkXyBjwiJE6lQlejfRB8VHxCei9xn0FhGwFgJe630W71bpvCYThUYRKm5j2x6TLpQ62ICoalb5gtkMM7wVfCOLA9p9DXy0L5K5MI9KL0ECySaVsaPxHMTanSV/ozVq32Lq+vdne/1jB2Azeth8LYaECxHYdoh2J2a0fQUd2nfvdkCsG4hLs9kHYCqelU02r47dZ6yXRBq7pchV51NphxHkr0xdQNrS2aK7ldt3FNkF6hiMQIoAhWwFstDtpAZ8U7VD+J/5Z6AJORj1dSiIsHkxjN0wkapXQpJrSb+Wr+NUtHjcJNqqU96qn0WCf4TfTeM1+0DXv3v5c7GbQjTqtSWNxUEFHA4ZPDtFkqw0hE3znhafFOrAEvHMw+df+GzLeC6A6tsplRlhG87hxngQOiqKi9TrqDmWNYAmHsfsJ7xQakV3ylbr+ws9lj8hb85CxURFMWhlWmFRcnFioFqyssf54zPxAa8/PgIGW5fZ1TDvHAwOLDNkHEd30THcpxlu7MFiZ4bkTEyOieHf3EKslrO++y3wxdTiFxe2UmI3wy2iVUEmnhq3AD4kJ5EvlEkyD+NGjVVNOr9mxFcn8Jhka6DcH8DqAK4aZeqRcZbY1l9Pc4j/uT4VU/zTYln+VCyqSRcyXxz6F7T8/pJeQHS9qRXTMx6UwKRxuS2fBFIgIoWr+BnKpuhnX6XbyiqzDzWaONbf5OcRNptMPFYiKmC7HINpxlsV33ieyaaRCYNTdHQfGQTE1KKpyMcyuT/b0Orz16+cmlMXy9UNI+fEy+/E7cXURjJ7MMwhmE3OWYeZaseQg2bqUij2mdAN+ruqY63zyk4dxOHDjoau/vLiqecIZu2cQkxVcyrZJYT8=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cc7ea0-ffe6-40e1-8212-08db09173e49
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 14:26:03.6334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LrA31mh/l8eK30oPLC+RXR4aoPJA/51reLhOwV2582ypjyz6kj6IOy9mmAIBSRQNxu0H4mwyKRhdllIAjYYpePLjG6TWX0lXJMZyEJaytKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8790
X-Proofpoint-GUID: C3s9in_fHdDcHC4WDQ1KpIVrZayBJxGv
X-Proofpoint-ORIG-GUID: C3s9in_fHdDcHC4WDQ1KpIVrZayBJxGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_06,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5
IDMxLCAyMDIzIDY6MjkgUE0NCj4gVG86IFZpbm9kIFBvbGltZXJhIChRVUlDKSA8cXVpY192cG9s
aW1lckBxdWljaW5jLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBs
aW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsNCj4gZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IHJvYmRjbGFya0BnbWFpbC5jb207DQo+IGRpYW5kZXJzQGNocm9taXVt
Lm9yZzsgc3dib3lkQGNocm9taXVtLm9yZzsgS2FseWFuIFRob3RhIChRVUlDKQ0KPiA8cXVpY19r
YWx5YW50QHF1aWNpbmMuY29tPjsgS3VvZ2VlIEhzaWVoIChRVUlDKQ0KPiA8cXVpY19raHNpZWhA
cXVpY2luYy5jb20+OyBWaXNobnV2YXJkaGFuIFByb2RkdXR1cmkgKFFVSUMpDQo+IDxxdWljX3Zw
cm9kZHV0QHF1aWNpbmMuY29tPjsgQmpvcm4gQW5kZXJzc29uIChRVUlDKQ0KPiA8cXVpY19iam9y
YW5kZUBxdWljaW5jLmNvbT47IEFiaGluYXYgS3VtYXIgKFFVSUMpDQo+IDxxdWljX2FiaGluYXZr
QHF1aWNpbmMuY29tPjsgU2Fua2VlcnRoIEJpbGxha2FudGkgKFFVSUMpDQo+IDxxdWljX3NiaWxs
YWthQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMiAxMy8xNF0gZHJtL21z
bS9kaXNwL2RwdTogYWRkIFBTUiBzdXBwb3J0IGZvciBlRFANCj4gaW50ZXJmYWNlIGluIGRwdSBk
cml2ZXINCj4gDQo+IA0KPiBPbiAzMC8wMS8yMDIzIDE3OjExLCBWaW5vZCBQb2xpbWVyYSB3cm90
ZToNCj4gPiBFbmFibGUgUFNSIG9uIGVEUCBpbnRlcmZhY2UgdXNpbmcgZHJtIHNlbGYtcmVmcmVz
aCBsaWJyYWJyeS4NCj4gPiBUaGlzIHBhdGNoIHVzZXMgYSB0cmlnZ2VyIGZyb20gc2VsZi1yZWZy
ZXNoIGxpYnJhcnkgdG8gZW50ZXIvZXhpdA0KPiA+IGludG8gUFNSLCB3aGVuIHRoZXJlIGFyZSBu
byB1cGRhdGVzIGZyb20gZnJhbWV3b3JrLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogS2FseWFu
IFRob3RhIDxxdWljX2thbHlhbnRAcXVpY2luYy5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogVmlu
b2QgUG9saW1lcmEgPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6
IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gPiAtLS0N
Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMgICAgfCAxMyAr
KysrKysrKysrKystDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5j
b2Rlci5jIHwgMTQgKysrKysrKysrKysrKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9rbXMuYyAgICAgfCAgMiArLQ0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jDQo+ID4gaW5kZXggZjI5YTMzOS4uNjBlNTk4NCAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYw0KPiA+IEBA
IC0yMSw2ICsyMSw3IEBADQo+ID4gICAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4N
Cj4gPiAgICNpbmNsdWRlIDxkcm0vZHJtX3JlY3QuaD4NCj4gPiAgICNpbmNsdWRlIDxkcm0vZHJt
X3ZibGFuay5oPg0KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9zZWxmX3JlZnJlc2hfaGVscGVyLmg+
DQo+ID4NCj4gPiAgICNpbmNsdWRlICJkcHVfa21zLmgiDQo+ID4gICAjaW5jbHVkZSAiZHB1X2h3
X2xtLmgiDQo+ID4gQEAgLTEwMjEsNiArMTAyMiw5IEBAIHN0YXRpYyB2b2lkIGRwdV9jcnRjX2Rp
c2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiA+DQo+ID4gICAgICAgRFJNX0RFQlVHX0tN
UygiY3J0YyVkXG4iLCBjcnRjLT5iYXNlLmlkKTsNCj4gPg0KPiA+ICsgICAgIGlmIChvbGRfY3J0
Y19zdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSkNCj4gPiArICAgICAgICAgICAgIHJldHVybjsN
Cj4gPiArDQo+IA0KPiBJIGhhdmUgYmVlbiBsb29raW5nIGF0IHRoZSBjcnRjX25lZWRzX2Rpc2Fi
bGUoKS4gSXQgZXhwbGljaXRseSBtZW50aW9ucw0KPiB0aGF0ICdXZSBhbHNvIG5lZWQgdG8gcnVu
IHRocm91Z2ggdGhlIGNydGNfZnVuY3MtPmRpc2FibGUoKSBmdW5jdGlvbg0KPiBbLi5dIGlmIGl0
J3MgdHJhbnNpdGlvbmluZyB0byBzZWxmIHJlZnJlc2ggbW9kZS4uLicuIERvbid0IHdlIG5lZWQg
dG8NCj4gcGVyZm9ybSBzb21lIGNsZWFudXAgaGVyZSAobGlrZSBkaXNhYmxpbmcgdGhlIHZibGFu
ayBpcnEgaGFuZGxpbmcsDQo+IGZyZWVpbmcgdGhlIGJhbmR3aWR0aCwgZXRjKT8NCg0KV2hlbiBz
ZWxmIHJlZnJlc2ggYWN0aXZlIGlzIGVuYWJsZWQsIHRoZW4gd2Ugd2lsbCBjbGVhbiB1cCBpcnEg
aGFuZGxpbmcgYW5kIGJhbmR3aWR0aCBldGMuDQpUaGUgYWJvdmUgY2FzZSBpcyB0byBoYW5kbGUg
ZGlzcGxheSBvZmYgY29tbWl0IHRyaWdnZXJlZCB3aGVuIHdlIGFyZSBpbiBwc3IgYXMgYWxsDQog
dGhlIHJlc291cmNlcyBhcmUgYWxyZWFkeSBjbGVhbmVkIHVwIC4gd2UganVzdCBuZWVkIHRvIGRv
IGFuIGVhcmx5IHJldHVybi4NCj4gDQo+ID4gICAgICAgLyogRGlzYWJsZS9zYXZlIHZibGFuayBp
cnEgaGFuZGxpbmcgKi8NCj4gPiAgICAgICBkcm1fY3J0Y192Ymxhbmtfb2ZmKGNydGMpOw0KPiA+
DQo+ID4gQEAgLTE1NzcsNyArMTU4MSw3IEBAIHN0cnVjdCBkcm1fY3J0YyAqZHB1X2NydGNfaW5p
dChzdHJ1Y3QgZHJtX2RldmljZQ0KPiAqZGV2LCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4g
PiAgIHsNCj4gPiAgICAgICBzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSBOVUxMOw0KPiA+ICAgICAg
IHN0cnVjdCBkcHVfY3J0YyAqZHB1X2NydGMgPSBOVUxMOw0KPiA+IC0gICAgIGludCBpOw0KPiA+
ICsgICAgIGludCBpLCByZXQ7DQo+ID4NCj4gPiAgICAgICBkcHVfY3J0YyA9IGt6YWxsb2Moc2l6
ZW9mKCpkcHVfY3J0YyksIEdGUF9LRVJORUwpOw0KPiA+ICAgICAgIGlmICghZHB1X2NydGMpDQo+
ID4gQEAgLTE2MTQsNiArMTYxOCwxMyBAQCBzdHJ1Y3QgZHJtX2NydGMgKmRwdV9jcnRjX2luaXQo
c3RydWN0DQo+IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+ID4g
ICAgICAgLyogaW5pdGlhbGl6ZSBldmVudCBoYW5kbGluZyAqLw0KPiA+ICAgICAgIHNwaW5fbG9j
a19pbml0KCZkcHVfY3J0Yy0+ZXZlbnRfbG9jayk7DQo+ID4NCj4gPiArICAgICByZXQgPSBkcm1f
c2VsZl9yZWZyZXNoX2hlbHBlcl9pbml0KGNydGMpOw0KPiA+ICsgICAgIGlmIChyZXQpIHsNCj4g
PiArICAgICAgICAgICAgIERQVV9FUlJPUigiRmFpbGVkIHRvIGluaXRpYWxpemUgJXMgd2l0aCBz
ZWxmLXJlZnJlc2ggaGVscGVycyAlZFxuIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgY3J0
Yy0+bmFtZSwgcmV0KTsNCj4gPiArICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKHJldCk7DQo+
ID4gKyAgICAgfQ0KPiA+ICsNCj4gPiAgICAgICBEUk1fREVCVUdfS01TKCIlczogc3VjY2Vzc2Z1
bGx5IGluaXRpYWxpemVkIGNydGNcbiIsIGRwdV9jcnRjLQ0KPiA+bmFtZSk7DQo+ID4gICAgICAg
cmV0dXJuIGNydGM7DQo+ID4gICB9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfZW5jb2Rlci5jDQo+ID4gaW5kZXggMDFiNzUwOS4uNDUwYWJiMSAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0KPiA+IEBA
IC0xMiw2ICsxMiw3IEBADQo+ID4gICAjaW5jbHVkZSA8bGludXgva3RocmVhZC5oPg0KPiA+ICAg
I2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+DQo+ID4NCj4gPiArI2luY2x1ZGUgPGRybS9kcm1f
YXRvbWljLmg+DQo+ID4gICAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+DQo+ID4gICAjaW5jbHVk
ZSA8ZHJtL2RybV9maWxlLmg+DQo+ID4gICAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIu
aD4NCj4gPiBAQCAtMTIxMiwxMSArMTIxMywyNCBAQCBzdGF0aWMgdm9pZA0KPiBkcHVfZW5jb2Rl
cl92aXJ0X2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZHJtX2VuYywNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0
YXRlICpzdGF0ZSkNCj4gPiAgIHsNCj4gPiAgICAgICBzdHJ1Y3QgZHB1X2VuY29kZXJfdmlydCAq
ZHB1X2VuYyA9IE5VTEw7DQo+ID4gKyAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjOw0KPiA+ICsg
ICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX3N0YXRlID0gTlVMTDsNCj4gPiAgICAgICBp
bnQgaSA9IDA7DQo+ID4NCj4gPiAgICAgICBkcHVfZW5jID0gdG9fZHB1X2VuY29kZXJfdmlydChk
cm1fZW5jKTsNCj4gPiAgICAgICBEUFVfREVCVUdfRU5DKGRwdV9lbmMsICJcbiIpOw0KPiA+DQo+
ID4gKyAgICAgY3J0YyA9IGRybV9hdG9taWNfZ2V0X29sZF9jcnRjX2Zvcl9lbmNvZGVyKHN0YXRl
LCBkcm1fZW5jKTsNCj4gPiArICAgICBpZiAoY3J0YykNCj4gPiArICAgICAgICAgICAgIG9sZF9z
dGF0ZSA9IGRybV9hdG9taWNfZ2V0X29sZF9jcnRjX3N0YXRlKHN0YXRlLCBjcnRjKTsNCj4gPiAr
DQo+ID4gKyAgICAgLyoNCj4gPiArICAgICAgKiBUaGUgZW5jb2RlciBpcyBhbHJlYWR5IGRpc2Fi
bGVkIGlmIHNlbGYgcmVmcmVzaCBtb2RlIHdhcyBzZXQgZWFybGllciwNCj4gPiArICAgICAgKiBp
biB0aGUgb2xkX3N0YXRlIGZvciB0aGUgY29ycmVzcG9uZGluZyBjcnRjLg0KPiA+ICsgICAgICAq
Lw0KPiA+ICsgICAgIGlmIChvbGRfc3RhdGUgJiYgb2xkX3N0YXRlLT5zZWxmX3JlZnJlc2hfYWN0
aXZlKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ICsNCj4gDQo+IEFnYWluIHRoZSBz
YW1lIHF1ZXN0aW9uIGhlcmUsIGRvZXNuJ3QgY3J0Y19uZWVkc19kaXNhYmxlKCkgdGFrZSBjYXJl
IG9mDQo+IHRoaXMgY2xhdXNlPyBJIG1pZ2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nIGluIHRoZSBQ
U1Igc3RhdGUgdHJhbnNpdGlvbnMuDQo+IENvdWxkIHlvdSBwbGVhc2UgYWRkIHNvbWUgZXhwbGFu
YXRpb24gaGVyZT8NClNhbWUgdXNlY2FzZSBhcyBhYm92ZSwgYXBwbGllcyB0byBlbmNvZGVyIGRp
c2FibGUgYWxzbyB3aGVuIHRyaWdnZXJlZCB2aWEgZGlzYWJsZSBjb21taXQNCldoZW4gZHJpdmVy
IGlzIGluIHBzciBzdGF0ZS4NCj4gDQo+ID4gICAgICAgbXV0ZXhfbG9jaygmZHB1X2VuYy0+ZW5j
X2xvY2spOw0KPiA+ICAgICAgIGRwdV9lbmMtPmVuYWJsZWQgPSBmYWxzZTsNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMNCj4gPiBpbmRleCBhNjgzYmQ5
Li42ODFkZDJlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9rbXMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9r
bXMuYw0KPiA+IEBAIC00OTEsNyArNDkxLDcgQEAgc3RhdGljIHZvaWQgZHB1X2ttc193YWl0X2Zv
cl9jb21taXRfZG9uZShzdHJ1Y3QNCj4gbXNtX2ttcyAqa21zLA0KPiA+ICAgICAgICAgICAgICAg
cmV0dXJuOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+IC0gICAgIGlmICghY3J0Yy0+c3RhdGUtPmFj
dGl2ZSkgew0KPiA+ICsgICAgIGlmICghZHJtX2F0b21pY19jcnRjX2VmZmVjdGl2ZWx5X2FjdGl2
ZShjcnRjLT5zdGF0ZSkpIHsNCj4gPiAgICAgICAgICAgICAgIERQVV9ERUJVRygiW2NydGM6JWRd
IG5vdCBhY3RpdmVcbiIsIGNydGMtPmJhc2UuaWQpOw0KPiA+ICAgICAgICAgICAgICAgcmV0dXJu
Ow0KPiA+ICAgICAgIH0NCj4gDQo+IC0tDQo+IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQoN
ClRoYW5rcywNClZpbm9kIFAuDQo=
