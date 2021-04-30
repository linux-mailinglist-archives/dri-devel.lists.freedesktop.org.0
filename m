Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1263936F894
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 12:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019B36E10B;
	Fri, 30 Apr 2021 10:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F81E6E10B;
 Fri, 30 Apr 2021 10:40:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcflySV30nwmQwXMEeZ1puVsbAr7lV7xXRiAYdTpp8CAETLC5s3MeV/4uKVyJy/Xek+/sbtTWZrdqjUhOGyUqHMKptuz1TGEV1S7C1N368dnjvXt0cynMcSh8f7e4DkbL6FeYnUiZG5fwJxMT/P891ICJuac5B7Jg3gEFfdhj0rs/G99Vmy7jkcEip3cLhzg7lognlj9MEtJn8lCGqp0rHQvya5WxhwEQgL03iOBYRVvIlFNSg1BvDMtpAx6EdGmfZMIiUGrDhw2Kd/H/Pq/zRefVjH/nejPMpjR3MUb/64QH7hkUsw6HOjRNl1G2kuo5Kk/v+xyID1cgXw55Izv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr2VnQXmghRmqCMxFvDxnpvsru0l25COQ2ZUC2SqbUY=;
 b=VlnhC11PY/N1NwgdY3ZWr3MN2ST1EJe4RNbkgF+iWMq6seVVTLmdOd7cmzem3KPu0WR9NmbbWe6GRVOTB6MiBvZry4UR4rra9AW6vGInsCwSF88pUuko8a6JUToN4oPa0zYnVQUcWmXkRbO70rPP5U3nMOsGTafc9vrY2ma91YeQqyaC+G4kZ69AupFELv/VR1EukaBl4uocYW70HjZwQFB4+3ttBmBXqpMmNHcI4c6eSg8CddWwVsJRgKLxERwhY0Cg5MGIKQfPHHDueb2pVZLVUJlPkitf+A5deKMIWuMqEg1Cuqp/nDeX8dFwKOcRWTmib2D7QsSxEun8KxZ1yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr2VnQXmghRmqCMxFvDxnpvsru0l25COQ2ZUC2SqbUY=;
 b=JvsVOjkGksfmGvndK6GoxrZ0x7xAngJSpSM9QBVkH4VWHkEw1B847s9sUjc9Yp9/U1wGd/a+KSQOT86lq4DtXFP3QVdR619NeONT4E1/GD5Nam0eYu2Kf1UdGAU96IjSaG2FTuie9DeKVJykGecI4tQQcTCqKC6MmefUziZfnMY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3126.namprd12.prod.outlook.com (2603:10b6:a03:df::28)
 by BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Fri, 30 Apr
 2021 10:40:07 +0000
Received: from BYAPR12MB3126.namprd12.prod.outlook.com
 ([fe80::1855:9722:849:a7e0]) by BYAPR12MB3126.namprd12.prod.outlook.com
 ([fe80::1855:9722:849:a7e0%7]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 10:40:06 +0000
Message-ID: <82a1c8e6-a7d6-bff3-fae7-f2a3dc68f9f7@amd.com>
Date: Fri, 30 Apr 2021 16:09:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210427175005.5b92badc@eldfell>
 <ba369002-69e9-15d5-323c-1923ecdeda63@amd.com>
 <20210430124358.1f5ac6ec@eldfell>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20210430124358.1f5ac6ec@eldfell>
X-Originating-IP: [106.51.20.251]
X-ClientProxiedBy: MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::22) To BYAPR12MB3126.namprd12.prod.outlook.com
 (2603:10b6:a03:df::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.68.111] (106.51.20.251) by
 MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Fri, 30 Apr 2021 10:40:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50778de7-bd1c-497c-fdfd-08d90bc451b3
X-MS-TrafficTypeDiagnostic: BY5PR12MB4164:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB416491F06E49495D0D55AF56F25E9@BY5PR12MB4164.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQPseNqNCbCzESRGTtf5iP/jRGN30DA9MNfwWz64A910p2/HajkHyLdHOgsvt6QqNCcyd2bUkCUeY44x3GHbkDzNmgnCa3pH/Qs+y1/sOlX9I9XKoF88Ut1BAWOZCirUBcDIRfa8vwHQUmh1THnMTHv3Ihc4fmiGzxrxG7kUCg8zTBcahv/8rEl2u8SC+70XzkdCVt5odRDNCqrq88nSnwa4h2b4zEwj0sJqfHfDr4aCCJZ/3/3qQdHclu+/FuCxYvQNN9Lw6hZkveDfiWX4LXCv202X74GXoSo6WyuE/tnfxbzuWcw8QrKazvgszudv4A7uVlz2IaYGyEQHx6mXk5d4sYt9aud/vhlUjyLKmXZW9zHfIhuZ1+byZuFEjcrZG7dIiiowEc6OA2e1WMwqahefU/YGBoKpNOMj32KVwoYff6rGNFwU1GI4LKGmmRBcxq1/LLmEljxg8CX4hnLJcM+YdmB31loqPBqc/veGJKiBhmsTirYcHSUCnNxvEO4DNQuE0eKRLYD/qjF58yMHBGtwCSvVBDc7Ij8BmSRyI+X6J9W8FwzwQxs3PvVQmEWB0+jiqppNu2pVWUP2WN8NO9+XveCOSe7K0V5H3KVIVQ3uihCT55KJN8YFBX9fq8+EA++spk0Wjqm7YgZdAPmR+VNAIyHLTvQp2AlECdK8cl8e4AXaOSpv+2OVnb/V9FVDhcfvBCaYIuWSOO73bT4zidIiPLZK2DfRgnRlBnwsquw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(83380400001)(316002)(16576012)(66946007)(44832011)(66556008)(5660300002)(66476007)(36756003)(6486002)(38100700002)(2906002)(38350700002)(478600001)(2616005)(956004)(6916009)(31696002)(186003)(53546011)(6666004)(1006002)(16526019)(55236004)(31686004)(26005)(86362001)(4326008)(8936002)(8676002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TU1QakY1YlE4NGswcG1JeStJUCtxVTRXVnZpV09tSWxWb3FpMWlDd3AyVlFX?=
 =?utf-8?B?bU00K1BQbmppaFQ0TDVqS0ozaE5VUXIvM0dTcEo2VGYvcW9mUmtwY1d5TElm?=
 =?utf-8?B?U25SbHkwM3U1SUJLcXNOUUNUNDc3ZmUzdERhMzYxVE1LbnplSC9hWi96VllE?=
 =?utf-8?B?QVFJTHNPSmhCdmo2NmVxZEEwaFNjNTBYM2cxTEdjZnhUYjE0bnIrVElPTTln?=
 =?utf-8?B?a0htSjRkV3BoR3RkekZ4akxwb0VIYTRYTDVRa0dHVDIzUUVSN2dyMlcrbjBx?=
 =?utf-8?B?RlQ3T2w3WkdLRlRNRmR0dDhvUnJHZ1JPejFkVFFrWHk5OGlQclpQb21iSCs2?=
 =?utf-8?B?RzNyejczUFZOUGxPek8yaFEwS0hVb0JacHo4V2JoeGJzcWJVbkxlemQxMEJv?=
 =?utf-8?B?cStCNFI5aFcyVUNEa3g2dVUxdmp0L20wcjZzRlF4MWpMRGx2aUhyc0NKWnNM?=
 =?utf-8?B?QllhSHZ5aGVVaW9obGM3NXJjZEVvUlJzOXorQmFHUGM0UTFiaTVWcVBaYUpF?=
 =?utf-8?B?S0F3QzEzNEg2MVBPNXk0RkNpQ0VNUzFsTlZnc0IvYXY1a2szL2ZNV2tkZVJP?=
 =?utf-8?B?Q211MFZpU1VqYWhQWFdNWFN4WUdPKzN3aTd4VUh1TlJ3UThnVmFURFVhRDUx?=
 =?utf-8?B?dTFFcmVsV2Q5YWE4T1lMenY0SGpuOTJhNHNJKytZTUhjelRTcURwdC9tYlBP?=
 =?utf-8?B?NlhRbG9SbHFhMFduYVJJbkllVHhraDRrMkY2eFB1N3lrbDd4YUNIYXNnbWsy?=
 =?utf-8?B?YVM3S2FyS3J0K2dtV1hKZXQ0RmErZkhtb3BMWDdrcVRUNTRxU2lvQ3pyUjJh?=
 =?utf-8?B?R3VjVUVyTElpdlgvc0N2czJ4ME5XbWdOZnpIQUs4OWdwQmxkRTF2a2xJWko1?=
 =?utf-8?B?QjV6MGlFMC9Qd1ZSUEp2bmlWekFLa3NSMG9OcExoSWg5VCt1Q3hyTEYyc3pt?=
 =?utf-8?B?dGU2Ym81dXphb2h3b2gzNVNmMmxiK1N2VUZKdnJZYmRPNGhBK0tlekRRL2cx?=
 =?utf-8?B?RkJBalR1blNTTzQ5eEtTaGM2Yk9ZTlNaVk5FQkZmYmNwclNtc0FlQVRLaEhh?=
 =?utf-8?B?NnZwRWdFSkl4YlJnekJQek4ydE40bW9JT3psV2JCRUQ4NXExS0E4b1NKdVdG?=
 =?utf-8?B?Zmp1WnhZdHVjRVR5dGJaZUVBT1JaTUtZbnJhQmpLT290Wml1Q21XSzd2NHcw?=
 =?utf-8?B?Z00zY25FNXBoMHNvOE9EZ3lrbHZ3UkYvcGNOK2s0NDdmOXJWTTJIQ05aMjE0?=
 =?utf-8?B?bCtWc3pNUmJNYll2MUFkNEU5d1VkYmpMc08reG1SVnFPY0FOS21TZVBoR282?=
 =?utf-8?B?Q2hmUzRzakRsSFZrcjhMSWV3SmhqeXRYL0xiWWRhSjB4V0dOL1QxME9jZVRK?=
 =?utf-8?B?aGlvNzltRTZnMVJVbGpIb2xsUXFRTDBFRC84MUtZL1lHYWJyQXhvZFdyYSt3?=
 =?utf-8?B?Y1NKU0xUMG5VMEJLVGQ0M1UrbGFBdnJnMk90SFcvVnBUaUVNS01JbXhyVDRa?=
 =?utf-8?B?WjVOQkFaRkhONGdTRkprWEhxWGJGR3FpVzFJd052WU0wSHRxU0gwMFRrRWw0?=
 =?utf-8?B?czdHMU5pSUpuc2JEeTJhclJFNkpvNDBMb1hhVHJvRmJKT09HNDNleDkrY2wv?=
 =?utf-8?B?dHVDS01TSTR0OWRuMXdzVzd4Wk9ZZWdYc0FJODB2bXEzSTUva1UvaGFzdlJ0?=
 =?utf-8?B?bHpkcE5vWk9aYWFCcGFnZkJqYnliSVR2RVBNeXRCblBQek1xYnEydmZrKzZJ?=
 =?utf-8?Q?AHyqDXzNWv4ztrVToRtU/L4EjnQyqrbKoeQfTni?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50778de7-bd1c-497c-fdfd-08d90bc451b3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 10:40:06.6949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxMkk8b0N0mgADulhf7WZFndCmKTfA+m49lxvKfnIseQkYoywpTns5pL49OyazR8Mo8I0GizpAPdmXWmIpuvSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Bhawanpreet.Lakha@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 sebastian@sebastianwick.net, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gUGVra2EsCgpPbiAzMC8wNC8yMSAxNToxMywgUGVra2EgUGFhbGFuZW4gd3JvdGU6Cj4g
T24gV2VkLCAyOCBBcHIgMjAyMSAxMzoyNDoyNyArMDUzMAo+IFNoYXNoYW5rIFNoYXJtYSA8c2hh
c2hhbmsuc2hhcm1hQGFtZC5jb20+IHdyb3RlOgo+Cj4+IEFzc3VtaW5nIHRoZXNlIGRldGFpbHMs
IEEgY29tcG9zaXRvciB3aWxsIGxvb2sgZm9yIERSTSBjb2xvciBwcm9wZXJ0aWVzIGxpa2UgdGhl
c2U6Cj4+Cj4+IDEuIERlZ2FtbWEgcGxhbmUgcHJvcGVydHkgOiBUbyBtYWtlIGJ1ZmZlcnMgbGlu
ZWFyIGZvciBHYW11dCBtYXBwaW5nCj4+Cj4+IDIuIEdhbXV0IG1hcHBpbmcgcGxhbmUgcHJvcGVy
dHk6wqAgVG8gZ2FtdXQgbWFwIFNSR0IgYnVmZmVyIHRvIEJUMjAyMCBjb2xvcnNwYWNlCj4+Cj4+
IDMuIENvbG9yIHNwYWNlIGNvbnZlcnNpb24gcGxhbmUgcHJvcGVydHk6IFRvIGNvbnZlcnQgZnJv
bSBZQ0JDUi0+UkdCCj4+Cj4+IDQuIFRvbmUgbWFwcGluZyBwbGFuZSBwcm9wZXJ0eTogVG8gdG9u
ZSBtYXAgU0RSIGJ1ZmZlciBTMkggYW5kIEhEUiBidWZmZXIgSDJICj4+Cj4+IDUuIEdhbW1hIHBs
YW5lL0NSVEMgcHJvcGVydHk6IHRvIHJlLWFwcGx5IHRoZSBvdXRwdXQgU1QyMDg0IGN1cnZlCj4+
Cj4+Cj4gLi4uCj4KPj4gwqAqCj4+IMKgKgo+PiDCoCoKPj4gwqAqwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUkMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilIzilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilIzi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJDCoMKg
wqDCoMKgwqAg4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSQCj4+IMKgKiBIRFIgNjAwIE5pdHPilILCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCDilIJIRFIgNjAwIE5pdHMg4pSCwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
4pSCSERSNjAwwqDCoMKgwqAg4pSCwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSC
SERSNTAwIOKUgsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilIIgSERSNTAwCj4+IMKg
KsKgwqAg4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pa6IOKUgsKgIERlZ2FtbWHCoMKgwqDCoMKg
wqDCoCDilJzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilrrilILCoCBDb2xv
ciBzcGFjZcKgwqDCoCDilJzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilrrilILCoCBU
b25lIG1hcHBpbmfCoMKgIOKUnOKUgOKUgOKUgOKUgOKUgOKUgOKWuuKUgsKgIEdhbW1hwqDCoMKg
wqDCoMKgwqDCoCDilIIKPj4gwqAqIEJUMjAyMMKgwqDCoMKgwqAg4pSCwqAgT0VURiBTVDIwODTC
oMKgwqAg4pSCIEJUMjAyMMKgwqDCoMKgwqAg4pSCwqAgY29udmVyc2lvbsKgwqDCoMKgIOKUgkJU
MjAyMMKgwqDCoMKgIOKUgsKgwqAgSDJIwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCQlQyMDIwIOKU
gsKgIFNUMjA4NMKgwqDCoMKgwqDCoMKgIOKUgiBCVDIwMjAKPj4gwqAqIFlDQkNSNDIwwqDCoMKg
IOKUgsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUgiBZQ0JDUjQyMMKgwqDCoCDi
lIIgWUNCQ1ItPlJHQsKgwqDCoMKgwqAg4pSCUkdCODjCoMKgwqDCoMKgIOKUgsKgwqAgNjAwLT41
MDDCoMKgwqDCoMKgIOKUglJHQjg4OCDilILCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
4pSCIFJHQjg4OAo+PiDCoCogTm9uIExpbmVhcsKgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmCBMaW5lYXLCoMKgwqDCoMKgIOKUlOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmExpbmVhcsKg
wqDCoMKgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUmExpbmVhciDilJTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilJggU1QyMDg0Cj4+IMKgKi8KPiBIaSBTaGFzaGFuaywKPgo+IEkgdGhpbmsgeW91
IG1pZ2h0IGhhdmUgZGVnYW1tYSBhbmQgY29sb3IgbW9kZWwgY29udmVyc2lvbiByZXZlcnNlZCwg
b3IKPiBpcyB0aGF0IGEgbmV3IHRoaW5nIGluIHRoZSBIRFIgc3BlY3M/Cj4KPiBVc3VhbGx5IHRo
ZSBZQ2JDci9SR0IgY29udmVyc2lvbiBtYXRyaXggYXBwbGllcyB0byBub24tbGluZWFyIHZhbHVl
cwo+IEFGQUlVLgpBaCwgdGhhdCB3YXMgZHVlIHRvIHRoZSBHYW11dCBtYXBwaW5nIGJsb2NrLiBZ
b3UgYXJlIHJpZ2h0LCBjb2xvciBmb3JtYXQgY29udmVyc2lvbiBjYW4gaGFwcGVuIG9uIG5vbi1s
aW5lYXIgZGF0YSAoZG9lc24ndCBtZWFuIGl0IGNhbid0IGhhcHBlbiBvbiBsaW5lYXIpLCBidXQg
aW4gdGhlIHNlcXVlbnRpYWwgYmxvY2sgYWJvdmUsIHRoZXJlIHdhcyBnYW11dCBtYXBwaW5nIChj
b2xvciBzcGFjZSBjb252ZXJzaW9uKSwgd2hpY2ggbmVlZHMgdG8gYmUgZG9uZSBvbiBMaW5lYXIg
c3BhY2UsIGFuZCBJIHdhcyBhIGJpdCB0b28gbGF6eSB0byBjcmVhdGUgc2VwYXJhdGUgYmxvY2tz
LCBzbyBJIGp1c3QgcmVbcGxhY2VkIHRoZSBibG9jayB0aXRsZXPCoCA6RC4KPiBUaGVyZSBpcyBh
bHNvIGNvbmZ1c2lvbiB3aXRoIE9FVEYgdnMuIEVPVEYuIEkgZ290IHRoYXQgaW5pdGlhbGx5IHdy
b25nCj4gdG9vLiBPRVRGIGlzIG5vdCBqdXN0IGEgbmFtZSBmb3IgaW52ZXJzZS1FT1RGIGJ1dCBp
dCBpcyB1c2VkIGluIGEKPiBkaWZmZXJlbnQgY29udGV4dC4gVGhvdWdoIGhlcmUgaXQgc2VlbXMg
dG8gYmUganVzdCBhIHR5cG8uCj4gT0VURiBpcyBpbmhlcmVudCB0byBhIGNhbWVyYSB3aGVuIGl0
IGNvbnZlcnRzIGxpZ2h0IGludG8KPiBlbGVjdHJpY2FsIHNpZ25hbHMuIEVPVEYgaXMgaW5oZXJl
bnQgdG8gYSBtb25pdG9yIHdoZW4gaXQgY29udmVydHMKPiBlbGVjdHJpY2FsIHNpZ25hbHMgdG8g
bGlnaHQuIERlcGVuZGluZyBvbiB3aGF0IHRoZSBlbGVjdHJpY2FsIHNpZ25hbHMKPiBoYXZlIGJl
ZW4gZGVmaW5lZCB0byBiZSBpbiBlYWNoIHN0ZXAgb2YgYSBicm9hZGNhc3RpbmcgY2hhaW4sIHlv
dSBtaWdodAo+IG5lZWQgT0VURiBvciBFT1RGIG9yIHRoZWlyIGludmVyc2Ugb3IgYSBkaWZmZXJl
bnQgT0VURiBvciBFT1RGIG9yIHRoZWlyCj4gaW52ZXJzZS4KClllcywgdGhhdCB3YXMgYSB0eXBv
LiBUaGUgaW50ZW50aW9uIHdhcyB0byBjYWxsIGl0IGludmVyc2UgY3VydmUgZm9yIEhEUiBlbmNv
ZGVkIGJ1ZmZlcnMuIEl0J3MgYWxtb3N0IDQgeWVhcnMgKGFuZCAyIGNvbXBhbmllcykgc2luY2Ug
SSBsYXN0IGRpZCBIRFIsIHNvIEkgYW0gYSBiaXQgcnVzdHkgb24gdGhlIHRvcGljIDspIC4KCi0g
U2hhc2hhbmsKCj4KPiBBcyB3ZSBhcmUgdGFsa2luZyBhYm91dCBkaXNwbGF5cyBhbmQgbGlrZWx5
IGFzc3VtaW5nIGRpc3BsYXktcmVmZXJyZWQKPiBjb250ZW50IChub3Qgc2NlbmUtcmVmZXJyZWQg
Y29udGVudCksIHdlIHByb2JhYmx5IGhhdmUgbm8gdXNlIGZvciBPRVRGLAo+IGJ1dCB3ZSBjb3Vs
ZCBoYXZlIHNldmVyYWwgZGlmZmVyZW50IEVPVEZzLgo+Cj4KPiBUaGFua3MsCj4gcHEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
