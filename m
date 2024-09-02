Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA2B9682FB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 11:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC58010E164;
	Mon,  2 Sep 2024 09:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="rJufPG6j";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="jLIJy5/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE7610E164
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 09:20:41 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4827Wngu003596;
 Mon, 2 Sep 2024 10:20:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=8qfdCEYMiIesB3LA41NXU/Q/2
 C85bxI65Ht3jy6Z+Ek=; b=rJufPG6jP02dpYlp293QJnhceVFtyvC5dj928U29c
 i3SMy/oNgaMfU9nDlOeYa4zmJRDntO0S+in4xJIg88TVI8RgP2qtUJ0X8LE3vvhc
 aiHLt/cOcyumxJx2p9zKWGiWl3ZFjOVB/OdWZhB1C5ehCF92D78Z0gdjEhDIa4BE
 kEgfOdiVlsXrD82vVueCZ0T1+sv9dMFrD70K+6J6DCChzjRVdaAjDaypm9czmrvr
 mZIsdWjiJ8IV+hZJ5lr//HQtLYALU0K2CkRkvXlD7RKMLiek35pvV1oQ6vv6rDKL
 vcrfftSOl9Qjf4I37qr2W7SDpIg8h+BRLpBGeCneEG/lw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 41bses9cyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 02 Sep 2024 10:20:14 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 2 Sep 2024 10:20:12 +0100
Received: from LO0P265CU003.outbound.protection.outlook.com (40.93.67.51) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Mon, 2 Sep 2024 10:20:12 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFVaZcK+ztGexI/2SNSvilptIyEVyrH6glbdXEPPkTUUoWwxyvNphY0aSf0r/+X/GCoIz+dNUpHsMUgL6SeMOE5ntG3Zchl1Aw+pIIN8VP/+tffDbYxFV0KpT0izo2yV85tdYlwHcPsg5tTtl5bwlu4JoPCBLv5l7S39juqWUGUmsJLY/P8WvsVqrelBS0JxzaYFU9Hvl2J06PlI60npS3RcAb1HU7al/cxJtjh8WTcLZn7MRnhQ+saR7BRDh9jQ4NILNq0l13fCoBiNO2EnM4w++MJJWdKmAN+EEaG62YbyVUO9ofeHmrAYcPfdIKT3NmMLRZbtA+/HIxaP5OHwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qfdCEYMiIesB3LA41NXU/Q/2C85bxI65Ht3jy6Z+Ek=;
 b=RufcJCZmeabw6dOHf8Hui7PqkXHIdBaj/oCOFLHcLR1xMME4JYgYf5n8fj2WzzeE0u/loWDOBMD3ghZdNn3mLq7fWcxERATGy513B75TYHX2xqmHKfIVjQ9dWW8TGXCpUUrf3qR/40E1Ld3LxFEdxoK0uZ6RdDLW6PNrO4FRgrOvMQkF1IUU6AwL1QbLiF2WoHdkaTA5q26m+UyFaFq9O+O1cr0EeQkUsdr07mmVaCu4B14gdRbHtTx4FKE1NTOO8gORSrrYYXtOOK6Arta1Tn1ln2WinygG0bmj+wsiBn90lntDaIi9dp6WTm2daFpnbBWN3OJwCjYODEXA1gQw9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qfdCEYMiIesB3LA41NXU/Q/2C85bxI65Ht3jy6Z+Ek=;
 b=jLIJy5/H2xuMrBZ7D0OiB/O0uasTgCaBTJQu9Xlt3jmpQywx8ons799MRlk6OEPsMbK/XsqoD3x7+OOTi+bku/wdv0TYasy4+hbrhv22f5+CycuYlnxjENvGcXbCSWT1wXZzv82qzN6DMylFQ3sZJh95MWSMeKIPJgKdiZ/HVwA=
Received: from LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19c::12)
 by LO9P265MB7430.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 09:20:11 +0000
Received: from LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM
 ([fe80::54e3:e143:a879:2417]) by LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM
 ([fe80::54e3:e143:a879:2417%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 09:20:10 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, Frank Binns <Frank.Binns@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] drm/imagination: Use memdup_user() helper to
 simplify code
Thread-Topic: [PATCH -next] drm/imagination: Use memdup_user() helper to
 simplify code
Thread-Index: AQHa/RlPM//DtIjVhkyhKzfkOWrxrQ==
Date: Mon, 2 Sep 2024 09:20:10 +0000
Message-ID: <1454d57f-98cf-4e2a-bcaf-8b595352dc9d@imgtec.com>
References: <20240831102930.97502-1-ruanjinjie@huawei.com>
In-Reply-To: <20240831102930.97502-1-ruanjinjie@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO2P265MB3406:EE_|LO9P265MB7430:EE_
x-ms-office365-filtering-correlation-id: f29dc178-e9f0-4608-bb88-08dccb30719c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a1JmYjBvT0I5SG40aHNORG5XQnN2R0J2KzhYV3VZcnZKRzZwZ3lwSDBuYWhP?=
 =?utf-8?B?Rk0xeC80WGYyV0ErSkVjR1E3clNFckN6Q0FZU0JzclpmSGZ6MFBMSC8vTkY5?=
 =?utf-8?B?VW5HK3ViRlpEUjVlZ3ZCNEJRWHJUOWRFWFJCQkh2VmJPdG1OM0tIYUJjbi9U?=
 =?utf-8?B?ZFdybjMzclJTS1pNUG1QTGlaS2lsTmJOYkxvdTNQRW9pUC9Rd3gvbGNnK2t4?=
 =?utf-8?B?Y01uTjJsL1Z3Z1daWStIR1QxR1ozWE9Xa0c5RkRoS3JnU2RtcDY0S3ZwUFhO?=
 =?utf-8?B?OXgzNWxETm9iMTU2Q1JzbGFRUC9ORURheENaektoTUE5MGVLSlltRzJKZE1p?=
 =?utf-8?B?UzVYdEVmY1ZjTWZnT0ZKRGNmVm5SME9XbHY4NkdNcnBTYkdzbUZkQ0tEWVFi?=
 =?utf-8?B?VTRWbGU1d0hqNk83dTEvbUxMOXJucGR4VU1mVmhNb0pQQTI3QkVYdlh2WlFq?=
 =?utf-8?B?MzM5TEk4bERCSjQvZldwNTlBdUM1czNiQng3WTc5K1VhbmNNTVFiMjM5TzZX?=
 =?utf-8?B?V3k4Nm84VzFhU0o1VjY5YzhDaXdoTml2WllSZ3kyOWVTL3A1WkZxZVErOHA4?=
 =?utf-8?B?TG82NDRsb2c0L1dSVFpLQmpaZFBMdEI4bVdPTS84eE9Na05KeCtmYTdONFJK?=
 =?utf-8?B?WGNXbFdMUFNLNW4vYWpLQnZQaVVpZVFtQ0F1VDdXeU9RQ0xQcXpLRzlwbkJ2?=
 =?utf-8?B?blZBVW9QaWM5ajdUNWdmVmpMcVczek8xNjQxU3d4UThtUTRQanFhMmErNG9P?=
 =?utf-8?B?RkN6UThHRHJ0VExmaGZQWGw0ZkhiUmRoeU1mZUFzUlFFeHFPOWNGN1hPY3dV?=
 =?utf-8?B?UkM5a1ZJYVgyd3dLZ21WY3ovMjg1cWE1UEVpcG1pUTNVNHF1QmVwcHNWQ1Bm?=
 =?utf-8?B?MFl6Vmtxa1RUTXkxL1BRV29KL1o5djJmU1hyNXpWdVZ6Y0dPMUpMY3o0OGUy?=
 =?utf-8?B?Tld5bzhnSVJWQjNrdVlFSGNVanZHR0hacWpINGFJVVRSQ2Q1bVMvR2o3UThD?=
 =?utf-8?B?Rk91OTBjQ25za2cyaDdGRVZjTHN2a3NNaW00aUdxUzVvNXFJRTNxOFAzSHh5?=
 =?utf-8?B?VmFrL21MWWVvenM5WWllNFBPK2M2cFhoaXMybVc0cTM1Si9lWFJUMklWLzJx?=
 =?utf-8?B?U0hvOW54TVVyRHVaaCtDVFZzRmErTU90RDluaTB0MThUOEtwZ0hvVFBnR01U?=
 =?utf-8?B?RG1pN3hFNGhUMUNoQmdBZWlBOUdBV0ZjaGZNd0RpK3ZQKzBDZTVQeWtqRkZG?=
 =?utf-8?B?aXZDSEc0cy9uTFZBdnUvSlEwWEwycHVzbFJoQkh2dHhrOHBTcGhqdVJ1VWlS?=
 =?utf-8?B?azBpa3pIY3NMVm5BL3VNWHMxNEw1TElybzVSeXIyTnRoeENxemtEYnlqV2lN?=
 =?utf-8?B?TmoyNVZQR0oxajN1cTh4d01WaDRudG9BYnhUcDhqRURVbXZCMGxjbVZJVWFq?=
 =?utf-8?B?WnpOQ1VDMTBLZzJlNldkYmdYeUM3WVpaSVN2MkR2OVpocy94Z25PZ2lHVFRj?=
 =?utf-8?B?Tndtc3BpVjRzTTArT1IzZ3ZqMjV3V3hHMGgyR1hEbjFUVUhEZ25KSk9CR2ZC?=
 =?utf-8?B?Y2J4cnRmbnVubHFnQU9NYmNzOWhkUjY4dzlBa3lGRHIxa0MrZnlTNEJ1Z3Iv?=
 =?utf-8?B?U1A1SDAxQnQ3RVJvV1Myd0gwWi90S0poamF1RlNuNWNkNmpJeWF0ei9qT2RY?=
 =?utf-8?B?Yy9wSk1ES1BkTytldCtycVNGd2k4L2VZbHFHQ1NTbWs4RmdDR2NMeWdmMm91?=
 =?utf-8?B?ejdWSjdwQ2xsVld4UTg0bllOZFJmMW4xMkFGdjFvcDVCVG9kYnVDYmJ6OFBi?=
 =?utf-8?B?NlRMaXkxNlYyNWpiWlJqMHd2N0RQRUZicFhYaUJNTllGQnhITDVhYk9PVUxm?=
 =?utf-8?B?UjloaVU4Sk9oVkdDNnJWTUxESTJxMDhldlFRSU5LeHNHYVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2ZMSGo1S3hBa3ZmOEtjalJ3RjMwY01XTDMxaDRKR3g1K29BVUo4bmMzeVAr?=
 =?utf-8?B?OU5Va2xZeE9IbVlRa1lsaFk2YlRKcjAvUHdBWTZlbUtlKzJhTE9DTTBIcXlh?=
 =?utf-8?B?NEVZN1dPaU1LY1h4UnlIZ3plSWNmdFZ3cE4yNURZdkdnRmVWZ3hsWDI4YWs3?=
 =?utf-8?B?RGZicFRwMFJ1cy81UFB5ZWFOWjBidVdXbXU3eVh1NEJvRHBlOW1LYjViQ3hH?=
 =?utf-8?B?R3F1ektjaEc2UUVRUzlsZDNHamdIMU4rVGNlMXpCOTBrdWxDM21sYllqb2xl?=
 =?utf-8?B?ZEFkc2dXUGlWWWhkdytjNCt2cmdndzI1aUhpTlhtNE5QUlp5ZGMwV29GRStE?=
 =?utf-8?B?bjl6RGE5VjAyWVp5RFNvYWRIaVo4S3VNQ0FTeHZYejBFUnBnOWVHeE9qdjlH?=
 =?utf-8?B?K2V3L2NibHZ3QXlQQVM3SGhFZEVXWXlKV3F6ai9wQ0dTQ205UlZYYWdwMWVr?=
 =?utf-8?B?OWY0Y0RJSjRQZ3RzdHNyVzhHdk91OWZDV1cxMU1LOS9hc3hRK0gzdGVBY3lN?=
 =?utf-8?B?MFV2Vnp6NkJVd0l0OTh0NFl2dldFdHJGa2tKVEhsN25jNDEydU5ML3M2Vzgx?=
 =?utf-8?B?WWI5T2QzT3dvOFo3NDZScVhwYzNRMG0yR3NLV3lRa2tzWGJpSHhGZUJSVm5o?=
 =?utf-8?B?MEhDS0lqcW5vdjFubkxWOS81Nkw4Y05XY3VEWUV2MDZkaFkyeTIvL3M5Vm54?=
 =?utf-8?B?NElLeXM1RDE1ZGJVZWRBTVlmc0VibFZMTm9GdWx3M3FYN1ZRUGRNSXN1UGpF?=
 =?utf-8?B?ZFFXMjhZTllUTWo2NXM4WGxzYTFBdnhkOUFwM2ZnWWkvRmF4SXVUY3BxSXlZ?=
 =?utf-8?B?OW9sUnJjdERoSWdHSnU1YTBBUk84eEpyc0hzODhpSTR3SGhJMDh0WVVFTFZD?=
 =?utf-8?B?TER2UUNzMUd6ZnRqWEJOdExLdXUraW5BY2NBK3I1a2RFWFFJUVlaSGtRUStP?=
 =?utf-8?B?NmNndVNmL1hjeFA1eGkram90SUF3UytRbXZFNU1Vb2JTRTFkSkN4aXZQN2dz?=
 =?utf-8?B?czRXQzRxcDJ6Wnp4RHZIanNHbTU2WnRtTjRMdjdpdTRqbTJUVi8yRk1lZEtx?=
 =?utf-8?B?S1JRVVB2YlVWOFlUNWJYWkJXMGg5VHJDM1I5RW5ZcHIrRGlyT2dIVUhscENt?=
 =?utf-8?B?YkNCRExNZWRkNFZUd0l1SmFydzE0VmV5dHFLck1vM3VHcms3TDVpYjgwY2R6?=
 =?utf-8?B?T2gyWE4xTTNwdWJEZXFuRXYxeWIwdXkzcUVyWjNVOUduZW1SdGpEQWFsU1By?=
 =?utf-8?B?cldqTmd0ZDhpUU40OUZvdlJCRC85TjgyMUtBZUxDWHkyN2ExSllsT1QzQmdv?=
 =?utf-8?B?QUx2Nld2eERFNGlrMk5BczNBeENEK29QbHpzcldldWh0aG53THJLdVNUcGZl?=
 =?utf-8?B?QVQ0cStMd00zbzdISDZ3d2NpaEU5RENCZ3FXallGeDVIdXhQOXJ1VHR3SSty?=
 =?utf-8?B?Si9GUkN6QS9oSXFwME9YOERIRUR6R2Q1eWFsR2txWExCbmJkMmtsTzNpWVg4?=
 =?utf-8?B?YVZwdys3TWp4dTBEQzk4VGU2a2ViYlJPUWY4UzZXWURnVU4zT25KZXRraXNt?=
 =?utf-8?B?TzhhczFHeE01OHc5N0p1S3BCZmFpblZBZGo5WjB5cFVkd3FGUkFwV1Q0TWtG?=
 =?utf-8?B?eENTMDZqMDhGcnVDNkRMUldVSk9UMmN1SHYwU2V4VXQ0Z2xTcUl5eFNjblFP?=
 =?utf-8?B?YkV4Q3BQRXRDbUVrcWgvaEROcVpKSGxmWEwrdFhGN3V0ZWw4SUNmVEZZVkgz?=
 =?utf-8?B?TGl0Nys1Rk45YXZoR0pidUVaNXRrT0kvQStDTmhIdDBscjdEbWhNNlQ1eFpD?=
 =?utf-8?B?YVZ0K3NhL2tCa2t5YUJ4eVFvblZlNzVXZHpDbXQvM2lkMk1Wbzc3cjRUQUcv?=
 =?utf-8?B?UmI3VVVWczVlRm00RzlZU1NOLzNlc2d6MWg5aFZTNDlFUlIyVE5vSnhmVnpv?=
 =?utf-8?B?bW1GUUd2amxSaXBQcmJQSWJWc1lpVWdzUHRIdlFORVJ0TGVHREsydlJ4dXQx?=
 =?utf-8?B?ZisxK1NiMXNDRWE4Y0w3UkdHY0hMakdxMTVIWHZTYUVVRDJQWGFzSnNQdUdh?=
 =?utf-8?B?NkVSd0lhYVNjQkhWMW9CMnBlclN6N0M1aEowZEFhV3FQN0hnNGpTSVZhbHhw?=
 =?utf-8?B?T2pMODJocFFzV2ZHeWVLWlVsUW13MU0yVDhvejhDVlMvYmV5Y004a01ZaXZK?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GCsCGK6dVkKRdd5uAHp80Yqd"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f29dc178-e9f0-4608-bb88-08dccb30719c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 09:20:10.4335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KmVjbH16NneZ6m75XQfmKuzYrpX4rBmdM9lp3ToAneNMLWSkU+AlyU8ncJJpRGOaHWzoWmoqgCc8ijFvdV+CKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7430
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=aKOiqq9m c=1 sm=1 tr=0 ts=66d5834f cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=u6J33Med6gw8ZFtip2kA:9 a=QEXdDO2ut3YA:10 a=VRQHYQaRm52RG-y5gzAA:9
 a=FfaGCDsud1wA:10
X-Proofpoint-GUID: e-lycfYfEMBcLbYw-XxB6KZBscBI4cV8
X-Proofpoint-ORIG-GUID: e-lycfYfEMBcLbYw-XxB6KZBscBI4cV8
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

--------------GCsCGK6dVkKRdd5uAHp80Yqd
Content-Type: multipart/mixed; boundary="------------c20ZPLcGqaqdzuSnytoNcaPL";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <1454d57f-98cf-4e2a-bcaf-8b595352dc9d@imgtec.com>
Subject: Re: [PATCH -next] drm/imagination: Use memdup_user() helper to
 simplify code
References: <20240831102930.97502-1-ruanjinjie@huawei.com>
In-Reply-To: <20240831102930.97502-1-ruanjinjie@huawei.com>

--------------c20ZPLcGqaqdzuSnytoNcaPL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 31/08/2024 11:29, Jinjie Ruan wrote:
> Switching to memdup_user(), which combines kmalloc() and copy_from_user=
(),
> and it can simplfy code.

Applied, thanks!

[1/1] drm/imagination: Use memdup_user() helper to simplify code
      commit: 3742c20958a5b02ecba08d71036bae3e7b9d21b3

Cheers,
Matt

--------------c20ZPLcGqaqdzuSnytoNcaPL--

--------------GCsCGK6dVkKRdd5uAHp80Yqd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZtWDSQUDAAAAAAAKCRB5vBnz2d5qsFml
AQCnoR7ouLL49k3C0bUC0ubVzK8gOkwuDDXo8CA4ey2/BgEAhqjxOUdmv7+vkx959r2252Q2vAzP
mKjxORZrtd8ffwo=
=vQLj
-----END PGP SIGNATURE-----

--------------GCsCGK6dVkKRdd5uAHp80Yqd--
