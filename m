Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D209F7B10BB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 04:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B7A10E5D1;
	Thu, 28 Sep 2023 02:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B5E10E5D1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 02:25:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38S2K20Z032295; Thu, 28 Sep 2023 02:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=/O7kf8zERsgK6RZtP3Why3IAxLsNO2Tn+1fou7g7ZNU=;
 b=S3EcCG8ikW+8+79mJXNchliHoX1ouyVRrBHfgSdiZNGd3JaORRUOSQWgddr+4t5I43N+
 QaQ9aBDlpAZLqSNpCFWouJZFsPDZNVj8qrSf03NtGjhCblEYQkKeucJj7UNiJ/IoDqcj
 CE6So1tr5InuHUyGRS1ob1yPmyis3NOOf1tI4UNGzWZAtf31QIYHgMvdLng6Uont7xd2
 apzKNEdwWLwf+ogDzRKiCMdS8GsZ8RHV9b1rtartJEjJaJrDqgyNQU4jhPqKBi73ZaEF
 cZf5FrvBtAP401gaC5atHSPotA6bIWXiDYtJxD8UMkCC2pCgFc7U/qTF0NG4zTYwij1J Fw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tc43mudt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Sep 2023 02:25:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6DgK+2x9iDiypRmE9A5PGoj7Ajs/8/RYLu8nwxx7AUCHFTLPCbplZyP4rTgva06nipSvahrd9wnpwCZwOvrr9oLZAHYDQHfNgXDLHDaCC5KoW6SdRdi9v59RvEevmLKbnCuktjse6OM+28z4WOyDt8Trm5ogbgXXImwKg36CKnCGYJ+DUQMNYkoPDllUCZKadKSjYwKVOYsxrLOm2WUYqgkHHuiVoVYq0m4RINHY2P6LnjAw1LbJgGZW94dRqyCwixoEiS5QGDCx6eNBSYJa7hE6UUBcC5/m01eR/bOeSEVAqjNJPIdoJnXXADwXqjRTJvO14H0uE1jsRq4cUYjTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/O7kf8zERsgK6RZtP3Why3IAxLsNO2Tn+1fou7g7ZNU=;
 b=GZPOia5tBX8MwNyUDSeR/LX0fMtt1ObllLWW3Ewmb4MHDm9blNHhaiv+jMXiF7ouBE/iqiyBwAnUAVGCtii4auillqObln3Sf2NKDy+tuLyiPpHlIsvbxazc8QvS92ho/+dglTPou1R1Of2StWuwWZXal9WTDq+uCGmuNlT+6qcGEJAn/yqCiU5fYus6h0u179KaGszEXLHOuIRLSum85ceybHuq9njVWVZF6Ih5qgexPlsHxIintw03nWAIKoXKSXkp9ZyWqOww08W9fpbng4pT63G5Uyo4poKDSFAHDJMvmzvNddi0ZXap4RBJ04TOkfe/IYiU7MPNiI6jRgzoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB7951.namprd02.prod.outlook.com (2603:10b6:408:169::8)
 by MW6PR02MB9694.namprd02.prod.outlook.com (2603:10b6:303:243::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 02:25:26 +0000
Received: from BN0PR02MB7951.namprd02.prod.outlook.com
 ([fe80::ed2:9f26:8ab:82fc]) by BN0PR02MB7951.namprd02.prod.outlook.com
 ([fe80::ed2:9f26:8ab:82fc%4]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 02:25:26 +0000
From: Ramya SR <rsr@qti.qualcomm.com>
To: Alex Deucher <alexdeucher@gmail.com>, "imre.deak@intel.com"
 <imre.deak@intel.com>
Subject: RE: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
Thread-Topic: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
Thread-Index: AQHZ55DQhVb08bi8cEKL8zMH3hln2LAnP4GAgAAFlICABGzqAIABSYSwgAKbHWA=
Date: Thu, 28 Sep 2023 02:25:25 +0000
Message-ID: <BN0PR02MB7951FFEB16011D2B1D3DA75181C1A@BN0PR02MB7951.namprd02.prod.outlook.com>
References: <1694753689-29782-1-git-send-email-quic_rsr@quicinc.com>
 <19ce2cd9abfd3bdf3ea91f9bceb43206e4740c2e.camel@redhat.com>
 <ZQ3pbVHRXMiLfUCf@ideak-desk.fi.intel.com>
 <CADnq5_NQnQoheKv39DiuLjKY3Z83WpesrFRUO4FMdrn=YPhnSQ@mail.gmail.com>
 <BN0PR02MB79517B267D593DC484BA34DF81C3A@BN0PR02MB7951.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB79517B267D593DC484BA34DF81C3A@BN0PR02MB7951.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB7951:EE_|MW6PR02MB9694:EE_
x-ms-office365-filtering-correlation-id: 38178627-3b46-4e05-2bb4-08dbbfca2cb6
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UJdPh2P8Xj/TQgZLwAIO7LEHlDQZdl37s7X9cdFELyKWHauYrddozszXKevBjQdGs4KMxaoWw4oPv8H3oERNBiU1edPRp3I82ujv7ljSPZ04YfitfNihR6spLIjg50Xx4PTLLz7TeTB0AJiklBX2D8WwNaaJwibiS2J8H7oKV9pfDzShlMZdse4SO627jvD46pqLBMuz+XOMJxWDs8kN+90Bjh/rbZUaQ+uQohwv2Dc/QJT9rtEYWRRr98MIq+ZWUvdUMKDU1ed+hATBwNh0hbifFBhlciAbX73q4Ih018II8NyuMDqRkykEnZ8ePFg5WOxiJxabaaHtf7pglFY61dAuLpXkOHGDhkGd25p4uPCDn6+LiA8U3cCdJbvXjE3OWIzE0f0Xln6JlVkuJ4tIvhzfwM8mszFwQemQh6/oThiR04PpfveFxthp2afh1O+8Mj4iCrYdMvUyyeEIo5MCpqxCrAw9rhQeAPRNCNm/kAtZuSUze7xldw7dhASJlb6lYe9niS7ePOxCno91oYXZqlzFoNN7kFwMXLPgNPJiRswS9FBO7eF78krbhqLbw+J8+sTPqy+mt7rsVzAWBCCF2SUMbs7sPXV7Ls2rHDceu/TkRLHEHwURqjCJQPGLAoI8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB7951.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(316002)(2906002)(41300700001)(54906003)(110136005)(76116006)(66476007)(66446008)(64756008)(66556008)(66946007)(9686003)(8676002)(8936002)(4326008)(52536014)(478600001)(71200400001)(122000001)(26005)(38100700002)(5660300002)(38070700005)(7696005)(6506007)(55016003)(53546011)(33656002)(107886003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW5jVXlsNmJSeUxBOFV4anpiWjdBTmFXR3ZhaDVSZXlGNGd3UDhMVnJDQzBK?=
 =?utf-8?B?OGZqRVlJVWgvOG80eWx6Y3JkckZKVkJLU2pmMUo0WjBqQndyZVlsMWZJVlhM?=
 =?utf-8?B?Vnk1NFlxUGZTT0xmY1hRUUNFd0diOWtldCtBNWhMSG1KMWxka21BRTlScHV0?=
 =?utf-8?B?YTAvWmtkbTExZkJNSXlpcmNiT3R3aWJyMFdIVmNYdEJNam52Tld0UHJPVmU0?=
 =?utf-8?B?OGJWSXBOVFhiV1dsK0VGUU9OcE0vTUdaNjhiSUM1WkN0MUo5N2JrNHE2Vm1S?=
 =?utf-8?B?Unp1K3NCZGxKcERkeU9wcndHWS9aQnA0UUNtSVJCRFBoR1VxS3N2Zk0vb01Z?=
 =?utf-8?B?RngzZEJUM2llbFpiRi9qcTZQQjRvNDRlQTlSaGZiOTRieUtJOXlaaXFqZU9B?=
 =?utf-8?B?cHA5bUtIWFN0SUZXOWwxUnd1dkRHRU55MTBRa21GRGxuSFlLdThoQytsSG00?=
 =?utf-8?B?VU5OWUNsbk9SOTI0cTZzcncxaWd3aHJHZmVNbGs2WGhKdE1Ed1QvTDNuYXdV?=
 =?utf-8?B?V2N5bUk4UFhRYVZqOURLcmI3SHRnUzJZb0dJb1E3UXRML0dlTDRKMlhscnRY?=
 =?utf-8?B?S1I0SlVEZkREeWlqOEdZOFlJVFJIR3dwUjhOMVpnRnQyQ0FmUDRlb1lnRWI3?=
 =?utf-8?B?SnZQeDdTdkhkRVFOaXZIUDZtajlmVVl2c0U3VkNCVm9qcytwM3pzSTdGOGMz?=
 =?utf-8?B?UTEzL0NpR3EvSjVtYXo1TjBPVmVkQ2k5aWFnZHEyNHdETk5oU1Y2MC84Mll4?=
 =?utf-8?B?MG9JUGtadm5WWHkzemF1cWUrSXN3R0hmSGVTbnREL24wWVNGL3U4Q1Y5OHB0?=
 =?utf-8?B?eitvY0IvSU01Y0F2dnFCSGRQRitGQzRKUHBqcFlZNE9Da3VNVXZUSFRnVEl2?=
 =?utf-8?B?MFZuQXhBYko1U0FPZklSYlg3UEU0UmJSbnFDS0VBYzJwNVYyZTBkWnVkaCtu?=
 =?utf-8?B?RUoyRHIxS3FNaHU4eGp5S3RQd0tLOXljZzdGVndvVWd4VUVyOFBGSS9CbEVO?=
 =?utf-8?B?NlJjNm0xR0FHV0FGaWx6NHRWOFE2NXpJM3g0M0xZUWpkYzdPellvNXdLNzJi?=
 =?utf-8?B?L2plSFdyMXdKT1o0R21aSkNvK0hIdEhqdmFrcXJ6aUZPUzVBdTJNN2xtTlBt?=
 =?utf-8?B?L2ttT3ZmL2FiOEx2WjhOVTVId0tCUFpLZmxhZ20vWExQZUlWMTZwRWZlcUF3?=
 =?utf-8?B?TGdVVGdBcGlFd1crWEo5a0JFZ3VXeHhXaVYrNWhTSlpJTnp4SnZzb2dUa0V1?=
 =?utf-8?B?YzRMWFBnYUpjSktHT0ZOejFKczEyeUNYYTFaZ0xmVzZ2M3VLeDMrUUtRczZK?=
 =?utf-8?B?ZWlSWW9ua3B6UnZlMGNLL3BEZGdIWTkzVEJPSkhVak8xc0lTWFRhUy9XOXVk?=
 =?utf-8?B?ZEJmMFdkKzgzcWVZOUt4OWZiQ0I2TklMQnNBQjBtYnkyckMxb3RRUEtlbXVT?=
 =?utf-8?B?TWY2MmtoeXNOSnJ4RllFZXlQeVpIMk5YVmlzMXZLYlQxQm9tdW96U2J3RThW?=
 =?utf-8?B?WWdTcmV5VXE5amZGL0RnQStFQ1lwSkJnckFQSFMvM1A5dENLZTZWMzdBc1Fr?=
 =?utf-8?B?SThvSUpYakxNRmJ3eVMrWm1tQWpybnUvSURlZENpNWQyamlnOGNZVU1hUk1l?=
 =?utf-8?B?NzEzb1k5alBUS1orKzBaSzZkODFXQndQQTJ6Q2o1cTg4UVE0djRrQ2htK3NR?=
 =?utf-8?B?SUR4bTZQdlZ2d1lTQ2RURExITG5JTWNybWtsY2ZYazh1WVdYdldnUmNvdTk5?=
 =?utf-8?B?RTNneTk0YlpsTTdwM0RXNG1jSjRySkdaZHJ4bmwwTHlXYUpqTGZSOEdsaEZy?=
 =?utf-8?B?UjdJSUVtTnFFYUtOa0YweXRCM3RHWDluUFp2Zk5BdDVJa2srQUEvTDZHQStl?=
 =?utf-8?B?OU03NnFZZ25YZFowNXVYKzR1Mm9tOXYyT1FnK2o3b1B6Q1FOZ3Z3bXFJUTZn?=
 =?utf-8?B?ZmFBYkR1a1pLWWNyRlNlQ3ZyeG9HMUxkaTVPWGxOUXdubk5Hd0JROUdWKzRZ?=
 =?utf-8?B?U2hDMVNCQlgyeHhQNzRlK0FPdXdoZHdSaS96a0tzSEZ3U096K2thU3JmbVE1?=
 =?utf-8?B?MlFLYThRc29PTlBIbTFPejRYQUdITDAvYk5sNkJMajdqUHhNVHNJN0Z0N1Iv?=
 =?utf-8?Q?nGFBSczQXlRxf2RiOvseKSJP0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?cGJLNHFJZVFTL0hSQlUzajhrQVhTM3pwQ3FwU1gxY3Z4VnoxUGc3SU03cy80?=
 =?utf-8?B?MkJCQzV2VFFIU1htRXRMRDN6YVpsamZadWpUdDhBYlpranBoeWw2VjVLMklY?=
 =?utf-8?B?dUdCbmNMOVNaODBUZnJaMFdTVm1BblFPZ0R1cVYra3FjYWQxRmdPOWFJNmJF?=
 =?utf-8?B?RURndHB5Q1lYMkxSY3VIOFlSZmJNOWdhY2hPYzlzdGUwTWdxYXgrdFBCdXkr?=
 =?utf-8?B?dGxqYnZJSVR5T1JyeVVKMGtZUUFTVFZ3STFUazhOeFpRQnN6bklTWmNncGJu?=
 =?utf-8?B?K2svUlZORFZsZEo1b2lpMTE3UFdBTXFINkh4NTdSTEIweEI1aTJNc1M2Y0RP?=
 =?utf-8?B?NFp6amdCRGE0d2hyZFNyOSt4N0VDNUtGT3R3bVdhQWI4OTlEU2RFdkJEc1JL?=
 =?utf-8?B?R2tIa2FqNllHTkpZWDBSN0NSdlZtWjI4VnFYZmQvTUlMUmhsekZWVml5UUhv?=
 =?utf-8?B?L01vVkxTbGZ5aHhwUXM0MUw2djRWMnFjaGo2MHd1b3J1ejBLSmdHdTNMRGtu?=
 =?utf-8?B?UGNtMGh6SE5aK2NLK1o5UnBjZUdiZ0hQY0lUVUNWSUpDaE9QYTBnMWRocnp2?=
 =?utf-8?B?N1ZaLy9pSlBya2VHdmtWcDVLTmgvZDc2UER1RVppbnpXalB0enVybUFTQW1J?=
 =?utf-8?B?VUppRXdUaElXdlQzTXIybHJyejRoY0cydzVBbXluWTcrdHFaTXpnN2NwSm13?=
 =?utf-8?B?MlBSMlEzbThXM2oydlFGTllGWWhiclhkNTliRjNDVGJwQitaOXVjSEJQVEFW?=
 =?utf-8?B?eFArMDlRWjRoY1ZzWVplaXRIdUpLc3VVNEFpV294QStjakpZV1pHT3BYajJp?=
 =?utf-8?B?eTJveXVKOHVYM2JsbUp5emFlaklYRXliU0c5bkVLU2VWUDNmVlhSZjNsWmp2?=
 =?utf-8?B?TUZ2TGt6T3FoeGNLVEllUS9hejQ3U01RNVZsYnJSMTk1c3pFdkNZSG82dDVT?=
 =?utf-8?B?N2lWczJmb05mWGF5ajlKeXR3ck15WUFXVndpMWRVbndpY2x3QzAxdG5yVWEy?=
 =?utf-8?B?Tm5MUlFzTWorVGthNTZEaTZqZXdQWDM3M3lDa3JJZ3ZpN2diZ2tIQ3VLYUdN?=
 =?utf-8?B?NG1uczRIcWtvZXF0ZmN4S1Q5SkNFU2tnTC9ETThoR1hNYUU2MEFlZnBrQ1Q2?=
 =?utf-8?B?SWJCR3BkTlUyRHp5ekxyUjU5dkJrZXhZQ0FxNVRtNExYcmxvRGlKMWd0Rm9x?=
 =?utf-8?B?V3JHRGx0RmYvN0pCbFZKcG0wSUhwUVh1ZE5iMVM3cUpHOU9KZnZYakFZcmE3?=
 =?utf-8?B?KzlKZUFZa0tkS0lGV0tTK3RDTjEwNzFQZmp0VmdpaEJGVmpKUT09?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB7951.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38178627-3b46-4e05-2bb4-08dbbfca2cb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2023 02:25:25.6991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hUof6j2C5I/P9V2dId9EjJj/UgUDTwORdjPH3ZtAwqx0faltkLW7/dYkNzE1FsCO42B8GZcUZPPG8eoUKhkqRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR02MB9694
X-Proofpoint-ORIG-GUID: _ZpZ2lDAno_NCxiH4OKp31Eg3qon6KF0
X-Proofpoint-GUID: _ZpZ2lDAno_NCxiH4OKp31Eg3qon6KF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_17,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309280019
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
Cc: Jani Nikula <jani.nikula@intel.com>, Jeff Layton <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Ramya SR \(QUIC\)" <quic_rsr@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtaW5kZXIuIFBsZWFzZSByZXZpZXcgdGhlIHJlcGx5IGNvbW1lbnQuDQoNClRoYW5rcyBhbmQg
UmVnYXJkcywNClJhbXlhIFNSDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBS
YW15YSBTUiANClNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyNiwgMjAyMyA0OjEyIFBNDQpUbzog
QWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+OyBpbXJlLmRlYWtAaW50ZWwuY29t
DQpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT47IEphbmkgTmlrdWxhIDxqYW5pLm5p
a3VsYUBpbnRlbC5jb20+OyBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPjsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
V2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT47IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT47IFJhbXlhIFNSIChRVUlDKSA8cXVpY19yc3JAcXVpY2luYy5jb20+DQpT
dWJqZWN0OiBSRTogW1BBVENIIHYxXSBkcm0vZHAvbXN0OiBmaXggbWlzc2luZyBtb2Rlc2V0IHVu
bG9jayBmb3IgTVNUIHBvcnQgZGV0ZWN0DQoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQpTZW50OiBNb25k
YXksIFNlcHRlbWJlciAyNSwgMjAyMyA4OjI3IFBNDQpUbzogaW1yZS5kZWFrQGludGVsLmNvbQ0K
Q2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+OyBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAaW50ZWwuY29tPjsgSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz47IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFdh
eW5lIExpbiA8V2F5bmUuTGluQGFtZC5jb20+OyBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+OyBSYW15YSBTUiAoUVVJQykgPHF1aWNfcnNyQHF1aWNpbmMuY29tPg0KU3Vi
amVjdDogUmU6IFtQQVRDSCB2MV0gZHJtL2RwL21zdDogZml4IG1pc3NpbmcgbW9kZXNldCB1bmxv
Y2sgZm9yIE1TVCBwb3J0IGRldGVjdA0KDQpXQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQg
ZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeSBvZiBhbnkgbGlua3Mgb3Ig
YXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCg0KT24gRnJpLCBTZXAgMjIs
IDIwMjMgYXQgMzoyMuKAr1BNIEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4gd3JvdGU6
DQo+DQo+IE9uIEZyaSwgU2VwIDIyLCAyMDIzIGF0IDAzOjAyOjIzUE0gLTA0MDAsIEx5dWRlIFBh
dWwgd3JvdGU6DQo+ID4NCj4gPiBPaCEgd293IHRoYW5rIHlvdSBmb3IgY2F0Y2hpbmcgdGhpczoN
Cj4gPg0KPiA+IFJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPg0KPiA+
DQo+ID4gSSB3aWxsIGdvIGFuZCBwdXNoIHRoaXMgdG8gZHJtLW1pc2MtbmV4dCBpbiBqdXN0IGEg
bW9tZW50DQo+ID4NCj4gPiBPbiBGcmksIDIwMjMtMDktMTUgYXQgMTA6MjQgKzA1MzAsIFJhbXlh
IFNSIHdyb3RlOg0KPiA+ID4gTW9kZXNldCBtdXRleCB1bmxvY2sgaXMgbWlzc2luZyBpbiBkcm1f
ZHBfbXN0X2RldGVjdF9wb3J0IGZ1bmN0aW9uLg0KPiA+ID4gVGhpcyB3aWxsIGxlYWQgdG8gZGVh
ZGxvY2sgaWYgY2FsbGluZyB0aGUgZnVuY3Rpb24gbXVsdGlwbGUgdGltZXMgDQo+ID4gPiBpbiBh
biBhdG9taWMgb3BlcmF0aW9uLCBmb3IgZXhhbXBsZSwgZ2V0dGluZyBpbXVsdGlwbGUgTVNUIHBv
cnRzIA0KPiA+ID4gc3RhdHVzIGZvciBhIERQIE1TVCBib25kaW5nIHNjZW5hcmlvLg0KPiA+ID4N
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJhbXlhIFNSIDxxdWljX3JzckBxdWljaW5jLmNvbT4NCj4g
PiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9tc3RfdG9wb2xv
Z3kuYyB8IDQgKysrLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Rp
c3BsYXkvZHJtX2RwX21zdF90b3BvbG9neS5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9kaXNw
bGF5L2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiA+ID4gaW5kZXggZWQ5NmNmYy4uZDY1MTJjNCAx
MDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9tc3RfdG9w
b2xvZ3kuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX21zdF90
b3BvbG9neS5jDQo+ID4gPiBAQCAtNDE1NCw3ICs0MTU0LDcgQEAgZHJtX2RwX21zdF9kZXRlY3Rf
cG9ydChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciANCj4gPiA+ICpjb25uZWN0b3IsDQo+ID4gPg0KPiA+
ID4gICAgIHJldCA9IGRybV9tb2Rlc2V0X2xvY2soJm1nci0+YmFzZS5sb2NrLCBjdHgpOw0KPiA+
ID4gICAgIGlmIChyZXQpDQo+ID4gPiAtICAgICAgICAgICBnb3RvIG91dDsNCj4gPiA+ICsgICAg
ICAgICAgIGdvdG8gZmFpbDsNCj4gPiA+DQo+ID4gPiAgICAgcmV0ID0gY29ubmVjdG9yX3N0YXR1
c19kaXNjb25uZWN0ZWQ7DQo+ID4gPg0KPiA+ID4gQEAgLTQxODEsNiArNDE4MSw4IEBAIGRybV9k
cF9tc3RfZGV0ZWN0X3BvcnQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gPiA+
ICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gICAgIH0NCj4gPiA+ICBvdXQ6DQo+ID4gPiArICAg
ZHJtX21vZGVzZXRfdW5sb2NrKCZtZ3ItPmJhc2UubG9jayk7DQo+DQo+IElzbid0IHRoaXMgc3Vw
cG9zZWQgdG8gYmUgdW5sb2NrZWQgb25seSBieQ0KPiBkcm1faGVscGVyX3Byb2JlX2RldGVjdF9j
dHgoKSAvIGRybV9oZWxwZXJfcHJvYmVfZGV0ZWN0KCkgPw0KDQpNYXliZSBhZGRpbmcgYSBjb21t
ZW50IHRvIHRoYXQgZWZmZWN0IHdvdWxkIGJlIGhlbHBmdWwgZm9yIHRoZSBmdXR1cmUuDQoNCkFs
ZXgNCg0KPnRoaXMgaXMgZGlmZmVyZW50IGxvY2ssIGFib3ZlIGZ1bmN0aW9uIG1lbnRpb25lZCBp
cyBsb2NraW5nL3VubG9ja2luZyB0aGUgZ2xvYmFsIGNvbm5lY3Rpb25fbXV0ZXgsIHRoYXQgaXMg
cmVxdWlyZWQgYWx3YXlzIGxvY2tlZCBkdXJpbmcgdGhlIGF0b21pYyA+Y2hlY2svY29tbWl0LiBI
ZXJlIHdlIGFyZSB0YWxraW5nIGFib3V0IE1TVCB0b3BvbG9neSBtYW5hZ2VyIG11dGV4ICJtZ3It
PmJhc2UubG9jayIuDQoNCj5Gb3Igbm9ybWFsIG5vbi1ib25kIE1TVCwgaXQncyBvaywgdGhlIGNh
bGxpbmcgc2VxdWVuY2UgZm9yIGRldGVjdGluZyANCj5NU1QgY29ubmVjdG9yIHN0YXR1cyBpcyAg
ZHBfbXN0X2Nvbm5lY3Rvcl9kZXRlY3QgDQo+LT5tc3QtPm1zdF9md19jYnMtPmRldGVjdF9wb3J0
X2N0eCA9IGRwX21zdF9kZXRlY3RfcG9ydCANCj4tPmRybV9kcF9tc3RfZGV0ZWN0X3BvcnQgKHdo
ZXJlIG1nci0+YmFzZS5sb2NrIGlzIGxvY2tlZCkNCg0KPiBUaGVuIGZvciB0aGUgYm9uZCBNU1Qg
Y2FzZSwgdG8gZmlndXJlIG91dCBpZiB0aGUgc2libGluZyBjb25uZWN0b3JzIA0KPiBhcmUgYWxz
byBjb25uZWN0ZWQsIHNvIHRoYXQgdGhlIGJvbmRpbmcgaXMgcG9zc2libGUsIHdlIG5lZWQgZGV0
ZWN0IA0KPiB0d28gb3IgbW9yZSBjb25uZWN0b3JzID5pbiBzaW5nbGUgZHBfbXN0X2Nvbm5lY3Rv
cl9kZXRlY3QgY2FsbA0KDQo+ZHBfbXN0X2Nvbm5lY3Rvcl9kZXRlY3QgLT5tc3QtPm1zdF9md19j
YnMtPmRldGVjdF9wb3J0X2N0eCA9IA0KPmRwX21zdF9kZXRlY3RfcG9ydCAtPmRybV9kcF9tc3Rf
ZGV0ZWN0X3BvcnQgKHdoZXJlIG1nci0+YmFzZS5sb2NrIGlzIA0KPmxvY2tlZCkgZHBfbXN0X2Zp
bmRfc2libGluZ19jb25uZWN0b3IgDQo+LT5tc3QtPm1zdF9md19jYnMtPmRldGVjdF9wb3J0X2N0
eCA9IGRwX21zdF9kZXRlY3RfcG9ydCANCj4tPmRybV9kcF9tc3RfZGV0ZWN0X3BvcnQgKGJsb2Nr
ZWQgYnkgbWdyLT5iYXNlLmxvY2spDQoNCj4NCj4gPiA+ICtmYWlsOg0KPiA+ID4gICAgIGRybV9k
cF9tc3RfdG9wb2xvZ3lfcHV0X3BvcnQocG9ydCk7DQo+ID4gPiAgICAgcmV0dXJuIHJldDsNCj4g
PiA+ICB9DQo+ID4NCj4gPiAtLQ0KPiA+IENoZWVycywNCj4gPiAgTHl1ZGUgUGF1bCAoc2hlL2hl
cikNCj4gPiAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdA0KPiA+DQo=
