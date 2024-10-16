Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B579A0C1C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 15:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2A210E710;
	Wed, 16 Oct 2024 13:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="icbIQEbx";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="ghqds3Ac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E6810E711
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 13:59:44 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G5hh7Z018155;
 Wed, 16 Oct 2024 14:31:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=hhU5xsmqcV9TWvbamDJXNQo0P5YsHHejlbNaeYjV6sU=; b=icb
 IQEbxv06sw4V/5EwGY0cAV/UZyftdGPTb8T6DFykUKSBOKAaiR4t22OrsNxas8ZD
 3HiQJWMN3qXEvQN7AQstVNbviGGNzK8XEtdphAMmhnP8aKsNqZpTuFP+YWIeEuKn
 CYx0BHPNYW9Xgy22FttC1LQKJXxxB6MyBfAwJZ4vQt+brHUUkBTKC8uvGGUqGwdb
 0kOpWtpD0QaYOxF6JAXLnV10si2BbXGMf19gqmkhszeDsDbpkhaOcDZemUHv273s
 hAVwU6kQ9PHQ6U1Lr0TQFTa2biHgYQVxZoc8oGtAF1zHTOViAqHnEQiKgAI/IuK2
 /1TXxA49NdMQGpbUNxg==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011026.outbound.protection.outlook.com [40.93.67.26])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42a37v8mb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 14:31:30 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgAHzacssxSoRAcoRX3zzx1p/HvJeDgtGF551/1NEhiZhscrGmqwEEYvJRRGvWqcRrLPj2tggxLF6xDdGWJ1bA/peqLPyLjvGid0QGceCEHl6iyxZBadWmSKKv1f0l6oKr2ZW1HyTab6IFTWsZTzg6YIGjH2gzx9LuvjHhjNzx0zEmgn5shQd70dy6qK3I/NylpFLPfkpkBW5q3lfpsCOEIabzilHliczzmqmJMJESvojbaq1G8QQItGFgV3OjNIIZRSs4JKNxSh2XppNaVPdiB6oHYK+lsF4awyNBUmpMi/cKgfo086AFpX8r+sSFg+XCp1cB8Qf7WmndWpv7JH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhU5xsmqcV9TWvbamDJXNQo0P5YsHHejlbNaeYjV6sU=;
 b=cGkPQvurRTbgi/7mvezA/rAitP7KbOzU9ZxtWDUlCc2lwGSJ7qp06+MbUyfmxoCD6xFy9Qfc760A9BbIFvMP0dIav2xLRROfjoPEtt2Irz8eFBMrrDveeQ/KP17POo0RzU0XjB8mJeTFfhIVWUiC2xVXCdBmrbAg5eJYCfLjs7c4g7UyA4g56TSleJMcqwMbwIfBWjxqouFl/aZhGOtxWQN1pHWVueOgBaGEGHOE5VBLK0JuMASguHRpc3ewA6UO+1R645lCyqlutMua5paQYthjX3VLTqstq0PL+Dkiw7xrLhd/Bn0Lr8Pyx6Y9CfQnW+bfR8liLJMooI/Hk6AD0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhU5xsmqcV9TWvbamDJXNQo0P5YsHHejlbNaeYjV6sU=;
 b=ghqds3Aci3+gA2qvL+QiznoFZL+nhRyqoqmvkCyqFmKeytLsPJqQA2rj9IfwCOCJoLbUObvJ+PmOwcQcbuA/h1uVQF9T8OE69fWgTiZwyqcP9UNaEishcvKNx1PVoZUY+C1otOvgSsCVO7C6IeIs7Zpp4POtIm6b+W5tWX19FK4=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LOYP265MB2175.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:121::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 13:31:28 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::db1a:5e96:699f:8757]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::db1a:5e96:699f:8757%4]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 13:31:28 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Matt
 Coster <Matt.Coster@imgtec.com>
CC: Brendan King <Brendan.King@imgtec.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/2] drm/imagination: Add a per-file PVR context list
Thread-Topic: [PATCH v2 1/2] drm/imagination: Add a per-file PVR context list
Thread-Index: AQHbHkSGKtoyUczCYEW12rZVwC4tMrKJYs4A
Date: Wed, 16 Oct 2024 13:31:28 +0000
Message-ID: <1a206b08485a1ebea0aeff5306c0f5b6eb7c315d.camel@imgtec.com>
References: <bf5cdfa3-5196-485a-b5ed-5a0e698dfc40@imgtec.com>
 <e0686c53-b16b-4202-9f74-abe5139e24d3@imgtec.com>
In-Reply-To: <e0686c53-b16b-4202-9f74-abe5139e24d3@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LOYP265MB2175:EE_
x-ms-office365-filtering-correlation-id: 5d34eacd-6c1d-4791-21f8-08dcede6d6f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aEhYRENRaTIrU3BJVElkbWl4L3c0UUFaUlRiZGZhcGdJZ0ZrN0JjWFRoSE1X?=
 =?utf-8?B?eFRHdUo4eW15RFMyR2IvakRXS0w2ME1VbXNhNVdLb3BGMk9QeVo0YmdWM25L?=
 =?utf-8?B?L1V5azBjUU1sTEgvOXJKcmV6UG10K09oUXFSN1pzbGNZTUZqc2cxa1YxY003?=
 =?utf-8?B?ZzJZdEdTM0F2UmhhdUtUcjFRMFZLdVF2eHhmSExnUFpxMkxUUkNKeFJTR0hn?=
 =?utf-8?B?QXZYZVU4UTVsRjI2RzF2QXY2OWFrejBSVnRXNkhPTm9MSHFqWFBFN2luN3RE?=
 =?utf-8?B?VEJXMUVzSUlyT29MQWRObEFIWjFXSkkwOWNPSFh2b3FySlpBRnpYZWJ4WjRE?=
 =?utf-8?B?WC9aN1MvYmphRFNSUWo0NUx5QnoyMGFMTXF5b2s0SnZnQmE3OGE1dE1qVmJv?=
 =?utf-8?B?ckRwek1nR1FDVzl6S0p6RE1lSW83ZFBJVWhHU1dEQXp0K3JLM2krVFlHNFor?=
 =?utf-8?B?OGNINytIaEhwa2tlRFA0NXBWWHdSU0VMd1VhcERZbU5mbGlNS2JRN0pVZk1D?=
 =?utf-8?B?WmtXRjFtVTJ1bCtkclIzU1VFeEZibEZLaGRENTJWWXYrUndwQ1lFY0ZvOCs5?=
 =?utf-8?B?dDhCaHF6SUI2LzhIbXd5dnVuby9LbWlSbTlkRmhhN01QQldlc1NCdlVOcTVC?=
 =?utf-8?B?b1ZpaUd4MmZUQk1zL081TTZWM29TZFNoZm5XNWFkenlyTVBDdGE4dXpKdUV2?=
 =?utf-8?B?WkxRK1FrWng5Uzc4QTh4eHdtcldHNFN1dFRLV3J3M3JlMTd4Qmc5aTlRcndJ?=
 =?utf-8?B?Sk9UdU9ETFlvYkxFS3F1aWtpbVd3T2FJTEJkZE9mMDkwMEdSWUlMTEVIQ0pF?=
 =?utf-8?B?Tlc4dXY4MzNzQjV6NWQ5NW45ZjltN1pwTkRvQ2JhNFAxcnJyalZvT3I2eU9t?=
 =?utf-8?B?M1llNzBkaFFiSTRIcFRqL0wreENUUytUUUJ2SEJwQ3daTldyTHQrM3lSRzFF?=
 =?utf-8?B?MjNOVTk1Ti9tNmMrNTdFUDVFaXB2ZXBUN1dpVFFLK3UyUjJRS3Z3cHpjeEhL?=
 =?utf-8?B?OXpUWnhMY0txaTU5VlJvemdSRVZkNm9NK0NVVms0emQwcjI0bmJ4QWdocEtk?=
 =?utf-8?B?Ykg0Znp4aGhJL0tBQk5FMmdUYTZ5QkJha2wyb0E1Tk5weFIvWnhBQmxtNDVj?=
 =?utf-8?B?a1Z6eVkvZEJrUTB3MTlWaEdCV1FkTWRSN0VPV0MxQlYxamJUVXZ0YU9KRDM0?=
 =?utf-8?B?QXhwRyswTko5dW1nWmlVSnhwKzBhcnNuSEtscFZSNWNVR1Y3VmkzUWR2MjFs?=
 =?utf-8?B?MUljTUFiQ0MrYXBSb29XVlhoQXNDS1NOdkVMVnFWVFdod2ZaQkROV2xoYm1y?=
 =?utf-8?B?WEo1ZTA1M1FuSThkSDFsWTErQnJCQ2p3TTBTWnl6dXJjMXg2MGdPVVNsZjBT?=
 =?utf-8?B?R2FibldqU3NUd0Q1aCs5Yy9MOUppb096MmhpRGwwek5tY0pkSllUSFcwRVRx?=
 =?utf-8?B?RkNRQ3doZ2ZnVjZub3RoeG83eXRRVmpOOG5XekRleURPd3d6OVlTNVFJR1Y1?=
 =?utf-8?B?dzdDdmdDN2p1U0xuVTNESXFXeXRJdjhuRW1Xd0w3VVNxY2pldTlkdmNpM1hU?=
 =?utf-8?B?RjBEcGxwUWNPYjFGOThzWTRRcFgxd0JGYlFLNEZ1cDYzTytxdi8rTXNmUTcz?=
 =?utf-8?B?Sm0wbTBFVG43ZkIrdnB5dUtmVzRUMUVEUllOUGdwTmd2ZldIbWp1czhpNyt5?=
 =?utf-8?B?dWptSnBnRC8zYlQ5RHJ1OHQ4TUk5bTJ1ckErbjNnWlFkcTRqZ2VvYk1aa2py?=
 =?utf-8?B?Q3lSbklyZzZrQ0ZEYTZyOG5ZdEtQTWNrd1FRbHFuaCthRzU4bTk4d3RZWmFR?=
 =?utf-8?B?OHNXdjErM0RPQmZPVlVsQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S29sZ1czNDdrbVJhUkpmWEFxdEc0N09kb2taVWo5VlhsWmQzM0hqa3VxWW1R?=
 =?utf-8?B?Ymd4R296a1Q0TTBNaTBaVWQycVlYSSs0TW1IdWZxVGZjSzI3aGhVcm5zZnRT?=
 =?utf-8?B?RlNBRFh5T3ZXYWhBRjhncllpM0hHbS9QVjRGM0JTN3dWcmRvTVJnZThUSG1k?=
 =?utf-8?B?RzhEV3hrSGdkN043YWdxSVZmT29EVGpKdHpaaXVVREJWWE44ME4wOGtmd1VS?=
 =?utf-8?B?YjFORVpCN056Ly9CQi9FNEF6OCtVekFxTmRzNFFOSW43TVV1OUVZTlJRaXFM?=
 =?utf-8?B?YTNFSjRuNUw3clhadG1qVGhCMnVONDhRV1BuRmdMbi9hQnVtMEU0enByU21n?=
 =?utf-8?B?SjBVYks5UDB3TEl3VU1VNng4dmtMdE83MUQ4V0lMVXVOUTFPYVdRWGx1by93?=
 =?utf-8?B?eVdxZUNTN0RVWS9qZ0QrNUJkdTlxYmQ4VjdzeFUwRDFGRTMwY0RVd3pVYzBa?=
 =?utf-8?B?OHhhZ3QrS1ZQOE9hQmV4NEVCSldlTnNqaEdhQ08xUUhjbnVyUk40OVlIZWwx?=
 =?utf-8?B?aVVMc2lEUVdYbzUrMVJsNGMvTXIzZFVrb044cUR5UTN0em9xWlpjTlAzVVFZ?=
 =?utf-8?B?UFFjVlRhRnlpTXJGcXIrYStlSTd4UzNtMUVVU0VUelBTMTRFTlZvMUlsbTkr?=
 =?utf-8?B?SlgxYjUxOUxvSy9BOERHaTczQVFSNldGVFc4MkVXS0J6VE9JaTAzMXpWN0Mv?=
 =?utf-8?B?S1NMbVpXcDhyZ3kraHp2NzVkd1FOSlFvZ1NaYWk1Y3BWZnFYZVppNDBIRHVO?=
 =?utf-8?B?T1VuY0hrUG1vWDEyYnNtNlRFemYwUkJ0WjVyUVhjZGF1YjM4MjFPeUtoazZu?=
 =?utf-8?B?K0MwQmNrb2VvRzB4Uk92bnBsTlNraFNjVHkyK0NqalVLUE44UHVXMVoxR0pT?=
 =?utf-8?B?di9ZaHgyV1NRcDhNL3p0ZTVqM2xtVkQraUJaZmxVZXUvblZJbzkwVldwd0JQ?=
 =?utf-8?B?WXFoYlRJa0ErWjFpMElzaU5PcGMrY2g2Z2NhN2krcGc2Wm9OUHpXUkwxNFlZ?=
 =?utf-8?B?dlZyWVczTWFqZlhvc1MwSGpiSjg2V2JNWWl1WDA5a1JoT0xmYW43dUVrWk5u?=
 =?utf-8?B?TGFXNlUyNzZiaXB6R1NYcTFOTGtDR0U0aTUzaWo2YnVEMkt2eHFORXcyY29k?=
 =?utf-8?B?Sm5McWplek1TVFo5R1A5ckNMaFhzUEswWEM5ZlFpYmtPa1llMTFRcVpGb0Ry?=
 =?utf-8?B?UElzTmxqUit2WmVPeW1BbGZReHFYak53dG1Gd2NhanVGeUprRVlCYkJ6Rk81?=
 =?utf-8?B?T25rdWhjckJhc1g5alJYOCtjR3pYVlVOaVdzQnlEcUtRT1Vib1VoL2VvV1U0?=
 =?utf-8?B?TGQydVQ2dVlyRngrMVI5V2l6RGtjWlNxRUR1UDlWaVJGeDI0MU5kMHp5SG9v?=
 =?utf-8?B?bXIrdW5qVjhkbElzUFhzaTNvamVOdW1wNUN5cjdDakM0cERzSjkzbi9hUG93?=
 =?utf-8?B?WlFWeEg1N0VzNGFnYWxmcmpEZHJ3NEFDWmFJbnZyZFkzM1BkUVBSZUFnVXFp?=
 =?utf-8?B?SUhXY2dJWG9PenhsWlovczNPaXAvNkppdWZ4RTdTTDdBbDJTa2pzTVNuTmQ2?=
 =?utf-8?B?bFFIcEVweTdiZXRkTko4NUdMVUFkM29rU1p3WjF1RTh3TVNrMnFuWFFicFc2?=
 =?utf-8?B?OVRBcnR0bk9wTEcwTzdiQ01wMnd5WUJNU216YzNvTUxTdUpKRHVyNVBNZnl3?=
 =?utf-8?B?Q05jc0JIcitDakJhSVZmeVl1ejBYRGhpcG5vV0xKVlVrZllpYk11enl0NEhS?=
 =?utf-8?B?TDdZZkxPbmJFd3hnODRuYXNUMllOTEdMOWxlRlpnNG5HQnlrdnZnVHp1dXU4?=
 =?utf-8?B?MVhtYmQrS1VyVWlDRXp3a2ZlU1kvK3NnTHlSdmpXSWZQcGxpYkdwVnlXTzBM?=
 =?utf-8?B?dk1GK3AxTDdVSEg3QzVwem9UVm0wSHRxdDRhMTRyb3Jqb0FFS25DLzlobWJZ?=
 =?utf-8?B?cm15WVFCNFlldFgvcFZlWjd3dmVTVHNUYnN0WTNNTlFxUEZqSzB3dHhyTGRs?=
 =?utf-8?B?WVoxR1c3OWZwbFBSY0YzZTRJUVZ1SytFcWRaazJKUm5BZW1mSXV3dU1WT1hj?=
 =?utf-8?B?bmFYeEhsb21rSzltU1NNV2NmN1lRMk5UaDNQY09qcmN1b09XTkQvM1E3UE9n?=
 =?utf-8?B?NE1tU0wxc295dUV6bWZTZHVueW9iVmxzMzNZaVNjVmtpQWo0b1pwTUFucmFO?=
 =?utf-8?B?TlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AB471E1D7819748828BEC324776D9AE@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d34eacd-6c1d-4791-21f8-08dcede6d6f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 13:31:28.4349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SUS8eu/aNND2uPHpmOMJVEgq/XwmsvjvAPtakwfQIW1gOGN2YEPD7/+piSTE9YowIPiG570rtwcOjmqPpE+yYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2175
X-Proofpoint-GUID: _TVAfxK3NyyjzmesOJj720skQLWQYs9F
X-Authority-Analysis: v=2.4 cv=N5V7FH9B c=1 sm=1 tr=0 ts=670fc032 cx=c_pps
 a=/lXe6HOdRU+sJltUoZpKYw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=WnR_qW7rlZcA:10
 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8
 a=mkea9kOM8TGc-rzchx8A:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: _TVAfxK3NyyjzmesOJj720skQLWQYs9F
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

T24gTW9uLCAyMDI0LTEwLTE0IGF0IDE0OjIyICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
RnJvbTogQnJlbmRhbiBLaW5nIDxicmVuZGFuLmtpbmdAaW1ndGVjLmNvbT4NCj4gDQo+IFRoaXMg
YWRkcyBhIGxpbmtlZCBsaXN0IG9mIFZNIGNvbnRleHRzIHdoaWNoIGlzIG5lZWRlZCBmb3IgdGhl
IG5leHQgcGF0Y2gNCj4gdG8gYmUgYWJsZSB0byBjb3JyZWN0bHkgdHJhY2sgVk0gY29udGV4dHMg
Zm9yIGRlc3RydWN0aW9uIG9uIGZpbGUgY2xvc2UuDQo+IA0KPiBJdCBpcyBvbmx5IHNhZmUgZm9y
IFZNIGNvbnRleHRzIHRvIGJlIHJlbW92ZWQgZnJvbSB0aGUgbGlzdCBhbmQgZGVzdHJveWVkDQo+
IHdoZW4gbm90IGluIGludGVycnVwdCBjb250ZXh0Lg0KPiANCg0KUmV2aWV3ZWQtYnk6IEZyYW5r
IEJpbm5zIDxmcmFuay5iaW5uc0BpbWd0ZWMuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEJyZW5k
YW4gS2luZyA8YnJlbmRhbi5raW5nQGltZ3RlYy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQg
Q29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MSAt
PiB2MjoNCj4gIC0gQWRkIGp1c3RpZmljYXRpb24gdG8gdGhlIGNvbW1pdCBtZXNzYWdlIHNvIGl0
IHN0YW5kcyBvbiBpdHMgb3duIChlLmcuDQo+ICAgIGR1cmluZyBiaXNlY3QpDQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jb250ZXh0LmMgfCAxNCArKysrKysrKysr
KysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jb250ZXh0LmggfCAgMyAr
KysNCj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmggIHwgMTAgKysr
KysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9kcnYuYyAgICAgfCAg
MyArKysNCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfY29udGV4dC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jb250ZXh0LmMNCj4gaW5kZXggZWRlZDVlOTU1Y2Mw
Li4yNTVjOTM1ODI3MzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlv
bi9wdnJfY29udGV4dC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJf
Y29udGV4dC5jDQo+IEBAIC0xNywxMCArMTcsMTQgQEANCj4gIA0KPiAgI2luY2x1ZGUgPGRybS9k
cm1fYXV0aC5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPg0KPiArDQo+ICsjaW5j
bHVkZSA8bGludXgvYnVnLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4NCj4gICNpbmNs
dWRlIDxsaW51eC9rZXJuZWwuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9saXN0Lmg+DQo+ICAjaW5j
bHVkZSA8bGludXgvc2NoZWQuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ICsjaW5j
bHVkZSA8bGludXgvc3BpbmxvY2suaD4NCj4gICNpbmNsdWRlIDxsaW51eC9zdHJpbmcuaD4NCj4g
ICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3hhcnJheS5oPg0K
PiBAQCAtMzU0LDYgKzM1OCwxMCBAQCBpbnQgcHZyX2NvbnRleHRfY3JlYXRlKHN0cnVjdCBwdnJf
ZmlsZSAqcHZyX2ZpbGUsIHN0cnVjdCBkcm1fcHZyX2lvY3RsX2NyZWF0ZV9jbw0KPiAgCQlyZXR1
cm4gZXJyOw0KPiAgCX0NCj4gIA0KPiArCXNwaW5fbG9jaygmcHZyX2Rldi0+Y3R4X2xpc3RfbG9j
ayk7DQo+ICsJbGlzdF9hZGRfdGFpbCgmY3R4LT5maWxlX2xpbmssICZwdnJfZmlsZS0+Y29udGV4
dHMpOw0KPiArCXNwaW5fdW5sb2NrKCZwdnJfZGV2LT5jdHhfbGlzdF9sb2NrKTsNCj4gKw0KPiAg
CXJldHVybiAwOw0KPiAgDQo+ICBlcnJfZGVzdHJveV9md19vYmo6DQo+IEBAIC0zODAsNiArMzg4
LDExIEBAIHB2cl9jb250ZXh0X3JlbGVhc2Uoc3RydWN0IGtyZWYgKnJlZl9jb3VudCkNCj4gIAkJ
Y29udGFpbmVyX29mKHJlZl9jb3VudCwgc3RydWN0IHB2cl9jb250ZXh0LCByZWZfY291bnQpOw0K
PiAgCXN0cnVjdCBwdnJfZGV2aWNlICpwdnJfZGV2ID0gY3R4LT5wdnJfZGV2Ow0KPiAgDQo+ICsJ
V0FSTl9PTihpbl9pbnRlcnJ1cHQoKSk7DQo+ICsJc3Bpbl9sb2NrKCZwdnJfZGV2LT5jdHhfbGlz
dF9sb2NrKTsNCj4gKwlsaXN0X2RlbCgmY3R4LT5maWxlX2xpbmspOw0KPiArCXNwaW5fdW5sb2Nr
KCZwdnJfZGV2LT5jdHhfbGlzdF9sb2NrKTsNCj4gKw0KPiAgCXhhX2VyYXNlKCZwdnJfZGV2LT5j
dHhfaWRzLCBjdHgtPmN0eF9pZCk7DQo+ICAJcHZyX2NvbnRleHRfZGVzdHJveV9xdWV1ZXMoY3R4
KTsNCj4gIAlwdnJfZndfb2JqZWN0X2Rlc3Ryb3koY3R4LT5md19vYmopOw0KPiBAQCAtNDUxLDYg
KzQ2NCw3IEBAIHZvaWQgcHZyX2Rlc3Ryb3lfY29udGV4dHNfZm9yX2ZpbGUoc3RydWN0IHB2cl9m
aWxlICpwdnJfZmlsZSkNCj4gIHZvaWQgcHZyX2NvbnRleHRfZGV2aWNlX2luaXQoc3RydWN0IHB2
cl9kZXZpY2UgKnB2cl9kZXYpDQo+ICB7DQo+ICAJeGFfaW5pdF9mbGFncygmcHZyX2Rldi0+Y3R4
X2lkcywgWEFfRkxBR1NfQUxMT0MxKTsNCj4gKwlzcGluX2xvY2tfaW5pdCgmcHZyX2Rldi0+Y3R4
X2xpc3RfbG9jayk7DQo+ICB9DQo+ICANCj4gIC8qKg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jb250ZXh0LmggYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2lu
YXRpb24vcHZyX2NvbnRleHQuaA0KPiBpbmRleCAwYzdiOTdkZmE2YmEuLmE1YjBhODJhNTRhMSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jb250ZXh0LmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jb250ZXh0LmgNCj4gQEAg
LTg1LDYgKzg1LDkgQEAgc3RydWN0IHB2cl9jb250ZXh0IHsNCj4gIAkJLyoqIEBjb21wdXRlOiBU
cmFuc2ZlciBxdWV1ZS4gKi8NCj4gIAkJc3RydWN0IHB2cl9xdWV1ZSAqdHJhbnNmZXI7DQo+ICAJ
fSBxdWV1ZXM7DQo+ICsNCj4gKwkvKiogQGZpbGVfbGluazogcHZyX2ZpbGUgUFZSIGNvbnRleHQg
bGlzdCBsaW5rLiAqLw0KPiArCXN0cnVjdCBsaXN0X2hlYWQgZmlsZV9saW5rOw0KPiAgfTsNCj4g
IA0KPiAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBzdHJ1Y3QgcHZyX3F1ZXVlICoNCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmggYi9kcml2ZXJz
L2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2RldmljZS5oDQo+IGluZGV4IGI1NzRlMjNkNDg0Yi4u
NmQwZGZhY2I2NzdiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24v
cHZyX2RldmljZS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2
aWNlLmgNCj4gQEAgLTIzLDYgKzIzLDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4N
Cj4gICNpbmNsdWRlIDxsaW51eC9tYXRoLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4N
Cj4gKyNpbmNsdWRlIDxsaW51eC9zcGlubG9ja190eXBlcy5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4
L3RpbWVyLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gICNpbmNsdWRlIDxsaW51
eC93YWl0Lmg+DQo+IEBAIC0yOTMsNiArMjk0LDEyIEBAIHN0cnVjdCBwdnJfZGV2aWNlIHsNCj4g
IA0KPiAgCS8qKiBAc2NoZWRfd3E6IFdvcmtxdWV1ZSBmb3Igc2NoZWR1bGVycy4gKi8NCj4gIAlz
dHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqc2NoZWRfd3E7DQo+ICsNCj4gKwkvKioNCj4gKwkgKiBA
Y3R4X2xpc3RfbG9jazogTG9jayB0byBiZSBoZWxkIHdoZW4gYWNjZXNzaW5nIHRoZSBjb250ZXh0
IGxpc3QgaW4NCj4gKwkgKiAgc3RydWN0IHB2cl9maWxlLg0KPiArCSAqLw0KPiArCXNwaW5sb2Nr
X3QgY3R4X2xpc3RfbG9jazsNCj4gIH07DQo+ICANCj4gIC8qKg0KPiBAQCAtMzQ0LDYgKzM1MSw5
IEBAIHN0cnVjdCBwdnJfZmlsZSB7DQo+ICAJICogVGhpcyBhcnJheSBpcyB1c2VkIHRvIGFsbG9j
YXRlIGhhbmRsZXMgcmV0dXJuZWQgdG8gdXNlcnNwYWNlLg0KPiAgCSAqLw0KPiAgCXN0cnVjdCB4
YXJyYXkgdm1fY3R4X2hhbmRsZXM7DQo+ICsNCj4gKwkvKiogQGNvbnRleHRzOiBQVlIgY29udGV4
dCBsaXN0LiAqLw0KPiArCXN0cnVjdCBsaXN0X2hlYWQgY29udGV4dHM7DQo+ICB9Ow0KPiAgDQo+
ICAvKioNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2Rydi5jDQo+IGluZGV4IDFhMGNi
N2FhOWNlYS4uZmIxNzE5NmUwNWY0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW1h
Z2luYXRpb24vcHZyX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9w
dnJfZHJ2LmMNCj4gQEAgLTI4LDYgKzI4LDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9leHBvcnQu
aD4NCj4gICNpbmNsdWRlIDxsaW51eC9mcy5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5o
Pg0KPiArI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9tb2RfZGV2
aWNldGFibGUuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICNpbmNsdWRlIDxs
aW51eC9tb2R1bGVwYXJhbS5oPg0KPiBAQCAtMTMyNiw2ICsxMzI3LDggQEAgcHZyX2RybV9kcml2
ZXJfb3BlbihzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2Rldiwgc3RydWN0IGRybV9maWxlICpmaWxl
KQ0KPiAgCSAqLw0KPiAgCXB2cl9maWxlLT5wdnJfZGV2ID0gcHZyX2RldjsNCj4gIA0KPiArCUlO
SVRfTElTVF9IRUFEKCZwdnJfZmlsZS0+Y29udGV4dHMpOw0KPiArDQo+ICAJeGFfaW5pdF9mbGFn
cygmcHZyX2ZpbGUtPmN0eF9oYW5kbGVzLCBYQV9GTEFHU19BTExPQzEpOw0KPiAgCXhhX2luaXRf
ZmxhZ3MoJnB2cl9maWxlLT5mcmVlX2xpc3RfaGFuZGxlcywgWEFfRkxBR1NfQUxMT0MxKTsNCj4g
IAl4YV9pbml0X2ZsYWdzKCZwdnJfZmlsZS0+aHdydF9oYW5kbGVzLCBYQV9GTEFHU19BTExPQzEp
Ow0K
