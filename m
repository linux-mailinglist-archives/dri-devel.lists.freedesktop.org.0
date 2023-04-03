Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA6D6D4B14
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 16:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E9B10E0EF;
	Mon,  3 Apr 2023 14:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7695110E0EF;
 Mon,  3 Apr 2023 14:53:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 333DYMBc027677; Mon, 3 Apr 2023 14:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=XtqUHSfmx+O7eb7z3Cd6p5VEjFj7RQ3ZSzh95Ud0Jw0=;
 b=Zj4F3cSspEO7TdhZ9Gf0zsIC0L4IPPks6UrKsy8p39etO1uVztXlGPzP91rUB6e/WgxH
 eNt3GPXaQvIpbAZdGZHJ0HBIbRj10Q//rAiWXOfwQmauOkcpITL3rQVnyl93xJxuxZ/9
 JCeEyTLL67sl/8qn4IMPLcxUumTHtn3On4tCTgPZKO3n5C2GhQ1C75D0fXVae37pwCGq
 UEUiFu660302baa8dZs9KtyYr9lY6r9SSTaUxMbAphjSBpUtjim2kzCWU1IOh1fCLbCm
 GAE+l7H0taiqtNQS8N39Gj2hnuPF4mYi71dghQlbYnO368OerO1idWVH9AoKzZs1B3BY 1A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqusu0tvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 14:53:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhtQoQMZecF27I9Pd34GrVIOUKk8JRM7QShzq8mDpL3Fb+9DepvYhPM98mudj22dOBeC4TNnyD16uBkMMEJ0Fb9E31w1hPWkC65isXKwIiGq3jRDpp7Oqe87r5PpXT40+rjUZkjpJtrfLgylIsmAUubyGwr8NDNfNts5Umh3rL472sBtXFsBdP6d+YGcWC69R/KvAjKGe1qYgNZXtpQyyvcjiD0ImHMBRz0AYHAKHCBTdGvPawvt40ezQ6yLgY+Z/7GF7pTCnXgOAL/e0T6oodttk6jxGlCJ9FI9m7hZR5vO+MhloFK5RV5ZS0w+xsEWPAmT7Q9xJvXC9qai2rQ20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtqUHSfmx+O7eb7z3Cd6p5VEjFj7RQ3ZSzh95Ud0Jw0=;
 b=RuGHV8X5G5FverJ+g0To83QyAGm5FkB9frbWAs8BCTZoxos+ye2AvAoJegcC5BrgrMXGZrW76962EM8XwfZu5ryZRAX0CdE/y7Kb9UNMlSEQmg3tNXm/p3WbnyF6qphlqPkfT/qLAKZIzGn7F1fNEuvYYPOmKXJIOAfED2Ewcn+lo1W8MtkXY+WgzeWc1ic4vCLFlobCsEsV3C3nnVUGkCwNI2MGR+NRMtGS3Hx5O/N7v4Ij66kvIlTU4FSRz5mdTnFBWknaeDxTveGrYjo8bqgBrstvDz4RCRWnklBDp5EE1zWSLkxBuEC1yoMZ8AuCc+5//UF0lZczf8gXlyGOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by IA0PR02MB9511.namprd02.prod.outlook.com (2603:10b6:208:401::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 14:53:30 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::5c51:5ca0:fa24:f4f5]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::5c51:5ca0:fa24:f4f5%2]) with mapi id 15.20.6222.035; Mon, 3 Apr 2023
 14:53:29 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Vinod
 Polimera (QUIC)" <quic_vpolimer@quicinc.com>
Subject: RE: [PATCH v1 1/3] drm/msm/dpu: set dirty_fb flag while in self
 refresh mode
Thread-Topic: [PATCH v1 1/3] drm/msm/dpu: set dirty_fb flag while in self
 refresh mode
Thread-Index: AQHZY9jy+ueeVuLnz0Cmc+/Km2PMJ68U9x+AgAS3wvA=
Date: Mon, 3 Apr 2023 14:53:29 +0000
Message-ID: <BN0PR02MB817399CBBCC620DA12B8F315E4929@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJpo4HaYJ358gnBTfo94o7xUcN+z57+EJUMfJT1gQ5m_UEg@mail.gmail.com>
In-Reply-To: <CAA8EJpo4HaYJ358gnBTfo94o7xUcN+z57+EJUMfJT1gQ5m_UEg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|IA0PR02MB9511:EE_
x-ms-office365-filtering-correlation-id: d4aeab32-a9f0-4967-80e3-08db3453301b
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /N3TctD0TZ1xTVA+GVAIVyp7bwoxUD5HhzGcLNbk7A5yABJHLS4ZmWh29b6WnSg61zmf7L147w9WQhqBQqiXJRX9GaxsXQmROKc8Xl7UEQRFxkLNh4/DAac+oQJ3A5qPdcq5hmZvJX4xmLF2B02oK1I3BEtOBeZyq7/jL+7Vaf9EFoaM/ByPeTD2zGV0AhfcDtUUThRiGC8bY03ZnOptf/oBFTl4dN1Zp8ZgtcmfeaEu6iBRmTpQY0SCjziWRQK2AHSIEG5X+H8uSJZWYkTzLahybPqqWaG3lpir04pCrsLhTTi4SiohHFpyMgmPTUvOG9FsWm3DrVmjlgaTieTQl9uX/o4/K8SgDE1M5F2Z1h4xprRy4TLe3CQYexbN1qZ+9MTLdpI4P26/qK2fkdkw+Ineo/F8R4BcuchcFZIInV8sO6zGB12VCkrBvOHqha89/kQJoC6H2Cd+atp71D+Ex48YGYOjqqdSAO1Dqb2vLexjLQSGXDgYBXXW/Op/R2ALTfDvklzgbjuywnxRcgXmpVfnTQeNS64rhtu+SvfuA03GlW3jMPllZNiN1A7i7pUrPstbdn0WYh2jHEvetWuN4EHfhFWadgQ5jz6vmG70cmNgEt7za29QcfXKOp2TDZLs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(41300700001)(38100700002)(8676002)(122000001)(66556008)(52536014)(66476007)(66946007)(76116006)(8936002)(5660300002)(64756008)(66446008)(38070700005)(316002)(4326008)(110136005)(478600001)(2906002)(54906003)(83380400001)(86362001)(71200400001)(186003)(55016003)(7696005)(966005)(107886003)(33656002)(26005)(6506007)(9686003)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTM2YU5IVnIrbVNPak9sTytFaTBCM1Z0ZFVOTnhxTDljSXZFb2pTNTR3RWU3?=
 =?utf-8?B?NHRrcUNybFZ5MHZMVUNhVTZEYjFTd2p1SlpaWGdFRFI0dk5WZE8ydTFGU1pq?=
 =?utf-8?B?TmhVblJ0ejVqTmRQWnlhd0RiWTVtdkhLeUxpd3o1TkxIck5jV3h6R2plNkta?=
 =?utf-8?B?QTdOcVNnbzRralFtK0hveHZzL0JrQWMxcHlsTGdENWFsNGZwNlVHUEJ1YkdM?=
 =?utf-8?B?cXE3RGJKc2xxQktXQm1tM2JkTFNobW9XR3RkTHFXUU5TR1Jhbyt4MUpvaU9x?=
 =?utf-8?B?M3FtbWtEZWYyckNOZ3NvVDNNMElvZ1Y4Q3cwbDRpT0l5dnpFV29XMjdhdzFx?=
 =?utf-8?B?eTdVbDQzam9nTzR5UjBrclQ2OElVZFUva2tCNGhVdndBdlNzcWhwU1dsTGVi?=
 =?utf-8?B?VW12bGt0RUhtWkplQXNLd29haCtxeDBjWENnM1BHVHBkdUN2Kzl5dTd0Y3NI?=
 =?utf-8?B?bTBFUnczT0U3QW9nK3duWUc3cHNQazF6eERtak4vNEtoSmt0Qzl5ZjFvcTRX?=
 =?utf-8?B?RldYSGp6T0NuZGk4TU1hUVd3R1dyYWkrOUxGUDM1NytDaEZqZk9DVlhpVHdN?=
 =?utf-8?B?aGR5OXJDZTJaVW5jTmZRa1NSVFhXS09uN1JJRWJITFhabjRreHkyZE5DemYx?=
 =?utf-8?B?RVAxUkFoSlJIbzFEVm9NVG1yTHR5a0RXd2QrcjVpbDJGZTdsYTZZOW1LaEtW?=
 =?utf-8?B?WnlxTFYxSDZEdW9EZUVtWUdvTm1YM3FxU0wwVkgrWjl6alZBRWNRbkMwWjJa?=
 =?utf-8?B?TVZFQTEybHQ5cHI3SHpRQVJLdUxidGJIdGVVTVdZNU5CQWZGL3ArWlFTOFJC?=
 =?utf-8?B?Vi9nYWREOUlrNGQwbGlTQzVFOHludmdOUTdRQldVYm9JeGkwbjdFN0NGdUg5?=
 =?utf-8?B?TXNhOFVrcmw3U3hqRmF2STR1NXVqZnN5OWNsUnhHZGx4dE9DTm1hRENKQVJt?=
 =?utf-8?B?cTg0MytnaG9CRVl4Y3hsWExwWjY3NmtIMEdHZkJodTRTUWUzaEprNkFZQ1lp?=
 =?utf-8?B?cVlLYXRORE91SEErMWlIZEl4NDZwTWh4T2pORDdCTm43WXdqamFOL1V4dlBS?=
 =?utf-8?B?WHBNalYra0tuMVdSa3Q0MTR4V0JJdEVSWHF4UXJ3aGJJNUw5WHcxMll0dk1G?=
 =?utf-8?B?a0V6RVM0YjRUM2wwNWs5WUkrQ1lQYTVqMVVRYk1MeHR6bnlTSDQrRG5uSFVy?=
 =?utf-8?B?MmxJL1Q3b3Jja0tlRnoraFdFMjN2WHgrQjFYaFlDSjdlc3JvOXVlaVBubFlE?=
 =?utf-8?B?eDF3aFZXRHNjTjk5OGtaUVVVREN6Uzk2eWZUQzQxUTV6VERPT2d5dEcreFF6?=
 =?utf-8?B?SzFzT3ByS3BOUVNHeXkwcE43RTlyRFRaZGNFTHkzbGJNZVl3L3poR3cvOHpz?=
 =?utf-8?B?QkJvY1VSVGVqYzdTTXNxd0Qzc3VKd3JuMk1jbnptYVFlNzdQWnF0Qy9FMUdL?=
 =?utf-8?B?cU4zMTlxb1gvYWNTeTdiYy8wbzVyVlpXV1FtMlVITTdnUWZzWkJpNHlqNGQ0?=
 =?utf-8?B?c3VVVmdsam8yeEZDNjdjUHl2Y1hjNDhjeDRFNXBrZFl3cXYwSXRuS1BvdTVz?=
 =?utf-8?B?V1ZSUDZBclpQOGJ6aVprdU16MWE4NE1ZQVI3NnNmckM1Q1djN2F4OFdNWC9Q?=
 =?utf-8?B?ZnNMNVlsZ3hYQ0JrMjdCNFBuRWZIK1oxQlVMY0Q1V1pkZEJ5d3ZNdzBRdktY?=
 =?utf-8?B?WURsTGxOcllIUjNJTWREUVJkVmtFVWU2QkhQZnRWYnJTcHFLT1RGWEFqdmta?=
 =?utf-8?B?RE1pNnUvMmc4OXl0OGFaRE9QdFFzbGZUbFhDNGhqOGluU291VnFyMVpZWXVC?=
 =?utf-8?B?TE9PRnJYSnU0ajk1RnJ0WGpLTUVVbTRKTlQ0azM2NklwOTdNamJVN2ZBWEs1?=
 =?utf-8?B?Rk93dDZUYisvQUtUR3ZneU5VZ3M1czc0Q3ZjTk1JU2k1YTVpWXM2QTFqUERl?=
 =?utf-8?B?RUFDQ3VPSmdLUXFja2UxNm41ZWNac3l1enhxcFRDb0o2THM0ZW1SbW5IcGdu?=
 =?utf-8?B?UEU4ZDREdUREM1NubndWajJwUm03UnBtdVVEU1FpYTJSWnJOY2hoMCtaMi83?=
 =?utf-8?B?bjM3b3d5K0l3VU42U2tDUEhIYlhPbG1RTzNNOU43dk1vaVBEalFqUlAyQkE3?=
 =?utf-8?Q?OlUTPB+42RpQ4a0PP9rEFNQ3Y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: l02GsjKRxd9djpHpGFY0OhiTweJC5T89hr9yXiVtA79Au6XgQSxvfWtxPvEzqqElc/rdkcxspW9QfrwEz/PZCINmG/8CrPApmYgovzKPwK1OjtMs7lwMwbO5tO9VBrGa0q9fptKXi3pqLqkk05L00NHMrAMYYLzWNCoalkfOkXW4ocOe8ZwTBujL+OEfA1VW50NXF7XMWrXDZKmeDfcwwFRnUXf/u7HNDvNaGpHtZT29Zi903jrJnit64d1byoc9iICdM0VDz1sCEZXWH0ZxEu4U7UMtGPJFbTbBVuZJkRIHjv2z9KCfwS4ZETe+XFspys5gxmAbl250w8dQWqB2GTk438BvBGYv4cpmlK7owAq4sVfFZOu/681SWvZDljWXV2rB18SDIM8uxPYGVbBVmLrI6rOpkDyZKxfIDSMyMlL0q5rFzbUF5+oK5yeyYD3tKHlQlIjZC/blZc/ZvxdQ+E0xo7NcLZ9pRTe8xXSM50f+XKQ4kUHBa+dS1rLa9ytOTmL8trHwslPLszhPdf67TqWtb6/WgDQCKVyv168UMPxBBeDJKT38Bev9kaWHiXc2/K+a/uddNWE2R/C+4/cYC5zZ8XA8Psi+kaDejFMs+bqe4RhVqsMS//EmFydtbJlfjl8d5K/jPnarvqrytV7Uofw5U5ooXXXI0OoCJTZGm8FeFVhZKC1+6QnCE+Ml1/vAGNZ4NaTMMpyP0eXufddxh+q76uXiFiek38Zo5QysM5050mH9RdrY2W75BQbgMmtMx0VO2CanVe4kSkq9onol+239BAypShXkRik1CDydFCA8uic2mXgno9GhG3mgtDwEbUODx+GVSOw8N7V7khWvucx5/vHh+Wt4qQzrSUMkzYa0JO2HMkcuaqy13SajxCWU//PxNXLtpVAjSkgfs8aIDdQzy6JobYgthMIq5pghtZA=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4aeab32-a9f0-4967-80e3-08db3453301b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 14:53:29.7030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzHJ0oiRyTTsLbQ7GGz6ZXRyqbf3ChIIcq8FfW0HzGW5gnvIGFieMaN5qErrSTeW754sNYn+ZePpgXHduuiXOIHIlsjvQI6A8IPsuHBihYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR02MB9511
X-Proofpoint-GUID: p758oszQ0B83uEsrhvc72M7ohSLcskrN
X-Proofpoint-ORIG-GUID: p758oszQ0B83uEsrhvc72M7ohSLcskrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_12,2023-04-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=722 impostorscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030107
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiBGcmksIDMxIE1hciAyMDIzIGF0IDE2OjU5LCBWaW5vZCBQb2xpbWVyYSA8cXVpY192cG9s
aW1lckBxdWljaW5jLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBXaGlsZSBpbiB2aXJ0dWFsIHRl
cm1pbmFsIG1vZGUgd2l0aCBQU1IgZW5hYmxlZCwgdGhlcmUgd2lsbCBiZQ0KPiA+IG5vIGF0b21p
YyBjb21taXRzIHRyaWdnZXJlZCB3aXRob3V0IGRpcnR5X2ZiIGJlaW5nIHNldC4gVGhpcw0KPiA+
IHdpbGwgY3JlYXRlIGEgbm90aW9uIG9mIG5vIHNjcmVlbiB1cGRhdGUuIEFsbG93IGF0b21pYyBj
b21taXQNCj4gPiB3aGVuIGRpcnR5X2ZiIGlvY3RsIGlzIGlzc3VlZCwgc28gdGhhdCBpdCBjYW4g
dHJpZ2dlciBhIFBTUiBleGl0DQo+ID4gYW5kIHNob3dzIHVwZGF0ZSBvbiB0aGUgc2NyZWVuLg0K
PiANCj4gV2lsbCB0aGlzIGltcGFjdCBub24tVlQgd29ya2xvYWRzPyBJZiBJIHJlbWVtYmVyIGNv
cnJlY3RseSwgd2UgYWRkZWQNCj4gZGlydHlfZmIgaGFuZGxpbmcgdG8gcHJldmVudCB0aGUgZnJh
bWV3b3JrIGZyb20gbGltaXRpbmcgdGhlIHBhZ2UNCj4gZmxpcHMgdG8gdmJsYW5rIGV2ZW50cyAo
aW4gRFNJIHZpZGVvIG1vZGUpLg0KPiANCkZyb20gdGhlIHVzZSBjYXNlIHJlZmVycmVkIGluIHRo
ZSBjb21taXQgdGV4dCAoIDllNGRkZTI4ZcKgIGRybS9tc206IEF2b2lkIGRpcnR5ZmIgc3RhbGxz
IG9uIHZpZGVvIG1vZGUgZGlzcGxheXMgKHYyKSkuDQpUaGVyZSBjYW4gYmUgYW4gaW1wYWN0IG9u
IHRoZSB3b3JrbG9hZC4gSSBjYW4gdGhpbmsgb2YgdHdvIHNvbHV0aW9uczoNCjEpIEFkZCBtb2Rw
YXJhbSB0byBjb25maWd1cmUgUFNSIHdhaXQgdGltZSAoU0VMRl9SRUZSRVNIX0FWR19TRUVEX01T
IDIwMCkgYW5kIGFwcGxpY2F0aW9uIGNhbiBzZXQgaXQgdG8gIi0xIiBpZiB0aGV5IGFyZSBvcGVy
YXRpbmcgb24gZGlydHlfZmINCjIpIEluIG1zbSBkcml2ZXJzLCBkaXNhYmxlIHBzciBpZiBkaXJ0
eV9mYl9pb2N0bCBpcyByZXF1ZXN0ZWQgZnJvbSB0aGUgZnJhbWV3b3JrIGFuZCByZS1lbmFibGUg
aXQgZHVyaW5nIHJlZ3VsYXIgY29tbWl0Lg0KICAgIFRoaXMgd2lsbCBpbnZvbHZlIGNvcHlpbmcg
ZGlydHlmbGFncyBmcm9tIGRybSBmYiAtPm1zbV9mYi0+ZHB1X3BsYW5lIGFuZCBhZGQgYXRvbWlj
X2NoZWNrIGZhaWx1cmUgaWYgKCBkaXJ0eV9mbGFncyAmJiAgc2VsZl9yZWZyZXNoX2FjdGl2ZSku
DQoNClBsZWFzZSBsZXQgbWUga25vdyB5b3VyIHRob3VnaHRzIG9uIHRoZSBhYm92ZSB0d28uDQoN
ClRoYW5rcywNClZpbm9kLg0KDQo+ID4NCj4gPiBSZXBvcnRlZC1ieTogQmpvcm4gQW5kZXJzc29u
IDxhbmRlcnNzb25Aa2VybmVsLm9yZz4NCj4gPiBMaW5rOg0KPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyMzAzMjYxNjI3MjMuM2xvNnBuc2Zkd3pzdmJoakByaXBwZXIvDQo+ID4gU2ln
bmVkLW9mZi1ieTogVmlub2QgUG9saW1lcmEgPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+DQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMgfCAz
ICsrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMNCj4gPiBpbmRleCBhYjYzNmRh
Li45NmY2NDVlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9jcnRjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
Y3J0Yy5jDQo+ID4gQEAgLTExNTgsNiArMTE1OCw5IEBAIHN0YXRpYyBib29sIGRwdV9jcnRjX25l
ZWRzX2RpcnR5ZmIoc3RydWN0DQo+IGRybV9jcnRjX3N0YXRlICpjc3RhdGUpDQo+ID4gICAgICAg
ICBzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSBjc3RhdGUtPmNydGM7DQo+ID4gICAgICAgICBzdHJ1
Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7DQo+ID4NCj4gPiArICAgICAgIGlmIChjc3RhdGUtPnNl
bGZfcmVmcmVzaF9hY3RpdmUpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPiA+
ICsNCj4gPiAgICAgICAgIGRybV9mb3JfZWFjaF9lbmNvZGVyX21hc2sgKGVuY29kZXIsIGNydGMt
PmRldiwgY3N0YXRlLQ0KPiA+ZW5jb2Rlcl9tYXNrKSB7DQo+ID4gICAgICAgICAgICAgICAgIGlm
IChkcHVfZW5jb2Rlcl9nZXRfaW50Zl9tb2RlKGVuY29kZXIpID09IElOVEZfTU9ERV9DTUQpIHsN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gPiAtLQ0KPiA+IDIu
Ny40DQo+ID4NCj4gDQo+IA0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0K
