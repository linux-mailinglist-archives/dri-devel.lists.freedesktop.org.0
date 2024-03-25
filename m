Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35927889BB6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 11:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D715710E776;
	Mon, 25 Mar 2024 10:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="B8jFvfUc";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="C73Jyiuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA4B10E772
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:59:32 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42P9ApmK020233;
 Mon, 25 Mar 2024 10:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:mime-version; s=dk201812; bh=+tuol7viuqSxQknuOCtJd
 5/fKgH84DvIGf94lOZ6Dog=; b=B8jFvfUccjCHAI2nQ/kzls41SjDZauJevyF9l
 s7DfTQ1/V6BKarI3SWWcrb3ut0QVfmDJkfsLnU9gUv07d9py9Nvy2lnAbbKUOUaP
 2ZFDqNwz2WpiTtz9+y0kY3ngGotI1XkJdhEFLam/lZsqw9KKWQSTvK5dWsMIIcGC
 jmJXPGACRfQiwz7n/nMNDSOeHsztLKi+KmKFbosXYm7nVrushpfy0KxIt0sGpBRR
 jsVu2kPVWkJM71kzJdrsBvwr/6OiyGxnf59NemieCQV+u8Wef1nmuww6FzIZ+fNM
 dIVILAf38RAxeCUb3/7Qp7ZF/WAFnSl9dPXnkUajEuEhjaX/Q==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3x2gj3swjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 25 Mar 2024 10:59:09 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:59:08 +0000
Received: from CWXP265CU007.outbound.protection.outlook.com (40.93.68.1) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 10:59:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n219/escTCsPeHUDKYfbTp/l3rkkMQHonvVMCZdk+fzkf8ham4n7XakA3p48pXnUjmfCwXupqSZQTl4WCpQcCCuJHSJL7QLdCx2Tvuo9x51CTOY544iewxVcXyTTTkLe+kswPHWHwuxlOZC2AvNwvW4SXPUz6QPltnpyU1jh6oZ1BFciZo7k8uEdG7tqNcVIlXUQ1B106LlVweNkfNZPVHwC68nMPTF+P9JDNnCx0BM8bWkcEmfyWUGROhwZX+RnMxQqbeBwMlWnhCmpk0IwHPkiWO6iB2HkEr0mKBpq0rEEijQXCg8TNwS84A8bb4pmfqN3hEgq82HhXKz7N79tdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tuol7viuqSxQknuOCtJd5/fKgH84DvIGf94lOZ6Dog=;
 b=UFFZWqPxAj+5u2VM3/mHXBs7/CXU1LreaZ7l3OXa69yGXiVojWprsjQjcwGEkm/ojALlb2mBnUPVbhHjtIJBcWAnANe5rF/F8ppgPDOS7B7qe5NZ7Du/4AZHBcNT20a0XRgwy6B6kXbvJvWPQ3+F9ib1u+NPF6dFaVzaqo0F+qbmtRc6LzvW3a+6dFEz/DJXOVaaH6VDw65ufQaajtKr3af2lITbPojq73pRe/o8RRjqy/yVEp50mrYx90HBhTqV4PygOeoeXy8kuNO/wnfbuD/wkQHhS/pHmYsr4F1zNm9af9228f8/jRb3HNRHhwwpdgDFA63TGTMC8vHLzYfBFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tuol7viuqSxQknuOCtJd5/fKgH84DvIGf94lOZ6Dog=;
 b=C73JyiukgSfXIohCPrCzd7wP9MEmon3lKxD1LGe2uz/D3Jhp3ORGsJ8tem+7icVhynxhoIHWZXkQnQt19vzLgsVv2yZDE14qHcVRvdjE3E5bw4RKQy2AAKMhRliUN63HOHcUWyMbGI+zqL69K3s26mF1+eoH/ArO7YGIJLJminE=
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::5)
 by LO4P265MB6633.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.30; Mon, 25 Mar
 2024 10:59:05 +0000
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::92e:bc74:c95e:719b]) by LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::92e:bc74:c95e:719b%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 10:59:05 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, Arnd Bergmann <arnd@arndb.de>,
 Donald Robson <donald.robson@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sarah Walker <Sarah.Walker@imgtec.com>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] [RESEND] drm/imagination: avoid -Woverflow warning
Thread-Topic: [PATCH] [RESEND] drm/imagination: avoid -Woverflow warning
Thread-Index: AQHafFkcvhCoCClyMEuApMVRByyMZrFITjWA
Date: Mon, 25 Mar 2024 10:59:05 +0000
Message-ID: <9bf99e82-1f7b-4726-83da-591ed8b352a4@imgtec.com>
References: <20240322130124.902165-1-arnd@kernel.org>
In-Reply-To: <20240322130124.902165-1-arnd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB3404:EE_|LO4P265MB6633:EE_
x-ms-office365-filtering-correlation-id: 14df7bc5-2148-475b-caa8-08dc4cba96bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4ow02IfklhZwCmRVWM76qR3OdK/IWP3BeVmExCRcKAeiQQf/Xs8+j657f0IkqtzgXMivIFG/JpUnp1F2FPwMOYd04IVn63oL+g75jqxRKgZL2bQ6cSWT92sXIZdenggt4+sEh6gzPD5Ja3VoUTVEoOIIyll7kkzrLlgsUWUT6e3Po3WzD4H7gO12q//IUBgeVau06f0LXgwwpDuvO+1GTHQSNlA3V8CHJd8HdDUO3VD3u1eBXkRZVoWcLGTKiQNYhDsX/8mVM1O3ECjjXOKredn/RFThULGlLpuX4ulpWAY4IJD+EFMMaqbzrIfkR3MdYwAfbTwfCCr19qRK/hq21udfSZfYbcYGHLIIrX2b3JfclKQ12m7PWSv8YIjS3RyhxYF4+QjQLtsvVoIEAn4ASLGfBoSGQtjCN3gIyxqm001v+W2ipHIphu2TiBNwjlFN4j3ESqH3N2IcFHudFp4+he97Jf876IaxF/OjE9mDkGyQ9Szx4oj4+uaLTAuG8ASHn04R4Au4404opVH5EgEFhB7x/ubayHG0xLechgDaAJzEDiM+ROZBmyJ1cdWKc6KTuLnUGmXY7dxlnY1zIQ7eWOmmKj+26SHWB/mLCGALf5hFsHwk6AM3aYE0ZlX9xTL8sAvrmAUwLjBm6dN7PLKdZ1I/hPYa4liWaTR3IdyuQcg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmRaV1dBM0IrOWVtZVp0cHorcmxsbzk5NjVBSzVLcHlSMUpqb2wvTERIWm5Y?=
 =?utf-8?B?UGZKbS94OVl3a0I4TllLdlJUL3Bqa1FRZk55SFExeGNLTnBpN1dBMG9QNm94?=
 =?utf-8?B?b242dFIyRTFzNStrUG9Dd05tNUJueXZBQzZYcE9zcWVMOHFwMU9mZEhlQjBv?=
 =?utf-8?B?SHpDaWluUVZBbmNjWU9TeThYdndIejFLU3BGSlo0TEN4NDlsbDVORWtpNVVZ?=
 =?utf-8?B?b2hWcCsyaGFqbTBsVlRYR3M4VHM1cVhXaDA1NE5veWo0SnJQdGo3Y1grWGo4?=
 =?utf-8?B?MXNkc09XT2lVSWJxeFNYWElRZHZ3eXJnaTdINExLOUNtK2tEcEpObHpjNG5I?=
 =?utf-8?B?SFI3OU1zY1pSV3gzcTV3RkZHam0xaXZadndXb2RiSVpBV2JENXBmWnU2SXNK?=
 =?utf-8?B?a0FDNFFRa1VZZFVhb3hoc3c2akVibk1SUlVsRUdWMkVBNVBqWjMxYkx2MXZV?=
 =?utf-8?B?MGliNTI5eHBrYXgrQ0N2enMvbU9RR1hacDByeTg1RkxYY25ObExNS1FCUTM0?=
 =?utf-8?B?NmtnaGExSTBCKy9rWGxyRXBlSHlyUUFTUEI1YjR3RlJqRDR3QmZ3a2hRYklp?=
 =?utf-8?B?cm1IRjl2d0RmallxN3FtMEpyS2hiejdiaEpOdURoVkpvOUg4OTFHU3ZVcDJD?=
 =?utf-8?B?b0h2TU10RmNBYUFOa09vbFV0dTQxQ0ZvR0pwbUJsZEduUXVqSVA3RjE1MTU2?=
 =?utf-8?B?UDREQ1QzVGp0WkluWDA2OGowcUxVcHJGQnpsOGs3SjJIUW5ra3AwSHZhMkcz?=
 =?utf-8?B?bHRRZnRKN0k3WU82Q2c4MlFEVDdyWHRxMEV3MG5RK2hQa0paLzBtWmc2MUFF?=
 =?utf-8?B?dWZoN0lUZVpCSC91dnhsZTR1RDNJNng0dC9hdVlzKzJsNzBzQlovWDhtZjBP?=
 =?utf-8?B?aU5YbEhZYXoveWNXVWcrYU9SSzM1cHQyeFJEY2g1cTNLeUNQczhhTTIyOWVy?=
 =?utf-8?B?UEoxbk1BNG5aMmJiem5WOTdMR2N4Uzh2SW02Q0EzWElWRlFaR3ZCZ1NlUzg0?=
 =?utf-8?B?azhYWG1BeTUxeTc3VTdQVVZMSWZ0VTBoaXU3VE42SVQySnBYZEJYeGtmeENN?=
 =?utf-8?B?aWVuVkpya3RVR1ErcFkyZ1AvcXdibStvT0JNSHFEUW1ZdytXUHI4UHZHek5P?=
 =?utf-8?B?ZjVNa3VlY3NJZVhFRmlLUGwzTVJTU3ExOUpJUHBlbWJKaDNZaVZoUkFob25K?=
 =?utf-8?B?Sk44ZXVZVHZ1SFJWNFl0dCtCRGxFY1crdndOWW1nZE9zeUZsa3A1b2Zxdmlw?=
 =?utf-8?B?OEQ1dHVvSzVLdERqZkpTSTArR3NFcGhEamU0c2xSaU5qdWxxbi9DRmlvVmJa?=
 =?utf-8?B?M1NFdUd0R2loRHpkMmRJZ1ZyNHNHZzRlaVVpaXI0R2NvS0grNEwxNWhadkdV?=
 =?utf-8?B?UVRIOHI3emlsTnVHU2VNSXlPLzBaYmdhUnlCQXR6RkRjTkltRGwvRG5EbE12?=
 =?utf-8?B?Z2ZYWHYrSWVMM2lSQTZiL2RrcERMWVdYY1J0c09HYzNRQi9yUVRIVE1qTjNC?=
 =?utf-8?B?UE1jMUJ0Yk5vQ3JVVUpYNEZsRnNmTXZ4bnE1cklBSm5jbUxDVlFuM0Q1bEU3?=
 =?utf-8?B?MFQwU0RMSi8yZVg1QXhKTGR3QlVRakw2QnRmMWVxVVV4TTZIcmpqc09HaWVz?=
 =?utf-8?B?Vi9aMEdJMjlWOHA1cWxjUG5OUmE1TnJuRmV5SGtxV25mbzhtNDlRMFFFb1Fw?=
 =?utf-8?B?d2VJMzB6Y2tYTlNLTmx2bTQxeC9XcWVJM21qZmZtaTdqWG5VUzNCeVZqd3F6?=
 =?utf-8?B?L3pDTmhIREdyaWpoZXBXaTNESG9rZzVIYmlVc1JnY1I3aTZzRVdWdXhGNUtu?=
 =?utf-8?B?RG50am9Sa0xWeldkQ3JLcDY4NjV1Tk9veUVOT1VPNE5vK3EreVlXem1wbCtj?=
 =?utf-8?B?RUppckI0dTdGTXRUMm9oTUIzNUFacTZGRWZtMllOR0hlc1hBNWtnelQvaTRR?=
 =?utf-8?B?MzV1QUdrM0I4VFA0THNrZXdkRCtFckppT3V5UFhzQmlwajg4cGtDSmFPejI3?=
 =?utf-8?B?cDhnWndwUkZIcVgzYkZoUmVmQTg1c2drd3hnUjRYdHVzVEQ4akRzU1ZFZnUw?=
 =?utf-8?B?ek52MXNUcjFHMGRUUFpEekRoZnZBWkRZV3ZCT3ZIU0ZySGV0V0xRTFd6cE1i?=
 =?utf-8?B?QkJOakZBMS9OemNETWhVU3F1RDBsQXFVZ1V2T1JETFJRUzczZmhybDJ3a3Az?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wRX827TnnTr86WO47E5uCDGS"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 14df7bc5-2148-475b-caa8-08dc4cba96bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 10:59:05.5865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AEoddXkLyD42H4vbszF94aqTdKsfEsVsDZWJLzgsxsWLCKMTgIgt/GbEB3JxA9DbrIzzDLjs1g8636WEytWiwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6633
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: gBZD_33ufDJwRdQPeutcNT8-1MJag-2D
X-Proofpoint-ORIG-GUID: gBZD_33ufDJwRdQPeutcNT8-1MJag-2D
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

--------------wRX827TnnTr86WO47E5uCDGS
Content-Type: multipart/mixed; boundary="------------z10TmSuKkp42YzlctH4M5pwl";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Arnd Bergmann <arnd@arndb.de>,
 Donald Robson <donald.robson@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sarah Walker <sarah.walker@imgtec.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, dri-devel@lists.freedesktop.org
Message-ID: <9bf99e82-1f7b-4726-83da-591ed8b352a4@imgtec.com>
Subject: Re: [PATCH] [RESEND] drm/imagination: avoid -Woverflow warning
References: <20240322130124.902165-1-arnd@kernel.org>
In-Reply-To: <20240322130124.902165-1-arnd@kernel.org>

--------------z10TmSuKkp42YzlctH4M5pwl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22/03/2024 13:01, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The array size calculation in pvr_vm_mips_fini() appears to be incorrec=
t based on
> taking the size of the pointer rather than the size of the array, which=
 manifests
> as a warning about signed integer overflow:
>=20
> In file included from include/linux/kernel.h:16,
>                  from drivers/gpu/drm/imagination/pvr_rogue_fwif.h:10,
>                  from drivers/gpu/drm/imagination/pvr_ccb.h:7,
>                  from drivers/gpu/drm/imagination/pvr_device.h:7,
>                  from drivers/gpu/drm/imagination/pvr_vm_mips.c:4:
> drivers/gpu/drm/imagination/pvr_vm_mips.c: In function 'pvr_vm_mips_fin=
i':
> include/linux/array_size.h:11:25: error: overflow in conversion from 'l=
ong unsigned int' to 'int' changes value from '18446744073709551615' to '=
-1' [-Werror=3Doverflow]
>    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __mus=
t_be_array(arr))
>       |                         ^
> drivers/gpu/drm/imagination/pvr_vm_mips.c:106:24: note: in expansion of=
 macro 'ARRAY_SIZE'
>   106 |         for (page_nr =3D ARRAY_SIZE(mips_data->pt_pages) - 1; p=
age_nr >=3D 0; page_nr--) {
>       |                        ^~~~~~~~~~
>=20
> Just use the number of array elements directly here, and in the corresp=
onding
> init function for consistency.
>=20
> Fixes: 927f3e0253c1 ("drm/imagination: Implement MIPS firmware processo=
r and MMU support")
> Reviewed-by: Donald Robson <donald.robson@imgtec.com>
> Link: https://lore.kernel.org/lkml/9df9e4f87727399928c068dbbf614c9895ae=
15f9.camel@imgtec.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I sent this one last year when the warning appeared, it looks like it
> got lost in the meantime, resending it unchanged.

Apologies for letting this slip through the cracks last year - applied
to drm-misc-next.

Thanks for resending!

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_vm_mips.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/dr=
m/imagination/pvr_vm_mips.c
> index b7fef3c797e6..4f99b4af871c 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm_mips.c
> +++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
> @@ -46,7 +46,7 @@ pvr_vm_mips_init(struct pvr_device *pvr_dev)
>  	if (!mips_data)
>  		return -ENOMEM;
> =20
> -	for (page_nr =3D 0; page_nr < ARRAY_SIZE(mips_data->pt_pages); page_n=
r++) {
> +	for (page_nr =3D 0; page_nr < PVR_MIPS_PT_PAGE_COUNT; page_nr++) {
>  		mips_data->pt_pages[page_nr] =3D alloc_page(GFP_KERNEL | __GFP_ZERO)=
;
>  		if (!mips_data->pt_pages[page_nr]) {
>  			err =3D -ENOMEM;
> @@ -102,7 +102,7 @@ pvr_vm_mips_fini(struct pvr_device *pvr_dev)
>  	int page_nr;
> =20
>  	vunmap(mips_data->pt);
> -	for (page_nr =3D ARRAY_SIZE(mips_data->pt_pages) - 1; page_nr >=3D 0;=
 page_nr--) {
> +	for (page_nr =3D PVR_MIPS_PT_PAGE_COUNT - 1; page_nr >=3D 0; page_nr-=
-) {
>  		dma_unmap_page(from_pvr_device(pvr_dev)->dev,
>  			       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
> =20

--------------z10TmSuKkp42YzlctH4M5pwl--

--------------wRX827TnnTr86WO47E5uCDGS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZgFY+QUDAAAAAAAKCRB5vBnz2d5qsMBE
AQDSVduiD5nWLFKWreUYN3rL6TRwSsQ6+3wAcDDVFkbYAAEAqWeAu5oO9tWE45LVOUDVHEHrrIa0
8Fkhibo6WYEJlAg=
=RtZ3
-----END PGP SIGNATURE-----

--------------wRX827TnnTr86WO47E5uCDGS--
