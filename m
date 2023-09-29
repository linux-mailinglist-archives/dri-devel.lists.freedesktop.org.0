Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA057B2AFF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 06:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2B910E6BC;
	Fri, 29 Sep 2023 04:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30DB10E6BC
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 04:44:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38T48mLc003358; Fri, 29 Sep 2023 04:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=hjZTImSpoqXZR+wrQLxxmy/yjNhwaHmj+fUxWwrlo1w=;
 b=W3EDWFRs8zRCOy99zX8TUOBhHt5kKpYya/OGiEL7YY8hLIg1mwVLkso8HN97tRO8Db/T
 pfFADTJnqSbpR723rV9k8IdI7w8fJIrvOOSQhb9MZ0jpyPh4F61ikzvamomL7rSxZFvl
 K1fCqz64TQalT74lOEXCBir6etkBxlVs2D2P+3PgK385LrTi2dTrE1oVZFtjRsYjSNj+
 1OYiIoJ1EbYJke5tSw+Ij1l3Hr84tjIbLzZZP6oWm4CsLfWztP+tiGwkxEqsW41Lu3Zv
 3XMhcBkeJsq8x5jcyQGGwimRutTuzaXQaFGlxTyTCdN2vPEr6HzlV6/3ff5gFluWIjdL EA== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3td24uakd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Sep 2023 04:44:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J58lkwHBsMuXTGttdJH77G1kpWEHxH+SXmuHjyfAgnBUWV51/gOs5YfWAce5+ECKE7HrRjBQ90RfIJso95jLkA0tAt6m2XpljsrKpSQ8b5GmRSczZZ1AthxIqS5PwqsuWAArrqhSCtaVJQgq0hrJKYIqbhXnvyZ+0mOFq5WNL0focQ7dmAdga5hyq8tzaU9tHCH38FvJLwEfrKzTn4bXPnzynDokmE6CyKaEkJdmrr7mZ/uaXV7Ec9FmnGM6BIQfIaGrRWe18dazt6gT47Qa+pwdNisonUYchX2cgM50wW3gxrca80NSkIA5ZsZYLX6XsmnMUFiX0rugUQOdVNC+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjZTImSpoqXZR+wrQLxxmy/yjNhwaHmj+fUxWwrlo1w=;
 b=EzlvLTt6cxuySYLR9Pd4y+Pg+800moS8PPjJlIoKIo8nJXhevRH+IM2pwxt5Pf+wXX+KkSgXcXt785oeQpxDdwA19oIRt13U2KXZYfonF+n264oogVIXMFk0iyFxSzq/9t1JRblQA41HTos0WnpAkDSmLNAmoo8VZ49rJXGZgP/qx67l//6EB7Vm49J+Yo+n7Q3wjF21Q47rH1+yVL9Q75ev+QupuatXp6ksRC84gRb+2gSaqYlfCoOsELqV6FM3rjAibd/EGVn4eT/Jy/TXgoUBRg+c1+iRQ0vWJ43PWUPYxAAQY5VwT6IkrYq7E/6XC9tPYWUxRPDbxcdaBMHL1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB7951.namprd02.prod.outlook.com (2603:10b6:408:169::8)
 by SJ2PR02MB9850.namprd02.prod.outlook.com (2603:10b6:a03:537::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 04:44:04 +0000
Received: from BN0PR02MB7951.namprd02.prod.outlook.com
 ([fe80::ed2:9f26:8ab:82fc]) by BN0PR02MB7951.namprd02.prod.outlook.com
 ([fe80::ed2:9f26:8ab:82fc%4]) with mapi id 15.20.6813.027; Fri, 29 Sep 2023
 04:44:03 +0000
From: Ramya SR <rsr@qti.qualcomm.com>
To: Alex Deucher <alexdeucher@gmail.com>, "imre.deak@intel.com"
 <imre.deak@intel.com>
Subject: RE: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
Thread-Topic: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
Thread-Index: AQHZ55DQhVb08bi8cEKL8zMH3hln2LAnP4GAgAAFlICABGzqAIABSYSwgAKbHWCAAbk60A==
Date: Fri, 29 Sep 2023 04:44:03 +0000
Message-ID: <BN0PR02MB79512718F046A8C88BE359F181C0A@BN0PR02MB7951.namprd02.prod.outlook.com>
References: <1694753689-29782-1-git-send-email-quic_rsr@quicinc.com>
 <19ce2cd9abfd3bdf3ea91f9bceb43206e4740c2e.camel@redhat.com>
 <ZQ3pbVHRXMiLfUCf@ideak-desk.fi.intel.com>
 <CADnq5_NQnQoheKv39DiuLjKY3Z83WpesrFRUO4FMdrn=YPhnSQ@mail.gmail.com>
 <BN0PR02MB79517B267D593DC484BA34DF81C3A@BN0PR02MB7951.namprd02.prod.outlook.com>
 <BN0PR02MB7951FFEB16011D2B1D3DA75181C1A@BN0PR02MB7951.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB7951FFEB16011D2B1D3DA75181C1A@BN0PR02MB7951.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB7951:EE_|SJ2PR02MB9850:EE_
x-ms-office365-filtering-correlation-id: 308c2bcb-a306-4250-513f-08dbc0a6b4c2
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u0g3gzlpMC3NyCUluaglTFZFGSE0fI0YOBQhSO+iG0GTxdOBQedZ04feoOagiCfGOV9gNisVNoLcv0EA9oRkrhMPso4SiZr54QTjZEr1MXFu7xBT6c3kHvb9BFKKvw4D4bY36jDQAzzOMUgzn0dWcIaBXYTlIpwLJqZsud6FSt3L0Dm0aq3CC+3r52ERLDgDle17Mhgs91HO/efo3dCMnouiUKzVqHbE+z8E3zZyJr3btpzNKPlPT67SM7raRRmAjws8zlMKl2Vc6A6xcwvzkgFWAcEyqoK591IiM71SW5Xv73OiW9mKIzcQ0AJ1wwRq5WNW3C6qgnPN8CjfAm+H2BFhcDLX8TClswD9/0GjUq+rRZFy6F2G7MU7H16Cd7b8haNQY9wCmfAhemgMaWMDb8+fzTiVt6gIV97bgFeoJ2KAP/RtKRicWPICYXLApKRhs0WBP9AkOdxRTd5lzdJxZdG39aKqmxH1Wr2P+5sSsUi8iaLxS7VUyHqZ9fUaBVEcpiXPUaxxh9DXStemZL/amwm1leaelSJ1GFfvkK8y/+++3BpbRncTm4tYXsIhh0o2wV2+Wb4skXA5F9a7ME0akTAAaDrkZf534Yx+Uxjhz2kvFNkWkqEZwgjXoF+rAXGl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB7951.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(7696005)(66446008)(38070700005)(53546011)(38100700002)(26005)(107886003)(110136005)(33656002)(66476007)(76116006)(64756008)(54906003)(6506007)(86362001)(66556008)(478600001)(122000001)(9686003)(83380400001)(316002)(71200400001)(2906002)(8936002)(55016003)(8676002)(4326008)(66946007)(41300700001)(52536014)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tkd1S29hVXVWNjlkMk96eU1scnRVNHBHdVJsK3JrNXVxUGZVcnF3TWE0QlpQ?=
 =?utf-8?B?aVdWOG1BTHlQQ2NpS0JuWVNuYTNjOXRiUW4zUFA1a2FkVFgweG1UMk1LWEpG?=
 =?utf-8?B?d3g4QnNxdS9rVFZSNnZiQWJLaUlYZytsVUR6WkpuOFpFRHc5bUlBSG5wcWxV?=
 =?utf-8?B?eklOVDNNcU4xQ2gvanhPQXZWdG9vamc0Y3VtVkhleHBMd2t3MGdIS3UwMTFu?=
 =?utf-8?B?NVpQS2NJaEJ0RnpqQU4wNHYzMXZWMXhBUWk0ZHRBL014V3JDb1BNSW9xS3My?=
 =?utf-8?B?NVFXaEJXZ2dnaXdSU1MzVzhHWjNJWHZJZkxBblVjMDRHY3JHdWFHZVNuV21Q?=
 =?utf-8?B?S0hlK0p5d0lLZ1UveU1tZmMyYUhvL3FGZXJKSWg4T3M3RUlNOXZyU2VHWWND?=
 =?utf-8?B?RzF3YzJsMlMycS9OL0JWREJXTTNLZ2RuMmtyR3doOWd4Z3dvU3lGbnY2djQr?=
 =?utf-8?B?ajY4VERQTWovT2lZUjA0NS85azdBSk5oUW41T2ZGU2NaMldUNm9sQUlaUGNE?=
 =?utf-8?B?RUs2V2JlOUJKZjlMRCtsOS9xL2ZpVEErSGZMY2tIUk5BNzU3SUYwcjVVYnlW?=
 =?utf-8?B?OHM0STl6R3M5emMrRFNKWmkzM05XWnVNamM0QkVTUmd2RHV6TnBjck9iRFRK?=
 =?utf-8?B?Qk54QmVNTU5TeVJJR1VKNlN4VjEvKzVFQ3J6QXNHMHNrOWJxVnpOZjhZV2dn?=
 =?utf-8?B?amNyQkVUWWI3UVBiOXdSSm02cHRWNVAyZzh0L0l3TTR2Yk14OEg4SklXUkN6?=
 =?utf-8?B?MUJmbVVxZnp4U09jNjdFOXRuTWdCYnJqYzNOeXRhbE03MGNNVmxJc2RZZ2xP?=
 =?utf-8?B?S2FHVitJU0lGVk1yWi9IQ2I3K3FFRFpCQjJxR0hOc28vZStEaXVpV3hhSkV1?=
 =?utf-8?B?eCtPeHJ2Q2FEMjJabjErYjgwYkpVekZSOEo4eGFpVjBFLzlLeFMyRkpHbjdI?=
 =?utf-8?B?OUlVeDFub1Nzcm9lS0lQaC9PbllkV3E5NnA1ZXhhVzFpSVVSYzJwbjFaaGFT?=
 =?utf-8?B?WTlXV1BSNm5saFpUazhSZU1VL3Q3WC9VZXJvRXlDY29yZ01LYUxvSjFpVWtr?=
 =?utf-8?B?bVdDRXBGZlpsVnpqNitFTy80UUhValFTQ3NwZVJxbmVGNERyTnNNaXZxdUR4?=
 =?utf-8?B?RGVTKzg0TVlqZU1ubDRRSUI5TXFuSVcvYjFpbmRuajBtT1JLK3NYYlVlaTE3?=
 =?utf-8?B?eXVNRXJpcFhnanZONC9jcGptNHJPS1lBTWJwbGg2bXZIUVVzZGVuZFNrTjRC?=
 =?utf-8?B?Mjhpc3d5N1lONU5QQkVwd1FmbGNYdDM1SDhGc09vaWh0b2xkcjF2NXJkQ1Q1?=
 =?utf-8?B?SG1jdUw5VENWTmZoaVdUUTUyRHhJbkdjTS9wamtYcmxMNmp0MzhlM1JLK3ph?=
 =?utf-8?B?Z1h1M3RlY0FCRmxXbWlkcE5KdDBJL0N5RXFZTmJzQ1lQTDlET0ovSFFrSFNp?=
 =?utf-8?B?VzBIS1JPUTRrQnpJMWJEK0ppU2ZDeDNzNUxjc1BzaXA4RXJOcVg5dHI5ZGZa?=
 =?utf-8?B?NjRQS2U3WTRZUEVsWHlLSzVMNFdzL1R1Qm12OEk1SzdpZWNyais2UGVkU1Ur?=
 =?utf-8?B?ZEJXOEdiZFVhRHhiZDFqMVlmMlJ3RVJTcGlZMnF3YUUxWTVOZ1ZtbUtCVk9k?=
 =?utf-8?B?dnZuTTR4a3lCTU1tZndwM2FFVkU4L0FQS0FTdWpoUzRndmJoU3hkblBhVCsy?=
 =?utf-8?B?dkJZZEl5S3dVUWVuZWxFd0JWNzIyYnpLM3R1QUsvZ1ZnREFTbUNUckZaTHhU?=
 =?utf-8?B?VGgxSVhKcGU2MzRzSDg3SC8yZkdZTXREak1ucHF1RWp1SWVGV0syNzhjdzJI?=
 =?utf-8?B?UzlDdkxyYU1xTFhRNzJ4QWl3Z3k2UDBMTzVvd2NEMkpJSzQ3eFJzOTZQb05H?=
 =?utf-8?B?dDRYSlAzcExyT1poUzN6L0pBanFYcWZOaUN2WTRzQmVsUTVXWGg1VkdwRmN5?=
 =?utf-8?B?SlJjb3paUnpOeUJlTm1nTTR2UGxLZjBPejhZc1hUa2laS05aaFhJM2I4Y2lm?=
 =?utf-8?B?VmJ4S2huQ3B6V0Z5Q0dQcDh0WDF1ZkRCSGZQVjQ0Z3hmLy9VL3dFT09LWEdN?=
 =?utf-8?B?VHR5U093Wm1BbXNBMFVUdVovYmVwVzZ0SU9KVTRPcHF3QkxmSFYwcHlhVDk4?=
 =?utf-8?Q?Asmc/nPIhBv+zOYx9p9CsAu29?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?amtnQnZWaExoRGw2YXJnbVFnUC80R25iS0tWUVpNU1hOUzBMNkZKT1dDeG1h?=
 =?utf-8?B?U0F2Y3FFNjlXa2hyQVJmZ0h6Q3RsWG5VTGpYTVRMMFY2ZXpiNVUyMFBCSy8x?=
 =?utf-8?B?cUMrbCtDVjB2K2V5VkxST1IweFZOdDk2dHBuZDdTN3VUZkhFMzVybHJPNnRF?=
 =?utf-8?B?aGV6ZlZoZlR5WXZmYUdjWndXN1Z3a3hHNnJwODBDZno3Wm1sQXJIYm4xMFBR?=
 =?utf-8?B?YTRrdURRbEhwWTgyQ2N6bEJJZjFYQnN5eHpWdmdWNDVacDA3ak5jYzdTdHhv?=
 =?utf-8?B?WjNEeGdnL0R4ZzZ3ZFVNcG01Q0F4TUtvYytSdmUrbkllRDVnQ0cvS2ZxUndJ?=
 =?utf-8?B?MWpXWSsxR0FqQ2I0cFNodG1MMmJFZVB5VlRMOURCQUdnZWROd3NlNXF1bExx?=
 =?utf-8?B?UzYrbElMMlVSQXVCZ1ptNTZEaWdVY2ZJUkdYZ1BJOVo3NGlDNDFGZm50eW9I?=
 =?utf-8?B?alRiYjdrQzNTVHliQkJsc0JabmM4TzgwMzhnTzBreFVPaGlicnU4eExwYVVk?=
 =?utf-8?B?cTdGOXZObDF3Sk5PZUgwaFEyQWNobzh1cUVsdVhoRFBvejhDY00yMVljejhl?=
 =?utf-8?B?cWtSNlk1c2VDK0dud3pYcHFiWkhPMVdaakJoUXhaekZ3ZFdpVXdObUtqZ1ox?=
 =?utf-8?B?MFNDcXJBQmZMc2FOMDVpREhFZFVmSGlDeDN6VTJqbmxib0NwR0JiVnBYb3E0?=
 =?utf-8?B?YjM3YW1yZ1dGMkQrV0RUVTkxR1U1UmZERlpQOWVMc0xyL3d5MWVnd3I0aVM5?=
 =?utf-8?B?emhndDhvRnh3NGlaVEtiNHZRbnRZZDJNZWZ1Y25QOUVzSEJsNCtaQ3IzY3Uw?=
 =?utf-8?B?ZW55VzYxdHk1cnJ3V1JjWHdEYzVmVWhGcmx3Z2h1cGZGYmtTMlV0VHdkcWp5?=
 =?utf-8?B?ZUZzKzZRV21qL1pXdmZCVVl1VmRHVGJsZXlld3cxL2hPWXpKZHloMjljaDNo?=
 =?utf-8?B?eWl2ems2VDBHUmg0dVJYVlg4UW9yTVREWWR4WHBVMVhxUFRMMHdwQlpYRFJj?=
 =?utf-8?B?WC9xaWR4MTRwanp1cTQ1a0p0eHd4RFJWUGltM3NIWmU1M0ZzaXE4RUZKdlBT?=
 =?utf-8?B?MDhjdHV4UktaV0tJNHhXclBBWjJSU3BSMDY1RGxYa3B2MVUzRThjL1Bla1Fj?=
 =?utf-8?B?UWdoREFRZTdZdk5Sd3F0cTJMNmFrekhjUDdBRHZUYXQ1ajZxank4eDczWVNt?=
 =?utf-8?B?NWNldTZsUXVnY3B0WWt4cTk0d25CYnlJbzZmZlJwLzBUL0RheGxwYW4rZllO?=
 =?utf-8?B?N3E0L3dPRWN3YUkwUzVqN3NiM2p1NFF1cHNzWUtHU0lLaVV5Zz09?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB7951.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308c2bcb-a306-4250-513f-08dbc0a6b4c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2023 04:44:03.2260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 22eY73Dsm/ju/zM+fblPG/kT8X9fGtK8UpMw9yNy8OkxfyC6h0uDWXlrUNj83OGvDRfOow45hVoosYR42iANyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB9850
X-Proofpoint-GUID: B49v5mJYqCTyPQlm8M-CqXpAoPnxI5lO
X-Proofpoint-ORIG-GUID: B49v5mJYqCTyPQlm8M-CqXpAoPnxI5lO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_02,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309290039
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

SGkgQWxsICwNCg0KUGxlYXNlIHJldmlldyB0aGUgcmVwbHkgY29tbWVudC4NCg0KUmVnYXJkcywN
ClJhbXlhIFNSDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSYW15YSBTUiAN
ClNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjgsIDIwMjMgNzo1NSBBTQ0KVG86ICdBbGV4IERl
dWNoZXInIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+OyAnaW1yZS5kZWFrQGludGVsLmNvbScgPGlt
cmUuZGVha0BpbnRlbC5jb20+DQpDYzogJ0x5dWRlIFBhdWwnIDxseXVkZUByZWRoYXQuY29tPjsg
J0phbmkgTmlrdWxhJyA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgJ0plZmYgTGF5dG9uJyA8amxh
eXRvbkBrZXJuZWwub3JnPjsgJ2xpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcnIDxsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgJ2RyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcn
IDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgJ1dheW5lIExpbicgPFdheW5lLkxp
bkBhbWQuY29tPjsgJ0FsZXggRGV1Y2hlcicgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+OyBS
YW15YSBTUiAoUVVJQykgPHF1aWNfcnNyQHF1aWNpbmMuY29tPg0KU3ViamVjdDogUkU6IFtQQVRD
SCB2MV0gZHJtL2RwL21zdDogZml4IG1pc3NpbmcgbW9kZXNldCB1bmxvY2sgZm9yIE1TVCBwb3J0
IGRldGVjdA0KDQpSZW1pbmRlci4gUGxlYXNlIHJldmlldyB0aGUgcmVwbHkgY29tbWVudC4NCg0K
VGhhbmtzIGFuZCBSZWdhcmRzLA0KUmFteWEgU1INCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IFJhbXlhIFNSIA0KU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDI2LCAyMDIzIDQ6
MTIgUE0NClRvOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT47IGltcmUuZGVh
a0BpbnRlbC5jb20NCkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPjsgSmFuaSBOaWt1
bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT47IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5v
cmc+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBXYXluZSBMaW4gPFdheW5lLkxpbkBhbWQuY29tPjsgQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPjsgUmFteWEgU1IgKFFVSUMpIDxxdWljX3JzckBxdWlj
aW5jLmNvbT4NClN1YmplY3Q6IFJFOiBbUEFUQ0ggdjFdIGRybS9kcC9tc3Q6IGZpeCBtaXNzaW5n
IG1vZGVzZXQgdW5sb2NrIGZvciBNU1QgcG9ydCBkZXRlY3QNCg0KDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4N
ClNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDI1LCAyMDIzIDg6MjcgUE0NClRvOiBpbXJlLmRlYWtA
aW50ZWwuY29tDQpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT47IEphbmkgTmlrdWxh
IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+OyBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3Jn
PjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT47IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT47IFJhbXlhIFNSIChRVUlDKSA8cXVpY19yc3JAcXVpY2lu
Yy5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHYxXSBkcm0vZHAvbXN0OiBmaXggbWlzc2luZyBt
b2Rlc2V0IHVubG9jayBmb3IgTVNUIHBvcnQgZGV0ZWN0DQoNCldBUk5JTkc6IFRoaXMgZW1haWwg
b3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5IG9mIGFu
eSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KDQpPbiBG
cmksIFNlcCAyMiwgMjAyMyBhdCAzOjIy4oCvUE0gSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwu
Y29tPiB3cm90ZToNCj4NCj4gT24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMDM6MDI6MjNQTSAtMDQw
MCwgTHl1ZGUgUGF1bCB3cm90ZToNCj4gPg0KPiA+IE9oISB3b3cgdGhhbmsgeW91IGZvciBjYXRj
aGluZyB0aGlzOg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+DQo+ID4NCj4gPiBJIHdpbGwgZ28gYW5kIHB1c2ggdGhpcyB0byBkcm0tbWlzYy1uZXh0
IGluIGp1c3QgYSBtb21lbnQNCj4gPg0KPiA+IE9uIEZyaSwgMjAyMy0wOS0xNSBhdCAxMDoyNCAr
MDUzMCwgUmFteWEgU1Igd3JvdGU6DQo+ID4gPiBNb2Rlc2V0IG11dGV4IHVubG9jayBpcyBtaXNz
aW5nIGluIGRybV9kcF9tc3RfZGV0ZWN0X3BvcnQgZnVuY3Rpb24uDQo+ID4gPiBUaGlzIHdpbGwg
bGVhZCB0byBkZWFkbG9jayBpZiBjYWxsaW5nIHRoZSBmdW5jdGlvbiBtdWx0aXBsZSB0aW1lcyAN
Cj4gPiA+IGluIGFuIGF0b21pYyBvcGVyYXRpb24sIGZvciBleGFtcGxlLCBnZXR0aW5nIGltdWx0
aXBsZSBNU1QgcG9ydHMgDQo+ID4gPiBzdGF0dXMgZm9yIGEgRFAgTVNUIGJvbmRpbmcgc2NlbmFy
aW8uDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUmFteWEgU1IgPHF1aWNfcnNyQHF1aWNp
bmMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2Rw
X21zdF90b3BvbG9neS5jIHwgNCArKystDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gPiA+IGIvZHJpdmVycy9n
cHUvZHJtL2Rpc3BsYXkvZHJtX2RwX21zdF90b3BvbG9neS5jDQo+ID4gPiBpbmRleCBlZDk2Y2Zj
Li5kNjUxMmM0IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJt
X2RwX21zdF90b3BvbG9neS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9k
cm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gPiA+IEBAIC00MTU0LDcgKzQxNTQsNyBAQCBkcm1fZHBf
bXN0X2RldGVjdF9wb3J0KHN0cnVjdCBkcm1fY29ubmVjdG9yIA0KPiA+ID4gKmNvbm5lY3RvciwN
Cj4gPiA+DQo+ID4gPiAgICAgcmV0ID0gZHJtX21vZGVzZXRfbG9jaygmbWdyLT5iYXNlLmxvY2ss
IGN0eCk7DQo+ID4gPiAgICAgaWYgKHJldCkNCj4gPiA+IC0gICAgICAgICAgIGdvdG8gb3V0Ow0K
PiA+ID4gKyAgICAgICAgICAgZ290byBmYWlsOw0KPiA+ID4NCj4gPiA+ICAgICByZXQgPSBjb25u
ZWN0b3Jfc3RhdHVzX2Rpc2Nvbm5lY3RlZDsNCj4gPiA+DQo+ID4gPiBAQCAtNDE4MSw2ICs0MTgx
LDggQEAgZHJtX2RwX21zdF9kZXRlY3RfcG9ydChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLA0KPiA+ID4gICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiAgICAgfQ0KPiA+ID4gIG91dDoN
Cj4gPiA+ICsgICBkcm1fbW9kZXNldF91bmxvY2soJm1nci0+YmFzZS5sb2NrKTsNCj4NCj4gSXNu
J3QgdGhpcyBzdXBwb3NlZCB0byBiZSB1bmxvY2tlZCBvbmx5IGJ5DQo+IGRybV9oZWxwZXJfcHJv
YmVfZGV0ZWN0X2N0eCgpIC8gZHJtX2hlbHBlcl9wcm9iZV9kZXRlY3QoKSA/DQoNCk1heWJlIGFk
ZGluZyBhIGNvbW1lbnQgdG8gdGhhdCBlZmZlY3Qgd291bGQgYmUgaGVscGZ1bCBmb3IgdGhlIGZ1
dHVyZS4NCg0KQWxleA0KDQo+dGhpcyBpcyBkaWZmZXJlbnQgbG9jaywgYWJvdmUgZnVuY3Rpb24g
bWVudGlvbmVkIGlzIGxvY2tpbmcvdW5sb2NraW5nIHRoZSBnbG9iYWwgY29ubmVjdGlvbl9tdXRl
eCwgdGhhdCBpcyByZXF1aXJlZCBhbHdheXMgbG9ja2VkIGR1cmluZyB0aGUgYXRvbWljID5jaGVj
ay9jb21taXQuIEhlcmUgd2UgYXJlIHRhbGtpbmcgYWJvdXQgTVNUIHRvcG9sb2d5IG1hbmFnZXIg
bXV0ZXggIm1nci0+YmFzZS5sb2NrIi4NCg0KPkZvciBub3JtYWwgbm9uLWJvbmQgTVNULCBpdCdz
IG9rLCB0aGUgY2FsbGluZyBzZXF1ZW5jZSBmb3IgZGV0ZWN0aW5nIA0KPk1TVCBjb25uZWN0b3Ig
c3RhdHVzIGlzICBkcF9tc3RfY29ubmVjdG9yX2RldGVjdCANCj4tPm1zdC0+bXN0X2Z3X2Nicy0+
ZGV0ZWN0X3BvcnRfY3R4ID0gZHBfbXN0X2RldGVjdF9wb3J0IA0KPi0+ZHJtX2RwX21zdF9kZXRl
Y3RfcG9ydCAod2hlcmUgbWdyLT5iYXNlLmxvY2sgaXMgbG9ja2VkKQ0KDQo+IFRoZW4gZm9yIHRo
ZSBib25kIE1TVCBjYXNlLCB0byBmaWd1cmUgb3V0IGlmIHRoZSBzaWJsaW5nIGNvbm5lY3RvcnMg
DQo+IGFyZSBhbHNvIGNvbm5lY3RlZCwgc28gdGhhdCB0aGUgYm9uZGluZyBpcyBwb3NzaWJsZSwg
d2UgbmVlZCBkZXRlY3QgDQo+IHR3byBvciBtb3JlIGNvbm5lY3RvcnMgPmluIHNpbmdsZSBkcF9t
c3RfY29ubmVjdG9yX2RldGVjdCBjYWxsDQoNCj5kcF9tc3RfY29ubmVjdG9yX2RldGVjdCAtPm1z
dC0+bXN0X2Z3X2Nicy0+ZGV0ZWN0X3BvcnRfY3R4ID0gDQo+ZHBfbXN0X2RldGVjdF9wb3J0IC0+
ZHJtX2RwX21zdF9kZXRlY3RfcG9ydCAod2hlcmUgbWdyLT5iYXNlLmxvY2sgaXMgDQo+bG9ja2Vk
KSBkcF9tc3RfZmluZF9zaWJsaW5nX2Nvbm5lY3RvciANCj4tPm1zdC0+bXN0X2Z3X2Nicy0+ZGV0
ZWN0X3BvcnRfY3R4ID0gZHBfbXN0X2RldGVjdF9wb3J0IA0KPi0+ZHJtX2RwX21zdF9kZXRlY3Rf
cG9ydCAoYmxvY2tlZCBieSBtZ3ItPmJhc2UubG9jaykNCg0KPg0KPiA+ID4gK2ZhaWw6DQo+ID4g
PiAgICAgZHJtX2RwX21zdF90b3BvbG9neV9wdXRfcG9ydChwb3J0KTsNCj4gPiA+ICAgICByZXR1
cm4gcmV0Ow0KPiA+ID4gIH0NCj4gPg0KPiA+IC0tDQo+ID4gQ2hlZXJzLA0KPiA+ICBMeXVkZSBQ
YXVsIChzaGUvaGVyKQ0KPiA+ICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0DQo+ID4NCg==
