Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709A66740D6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 19:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF2A10E140;
	Thu, 19 Jan 2023 18:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3218510E0EB;
 Thu, 19 Jan 2023 18:24:56 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30JHtJJi028491; Thu, 19 Jan 2023 18:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=n3WVqO+p1dXDvLx5G1ikR5W4n8+n6RloFvyqwZaKtkk=;
 b=R19I0eEo3Q9PFLioPOWAuZPhiNI5pvEE+oJfn9b4Y3t8sW94gxiF5s/0zNW7JIGgigzM
 EdtFWWhtnCXJGc/fG2JvNrXrzMEM1SxNvAwn1/SwsxSe/ureNOR30K7a10EiJcTOufm1
 x9Vts0DBQGlrIn9szi7oFaH+GdiSBI2iKB+BN0CryKOqPsOXSnDD4gQEKwiGABsis6sr
 5dEJNF5hkWvIvVWmbrWB/RXds+RjmAoSqE15bAqqsazPrDHJy5rfP5MEH7YCGy5Ctd/a
 qbCQA6KxfGgWiCFq+ydgQY3438ktKAfQ97wcK+7Ztntxh91oOEEUM6UjQlYmYmM8HAs1 2w== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6r59an3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 18:24:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2LtpXGwn0XFo+fu5oNWRpXvwCPcJOjXhRvQz8y7n39zM+XkQ0L9ts6WPwu5UMbsdiBq8Bh4BLS6LbBZ1rHwQnZspblDtwo4A5b93lw9jJXy7wFzJ8EaHJ44wBtMc79N+5C2AcVbwZRvwwIN24d6eCQFeqowYeMcgKHM1gpsTn+kj2CQrwnLBc1WUVbHyIFdRhrv5UjH59q0AQ/pD6O7O/5MAJwZ1Jj86nNZssMk2i2DqFNiF+y4SyXG5blDQmkYBYcDdsJ5u9cZioSSE4ojBsD26TgRRTP5VRRsmAlhhkKrmx2ZAPhhxJZXnzpp2CAaj4+eNh3ivxWR0wadh+o/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3WVqO+p1dXDvLx5G1ikR5W4n8+n6RloFvyqwZaKtkk=;
 b=FL23bIBYno6lOEWRIGWbaGTJSqWJkmiK9HRdHcJ3ZV9juAZ0fqigMjqADPZ7zzd319TDxdEXKraZGHX09BKQNDo0XxDSedCzTz6+R9/vRfSSS8AImZVB35w3hlizw4RiiWLJcjW/PY9cMJhqcoDgPqFzMpzbxM6IufnH3rnwu2wLmPKTGhJA/miQcqHowdImJW8T/++18vujGuUmSZvTimh142mXdYDECo9EXdcgey+L9vy0fH8c/ZumUSetfg0YkY+iY5zJJSmXBbRx/BqakJAhtJNjLbaEbpm+ckKoujh8xNxAhXG9/kbYNmjjpCnSU4T2iUpL0ztjupf75g4nGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8142.namprd02.prod.outlook.com (2603:10b6:408:16a::19)
 by PH7PR02MB9320.namprd02.prod.outlook.com (2603:10b6:510:27e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 18:24:49 +0000
Received: from BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::da70:7200:c727:d1ab]) by BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::da70:7200:c727:d1ab%9]) with mapi id 15.20.6002.013; Thu, 19 Jan 2023
 18:24:48 +0000
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
Thread-Index: AQHZKo/NooZGiBu2kkORTQwZCQ8wA66i1CSAgACeBQCAABSLgIABgCcg
Date: Thu, 19 Jan 2023 18:24:48 +0000
Message-ID: <BN0PR02MB8142A96D71BD23CB8F5BF15096C49@BN0PR02MB8142.namprd02.prod.outlook.com>
References: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
 <1673972488-30140-3-git-send-email-quic_kalyant@quicinc.com>
 <24ef467e-24a6-fc8f-3859-95ec0ae109ae@linaro.org>
 <BN0PR02MB81421A761275502A5A17AEEE96C79@BN0PR02MB8142.namprd02.prod.outlook.com>
 <aa89eb88-f0f3-6eb7-fdcd-b7394b1a1771@linaro.org>
In-Reply-To: <aa89eb88-f0f3-6eb7-fdcd-b7394b1a1771@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8142:EE_|PH7PR02MB9320:EE_
x-ms-office365-filtering-correlation-id: c442528b-c6cb-494f-6505-08dafa4a72f2
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AqVKzmflF84FHOPI643GwcFPe91Lz85vVN+Q+oJMjg9cRrz1aB94+Z8/ou8iYlstTLoDnMrVDQGHIi94tKqa5imqZJOCP+Oj1a+Ix6zB0SyhcS1FGdoib6SZihjeeRmAD8Xmxg2WgHQ8PEVnJq+Nn8FMXti1N6Oi7VLzqETmQ06bgc07vXWDxUs/eFG9TiiCZNV4tkgeTfAXI5uPVb+WAYi2U4u7RP1PGqDLq1W9uyirmR3DD8tMwilyV2xKvsE1jVBI6JZcc86kuH8IGXFE5qradiZvSkmQPsaR3FX9k9yFl864/qdD2u4VWMPSwxtUrU5aaa8uryTQLpP1bvOErq/y7YhSkCN2gRETLFLCYAZsSRWO7v7azo7utHsO1hEI8cb+iKkLdpZItQ7w1vYabKgUHoMLiLHoyehl1qz6erchRz50bvXeCNj+5c6s+/BcLGs04HTkMEMBYSM3aBAUiL5HhklrWaFSQ6wnCELXMwtcaFLxtFQIB/aI2V6+uMYHLga7qh+81Js90V4EGfRezmgt0LNAzuQZmr1reXfc89DWOTD6lZB6GMSw5ltVIXocE++4YoH/2pPKlu1aLFrBkPxJ3M5HdOqc0+f3X8XR6dKF/PYRfnkzcuj4PMU5r+ns3PW4wR6ljGeeoNyGLID8id0bRJZFQ/LoVRHRHB5c0IwRCdvxrPVP7dufshjH3vUWHADSUYqVigxtVSnDkxT2bg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8142.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(53546011)(6506007)(186003)(26005)(9686003)(71200400001)(7696005)(107886003)(33656002)(122000001)(478600001)(54906003)(316002)(110136005)(64756008)(66446008)(66946007)(4326008)(66476007)(76116006)(66556008)(8676002)(38100700002)(41300700001)(8936002)(83380400001)(52536014)(55016003)(7416002)(2906002)(5660300002)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckNDYklMS2tCay9BUmhUK2d5U3Q5QkpWR0FXRElHYythbjFrSk9HNjRrSGRr?=
 =?utf-8?B?bGU2QXgrM1hPVEF4d2pZcE8zYTNDR21XRUF5UXh0bENiNlFXa2JGK2NyS1ky?=
 =?utf-8?B?R1lkQlJlSXhsS2dLcUx0aVFraTltK0w5aU5aRUFwbk9QZjBjbUE3T3J2VmN2?=
 =?utf-8?B?d1Nnc0s2ZUpzQm9DKytoY3VBRzRtd2pZK0N6RzM0OG5WS3I1MXU4Qm5hN21U?=
 =?utf-8?B?bk1relE0a0xoWDB5N0ZEOERtdjZQdXZ3eFh5eE55TGl1aDVBWmpnSHQ0a3cx?=
 =?utf-8?B?N0ZiOEtaeEZtNDJBNlBuYzN1Nis0UlFockZEaXpLLzBZa1YxVEJVZTRPMzR3?=
 =?utf-8?B?OExkdkR4MHpuMURYTTVremRLNFdmajNvUHlHYXdLSVA4eXZGL3VhdUx2NzdU?=
 =?utf-8?B?ZnpmSGozNGExVGVaMEQ2SmxReUNGaUZvUVU1L1ZlSFlIbk9RbXVJQndOOTZw?=
 =?utf-8?B?VlJiY1plR1VrL001VWlUYmFTSzJLMGJ3RHpUKzk5NXJYYnkzWGZsWWhBcDlO?=
 =?utf-8?B?S0l2ZjlhMmtvYStCVk44d1RNS2RZUXNEQlVDRUdhb240eVdxVjlaQ3p4RGdY?=
 =?utf-8?B?QmdzRnA4ZmttR3M1ZlFJbnBHaklXSzliZk9PcHNCbkRUR05MZEYwZTdESWJp?=
 =?utf-8?B?UHBFaXRSMWxkdUZWR2puRGRnbWJkQ3hveEdqYk42V0J2SXJCUG5lTkVjSWg5?=
 =?utf-8?B?MVl4MmtiNDJSR3JlUVZWUlFBc1BueFJrR092OVNPZG5rblQwdGNFejd6N3Vt?=
 =?utf-8?B?bjBnV1pXVU1QYW9aQmtaMlI0di9rWmFNVmNTS0g3dEFtU0xyY0lPZzdZWitu?=
 =?utf-8?B?cHFqbDI2dDJEeFdrdzI2L1g3UFpQUVpTZEpDNEJMNWxKWmV4ZmwzbGszMjhU?=
 =?utf-8?B?cDZLQURrTFFGVzF1RWUwbnNGTlVuK3NHcVZSYVp2Ykl0MTNPRnJ1UmZNSXdx?=
 =?utf-8?B?blBCT2QwL1RtS1hDaUttMVlGTGM2SnB5eWlMcGZLc3FiUDZ0UjB3anZJZUQ1?=
 =?utf-8?B?Z0pBUjhsNy9jbWdMNUdTUEszSGYwN1laMDZrS2JuNmtzajI0SHdTdW05dEx2?=
 =?utf-8?B?N3BaU291cm5BZzFLK1VESWxMQkl2YWFXSkpRdmFpKzNnUzFMY1E5TUxhVDRa?=
 =?utf-8?B?TjRvQWg4SFFZL2dVd3FLRGI4eS9xU0xBQ1FRSzl6a0Z5eFBIaG52RkNUVnc5?=
 =?utf-8?B?Wjlvd0tLcnVPNUVYQklEODBVVmlNSWZyZVJZc3Vad2lwaHl3bVZtcFJObGhQ?=
 =?utf-8?B?eWluclhpa1hLTEZjVkpQTjM3RFFIaEs1SW1yNllDa2xqdkJ3MVlyeFkxWkZj?=
 =?utf-8?B?TjltN0E1ZXNiMlN0U01Qb1hZazQ0M1FiSHhJaWhGM3RJVWRjMlQvK3FRajNK?=
 =?utf-8?B?SmM3L1N2Mnpva08vWFMyZWVpYjZjL3UrZXprRzMyVGlPbjAzU3VWUVJmVUlw?=
 =?utf-8?B?R3RMWGtnWllYdkpOdCtydmpmNHNMNzhwWEh4ZFVWdllmbyswT0x5RzQxODR5?=
 =?utf-8?B?SlkzRWVrQ29EQzBjb0IzQ0RSQ21SVm9ROFZ4ZjdoN1cydHRwQTNmTkd1OUYv?=
 =?utf-8?B?N28zYW81dkpGZHFGd20vT1E2VUlYWmY1Yjd1Wlo2cXNlNjRzRjVDa3ljTU4z?=
 =?utf-8?B?UTFZTjJESEtxczZCVzNCbWRHOEtseDhhL3VpdGQwajlhbk5WUXYrYytsekIw?=
 =?utf-8?B?aXgvTm5sVzZYNlZQR2RXQytFZE01K3ZQVi9CRDNiQmxLNDkrZFhZN3l2amxE?=
 =?utf-8?B?R1FzN05MclJuQ05HZGpVWjcvTGs5Qi91UjQya1l4NE5CbkN6RnhydjZEU1Br?=
 =?utf-8?B?bkVTUXJEWUhSOHdjVDJ0WXdMbDZnWEdCNHBsN3dYZnBkRngyaG1tTDE4TnFR?=
 =?utf-8?B?aExNTjNnNGxjREFiak9WM0FQTi9RcFc4bGtmKzBjNll1dFdENURiWkloQUFn?=
 =?utf-8?B?L0tidDhMbm1oZlhpbnRuT0hkbUlxOHgwaS81TUFjNWZlT21nZGI2OWdrQjAy?=
 =?utf-8?B?VnNBYTJJODA5MDlZS01acWJCT28yL1RwQWxSZVMyOVpMbll5Ti96blhHekdo?=
 =?utf-8?B?L1hvU0Y0WW5kRW1xWUFwRi9IRW1wbFRQclBaQjlpQ0JDc01UajgxU3pzMmY1?=
 =?utf-8?Q?skjhdK7lhEra8+Cz7468sWzTw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?TnI3cGUrb045ZU1KK1V4Q2tLblZzRWhWMSt5Z1QwOUI3d2xIUFRvRVFYOGNK?=
 =?utf-8?B?Vit4elU1ZjA4cmg5Mk1ORmYrTmltSS8vTG9tZ0UwTURoMUZQWE4rZFZMM0Jo?=
 =?utf-8?B?cGF4VVEza2VSY2tZazFJVHVIRm1PclBnMEhpNDBKdlkwcWo5eHJKTW8xdE5C?=
 =?utf-8?B?WWJvbFY0STBWVUhJbE43aC9oRG4zVENic0tXM0RzZ2Q3dlA3VHRocllkUWds?=
 =?utf-8?B?Q2NWbktWYkVOMnYrUUFLM3JKS2F4NVBxQy9jYWxsc1BGaVc0SFBJODN5S3VW?=
 =?utf-8?B?T1JvVWFSVXlSWVF0b0gxaHVLSU9nSXczc0xDYzZkOUtEZVdaZzF6dlpEZWhW?=
 =?utf-8?B?UDJGV280elFsQjNrTUtBcXQwNVZpYThWbG5TUGpucXU3VlNZdG5hbGxUcVNM?=
 =?utf-8?B?RERHc1VKb0ZVcldJd003RENiMWFZbUhBSjZhU2oraWpSMXZyWm1HdEdaSmxw?=
 =?utf-8?B?bzNlYlNMMUNkQzdnOGpjMCt2ZE1YSW1KNEwyQ0x1U1BSN2FmQU45ajFEdFlT?=
 =?utf-8?B?YXVnbXZqalNZb1NkNTB0dVJVRk1QY3AyMEFTTEE2bmJQd1NWNDZGTW9DNk5y?=
 =?utf-8?B?TDFkc0F2SjhTeUdvU1FWSGV6bVp2cVB0OVU5dmFkc1pyQ0hnTUlpSktqeU1R?=
 =?utf-8?B?ZjRjU01janRpd3Q3VGJBdUo2Wk5ta3JWUExwMFpoQ044ZUZtRUtEYWZlQjN0?=
 =?utf-8?B?Q0U5SXMxRDN2RVJPSmptNW5DUmo5QWxkZG5YckNabEE1aUJnemp4MFNrTGdU?=
 =?utf-8?B?U3QvcXJ0YTh4TUFZY0tRS1F6bVBKczRYN1pUOEhjU1V4Q21LakZjS1lxVXlx?=
 =?utf-8?B?K3NXQXFhbkpacGU4K0RoeEN4dTRsQWsrWE9vaHoxbFZIUmx2S3QxSm50N0k2?=
 =?utf-8?B?bkt1SUpkVVZ1ejZHT2lWcDM2WENTZlpvbFU3U0RCN3dYTUQ5NEl0bnhiMWpi?=
 =?utf-8?B?VTBMbkRlNTd1VHlrZUZhaXZKZktLRUljZi8vbnFvQWxuaE92UFdRYXNtN3F2?=
 =?utf-8?B?QXNmaG02Z3dqbjVBOUJkZGpmVmw3UkFFeW5kTGYrV0dwRlpMY3pnVzhLMTBO?=
 =?utf-8?B?Z1BoelV3bGYvaHN6d0JndXpMbDhtUmY2LzVRQ3l0Unp4bW0wdnIrY2twd2l5?=
 =?utf-8?B?ZGhzZWFkR3BMK1FPMTNPUFIxUzF6UVdaTXk4VzAzRWlBUTR0c2c3aEcyRlJm?=
 =?utf-8?B?czFVZEVsSHBYWWdreHdNNGVqN0Ezd09xcVRsa29RSkdaTlRsOEUwNDZSbnBD?=
 =?utf-8?Q?ASP/NbMMDWtsuUH?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c442528b-c6cb-494f-6505-08dafa4a72f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 18:24:48.8720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M1RWbbzJ3BLYooNG5BCT9zq/f8ZWJmikDV2rFirhDlffDJWeOQ+Wvzb6VayGMFbCv7KwQuNYqu1pp9xs4umOmLIwGyQRC2IHWhdFM3zSSfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB9320
X-Proofpoint-ORIG-GUID: Nh9k9201FW7I28eEgvCJLhwt5qwyFj0V
X-Proofpoint-GUID: Nh9k9201FW7I28eEgvCJLhwt5qwyFj0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_12,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=783 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301190153
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
PGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj5TZW50OiBXZWRuZXNkYXksIEphbnVhcnkg
MTgsIDIwMjMgOTowNiBBTQ0KPlRvOiBLYWx5YW4gVGhvdGEgPGthbHlhbnRAcXRpLnF1YWxjb21t
LmNvbT47IEthbHlhbiBUaG90YSAoUVVJQykNCj48cXVpY19rYWx5YW50QHF1aWNpbmMuY29tPjsg
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJtLQ0KPm1zbUB2Z2VyLmtl
cm5lbC5vcmc7IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmc7IEFiaGluYXYgS3VtYXIgKFFVSUMpDQo+PHF1aWNfYWJoaW5hdmtAcXVp
Y2luYy5jb20+OyBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0Bnb29nbGUuY29tPg0KPkNjOiBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyByb2JkY2xhcmtAY2hyb21pdW0ub3JnOw0KPmRpYW5k
ZXJzQGNocm9taXVtLm9yZzsgc3dib3lkQGNocm9taXVtLm9yZzsgVmlub2QgUG9saW1lcmEgKFFV
SUMpDQo+PHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+DQo+U3ViamVjdDogUmU6IFtQQVRDSCAy
LzNdIGRybS9tc20vZGlzcC9kcHUxOiBhbGxvdyBkc3BwIHNlbGVjdGlvbiBmb3IgYWxsIHRoZQ0K
PmludGVyZmFjZXMNCj4NCj5XQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRz
aWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeSBvZg0KPmFueSBsaW5rcyBvciBhdHRhY2ht
ZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KPg0KPk9uIDE4LzAxLzIwMjMgMDU6MzAs
IEthbHlhbiBUaG90YSB3cm90ZToNCj4+DQo+Pg0KPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+Pj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8u
b3JnPg0KPj4+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMTcsIDIwMjMgMTA6MjYgUE0NCj4+PiBU
bzogS2FseWFuIFRob3RhIChRVUlDKSA8cXVpY19rYWx5YW50QHF1aWNpbmMuY29tPjsgZHJpLQ0K
Pj4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5l
bC5vcmc7DQo+Pj4gZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmcNCj4+PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgcm9i
ZGNsYXJrQGNocm9taXVtLm9yZzsNCj4+PiBkaWFuZGVyc0BjaHJvbWl1bS5vcmc7IHN3Ym95ZEBj
aHJvbWl1bS5vcmc7IFZpbm9kIFBvbGltZXJhIChRVUlDKQ0KPj4+IDxxdWljX3Zwb2xpbWVyQHF1
aWNpbmMuY29tPjsgQWJoaW5hdiBLdW1hciAoUVVJQykNCj4+PiA8cXVpY19hYmhpbmF2a0BxdWlj
aW5jLmNvbT4NCj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gZHJtL21zbS9kaXNwL2RwdTE6
IGFsbG93IGRzcHAgc2VsZWN0aW9uIGZvcg0KPj4+IGFsbCB0aGUgaW50ZXJmYWNlcw0KPj4+DQo+
Pj4gV0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29t
bS4gUGxlYXNlIGJlDQo+Pj4gd2FyeSBvZiBhbnkgbGlua3Mgb3IgYXR0YWNobWVudHMsIGFuZCBk
byBub3QgZW5hYmxlIG1hY3Jvcy4NCj4+Pg0KPj4+IE9uIDE3LzAxLzIwMjMgMTg6MjEsIEthbHlh
biBUaG90YSB3cm90ZToNCj4+Pj4gQWxsb3cgZHNwcHMgdG8gYmUgcG9wdWxhdGVkIGFzIGEgcmVx
dWlyZW1lbnQgZm9yIGFsbCB0aGUgZW5jb2Rlcg0KPj4+PiB0eXBlcyBpdCBuZWVkIG5vdCBiZSBq
dXN0IERTSS4gSWYgZm9yIGFueSBlbmNvZGVyIHRoZSBkc3BwDQo+Pj4+IGFsbG9jYXRpb24gZG9l
c24ndCBnbyB0aHJvdWdoIHRoZW4gdGhlcmUgY2FuIGJlIGFuIG9wdGlvbiB0bw0KPj4+PiBmYWxs
YmFjayBmb3IgY29sb3IgZmVhdHVyZXMuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEthbHlh
biBUaG90YSA8cXVpY19rYWx5YW50QHF1aWNpbmMuY29tPg0KPj4+PiAtLS0NCj4+Pj4gICAgZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyB8IDE4ICsrKysrKysrKy0t
LS0tLS0tLQ0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2VuY29kZXIuYw0KPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9lbmNvZGVyLmMNCj4+Pj4gaW5kZXggOWM2ODE3Yi4uZTM5YjM0NSAxMDA2NDQNCj4+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0KPj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jDQo+Pj4+IEBA
IC01NDUsNyArNTQ1LDggQEAgYm9vbCBkcHVfZW5jb2Rlcl91c2VfZHNjX21lcmdlKHN0cnVjdA0K
Pj4+PiBkcm1fZW5jb2Rlcg0KPj4+ICpkcm1fZW5jKQ0KPj4+PiAgICBzdGF0aWMgc3RydWN0IG1z
bV9kaXNwbGF5X3RvcG9sb2d5IGRwdV9lbmNvZGVyX2dldF90b3BvbG9neSgNCj4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHB1X2VuY29kZXJfdmlydCAqZHB1X2VuYywNCj4+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHB1X2ttcyAqZHB1X2ttcywNCj4+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQ0KPj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsDQo+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUp
DQo+Pj4NCj4+PiBJcyB0aGlzIG5ldyBhcmd1bWVudCB1c2VkIGF0IGFsbD8NCj4+Pg0KPj4+PiAg
ICB7DQo+Pj4+ICAgICAgICBzdHJ1Y3QgbXNtX2Rpc3BsYXlfdG9wb2xvZ3kgdG9wb2xvZ3kgPSB7
MH07DQo+Pj4+ICAgICAgICBpbnQgaSwgaW50Zl9jb3VudCA9IDA7DQo+Pj4+IEBAIC01NjMsOCAr
NTY0LDkgQEAgc3RhdGljIHN0cnVjdCBtc21fZGlzcGxheV90b3BvbG9neQ0KPj4+IGRwdV9lbmNv
ZGVyX2dldF90b3BvbG9neSgNCj4+Pj4gICAgICAgICAqIDEgTE0sIDEgSU5URg0KPj4+PiAgICAg
ICAgICogMiBMTSwgMSBJTlRGIChzdHJlYW0gbWVyZ2UgdG8gc3VwcG9ydCBoaWdoIHJlc29sdXRp
b24gaW50ZXJmYWNlcykNCj4+Pj4gICAgICAgICAqDQo+Pj4+IC0gICAgICAqIEFkZGluZyBjb2xv
ciBibG9ja3Mgb25seSB0byBwcmltYXJ5IGludGVyZmFjZSBpZiBhdmFpbGFibGUgaW4NCj4+Pj4g
LSAgICAgICogc3VmZmljaWVudCBudW1iZXINCj4+Pj4gKyAgICAgICogZHNwcCBibG9ja3MgYXJl
IG1hZGUgb3B0aW9uYWwuIElmIFJNIG1hbmFnZXIgY2Fubm90IGFsbG9jYXRlDQo+Pj4+ICsgICAg
ICAqIGRzcHAgYmxvY2tzLCB0aGVuIHJlc2VydmF0aW9ucyB3aWxsIHN0aWxsIGdvIHRocm91Z2gg
d2l0aCBub24gZHNwcCBMTSdzDQo+Pj4+ICsgICAgICAqIHNvIGFzIHRvIGFsbG93IGNvbG9yIG1h
bmFnZW1lbnQgc3VwcG9ydCB2aWEgY29tcG9zZXINCj4+Pj4gKyBmYWxsYmFja3MNCj4+Pj4gICAg
ICAgICAqLw0KPj4+DQo+Pj4gTm8sIHRoaXMgaXMgbm90IHRoZSB3YXkgdG8gZ28uDQo+Pj4NCj4+
PiBGaXJzdCwgUk0gc2hvdWxkIHByZWZlciBub24tRFNQUC1lbmFibGVkIExNcyBpZiBEU1BQIGJs
b2NrcyBhcmUgbm90IHJlcXVpcmVkLg0KPj4+IFJpZ2h0IG5vdyB5b3VyIHBhdGNoIG1ha2VzIGl0
IHBvc3NpYmxlIHRvIGFsbG9jYXRlIExNcywgdGhhdCBoYXZlDQo+Pj4gRFNQUCBhdHRhY2hlZCwg
Zm9yIG5vbi1DVE0tZW5hYmxlZCBlbmNvZGVyIGFuZCBsYXRlciBmYWlsIGFsbG9jYXRpb24NCj4+
PiBvZiBEU1BQIGZvciB0aGUgQ1JUQyB3aGljaCBoYXMgQ1RNIGJsb2IgYXR0YWNoZWQuDQo+Pj4N
Cj4+PiBTZWNvbmQsIHRoZSBkZWNpc2lvbiBvbiB1c2luZyBEU1BQcyBzaG91bGQgY29tZSBmcm9t
DQo+ZHB1X2NydGNfYXRvbWljX2NoZWNrKCkuDQo+Pj4gUGFzcyAnYm9vbCBuZWVkX2RzcHAnIHRv
IHRoaXMgZnVuY3Rpb24gZnJvbSBkcHVfYXRvbWljX2NoZWNrKCkuIEZhaWwNCj4+PiBpZiB0aGUg
bmVlZF9kc3BwIGNvbnN0cmFpbnQgY2FuJ3QgYmUgZnVsZmlsbGVkLg0KPj4+DQo+PiBXZSBtYXkg
bm90IGdldCBjb2xvcl9tZ210X2NoYW5nZWQgcHJvcGVydHkgc2V0IGR1cmluZyBtb2Rlc2V0IGNv
bW1pdCwNCj53aGVyZSBhcyBvdXIgcmVzb3VyY2UgYWxsb2NhdGlvbiBoYXBwZW5zIGR1cmluZyBt
b2Rlc2V0Lg0KPg0KPlNvLCB5b3UgaGF2ZSB0byBmaXggdGhlIGNvbmRpdGlvbnMgdG8gcGVyZm9y
bSBMTSByZWFsbG9jYXRpb24gaWYgQ1RNIHVzYWdlIGhhcw0KPmNoYW5nZWQgKG5vdGUsIGNvbG9y
X21nbXRfY2hhbmdlZCBpcyBub3QgYSBjb3JyZWN0IG9uZSBoZXJlKS4NCj4NCklmIEkgdGFrZSB0
aGUgYWJvdmUgYXBwcm9hY2gsIHdoZXJlIHNob3VsZCBJIHVwZGF0ZSB0aGUgbmV3IHJlc2VydmF0
aW9ucyBhcyB3ZSB3b24ndCBiZSBnZXR0aW5nIGF0b21pY19tb2RlX3NldCBjYWxsYmFjayBhcyB0
aGUgY2hhbmdlIGlzIG9ubHkgdy5yLnQgY29sb3IgbWFuYWdlbWVudC4NClNlcXVlbmNlIDoNCjEp
IGF0b21pY19jaGVjayBvbiBlbmNvZGVyDQoJUmVjZWl2ZWQgYSByZXF1ZXN0IHdpdGggbm8gY3Rt
IGVuYWJsZWQgKDFMTSwgMGRzcHAsIDEgaW50ZikNCglSbSB3aWxsIHJlc2VydmUgMUxNIGFuZCAx
IGludGYNCjIpIGF0b21pY19tb2Rlc2V0IG9uIGVuY29kZXINCglVcGRhdGUgdGhlIHN0YXRlIHdp
dGggcmVzZXJ2YXRpb25zLg0KDQozKSBDb21taXQgd2l0aCBjdG0gZW5hYmxlZCAoIDEgTE0sIDEg
ZHNwcCwgMSBpbnRmKQ0KCUhlcmUgYXMgdGhlIHRvcG9sb2d5IGhhcyBjaGFuZ2VkLCBJIG5lZWQg
dG8gcmUgLSByZXNlcnZlIHRoZSByZXNvdXJjZSBmcmVlaW5nIHRoZSBlYXJsaWVyIG9uZXMuDQoJ
QnV0IHdoZXJlIHNob3VsZCBJIHVwZGF0ZSB0aGVtIHRvIHRoZSBzdGF0ZSA/IHNoYWxsIEkgZG8g
aXQgYXMgcGFydCBvZiBhdG9taWNfY2hlY2sgZm9yIHRoaXMgY2FzZSA/DQoNCj4+IFdpdGggdGhp
cyBhcHByb2FjaCwgZHNwcHMgd2lsbCBnZXQgYWxsb2NhdGVkIG9uIGZpcnN0IGNvbWUgZmlyc3Qg
c2VydmUNCj4+IGJhc2lzDQo+DQo+SSBkb24ndCB0aGluayB0aGF0IHRoaXMgaXMgd2hhdCB3ZSBo
YXZlIGFncmVlZCB1cG9uLg0KPg0KPj4gQFJvYiwgaXMgaXQgcG9zc2libGUgdG8gc2VuZCBjb2xv
ciBtYW5hZ2VtZW50IHByb3BlcnR5IGR1cmluZyBtb2Rlc2V0LCBpbg0KPnRoYXQgY2FzZSwgd2Ug
Y2FuIHVzZSBpdCBmb3IgZHNwcCBhbGxvY2F0aW9uIHRvIHRoZSBkYXRhcGF0aC4gVGhlIGN1cnJl
bnQgYXBwcm9hY2gNCj5kb2Vzbid0IGFzc3VtZSBpdC4NCj4+IE9uIGNocm9tZSBjb21wb3NpdG9y
LCBJIHNlZSB0aGF0IGNvbG9yIHByb3BlcnR5IHdhcyBiZWluZyBzZXQgaW4gdGhlDQo+c3Vic2Vx
dWVudCBjb21taXRzIGJ1dCBub3QgaW4gbW9kZXNldC4NCj4+DQo+Pj4NCj4+Pj4gICAgICAgIGlm
IChpbnRmX2NvdW50ID09IDIpDQo+Pj4+ICAgICAgICAgICAgICAgIHRvcG9sb2d5Lm51bV9sbSA9
IDI7DQo+Pj4+IEBAIC01NzMsMTEgKzU3NSw5IEBAIHN0YXRpYyBzdHJ1Y3QgbXNtX2Rpc3BsYXlf
dG9wb2xvZ3kNCj4+PiBkcHVfZW5jb2Rlcl9nZXRfdG9wb2xvZ3koDQo+Pj4+ICAgICAgICBlbHNl
DQo+Pj4+ICAgICAgICAgICAgICAgIHRvcG9sb2d5Lm51bV9sbSA9IChtb2RlLT5oZGlzcGxheSA+
DQo+Pj4+IE1BWF9IRElTUExBWV9TUExJVCkgPyAyIDogMTsNCj4+Pj4NCj4+Pj4gLSAgICAgaWYg
KGRwdV9lbmMtPmRpc3BfaW5mby5pbnRmX3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9EU0kpIHsN
Cj4+Pj4gLSAgICAgICAgICAgICBpZiAoZHB1X2ttcy0+Y2F0YWxvZy0+ZHNwcCAmJg0KPj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgKGRwdV9rbXMtPmNhdGFsb2ctPmRzcHBfY291bnQgPj0gdG9w
b2xvZ3kubnVtX2xtKSkNCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgIHRvcG9sb2d5Lm51bV9k
c3BwID0gdG9wb2xvZ3kubnVtX2xtOw0KPj4+PiAtICAgICB9DQo+Pj4+ICsgICAgIGlmIChkcHVf
a21zLT5jYXRhbG9nLT5kc3BwICYmDQo+Pj4+ICsgICAgICAgICAoZHB1X2ttcy0+Y2F0YWxvZy0+
ZHNwcF9jb3VudCA+PSB0b3BvbG9neS5udW1fbG0pKQ0KPj4+PiArICAgICAgICAgICAgIHRvcG9s
b2d5Lm51bV9kc3BwID0gdG9wb2xvZ3kubnVtX2xtOw0KPj4+Pg0KPj4+PiAgICAgICAgdG9wb2xv
Z3kubnVtX2VuYyA9IDA7DQo+Pj4+ICAgICAgICB0b3BvbG9neS5udW1faW50ZiA9IGludGZfY291
bnQ7IEBAIC02NDMsNyArNjQzLDcgQEAgc3RhdGljDQo+Pj4+IGludCBkcHVfZW5jb2Rlcl92aXJ0
X2F0b21pY19jaGVjaygNCj4+Pj4gICAgICAgICAgICAgICAgfQ0KPj4+PiAgICAgICAgfQ0KPj4+
Pg0KPj4+PiAtICAgICB0b3BvbG9neSA9IGRwdV9lbmNvZGVyX2dldF90b3BvbG9neShkcHVfZW5j
LCBkcHVfa21zLCBhZGpfbW9kZSk7DQo+Pj4+ICsgICAgIHRvcG9sb2d5ID0gZHB1X2VuY29kZXJf
Z2V0X3RvcG9sb2d5KGRwdV9lbmMsIGRwdV9rbXMsDQo+Pj4+ICsgYWRqX21vZGUsIGNydGNfc3Rh
dGUpOw0KPj4+Pg0KPj4+PiAgICAgICAgLyogUmVzZXJ2ZSBkeW5hbWljIHJlc291cmNlcyBub3cu
ICovDQo+Pj4+ICAgICAgICBpZiAoIXJldCkgew0KPj4+DQo+Pj4gLS0NCj4+PiBXaXRoIGJlc3Qg
d2lzaGVzDQo+Pj4gRG1pdHJ5DQo+Pg0KPg0KPi0tDQo+V2l0aCBiZXN0IHdpc2hlcw0KPkRtaXRy
eQ0KDQo=
