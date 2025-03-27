Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675C8A7358A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34EC10E908;
	Thu, 27 Mar 2025 15:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qnx.com header.i=@qnx.com header.b="Vy+Z5TUS";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=blackberryltd.onmicrosoft.com header.i=@blackberryltd.onmicrosoft.com header.b="BDi9heTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-a02.blackberry.com (smtp-a02.blackberry.com [208.65.78.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A967310E908
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 15:23:03 +0000 (UTC)
Received: from pps.filterd (mhs403cnc.rim.net [127.0.0.1])
 by mhs403cnc.rim.net (8.18.1.2/8.18.1.2) with ESMTP id 52R6geMt005612;
 Thu, 27 Mar 2025 11:22:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnx.com;
 h=cc : content-type : date
 : from : in-reply-to : message-id : mime-version : references : subject :
 to; s=pfpt20241003; bh=3qpZRIZOO+9z0RHGwlr8APF7HK5bLSUtKIg6ODLVvCY=;
 b=Vy+Z5TUSjVbUb0xB7rAafDadwtJXZpcht5iDThDzCis7ef2lncaCfGwhOyWHw3jE6UHm
 I1NS0cHfybUGrnGysZpK7VMxGGRI8nWJIOIlvy0lvNMqJkG/kmJkpYS+Z7dX6QdMGDU+
 jyGCg+ZNjAXBS1ALWPTqrl0F785k0m7EsLLeKfSIKp3jaVTJs9FrZ3vYPUglcKXWSg/p
 +1cTSpvMBO5uUIKbCqtwFyZwSv/9WD2OmyzhMn0SrMYOML00H2d9CWACfJ/RdLrBVjQE
 kf4d0jLUbTfr+4sQoJjB61GErQxGptYtB9RrjtwsSCQsz76nh7C8eVmwSmQikD3g9g/7 Wg== 
Received: from xch212ykf.rim.net (xch212ykf.rim.net [10.12.114.212])
 by mhs403cnc.rim.net (PPS) with ESMTPS id 45jd358umj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 27 Mar 2025 11:22:51 -0400
Received: from XCH213CNC.rim.net (10.3.27.118) by XCH212YKF.rim.net
 (10.12.114.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 27 Mar
 2025 11:22:50 -0400
Received: from xce211ykf.rim.net (10.5.224.156) by XCH213CNC.rim.net
 (10.3.27.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Thu, 27 Mar 2025 11:22:50 -0400
Received: from YQZPR01CU011.outbound.protection.outlook.com (40.93.19.4) by
 hybrid-smtp.blackberry.com (10.5.224.156) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 11:22:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRAEWnVDYjBMrWMV4cCaCkHqeL+2TWb4nUVx/j48kKdB9LtIKr7aG9z425C9QmxIYTvmkx0H9lJkXxKNzE5UCl2FYbrz0BTO2Gju3vrzQNE7skqhnyXPuy+OOmwuSerNWXTHpZaJU8u1l25Lyq8bL2ppvOW0jZtwedJGjQe5d1hoZNPv/+BnffaNGsCvyer7N60FSE/FJL1NFHevjlD90GtstDe+WFygpTNnorUQ8DXoCfNMXcwTseuj/fbjte09iQ1TpbxU7+OKUCHrP6nUq3rAW6gbJDPuMoK0hHvMULlvZp4RjSrbRlkbr6CzgbMoUzgQF2ifGynnPlwoV5yTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+hQ4pMGvE7Y2m8LdqTaC0wCkm58LTYL/jAy68MEp/M=;
 b=CjNiflr7yh3J4m/iKEP6c7q+Oc3cpeYUOQuwHRLtG92ovWrTe0kGsXu8rewHM5QrUtX9/DzGd3tPX++yZZH4yjTANJGORePzpJ2KmAAnaYiGvIV+kSHWB0XWocYmVVpKrKm1c6V0ghWIo7p0t2nyt8jJoi80B/NT6HEaqH5tMp39gorShSQGJE46F8bZ9yqp6kyuKaB+Mwv+kpQn9tvt2NoiMalkZnWLvvn1SoeKl2NagC5vwmuWzkb6APCvFVzWf3613JYcpIy47GW8bKkNXb2woqatp3b4Zq7YFPUWYujypcAotObDYlUzW/UW1oYbAbArxPbyZpGmoiFof6II/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qnx.com; dmarc=pass action=none header.from=qnx.com; dkim=pass
 header.d=qnx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackberryltd.onmicrosoft.com; s=selector2-blackberryltd-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+hQ4pMGvE7Y2m8LdqTaC0wCkm58LTYL/jAy68MEp/M=;
 b=BDi9heTtmiExta2hbsRX9T5f2pUeDJSp0Vep1+SQ4U4+/QvWyq49WynxAekY9kH64X4IuOK12GfFUSJH4RUGLUx4iasm1Ab/UqGHWQ25W8Z4z79dhgv2FJkTMrwNuo4+GN2NRZ93QDY8XuweMejU1uSdDksnnmklsNSkT+RullA=
Received: from YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:65::18)
 by YT3PR01MB10638.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:22:49 +0000
Received: from YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4bd4:b377:328c:1d04]) by YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4bd4:b377:328c:1d04%4]) with mapi id 15.20.8534.044; Thu, 27 Mar 2025
 15:22:48 +0000
From: Aaron Ruby <aruby@qnx.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>
Subject: Re: [EXTERNAL] - Re: [PATCH] drm/virtio: Add capset definitions
Thread-Topic: [EXTERNAL] - Re: [PATCH] drm/virtio: Add capset definitions
Thread-Index: AQHbnZxHmdoVduxa0EubwmukDSLjSrOGJVAAgAD3T3I=
Date: Thu, 27 Mar 2025 15:22:48 +0000
Message-ID: <YT3PR01MB585774E6FED5EDC831EB97F6AFA12@YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM>
References: <YT3PR01MB58570C381CB52E7EF5B1E751AFA72@YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM>
 <c0695bb2-4f47-4e4e-96f6-1d6302d075a4@collabora.com>
In-Reply-To: <c0695bb2-4f47-4e4e-96f6-1d6302d075a4@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT3PR01MB5857:EE_|YT3PR01MB10638:EE_
x-ms-office365-filtering-correlation-id: cc213737-0e57-4652-3ed8-08dd6d433ba5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?jz6D2cxaGX37LGV+bL2h8RqbCmaiJkXLDtYUNArR9MuIpk5bMVen5Q2xp1PK?=
 =?us-ascii?Q?T+4VESMFlFSGOV/KwsTJs3B8h4ldXwRVqkFrdfaGSMMHiYaXf3F17gbL0XS7?=
 =?us-ascii?Q?y+Tz+z8n1TcUw3h7g6xYbe0KUh7LolOBU73ZySY5zW/3/dgE8rtYh6yZn3Ce?=
 =?us-ascii?Q?w6CyXDpaRy4IV6t6og/keOS++/lVWvxTChSerSEbWes8/tjLo0eFIPU+CQ2w?=
 =?us-ascii?Q?UOghofTmXl145V+T4sg5CSZitm9Oz+dMrBkb+8g1crd2c4p+o74uYGYQwrV1?=
 =?us-ascii?Q?ZGMpKWdUazr6W+lItBpeEv5q2GWbM+GULYF3pOKAQcDlJkdWZBuNMUS5VJIw?=
 =?us-ascii?Q?2qgoIf48sjkhbHiSBu7j8K4W3PjUgfR6fVyFv+/amC9MI3R5LI8f0G6kV/7D?=
 =?us-ascii?Q?VHmzkAMKLF2ofMCdzo9W1jNE4TchYmZlnCCUmBGsJyLc/5+/GwtJQZa+hIpk?=
 =?us-ascii?Q?6sd4HxT8uVOT/YtfsilrMQo3weV0wGG02VVNu5qYDWwlw10KEVXBZjFkyOFr?=
 =?us-ascii?Q?rtkQ3isULPeFvc3MonGqRgBbKadgoZJLQu9frT9q1RXkJBzMROXRaUmk5Sb/?=
 =?us-ascii?Q?SDKrNW0UU1hwMThjNBZm7PSCo1sBzt5g5Vob9FTfhaIRf597eUhp+zhlR8/5?=
 =?us-ascii?Q?xkED3ocXRMQu2vzubh/xPAMtFIvm5ZSmTUQC9D/6LFjYRVDikdD86mcMHDPI?=
 =?us-ascii?Q?kSpl5LLtwIFH5eyJXz20WtsqTGUV4aVKUrj3aU7l/2dApGWoHA54h/vCkWFO?=
 =?us-ascii?Q?epSa9+vfDWF+A0vhjBvbxHkHcI2tJbnvsUBdf2rTRWwN+OtDLFoVgz5n9G3M?=
 =?us-ascii?Q?JeJMY6OA3LI2MVRyUYMCgW0heCfENYdIEBjhmZ4DLM///ojtBxH5U6hTOMzP?=
 =?us-ascii?Q?t0Jc4dykUlUNpyGQB0ZXhBecwUkxfdJkcgSnC1iRFLvPeyjMKqfzXUiD8N3D?=
 =?us-ascii?Q?CfgoLtfIypevZzInh3cMVNGtZq7/1qrSoB8uVcaCoNFfDGZqFY3Lk42/iWys?=
 =?us-ascii?Q?cYHzXkOCYUvz1PhX8L51wBfXSGGmPPTJ8imNAFPA5Ym2hQaXdeWwoRVCqE00?=
 =?us-ascii?Q?Km95swLV8xgyc3Vpo8AjS7RzI27qMiK5rntsXNRmCp3KIkxa6CRzw1GTQ/xV?=
 =?us-ascii?Q?WKXHdxy5wxs1xRVVrC6HOf4Np2yeum3x38973+8ZhySsC8bOg+FEQD5a/Vqa?=
 =?us-ascii?Q?Ophb1gdCdDoW1QuwFtfcsI05kr8yswjm9zYQw7e502DWZMnGp32bncIR0Gi9?=
 =?us-ascii?Q?K3lh49TCjIYkb0W4ij+b2RDxayNBAZ5x/EsCSPBKOzfY0f8WgIpf/zMgUzNa?=
 =?us-ascii?Q?cYqg046OAqmyyP1IEmn3amplfWslzS+rREUZ/uzF+h7ZAm95CPmblSEOxyQ8?=
 =?us-ascii?Q?LlH7LqRsjTpnecWMLlDl+YKSY0EwcK11Fha5IIBZuUSviejEGCYtrPbgAu5C?=
 =?us-ascii?Q?7p7ucMmgG8u5U1D5ocbfPBHrYYjXSR/BqorPs4576o5u0q1Bpue48AYFvFYR?=
 =?us-ascii?Q?SfR2dMOz8bIKo9U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(13003099007)(7053199007)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O3dsxQcdxe+JgItDzpq0QaYMDqtIfXO/rsHUTgSCTk+1H7gm+ji+tSLLtbbr?=
 =?us-ascii?Q?OOs+DDFBtcOyY85n6QCw5mz/KqbXa8jrG1aYdUDG2qWr+8UfVNROSW6irgOU?=
 =?us-ascii?Q?aKTvNr2F2B3MnJTbWmP9vPJN1vUjZIkS5DqGlEixwolroSd7IVPhByqU1+r8?=
 =?us-ascii?Q?6XwusFml4yPzRCGUWjL69xJK2Ny5X8aGdUo/987gyw7gj8UFJHURi1AoN/Hs?=
 =?us-ascii?Q?+GzyiWJ7F3TCB1Axvp6WTjGCBcOz11mgjRuN78lIhIxMcjb45D/fo6lwKo0A?=
 =?us-ascii?Q?cHIB0df/OarWTu8lja8MZoB88lXsIFXO9ij3v1Us0bQizBWZmpX0cN8vXB9t?=
 =?us-ascii?Q?oIaW0kiDHNGysU8IQFPy/ojJNDV6Y2ahbzuYeYIu7iWcrGHgEi4PjIjlYCFL?=
 =?us-ascii?Q?NcnFecXMc18ymyc1Dgx8JtaSI1L3nq2OGem3T0MorEss1A0dvlNinxC1F3Hm?=
 =?us-ascii?Q?CQt/hEMXkSwC+8H50utfkZQ0IjgHWkvyPzzIRvXbgrc1I7EjwvSlMPxlN8CW?=
 =?us-ascii?Q?XE+Z2qMGRRUKKoohoYIifDI3Uygr8z9rzWIfupV4WM9oWkSlOf8K6AJktn7k?=
 =?us-ascii?Q?4iHy7oUAhxU8m7Vu0Ejtl4Ae3Q740AB7JFoxWl63UHn/jF1+KeU+ZK5C46yn?=
 =?us-ascii?Q?iFSiflOWpL5IiZW97OWMx+dJzlq7eoLd45qjYHcJgNXzkWptZ3lAaiwoltCX?=
 =?us-ascii?Q?OS/nRHwsRsRWgXe+K72l8E1KxTF1NiKmQJ8NC1RulKisiwTlEmq6aLPrCJ/F?=
 =?us-ascii?Q?3h958TI10iF5Q9BXYpn+ocuspreQHLlNgWQ37bcizY7dbXAGNA8wMZW5JRQE?=
 =?us-ascii?Q?YA9C2DGhg4eQ8mJ73Xk6sKeUF2i+N05AIiklL+0lpx+c0PxAeywqPRpW3vh/?=
 =?us-ascii?Q?cv5E/OWeb5HPgooYojacGpbfvN0ka2BgmvEXRsKMuQPbKryuQkgL7sLjK7ci?=
 =?us-ascii?Q?YEjwjwEpYxo4BtOXMbo/DxBi/LtFosjAJxAZ1D0VcZopOCLZFmvrpP+KJJHb?=
 =?us-ascii?Q?jt8iwtPp952hcpdJoX/MnND4sVOqqkq4HzTPblvpgUEheTkp1yEG/Pp5BrNW?=
 =?us-ascii?Q?BKi/fbw+bFiK2OEJeitz8gBjZ0b7/GsGFnPgdvLMwxAIRkoSGIM6LGME/KZV?=
 =?us-ascii?Q?z22N+IoGi9flZuNV+xXkW/tljIViWWqcSGJ85yk41jS+0gNgC9CVE5131bG1?=
 =?us-ascii?Q?4TGKeVB9s/mSfFWLkKkIBNj4/h1v1DgCeqZwrp3WYCAZ3pmHhNzKjeGrK4ja?=
 =?us-ascii?Q?WS2wEmAmW3Mq7/cwLIIq0VXxHvuX+VowSUnAQi4jAhZg+7WgjaxEhomtJ5Tl?=
 =?us-ascii?Q?UqkYvtBdqQNbOUNEPkA0kbIUBHSrNWBI/Xhxvj9lGpUwet/xM77+ff1VYLV5?=
 =?us-ascii?Q?yP9+pmO/y1AxsdwrDnkaaKGCMfqRd13UUJKhzKhjxivoC3WIHNIgD7HCMogh?=
 =?us-ascii?Q?SmBhqQHAx/eFv/LYwnqlsm1Tnk8SV7RkeqbsB8eAh9b6z9Pg2cb4R8ikIZHV?=
 =?us-ascii?Q?SCsbvweeQHi11ZrSTrduljtQHlXQM2oIgcC7kaXI8VyYjwpdNuyxpRqjjgwH?=
 =?us-ascii?Q?9p98DXm+arUiZ5nYmNUgVSnDNUJICM/2Y9WCY7aQ?=
Content-Type: multipart/alternative;
 boundary="_000_YT3PR01MB585774E6FED5EDC831EB97F6AFA12YT3PR01MB5857CANP_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cc213737-0e57-4652-3ed8-08dd6d433ba5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 15:22:48.6854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7fe064f1-1f82-4006-b05f-62ea659f38b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SHJ7r5ir/XWTtUuIpsSdJnwWsmBahQJE5FgIxYYW9K85ltUZioW5vZakyNEEfllWya+d6U0mV7QSnE+hS4RGfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB10638
X-OriginatorOrg: qnx.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
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

--_000_YT3PR01MB585774E6FED5EDC831EB97F6AFA12YT3PR01MB5857CANP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you, Dmitry.

I will post a v2 of this patch, hopefully which is formatted properly.

Thanks,

Aaron

________________________________
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Sent: Wednesday, March 26, 2025 8:36 PM
To: Aaron Ruby <aruby@qnx.com>; dri-devel@lists.freedesktop.org <dri-devel@=
lists.freedesktop.org>
Cc: gurchetansingh@chromium.org <gurchetansingh@chromium.org>
Subject: [EXTERNAL] - Re: [PATCH] drm/virtio: Add capset definitions

CAUTION - This email is from an external source. Please be cautious with li=
nks and attachments. (go/taginfo)

On 3/25/25 18:42, Aaron Ruby wrote:
> From 73e0b6fb04d90b70de1f40e8e2ffc8fe497fa204 Mon Sep 17 00:00:00 2001
> From: Aaron Ruby <aruby@qnx.com>
> Date: Mon, 24 Mar 2025 16:18:43 -0400
> Subject: [PATCH] drm/virtio: Add capset definitions
>
> Since the context-type additions to the virtio-gpu spec, these have been
> defined locally in guest user-space, and virtio-gpu backend library code.
>
> Now, these capsets have been stabilized, and should be defined in
> a common space, in both the virtio_gpu header, and alongside the virtgpu_=
drm
> interface that they apply to.
> ---
>  include/uapi/drm/virtgpu_drm.h  | 6 ++++++
>  include/uapi/linux/virtio_gpu.h | 3 ++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_dr=
m.h
> index c2ce71987e9b..9debb320c34b 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -163,6 +163,12 @@ struct drm_virtgpu_3d_wait {
>          __u32 flags;
>  };
>
> +#define VIRTGPU_DRM_CAPSET_VIRGL 1
> +#define VIRTGPU_DRM_CAPSET_VIRGL2 2
> +#define VIRTGPU_DRM_CAPSET_GFXSTREAM_VULKAN 3
> +#define VIRTGPU_DRM_CAPSET_VENUS 4
> +#define VIRTGPU_DRM_CAPSET_CROSS_DOMAIN 5
> +#define VIRTGPU_DRM_CAPSET_DRM 6
>  struct drm_virtgpu_get_caps {
>          __u32 cap_set_id;
>          __u32 cap_set_ver;
> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_=
gpu.h
> index bf2c9cabd207..be109777d10d 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -309,8 +309,9 @@ struct virtio_gpu_cmd_submit {
>
>  #define VIRTIO_GPU_CAPSET_VIRGL 1
>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
> -/* 3 is reserved for gfxstream */
> +#define VIRTIO_GPU_CAPSET_GFXSTREAM_VULKAN 3
>  #define VIRTIO_GPU_CAPSET_VENUS 4
> +#define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
>  #define VIRTIO_GPU_CAPSET_DRM 6
>
>  /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
> --
> 2.25.1
>
> ----------------------------------------------------------------------
> This transmission (including any attachments) may contain confidential in=
formation, privileged material (including material protected by the solicit=
or-client or other applicable privileges), or constitute non-public informa=
tion. Any use of this information by anyone other than the intended recipie=
nt is prohibited. If you have received this transmission in error, please i=
mmediately reply to the sender and delete this information from your system=
. Use, dissemination, distribution, or reproduction of this transmission by=
 unintended recipients is not authorized and may be unlawful.

Your patch is corrupted by your mail client or provider, please fix it.

Please also follow the patch submission guild [1] and add your
signed-off-by to the patch.

[1] https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/proc=
ess/submitting-patches.html__;!!JoeW-IhCUkS0Jg!Zg0K_O6-VeET8vUYePwY9svyqkBz=
H_cXHv1HSwXxMn41eHL8vDM_Yt9vNG7QxRSwKIScTq7pARaUTbW3HlBc_QMR$

--
Best regards,
Dmitry

----------------------------------------------------------------------
This transmission (including any attachments) may contain confidential info=
rmation, privileged material (including material protected by the solicitor=
-client or other applicable privileges), or constitute non-public informati=
on. Any use of this information by anyone other than the intended recipient=
 is prohibited. If you have received this transmission in error, please imm=
ediately reply to the sender and delete this information from your system. =
Use, dissemination, distribution, or reproduction of this transmission by u=
nintended recipients is not authorized and may be unlawful.

--_000_YT3PR01MB585774E6FED5EDC831EB97F6AFA12YT3PR01MB5857CANP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thank you, Dmitry.</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
I will post a v2 of this patch, hopefully which is formatted properly.</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Aaron</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Dmitry Osipenko &lt;d=
mitry.osipenko@collabora.com&gt;<br>
<b>Sent:</b> Wednesday, March 26, 2025 8:36 PM<br>
<b>To:</b> Aaron Ruby &lt;aruby@qnx.com&gt;; dri-devel@lists.freedesktop.or=
g &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> gurchetansingh@chromium.org &lt;gurchetansingh@chromium.org&gt;<=
br>
<b>Subject:</b> [EXTERNAL] - Re: [PATCH] drm/virtio: Add capset definitions=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION - This email is from an external source. P=
lease be cautious with links and attachments. (go/taginfo)<br>
<br>
On 3/25/25 18:42, Aaron Ruby wrote:<br>
&gt; From 73e0b6fb04d90b70de1f40e8e2ffc8fe497fa204 Mon Sep 17 00:00:00 2001=
<br>
&gt; From: Aaron Ruby &lt;aruby@qnx.com&gt;<br>
&gt; Date: Mon, 24 Mar 2025 16:18:43 -0400<br>
&gt; Subject: [PATCH] drm/virtio: Add capset definitions<br>
&gt; <br>
&gt; Since the context-type additions to the virtio-gpu spec, these have be=
en<br>
&gt; defined locally in guest user-space, and virtio-gpu backend library co=
de.<br>
&gt; <br>
&gt; Now, these capsets have been stabilized, and should be defined in<br>
&gt; a common space, in both the virtio_gpu header, and alongside the virtg=
pu_drm<br>
&gt; interface that they apply to.<br>
&gt; ---<br>
&gt; &nbsp;include/uapi/drm/virtgpu_drm.h&nbsp; | 6 ++++++<br>
&gt; &nbsp;include/uapi/linux/virtio_gpu.h | 3 ++-<br>
&gt; &nbsp;2 files changed, 8 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu=
_drm.h<br>
&gt; index c2ce71987e9b..9debb320c34b 100644<br>
&gt; --- a/include/uapi/drm/virtgpu_drm.h<br>
&gt; +++ b/include/uapi/drm/virtgpu_drm.h<br>
&gt; @@ -163,6 +163,12 @@ struct drm_virtgpu_3d_wait {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 flags;<br>
&gt; &nbsp;};<br>
&gt; &nbsp;<br>
&gt; +#define VIRTGPU_DRM_CAPSET_VIRGL 1<br>
&gt; +#define VIRTGPU_DRM_CAPSET_VIRGL2 2<br>
&gt; +#define VIRTGPU_DRM_CAPSET_GFXSTREAM_VULKAN 3<br>
&gt; +#define VIRTGPU_DRM_CAPSET_VENUS 4<br>
&gt; +#define VIRTGPU_DRM_CAPSET_CROSS_DOMAIN 5<br>
&gt; +#define VIRTGPU_DRM_CAPSET_DRM 6<br>
&gt; &nbsp;struct drm_virtgpu_get_caps {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 cap_set_id;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 cap_set_ver;<br>
&gt; diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virt=
io_gpu.h<br>
&gt; index bf2c9cabd207..be109777d10d 100644<br>
&gt; --- a/include/uapi/linux/virtio_gpu.h<br>
&gt; +++ b/include/uapi/linux/virtio_gpu.h<br>
&gt; @@ -309,8 +309,9 @@ struct virtio_gpu_cmd_submit {<br>
&gt; &nbsp;<br>
&gt; &nbsp;#define VIRTIO_GPU_CAPSET_VIRGL 1<br>
&gt; &nbsp;#define VIRTIO_GPU_CAPSET_VIRGL2 2<br>
&gt; -/* 3 is reserved for gfxstream */<br>
&gt; +#define VIRTIO_GPU_CAPSET_GFXSTREAM_VULKAN 3<br>
&gt; &nbsp;#define VIRTIO_GPU_CAPSET_VENUS 4<br>
&gt; +#define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5<br>
&gt; &nbsp;#define VIRTIO_GPU_CAPSET_DRM 6<br>
&gt; &nbsp;<br>
&gt; &nbsp;/* VIRTIO_GPU_CMD_GET_CAPSET_INFO */<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt; <br>
&gt; ----------------------------------------------------------------------=
<br>
&gt; This transmission (including any attachments) may contain confidential=
 information, privileged material (including material protected by the soli=
citor-client or other applicable privileges), or constitute non-public info=
rmation. Any use of this information
 by anyone other than the intended recipient is prohibited. If you have rec=
eived this transmission in error, please immediately reply to the sender an=
d delete this information from your system. Use, dissemination, distributio=
n, or reproduction of this transmission
 by unintended recipients is not authorized and may be unlawful.<br>
<br>
Your patch is corrupted by your mail client or provider, please fix it.<br>
<br>
Please also follow the patch submission guild [1] and add your<br>
signed-off-by to the patch.<br>
<br>
[1] <a href=3D"https://urldefense.com/v3/__https://www.kernel.org/doc/html/=
latest/process/submitting-patches.html__;!!JoeW-IhCUkS0Jg!Zg0K_O6-VeET8vUYe=
PwY9svyqkBzH_cXHv1HSwXxMn41eHL8vDM_Yt9vNG7QxRSwKIScTq7pARaUTbW3HlBc_QMR$">
https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/process/=
submitting-patches.html__;!!JoeW-IhCUkS0Jg!Zg0K_O6-VeET8vUYePwY9svyqkBzH_cX=
Hv1HSwXxMn41eHL8vDM_Yt9vNG7QxRSwKIScTq7pARaUTbW3HlBc_QMR$</a>
<br>
<br>
-- <br>
Best regards,<br>
Dmitry<br>
<br>
</div>
</span></font></div>

<HR>This transmission (including any attachments) may contain confidential =
information, privileged material (including material protected by the solic=
itor-client or other applicable privileges), or constitute non-public infor=
mation. Any use of this information by anyone other than the intended recip=
ient is prohibited. If you have received this transmission in error, please=
 immediately reply to the sender and delete this information from your syst=
em. Use, dissemination, distribution, or reproduction of this transmission =
by unintended recipients is not authorized and may be unlawful.<BR>
</body>
</html>

--_000_YT3PR01MB585774E6FED5EDC831EB97F6AFA12YT3PR01MB5857CANP_--
