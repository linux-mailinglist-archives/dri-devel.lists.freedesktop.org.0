Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2418162C0C8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 15:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585FC10E18B;
	Wed, 16 Nov 2022 14:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F78E10E18B;
 Wed, 16 Nov 2022 14:28:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AGER6U3021144; Wed, 16 Nov 2022 14:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=V0JOedJTLDfQkCVMUc8x3q7k8cGTMnuQYVssczb2rsc=;
 b=WGXODeeYkH/XGxVYcw9geJWuQRHPDmsDXTACwC/fu8x3EqYbu0cnylDv99tKVsyOBsO4
 FhkhoT/2tb6RuwEtun48Utw9uIPiWQiW+cbUTzWPGQAZYR4Y0PPEIvi6ZfTqSruScglb
 VzkC14XFaQXFt12zUZxD5HWF525cAgiTK3uQ96sv8M59aBtDGY4hrZMto6HG5v3zqjbf
 iwBhkHD9KFn81PAZsUOmKYbV4gHuQgNx/sPzee4EOkSPkF0WZKqDVy91+fWgvyezyYAF
 l8ePmazWN8sWKt9lVY5DAxbck/cGIjcK1xtRvyeTTFmATfmt1j00+C2XE2SkEM5OHYoq qQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kw03285mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 14:28:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZznXD2M4M/dvSVmnKrs6/KHDSzpRFnboKflJChmOcDQphQb9BEgHB/pjlbd1UZ8padrokkq5pbpS5zGgGZdx5UlgpK695ZTddllU51+RvyOadqpA6leECi2DZqmCjDNY7A5DimOeFiS658IEqn4Wt7YPkFp93CZNRENCW1sjZxixRli1sCDiljQqNLMDu4mmQe+BHMsye2W9LYrpo9I/8eKc3CV/oVeidtKDWka4E4cofZn3iDO2uNVYfU98MqaNZjgBNkB9Bh+PXD0WeWrbOUa+6YARA0Jx5qBm81OJ4kSSjbTIliWUWI75U9cJJ5ORSzFpWR32DvT08SU1dTc/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0JOedJTLDfQkCVMUc8x3q7k8cGTMnuQYVssczb2rsc=;
 b=EvjW0r//MyZiLrdPRcrUQjTcjFHWzrH7DqvTpcfuZAYSC35tVFziPsd+maNriqkjYejNzCFh/bXKiMJWS37ZYinvaTX6gLxBbznJsMxG+AVuXxlef+mDWy8gwKlxs0QzlcO1TlVq1pLUnyJdntUbFtMI2JNDf792wszrfvjsTXCUv8NFN3mg7tnqZHiw/X/6k1/9RcDlZIxnW58tcL/S9L1MqG3vkDOCp6wBt47taGqXYfGJut+xM73k9vm/7FbmBfakYM9R0WB2KnJCTfJaXsG0G/68yrmoezcVIdX0lngvmMsCzrS5ZUXDQFSyLfuvR7fRLvj5qhUZ3XaRgxyvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8142.namprd02.prod.outlook.com (2603:10b6:408:16a::19)
 by IA1PR02MB8876.namprd02.prod.outlook.com (2603:10b6:208:388::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 16 Nov
 2022 14:28:36 +0000
Received: from BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::60f2:dd20:67dc:8baf]) by BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::60f2:dd20:67dc:8baf%9]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 14:28:36 +0000
From: Kalyan Thota <kalyant@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Kalyan Thota
 (QUIC)" <quic_kalyant@quicinc.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: RE: [v1] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
Thread-Topic: [v1] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
Thread-Index: AQHY9dVnGv9M76O0XEGRuTbDWXVzI646TBMAgAdXXQA=
Date: Wed, 16 Nov 2022 14:28:36 +0000
Message-ID: <BN0PR02MB8142DB1BD982337D173C055F96079@BN0PR02MB8142.namprd02.prod.outlook.com>
References: <1668174978-10676-1-git-send-email-quic_kalyant@quicinc.com>
 <ed2050c9-3e5f-ef97-a399-c9dc0427f32d@linaro.org>
In-Reply-To: <ed2050c9-3e5f-ef97-a399-c9dc0427f32d@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8142:EE_|IA1PR02MB8876:EE_
x-ms-office365-filtering-correlation-id: 9640fe30-a6ca-408e-dea2-08dac7ded92f
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SIA3BF2SxdJI39HqDbRqJjuL598Y6tkUuJFfBsshvtw4RGRTjH6Dk3RFMT/7UufmZ3iBnnwCmM6FgBLeXqfy7p1mspMUD5hGu9dyxEa16Pb8fI96qM+6zxYCt4cTqe4C1RX1x9Z3H/IGWy4EgrhPTJfhk0sijhyoHBjuz3SpBJ/mUnCrj3BDI8rLZ+Wb2GXCv9CDE42Xr8dKl6sSvcTfR1Ddwr0s0YUv4uQ5um6nj1aRJ1/W6JwYmfHK/U9elT9OfQ0CykUEl3uQ+xX8UcXv2TJqR2Cf2yf90AHPehF7C1+ClRoBlHpa7KrG874uA/1dO/G0IV27v4XbxFyZ6pHD6TRIA7awSTW0XHH+nxdHkocKmVf2gGOYkCLx9ydzr1Ha8A9+oWsbnjhw0D61iLlHDMj8GVs5F/WvNGgjAN5M6KHYh5XozUd0ZyJtn6hM+2/ye2S9zDqyY2yAz67+fWZlJxH0w940+Q4mE78e47DLOT/SEhmFmvoWpTr82iMevGC/6JCRCBB1moCfBzU/t4X4UWStpnmkte65IGCVkF/hjHzIO/qXGzifhCsS47ItjvV7RimLm5r/YsxDrvR2Qrfh3T3NgqAVL7ugjJoZoVaxxZn4s1SBiP+pMmiYqRofAaRqbN3hPkS6vSk3b1Bblmk+pqW27f3fA7EA52l3bVz8YLZ6mkaJf0GGONDfY084or7Ig7ALasvSZEVgiBKoAuzp2dHz5sg53EqpeOFB1ZiqnBm6xWpOh/1vRvJn0dm2rHGaeZbgXG1B1e0zYfJ+CbTxqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8142.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199015)(478600001)(33656002)(4326008)(71200400001)(38070700005)(110136005)(54906003)(107886003)(66446008)(2906002)(52536014)(83380400001)(186003)(6506007)(7696005)(316002)(86362001)(5660300002)(64756008)(76116006)(9686003)(55016003)(26005)(38100700002)(8936002)(66946007)(122000001)(8676002)(66476007)(66556008)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXJvOTNrOWRrZytWNFJBbEF6ZUNyclZ1aCtYenJOSk5jajEyUm9WQW9NSnZD?=
 =?utf-8?B?bEFDR0MxaXBVK3UvSWdJaUgzK2dDdHlZMFdiU3hYYVdvV3RWTTlwR2VESW5B?=
 =?utf-8?B?WFFaRUVaWUE5cjgvRnpqNGZMQ1o1UmdkbjRzb3BDdjUyWEN3ZCtRUyt2dzE1?=
 =?utf-8?B?UTdJdWY5N0NwMWtXaU5aZnc5aGt4TkFZYkFUeUxxOThrMHZPdXd5djFuVWw5?=
 =?utf-8?B?Rnk3VW5Db2pVbkw3ZHh3SDZaRHhUcFJNcThUMk5CbDl4NjRxVVcxaU84eEh0?=
 =?utf-8?B?N3g4RlZMK1NzWTFsVjZNbEIvNTVFZ0JTaVNXSnFCVjVkZk5yY2MwRXpBYUUr?=
 =?utf-8?B?a0lOT3JpMndGa1Jkdkh4cWJtcUNpUkJ2NzJCc2FEK3FEbE00TW1EekFIY3Rq?=
 =?utf-8?B?Yk1uQmdiZkNRWGRvdHNDdHhiRTJmNzVlSUV1Mml4cXlzdVpuY2wwekFmK2J0?=
 =?utf-8?B?Y0t1Zlhnc0ZNUFlGcFR6elU0ZWUzOWltaER3RGdMS3lpV1VTbWdFUHJET29E?=
 =?utf-8?B?cm9FQWNuRUhXMlBFWFVHbFh4Z0lLN2hYTHlQaTZOZ2R4cW8yaGh6Z1dQNmw3?=
 =?utf-8?B?SXJBQ1o2dER3MEdUR0k3ZnlkWjMvc1hhNUVHdFdSSXp2Ni9RNUR1QXpaUkVq?=
 =?utf-8?B?NjAwUG5iMjBJTlB6NE1WSk9RdEdCZG9RTGFNQW1BUjJZSENlUGgrL1MyNlVv?=
 =?utf-8?B?TXZHNWtoMjFUK0xuVjJmazRna0p5VjVuZm12VEVLQ21Hd0NKVm51dmRCTStx?=
 =?utf-8?B?V2daczRjL1B0OGtTLzZQYmpKRGF4VTQ5R3diY0dGN0lNeEdOQ2V2REwxMjk5?=
 =?utf-8?B?UXlVYm1zeUpHQm1iQ3hDNGdPaFlhNVdka2pMNUVzVkltNGx4VURyeE1CS1cz?=
 =?utf-8?B?R2xhV3NKMy9uSXdRelBnaTdNVUlZdWtsL2Z3cXhLdXRhTDE1NlhUMDBNZFdN?=
 =?utf-8?B?OUNHeDZ0VG0yUDd1dGI4MGUwOUFKRStLVVM1MW9OK0RkWnVSTDliZjZGTmFZ?=
 =?utf-8?B?K3VVMmp1bHFZbGMvaCthTUdObjdReWFzZk00b1g3WFp2Y3pLbzEwdjRDcHBL?=
 =?utf-8?B?N1hYd2ZLUmd5UzREclFUanZCU2ZDUXVJb0xCZ1lPcUt4Tm5TMVZrODd0NCtH?=
 =?utf-8?B?REtDZk1oK05qRFFxOC9qSXBsSzFpWVNBeTcrQm5vY0ZJcmtxc0FHUXRKU2Ur?=
 =?utf-8?B?b2lHSE1DS3lQN0luRUhhVE1aYzNzZ3J2TWlWMXBDM0pzN3llVWZHbGRKYkg0?=
 =?utf-8?B?OElvdDZQekpaMlJ5SnFqaHVUZ2ZLU0hYZGo4ZXpTZ1FYT08waVZzMjlNV1N1?=
 =?utf-8?B?blVTa0JKaXE0eHJaUzM4dDQ0eTd4VjFDbUZkVDhvZWFYY28xaGpPalJTL1Vi?=
 =?utf-8?B?dklvcERVZExKcnNiZDd1U0VKVUtHZURqeW96VHY1R2FmS0VUQkV6SE5LTU1i?=
 =?utf-8?B?U1VySm14U3dGVFVqbGl2SHArQ0FGSG4ySUV2NytiZkt0NDVuU0NSM0xsQVdl?=
 =?utf-8?B?cGUwTlZTZ2pZYU05Tzl6VkRRbWtHUXZaRGUzOGNOT1hiUU1xOEVvL3ppNExl?=
 =?utf-8?B?djd6Q3pObkFLQ1JWd3BYWlhYWis0Q01MM0FMcGNxL09NVlF2UVV0NjRYNFEz?=
 =?utf-8?B?OERRMGhHU1R2RXlZNVhsSjBLYWE3dFhyVThPRHk2Vi92YmVNL05SMWNFRmdK?=
 =?utf-8?B?dndMblg5am9mbW03NjJkalQ3RWlMdURtMWIvbUQ2bkRJNXUwbkkwMVNOWXNq?=
 =?utf-8?B?bHRLdndoVVlEV0hpdjJ2Ujk5dUg5OE1tSjZRS2luQWhyeTdhRUJlMDBiU3pM?=
 =?utf-8?B?MFZLK2NoVzZqdmNITThKaHhGZTlFR05pOENxaGdFK29Mb0JGZ0laVnFGWGwr?=
 =?utf-8?B?aEt1RzR6WTI2Z2t2aUdvWTA3TGVwUWNxZjFQWFptenZhOWJDZjE0czZOcWp2?=
 =?utf-8?B?dVArU0V2eVZFQkc3dDJOcTNsWWs0dFNQQXgxOVFPdmtpajhka0l0YjlrdjJW?=
 =?utf-8?B?NVdBRFVpR2o2WWcwejdQZUZVeHZtM0JiaFJJazVVQXQ0L1gwS0pBSkh0S0xq?=
 =?utf-8?B?c1BBck41MGZSREFXbDFpcFg3dGIySlIwc0M0Zlk0bWNGc0hNSS9PdTAvYVpR?=
 =?utf-8?B?NWU1RllYQXdlYXhRMlRNOU1DbDlhV040RENuNks1Zk9hR2lvVWorRS8xS1JM?=
 =?utf-8?B?S2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?bkt5VE1PdW9BZHZLOEV0QTQyaVlaQW9NN3FpZk1ram5UdnU5eGxnLzN5dE4y?=
 =?utf-8?B?eWpzNzNhLytZVGFjNHlNTEVxZExhSXVKRVJXaWtacW0wU3BSVXl5WmVhb3JU?=
 =?utf-8?B?eGlPK1dWc3A1dm1JUjZJZjB5b3hIREhjU3ltNk1OZlRSVXJGRmdyWmRweVVS?=
 =?utf-8?B?ZGJ5blRsK2ZxeU1zR0M2eFIrNitpVU9CMnBkdW4waENiSHdoeHNJWGRnYlpW?=
 =?utf-8?B?NEZyMlA0K1lOazZ2VjhKYWtvVlc0RlA5VlJiSWw0SXg5UnAxbXpWTzREdGhR?=
 =?utf-8?B?Zlp0cjhsNlhkdjh6NWJrK0Frb0I5Tml3WGlGWWozVXQzTXRFN1huV3NDVmtw?=
 =?utf-8?B?bnRoREZTd0krV1ZHR3VrbXRETTM5U2JxaFo0ZmlSSnkxQmtHZXNwSERYbjVK?=
 =?utf-8?B?RndXWXBZSElmdGpwbVRFaUJweURBQ09TNnhsZUhMbXVaVW5TQkFtY0tTYjND?=
 =?utf-8?B?OTJ6M01yZjNHMk9DUFNIa0ZSWG94ckJaK0NSa1BLK2N4OTQ2TVBIR1RQeVE1?=
 =?utf-8?B?NGNSbEx1MmVEQzNXdFhnaXlQSDd3Zm84N1B3dzM0aDZhZ3p0ZDRScXVOUnFo?=
 =?utf-8?B?cmVxZzNIRGNJZkxWbzRxUm81bmhKNlVicVpmVDBaWG53RjI5MzJvL0ZrNkR2?=
 =?utf-8?B?eEpnbmxYWThtRHpDOWdTMURPb2VWNEpDcUJpNGJJSmdGK2l5TkIvemRheDFU?=
 =?utf-8?B?cnRuRW5BeHdvOU5QV3lnWkkwZmxlM2tITmEycVhFRDROZVF2WUVNNlY3Nzc5?=
 =?utf-8?B?Vkxyai9hc2FhcE92ZmN5dmhObzEwb29zU0NSbjBBQmdoQWdxRzdoaU5XcmVz?=
 =?utf-8?B?MFM1eDZXZXg4dndnRk1yZmZBUkp4bTNsckphOWpDVUZzK3lra0ZWd1cwT0Zq?=
 =?utf-8?B?WTJWUHhSTHptNVNKOVB4akFBeXB1cUI1M3cxbDNDNlp6UVpwTWR4OCtHbExs?=
 =?utf-8?B?MXFpZ0FRdUN3RDNGZElkMW1nZS96d0pzajhqcGtYSkQ5K2h6U1pmM1JFS2tL?=
 =?utf-8?B?ZkNwdlBzOSt4VWNkaEwvdXlENC8zd2ZSdlFjSUZyVU1FR0pJNWkwWk9FRFZJ?=
 =?utf-8?B?N2lodlFjdFNiOWRMa3R2ZFF5a1ZLZndVcmNjUTVsU1o1VXFxbEpMV0xvcis0?=
 =?utf-8?B?aFlCNWJTZFN0dGVJb1dNMkxMRnNrL2x6VVh0M2xuaHViRzEwV1ZmcDQ4UFJL?=
 =?utf-8?B?RnN0VjN4aVVqeUk1QWFyeDg2U0lDK3RNbHZGUTBMa0pINXVnY1RMaEtJRTJV?=
 =?utf-8?B?bG5rNVg2Y1pjUW1mY0t0dyszbXpodXE0Znd5cDZnNzkzTDIzMDd6K1I2cWxD?=
 =?utf-8?B?TklSbnhhSXk5V05mZ2VkODBOZGM5V3VoOUMzdkNkR0hRajZpWFRVcUx6NVZv?=
 =?utf-8?B?YlJiQXMrNmJMY0NBb0xJSUo2YUJsUXRlelk5cHNNdDVldDRHQmorNzBDcnZ4?=
 =?utf-8?B?cGx1N2JRV2NzaFBtaEtkdVlIRHdoUXRhMDczNHRvWndxeDN6cDBzSGZGOGxH?=
 =?utf-8?Q?OJieLw=3D?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9640fe30-a6ca-408e-dea2-08dac7ded92f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 14:28:36.6181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ea0R88kt8Cjv6wj9018Oi/6+HWvla59D1nHjnz88ErZd38U/jCQ186xWc07yOvFugQuMRMUfBOYjwMuTmQwPF1SOFAv1U67BvH0EZH5fjZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB8876
X-Proofpoint-ORIG-GUID: hgBh5vh3q6uNuk3ECXBUP49UuxyiUl6i
X-Proofpoint-GUID: hgBh5vh3q6uNuk3ECXBUP49UuxyiUl6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211160100
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
 "dianders@chromium.org" <dianders@chromium.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vinod
 Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IERtaXRyeSBCYXJ5c2hrb3Yg
PGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj5TZW50OiBTYXR1cmRheSwgTm92ZW1iZXIg
MTIsIDIwMjIgMzo1MSBBTQ0KPlRvOiBLYWx5YW4gVGhvdGEgKFFVSUMpIDxxdWljX2thbHlhbnRA
cXVpY2luYy5jb20+OyBkcmktDQo+ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1h
cm0tbXNtQHZnZXIua2VybmVsLm9yZzsNCj5mcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyByb2JkY2xhcmtAY2hyb21pdW0ub3JnOw0KPmRpYW5kZXJzQGNocm9taXVtLm9yZzsg
c3dib3lkQGNocm9taXVtLm9yZzsgVmlub2QgUG9saW1lcmEgKFFVSUMpDQo+PHF1aWNfdnBvbGlt
ZXJAcXVpY2luYy5jb20+OyBBYmhpbmF2IEt1bWFyIChRVUlDKQ0KPjxxdWljX2FiaGluYXZrQHF1
aWNpbmMuY29tPg0KPlN1YmplY3Q6IFJlOiBbdjFdIGRybS9tc20vZGlzcC9kcHUxOiBwaW4gMSBj
cnRjIHRvIDEgZW5jb2Rlcg0KPg0KPldBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9t
IG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5IG9mDQo+YW55IGxpbmtzIG9yIGF0
dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+DQo+T24gMTEvMTEvMjAyMiAx
Njo1NiwgS2FseWFuIFRob3RhIHdyb3RlOg0KPj4gUGluIGVhY2ggY3J0YyB3aXRoIG9uZSBlbmNv
ZGVyLiBUaGlzIGFycmFuZ2VtZW50IHdpbGwgZGlzYWxsb3cgY3J0Yw0KPj4gc3dpdGNoaW5nIGJl
dHdlZW4gZW5jb2RlcnMgYW5kIGFsc28gd2lsbCBmYWNpbGl0YXRlIHRvIGFkdmVydGlzZQ0KPj4g
Y2VydGFpbiBmZWF0dXJlcyBvbiBjcnRjIGJhc2VkIG9uIGVuY29kZXIgdHlwZS4NCj4+DQo+PiBD
aGFuZ2VzIGluIHYxOg0KPj4gLSB1c2UgZHJtX2Zvcl9lYWNoX2VuY29kZXIgbWFjcm8gd2hpbGUg
aXRlcmF0aW5nIHRocm91Z2gNCj4+ICAgIGVuY29kZXIgbGlzdCAoRG1pdHJ5KQ0KPg0KPkJUVzog
aWYgdGhlc2UgcGF0Y2hlcyBmb3JtIGEgc2VyaWVzLCBwbGVhc2Ugc2VuZCB0aGVtIHNvLg0KPg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IEthbHlhbiBUaG90YSA8cXVpY19rYWx5YW50QHF1aWNpbmMu
Y29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMu
YyB8IDIxICsrKysrKysrKysrLS0tLS0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfa21zLmMNCj4+IGluZGV4IDdhNWZhYmMuLjBkOTRlZWMwZCAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYw0KPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jDQo+PiBAQCAtNzk4LDE5
ICs3OTgsMjAgQEAgc3RhdGljIGludCBfZHB1X2ttc19kcm1fb2JqX2luaXQoc3RydWN0IGRwdV9r
bXMNCj4qZHB1X2ttcykNCj4+ICAgICAgIG1heF9jcnRjX2NvdW50ID0gbWluKG1heF9jcnRjX2Nv
dW50LCBwcmltYXJ5X3BsYW5lc19pZHgpOw0KPj4NCj4+ICAgICAgIC8qIENyZWF0ZSBvbmUgQ1JU
QyBwZXIgZW5jb2RlciAqLw0KPj4gLSAgICAgZm9yIChpID0gMDsgaSA8IG1heF9jcnRjX2NvdW50
OyBpKyspIHsNCj4+IC0gICAgICAgICAgICAgY3J0YyA9IGRwdV9jcnRjX2luaXQoZGV2LCBwcmlt
YXJ5X3BsYW5lc1tpXSwgY3Vyc29yX3BsYW5lc1tpXSk7DQo+PiAtICAgICAgICAgICAgIGlmIChJ
U19FUlIoY3J0YykpIHsNCj4+IC0gICAgICAgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGNy
dGMpOw0KPj4gLSAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+PiArICAgICBpID0g
MDsNCj4+ICsgICAgIGRybV9mb3JfZWFjaF9lbmNvZGVyKGVuY29kZXIsIGRldikgew0KPj4gKyAg
ICAgICAgICAgICBpZiAoaSA8IG1heF9jcnRjX2NvdW50KSB7DQo+DQo+V2hhdCBpZiBtYXhfY3J0
Y19jb3VudGVyIDwgbnVtX2VuY29kZXJzPyBJIHRoaW5rIHdlIHNob3VsZCBkaXNhbGxvdyBzdWNo
DQo+Y29uZmlndXJhdGlvbi4gQ2FuIGl0IGhhcHBlbiBvbiBhbnkgb2YgcmVsZXZhbnQgcGxhdGZv
cm1zPw0KPg0KWWVzLCB3ZSBkb24ndCBuZWVkIHRoZSBiZWxvdyBjaGVja3MgYWNjb3VudGluZyBm
b3IgY3J0YyBhcyBhbGwgdGhlIHBsYXRmb3JtcyBpbiB0aGUgY2F0YWxvZyBoYXMgc3VmZmljaWVu
dCByZXNvdXJjZXMuDQoNCm1heF9jcnRjX2NvdW50ID0gbWluKGNhdGFsb2ctPm1peGVyX2NvdW50
LCBudW1fZW5jb2RlcnMpOyANCglUaGlzIGNoZWNrIGlzIG5vdCBuZWVkZWQsIGFzIG1peGVyIHJl
c291cmNlIGFsbG9jYXRpb24gd2lsbCBoYXBwZW4gYXQgbGF0ZXIgdGltZSwgZXZlbiB0aG91Z2gg
eW91IGhhdmUgbGVzcyBtaXhlcnMgdGhhbiBlbmNvZGVycywgb25lIGNhbiB0dXJuIG9mZg0KCXRo
ZSBjcnRjIGFuZCBnZXQgdGhlIG1peGVycyBiYWNrIHRvIGZyZWUgcG9vbC4NCgkNCm1heF9jcnRj
X2NvdW50ID0gbWluKG1heF9jcnRjX2NvdW50LCBwcmltYXJ5X3BsYW5lc19pZHgpOw0KCUEgc2Fm
ZXR5IGNoZWNrLCBidXQgbW9zdGx5LCBhbGwgdGhlIHBsYXRmb3JtcyBhcmUgZW5zdXJlZCB0aGF0
IGF0IGxlYXN0IDEgcHJpbWFyeSBwbGFuZSBpcyBhdmFpbGFibGUgcGVyIGludGVyZmFjZS4NCgl3
aWxsIGFkZCBXQVJOIE9OIGFkZGl0aW9uYWxseQ0KDQo+PiArICAgICAgICAgICAgICAgICAgICAg
Y3J0YyA9IGRwdV9jcnRjX2luaXQoZGV2LCBwcmltYXJ5X3BsYW5lc1tpXSwgY3Vyc29yX3BsYW5l
c1tpXSk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgaWYgKElTX0VSUihjcnRjKSkgew0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gUFRSX0VSUihjcnRjKTsNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+PiArICAgICAgICAgICAg
ICAgICAgICAgfQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHByaXYtPmNydGNzW3ByaXYtPm51
bV9jcnRjcysrXSA9IGNydGM7DQo+PiArICAgICAgICAgICAgICAgICAgICAgZW5jb2Rlci0+cG9z
c2libGVfY3J0Y3MgPSAxIDw8DQo+PiArIGRybV9jcnRjX2luZGV4KGNydGMpOw0KPj4gICAgICAg
ICAgICAgICB9DQo+PiAtICAgICAgICAgICAgIHByaXYtPmNydGNzW3ByaXYtPm51bV9jcnRjcysr
XSA9IGNydGM7DQo+PiArICAgICAgICAgICAgIGkrKzsNCj4+ICAgICAgIH0NCj4+DQo+PiAtICAg
ICAvKiBBbGwgQ1JUQ3MgYXJlIGNvbXBhdGlibGUgd2l0aCBhbGwgZW5jb2RlcnMgKi8NCj4+IC0g
ICAgIGRybV9mb3JfZWFjaF9lbmNvZGVyKGVuY29kZXIsIGRldikNCj4+IC0gICAgICAgICAgICAg
ZW5jb2Rlci0+cG9zc2libGVfY3J0Y3MgPSAoMSA8PCBwcml2LT5udW1fY3J0Y3MpIC0gMTsNCj4+
IC0NCj4+ICAgICAgIHJldHVybiAwOw0KPj4gICB9DQo+Pg0KPg0KPi0tDQo+V2l0aCBiZXN0IHdp
c2hlcw0KPkRtaXRyeQ0KDQo=
