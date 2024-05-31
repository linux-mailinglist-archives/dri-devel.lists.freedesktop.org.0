Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CE18D607A
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 13:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3FA10E07D;
	Fri, 31 May 2024 11:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="o25J76a+";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Ls5YyP79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F2E10E07D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 11:18:39 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V4Q3CA005198;
 Fri, 31 May 2024 12:18:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=IdYh9sw6V9B31sH8587CF/wUOaU051dWHCw1mpZQy9c=; b=o25
 J76a+4PjzXvBjoJhrKKGwrTAV+Ntg4v8c+zYyE51Q0nh4+9J5I4DRyR3NZ5bPel8
 ZIZ4tUM5xdS8ABHhULQFMm47N+ziGxOZNY65y2lx5xXQS2pvoFJZMQA7VmuO5WWm
 vpX9R88epg+8QynR1HPzKeaR4PxUQfMNecT11EIUHUtPwL1K7Yo7uOJ9XggxuvXB
 fxZMyuuOg/2DJtF5f1tlIWcXmj716Nut5Ol2lyf1MOGvTGfWtnSi8dWUK+aPbL31
 PTuQbTbO0YP2J3gD7metrO6ak8PcpwNWhRgMZS5QsXLf31D0zQtkX4FIHQxViQli
 D6Di6bxTWrkopq0SNYw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3yefsp255b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 31 May 2024 12:18:27 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 31 May 2024 12:18:26 +0100
Received: from LO3P265CU004.outbound.protection.outlook.com (40.93.67.5) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Fri, 31 May 2024 12:18:26 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtmNxxaCF6FCwwo2p7vFV84qqWWA02kZX+UbaOGX7gRRlsEmiiPfT3nZdj2mbmNR6wkwWikw/5AxfucViO0PBGSCSypPiAr3wNGZYIi0YtoCNbr58lB4F1kbe2LtVuSNgO156x6IDF3qju7wCRKbvGFeROo4mhtYNHn5Qv6Z7NJaiypFZ8KK5G9Dxm2XBnvngRMblOasNP8w0DECdqpdadT9gRWX2z6eHK8Wnwg9vUQavDs28t/QYRyOFtK/9iKMXR0E0v2mzgUbmMCKDUWPsBvDBOIiwgghsb6dHZRXx4da2bBrm/RJPwdtfaio9uq+Y3Pv8QRTBtLj+8gGI+E4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdYh9sw6V9B31sH8587CF/wUOaU051dWHCw1mpZQy9c=;
 b=MobsovhA0xcY6HOuxTsXiQJ9XnjhzCKq0ZSGpDLdYOv9K1L7qhdRl6MevpHuz4vAd5wUPffTIiKRZ0uvyPvG3Fkg2fOk+2lKq3VfPAAdsGO8vJDVEZ3hI6UnJ45UMnj70PSg3wyls9zZicaIBSofKlOMsdyziFPFQ9aZgwKI9McH3wl99Jp8uLn9sQugN3TftzD3XXNBJmuh1tkd4UalMwXftaE2b5xDfjfQBLRD3Ngwaw6PCPs2nVh8P07HMzMkkhDWL5EklKjV7pn18S+82EK3mX1Jfc6Kw//1wjK0qJqDkeKoTsgOhwyZXSAgVDdFDxASpvbMtq3SJ9kdKfMJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdYh9sw6V9B31sH8587CF/wUOaU051dWHCw1mpZQy9c=;
 b=Ls5YyP79QgqOyUCCu8uBfZTSZozFFCQyL7nGt/ZxdsFxLuRH9K0M3vKNgm0DyPhohh10wRjlDjsTwN5HRjLVC0DmspeKsXH00EoixAl5TS1e57hbBnYtB0WgC5mYsq4JCuEMgj0ZsGCBrMBkPec3XjpGtzZVqF2zzUJZwN3kIDI=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO6P265MB6734.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Fri, 31 May
 2024 11:18:24 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::db1a:5e96:699f:8757]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::db1a:5e96:699f:8757%6]) with mapi id 15.20.7611.030; Fri, 31 May 2024
 11:18:24 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, Matt Coster <Matt.Coster@imgtec.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "wenst@chromium.org" <wenst@chromium.org>, "mripard@kernel.org"
 <mripard@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 4/6] drm/imagination: Add compatible string entry for
 Series6XT
Thread-Topic: [PATCH 4/6] drm/imagination: Add compatible string entry for
 Series6XT
Thread-Index: AQHas0xAa5nIlPpG/UiFIjKSi4pgYQ==
Date: Fri, 31 May 2024 11:18:24 +0000
Message-ID: <efdacd820d13368816973f57c4a817e039ec4a2d.camel@imgtec.com>
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-5-wenst@chromium.org>
In-Reply-To: <20240530083513.4135052-5-wenst@chromium.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO6P265MB6734:EE_
x-ms-office365-filtering-correlation-id: b2539663-9457-4da9-ba60-08dc81636328
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|7416005|376005|1800799015|921011|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?eC9aU25vVnhXWmpscGpiQ3lVaUwrOU9uVTVZeHhyZmNMQmJQVE84L1F5OUtB?=
 =?utf-8?B?SEd6QXNhRzI4aDdQeFphbWwwSy9IWWpLUXB0bmVCaWp6RU5NUEE4bkdNSDNI?=
 =?utf-8?B?WlRqOFU1RVlhZHNPWnVmM1YwSTMwWGUvcnNUK2s5MHRJQVlPM1picVM5OUVp?=
 =?utf-8?B?N09keUtYWk9XYVB3RkJnaW5obEM3Y1RBK2p5eWhQUllzY28yNFArVStNekZ6?=
 =?utf-8?B?U241OWdET0F0MjNTNkNIZDVGM1hvc0tsOTdGbGkzTUZEZEpRc1RjV3F2eVE2?=
 =?utf-8?B?QUIxOVdMVDFucnpOSnYzbkZOaHI3R1hUZHNScU9mSUFhb2xMbFhpb2ZNUGJ3?=
 =?utf-8?B?T3hMVlEyMnRtcDRUaXJ0SThRNHhZRlFGQWVWaGxlRUtDNWpxT3I5WDZsMnV4?=
 =?utf-8?B?dEdDelF0WUdvdlEySUI5WHhudHc0LzRmVzdpYytZaGpnczRNYUhRZ2s0Qk5x?=
 =?utf-8?B?VXljQ3UwUG00NzJ2NmVpV0pxUUtzTjJYaStkNzJDQldNZTB4aVJMVjZxeUNR?=
 =?utf-8?B?RHBjc0Nlc0lMTE1IaFpnUEgraVhuZmtwMFA5YS9IOEI3Q29Id1YvcDBaYTBw?=
 =?utf-8?B?S0Jzb2hSS3dUclUwK0NxL0pFNU0zQkpOWWROWnpJRWNXY1I2bDVMNXJmS1R5?=
 =?utf-8?B?SFEzZXdiTFA2SGJCN3F3WmgwMDB0TjFmdkNzQWwvYVFkLzl6U0N1ZXNEVHdD?=
 =?utf-8?B?c1FvNnI3WmNYcWxZVzJtZjE4VGJFa255U25EZGJveXB1QTZDWFBOVHQxbnl0?=
 =?utf-8?B?MjMxZnVEVWhFUE9ia3BYNlJ3MnUvRVFmRngwWUxwQXZ5WkdFbGNKQkQrNGdq?=
 =?utf-8?B?YllicDQrVGs1eUUvNW5VcHoxNkQ2TllnWmlkWTlBVjNMbjVFcDE4S1Z0TWxM?=
 =?utf-8?B?azd3UkZsaFlCM1ZPcWRvS0w2cC9CUFdxbytiMEY0ZnVhUllhd2VZc0dWWHZy?=
 =?utf-8?B?eC9rYXp2VXVtMDFxRGxFVEtmVW1kNGJSSUZqbzFkUUloUVZBK1g0aDJoRzhh?=
 =?utf-8?B?WUhoT2ZOYVNjTkN0TThGeFhYaWZrUGRGYzN6T0d4cHpzZFd6aE5ENmhudEZm?=
 =?utf-8?B?bnYvWlVmOWFYMGcybnc3b2lybjVsWjBidW94WDRkT2R4cFlEaGMzTTNZZmIx?=
 =?utf-8?B?N1lpcVZWcnJGbitwZ3BKblZ5T3BERk02QnIrYyttTWM4M05TR25SZk5uRk02?=
 =?utf-8?B?SWY4WVRQTUtBK2FlZFdqa0ROcjh4dERjNVVQS1BCWlNVa1NJRFdPeEszWit4?=
 =?utf-8?B?TGY2ZVFtdzZnQTc5NE1CRXEvcUJSTHA1eVdyQmNXZkRvNHJiYVE3Nkh3QWc5?=
 =?utf-8?B?MXJEVHNtWVNONCtrd2VaRlBXR0lmYUJGeFpMbkRpMUdUMzAyNHRwK2dFU3Y1?=
 =?utf-8?B?eG14TWlnWUhsZDZ4MXh4cCtQWnBuUFpHTkhzczhPdjhXY2JrblZObGt6NHJn?=
 =?utf-8?B?QVNOaWVyMnNnM2lmZ2hoeG02WDF0QlBlUEVQQU1SRkRUY0NHVklHV3ExREVO?=
 =?utf-8?B?N0Jtb1lWQUxTYnBrbXcvRjJCNHFIZ1loRnZ1Y3FYbVFYOHdXUktKTW44bWFj?=
 =?utf-8?B?MHdhakV1WmNtT2RQUkJzOFEyeFhyK0lSOUVWNDdzcUJydDQ1QUFXdmZNYytF?=
 =?utf-8?B?VkR0aUZ6U1dDU3o5d2pTSVZQclhZcklQa2ovazNPQkhpdjRPcFl3cng3ckkz?=
 =?utf-8?B?VFBlNlBVS0Z6aFhRL2NUT3lsa1p5eExFdEZ3NHZWdWpGNVk0VjlNUGlaRTJ4?=
 =?utf-8?B?NFhTU2lubG5WejZMR2NUUmJMcDVXSHhIQmJrV2JVdXhIZUM4U3p3cEU5VkVr?=
 =?utf-8?Q?c28EWsxNCas+o421LVw4H443PMm2fxykpQ2mA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(376005)(1800799015)(921011)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkdGQjRyZXp5dlI5UkNoMXdmOUdiYldIY0xiek1jclRscU9tTzl5UGxOOHUw?=
 =?utf-8?B?UkRXblQ4dnZrOUxObGw3MTNSUU5OMkQxOVN0MW03SWk5c2U4eVFkMDJ4YU9T?=
 =?utf-8?B?Ni9WSHNxaDU0SVlKdkxZWE1LU0hhQUdaV1o3ZUkzSm9QTFQzRkx3RzMvOFJV?=
 =?utf-8?B?dlhuV2UrWVlNTkZQWVdvZFBETHZlTnYyUjRNNEMyamswcEhlK21yakZ3VVll?=
 =?utf-8?B?RTI0WGo3M0JTVU5MRGlZTVJ1UEtjSXNOMWYyaXVxRkxNclpFbHUrOU9FVFFX?=
 =?utf-8?B?M3NaeVI4ejBQckNsTkl1UjhZRTFkYWlyVmg4d2k0eHRHVGNWa1JiQzdRbncx?=
 =?utf-8?B?S245L1lpSDFNTWMxVXRlZHJ3MlNza1krK0hPY2R5OEp6NWNwVXVBMzc0MVNH?=
 =?utf-8?B?S0QvejI4cG05T2lwQ1QzS2p2Q3UvV3BReFMzV2hQUkk1WkJPaFVzamFpZCtE?=
 =?utf-8?B?dlNTdk9KTkp6ZlVFVVo0UHppRmtoazRXSVgyb2M2V21mUlZEZ2FDeWxQbWY2?=
 =?utf-8?B?UDE2bHQ4RnRGcHhtRmZSaUJrei9SVytES2pPcnFtQzlDZmdyMXArLzNweStH?=
 =?utf-8?B?amc2T2laM3lETk9LMUxKblV3NE1TQm83UUpYNFRkTXovRmYxckdVdjdZbXdQ?=
 =?utf-8?B?eXJRQkE3ZTRPWUZoRTRzZjZmaXVyd2dSZVNuMVRpMStib2dBK2ZoQkQ0Ykto?=
 =?utf-8?B?NysxMjByUllLanpNVHNuenB1NE0vTFYybHdTcU9aMWo3VkdjbmlXTEVncGNJ?=
 =?utf-8?B?OWREWUFhbkFkOTVoaDRZdUhVV0pQTW9uRklYamlTdFgwNGt0SkVRaUxaZUVF?=
 =?utf-8?B?UmxwUVIybEVQUUNlcENMbXV0NCtFVEp5SnJTRllmWnVSN2Z1N0huMlNEQkNH?=
 =?utf-8?B?ME52My9oQitkK2dSWkZsU1pOSkRzUStxbnBxMGI5aDZYb2xLdUJHb1JLYVd2?=
 =?utf-8?B?MmtleEYwVmk0YklaRk9taGFQOUdDc05CaG5HUU55MHgzMm9Jc1poSk9IRll6?=
 =?utf-8?B?dTNMV29LeURaK3pEUmpkVUpVU0xrdy9mdXVMNFF6dzNwVGkrcllhdkpsVUpU?=
 =?utf-8?B?QStjRXdFUnB6aUllUnpFaEY3VnhDS2IvRmthd1Y1WTJmWDExVXQybjdYQVhz?=
 =?utf-8?B?U3UvbkRzK0JVSFRsR0xvL1N4Sk94R3dJQWRNV1huaWhBT2txc1hTYzc5ZVhD?=
 =?utf-8?B?MUZFVS9mdDQ2ejZFVTVnQmcwNWFnamJEVmM0c2xYZCtNOUtUMlZsNk9peHRX?=
 =?utf-8?B?SEZwTStidXkxMGsxUlR3bTE0QlBna3JIYVRpZWVseFlBeGVPbjY4NE9iTElY?=
 =?utf-8?B?aTZBdUpxSzZrSk0vVUJyUm9jN3VSR1RBS1lhS3NTZ2NMMjR2eTVObmFBVG5L?=
 =?utf-8?B?bTZjT0ZhMUd0QXVuOUNsZjdIRW43S01VU3ZiTDUrWDkxWTI1bS9OL0JCMWpP?=
 =?utf-8?B?TTNLZ1pWM0tqL29wMExsOCt1VGxBcWhQNGNmcCtZRElOZnZqR0haVFFBM3ds?=
 =?utf-8?B?cGhRTXlEc1VFRTBCbjd1N0lSa3ZFTjZLbDdkTUQxdkl3YWEwL1UwMjU3U1Jq?=
 =?utf-8?B?dlpVWlF4Rys3RjZzQ2xmY2FNU2I2bEZoRXJ5NE85dnBQUmthNFNqL2dNeC9w?=
 =?utf-8?B?RHE5YThiUjJRM2d6aDlhMDVTWTRJUGUvVUREeGRucDRYemNtNktBNk9Pb1lZ?=
 =?utf-8?B?VDVyTGY4MmorWEJQRmdkVlNCWFE0cUgzNUVuWGlaVmNFWjlranB3YU5GcjRK?=
 =?utf-8?B?dUYwV1k3TDFRcEQ5K1pOWnVDVld5T05YK3FwVi96UmVSSDAwdUxsWEF1aWRl?=
 =?utf-8?B?UXc4WFc2MTdUOTRROFFhYXR5TjdBOExkWDVkSW5wZTJCN2p0Y1NPWXErL0Vi?=
 =?utf-8?B?WWQ4NHlWZm54RWR0WnZMMDZPQ1dkYlNnalVnalpRWEt1UCtoY0ZSUGxGcE9t?=
 =?utf-8?B?QUlSbzlmZk1QWEdxaVRsY2Q1aW1yVW9MTDBZN3hjQ1V5aXZYUS9ZOXdkMlkz?=
 =?utf-8?B?MmZqVy9tK2dNeG1VVXpuZG1JakFtdHJFOHdSSTZDUk0rZ2IzZVVyVE9CS2Vr?=
 =?utf-8?B?KzJYSUF3RVZvL2lkVHUyWlBzempGMkhic1IyNUZ2c3RMaTNhbTBXdVlnSE1L?=
 =?utf-8?B?QTNJeExDNWxORVNEalpsQ3hPNXRIdnJlYVZQeHRNMU1ldjFyMG4xeGkwaTd2?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F745C0BB35C014F94B4E803446F7E16@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b2539663-9457-4da9-ba60-08dc81636328
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 11:18:24.4811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IbYbwEqko9axLMN3CNHT3zRKvWc0t2PcojOuW51oBpgdqn9xRsvjIkHwNmBeQzJVbBDggJQ/rAnT1pf047iQtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6734
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: zZF5gDOLZOeKHevmQCZF9DJRcIZPXXzx
X-Proofpoint-ORIG-GUID: zZF5gDOLZOeKHevmQCZF9DJRcIZPXXzx
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

T24gVGh1LCAyMDI0LTA1LTMwIGF0IDE2OjM1ICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IFRoZSBNZWRpYVRlayBNVDgxNzMgY29tZXMgd2l0aCBhIFBvd2VyVlIgUm9ndWUgR1g2MjUwLCB3
aGljaCBpcyBwYXJ0DQo+IG9mIHRoZSBTZXJpZXM2WFQsIGFub3RoZXIgdmFyaWF0aW9uIG9mIHRo
ZSBSb2d1ZSBmYW1pbHkgb2YgR1BVcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoZW4tWXUgVHNh
aSA8d2Vuc3RAY2hyb21pdW0ub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5h
dGlvbi9wdnJfZHJ2LmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2Rydi5jDQo+IGluZGV4IDVjM2IyZDU4
ZDc2Ni4uM2QxYTkzM2M4MzAzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2lu
YXRpb24vcHZyX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJf
ZHJ2LmMNCj4gQEAgLTE0NzUsNiArMTQ3NSw3IEBAIHB2cl9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGxhdF9kZXYpDQo+ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIGR0X21hdGNoW10gPSB7DQo+ICAJeyAuY29tcGF0aWJsZSA9ICJpbWcsaW1nLWF4ZSIsIC5k
YXRhID0gTlVMTCB9LA0KPiArCXsgLmNvbXBhdGlibGUgPSAiaW1nLHBvd2VydnItNnh0IiwgLmRh
dGEgPSBOVUxMIH0sDQoNCkkgYXNzdW1lIHRoYXQgYnkgYWRkaW5nIHRoaXMgdG8gdGhlIGxpc3Qg
b2Ygc3VwcG9ydGVkIGRldmljZXMgd2UncmUgZXNzZW50aWFsbHkNCmZyZWV6aW5nIHRoZSBleGlz
dGluZyB1YXBpLiBUaGlzIGNvbmNlcm5zIG1lLCBhcyB3ZSd2ZSBub3QgeWV0IHN0YXJ0ZWQgcnVu
bmluZw0KVnVsa2FuIGNvbmZvcm1hbmNlIG9uIGFueSBTZXJpZXM2WFQgR1BVcyBhbmQgdGhlcmUn
cyBhIGNoYW5jZSB3ZSBtYXkgbmVlZCB0bw0KbWFrZSBzb21lIHR3ZWFrcy4NCg0KSSdtIG5vdCBy
ZWFsbHkgc3VyZSB3aGF0IHRoZSBhY2NlcHRlZCBhcHByb2FjaCBpcyB0byBoYXJkd2FyZSBlbmFi
bGVtZW50IC8NCmV4cGVyaW1lbnRhbCBzdXBwb3J0LiBJJ20gbm90IHN1cmUgaWYgaXQncyBzdWZm
aWNpZW50IHRvIGhpZGUgc3VwcG9ydCBiZWhpbmQgYQ0KS2NvbmZpZyBvcHRpb24gYW5kL29yIG1v
ZHVsZSBwYXJhbWV0ZXIgb3Igd2hldGhlciB3ZSBqdXN0IGhhdmUgdG8gaG9sZCB0aGlzDQpwYXRj
aCBiYWNrIGZvciB0aGUgdGltZSBiZWluZy4NCg0KVGhhbmtzDQpGcmFuaw0KDQo+ICAJe30NCj4g
IH07DQo+ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkdF9tYXRjaCk7DQo=
