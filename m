Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C446F968330
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 11:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358C210E271;
	Mon,  2 Sep 2024 09:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="L15kCLTr";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Ru3vSFSe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2012010E271
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 09:27:19 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4826raVa005632;
 Mon, 2 Sep 2024 10:21:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=2ujPKSuJSAdwYW6JIfrCfcrx+
 p9jYn4Nzh0q36LCf2g=; b=L15kCLTrITMvzAkBF6luFIRcIPLToQsfI1Arog0hH
 VDylGhaw3n4eVoIqlcfDsQp7aTJh/6MKdQfYGG3PKGVUk+jqctAesLa+yyebtAnq
 Fvji9fEW9lVplrYy7HtqOpdW2BhXlI0ZSu9oKZw3+mtF0zaNT58dmANq4FWoaOl9
 qWP1yd1VmGHVQeKaBpm/Fq6Np7LXMowHhGxj6+uYYdaM5x3tXeqaqYSf7yesDk1/
 pTJEvjhxWoztFmfLFmKjZ9ZTcDH2orMppYta1rD5ALF6Smb1gO0WLVDAXEzmYp8L
 DzYGCz6WibhhMZKILFnRtqZrdJR8NMdVtNkgAR4nXqrTg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 41bses9d0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 02 Sep 2024 10:21:58 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 2 Sep 2024 10:21:57 +0100
Received: from LO3P265CU004.outbound.protection.outlook.com (40.93.67.4) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Mon, 2 Sep 2024 10:21:57 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSqpyhzORPk6PLR+KQKvMoCZfbwDsS9NIvt2OtbvY+tc/tr8uLANseBJyw/zR7IDEG7p14mT1GdmG6wdaMTUI2wU/ShdR2D/qZIgiEKXnVRLUfk+Ft/kO4jCiWtf0fEMLRR00QKc8vne59qjg+DKWRq9wnxM+Tr0430s3vniSbhYmudl+yxpR3YhEKFTWRDr4agiNAhc6/6Z1JhHmAMis51cFM5i0fo2aJMsZk+awDMR+mFgGJfT63AG86Mlnse2D6E0tLcwT6ZdQOdoQjFtkDgqFeOiYp/AdJ5bptFS9++0KGK0E2cGyHMKiP/rE1iviKnahN5WR8t7cSJzTuMBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ujPKSuJSAdwYW6JIfrCfcrx+p9jYn4Nzh0q36LCf2g=;
 b=DD7gaGmn6uez06d6wZ0HqWW/EHDFVKkgoo0e47L/JnCzc0rvpGNXOJj2VLJu8lRjz/48wjX9FmdkiKffwpJEl6p72xJnlPjBwNTflm5y4xVD0pV/luQwC9IjZH3dpJlPcxDTfANlWxUR1/w5Kzn8AVYHFIhLjQpA2TXy+4J+VUDw71Rv4foOVvwkWht/fcQnU/FtNQSZ5wxnhMsBPYHaHFwuF7/vfHbEsdrwyYMW2dh/Pp4ZdGwRk+zzp66nLX/tb1EM+Z2zWDJTmTcU20W8IceSJble9nUUes4tXixUJcLIXx6xZzjqHFbAeobGhyNtFRC0PlzBCaPYIqqxseBXZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ujPKSuJSAdwYW6JIfrCfcrx+p9jYn4Nzh0q36LCf2g=;
 b=Ru3vSFSeONufHWoTo04FQjLN78kXMMhjZYQ6R0kl2VmSggbtckaur3hMpiMFQqojRTkTliXi0OsP+z7+RW23LNXStaNzZB83G4B5O0JUcjR4yGF90/6UaR1Dy87EsxVx1oLbD3L/iZT+i0nNWT8EF2VBndhs8gVoKqrS18JmeCQ=
Received: from LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19c::12)
 by LO3P265MB1929.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 09:21:55 +0000
Received: from LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM
 ([fe80::54e3:e143:a879:2417]) by LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM
 ([fe80::54e3:e143:a879:2417%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 09:21:55 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, Frank Binns <Frank.Binns@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v2] drm/imagination: Use memdup_user() helper
Thread-Topic: [PATCH -next v2] drm/imagination: Use memdup_user() helper
Thread-Index: AQHa/RmNz33WoTWU2ka18PjMKa+VcQ==
Date: Mon, 2 Sep 2024 09:21:55 +0000
Message-ID: <ea4ec650-d858-42c2-ab59-e17824069ba9@imgtec.com>
References: <20240902023300.1214753-1-ruanjinjie@huawei.com>
In-Reply-To: <20240902023300.1214753-1-ruanjinjie@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO2P265MB3406:EE_|LO3P265MB1929:EE_
x-ms-office365-filtering-correlation-id: 6cccb940-40d0-40e4-faf9-08dccb30b005
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MWg2ZndNTEN1QnBnUHd0aUltZDA3NEZJUFZJdVF3TTdIUm01bUJkOUJUQXpL?=
 =?utf-8?B?UThUdk9uREl0OVB0MXk0VkN2VVBaVEdOK05QNHhHclBsVHVSR1hoT0l3SUpv?=
 =?utf-8?B?Y05EaHZ4cE56UFJqT2psOG44c3VXWWlnb1k2UmJVaWZWejN2NzhGMWh3a3Zz?=
 =?utf-8?B?Q3RpVWZUZDJkUUQwSFhMMGIvUUFzemtLM0QrZ2QrbDNSYXo0akZSUEtCNGtY?=
 =?utf-8?B?TldzUTlhWFVKdG1jMGNNNERYR2ZVUXVxdHYzdVlNQ0hDenlNVlc5Ky9xY3o2?=
 =?utf-8?B?ZmRPbGJXbGpURHJuaEtqNUxsbHA2N1RoaWp0RVc3L0ovZlF0VlF0QjlmZ3Z0?=
 =?utf-8?B?dC9xQi9xK2pVdEdFSi9US1g4S01NbkVEckpMV2VCcXBmeitlL0FkTDlBb1Rp?=
 =?utf-8?B?VEdJMDcyeUM1eHZQVkl0U2pyQ1VpZU84OER5Q1RJNUFveXlQWVZSYm9xQjFE?=
 =?utf-8?B?MnNrY1pROFpETkJzOTRoNkRNTjREN1RQNTl6ZmtEenh1UUtORWsva25Lanc0?=
 =?utf-8?B?c3daQ1FrSVQ3QW12OG01blVjazR1eExLTkhIcStYN2NBT0ZjUXFGQTlpWTV4?=
 =?utf-8?B?VlloVjFvOGw3bGNheXJXbnY2ZjNOakcxZ3FlYkNISCs2dW9xNTY3RnpVaWJS?=
 =?utf-8?B?azdLYU0vMktSN2ZjeEZwdmdDUjNxa01mV0FpTWp0UHVudUxaS3hhUUwvQ1hU?=
 =?utf-8?B?aFcxU29SdEEzZmw4VVljRGZtNFV0RUZka3JvN3laRzY1OW9XWE5Fdk5IWmZi?=
 =?utf-8?B?Q3RMM0NBQStqdXVMMTVPbnJjWHRINHJkTzByc3pxNnNqNXlPZTFTZUxtQmhB?=
 =?utf-8?B?eGpkYWZ4ZzhOeVZKd3NvRjlReTlqaDdmbTMwUTdUSVR1MXBHaE1VU0FoWVJL?=
 =?utf-8?B?RXg0Ym5yZGo1SGcvK2g1RmE3UUhvb2tvTmhtY1JGUnVSMDYreXI3b25xVit4?=
 =?utf-8?B?RjByN3RwaDV4ZWIxTGRwekkyNktMdzdmQ2dlU2d3SnVNYVdmcHpLL1hxUDAv?=
 =?utf-8?B?NHhiVVpaTDhHZDh1aElBR3NRdFQzc2UzL2ZaVDJPUXlUcGVJWWI4U3B5Q1Vx?=
 =?utf-8?B?NkRkeDVpclduSy9LTFprdlJ0OUJITWx6eCtpVXNwblJmNThoRWNiRDRETnJT?=
 =?utf-8?B?ZkJMblZaZGxNbTdXUDVjMW16bDBVdWFWM0xmV2sxQXBhOUdRbDFnV25zeGU1?=
 =?utf-8?B?cE02RDRwYVlmQTZUUzlpWFpCN05OU2EwY1VCZk9TYThWWFJQOUt0ZlhzcUJH?=
 =?utf-8?B?bHhFamd4a1lCWWtlRHFSdUlwWEtwYldranFNZzZFUHd2R3llY3lNZ0FyWVhY?=
 =?utf-8?B?UHNUZFI4WmdEV3I2cDJTNEVnakVCR1I3U0JFSjFkNTlFM3ZhNzJ5aElzTHEr?=
 =?utf-8?B?Y09RTElmK1o4cS9Yckt4TmNibDRkZmpDaU12NzFJcVdxY2w4RDJZWkJvQ0RK?=
 =?utf-8?B?MG96SkY4NFJ1eWxZdHhlZmpGMGhYUkRxeE5xdTZ0TndneDRRNytTR09TQ1c0?=
 =?utf-8?B?eTg3NklOV2k4L0hSTEtrd25IU0N5TUNSVHlJNFNIeENvUFVoQXc0aXJHUGRF?=
 =?utf-8?B?em9NMm9DNjBpeHZjS1gwZ2M1cUdzc2pXUitVcTZoK3Q0ZHJZZzB1YzJSS2gy?=
 =?utf-8?B?dmRvdng1T2JlcUhSbVk2djdnUzRheVNlVnNtaVFRMWVYWjE3OENuTDM0Vzg1?=
 =?utf-8?B?SWIybG9YRmN3bmo3L1NadEppOXovUzNxcjdVYjlsZ3dRRERxalN2bGVGWHhO?=
 =?utf-8?B?NmVYMS9MNHJlNUxmQW5RWG4rVFZ0VDVHUHBTNWxScnZ5Mm9HY3lhZTZlM3VH?=
 =?utf-8?B?MWZvT2JxdzdGNmt3bnFHSkRyM2pmcHNKQkNiQW5zTC9UekRpUWRTeFBndDZD?=
 =?utf-8?B?N1N6dHJpSFlNczlXVCt2bGVqQTVFQ2k3MmNjZkllb2xMSEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2N4bzdPZUMzeXdjYjBHT1dVQjBMdjU1Y3I4eUdNejBqYjNoQ0dqOHE0RTN6?=
 =?utf-8?B?TnE3alZTK1oxZ2Ntd2N0Y2ppbk9HU2VPd0hIT05ITUozT3ByaWhYMFg5dnFT?=
 =?utf-8?B?UTlhc1ovRHNyYU9ESEJjZDJCY3lwVTZoVFZFZ0htaWVsc21iR0NhTmMyQjMz?=
 =?utf-8?B?d2lYdDNyWE9Fai94ZjFLalJFZWdLT05ZdW1xWTdNUXcwUC9SZkVwVXFxOGtM?=
 =?utf-8?B?YVRSY1JjeisrazlvNTl5NzJnOU9kQWZxVDVqZi8xRVpKWVFkUk5ycElJbUx5?=
 =?utf-8?B?MGtOcTJuWUR0eGJxdlZsMlg4VGNqcEtNN3I5ZHZCM3ROSkhwc1V3SHdKVGtG?=
 =?utf-8?B?UXZzZmhxWWF2RDNFaWdwcUszTjRoNjFQYThiN0owblN4NHUrUjd2ZTBWZEVK?=
 =?utf-8?B?SEFwc25USnVZeWM1aVpEMkxQNGdzTUh4U3d3aW5Jem0yZmR3RHlYVmIyN3Zi?=
 =?utf-8?B?ZnVOaGVJZ3ZrV252VkE2NHdsNzFpa01RWDlOZUtJSEJ3WFZ2QjAxV2Y3UVFt?=
 =?utf-8?B?K05DMEFTcjFFSmo1Y3k0NkpuTkZscWxsUkNZcUs1cHIvT2poZVZWd1VRV0xL?=
 =?utf-8?B?R3hhdWFxcnYrMDlFbEllMjFhNFd6Z3RkdGU1M0tjcVIrNmVmTmMvN21WTERw?=
 =?utf-8?B?dDR5OEJUSFNxenlGWmtwNndndWltUU1HNWlsNzBVWVZIcGNNMVFUZDJGZ1Jh?=
 =?utf-8?B?M25wWi9MenNUMDMrcFhnUWxMMFk5aC9NdXR4OVZEY3p4S2NUL282ekFuaGxB?=
 =?utf-8?B?WmtWcTJiRVJ4RGRnd2NXV2pXV042NTdBTlJUS2Jsdmw2UFJlQ2N2M0dvVkdw?=
 =?utf-8?B?cWFiMDJucVc2Q1hrWFN6TXJ3bmtpM2lWREZpN04wbm55QTROUkkxREFpMGdR?=
 =?utf-8?B?Ymx3YlY3dFBvUzFrTTFRMEZoVWtGa2c5c3FqUjlnSnRJdnlac3l1ZmpXc3hw?=
 =?utf-8?B?VVNmMUVnTStjVnRtTEFJN1Bab0hmZThWdi9RL2NveWF4Z3FCZDZPOWhKRDZV?=
 =?utf-8?B?L1djYnpxUGUrVlV3T0luNVRpRGgvYmxZVkQ2c0tUQjQ3eVZRY3lGcWFDZUhB?=
 =?utf-8?B?R3Zubm5xaDUrLytPZDNha0V4K1RGNlVUT1FtZ2hpNlhIajJ3YmszdFJMSVRG?=
 =?utf-8?B?OTd2M1VOS1dXV3pTb0t3UmNGSW1iZmpkbU9WeHBycm5oTEZTeDVoWlN6WnI0?=
 =?utf-8?B?OEt3cHZmOC9Qc2krUXZWOUFhelFtbjZxODFJTnVVaU1EMEdTZXNFdDFibWpp?=
 =?utf-8?B?dzAydXkvOCtVaXVXZGJQZWtjZEFvL25NYzlTUW9rNnh0WFlBS0ZYdHlZWVlo?=
 =?utf-8?B?eGhuQ0RoUStVTzNOU0tmMDJBM21Jc0E5TjRBcjlHTjRGZVN3TU1tazZtNmRQ?=
 =?utf-8?B?dzEwK1JQTXljd2ozOVdYNURtNnMvZE1ybHhtVm5vdWhkZEdRbDBJQ2ZsVVpJ?=
 =?utf-8?B?c2U1cnM3M2JnZnRIa3QyV1ovUVQrN1lBUDBmUFNKZnBrSlliTWRGWnVTYk5T?=
 =?utf-8?B?bGFjMjBDUFVpNmVHTUtxbFM5Y0E5dnZzV0pOR25hS2NmVi9pQmpwa2VNVEJH?=
 =?utf-8?B?MjhwMm9nYXhyZkhLa0xoMUxZMHUvYlVkRVJmYUYvYm90YVRCVTlER21FR082?=
 =?utf-8?B?TUlSNm14a1lYWElVTTc0Y3hUWUNjN1pRWWRRUHFaU0tXc3I3ZFJiWEx1SG9M?=
 =?utf-8?B?SHFqWjBya0oyZEpxRXhEM01UTDNLUVlsUWVxRStRRW1ULzF2czVNeHBhdmg1?=
 =?utf-8?B?S21aa3A1S3V1Vkhpc3lkS1RUeHhQa3ZNNTZtSGllaWN4UmlnaVh5N09ZRXZz?=
 =?utf-8?B?WGhsbFRPTG96RFlJY1ZReHN5ZFhiYjVVLzM0UytOVTlBSHV3ZTBISG1WM25D?=
 =?utf-8?B?S0dBT0pJRjluWXJrV1NEMHJpSzNsRnpHTXYrSjkwZXpGWHYybE1VZXFjNC9q?=
 =?utf-8?B?akVSbFhUS2xFU05ZUTkvU05GdVlxamttNWttZGZkV1M1V0Q0OWgvMW9yajJW?=
 =?utf-8?B?YnkrZE1JSFh1QThxdTdIdU1EZVNrOTdsWmhBeURUMGYwRFJpWFczVlZPSGJi?=
 =?utf-8?B?eHJCT1VwRDRZZmdlNkV6UEtDOVBmOHVHZldxTHhYQWNyb3lidHM5UmdWN1Q1?=
 =?utf-8?B?NEZSMmZFRlFUMTMrTUM4Nm1ZS0FMTFp1Ylh4cVdxNjdhN3JNa205UEFLU3pT?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CTZFXxtZ0dm2tjc39wWR2y5j"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cccb940-40d0-40e4-faf9-08dccb30b005
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 09:21:55.1259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VhxQT/MZMlB3Mv5+rQksK+6vMKQ8F1Z7yPUf6LtL2efT7B79hkElEUKi4FHQjVBjkLutfZF/1oxS1ND6g/O5eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1929
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=aKOiqq9m c=1 sm=1 tr=0 ts=66d583b7 cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=siwsJ6XmfWLo7r-GpXgA:9 a=QEXdDO2ut3YA:10 a=XY93YCl5WELb_fpiUGcA:9
 a=FfaGCDsud1wA:10
X-Proofpoint-GUID: cgrbiQBUc95s1pAvkhu86sIH68iHUXK8
X-Proofpoint-ORIG-GUID: cgrbiQBUc95s1pAvkhu86sIH68iHUXK8
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

--------------CTZFXxtZ0dm2tjc39wWR2y5j
Content-Type: multipart/mixed; boundary="------------ji931XuWxXTQmQE68yVDUSu0";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <ea4ec650-d858-42c2-ab59-e17824069ba9@imgtec.com>
Subject: Re: [PATCH -next v2] drm/imagination: Use memdup_user() helper
References: <20240902023300.1214753-1-ruanjinjie@huawei.com>
In-Reply-To: <20240902023300.1214753-1-ruanjinjie@huawei.com>

--------------ji931XuWxXTQmQE68yVDUSu0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/09/2024 03:33, Jinjie Ruan wrote:
> Switching to memdup_user(), which combines kmalloc() and copy_from_user=
(),
> and it can simplfy code.

Applied, thanks!

[1/1] drm/imagination: Use memdup_user() helper
      commit: 2872a57c7ad427d428c6d12e95e55b32bdc8e3b8

Cheers,
Matt

--------------ji931XuWxXTQmQE68yVDUSu0--

--------------CTZFXxtZ0dm2tjc39wWR2y5j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZtWDsgUDAAAAAAAKCRB5vBnz2d5qsC1K
AQCXSNScvpH9NH5vG3koAjMwf9d8TTPeu+R9T9Hy/QYI0QD+O2qsJ7N31gf3Ca2GKwRmPkfmqb0U
E62xMCVA2ldLvAY=
=TXa3
-----END PGP SIGNATURE-----

--------------CTZFXxtZ0dm2tjc39wWR2y5j--
