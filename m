Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E06711FC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B552610E1A5;
	Wed, 18 Jan 2023 03:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F53910E1C4;
 Wed, 18 Jan 2023 03:30:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30I3AK3Q013564; Wed, 18 Jan 2023 03:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=yqFKi5sQ6odaVllkxFf1SRtPNrTdZilO+SHFQdQgDP4=;
 b=ixeg5+7JVhZnN9AbgfW2TGZxYWDv8AhEYog4D0EjukEYC0XIqPKmFO4XTNRRhXIvJeoI
 m8bu86teVzzUH6+WTx4wR6uWdaW1nY4NZP1WztpMVRtSRy3ql+RDyzTirmKnw4LXjjRG
 ERa7LhvuMBBUTL1KTUHADKzezmRKHesFPIaT+99cvCL/sKx4uh+uQnvIq6H4yBWOQnmb
 4iuRVLEybhdZbO52rI7vIj/QDuN/Bc+viwbLT9lYeh4z++fXcCO+Jy1iEUS+i1tw1tJ1
 CRmFbGt2GZ8aV3+SoC7nXYfo+nk6aNn0SrQWzI46PAN/VMpNv2KEkC1F1VJgGw06VIMc jw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n5b18b3ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 03:30:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjMk0zUmDFwqAeq0PykBJU7cIfLtyOhOR6eg+OkA8NZxO1IYNj73pr1M1HquDJEMm+Dyiv3hS3+ExJ4tHhvdl0EKAwG2odLFye0WJyBfu6rpN4CyEi8FgcAzG7ENRh6dRRAq4W/QblnceZ2fbPBrEvQMkk3QuaIbpwqGsvC0O/H3Weoe7J7tWFuKhDAhr2jrFhZ/zR3w0FKqsgYe9H6pvCmY0olac1bYF128iccwi1jeaV98rzUnIPTKiq4owzoG0WdMC6ZbBKeaBr6FDfOPIlSIubHLFJ+t2amdRApmGGk77EgzWFyfYzK7lDjJ2Fnt7KKTcUBDfBA5qHxKOO4cTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqFKi5sQ6odaVllkxFf1SRtPNrTdZilO+SHFQdQgDP4=;
 b=BtkUCwQdyjrlnL8DQ06rEyevNqxi3R3r7NMffGy0dMvLx1ORIT2+LwLrzGpucjHDJ9BIQUJfET1qaoE+ibOV4LIEcmiThM/0eZON2zkbjypmflFotF+TJKcitJ894syIT6xXS+IWgozDeO4XXik5x1rF1/fJj89uyCPyIM21tAVPx5L9LAwqETS0jZhMxD2o+X/w/NkPIQxblFCmPiYGgt1R+k/WRAbffyAu7DhRoVRfqUlV93LzE75d2ZFGit8iKPD4YosMfZWGzsiAX/cxTRZwzlFW2NPnrYNxu1zq3GpW8al5/rtWqwMAZF/QWOuusFHK3aEyhe4wGWXs+kaBVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8142.namprd02.prod.outlook.com (2603:10b6:408:16a::19)
 by DM6PR02MB6732.namprd02.prod.outlook.com (2603:10b6:5:219::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 03:30:51 +0000
Received: from BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::da70:7200:c727:d1ab]) by BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::da70:7200:c727:d1ab%9]) with mapi id 15.20.6002.013; Wed, 18 Jan 2023
 03:30:51 +0000
From: Kalyan Thota <kalyant@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Kalyan Thota
 (QUIC)" <quic_kalyant@quicinc.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "Abhinav Kumar (QUIC)"
 <quic_abhinavk@quicinc.com>, Doug Anderson <dianders@google.com>
Subject: RE: [PATCH 2/3] drm/msm/disp/dpu1: allow dspp selection for all the
 interfaces
Thread-Topic: [PATCH 2/3] drm/msm/disp/dpu1: allow dspp selection for all the
 interfaces
Thread-Index: AQHZKo/NooZGiBu2kkORTQwZCQ8wA66i1CSAgACeBQA=
Date: Wed, 18 Jan 2023 03:30:51 +0000
Message-ID: <BN0PR02MB81421A761275502A5A17AEEE96C79@BN0PR02MB8142.namprd02.prod.outlook.com>
References: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
 <1673972488-30140-3-git-send-email-quic_kalyant@quicinc.com>
 <24ef467e-24a6-fc8f-3859-95ec0ae109ae@linaro.org>
In-Reply-To: <24ef467e-24a6-fc8f-3859-95ec0ae109ae@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: dianders@google.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8142:EE_|DM6PR02MB6732:EE_
x-ms-office365-filtering-correlation-id: 6eeec4fa-9a20-46a4-387b-08daf904662a
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FFHewaLAOJuHHQC0alWAVaVO+9ebep7VO1QpxVlJw2wd2QzB+Src7b5XgNtA0vOB+THLeJKfCncODB9fdFBORlyvQBuFcy7eecoTNcUK582Mh8TTaCjaqShCzOZ1XoVFaDVGj/6/q21V+KXQu1mMF+IIXj0RFv7+aly81AL5PXgDcncdJ9M0nw3/Hq7M2Agje1OkI3pCluTPCUvf/BRnAQvFODSu0k8MDJK3U1FHM1TzkYQSXzFsm8RogwnUnIUSgXMa0qb0wLDZ18Ql75xncigqf3DeNzKEyX7pLcfoZIBBi1ZkDb8go1XAcFvD6GmRVNdCZUJVflmg8qRGacScyLEqlsEje3nMnVMBoANaHBaMvpIhbbsVpB86m7QiXCKPgX0exc/C0CLT6nM/ggBQkrAYKKOTZB1xZd+9MddnzAkUT2TTAZthj3AVtJ+ndA/QIFlTTjQL9jO+Wf+5Amp6U4OddUDfz79ad6GId/Kg29dLtfKfoDUial/D88XuYT5Yjww6Nj8LQJZGfY2/UcN27iQQWEcTK1bX0ZV42Msh+Ms2E4Xuvf/N+GA67yJ5xvz2BDiUqndZrS2HFO17TlIVleIJolCCm+kjMKaXFSdeXe+M6mRUTRYMo9fSIbSsWv/wYA9sy59hjpYnwK7PM/+cXmvm6dgKAHJyst/d2bbKi4szmnu4fPomuGjRrhIPtFGo7lwS8IlhmFoKOg18/DGClg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8142.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(451199015)(38100700002)(8676002)(86362001)(38070700005)(76116006)(2906002)(66556008)(66476007)(52536014)(4326008)(64756008)(66446008)(66946007)(8936002)(5660300002)(7416002)(55016003)(122000001)(33656002)(83380400001)(7696005)(478600001)(71200400001)(316002)(110136005)(54906003)(41300700001)(6506007)(107886003)(26005)(9686003)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzA4c0w2UkJIVDMyNmcvUVcxWUppRCtHTmhSZktGdUQreE9scGplK3JRckdC?=
 =?utf-8?B?azBTcWhzWTZaWSt4YU5PcEdjc2FmUFpINHZYY0hxUXk1TWJuaW5yRnlNMmlv?=
 =?utf-8?B?cjVlZTQ5ZDIwcGkxaFZ2SW1FZ0xiR296aG9hS3hnUHp5U1ozV0RJcXlSREM5?=
 =?utf-8?B?L3dreUF4VzBYQVdjRzJ2YmxJRitiOHpVejlIZktMK2NlbWVzbWdLRlFEVzN0?=
 =?utf-8?B?Z3k1TytZbXV3aWpTSkZXdzI3eUxJNkxzNk1PNUhpY2tXZ1Nzck9QTkZpbmFL?=
 =?utf-8?B?Nk5tcFJGRFlzR2JXTEFSdEFuc0hRNkE1Sm9ZSG11ZHBxQy90RS9tcnBsRTZO?=
 =?utf-8?B?OThEYUMwT1FLdHgzRjZIcjc4ZkNwRFFBNytxajdJMkZVbXp5QnUvaTd0K3do?=
 =?utf-8?B?bjBxZnVremRYdWJmeTdKTnBJRzRlTzN1OVp5K3JGYmMxUWFvWWJKSm96STZM?=
 =?utf-8?B?M2NuTERwbytxWk0zMUFkTU5VeGZnUzRNQlVOdjlMMTNpTWZFbzVWM0RWYU5O?=
 =?utf-8?B?ekpZTUtDVlV5YjFZRTZCcHhGb1Q2L0ZIZnJDS1l6MjZpbXRaVFBMNUVwWHBL?=
 =?utf-8?B?d085MkdGR2RSTUJ2UU5IcnRkdFdWaGwxdHNnWGtHaHBENUhSQ1FnWmV2ZEI1?=
 =?utf-8?B?ZTNKSXRFYkFSWDUxUCs0ZDVob3pUSklRdmZ4NXlxTHVBUWp4Qlp0eHh2OFp4?=
 =?utf-8?B?YXIrcVZreFFxZU0wellnZFJyNVFzd0dEQlV1dEVUSERTNE53MFQ0SkxWVlh1?=
 =?utf-8?B?STNKaUJaSDlOcFNmUmxQM1NSR3NVRFRQYlVoTTJLNkRrSE9MZDcvb2NsdGtS?=
 =?utf-8?B?Q1VTQ0ptSWt3WnUxTlNqQ2JrQmtIRGF0L2xaMUt0UXVkV0VjV1VoaXlXbVNB?=
 =?utf-8?B?RldMNHgzZHV5WGI0eHpWNStnZUVIOUlFUXU1WWFuTGt6cXJETFhMajZubGJC?=
 =?utf-8?B?NmlFQ3A0eHRwN0puTFdHMTVHNm9DUWxKVDN6YmpHajg0b2d0UkNOdDBJOEdo?=
 =?utf-8?B?WWVCU2tDS2lDT0Zpb0dtY0lUaEg1aW5MZW9CbG5KWFVlY1dVWTVVVEh4NmpL?=
 =?utf-8?B?YmlLTHk0Y2d6S2k0QUVORDNEdGJ2Vy9nTnAyM0FBOWlhRm9iNkZVVk5yY3Nx?=
 =?utf-8?B?M20yaHBzenlucW8zWEgwbmNDbnU4YUcwMUFLVTNOdHk1U0FudXpjcjVSaWFY?=
 =?utf-8?B?S05JM0JSQXd0KzVpc25URCtVNk5vRGVNOEdHKzdJS1RNSXowako0VG5OaHlz?=
 =?utf-8?B?L1UzL0RxZEkyMGJCWTdoRW1haXhWRVhGdjd0NmdHWDRQNlllakxHZmE0bE01?=
 =?utf-8?B?a1FrMGZ4Z2JTSlFjMFdWUUpnckJlbEFMK0FqcFIwdUQwdndyNHB0dG1STlN4?=
 =?utf-8?B?bG5ScmtPUUFmdFBEZVJFaXZjcTNyN3d6ZGlDaTVqdEpHV2dnYTVhdDdrS1cy?=
 =?utf-8?B?SThvOXVKMXdiMXZ6SHRmeHoya1JsVEs3WnpoSUFDbk0wUTJXdUt1NXVsVzJh?=
 =?utf-8?B?OUpNdk00RElTR0hld2kxTll6angyUGhCYkp2Q0o2cTNWdDFCRDd3aGR2WDF6?=
 =?utf-8?B?TkNjbEZKU1pZN3BRYjd5VjlRckY5aytvRllvVHNZbEh1UXhLZjJZbktibVVZ?=
 =?utf-8?B?bG12Qk5nR3MyTEdlSEl0UXU1ZUxWbmZ6b21tbW5RUTRmVzBGWUpzc2x5R3g0?=
 =?utf-8?B?VVlPS21EempwTEJGZHZCaVhqSTVZUjZ5NE9PZ0ZHd2FXM3hHYW5xaDhCcWZW?=
 =?utf-8?B?Z3hwRUxMeTZrSVdENCtMUCtsd1pLeDNYTlFaM1BWQS94TW02TlRCdlc0QnBB?=
 =?utf-8?B?UzBEMCtGN2JZcnFnMGdmWExXRXhzZm1QWG81ZTl5MFB5dkVqTmtLRVBDQURu?=
 =?utf-8?B?eUY1VExMcWlqRE11dUVrdHUrT2tscW4xRFRtZ1FVbnhIdzN3R0hTY2UzTGFR?=
 =?utf-8?B?TmhvRHVhZFhER0lXRVNreSsyM1NUMEQ2SDBSaVIzTVcyRHFSUlBIYXd3S3By?=
 =?utf-8?B?NlBtU05wQWxocHZGa2NtWjdnSnRjK0lydnFmbzZmKzMzbjA4d2Q2VThJOTVX?=
 =?utf-8?B?U0lKWGh5UUw1cnV6Z0IrVUVXY3EvWHVreXczV1lNN2I5TWl6ZktidGxLeVJK?=
 =?utf-8?Q?+Yk/9i9NpweIxJ6Nj2LWT3Amn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?QWYwT24rN2R3RlY5blZ1Tzl5YkFzcG14ZlVDbzNPeWtla0pqVHpxSnAzM0hy?=
 =?utf-8?B?TzhmSjNGSVVyTk9YcUNvRTJNN1pvRWw3QWxTU2NtZkk4dVppMGljdHltR2tB?=
 =?utf-8?B?SlJtSlk4UTdncitEQ0JVaHFYajJBTnFrOVlIdEJkMmxPV2dTSmNXSjZyR0lT?=
 =?utf-8?B?Q1ZHdVV6U0dXSWM0K2syM0VzeFVaZElMdlQrOXdoQjREUHRUN09QbWdJbmMx?=
 =?utf-8?B?em5oL1U1T3ppaDdCV2trcGZLK1RIZW85WjZ6OXlpOEI3SmZjQnpya09OSUhH?=
 =?utf-8?B?L3UxTU1vaS9sQjd3QzN4dGE2V0lKdlZvTUpBd0h6R21hZVJEYWZTaU1CejVF?=
 =?utf-8?B?bFVaSlVFZFQ5WkVOUWVZQWh0aGJXczFmMStUSnJjcGE2eTdPRjBXTzR4MzVo?=
 =?utf-8?B?YmpZZ3ZaUFlrMTNJdElDOXRMWHY5NXE0ZVdrRm9EZkhzWHIwanhBNENoOTlL?=
 =?utf-8?B?UDQ0MWRWOFAzdHhIb3BtV2xSUVovOGN0MlgvY1BXQ2hQYnRIQ0J0ZlZTa3la?=
 =?utf-8?B?b1Rzc0VWTU9ab1ZVYkJqUjVGa2ROWTZHNEZLeUdaaDY3SDFBdHhSa21CZDVr?=
 =?utf-8?B?bFZyQThGaUNLNzdhWWpiZ2YwZS9QVnVrdG8za0FzY0d4amRFa0hZTlZ0QWtM?=
 =?utf-8?B?QitMa05ITUtqcU44Y1Z0d01wZkhrOTc3S1UwMmVWWHhINE52ck42bFdrV3dI?=
 =?utf-8?B?KzhCdWg3dS8wUnZ4V0hWVmg1Ukw4YzRqREl5MXdUaE1kVWQ5bDVqWFRMSndi?=
 =?utf-8?B?QTZ0V0Fhd0YxNlBJdnZEZC85K0lqS0JlZE9zVE8wK2VuNS82eW1rRjBPbnVt?=
 =?utf-8?B?R1NuYTVuQWxhcXk2cy9FRUhwekhOQ1I0QzZwYi90a0NZU1J2ajd3djBoYzFj?=
 =?utf-8?B?ZkM1SmNPbmNPNWorZG1acmcrZm93SFJxRWMxVHU3OFp3OFcrSXNGMHVJZUNX?=
 =?utf-8?B?WnhjcGljSDRacjR1VmZXRjlYOGlmOXBta3VRMjl2ck5HVEVqRVpVM21ncVZ1?=
 =?utf-8?B?c2FFM3VOMFVFSWV1MURZWWhWUjFSbnBWVllPMk5jekQweGpJblk3Rm5vU1Na?=
 =?utf-8?B?NUNZMXJqVEJ4QTJuUjVzTzNsQWo5MVROaVIwTTNXMkw4WXhSUWo0S3ZWeUc4?=
 =?utf-8?B?QVkxVDd3bHhZbTNtSGxEODM4MkgzSjZHTjNtbFd0MENjY3d4bm5rdm1Bbm16?=
 =?utf-8?B?OTZ4VUI0eWpUUGV5S0UrY1pTZW5xTCtPV0NVZGd5TUQ1TjNjejVBbXFwTm9H?=
 =?utf-8?Q?ms6A4b7TrsQYw3a?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eeec4fa-9a20-46a4-387b-08daf904662a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 03:30:51.4951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hvb00/yMYZrfT90m7Zn1t0nzJPX03MQ8g7hfgVQDPdhIL4onNGf/qP/BYnoMoQJyXrVFPkq4wSS32MzH6ur+2XrCJYzyOpKSNdd5i9xGRi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6732
X-Proofpoint-GUID: kytCogEsTnOt93AaTQNb009aeiV-7pRO
X-Proofpoint-ORIG-GUID: kytCogEsTnOt93AaTQNb009aeiV-7pRO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_11,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=676 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301180027
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>, "Vinod
 Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IERtaXRyeSBCYXJ5c2hrb3Yg
PGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj5TZW50OiBUdWVzZGF5LCBKYW51YXJ5IDE3
LCAyMDIzIDEwOjI2IFBNDQo+VG86IEthbHlhbiBUaG90YSAoUVVJQykgPHF1aWNfa2FseWFudEBx
dWljaW5jLmNvbT47IGRyaS0NCj5kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWFy
bS1tc21Admdlci5rZXJuZWwub3JnOw0KPmZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+Q2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IHJvYmRjbGFya0BjaHJvbWl1bS5vcmc7DQo+ZGlhbmRlcnNAY2hyb21pdW0ub3JnOyBz
d2JveWRAY2hyb21pdW0ub3JnOyBWaW5vZCBQb2xpbWVyYSAoUVVJQykNCj48cXVpY192cG9saW1l
ckBxdWljaW5jLmNvbT47IEFiaGluYXYgS3VtYXIgKFFVSUMpDQo+PHF1aWNfYWJoaW5hdmtAcXVp
Y2luYy5jb20+DQo+U3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIGRybS9tc20vZGlzcC9kcHUxOiBh
bGxvdyBkc3BwIHNlbGVjdGlvbiBmb3IgYWxsIHRoZQ0KPmludGVyZmFjZXMNCj4NCj5XQVJOSU5H
OiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2Ug
YmUgd2FyeSBvZg0KPmFueSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUg
bWFjcm9zLg0KPg0KPk9uIDE3LzAxLzIwMjMgMTg6MjEsIEthbHlhbiBUaG90YSB3cm90ZToNCj4+
IEFsbG93IGRzcHBzIHRvIGJlIHBvcHVsYXRlZCBhcyBhIHJlcXVpcmVtZW50IGZvciBhbGwgdGhl
IGVuY29kZXIgdHlwZXMNCj4+IGl0IG5lZWQgbm90IGJlIGp1c3QgRFNJLiBJZiBmb3IgYW55IGVu
Y29kZXIgdGhlIGRzcHAgYWxsb2NhdGlvbg0KPj4gZG9lc24ndCBnbyB0aHJvdWdoIHRoZW4gdGhl
cmUgY2FuIGJlIGFuIG9wdGlvbiB0byBmYWxsYmFjayBmb3IgY29sb3INCj4+IGZlYXR1cmVzLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IEthbHlhbiBUaG90YSA8cXVpY19rYWx5YW50QHF1aWNpbmMu
Y29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNv
ZGVyLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jDQo+PiBpbmRleCA5YzY4MTdiLi5lMzliMzQ1IDEw
MDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIu
Yw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0K
Pj4gQEAgLTU0NSw3ICs1NDUsOCBAQCBib29sIGRwdV9lbmNvZGVyX3VzZV9kc2NfbWVyZ2Uoc3Ry
dWN0IGRybV9lbmNvZGVyDQo+KmRybV9lbmMpDQo+PiAgIHN0YXRpYyBzdHJ1Y3QgbXNtX2Rpc3Bs
YXlfdG9wb2xvZ3kgZHB1X2VuY29kZXJfZ2V0X3RvcG9sb2d5KA0KPj4gICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBkcHVfZW5jb2Rlcl92aXJ0ICpkcHVfZW5jLA0KPj4gICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBkcHVfa21zICpkcHVfa21zLA0KPj4gLSAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQ0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkNCj4NCj5JcyB0aGlzIG5ldyBh
cmd1bWVudCB1c2VkIGF0IGFsbD8NCj4NCj4+ICAgew0KPj4gICAgICAgc3RydWN0IG1zbV9kaXNw
bGF5X3RvcG9sb2d5IHRvcG9sb2d5ID0gezB9Ow0KPj4gICAgICAgaW50IGksIGludGZfY291bnQg
PSAwOw0KPj4gQEAgLTU2Myw4ICs1NjQsOSBAQCBzdGF0aWMgc3RydWN0IG1zbV9kaXNwbGF5X3Rv
cG9sb2d5DQo+ZHB1X2VuY29kZXJfZ2V0X3RvcG9sb2d5KA0KPj4gICAgICAgICogMSBMTSwgMSBJ
TlRGDQo+PiAgICAgICAgKiAyIExNLCAxIElOVEYgKHN0cmVhbSBtZXJnZSB0byBzdXBwb3J0IGhp
Z2ggcmVzb2x1dGlvbiBpbnRlcmZhY2VzKQ0KPj4gICAgICAgICoNCj4+IC0gICAgICAqIEFkZGlu
ZyBjb2xvciBibG9ja3Mgb25seSB0byBwcmltYXJ5IGludGVyZmFjZSBpZiBhdmFpbGFibGUgaW4N
Cj4+IC0gICAgICAqIHN1ZmZpY2llbnQgbnVtYmVyDQo+PiArICAgICAgKiBkc3BwIGJsb2NrcyBh
cmUgbWFkZSBvcHRpb25hbC4gSWYgUk0gbWFuYWdlciBjYW5ub3QgYWxsb2NhdGUNCj4+ICsgICAg
ICAqIGRzcHAgYmxvY2tzLCB0aGVuIHJlc2VydmF0aW9ucyB3aWxsIHN0aWxsIGdvIHRocm91Z2gg
d2l0aCBub24gZHNwcCBMTSdzDQo+PiArICAgICAgKiBzbyBhcyB0byBhbGxvdyBjb2xvciBtYW5h
Z2VtZW50IHN1cHBvcnQgdmlhIGNvbXBvc2VyDQo+PiArIGZhbGxiYWNrcw0KPj4gICAgICAgICov
DQo+DQo+Tm8sIHRoaXMgaXMgbm90IHRoZSB3YXkgdG8gZ28uDQo+DQo+Rmlyc3QsIFJNIHNob3Vs
ZCBwcmVmZXIgbm9uLURTUFAtZW5hYmxlZCBMTXMgaWYgRFNQUCBibG9ja3MgYXJlIG5vdCByZXF1
aXJlZC4NCj5SaWdodCBub3cgeW91ciBwYXRjaCBtYWtlcyBpdCBwb3NzaWJsZSB0byBhbGxvY2F0
ZSBMTXMsIHRoYXQgaGF2ZSBEU1BQIGF0dGFjaGVkLA0KPmZvciBub24tQ1RNLWVuYWJsZWQgZW5j
b2RlciBhbmQgbGF0ZXIgZmFpbCBhbGxvY2F0aW9uIG9mIERTUFAgZm9yIHRoZSBDUlRDDQo+d2hp
Y2ggaGFzIENUTSBibG9iIGF0dGFjaGVkLg0KPg0KPlNlY29uZCwgdGhlIGRlY2lzaW9uIG9uIHVz
aW5nIERTUFBzIHNob3VsZCBjb21lIGZyb20gZHB1X2NydGNfYXRvbWljX2NoZWNrKCkuDQo+UGFz
cyAnYm9vbCBuZWVkX2RzcHAnIHRvIHRoaXMgZnVuY3Rpb24gZnJvbSBkcHVfYXRvbWljX2NoZWNr
KCkuIEZhaWwgaWYgdGhlDQo+bmVlZF9kc3BwIGNvbnN0cmFpbnQgY2FuJ3QgYmUgZnVsZmlsbGVk
Lg0KPg0KV2UgbWF5IG5vdCBnZXQgY29sb3JfbWdtdF9jaGFuZ2VkIHByb3BlcnR5IHNldCBkdXJp
bmcgbW9kZXNldCBjb21taXQsIHdoZXJlIGFzIG91ciByZXNvdXJjZSBhbGxvY2F0aW9uIGhhcHBl
bnMgZHVyaW5nIG1vZGVzZXQuDQpXaXRoIHRoaXMgYXBwcm9hY2gsIGRzcHBzIHdpbGwgZ2V0IGFs
bG9jYXRlZCBvbiBmaXJzdCBjb21lIGZpcnN0IHNlcnZlIGJhc2lzDQoNCkBSb2IsIGlzIGl0IHBv
c3NpYmxlIHRvIHNlbmQgY29sb3IgbWFuYWdlbWVudCBwcm9wZXJ0eSBkdXJpbmcgbW9kZXNldCwg
aW4gdGhhdCBjYXNlLCB3ZSBjYW4gdXNlIGl0IGZvciBkc3BwIGFsbG9jYXRpb24gdG8gdGhlIGRh
dGFwYXRoLiBUaGUgY3VycmVudCBhcHByb2FjaCBkb2Vzbid0IGFzc3VtZSBpdC4NCk9uIGNocm9t
ZSBjb21wb3NpdG9yLCBJIHNlZSB0aGF0IGNvbG9yIHByb3BlcnR5IHdhcyBiZWluZyBzZXQgaW4g
dGhlIHN1YnNlcXVlbnQgY29tbWl0cyBidXQgbm90IGluIG1vZGVzZXQuDQoNCj4NCj4+ICAgICAg
IGlmIChpbnRmX2NvdW50ID09IDIpDQo+PiAgICAgICAgICAgICAgIHRvcG9sb2d5Lm51bV9sbSA9
IDI7DQo+PiBAQCAtNTczLDExICs1NzUsOSBAQCBzdGF0aWMgc3RydWN0IG1zbV9kaXNwbGF5X3Rv
cG9sb2d5DQo+ZHB1X2VuY29kZXJfZ2V0X3RvcG9sb2d5KA0KPj4gICAgICAgZWxzZQ0KPj4gICAg
ICAgICAgICAgICB0b3BvbG9neS5udW1fbG0gPSAobW9kZS0+aGRpc3BsYXkgPiBNQVhfSERJU1BM
QVlfU1BMSVQpDQo+PiA/IDIgOiAxOw0KPj4NCj4+IC0gICAgIGlmIChkcHVfZW5jLT5kaXNwX2lu
Zm8uaW50Zl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfRFNJKSB7DQo+PiAtICAgICAgICAgICAg
IGlmIChkcHVfa21zLT5jYXRhbG9nLT5kc3BwICYmDQo+PiAtICAgICAgICAgICAgICAgICAgICAg
KGRwdV9rbXMtPmNhdGFsb2ctPmRzcHBfY291bnQgPj0gdG9wb2xvZ3kubnVtX2xtKSkNCj4+IC0g
ICAgICAgICAgICAgICAgICAgICB0b3BvbG9neS5udW1fZHNwcCA9IHRvcG9sb2d5Lm51bV9sbTsN
Cj4+IC0gICAgIH0NCj4+ICsgICAgIGlmIChkcHVfa21zLT5jYXRhbG9nLT5kc3BwICYmDQo+PiAr
ICAgICAgICAgKGRwdV9rbXMtPmNhdGFsb2ctPmRzcHBfY291bnQgPj0gdG9wb2xvZ3kubnVtX2xt
KSkNCj4+ICsgICAgICAgICAgICAgdG9wb2xvZ3kubnVtX2RzcHAgPSB0b3BvbG9neS5udW1fbG07
DQo+Pg0KPj4gICAgICAgdG9wb2xvZ3kubnVtX2VuYyA9IDA7DQo+PiAgICAgICB0b3BvbG9neS5u
dW1faW50ZiA9IGludGZfY291bnQ7DQo+PiBAQCAtNjQzLDcgKzY0Myw3IEBAIHN0YXRpYyBpbnQg
ZHB1X2VuY29kZXJfdmlydF9hdG9taWNfY2hlY2soDQo+PiAgICAgICAgICAgICAgIH0NCj4+ICAg
ICAgIH0NCj4+DQo+PiAtICAgICB0b3BvbG9neSA9IGRwdV9lbmNvZGVyX2dldF90b3BvbG9neShk
cHVfZW5jLCBkcHVfa21zLCBhZGpfbW9kZSk7DQo+PiArICAgICB0b3BvbG9neSA9IGRwdV9lbmNv
ZGVyX2dldF90b3BvbG9neShkcHVfZW5jLCBkcHVfa21zLCBhZGpfbW9kZSwNCj4+ICsgY3J0Y19z
dGF0ZSk7DQo+Pg0KPj4gICAgICAgLyogUmVzZXJ2ZSBkeW5hbWljIHJlc291cmNlcyBub3cuICov
DQo+PiAgICAgICBpZiAoIXJldCkgew0KPg0KPi0tDQo+V2l0aCBiZXN0IHdpc2hlcw0KPkRtaXRy
eQ0KDQo=
