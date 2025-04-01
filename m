Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE473A78041
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C34610E614;
	Tue,  1 Apr 2025 16:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="lEteNFBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazolkn19011036.outbound.protection.outlook.com [52.103.66.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EEE10E614;
 Tue,  1 Apr 2025 16:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5f0XQc/Jvbso5lF6zfNr4Wy4T1enKyI/a6piWT0hiO6ZzKCMWKPJI9TXBOKTPvu5tnFUdMtf1XB8BiAyg5+zk1m2OGLYJfQrL5nIUCVIxWbAcSTkvMxMm82wY0xh+n/1jJAQFTYiyKztf/dWe5eQMacjxRifWtEgW/R7kDiF+DPAPMZaXyGDYmG6HnXSjaTL/EF9NqXqEA/mjJISUSuYHolUD2qjkmyNYkJtvUkNU0bVnupbM0aEtVSU+NdDxocRIX4YnonHmjGCknJduJBn3ojVZtha5dHpbU7m/D7CO6WpETLzYYkxPc8NgzuAX1wnFRQXQM2Cum2UBtLOiiRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+PEtReA7SS/oTVKsO+LQ/OlD2rnFjETrW2AiEW6FDk=;
 b=QtXFLmaqO8yovTHsa5DjP/TWDJ/qiBjddf8q0QuIhLzLDZHpDjNA6M9DOhqPntP0YwHb7w5aHkpCmobGemP7cCwhOI6H0t+GJGncOFhVueFmB4dlmlHL7zNDdJl1w67S5mckVLV1wxDbIR9WG8jJZeCwv5h/I9EIezpIJKTnwg5GWC7GnYSE4D914wdW4xJF0h28FpvPMBgnTSW9UBV96usvDr34SclIUcojLWBT4eIHexBDxc8aXFSrpDxR0Erexl51SVCW+OZXRD+kli3roTnE1/sEsULELKLtlt1qiP5puflT84Y2gXrm8Zo/GNWwMC4nYqbfMzipjLOFvFmU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+PEtReA7SS/oTVKsO+LQ/OlD2rnFjETrW2AiEW6FDk=;
 b=lEteNFBi037rbJ0NWl5fkeLf3qby/23LSKLo9vvfAQ960eJt9bTHpNwB7avHVSr+LHl3xpBQHuwpFsVPVakYmDaTOmIEfqQq1PTOQvWci+iWlxiod0zo4Ig1Cp7sovy7pi+dhhwhfFJz57JnWfCWjvH30V2kNYa1eCLkxhyGVYAE05PEBfVxRDldGLWDNDHFcozeNzCKN4rarZRLl2fOWWWbxqNheggmftM54cK9/I0mlZ+b1YvpvjEl70r2sSIl1/1a6md0fU7wYyVaPbyBMIe+xUwWp9bS7pGREzPYrbAx34c41NYnpl8X52sX4Se/tIcggsBzN5xMEGI+Hac0/A==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by TYCPR01MB11174.jpnprd01.prod.outlook.com (2603:1096:400:3be::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.35; Tue, 1 Apr
 2025 16:24:49 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8583.028; Tue, 1 Apr 2025
 16:24:49 +0000
Message-ID: <TYCPR01MB8437B07E975292BBC531570E98AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Wed, 2 Apr 2025 00:24:36 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
 <63d2a14e-759f-44b6-99b4-de42b8d6b1e0@mailbox.org>
 <TYCPR01MB8437C142C860FA03F06B5E6998AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <fd0440ba-1a34-4cad-9e89-701dec7673b4@mailbox.org>
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <fd0440ba-1a34-4cad-9e89-701dec7673b4@mailbox.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------f4pQm6BYHqX3UxqjMKmAYiA4"
X-ClientProxiedBy: SG2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:54::19) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <cf3cc3c5-e80c-4162-b229-0640f61362b9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|TYCPR01MB11174:EE_
X-MS-Office365-Filtering-Correlation-Id: 134707df-7ec0-457b-8cab-08dd7139b82b
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6092099012|15080799006|7092599003|461199028|12121999004|5072599009|19110799003|8060799006|1602099012|20055399003|3412199025|440099028|4302099013|26115399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2Y4UXQ4SlhHbGtTWTNUemFhTzFtL2pkMHhkbWVYdXNUUjlKT0tNYjY1Q05w?=
 =?utf-8?B?R1ZFdXFnR2M2ZlZWck90U3loZ0JnQWxsTmpEcFFTSU92ZW1KajluMm93QXgx?=
 =?utf-8?B?TVpmMUlpaERpTkRTZ3I3M09NZnV4K1RkTW02eWl2cnJoL2ZqZ1BtWWZtUlAr?=
 =?utf-8?B?SnRLYTY5RTUwZ0trWmhRbHhKNzF5QnZDTHdQanpoOFVxSXIycjVNT1JPUDBl?=
 =?utf-8?B?TWgwTnZRUkRmUUhmVC9ESkhzaEFoeCtaT1hUbzNsdGgzTVdSNFcrcUpwS2pC?=
 =?utf-8?B?VXVKUU93SjJyRDRTYTJBUU1mQndaQko3MEpHRnlhM1BlVHBBVCtiRTllVVkz?=
 =?utf-8?B?eE1Hak1RcXFIMEFKQXVBankvcmlEZVpSTnE2bkhzaDFwQ2JoMFozM290VXlW?=
 =?utf-8?B?aFU4ZzNpWDNKTUJyWHhlT3hOcHhKdmU3bVlSWGlrZzZKM1B4U003cjJpNlZp?=
 =?utf-8?B?ZmU0UHpnRUZNdXVmZjByVDZXNmRZZlBxZmhuOFE0S0FlNVBVYzV4WHNNYmxm?=
 =?utf-8?B?OWx4NXRQWVBXSUJvSS9rMitaT2Jid1hKUzM0aVQ0RzhkYk56MjN6bjVmNTly?=
 =?utf-8?B?Y0JNWlV2RTN0WVhNQXFmZGdmcWNRcG9VTkh5M3ZMMURBRlBBRFJnd3phMmdx?=
 =?utf-8?B?bDNZOEJSeUxPRnJndHA0Ym1zK3RqU2JXS0gwTE9BYk96S01nTW90d3VhbFh3?=
 =?utf-8?B?ZFVINEhPVzlkNmJ6M0hRK1B3dnJPOTZyN01tUWFtK0kzSU5kclhQcW5pUG9t?=
 =?utf-8?B?Y3Y4V2pIaGRXeFFabUQxcFBRUFpkaktHVXB2cndUbVBKMzNEYktYUnZpMEor?=
 =?utf-8?B?NFJBeDZONmxmVDBDYnQ3RU5XaHhiRGhzenVVeTlWa0NFaHdFdGxZdmpLZXJu?=
 =?utf-8?B?SlA5em9YdUFmbGdhUkhJMWxSQ0tnWWZSQ2ZSbEVoMGFMaE5wbHRmcG16c2sy?=
 =?utf-8?B?NzhybWlEaEdxYVVETXIwTW9NdnorTlpqc2FNUndSbFhqb0RmUC9wY2dWVERU?=
 =?utf-8?B?ZEw0WXQ3dXd3OGVzMEtyRytES2NRY2luYzh0WTNMdmdoY0VUS29iZVR0M2Qy?=
 =?utf-8?B?QnN1WkFmQllXajVhTzI5MnlKaXh5R282TEdPZ2ZHb09XbHljVVhMWE1Xa0lL?=
 =?utf-8?B?dUZBM1ZZbXZFaVdDd0Y2Z0lEVU1hQ2xKUDM4Tk5kVStZeXAyZ1Z5c2RMZjFD?=
 =?utf-8?B?bEZZSDdpUU9oZ1FmYWpFQTNNeTJ2cEpzNFpsSVcyOWxraW90OWVkSEJUQXFj?=
 =?utf-8?B?QVNtZDBUVkdyd1FycGYxelBUbEowdHcxcUpOUVNiNVE4c1d2S3JXczcybTZ6?=
 =?utf-8?B?eTBhWUtjV0dWUEZHMFI4em5RZkRxYjRVYlhpeDY2eTZ3U0VmWmxuV0lnQ3l0?=
 =?utf-8?B?NmFtYXQ1L3B6YTlqL29TekZSenhZTytIRnZrVFdJWWxrQUhLeEt0UnppdEtX?=
 =?utf-8?B?dnJmekxSTjhvdVJpdjE3RjlXbnFuZFp3TXlLNVFUMFFlVE5VdlFxdVgvam9u?=
 =?utf-8?B?elRCMzN5MVhHUmxnTmJTQ3ExclJUblkwaUsxblM4RkxjLzRLcWNmYlFlOWZG?=
 =?utf-8?B?Nk9aWGFuR1lUNFdWc1dxV1hmY1pwQ1BFZmtJUjF3SVE3TzI0QUJwS3JxWDYw?=
 =?utf-8?B?b28wMmxRaXAvQkk3RE1Ob3dTeWtvbEpSWCswVVlhTUYzaXd0L0hVb0hPVlJ6?=
 =?utf-8?B?M3BCNmcycXpyM29aM0syRVA1cHhiOEtBMnlEQXpMcDBjSFJPVnNzMFhhcjc1?=
 =?utf-8?B?enkrcnV6TDhORFcyOVJLSWd2WVpBS01CS1R4b2JzY1A3cTNGYWtibEo2V3Yz?=
 =?utf-8?B?aHhhdnd6OUU1Q29mTzNUbXRwN3VBT2JFVWxDMnd3Sk1PWkNlNUhOVm00bzdD?=
 =?utf-8?B?WUszZUpQRXJVWi9ucElGN1Q2Z3dZUGtDVTlrNXg0TWh5dEE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFNpSUt5Z0EvWUJzV3F3WU4xLzM0cE9PY1pPbVErOHg0MVo2NlJuV0pxRTRr?=
 =?utf-8?B?THlEc3kxRWlCR0pRWHVwV2cwMHc0OTlIcFlxKzEwaHJHSXBDTXFaU2dwK0N4?=
 =?utf-8?B?Z3BUNWI2b045UVdncDc0S2ZJemJBcWpPRktJaXM1WCt5Z3l0M2Q1bERnalVI?=
 =?utf-8?B?a01OeVhhQ2RUdk0rNy8wSVZMT3k5NXVOaW9jYzBiR1hXY1M4d3A5YnZSWHZz?=
 =?utf-8?B?N2hBWkVnYnVCTDZpc0NJRDduNTlDNEVKUnJ4a3hsSlpleEpPcDUyRHVBVlJv?=
 =?utf-8?B?VUFRODVBa0pObDQ1SDVpOGFFMWVxTWJ4KzhJRVNIbldGQTJyc29Kd0RGOVFq?=
 =?utf-8?B?T1d1RTB6bVc2SFlrVHU0dHZvd1g3V1F5QVlPTS8zSUVVeHVxbVRTUDVlN2Qw?=
 =?utf-8?B?SmRhQjUrMTRQbDlrT09NTE5HcHV3U0tYRFZZWmM3N05xdWFHY09NRlU2cm1l?=
 =?utf-8?B?R2hPWDY5Rk9mbUFRcS9XeVErRVErWGIxMlVvd0FOM3hzZklPM3lGYXlIVTVG?=
 =?utf-8?B?RmtvV0JOcjhxWkZZTVRWOHhBa0ZSYXdIamFST2Uvd2pLcWVObFU3bE9rRnZ4?=
 =?utf-8?B?TjZaWU9xQVpQUVA4N1hsaVVIN0ZQdUNpbDJlcGVGYXRxTjdpYTFXZHBhTVNK?=
 =?utf-8?B?RWh1cmNQdDlnVG5QN3RqbFl0SWg4QWRZOTFyMEFrOWdsYXJWbURtOXJpbWhw?=
 =?utf-8?B?NHNKS2hhSldZWHRKcjZOeFVqSk1WcjlYK1p5WGI5dmNOWlZzdU5Ta2dwMDRG?=
 =?utf-8?B?dGU5MXNKOWdHTGZVenJDcWlJM0NGaVhYOVBnUWdEQlFBWGlOQ2hDRFlER0pu?=
 =?utf-8?B?VzdKZFNsZ3E0L3kvcFRTZ0l5YmZ2dDNBbzdINmEvZmxwSnAxdnIzMGtCT0dn?=
 =?utf-8?B?MUNkenpOQVdDelJuejh2SjRFUnc4RnlWRDBxVGhLbUFwZS9QaXZ6MWs2ejUz?=
 =?utf-8?B?OGFXdUNCc3QwU2RQNDlIenZJTnljR1FpTzJ0RnltQlFhVzZjaGZSYVdNdjlG?=
 =?utf-8?B?cjU4SUx4bkJWbG4yNk1JWmpnb2Y4eFdGQlFHd2tyRjE0bUlMQzE4OFMzTGdG?=
 =?utf-8?B?dTE3Z3JYY0E0a01YSSs0V21pWU9jRmppM3MrdjRsNEhtNFQyTytJQllVZWdR?=
 =?utf-8?B?VDVQSEF6ayttZUZNSTQvMFJVdnlJRWlodnZqL05leWpxU3FNaTZmMU95RFp4?=
 =?utf-8?B?UjduNzZKaEpZbWQ1T2NYS1AwQjhUcEQ2YlhwNGU0elQvTXdqekx3Rkt3WkJq?=
 =?utf-8?B?bFdtbElmbHdnaEZyTmJQaVVIZzE2S2JHU3lYYTBwQVF2Qmp4QnN2WVpweFJW?=
 =?utf-8?B?MnhuTmhjS21EdkNkQ1Q5TU5odjJ6NTNybitHZ0c4SjduaHBjc3V3TklMOHY4?=
 =?utf-8?B?cG5nUVhjL21yalpPbEd6azRwMjQyRHlrVHBvcU54OXBoaVlWck8vRkgvNlYx?=
 =?utf-8?B?Mi9HcnAvVi95NjBnT0x0b1RqbVJ5MEZ1ejNEVXpEQS92Y3FjYjFHQ21mWU5i?=
 =?utf-8?B?d1NMQ2FPRjk2djBaMDQwSFFhSzVseE8xYnVBcHpNS0Y1dzdiYzJnV1R4SGF3?=
 =?utf-8?B?VG1mUU45R3FNRHBXa2wrWlN1aDhUQmdPSE0yN3ZXKzNCUVYzOFlsWkNPYVBR?=
 =?utf-8?B?RlV6MnpvUEp0NkRWT3NkRGdUaGJWUnByT0xKWXE4YVhaTWtRblJyTStOd05q?=
 =?utf-8?B?cWg5YTRyRkhROW5CR29BTk1vbXUxVFlaNjhjT3Q4OGRyaFpuM0ZTa3FzQkQ1?=
 =?utf-8?Q?7i6AQ3EBfsN2gv9uL8=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134707df-7ec0-457b-8cab-08dd7139b82b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 16:24:47.7902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11174
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------f4pQm6BYHqX3UxqjMKmAYiA4
Content-Type: multipart/mixed; boundary="------------B9lRTDC7F0tqCqR5LD62HxIY";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
Message-ID: <cf3cc3c5-e80c-4162-b229-0640f61362b9@outlook.com>
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
 <63d2a14e-759f-44b6-99b4-de42b8d6b1e0@mailbox.org>
 <TYCPR01MB8437C142C860FA03F06B5E6998AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <fd0440ba-1a34-4cad-9e89-701dec7673b4@mailbox.org>
In-Reply-To: <fd0440ba-1a34-4cad-9e89-701dec7673b4@mailbox.org>

--------------B9lRTDC7F0tqCqR5LD62HxIY
Content-Type: multipart/mixed; boundary="------------5ZLaToxS4uqacwu00ttjsSdc"

--------------5ZLaToxS4uqacwu00ttjsSdc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCuWcqCAyMDI1LzQvMSAyMjoxMSwgTWljaGVsIETDpG56ZXIg5YaZ6YGTOg0KPiBPbiAy
MDI1LTA0LTAxIDE0OjMyLCBTaGVuZ3l1IFF1IHdyb3RlOg0KPj4g5ZyoIDIwMjUvNC8xIDE3
OjU2LCBNaWNoZWwgRMOkbnplciDlhpnpgZM6DQo+Pj4gT24gMjAyNS0wMy0zMSAxOTo0Miwg
QWxleCBIdW5nIHdyb3RlOg0KPj4+PiBPbiAzLzMxLzI1IDExOjA0LCBTaGVuZ3l1IFF1IHdy
b3RlOg0KPj4+Pj4gT3Igd2UgY2FuIGFkZCBzb21lIGtpbmQgb2YgImxpbmtlZCB3aXRoIiBp
bmZvIHRvIHBsYW5lJ3MgQ09MT1JfUElQRUxJTkUgcHJvcGVydHksIHRvIGxldCB1c2Vyc3Bh
Y2Uga25vdyB0aGF0IGN1cnNvciBwbGFuZSBhbmQgYmFja2dyb3VuZCBwbGFuZSBzaGFyZSB0
aGUgc2FtZSBjb2xvcm9wIGNvbmZpZy4gU28gdGhhdCB1c2Vyc3BhY2UgY291bGQgZG8gZXh0
cmEgY29udmVyc2lvbiBvbiBjdXJzb3IgaW1hZ2UgZGF0YSB0byBhdm9pZCBkaXNwbGF5IHdy
b25nIGN1cnNvciBjb2xvci4NCj4+Pj4NCj4+Pj4gVGhhdCdzIG92ZXItY29tcGxpY2F0ZSBh
bmQgbWFrZXMgbGl0dGxlIHNlbnNlIGZvciBib3RoIGRldmljZSBkcml2ZXJzIGFuZCB1c2Vy
c3BhY2UgYXBwbGljYXRpb25zLg0KPj4+Pg0KPj4+PiBJZiBhbnkgcGxhbmVzIHNoYXJlIHNh
bWUgY29sb3JvcCBjb25maWcsIGEgZGV2aWNlIGRyaXZlciBleHBvc2VzIHRoZSBzYW1lIGNv
bG9yIHBpcGVsaW5lIHdpdGggdGhlIHNhbWUgY29sb3JvcHMuDQo+Pj4+DQo+Pj4+IElmIGEg
cGxhbmUgZG9lcyBub3Qgc3VwcG9ydCBjb2xvciBwaXBlbGluZSBvciBhIGRyaXZlciBkb2Vz
bid0IHdhbnQgdG8gc3VwcG9ydCBpdCwgdGhlcmUgaXMgbm8gY29sb3IgcGlwZWxpbmUgYW5k
IG5vIGNvbG9yIG9iamVjdHMuDQo+Pj4NCj4+PiBJIHN1c3BlY3QgdXNpbmcgdGhlIGN1cnNv
ciBwbGFuZSBpcyBnZW5lcmFsbHkgaGlnaGVyIHByaW9yaXR5IGZvciBXYXlsYW5kIGNvbXBv
c2l0b3JzIHRoYW4gdXNpbmcgb3ZlcmxheSBwbGFuZXMsIGJlY2F1c2UgdGhlIGZvcm1lciBp
cyBjcml0aWNhbCBmb3IgYSByZXNwb25zaXZlIHVzZXIgZXhwZXJpZW5jZS4NCj4+Pg0KPj4+
IFRoaXMgcmVxdWlyZXMgdGhhdCB0aGUgYW1kZ3B1IERDIGRyaXZlciBiYWNrcyB0aGUgY3Vy
c29yIHBsYW5lIHdpdGggYSBkZWRpY2F0ZWQgSFcgcGxhbmUgdGhvdWdoIChhcyBpdCdzIGFs
cmVhZHkgZG9pbmcgaW4gc29tZSBjYXNlcyksIHRvIGVpdGhlciBmdWxseSBzdXBwb3J0IGNv
bG9yIHBpcGVsaW5lcyBmb3IgdGhlIGN1cnNvciBwbGFuZSwgb3IgYXQgbGVhc3QgcHJvdmlk
ZSBwcm9wZXIgIm5vIGNvbG9yIHBpcGVsaW5lIiBiZWhhdmlvdXIgZm9yIGl0LiBMZXR0aW5n
IHRoZSBlZmZlY3RpdmUgYmVoYXZpb3VyIGJlIGRldGVybWluZWQgYnkgdGhlIG90aGVyIHBs
YW5lcyB3aGljaCBoYXBwZW4gdG8gYmUgYmVoaW5kIHRoZSBjdXJzb3IgcGxhbmUgaXNuJ3Qg
dXNhYmxlIGZvciBXYXlsYW5kIGNvbXBvc2l0b3JzLg0KPj4gQ3VycmVudCBiZWhhdmlvciBp
cyBqdXN0IGRpc2FibGUgY29sb3JvcCBmb3IgYm90aCBiYWNrZ3JvdW5kIHBsYW5lIGFuZCBj
dXJzb3IgcGxhbmUuDQo+IA0KPiBBcmUgeW91IHNheWluZyB0aGUgY29sb3IgcGlwZWxpbmUg
aXMgaW1wbGljaXRseSBkaXNhYmxlZCBmb3IgYW55IEtNUyBwbGFuZXMgd2hpY2ggaGFwcGVu
IHRvIGJlIG92ZXJsYXBwZWQgYnkgdGhlIGN1cnNvciBwbGFuZT8NCkZvcmdldCBhYm91dCBt
eSBwcmV2aW91cyBtYWlsLiBCYWNrZ3JvdW5kIHBsYW5lIG1lYW5zIHRoZSBwYXJlbnQgcGxh
bmUgDQpvZiBjdXJzb3IgcGxhbmUsIHdoaWNoIGlzIGRlc2NyaWJlZCBoZXJlOg0KaHR0cHM6
Ly9kb2NzLmtlcm5lbC5vcmcvbmV4dC9ncHUvYW1kZ3B1L2Rpc3BsYXkvbXBvLW92ZXJ2aWV3
Lmh0bWwNCk5vdCBtZWFuIHRoZSBwbGFuZSB0aGF0IGlzIG92ZXJsYXBwZWQgYnkgY3Vyc29y
IHBsYW5lLCBzaW5jZSBvbmx5IG9uZSANCnBsYW5lIGlzIGFmZmVjdGVkIGJ5IGN1cnNvciBw
bGFuZS4NCg0KPiANCj4gVGhhdCBzb3VuZHMgbGlrZSBhIG5vIGdvLg0KPiANCj4gDQo+PiBJ
J20gbm90IHN1cmUgaG93IG11Y2ggcGxhbmVzIGRvZXMgdGhlIGhhcmR3YXJlIHN1cHBvcnQs
IGJ1dCBpZiB0aGVyZSBhcmUgdG9vIGxlc3MgcGxhbmVzIHRvIHVzZSwgbWF5YmUgd2Ugc3Rp
bGwgbmVlZCB0byBtYWtlIHVzZSBvZiB0aGUgY3Vyc29yIGJhY2tncm91bmQgcGxhbmUgaW4g
dGhlIGNvbXBvc2l0b3IuDQo+IA0KPiBJZiB0aGUgSFcgaGFzIHRvbyBmZXcgcGxhbmVzIHRv
IGFsbG93IGJvdGggdGhlIGN1cnNvciAmIG92ZXJsYXkgcGxhbmVzIHRvIHdvcmsgY29ycmVj
dGx5IChyZWdhcmRsZXNzIG9mIHRoZWlyIGRpbWVuc2lvbnMpLCB0aGUgZHJpdmVyIHNob3Vs
ZCBub3QgYWxsb3cgZW5hYmxpbmcgYm90aCBraW5kcyBvZiBwbGFuZXMgYXQgdGhlIHNhbWUg
dGltZS4NCj4gDQo+IA0KDQo=
--------------5ZLaToxS4uqacwu00ttjsSdc
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------5ZLaToxS4uqacwu00ttjsSdc--

--------------B9lRTDC7F0tqCqR5LD62HxIY--

--------------f4pQm6BYHqX3UxqjMKmAYiA4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmfsE0UFAwAAAAAACgkQX75KBAfJsRnD
5Q//dufNNnLrk1P44I4GS8wIcrVUf6LM3VuSN8nMJdqcjzjTJNA93NsUld5NIXuuDRWEH3+aLwsM
Kh/i7AqBtX6PabhQmSnlgrJLe3pWJ9cMKUk69/fMOOQtnxJUl17mzvru4SKx2WGJ5rmYk7GGwj+H
zOjMyvBHF2idWKxnsut8pToI6d081p5UGOhnDAGD/pOmRmkSSZjFPyj9w+zIUXlo+kevUjieqL7J
WuATFpesPx/i2rlORy5C9TM7Nchit9aDYq2hxIhV5FTu73VWThKD0qYttfUipu4kynDA+grmvwcD
+R1Y8SdJC8zzFjUZsTopGLWWojRnveq4mhd4MitcrzTyqZJ28YK68vRJ5ruRP6UD/WhsDFe6hEYZ
hDx3bTB7kJIu2Bl3aFHQG6vT6Hk8Bi5poUT4Q2zmou+5VZmtY6AXDIVlFcVd5NSrWk0Kkv3oqlQf
BlmR4grulFFJ8/4UXVT2VqmrhW0GapJoIhnB4RH2XWDRz4LPf6tpGpNs2UbfWEQ4zHRV37ZOFSt+
pYRuw/BgJm0FdK5WnWOW4hDzkwnphkvdb3Wr1vfU0R3i3MO2Ky3jecboPpLKPt7vYDw6k8okNAs5
MNGWrBPMtKQ+rxUiLq2LHVAfVUfjYPuqxvAScyt5rUXM2V2d9mq7wQwNKOW2bJ84zmUrIIOKrnYd
16Y=
=MPYw
-----END PGP SIGNATURE-----

--------------f4pQm6BYHqX3UxqjMKmAYiA4--
