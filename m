Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPDoE2xzjWlk2wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 07:30:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D612AB7B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 07:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9342F10E6DD;
	Thu, 12 Feb 2026 06:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m4SiPFIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E2D10E6E0;
 Thu, 12 Feb 2026 06:30:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCHYAL2zPPZn3d/ka/5VGyzFssufrnREpF/VAR8Cyv+Ac7JTnvW/FhWM7sk3WMTh96ZxjCv/N/UcEz23bIOqwanTQpNB/RfIQoxAAxxlhAqW1SG4f0+35PLGEWLwL7zZ7tR8f9p57Z3OeGM6hELIhIwsNd/bAQJ9qb2p4OgsIP7plHo/I/QEj30E1wQbYDT2VUeLJlZt58XYRyVH7t820iDn9a949GRAp0TN5pwz5qku/9pBayx/wej7hTAvWqftx1M/cHk94ZeUSiCtZ+i8z6NMKdgR372CTqqN+9lc1yMM4kxno/PN3C8f34du8jnL/ZI4R23XC6KE/8n53bE0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MZCbry3xT9HH/Rjeide4E4Yup+crep9T/mOV3d3kbI=;
 b=qFxRctiyaKu3D+NMwGm75czto8KnDa9chJHsx8s6r03SBjDwb+Wgob9Dd8eqW4gDBP+ra/yYgGdI3i6aM9ridUOexrLA1pZj5jfAercVPiOGh6Q3jF/rHQHIxgmgX0Px5MrFs2fhmqnqTOSlseIwCsxVs7+LE/IbItmerq9pnpjSRmR/3nsIA1Z7NQpOCx9QLhLE2RumZrdUyuMnpJy9SEm8l7UjnjLvIVgrnt2JS6daK/5CQoGpNcqTBLV+Xa5GS4/7WbBXGXwxQH9q0ae2qOhSieCK+D8YdZxNca7LtLaq7yxbZ4sGHZEqR8bKESMHpAaPpUL8/deZLzl+w+xVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MZCbry3xT9HH/Rjeide4E4Yup+crep9T/mOV3d3kbI=;
 b=m4SiPFIoNx7JJYtr8/9uqakUmfehJVU5fuNz5T3AjyQWMoX3QTbX9p1zA6WdX4pXtfqKRKxAqiYlW8IFXrJuYREaZLY92Xb+Okb2C1scEeTunjTrTTOkCeCowb+19J+3GnRQ3q07wvHGGoDJFm4woBURZzMp2qxvtPP+jXvB4PaXAcQYL832nuDuPpK7Mlw5m6zK9LR43nHA8SjlgOt+esAIsr4bTG0zDG+DGS3oSDRGSu0IxK1tKDW1BJXhKSuEcj/3mTaXQbd6rUyNQ8101a4mLrIu9zq2Dhe7jPj2Kask3kcrOQ7eTX7dGXQQJjklKVFjAyzUijF/Q7gazeVEHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 06:29:53 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9587.016; Thu, 12 Feb 2026
 06:29:53 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 12 Feb 2026 15:28:07 +0900
Subject: [PATCH 5/7] gpu: nova-core: gsp: unconditionally call variable
 payload handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-cmdq-continuation-v1-5-73079ded55e6@nvidia.com>
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
In-Reply-To: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0149.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3279d0-a2b0-44f0-08f5-08de6a0021d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFBnL1U0S0grVDN1a3M3YnYvNUxqSFlJdE0xUjR0azFSdUVWMlJuNkZVUmFC?=
 =?utf-8?B?eUpjeHJuNUF3dmhiNlhzUm91cE5EdkxGS1pDMXlNNll2aDVJam1vaXlNeEdH?=
 =?utf-8?B?clBZalNkV1RjNEFWVEdMcWU5UG9aak04NHdIMlJNVTRwVHV4NmJzSkZPYkpJ?=
 =?utf-8?B?SS9QZytPY3RPeUFsVVE0Y3daclpVcDlVZkZLNWZiN28zWllra0QxdTN6WUlQ?=
 =?utf-8?B?ZTlFd0hoSU5wTzdBbVhteEtGVXRjSEY5L3U1eTJOWml1bTIzOU96WnlBeFVK?=
 =?utf-8?B?L2g5MkdHWUwyWHpPckZ5eEhUTzBXVzJPTzM4d29ubUFTMmhJQTErSnpXR3Jx?=
 =?utf-8?B?bW41NDc4Zk8wT3h3K0JXSFNPVWhqekVVSWpMTlpEZzRwazVLRm02VUxrNmVu?=
 =?utf-8?B?Y2lwNG5lZWkzcmJ3NHh3UmpyeWhCelRxeEE2S3F3cjVLcFdDWlJKMHdRbE5M?=
 =?utf-8?B?aXJYWjUwYkYzZEh2RVZ6UVFaSnZaZDNKQ2pmRysvSm8zSUwyNCtlVHAxODVB?=
 =?utf-8?B?SlRYa1dCbldhc1VYVUhjODVGN20vS0QxSkpoM3lKUlQvaUF6S1RKRTR6Ulpw?=
 =?utf-8?B?dzVHcW9JVERMSzRyc0xPRDdWMWV1dGNNbFVOZlZHWEw2MW5YalpFZko0L0N0?=
 =?utf-8?B?blhkazNTakUva2xCWnVrRGNIWlRzQWpxajVMMWcrTEdxYS9zMThjVDhIbDk1?=
 =?utf-8?B?Q2VWUkdKZUpoSElGT3phdGNnWGd0QjcxRk1pc21GdE9PNmtVMHQyUXB2Uy9O?=
 =?utf-8?B?SmhuN2tEZEpGQWpmMmlwYkhUNUEvcjNZT3B2c2RHQ2lwSGpEdUFtcFFMWlln?=
 =?utf-8?B?dlprODNaTGM0V3JFd2RBUEhJSGJ3bm5VcTlFMFN5QVZrOEVmM2E5SFlKWmFQ?=
 =?utf-8?B?M3lvNUJQS2dvODVTOTRSSmQ4cklhRE9sUENySjVHdUlOUmZqaHZ1emFicE5X?=
 =?utf-8?B?NXpCeHZDYURiMEN1S1VIRElTbURsUUR5RzFmSFMwSGh1anV3RkhjMmQvMW9I?=
 =?utf-8?B?V3lPd0RqY2ZEeThrZDZCY2VTNGJ5SitmaUgvRnpnOENaU0J2R0dMTVhvd0dI?=
 =?utf-8?B?Ui9KUitlMGNjNW5iUkJOa25XM29oYklFa0JRR3BTOStSNm10VFFUc1JmZ1NR?=
 =?utf-8?B?b0tjY2VhTWV2TEFlRkZ3WHRPR3NtaVpQVmszRWpzVlQzUVZIeGsya1lMSVdm?=
 =?utf-8?B?Zi9IYnZBY3ZBNXdFaGRmWnh4UlpheWF2TGl3eW01Mjc0YWtVYjBMcXFtSklV?=
 =?utf-8?B?dHdDTW9abHFUaWxRZjBKeEhKV0NXRWNDMjJlSjE3Zm9WNzJydml3MktIcFNY?=
 =?utf-8?B?OWZRNTJMV1JDaW1XdXVWNEJqaXdRcjUzNHRlRWVvRU1icHNnOG40aWxlb2Ix?=
 =?utf-8?B?STQrMHBUalRpSm16QUE5d0ZUM0NIeG1Cc241OGtkRkdZaG1Od3MzeDh4em5D?=
 =?utf-8?B?MWRjZ0NXeExiOEJFcWpjWGt3YWMyYm5YLzMzL1NiN1JrSkk0ZnZsSXp4RlN5?=
 =?utf-8?B?UVU1V3NDSitCenVvbnJjSkhYWHlnc1EvQXRHRVBnU0d2L3lpWUc1SWJGWXBI?=
 =?utf-8?B?c2E1N3oyM0JRNmtrNERMa29qOGZsWjR0blUrRkFBUjZDUzZCMXM4NEg1OWl3?=
 =?utf-8?B?b2NWSXpxaklYTm84MGVhYnlud3oxTHZISDlSSzJLVXlWbzc4bEdIZEE2TW41?=
 =?utf-8?B?c2VhYzFHV2NUc2xLQmIzMytJc00wTjhPQk0yejNNdEFrVXZrTC9Wall1VlhC?=
 =?utf-8?B?eW1YeWY4TnhMVHNTTjYwWERtOWdLTXVoeEMzVkNjbE1WMTI1dDdEUUJRSEhr?=
 =?utf-8?B?QTRiQ3FtYmMwcmt3UmxsVm4xQUw4emQvczhBak9NRlc5NE5SVnBRVDk5MmNl?=
 =?utf-8?B?NjJaRm5aKzNZcFFsS3pTNWV6R05WbHBRZXJER1IrKzBaSDFtTTlyNVg1bUNE?=
 =?utf-8?B?dUwwZWQ5NnVuVktaRHNrVmtLRnNDM25iOGhrK3Izdzd6YytJUzRIL0hySVV4?=
 =?utf-8?B?UVZObHJnbXN6a2VQME1OSW9mOVpUQ05YaE51K1gzWlAwMDFQdGttYzJNVXR3?=
 =?utf-8?B?aDlNKzd1aUkya2Z3ZldvVUh5QkUvK0hzUmhhVitFb1d0WURmc2hMMStKWnNB?=
 =?utf-8?Q?vX6I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDhtbE1IK0U3ZlVJbU5ESWNZTWFoM081STZEbGJpZDloZG5sdGQ5bVhjWEhq?=
 =?utf-8?B?cTN3T0c3czhnSkVmbHZrbURvTFFNUmx6a1BFeHIwM1E4cXYwVFVhbXZTaUJ0?=
 =?utf-8?B?MnVjd0t4UjVkek9iSzlWWWU3alBuQ3J1c2MzOXFqR3p1eWNWU0NvMENabHdF?=
 =?utf-8?B?dFFLVThBMDZtREVpd052bEp0RFNTWTZaaTViQ1FGSitCSlUwL21yc1BkY21Q?=
 =?utf-8?B?OENLSmhtY1d4WjVHZmY2QVJFWUFKUmswa29NU3loa2RITlZMbmZXZ3hOdjZk?=
 =?utf-8?B?Vm9vcGZCS0g2alFpMm1laTAxLzdQdUJCNHhHTDllUUhxbldialNQT0llazlz?=
 =?utf-8?B?cjNwS3V5UWMxUGRlZDc2S3pGVXNkRXdtU1VhRGdqMUhlYnNhdlJlWUJ2Ymtq?=
 =?utf-8?B?Y1JwV084M3U0bmxGZHlJdUpDZDdHdUlQbnFXWDRRN0pUZ0NMS1I0SW5pNWJ2?=
 =?utf-8?B?TVMyRktkSmh4ME11SHdFcnh3RjdxSVpqOXhJSFRJcC93Z3dtclpFOUtSa01G?=
 =?utf-8?B?NFJBc0ZwL0RlWThiK1ZXcE9xQmZlRmZWY1ZVYytIdUlMVElyK3A4VWZwUHJt?=
 =?utf-8?B?Z1BpdllnQUFWbjJPQkpOS0VXdHNwbWorbXRXZVU5OWNRazZ6eU5JZllKeGxz?=
 =?utf-8?B?djRXZ0R0RzNNTXo4Qm1BUHREeXJBL0NabzhIeEZMbENrMXljTEZ3NlNwcy9E?=
 =?utf-8?B?Yk9QL2R0RGhrMlFiaFdCemp1eU5hNjR2ZmRieXJkS0Z4bjgyZzduZG1zOHht?=
 =?utf-8?B?bDhaUWRBMndVSXNCWDRrRnNIU2tPaDlaN3FrcGdEUFA5c1JzeGo2Rkx4Nkpx?=
 =?utf-8?B?WnFxNnJBeHkxZUtUdWczaVB3RVhSQXJFTE5iMGlhMkFBUUtuSXFkSFd5c0FI?=
 =?utf-8?B?ZVZHNnVGQlRUaW81ck1qWWVydTNZM2dtZWwzTFAxbXU5Smlab2MvalIyN0Ey?=
 =?utf-8?B?ajZ0N2xGclpZbmVoejlkdHR2bm9VOENGbERvTmwxSzNQaUVTcUpFbTFrSUlj?=
 =?utf-8?B?c3ZTRFRucjdHSVN1STlkTEwxWkV4V05Nd0FpR2syd0VlVUFUU1B3YXpZTUpi?=
 =?utf-8?B?ZmdZbWNRR2VVSkR3TXZUNDJjT3lTUnpUTzhPYkdoY1JLcTBsWEZ3dU5CQ1ZL?=
 =?utf-8?B?ZStHczVoUmg2dE01VHh3V1drZDVGQXN2dzVnY01GeWovRUtNVHNWRkpKeEty?=
 =?utf-8?B?R2V6Rm5xcSt1WVdqV2o4Z241MUNQRTA5dkZvY0J4WFdvNCt6cEo5Qjd0d0NL?=
 =?utf-8?B?SzdOc1JPL1RUNDZKMnZWdzlKMG8yTWs5c3hpV3hkUkhaby93QWc4aWNFaGhO?=
 =?utf-8?B?RGdCTE9FeUd2cGI2SEhYT3FaUVkxT3I0SXpBaTVhOUZjTHRUTzRJN3RFdDNJ?=
 =?utf-8?B?MVViSlFwck1VOHZHY3cyMkNMSTloUnpUR2toY2ZUbXJENG9ENXFoUzFwRDFY?=
 =?utf-8?B?dTdJQTZnc0dEb3hYMmU2WUYyclp4ZmNkR0ptZGg1aHBuZVg4dkVINm14cnFp?=
 =?utf-8?B?TDBoK0h0elhXUVEvSFM3b1hiUEYzQ2wxMVIyKzNWdFY5bUkzZXRwakFJZmp2?=
 =?utf-8?B?N1lHbHgyNW03S2ZCVE9OSWQ3eHJwVTNrVGJTNm9yWjRBTE9CWUtUOWs5Ynhm?=
 =?utf-8?B?WDVwc2FsUkNaL3RWMWhPdlJxd3ZUNzlPRW1PU1pNNE0vK2x2aUJJRHM3bmti?=
 =?utf-8?B?WHd6Vm9KYTZmMFhNRzk1YzQveVVvWENiWkZRTjFkSnhGbDRSNFd3ME5HQWdQ?=
 =?utf-8?B?b0xEWEE5eHdxQ0pGV3hwU01MS3NkZG9INGlFU0hqZUVZbzJYQW1uamI1VE54?=
 =?utf-8?B?MFl4bEpKMkJhVXVFZm1xbWZDOUZMR0N3c05zN0Z1UzhucVhsb3FrL3cyWm1W?=
 =?utf-8?B?anp5U0dZazhYazJhSVBmd2FjTjdEaURSMVF5bE1qbDQxNHN2TGd2QnBqOVBk?=
 =?utf-8?B?ZktQbVdXanc5MzRSckNyS01LSkRCTzI1WW82d1YvS1RKa01qdTV5L2t6bXh6?=
 =?utf-8?B?MnEzRjhCUnZiOTlaaVRmZ21aNHhkeDhDQ3N5Tnl0N0g0c2dvTzRSbEk5SWFt?=
 =?utf-8?B?K1luc0tVUEpWVW5MRm0wSThRME9vNkw4WVJtWFNZR3huUlBjUWZyTHFRMDVL?=
 =?utf-8?B?RnhZMXN0UzBNaXROVTNlN1JkcGJTMVpvZU1scjhGZ0FqZzNBNi9ySWhRQUsx?=
 =?utf-8?B?czhVZnRTbGsvMC84OXJhdGJLMmt2bWNoOWgrYWJhV3ovaWRYbnEvSWRKb1lQ?=
 =?utf-8?B?NktDY1pYYnVnQmlFMjRaUmJhMVVZajY0a1RKeTRZd3N6T1lxcWF6SjZCd210?=
 =?utf-8?B?QnlmOEozVGVCMFhEQ09zUGQ2SHJPVndONGpoUi9WQ1AxOWxCdFFkWC93L0J2?=
 =?utf-8?Q?NlL8jKExZlZ92IcqOzXYHUsq8wQib9uw5AA7ZBbp09Ovt?=
X-MS-Exchange-AntiSpam-MessageData-1: wvZkQmdv4YbW9Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3279d0-a2b0-44f0-08f5-08de6a0021d2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 06:29:53.3988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcZlNqECGe97aUATkjKsg/9zfI7A/Aqc/uShiwHQVESij4avMWmuFHzDJXzoMc1ES+l6hF1AliGu8OdL1j0iDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: B37D612AB7B
X-Rspamd-Action: no action

Unconditionally call the variable length payload code, which is a no-op
if there is no such payload but could defensively catch some coding
errors by e.g. checking that the allocated size is completely filled.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 78f0b1a0e30c..3e9f88eec7cc 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -556,16 +556,14 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             command.init().__init(core::ptr::from_mut(cmd))?;
         }
 
-        // Fill the variable-length payload.
-        if command_size > size_of::<M::Command>() {
-            let mut sbuffer =
-                SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
-            command.init_variable_payload(&mut sbuffer)?;
-
-            if !sbuffer.is_empty() {
-                return Err(EIO);
-            }
+        // Fill the variable-length payload, which may be empty.
+        let mut sbuffer = SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
+        command.init_variable_payload(&mut sbuffer)?;
+
+        if !sbuffer.is_empty() {
+            return Err(EIO);
         }
+        drop(sbuffer);
 
         // Compute checksum now that the whole message is ready.
         dst.header

-- 
2.53.0

