Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118A0C2B191
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BB410E3AB;
	Mon,  3 Nov 2025 10:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="WzU0LqeU";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="QIiwFM45";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7EE10E3AB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 10:36:59 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A367kQh1116482; Mon, 3 Nov 2025 10:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=+IJJLwWlbH/50k6qVyJiJ5yeJ
 zthRb6VQ24+dUJRtBk=; b=WzU0LqeUG27bdOD1vd+lrwZNQpBaPeaKrGu5DNkf9
 X7OjkyXjBqbtdkn90Ex9i6AIn62GEGlUKHEYzFuMTPH1Si3UjXrOFVcDtYEIproY
 aD85xtcaVwbXr74yZKdpQiYdpoobofETVbyof19wQcff895PlTDG72rg+JJOM2Bo
 WwFF7gjUzwqni5RH1nw6muDlJBVCaDK1ah6vmD4WfsepmyNPIj1h1xetxOODmQeD
 n2VAo/iGvXiqpcweRitO0jB+VsxtPgxPfNbTpt3CASJD3W91c9vwyuosbppiNyqf
 Of1sZsTsAu+2B9EkgwNjAU3qBRvHz9AUeUJK93RGyN8xw==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021085.outbound.protection.outlook.com [52.101.95.85])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4a5b5w9cg8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 03 Nov 2025 10:36:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhDXoB4aRHksMoadpYBZiezNwf5SdEZa3QACKgwcUibvJYXOqScARX1KkCErCpYMCYyNAcg09ruEIBcm4AGjc3lXMYkkroNfVsHdNC6Qv9XXRkHUBH64R0kc79KmzpbFvvvy6C8PUAfYAggWCTgfPhaS9cWPcCL85pXA0e66IBleBGt1+P8GwWE+ZlVjc16L1kSafwmqNGLJEfOHk5fZsDUaBqD09oIZc4f4nm7Zxl3ZWafbZSxdfaD5cQCCG9VwnExjFgDhYJDCawG75P+TKukCDMzcJBXoF1amx4a22gp/r8iwjgvZBSmxesa9UDmFHj1za5ZBzP8At4mSTPXWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IJJLwWlbH/50k6qVyJiJ5yeJzthRb6VQ24+dUJRtBk=;
 b=rr1spWkpcV0/uzeioBBWqxgEXii0Uu5KL/hqHNBMWwhAlSf1qBb5/8kzkfMyHM05oF53LDE3jYjrs0q9t/mEcc62rRj5Q+3/uW4guzPKIBPrFGgwYD5XaCSWhu1vZh8VS4bqhsL1eRaHDKxbeywTpexZ4U9HW5CJWfFvkycHnQpu+Cb+rn7TT/9Pke3QIB2fVgm/80iprT0mjS2azse8QJwZBpNdd1kkJpWLeWZXyqHxza8pnSQ/mVuwNv5ize9c+13AYPmyNb3lxG6sqJWHaCsJTf6P8/ZaCuek/4I7VH601m+bBpUY8qZfbx/cikzfmAXMPnsDA3Ix/sFplC02Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IJJLwWlbH/50k6qVyJiJ5yeJzthRb6VQ24+dUJRtBk=;
 b=QIiwFM45i0tQuKdZILbQnpQ3K9PXxaUNJTB8REuerdWAB+cbGgDaVZjcFqtVZ0QWmAQUrLXaWDnIUTULr6BIa3ko3jLUojT7TwT58zBntglV8NM/KDXDB1tGo9tEKUPzHg9PahhzY0BEyMh3tlW2qYOlNg2gjzAFdimkINj06C0=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB7285.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:308::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Mon, 3 Nov 2025 10:36:40 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 10:36:40 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>, Alexandru Dadu
 <Alexandru.Dadu@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Depend on power sequencing
Thread-Topic: [PATCH] drm/imagination: Depend on power sequencing
Thread-Index: AQHcTK29NiE/bmLC+UuYnowjqeGt0A==
Date: Mon, 3 Nov 2025 10:36:40 +0000
Message-ID: <b9625d6d-93bf-4c33-a20b-044e680f81af@imgtec.com>
References: <20251102184158.264378-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251102184158.264378-1-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB7285:EE_
x-ms-office365-filtering-correlation-id: 59b95f24-b7f0-4722-b2c8-08de1ac4e00e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?Q3pDUFpJbWlOcXRqeStpZW91RWtoamZpT3h1TVhoRGtMcHYxYmVMZGRRczlN?=
 =?utf-8?B?c1d0SklhUU1JbyszaFhleFVYdGpISllCek80UFVTYVN5ZFBFRWh5WVdiaUVV?=
 =?utf-8?B?OUhYK2gwdTdrSGxOWUZVK1d5ejBsSkJocmc0SnpDMmFiY1V5ekR5dm9sYVFr?=
 =?utf-8?B?ZCtrNzVMb201NGpaNmpvRDBiRVdqa1pVR3ZtSFRPZzdwV29aMFk4SGF5djla?=
 =?utf-8?B?UFFydVQ0dGhteWEwTENZeFM2aTFVb0JCRFJKSFBhNUErdHRlbXUvZTN3RllK?=
 =?utf-8?B?STdta3o0Vy9IZndiT0FHZzJGbURjZDdHNlZRU0xZRFFCVjBZQ1B5VjJFNzli?=
 =?utf-8?B?Ri9Tdjh2Rjk4WHhiSkwwVzdlTjVhdzVSNHZqNnZQYit2NVd2Um9RcTN5UndK?=
 =?utf-8?B?SzMyb1cvVVE5WHhoN3lTbnE4OTFNRFJLYVcreVA4QXo4VkVONVZsYlcrWDlo?=
 =?utf-8?B?dU54Ymg5VCs1VmZZT2dLWE8rT09MOUR6Mk5zYTFlRmo4aFBWK3Q0bjdvUmJW?=
 =?utf-8?B?ekFpaHJDQXlWbTI1Z0pPSW5WZ1JxVHUwZ0lBOG4ya3NMWFVXWnVPVmZ3MGdD?=
 =?utf-8?B?VTRUbXc4SXdMWXBCbm5XOUdIQTQvS3NDSTIwblN2L3lYbkV3Si9lQUxTais4?=
 =?utf-8?B?NzZFc3ZwUjErMVR6S2x4Um1zRThyRlVad2UraStzUWRFVkwvSk1RdzJZTXFI?=
 =?utf-8?B?YnV5SlEvcndPQ1VFaG9BMVdnN2hTRnp4K2RQZU4vdk95TUQra3hjbXNVR2VH?=
 =?utf-8?B?VkZwZzRwSE8wU1BqbHNTWlZjMmJzZ0JEMjY4YzFNRU9jMXdrVHlHVWp4RWNt?=
 =?utf-8?B?Z3lYVEZyNXJQcFVTSWpQcENZRFJnQWE5RHhhWDcyZ2FjUkdISEovUE9kK0JK?=
 =?utf-8?B?UmJuVFBzNE5RdUU0MFdpQkF0ZFM3UmpIWkY0UW1xOStCRC95TUF4RVNSdnNo?=
 =?utf-8?B?dDNyTnZBT2VjZ0tnSWltcko2eWlHZkwzeUpKSHlmcUhnZStoNFB4QkJZQzZ4?=
 =?utf-8?B?bnQ1UFNhcjhDR3VBa1VnK0gzaFgxVWhGVi9vSTdwcVhOMXRScTJSRUVzMlVy?=
 =?utf-8?B?akFCVGhXbWo4ZjkyaTA1bm1xVGtpZXVvU3c2QUdYL2FiUzRielNxOGVwaWFO?=
 =?utf-8?B?eDhUSm1JczZvY3E3bURad0Y1YVd0OURnSjBwcEp1akdXcUxYeUp1RE5tUndS?=
 =?utf-8?B?QXVvVzZ6ZG16RXY0OE5BVGdYbk9aMW5QY2lsR3hDZml6SUJmZFJUcmg4YU84?=
 =?utf-8?B?eVQ2NFZsYWJQcEcxRlRJT2s5TXZtV1BrcGk4Vnl0cERBUnd0RkFWVlZLejB5?=
 =?utf-8?B?WVp2WENicStjT2JwRU5vaDVpeWs5ZjROY3dIclFaQ3loQzUxMG8vd2Q0Vitk?=
 =?utf-8?B?clBNNjJRSGFGUitFS0U1aFhaR20zYmlKVFdJTC8rL0UrY25LdU1ZTk02ZFh6?=
 =?utf-8?B?dkhVY1NQNUwrSy9yQjJDc2tKdlBWQUFpbkx1QVgrNEszbFZRdmNkS0k3bXU2?=
 =?utf-8?B?SFJkOW95dTRRTVlZQStjMTNVTjJWT3Z0ZkVZOExXTGZTM1p4cVJSOUMwOGcy?=
 =?utf-8?B?OG5RZVg5SGF3cER1WnpabXdQN3RqQjBNZVZmaGJkeUJLa3ZNUnlJR2VLd1hm?=
 =?utf-8?B?bTkyUTFra0V2Vmp4SllkUDZacEF4ZHpzdGMvU2EzWFM2NHVjbU1oY0hCY3Vy?=
 =?utf-8?B?WXMxaTRlVzUyWllSYkZHTVFvR2dlcmx0OE13UkVQMTk0NXJUMjVuL1ZOSS80?=
 =?utf-8?B?ODFzYXBKQlROaElVeFBXQkZXaTN3ckV2M0QrbmNmcHdDb2lVTS9saGlrWXhW?=
 =?utf-8?B?WGlJSWlvcGFreXdtVVd6cC81SkdyQVV2RlBNQVBxMnBuTytaeUEyS3hrNDFl?=
 =?utf-8?B?U21renFBWE05WVdWbkZpdHoxM1RxRGJYei9QWU9TQUVPSEJPM0xWT3BHaTY5?=
 =?utf-8?B?Q2NkNjEydmxXd2RqYk1hOFVMRkpnYWZxOHY3eDluem1PQ2Q3V05PVW4wUXZp?=
 =?utf-8?B?d1F0RjFzanptRUJOamMvVkh0YXBEd3RkWXg5WTN2REFxYnNXdGNLTXcxSlhO?=
 =?utf-8?B?RDIvOHJCcW1oREJCOGxsbXdsY2xtSmtuektEUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(4053099003); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qys4RC80b21NN2VKREYwdGllY2Y3ZmdTSkowWXdWK1I3d29zRWtwU3FITWlu?=
 =?utf-8?B?UlZVQjkxbm5tbGc0Y2NmV3NmK1VlUHIzZ3g1R1RqejcwdDU3dnc0eUxUUXlz?=
 =?utf-8?B?SkRpd0NqUGJVZmNlVGoxbjU3dnZIcWhHZHFOWDQ5bGt6WXBmZURsRGl0a3Va?=
 =?utf-8?B?Nm9kYnhuZWVZZDlYb3BqNnZtZUM2WEE5OGtMSHhHTjVPSlZxcEpKVlpnN00r?=
 =?utf-8?B?SW9KdU5CcU9sdi9TVlUrMkFDTnFWdE5WMlNrM3VoRFN3SmtHSEVIMFhPMG1a?=
 =?utf-8?B?clNxUjBuZE9BakdEZ2o4czUram90dUxZZk5iVzh3TS9uc082NzQzMThNRnNh?=
 =?utf-8?B?TFl0cWZGdGZPL3VRUzlnY0RKZm5iRkRIdXl4QklySlpyeE1NQTFOVUE4cUsr?=
 =?utf-8?B?R2huZG92eHliK3dHeGJJcFh6aWZUa09mNnA0aDFXeDhTazNsODhwQURSZUVE?=
 =?utf-8?B?V3FFRzFyOS8yaEZOZXEzdURBbTVESm5wMWNqTU0xNEV0WFh3djl1ZjBvUFFH?=
 =?utf-8?B?cFozTmJJK2pkeTYwL2ovMkloTGhZZjM2WGNUcXlNcjllQ1l0SVZOdm1iTlBJ?=
 =?utf-8?B?RVhBWVJLbENWbEkyNGVwWE9xZnUxK2c4L1czUkVyV3d3V3N1NkZjbGk5UEVo?=
 =?utf-8?B?cy9oYUpEN01tMTJOclpBTXdIOWlOOUd1YjNtZlZ6bjRicGR2eW93emRNcUpn?=
 =?utf-8?B?VTRHbko3K3hTS2ZGOUdQVldKYnZDYmJrL0dlcU9SdkkxcjJSYmwyUXh4S3NO?=
 =?utf-8?B?NzE4VzV6V1RpZy9tT1hTL2I5empQQXBwN29pdTZuQVlyazBDNTBFa3BOZVpm?=
 =?utf-8?B?TlVMeE5QUUFRMk9KV1l1UWRFcTBMcGZEK0RSNFNvVFZZZWQ3VzlnOFFJTUZW?=
 =?utf-8?B?SVlHUUg0T3dzejNLNG1ESXRiNDZYSDlxck5RUnR4bVRxcGxuS3R5eUcraWdv?=
 =?utf-8?B?bXh3NnNIQytVY3owVVpzOFkyK29mUnlaSHFlWGlhU0VpbDRQS0U1V3p1TFB5?=
 =?utf-8?B?NlpSd1M4b25qaU1kbHl2MFVkcE5pUmFkbm1kd2pjZUtOcHdEUS9VakRpL1hD?=
 =?utf-8?B?d3FZc2xyaTRDMUFnREZFMVVGZVZRSXhvNHpDaFlNb2NkRzgycmZVSFlYTDNG?=
 =?utf-8?B?WkxkanJMbzYvdkNZRGE0STlkZ0FHYnVIS2VDdnRXdy8vRkt2bG1DUFBiNlFJ?=
 =?utf-8?B?YjlkdGViQVV3MHg4d3VpemZLN3hNUnFwVlEvdjdoN2o2aWFkcmxETHl2UTJi?=
 =?utf-8?B?blpUWHhNYW1qN1drajVzZStxeXVkSzFXU1FMV1c1MTNRTUJpMWtXWnNoT0p6?=
 =?utf-8?B?N0xWN0JNS3VCZUFTTFFSdlJaNXFqR3VIQkJwcmZuT0I4MWlHQzRMZS94VEow?=
 =?utf-8?B?Sld5ck4yd2hVaEFRRHY5TzNzZjE1Rk9uVHpFbHd6OWVrV3Z3VkRQbk9BRmVY?=
 =?utf-8?B?WnYxeDhEenRVV1pBSGV4Y3J4bW1yeHdReVF5bmJScnV0Y0ltOHFzVXVKS284?=
 =?utf-8?B?K20zSW96aXE5ZTFWTFN0d0tpZXNtY3I5cmpFQ1I2SENTQ1VFeEs0SGUvVWV2?=
 =?utf-8?B?Zit1TGc1U3d6cWNVMXBrenE0UjZsUlkreFFTNWVObU1CZjU5KzI0NVVacWk3?=
 =?utf-8?B?L1p5RDZnaTFybnRqOC9lQkpLc0Q4dUN5dDZRM0U1bkpnSHdJLy9BMlNGQnd5?=
 =?utf-8?B?WUFPR1Q4dUhTc1RsRTEydGM5NlVSQUJ6aWloTXhlS1pLSWhRQ0tOWFBFY0tt?=
 =?utf-8?B?WDYwbnZZQmtIM2pjVHFMWmVjMFYrcGYyUUg0YkNhT1hVT1NvWTVMQ28zQVFz?=
 =?utf-8?B?TzljZExjRXUxVGNzYVYvVWlrOFloRFpEL0NLQjVZWWFMcFU3VGJnU2pTRzZu?=
 =?utf-8?B?M0lCQU1kNy9jSmN5TkZVUXh5UVV4SUZQaWRidFhCay9MWnIrV3l1YnlDZzY2?=
 =?utf-8?B?Q0w0ck9oK2ExOWNRd0F6b3U4dE94OXVFbmxCNG5kUGhRanl6UzA4R0svVUpH?=
 =?utf-8?B?NEFoQmgwSWJRM0JDaFBjVGd0L294dDFCMUE1QmFnb081RGdhaVZDOTlva0Rw?=
 =?utf-8?B?YU5lY1g0WFBLa1N4Y1dFbS9JZlpBVXp0QWVobkFzYmZuWXVoOEhtMERHOWFM?=
 =?utf-8?B?ZDNQWVFGQlluMFhTcENvOXZ5eEx0bGgyMitiR3lUNWFlMHltcmhEcnQ2b3FB?=
 =?utf-8?B?a2c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dT78fwanlHg7e0uWwHDLdYNE"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b95f24-b7f0-4722-b2c8-08de1ac4e00e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 10:36:40.7965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dM+Wcc48nFFpQK6j/hKwjtlYTh9U5sWDxSNTJz5mE/uYDAp2s6idDOx05/Iwj22TBwQ8RReCx2MrICl0LHsEbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7285
X-Authority-Analysis: v=2.4 cv=KrdAGGWN c=1 sm=1 tr=0 ts=690885c0 cx=c_pps
 a=1CbwQMJI/cibt1KAZ2VugQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=QyXUC8HyAAAA:8 a=b3CbU_ItAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=S2FLAo3L4qEqFndonAgA:9 a=QEXdDO2ut3YA:10 a=rMM0vjyBPkvaw3GELqEA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=Rv2g8BkzVjQTVhhssdqe:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 3oFeupuTp9yYJc0zs6FhAL3yX8ctIurb
X-Proofpoint-ORIG-GUID: 3oFeupuTp9yYJc0zs6FhAL3yX8ctIurb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5NyBTYWx0ZWRfX4wLC6lVQogZn
 1mUTolyEhNFwHBhnvCZcByoowwr9K/1R1aCYUGzsuKjg61355r6Hy6waNQ/XgjhJvfrnfQOn0ND
 h4UUoW6oj8UDoBxz1GQRUpCcjcO5EZYrxwpuOP/lpYVwhi32kYPWXQ8msrIP2aS5wt3rzK6usct
 fnwKy7/MtpaY4T00EjDWtA25eb+ZxdCdFo8MrhStEWyQP5Ef6kj5FijUm4pn7LVousgMYphu4Hn
 f0B3/w63pJGwP01qMOwYENrZR8bN4PTE81M4GiN9k3jauDEbfc+5l/fncCWKDWeFYkF9jvcAlZb
 48UsGWagfubZkhkg9SG1Tg4ikWL+wcSJ7X2Z6Mp/vSKiwa+P3818cpk1fqV7at6IMbAVmFT1Y9E
 UZwNyd/h9rd0redYfLWIOhy8KwPAZQ==
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

--------------dT78fwanlHg7e0uWwHDLdYNE
Content-Type: multipart/mixed; boundary="------------EJrVUzO8KGz9IJJ5iyBRxZRJ";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
Message-ID: <b9625d6d-93bf-4c33-a20b-044e680f81af@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Depend on power sequencing
References: <20251102184158.264378-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251102184158.264378-1-marek.vasut+renesas@mailbox.org>

--------------EJrVUzO8KGz9IJJ5iyBRxZRJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On 02/11/2025 18:41, Marek Vasut wrote:
> Since commit e38e8391f30b ("drm/imagination: Use pwrseq for TH1520 GPU
> power management"), the driver calls power sequencing functions. Add
> missing dependency on POWER_SEQUENCING, otherwise the kernel may fail
> to build if the driver is built-in and POWER_SEQUENCING is a module
> with these linker errors:
>=20
> aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
> aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
> aarch64-linux-gnu-ld: drivers/gpu/drm/imagination/pvr_power.o: in funct=
ion `pvr_power_off_sequence_pwrseq':
> pvr_power.c:(.text+0x70): undefined reference to `pwrseq_power_off'
> aarch64-linux-gnu-ld: drivers/gpu/drm/imagination/pvr_power.o: in funct=
ion `pvr_power_on_sequence_pwrseq':
> pvr_power.c:(.text+0x88): undefined reference to `pwrseq_power_on'
> aarch64-linux-gnu-ld: drivers/gpu/drm/imagination/pvr_power.o: in funct=
ion `pvr_power_init_pwrseq':
> pvr_power.c:(.text+0xb4): undefined reference to `devm_pwrseq_get'

Thanks for the fix! I did send a similar patch[1] last month in response
to a test bot report[2], but it slipped my mind to chase an Rb for it so
it's never been applied.

Do you mind if I take the earlier patch instead of this one, since it
doesn't add a hard dependency on POWER_SEQUENCING?

Cheers,
Matt

[1]: https://lore.kernel.org/dri-devel/20251014-pwrseq-dep-v1-1-49aabd9d8=
fa1@imgtec.com/
[2]: https://lore.kernel.org/oe-kbuild-all/202510111806.CMulNMKW-lkp@inte=
l.com/

>=20
> Fixes: e38e8391f30b ("drm/imagination: Use pwrseq for TH1520 GPU power =
management")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/imagination/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imag=
ination/Kconfig
> index 682dd2633d0c..40ee08f72995 100644
> --- a/drivers/gpu/drm/imagination/Kconfig
> +++ b/drivers/gpu/drm/imagination/Kconfig
> @@ -7,6 +7,7 @@ config DRM_POWERVR
>  	depends on DRM
>  	depends on MMU
>  	depends on PM
> +	depends on POWER_SEQUENCING
>  	select DRM_EXEC
>  	select DRM_GEM_SHMEM_HELPER
>  	select DRM_SCHED

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------EJrVUzO8KGz9IJJ5iyBRxZRJ--

--------------dT78fwanlHg7e0uWwHDLdYNE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQiFuAUDAAAAAAAKCRB5vBnz2d5qsGX9
AP47GAzWY9CNqC4mo8dxcq+tdh7nb/5VFbGGl9bLJxyY+wEA91+Tc8L0ONgZDZGpw5EJHr9xrVQv
tVxUD8eeBUjyiQc=
=fwne
-----END PGP SIGNATURE-----

--------------dT78fwanlHg7e0uWwHDLdYNE--
