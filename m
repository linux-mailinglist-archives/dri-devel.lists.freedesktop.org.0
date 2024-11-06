Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A139BE40E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 11:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBB610E6A8;
	Wed,  6 Nov 2024 10:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="D6hw1qAl";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="gL3oHGoa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CC410E6A8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 10:18:16 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A68qKaZ023051;
 Wed, 6 Nov 2024 10:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=dYvbXId+J8jUzJDuAXTPO0DFO
 HH8Xp7f8zwKLRWWbBo=; b=D6hw1qAlwMsEo+4u+dQZzla1p/flWwMT32D9AjCQl
 4tfP98YlxC24Ls1PnSYqrvbEKNA/104KOw3BzS3ba18DM+ldLNSkOfY5rGnkl9oF
 0RqgTYZD9O7EzLZMK2yKRrFrgi+yu+8jzAkDbRKY+2qD7gVvCEz2Oea6Q+c16JZ0
 Jh6Hhrz7WzZKS6J54KO0rbmZnPV6qYzFrktmzpwtVp/AM1NlC54WY7B9lCjspAVi
 YSrzBATG1v8Sid/Id46tBraewjafXbkhfVmGsl2+A5bBo8dh4IBhR74unVVTXUYL
 xz38dxRt812O27SLAnTc3tS3EqPrndKVwKGvvKzJSsqow==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazlp17011026.outbound.protection.outlook.com [40.93.68.26])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 42qw83rat8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2024 10:18:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c02gWe9OL/Imz0b4nigqY6cxbIjJJNi8BltEfSitK7T9H2K+1CvZunOLpqHyZy5C3OhYgXvR7SLIFwyayLwSWHCZVRVnBf3DwoWMJBu+xsrHCDSzwFGUICaCY7zZJy9xpTJeSaYAQUTmdhIAoRQ52YQvO5AFFo4e3iel7b0tSUaHfPHTtlfHsrrmsAMi4LpuQ60GnpWLPVWUiAgTZt1BQ5MSPE6k+2Hz3sARxv9oROOrhmZ8QTGzfgh5suRQR41UNrtA6pM9TCXGIYHEJvK3c78sg4uAKlSEdG6LvkNGFolLX9mUDQOejKJyapYhgDKtSm29QZuup1KNnlxFOTNPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYvbXId+J8jUzJDuAXTPO0DFOHH8Xp7f8zwKLRWWbBo=;
 b=O68GZnrBTf5NBxBQpOFdUSNKnehA63+OqJRdCHS/hjrbRngh8Wb+pAvk0tEp7ySeCiouIkPeFhOIqcmakj6XFAVLmvlbfXQpGTrXBZEVesRqNoT8ufUlphVczJqAJ0ZnNaHa9/jWzbAiqlZqyYCTaTO8h2ooRkjinYGiIs8jMnUWbl3BiASj34NI67urELBkc1Ki7aifLkSRZdE4ClbqVBbnMGz344rA55QFPYzBdXNwfL9bqnqkNWxrYURgurUm0yYqEySubsnCqhTwrMtxPEOP7j0fl62rsUydevfSlPTuwHpbacmoh1UiM9Vg4p3Ky2djaI1/MdjZQsOZzAjC1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYvbXId+J8jUzJDuAXTPO0DFOHH8Xp7f8zwKLRWWbBo=;
 b=gL3oHGoawrasMUn7Cxhjy/qjGh+LIUmwT64r5YjZ8fxBCBRL5+s7uaHwK21S1iEiqpdbvxR1NP6duXJgv/N3DWiklR0GiRFlkvoz+Ur2TRJ0vS9yWiRuTS7Gccrmke9m2SNWMgH8fOMlZ7UacbZsWFbFHWvIwBOCOEYJhBeT1dg=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB7201.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:32e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.18; Wed, 6 Nov 2024 10:18:01 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 10:18:01 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Conor Dooley <conor@kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Randolph Sapp <rs@ti.com>, Darren
 Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 03/21] dt-bindings: gpu: img: Power domain details
Thread-Topic: [PATCH 03/21] dt-bindings: gpu: img: Power domain details
Thread-Index: AQHbL5uO5kKsTBpakEuxQCQd82U2hLKo+34AgAACOACAAQ1iAA==
Date: Wed, 6 Nov 2024 10:18:01 +0000
Message-ID: <ff4e96e4-ebc2-4c50-9715-82ba3d7b8612@imgtec.com>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com>
 <20241105-disarm-baggie-e2563299a24f@spud>
 <20241105-endearing-huddling-30728a002321@spud>
In-Reply-To: <20241105-endearing-huddling-30728a002321@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB7201:EE_
x-ms-office365-filtering-correlation-id: 053eccbf-a101-431c-924f-08dcfe4c4b66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eHJ6RUhkaWU5bEw4SzZBQXV6ZVI1VTd1NHV6NzViK0xPOE42M2ppRXo0L0Mv?=
 =?utf-8?B?ck5HdzIrM2JKQU1HODdzMWZXVHpkbWEzK0JIT3VjNWZ5R21ab1o4RGlCd0tr?=
 =?utf-8?B?ZUs2cVQ2dFIrS3BlcDdGLzQzaGo5QmRDR2NHUWZMQjVSaysxb204aFNYL0hv?=
 =?utf-8?B?S1p2VDI5a0JSblQ5ZjNMdmY5L3FZUEpxWUpoQ2pqWGt5SElGdE83aXVLeU1C?=
 =?utf-8?B?YjVMUlBNNE5ITlBXTU9nKzZkUkZ5L2tFZGQ5Ujhhd3ZlMFE3MWNmZS8wWlhC?=
 =?utf-8?B?NVVEUWpGYjFJbEVHaFZRWkFXci9DZ1g3MmYvcE9KVS9aUGxCM2RpSWkzeVZQ?=
 =?utf-8?B?cGpwa3VJT3JZeXE1d2V4Zi9OY01XdytTbERlTUNwNDB1eVoyM3h0bWhuNGVP?=
 =?utf-8?B?UE1vWjQxaWx0em14UG94VDg3MzdNbnJ2TDdyeEF1RTNvbmsycTdsNWVranE4?=
 =?utf-8?B?NUtsU0NZTlc4NGcwam80K0E5ZnhvWmhVNWdQYk52c2RobVRXTHJKQ01ManhO?=
 =?utf-8?B?Zk9NVVJFQ1AyYWF0a1ZYQUs1NFpOWmt1MjdZRVlDUFZKTmJLKzkvc2tBaU1Z?=
 =?utf-8?B?eDlUcUsvYlIrRjBZVkx5eFNuSTlJMWFjaVBKZWNnM1E3MStxbkNieVFMN1lS?=
 =?utf-8?B?UU9pdE9FZklOaU0zdE1LaThXTEEyZGZGN2JkUEhSUHJ2YUYwUko3d291d2ls?=
 =?utf-8?B?cDh1UStueElaWlUxYXRJM3V5NjloYmlMaE5GRmJuZUhTWDBxZUY1SDdLYUY2?=
 =?utf-8?B?UmpQeFE4K3k0ZjV5TnZISXVwd3VGSU1OSHZ4VlVEQkhwQmtQVFFyOTVHek1s?=
 =?utf-8?B?WE9ZUWtQdnRoY3hJQWZwRDRpL1FrNDZCNlh5b2xacDFsSHA5emlMcldnSVpD?=
 =?utf-8?B?YUo4LytkR3E1b3BIbGJSTFRJaUVGaVFrZCtRaXRGZFExYm1mN3ZndDVXdFF1?=
 =?utf-8?B?eDRQZ01EMkx2M0dMMjdVa1J5dGV6dVB5SExsZFRvU09kUUVueExuYUd1allI?=
 =?utf-8?B?VC91dVBFSHdFczY4R05wRWNjSVZNZjhwaGx0UFFTa2ZpSzVReEt2MUd5R2xl?=
 =?utf-8?B?cmtEbElOWUpYeUlYOFdQeXUwcm1KNkpybTlxbExJY0VBUk5uV1E4TGVPeUMv?=
 =?utf-8?B?SVVqWjNnTDJ3TDlWa01BcnR6elA3Vnl5VUg5TmN1NFpHSHhhc09aU09FS0RQ?=
 =?utf-8?B?b21LNEVRcFArWUk2a0JSZ2lyK0gxNlh1dXVaN3hXOE4xeFpUekVvV0VSTGpL?=
 =?utf-8?B?S3VSd2lQdVFwL3VrMVQzbHZxeE55T2R4c3VLaHVFRHVPNUpqWkNNWEpzUUdP?=
 =?utf-8?B?Ym9VeFBiMmZkOStWYjdKbEQrZ0h5VSthQmRiOVhPdDBPK0VhTkJBWURoeHJK?=
 =?utf-8?B?bUYyMnhReHRVUGc5NndhbURONWdGSjlHdDduOHdvc0hMU3pKMVNDWEQzQmtp?=
 =?utf-8?B?SnlWd3gydlljWVZudVBEc0c1clkwRTJTTlJUMXZ3d3dvUkpoUVU5K0xBMnEz?=
 =?utf-8?B?UXVMWVpuQXhDQTRaa2xOQjIxdFhpSUVXRDcxSkl6aGh1WldvQXd6U0Z2dlh1?=
 =?utf-8?B?QkVEcTZWckVvRHUyRnBZb1ZQTStTSWdPeFdRdTFoTk9PODdVeHJUTmw2UUpl?=
 =?utf-8?B?dmRwTGpXdVQ5UFdHdC9YRDZKWnU0TTR6cDVzYVVkbndCV3hvVzZ1aHdLOHJT?=
 =?utf-8?B?WXZOdERaakEvcWZGbnhSamFZaWs0RkNRTktsTzhsOGZDNXlibENrR0lJSzR4?=
 =?utf-8?B?SVhTZlBESyttcVlSQnVaSXd0SGVPa1VLT1ZHdDVFbnZIRjZvVzlRMi9RVWRL?=
 =?utf-8?B?c01kcG81Y0FmVDVMMDYwRmxCNGcyei8xTXVOWGowc0E2S3hzMVFQQ2NWemlh?=
 =?utf-8?Q?n8SnHUreohI4R?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGNyU09sZ3BmWDJJRVJqbEVnZlpyVS9TL3ZnNGFLWlQrRE1HT2x6WUxnTmg4?=
 =?utf-8?B?Nms2SHFmaVIwY1hwMG5LaVlhb3RRY1Fha2FLaFhoZVlEZkhKWjcrbEtqeW05?=
 =?utf-8?B?NktHQ2tQOE1ubmNGQ0swd0RuMDVEZlp2dmI2UGtwNjdHMUtOaGtXNStZVjZl?=
 =?utf-8?B?VlM4SkpRZnJHdkx2ZmU1VXF1dnNLZTlQNlNlQzFWWUZJemZRVGdZS2NLVTBN?=
 =?utf-8?B?ckFjcHZNOFBna2NOMTZ5Z2NhOFdsaVJmK0JuSWx0MXcwbVprclZmZUhBY3pl?=
 =?utf-8?B?OUthdVFoUUNuamNIb1hrc21ZUnlOUHZ6aHV4UE5iV05mYUJHWWNFZ3QzNUVw?=
 =?utf-8?B?LytNejhLa2hjc3drTjdnekhhY3JjSUFpT2hXV01qc09oVTBnZm9VWkhTY2Zo?=
 =?utf-8?B?cTFTWGJiWU5sK0JVc2hQanJNSVJTalVHcjZvUGRlT3VGdFJGdlluazdjL2Zj?=
 =?utf-8?B?UXV5eXBSWjlDZUlUaU5ydm9xVnFha3ppNVlkYit2WHJsK0ZaUzZJaVYvOERn?=
 =?utf-8?B?d25PNzhhYlhGWlAyRGwrcU0xQUQ3YnNUaU9lK3N2ejgrRVFSRjdxS0xKREg2?=
 =?utf-8?B?aWIveHJoOXFKazRwZ01XYWh3K1JpMGNyd0cvYStaaFJBZnVHYmFZYjgyZC94?=
 =?utf-8?B?bTdVeEFIV2c0d3Z2aWQ2MXY1TzIwcjExclNpWVFqb2FId0pSeGxrYUtoQnFR?=
 =?utf-8?B?NUo2VUlWQkgvbmpvV3lGOERNMVFyS2h0VGFPc052S0NVbnlTdlZrUWhVKytW?=
 =?utf-8?B?NXR6VC9CZExyby9mUlJXYk5PN3dFUkdOb2E5OUVMcERENTNPa1dVUG1MM3Ix?=
 =?utf-8?B?bVE3RlBNVy8wNm5iOE5PanhZSlU0VXB2eVBnNEZpQk9nY2hYWFhablZiRS9M?=
 =?utf-8?B?VDFaSFFrRDVNbTFKM0pjTDU1QWw0WGEvOVhxcXY5ZnJwU2hzaE03Tkx0ZUJY?=
 =?utf-8?B?TzJ5QVMrT1JkV0MxM29RaTJkaS8wQnMrMDhIZ05wZkMyUUY2Mm5oeUVyOVVo?=
 =?utf-8?B?WCtOdElVYUFPZk1jQ1U4UTVYd1lveDIxZDZxUjZZaTRjTUhSQXJGeUh5aXlX?=
 =?utf-8?B?Nmd3S0M0NU5Ha1hyOXdHcWlJU1hpU1RaU1JJVWYwVG9NcnRmNkt6RmlQdGZP?=
 =?utf-8?B?WUNRTVZPTjZicVdkNWliTklQZmplTi9acGNIRCt0d2FyK0xMQi9XYzFabzF5?=
 =?utf-8?B?SlhNVlFSd0JrMXZ0MjV2K3pBVzJUY2xGeC9NR2RNUnFVNWNJODl0QmZwQnBW?=
 =?utf-8?B?SWlQcHVrSTMxVzFzTkx0MnZnYW9LUkh1QWZtUVREcENwWE5FNnhYa3RiSGRV?=
 =?utf-8?B?RXQyaDR0c3BsK1RPSWhJemlRczlSSXozT1pnSURhMFBYT2hCRzhaVjBiNFhl?=
 =?utf-8?B?Zkw0alNTejFBZHFiTFc2ZVY3UVl5dVUva3hIeDRSd2xVVVhRZ3liZHNYTUZJ?=
 =?utf-8?B?QUpDL1labENqd2tObjkxSkpRUzAvNUpvc25WZlppbnRNb3dRQzR4ODNOeWNM?=
 =?utf-8?B?NFArS29teW5uNE9OcmNSa1VrSmdiOFJJcVRkMUExaWVVVnFvRE1IMXNMM3ls?=
 =?utf-8?B?RkQwSVFLKzRic2I0anhkRTFncVErRm9NTHQ1LzJmWXlnTDNxR3ZuaUhwYnJ1?=
 =?utf-8?B?VHhlbEltSm5zTXgvbmlQOVF3S1VLdWZTVHhnYjRiTGR5bG1ldjNucHg2MGhO?=
 =?utf-8?B?Y3lFcnREalpzZnBkUUlpN1llQnFYcU1nV2dBZlByKzgrL0duVkhQcmQ0eXlL?=
 =?utf-8?B?SGhEZ2QxRm9xbHZtT0JWeGlUbVNlVWNId1E2YkV3QzI0bVRzK2NYQlhNV1g0?=
 =?utf-8?B?U09lVm56WG4xYXhKMjdTbDVMaFhCNGVrbVhmYisxWmxMenh5dkxaQ1dTciti?=
 =?utf-8?B?OW9VNDc0a215K1lkWGVtb01pZklVUkxUUERBdTdPK1BzaWdTeFhEelk3cVhE?=
 =?utf-8?B?WFc4Q25LM21waVhvOXNpeUJMeFdudU95RnczMTZCWlFiQklMYml5d3REOStY?=
 =?utf-8?B?b095U1NvTC84M1MzTlpOcEZFc1JTUnJNREJWTm1HNmFvV1hCR2l3WERKVkJY?=
 =?utf-8?B?dEJ3d3RDVVlxU014a21GQ1lRR2ZRMDlJNHBqazE3MExZWjI2ZkRsbENsSHRa?=
 =?utf-8?B?dVZ4Vnl5c01KN0JESDNaM3BtaVJTNm1RSU1xdit0ek1hWnJIdEFHSzJlTEhR?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------URS6lWfT0OgrAYhaQAicJl8J"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 053eccbf-a101-431c-924f-08dcfe4c4b66
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 10:18:01.5554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QqQRU+ctBuDIlVH8HJ9qb40pqbQyHVxjzdhbHBz4NgHiDeDFNPArx+Xz9MwJ6qLBp+mUbm9C5u4XbBn3PG+wsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB7201
X-Authority-Analysis: v=2.4 cv=CYNa56rl c=1 sm=1 tr=0 ts=672b425d cx=c_pps
 a=DzAv3CiJae0BeNyBGltaEg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=o23s22ksl8lBMlfaAMYA:9
 a=QEXdDO2ut3YA:10 a=kNX1WJxVucf_jYpXo-wA:9 a=HXjIzolwW10A:10 a=T6a71-JsGAwA:10
 a=qoG85SPw42aFG8fzZzgA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: WJgG7j1s8MunbcwdfedA9XI4YRI7Fcip
X-Proofpoint-GUID: WJgG7j1s8MunbcwdfedA9XI4YRI7Fcip
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

--------------URS6lWfT0OgrAYhaQAicJl8J
Content-Type: multipart/mixed; boundary="------------B33V2sPy2ciKfb0Q4Q60Wnz0";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Conor Dooley <conor@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
Message-ID: <ff4e96e4-ebc2-4c50-9715-82ba3d7b8612@imgtec.com>
Subject: Re: [PATCH 03/21] dt-bindings: gpu: img: Power domain details
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com>
 <20241105-disarm-baggie-e2563299a24f@spud>
 <20241105-endearing-huddling-30728a002321@spud>
In-Reply-To: <20241105-endearing-huddling-30728a002321@spud>

--------------B33V2sPy2ciKfb0Q4Q60Wnz0
Content-Type: multipart/mixed; boundary="------------60oTQZBSPf2P34dsWerSD0yf"

--------------60oTQZBSPf2P34dsWerSD0yf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/11/2024 18:13, Conor Dooley wrote:
> On Tue, Nov 05, 2024 at 06:05:54PM +0000, Conor Dooley wrote:
>> On Tue, Nov 05, 2024 at 03:58:09PM +0000, Matt Coster wrote:
>>> The single existing GPU (AXE-1-16M) only requires a single power doma=
in.
>>> Subsequent patches will add support for BXS-4-64 MC1, which has two p=
ower
>>> domains. Add infrastructure now to allow for this.
>>>
>>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>>> ---
>>>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 29 ++++++++++++=
+++++++++-
>>>  1 file changed, 28 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.=
yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>> index 6924831d3e9dd9b2b052ca8f9d7228ff25526532..55f422be1bc5b7564e3e8=
1f24c4b93857f3e12fe 100644
>>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>> @@ -49,7 +49,16 @@ properties:
>>>      maxItems: 1
>>> =20
>>>    power-domains:
>>> -    maxItems: 1
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +  power-domain-names:
>>> +    oneOf:
>>> +      - items:
>>> +          - const: a
>>> +      - items:
>>> +          - const: a
>>> +          - const: b
>=20
> Additionally, a & b? Are those actually the names for the power domains=
?

Sadly yes, Rogue has power domains that are literally just A, B, etc. I
wouldn't believe me either; the attached image is taken directly from
the documentation for BXS-4-64.

>>> =20
>>>  required:
>>>    - compatible
>>> @@ -57,10 +66,27 @@ required:
>>>    - clocks
>>>    - clock-names
>>>    - interrupts
>>> +  - power-domains
>>> +  - power-domain-names
>>
>> A new required property is an ABI break. Please explain why this is
>> acceptable in your commit message.

Strictly it's only necessary for multi-domain GPUs, or perhaps in
instances where the SoC power controller already enforces the
dependencies between power domains. In reality, I think it was simply an
oversight not to enfore this requirement in the first place. We have
very, very few cores that require <2 power domains so names are always
required if domains are enumerated in dt.

Would you prefer we drop the requirement for "power-domains" and gate
the requirement for "power-domain-names" behind >2 domains, or just
explain the change properly and make the ABI break now while only one
core is supported?

Cheers,
Matt

>>>  additionalProperties: false
>>> =20
>>>  allOf:
>>> +  # Cores with a single power domain
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            anyOf:
>>> +              - const: img,img-axe-1-16m
>>> +    then:
>>> +      properties:
>>> +        power-domains:
>>> +          minItems: 1
>>> +          maxItems: 1
>>> +        power-domain-names:
>>> +          items:
>>> +            - const: a
>>>    # Vendor integrations using a single clock domain
>>>    - if:
>>>        properties:
>>> @@ -90,4 +116,5 @@ examples:
>>>          clock-names =3D "core";
>>>          interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>>>          power-domains =3D <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
>>> +        power-domain-names =3D "a";
>>>      };
>>>
>>> --=20
>>> 2.47.0
>>>

--=20
Matt Coster
E: matt.coster@imgtec.com
--------------60oTQZBSPf2P34dsWerSD0yf
Content-Type: image/png; name="img-bxs-4-64-power-domains.png"
Content-Disposition: attachment; filename="img-bxs-4-64-power-domains.png"
Content-Transfer-Encoding: base64

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
8EMth9mH6360+nHTEcaRknqkflZ9b0NWQ0djcmP70bCjLU3eTUd+cvppd7NZc+Ux3WMrj1OP
Lz7ef6LwRN9J6cmeU5mnHrVMbblzeuLpa2dizrSdDT97/ufgn0+f45w7cd7nfPMFrwtHf2H/
0nDR/WJ9q1vrkV/dfj3S5t5Wf8njUuNlz8tN7ePbj1/xu3LqauDVn6/xrl28Hnm9/UbCjVs3
U2923BLe6rqde/vFbwW/fbyz4C7hbsk9zXtl943uV/1u9/v+DveOYw8CH7Q+jHt455Hg0bPH
8sefOhc/oT0pe2r6tKbLpau5O7j78h+T/uh8Jn32saf4T60/Nz23ff7jX/5/tfZO7O18IXvR
/3L5K4NXu1+7vm7pi+67/ybvzce3Je8M3lW/Z78/9yHpw9OPMz6RPpV/tvvc9CX8y93+vP5+
KV/GH/gVwIDyaJMBwMvdANCSAWDAcyN1kup8OFAQ1Zl2AIH/hFVnyIHiDkAd/KeP6YF/NzcB
OLATAGuoT08FIJoGQLwnQMeNG65DZ7mBc6eyEOHZYFv05/S8dPBviupM+o3fI1ugVHUFI9t/
AW7rgwFabAn6AAAAimVYSWZNTQAqAAAACAAEARoABQAAAAEAAAA+ARsABQAAAAEAAABGASgA
AwAAAAEAAgAAh2kABAAAAAEAAABOAAAAAAAAAJAAAAABAAAAkAAAAAEAA5KGAAcAAAASAAAA
eKACAAQAAAABAAAB4KADAAQAAAABAAABQgAAAABBU0NJSQAAAFNjcmVlbnNob3RIShS5AAAA
CXBIWXMAABYlAAAWJQFJUiTwAAAB1mlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1w
bWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNi4wLjAi
PgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjIt
cmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgog
ICAgICAgICAgICB4bWxuczpleGlmPSJodHRwOi8vbnMuYWRvYmUuY29tL2V4aWYvMS4wLyI+
CiAgICAgICAgIDxleGlmOlBpeGVsWURpbWVuc2lvbj4zMjI8L2V4aWY6UGl4ZWxZRGltZW5z
aW9uPgogICAgICAgICA8ZXhpZjpQaXhlbFhEaW1lbnNpb24+NDgwPC9leGlmOlBpeGVsWERp
bWVuc2lvbj4KICAgICAgICAgPGV4aWY6VXNlckNvbW1lbnQ+U2NyZWVuc2hvdDwvZXhpZjpV
c2VyQ29tbWVudD4KICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgIDwvcmRmOlJERj4KPC94
OnhtcG1ldGE+CtqloxEAAAAcaURPVAAAAAIAAAAAAAAAoQAAACgAAAChAAAAoQAAJJXnkSOg
AAAkYUlEQVR4AeydB5gURfrGP5IgqKiAGAEDqKCg4oEZMKB4BkwoGBBB74yHiVM5s3IeBhRz
AsP/TOcpCiqKElwEPcWMKEYQFEmSFA6F/ffbXq01NVU9szPdO7Xb7/c8uzOdq35fTb2Vu1Z5
YEIjARIgARIgARKoUgK1KMBVypsPIwESIAESIIGQAAWYCYEESIAESIAESkCAAlwC6HwkCZAA
CZAACVCAmQZIgARIgARIoAQEKMAlgM5HkgAJkAAJkAAFmGmABEiABEiABEpAgAJcAuh8JAmQ
AAmQAAlQgJkGSIAESIAESKAEBCjAJYDOR5IACZAACZAABZhpgARIgARIgARKQIACXALofCQJ
kAAJkAAJUICZBkiABEiABEigBAQowCWAzkeSAAmQAAmQAAWYaYAESIAESIAESkCAAlwC6Hwk
CZAACZAACVCAmQZIgARIgARIoAQEKMAlgM5HkgAJkAAJkAAFmGmABEiABEiABEpAIBYBLisr
k+XLl5cg+HwkCZAACZAACVQtgTZt2sjMmTOLfmgsAtyhQwdZtWpVLAEqOka8AQmQAAmQAAkk
SODmm2+WCy+8sOgnxCLArVq1khUrVkiTJk0owkW7hDcgARIgARLwmcDjjz8uvXv3Lj6I5TFY
y5Yty4OQlAcCXB5UzcPv2OYfGTANMA0wDTAN1KQ0MGLEiFA1x48fX7TGxVYDnjVrVsBYwlrw
4MGDZe3ateE2/5EACZAACZBATSDQtm1b6dGjR0VU3nrrLZk8eXLFdmW/xC7ACMDZZ58t06dP
r2xYeD4JkAAJkAAJeEtgwoQJWWHr1q1b1r58d1CA8yXF80iABEiABFJNgAKcavcz8iRAAiRA
AqUiQAEuFXk+lwRIgARIINUEKMCpdj8jTwIkQAIkUCoCFOBSkedzSYAESIAEUk2AApxq9zPy
JEACJEACpSJAAS4VeT6XBEiABEgg1QQowKl2PyNPAiRAAiRQKgIU4FKR53NJgARIgARSTYAC
nGr3M/IkQAIkQAKlIlCjBXiTTTaRffbZJy+2WGv6119/lTVr1sgvv/wiP//8syxatEgWLlwY
fuZ1E56UGgIbbrih7L///lnx/emnn+TVV18N01HWQe6IlcBmm20me+65Z9Y9Z8+eLe+8807W
fu4gAd8IxCnAW265pXi1FGXHjh3lpptuKpr5119/LU899VSYsUKkaSSw/fbbyz333GMF0atX
L1mwYIH1GHfGR2DvvfeW6667LuuGKEwfeOCBErxiJusYd5CATwTiFOADDjigZgqwchhK1nhp
MmrFtHQToACX3v8uAUbI0DpBAS69jxiCaAIU4Gg+WUe///77UITxSUsvAQpw6X1PAS69DxiC
4ghQgAvg995778kFF1xQwJW8pKYQoACX3pMU4NL7gCEojgAFuEB+f/nLX+TDDz8s8GpeVt0J
UIBL70EKcOl9wBAURyC1AoxBVRMnTgzp1alTR/BXv3592WijjWTfffcV/LijbOrUqXLZZZdF
ncJjNZgABbj0zt1iiy3C36otJE8++ST7gG1guM8rAqkV4Ouvvz4c1ezyRvv27QW13G222cZ6
yvz58+X444+3HuPOmk+AAlzzfcwYkkDSBCjAEYQxr2rkyJFSt27drLMwwvLggw8O5wxnHTR2
rLPOOtK5c2fB/Zo3by5NmjQRzBf96quvwr8vv/xSfvzxR+Oq7E3Me2zcuHHWgZkzZwqmXths
6623Dmv25rHvvvtOli1bZu4OtzF/euONN846tmLFCpkzZ07Wfuxo0KCBbLvtttK6dWtp06aN
NGrUSL799lv54osvBPHDdfmMSq1du3Z4vfkQFV60UPzhD38QTDEDV+z/6KOP5K233srr/uZ9
bdvwD+KAuKAAhjnh06dPD/9mzZoVPicOAY4rXag4bLDBBrL55purzYpP8MfcdliLFi3CWiPO
w1xm+PSHH36QN998Uz755JOKa/QvKIx26tQpTLvrrruuLF68OLzmjTfekG+++UY/Ned3/JZ2
3333MJxNmzYNfwvrrbeerFy5UpYvXx7+gfHbb7/tTJ/6Q1q1ahWmPX0fvn/66afmrnAb/gR3
3RAfFKhhSH+77bab7LLLLtKsWbOKdIzf2Oeffy5z586NLZ3heaUIT5w+qA5pDpzjyp9wrziN
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
TFG7w0FYGIyFQVm0dBKgAFv8jqxpzyuvyjgCoemzV+agCWRij5SVBX09E8P+5IwLLBvbB4J1
7XHHhrUU8/CtY8cGGcibFbv3DPq/hgV9jy7DlA0M9FB22RFHyBEdd1ObGZ/I1M4a+VDFPjSp
jjp/YMW2+QWZ7PXBnEy9tG6eo7aReYDLGft3k3UcTfTdrrteUAhQNmHwZfJBMDoUGdJXQc3a
ZncGBQRMCyrEihVgPHPa11/LOQ8/UlFowb4/7rqLXN6zJ75aLc70oB5gssPApFtfGpvRvKnO
1T83DWrBD5w+IKwVP/x6mYwMBBs11ChDF8uVgQjvHzSXuuzaZ0fJC0FTfWUMBUO0IO281VaR
l/UYemNY+FEnvRR0+6AwZprJBFN6hgfi/aUjLenXH9mxo1x6xOH6rli/o/b9xxtvCguw6sZD
ju8l+7dtKyign3L3PWp3+ImwY1oSLZ0E4hbg/wcAAP//GPbAPgAAMVpJREFU7Z0HvNRE18YP
WCiK0lTAhqIgCNix0KUrUgT8LFixi4qgLwp20NcKqNiwd0SlSBUpF8FeEBUs+IooKsVCsaBY
vvNEJkyG7GY3m9Xl3uf4w2ySyWz2n9w8M2fOnJT6S01ytJo1a8rixYv9Wr799lupUqWKv57N
h0tHPi1FH37oH3JGyxbSq0ULfz3Vh6bXDpJ1f/zh7z6/bVs5ofFh/voff/4pfR57XN787DN/
WyYfym2xhdxw3LFycK1ageIvf/KJ9HviSX/b1mXKyNTLLpXSpUr528yHT5YulZPuvsesestD
9thDhp3YM7DNrDwye7bcPW26WZWO++0nl3fp7K/bH+6aNk0em/OyZHsZ09XZcvB18su6df7X
dNhnH5k8b56/HvbhzlNOlgN22y1sV+S2uNfcrXjgqGdk+vz5/uZyW24pk/9ziZTVa+ha0veD
qd9lZ7ZnstyxUiWpUqGCvPfFF5kU98pULF9exvS9SHCfhtmgMWNl4rvvhu1Ku63K1lvLw2ed
Kdtts03Kch1uull++Oknfz9YV9pqK3/dfMiFCeq45fjjpEmdOqa6RJezPvpI+j810q8Tf8eT
9Hdsufnm3rbjht8pi1as8Pe336ehXH300f46P5QsAhMmTJCjjjpKmjdvLrNmzZKhQ4dKnz59
YkMoVRwE+Psff5Qjbr4lAOHWE46XxrVr+9uee+NNuXniRH8dH8rrA/qo/feXOtWryzblyspn
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
EidAAU4cKSskARIgARIggWgCFOBoRixBAiRAAiRAAokToAAnjpQVkgAJkAAJkEA0AQpwNCOW
IAESIAESIIHECVCAE0fKCkmABEiABEggmgAFOJoRS5AACZAACZBA4gQowIkjZYUkQAIkQAIk
EE2AAhzNiCVIgARIgARIIHECFODEkbJCEiABEiABEogmQAGOZsQSJEACJEACJJA4AQpw4khZ
IQmQAAmQAAlEE6AARzNiCRIgARIgARJInAAFOHGkrJAESIAESIAEoglQgKMZsQQJkAAJkAAJ
JE6AApw4UlZIAiRAAiRAAtEEKMDRjFiCBEiABEiABBInQAFOHCkrJAESIAESIIFoAhTgaEYs
QQIkQAIkQAKJE6AAJ46UFZIACZAACZBANAEKcDQjliABEiABEiCBxAlQgBNHygpJgARIgARI
IJoABTiaEUuQAAmQAAmQQOIEKMCJI2WFJEACJEACJBBNgAIczYglSIAESIAESCBxAhTgxJGy
QhIgARIgARKIJkABjmbEEiRAAiRAAiSQOAEKcOJIWSEJkAAJkAAJRBOgAEczYgkSIAESIAES
SJwABThxpKyQBEiABEiABKIJUICjGbEECZAACZAACSROgAKcOFJWSAIkQAIkQALRBCjA0YxY
ggRIgARIgAQSJ0ABThwpKyQBEiABEiCBaAIU4GhGLEECJEACJEACiRMoeAGuX7++rFu3Ttau
XZv4j2eFJEACJEACJPBvEdh5551lwYIF0qBBA3njjTekSZMm8sknn8Q+nVJ/qcU+ev2BNWvW
lMWLF0vDhg1l0aJFsmbNmlyr5PEkQAIkQAIkUHAE6tSpI7Vq1ZJvvvlG5s6dm9P5JSLAvXr1
khUrVkiVKlVkzpw5OZ0QDyYBEiABEiCBQiVQpkwZ6dixo0ydOjXnzmYiAmx6wADWokULKSoq
KlR2PC8SIAESIAESiEWgXLlyUrduXalQoYIsXbrU63h+//33serCQYkLMCqFGxonSCMBEiAB
EiCB4kIAHt4uXbpI8+bNZdasWTJs2DDp2bNn7J+XFwH+9ttvPXd07LPigSRAAiRAAiRQYAQK
PgoavCjABXbX8HRIgARIgARyJkABzhkhKyABEiABEiCB7AlQgLNnxiNIgARIgARIIGcCFOCc
EbICEiABEiABEsieAAU4e2Y8ggRIgARIgARyJkABzhkhKyABEiABEiCB7AlQgLNnxiNIgARI
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
RK5CYII=

--------------60oTQZBSPf2P34dsWerSD0yf--

--------------B33V2sPy2ciKfb0Q4Q60Wnz0--

--------------URS6lWfT0OgrAYhaQAicJl8J
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZytCWAUDAAAAAAAKCRB5vBnz2d5qsDKc
AP9SHlfjkvrpu/K4/M4dKCQDBhN9BW+cTt6T94+ogETJoQD/e9IYFj0MhKb9PL3732kKvOdsn2Ti
yOTVwH2aP0tWEwU=
=Nlu4
-----END PGP SIGNATURE-----

--------------URS6lWfT0OgrAYhaQAicJl8J--
