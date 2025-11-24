Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13946C83E02
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7812510E375;
	Tue, 25 Nov 2025 08:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=novatron.fi header.i=@novatron.fi header.b="ZZbfiZU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023089.outbound.protection.outlook.com
 [40.107.162.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBAA10E107
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 14:10:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cfgk+JkyBlYXX8tlCbkY2h9UUjyWvE1rOLc18s/6/hIOlOpKzUX0vObrVKrkzFEisemVW2jIh4P3BQ6c6QTH5xTaGRne/F2Eagxvfa0o2MYdUvu2neKrjqSTXwzjcfWcXf2+J6L03kKqupQyB7VjCanbXzoOQuf0PEnq8bFqPlbLj7Tbze9RQPD1qZOH2jCe8ZnYeI3Egstpt4zW9z82Vgtt4WzazvdEEUA0LHoCVPoDHovXo2Dv/7WP4dCmLTbchl+ndEg0nmQN8sc0+8DtcQMArIciR61ofmukWH7Ith/jVCHW9cK5F+Qc3CxRqiVkqp6/CayMQslZAY43lfGPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjmPpb1F0PdgLG8j1KoryECRaWXj5YTbXkzuVbrjspI=;
 b=V2mDv8uvGh6hCneHnP3+RR2VUG/eev4PjyRs76lkhofXWyq33Ny/A5+EDgaXjf5wibjsbwL49PIeiT/4w1ZP1MiSMpBaDXeaXWypw4ZqklHl5VkvjWxuQNGB56L/JiLddfj1wkBdqRMS9xrfecTj49y5NvnTZ8L0J+HqpJw4YY61o/wvKUTgAcE1zae/KyIBeT8dugsuHA75XRPj7qfnGmE7EoGB3OFEqa+z2TThZvZt845kQioKSzAVRAp6UIwnlw5QQ3nV0kwuCaQzyNPHnLBlJ885FV4HcbK7gYiBm9Xs+HUF9fsj+FtxOsGBjfZErE+bg+iO3h15LLoPcBor0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=novatron.fi; dmarc=pass action=none header.from=novatron.fi;
 dkim=pass header.d=novatron.fi; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=novatron.fi;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjmPpb1F0PdgLG8j1KoryECRaWXj5YTbXkzuVbrjspI=;
 b=ZZbfiZU+QpBY0oSz6UljaiI5PEcqDOHcyx0PDVbbT/9iij0+gFYFGQF+HnpoZRurYMBf2uFBZr5mn2ezpaq4+KDh/jH5atlg/hzrVCUrq1qktsJLcyTB7LyMsnnVDS+1geapyVF6eMlrgEzLwJ5P9GdqBGsD5ZPGf3o/KIVJABM=
Received: from AM8PR05MB8132.eurprd05.prod.outlook.com (2603:10a6:20b:355::10)
 by DBAPR05MB7046.eurprd05.prod.outlook.com (2603:10a6:10:184::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Mon, 24 Nov
 2025 14:10:41 +0000
Received: from AM8PR05MB8132.eurprd05.prod.outlook.com
 ([fe80::e410:591c:728e:32ba]) by AM8PR05MB8132.eurprd05.prod.outlook.com
 ([fe80::e410:591c:728e:32ba%6]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 14:10:41 +0000
From: Petri Karhula <petri.karhula@novatron.fi>
To: "danielt@kernel.org" <danielt@kernel.org>, "lee@kernel.org"
 <lee@kernel.org>, "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>,
 "deller@gmx.de" <deller@gmx.de>, "jingoohan1@gmail.com"
 <jingoohan1@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] backlight: Add Congatec Board Controller (CGBC)
 backlight support
Thread-Topic: [PATCH v2 1/2] backlight: Add Congatec Board Controller (CGBC)
 backlight support
Thread-Index: AQHcWS7r3AnkCJvIKEahtuN+h2OvL7T7SEOAgAadmQA=
Date: Mon, 24 Nov 2025 14:10:41 +0000
Message-ID: <029807169cc8913abd8f5948cc025e9ef5f37c11.camel@novatron.fi>
References: <20251119-cgbc-backlight-v2-0-4d4edd7ca662@novatron.fi>
 <20251119-cgbc-backlight-v2-1-4d4edd7ca662@novatron.fi>
 <f40abf01-46f2-41e6-a21f-c58c21d653c4@bootlin.com>
In-Reply-To: <f40abf01-46f2-41e6-a21f-c58c21d653c4@bootlin.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=novatron.fi;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR05MB8132:EE_|DBAPR05MB7046:EE_
x-ms-office365-filtering-correlation-id: 21090739-8388-4201-a5b3-08de2b634048
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UGZnYkdpNFE1RWNGMFIwZU9Ybk1aTW9ieHF0b05zcmF2cEtMVDJ6a1RBQnNS?=
 =?utf-8?B?YmNLeDNMdEtOK2ZMWEJmTDExaFZTak12R3lXK1g1bDAralZiU1ljb2g3enlt?=
 =?utf-8?B?SW95dFJvcFFpN2pGZFFoRzFrUVZMTUJ6Tlh5clRqSjgrY29pWnRKclIvSHBr?=
 =?utf-8?B?UmpWRnI1dTVoenRQR2RSM2pIVWtITVJpYVg3RnlXMmt0YXF1MkFWZldqY3Bi?=
 =?utf-8?B?TzRBL1NIY3VWUU1xcUg0WXl0V0VzT0pCYkhSaFZWV29ZdDdMVUFldXdsOWdC?=
 =?utf-8?B?bmtaZFFnRmdrQm9NaDQyZGRVcGlOakJhNzF6cTdlUDVEcWkzVklFVUdRVkFD?=
 =?utf-8?B?MUJzWGJZek8wMXFiN1MvWnJGY05DWDdYd1cwU2dNc0dkdTJkdk1lQW13d2pN?=
 =?utf-8?B?NjczZFdnd2NLWE1UdUxKOUY3b05KU2VzY1lyT255Ry9mMkNPVmlOU0FSNEZC?=
 =?utf-8?B?V3lUeUNzRUMwUzVIRUtWUE9WcnZEbjlvbFVaTXpTTmZNVjRmQ2xLMVdTbVUv?=
 =?utf-8?B?ZGxxenhzaVdlZHZOWUlTMCtHUzlpdjlUQXFFR0o5Y290cURCcHBwekFWL3dW?=
 =?utf-8?B?MjAwWG5OYUVJNU5HOC9WVlhneUw5ckRjc254c0JKNi9rR1ZZS3ZIN0JzM0F5?=
 =?utf-8?B?WkZmVWh0UGZycEpQRFA4TjRPWGo5Q29hNWJOdG1tcnpyL2F2c3Z5eEE0ZnVs?=
 =?utf-8?B?WXZUOERXTUFXQXlDbmtBK3FxRWs2L09HUmlpVTRWdERzUTdqZzYrMFZ3MFIr?=
 =?utf-8?B?Z3lrOVVmaUk5aDg4TndERWI5Tzk5WG9aeDB4NklSTkRGcFZPZ0VHbndFWnVG?=
 =?utf-8?B?dGtNNDlFREc2WlNoa0VDMVFNZjNYRWRSMVV4clM2azQ3WHYxemlCelhxWitq?=
 =?utf-8?B?bnRqbHdoaklxalRVZTBibERlL2J0NDg5S0l2aS95bzVMM3k1akViaUoxNXVn?=
 =?utf-8?B?bzRYWm5vK29lOXV1elBRT2d0UnFvTkNCTE8ySWxyckJsOHJhRHlybkhxdzZ0?=
 =?utf-8?B?K0N2eTBYQURSU3hnMUxiVFdZWFpSeHk5c1NPelJTa1FSajhDeEpKc1g3dFVn?=
 =?utf-8?B?a1dESnNEVjRBb3pWS2VlR3FwUnNkK3ZaWFl4SVEzSkZOMTI5NU1sSVYrZjVq?=
 =?utf-8?B?MjVOSmN6NmMxMHkrR0xKeXZBVGhONEVZUXBwNmtJWGxYUXlYNHdtcDU4Q2da?=
 =?utf-8?B?aGxzMSt3TUhaUGFwOWdSdjE5a1VyZjlYRWxxdXdiL2FvaVhLUGNIaHI2SDRC?=
 =?utf-8?B?cEsvLzhocGUwTzlUVU1QK1lYNXVCTUdlVmFUcjdSVHJNRWtnQnpoTGQ5VDlN?=
 =?utf-8?B?VUtSSEpLTllrUFd6anBtN21YUFV0V3Rld0QvclluV3l1eFMrUk16QUVYdWsw?=
 =?utf-8?B?b2s0aUx2MTFtK3dsRmM4ZjhaNElkT0RKaG1wWmtkWkhJaWRyc3FkWXQzYVRQ?=
 =?utf-8?B?cSt4Uzh6L0hoQ0JyK0FGMjgwT2xXLzZJUi8rSElGRGNJS1FkRERzcDBoWWxr?=
 =?utf-8?B?VVZlcE1HS08yZHpHMTZwQWJyRTlaVWp0dlY1bitUUW5Qb09MZTRWRnJ1RnF0?=
 =?utf-8?B?QnpOSzkxYUhyZ0ZudmVFbEorcktRdmRyNGhWekhXYVVqYzZhNzBTbEwxVi9a?=
 =?utf-8?B?TzVEZEdyTTk0QjJVbEI1ZEZkWEVTSXNnemVWREo0UnBaanp5WjhKbFlDV1NN?=
 =?utf-8?B?dndWQVFBMXlDQ3Z0NDdyczlmVENEb2JXSlZQSTJHZHNBaG1MbWNkT0cxVGlh?=
 =?utf-8?B?eS9vQ3NVRnd2b0ZsQno5dXllR1hLWDFVR0wzTzlQMVRWS3VGMnFiNCtmZnBm?=
 =?utf-8?B?cFgrb24rVHRNUUJ4bURzbEF4dDRTTHl3Q1MyNTYxTkdVZ0tFcENWeFRBaUd3?=
 =?utf-8?B?QW9vUnkrSnZCWW9peGN0M2RGZjVmdDAzRTM5dndkNEJEV2FWalJEaVB5TTRl?=
 =?utf-8?B?VmwrOGcxSWZjbTMzK1hXWFQyb2lCTXcwck9PbUVvQjU4N2grNW92YzlZMi9s?=
 =?utf-8?B?TzBKU2tCUFFhSDlsdWFrNGtwNVIvRDZ0RW9CM2ZPSmRNRm1wVktpd1FvN0ht?=
 =?utf-8?Q?+ruXRi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR05MB8132.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700021); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTh0MmNjNHBFSXZFWTdiSEozSzZMUUptdkxXMmJRMWplRjhCRFFJRDJCTEFr?=
 =?utf-8?B?TloveWxvV2psNjV6a1JIZ3oxZnVTQzkvcGtRb011T0tCY0VOeEgxVHRaaUsr?=
 =?utf-8?B?OENkcS9XMFN2Ti9PSG1hb3JwNzJiQTh6S1VTeGRtVEUrY25lckYyWmFEUVJk?=
 =?utf-8?B?cHBRQUZsUFhwQVpKSGxtQVlGREdRelhqR2RnNzk5eXdkQVpqZWc1THViTWdT?=
 =?utf-8?B?Z2QzVFQrWndVS01PQkVLRUt0aFV1RjQzK2wyRmpPQ29YSHZpY1Y3dHZ5NVlI?=
 =?utf-8?B?ZHFSbE43T2FYeGtJMHdORWJ5OFI5OE0vclpxWXF5cWgySXgyM3lxazZWbUFu?=
 =?utf-8?B?c1NUZERkU1ZsQ2dMZFpMd054a1ZHekZ3a1ZCWEMzUndSUXpLR0lab2xRSmhr?=
 =?utf-8?B?ZXh2RWpWbUt6WmJYQTc3THhKa3IxMHQ0d1BsYXVQU3lPSEJYWjhlcTEzcXNi?=
 =?utf-8?B?OWxrb0lnNFNaTDJpLzljSzhmTlFLWTJKSDB2cDk2cmpPcXhIRWNkbWpENERo?=
 =?utf-8?B?eHhGcTViYkx0VEkzT1NncXRta1ZEYXA0dHFmN0pJTDBtaGh6L3drMFpjN3RJ?=
 =?utf-8?B?dXBoZVlsY2pXTnhrc2tFUnh6YjFwRHZoY1JpdEhBaDM1dFBhcUxzWmNueUJm?=
 =?utf-8?B?ZVI2ZkVSOEdRc3B6dEFiYW1iMEV6Qncrc0xyNm1wcWYxc1NSc091aFZmanZC?=
 =?utf-8?B?RjEvMXh3NUc0MGtBZ09TUDIvTTQxa0tMRjNtTGxvbCtRY0padjUxelZyWWVu?=
 =?utf-8?B?MXBaTE9FMSsxR3FOdkN1aXR0cmNsL1lUZUtSck0yUENqaTRuTk8rWmFhZ2JF?=
 =?utf-8?B?TlFLVTl3Z2NhbEVsVDA0WUg0c1FoMFhCb1NwcVY3S0RKYlROemlIV3F3M3pL?=
 =?utf-8?B?dVdnZFJCTG4vVmVBTjRxeGNobXo4VEFmZnRNM3M4ZEhOeDVtdGhJeWhaQUJV?=
 =?utf-8?B?Y1NsTlcvbUVWVDdBamwyZHpnWWdhb3FoL2tLeGJzSUUwa1FXWlRIUW0yRHhD?=
 =?utf-8?B?MFh4dmN0ZktpN3NUNVdXOWNPZS85TDdEVXB5anc2SGxIVy9mbzd3aW5vQ1B4?=
 =?utf-8?B?QjNXUnkwSHgvaUF3R1AvaGtIaXNLV0xZVkZuNFJGd0lvZHQ4c1hrVWVxemdD?=
 =?utf-8?B?ZG1HdHM5aG13bUxZc0N5YkkrUC9QYlhLWmpLaXZMNWF1ajVpenFrL2ZqeXBM?=
 =?utf-8?B?TWRHaTFiMXlCbTJRdjZoYm9HMDZkMG1LRTdPRVRoTDdDTHZjbFhDeGZSMGZ1?=
 =?utf-8?B?WU12Slc0WlpmR2krWXlKQmVGNis0UVR2L0lZTmw2K0c2MDBMYm4rbkFBM1Fm?=
 =?utf-8?B?Y1BWN1FxQWd4VTgyYlNTMWdSa1M1K3pWdVJaMjlVb2VWUjNMQ24yWFNxLzR5?=
 =?utf-8?B?enhYenFmUUxLOUtDeXE3dlkrOFZZbU00cG95ZVVBRW80RW5JeStGaXJyeXRW?=
 =?utf-8?B?ZVp3Q2N3Q3gwL3pPM1BHOHN6WEdNQ25jRU9FT0xHckJXY0w2akVnQjNFTS9j?=
 =?utf-8?B?WXRIS0FUSktGRXJTajR6R2FFR0IveTM3MVI0WjQrVWIwZUJjc04xcTVKK3I2?=
 =?utf-8?B?cHlNaVQvWGVSMUkrdUpsNDlDKzNBaCtueU40TnBmdWk4blhObEFHeGd0UlJk?=
 =?utf-8?B?bWtYMUErTXNYNFczaDFmaXZRMlVHakFVR1ZFLy9mL3c5cE9MeEhhd3BWTkxN?=
 =?utf-8?B?cTVnd0tac3k2SFJzZ3FIK1N1WFJ4NXZFQ0wwbW1sZjlWS3l1emxvY2E0ZG5s?=
 =?utf-8?B?TU9Ja28vNjNDRHFKRGJxN0FFR04vMllpYUEzMXR4NWhRZHhuSGpZVTdUNHhx?=
 =?utf-8?B?YXNCOWlPUHpER3VlcUdqZ09EdVpnNTVESkxWTkVqNHFpSUlGTlJKZzg4OXZE?=
 =?utf-8?B?a0VqeWJCWGVQNk9nUi9NNlFzZnNlRTAxaGsxa0pTMWJjNXpWM3VvQ2p6OFJE?=
 =?utf-8?B?Q0Y2VEtScGRWUDI4OWhPY21NMUNtWjZFdzd5eWtFWnZjUnVNLzRXMGJydCts?=
 =?utf-8?B?a3pVdEZUbFgyaGp2QlBqSW5PcnQ2V2MxcnU5NTBCMHFPNVV0dnd3SXNpdjND?=
 =?utf-8?B?WFdQQXVQalErM1Y2YnN5MHdPUHJVWGNHbHBkUFhydkpPQ245WWFzSDNBcTRx?=
 =?utf-8?B?OGRzZjFITVA5dGJXV0pMYk1KZ2FYRzU0T0c2NjVXcE4rY0F1MldWbHl1WnpO?=
 =?utf-8?Q?apAPnzygWQlcQrIMIgQmPas=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7040DAA23071D0459C02A1667742C8E7@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: novatron.fi
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR05MB8132.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21090739-8388-4201-a5b3-08de2b634048
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 14:10:41.3206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cff2eb45-c7eb-419d-84a9-6e3ad5232df4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ImE5eSbHrxEYDqnjvDBN2osNTUfDBH00YaxSkXJORxiD12OaAtsyIp/Xv2Kr3/pPvW91+7+y6F8ooTi8NjQdtDFcOIiNkAIKuCffiFPuzWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR05MB7046
X-Mailman-Approved-At: Tue, 25 Nov 2025 08:03:45 +0000
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

DQpIZWxsbyBUaG9tYXMgYW5kIEtyenlzenRvZiwgDQoNClRoYW5rcyBmb3IgdGhlIGNvbW1lbnRz
LiBJIGhhdmUgZml4ZWQgbW9zdCBvZiB0aGVtLCBidXQgSSBkaXNhZ3JlZQ0KYWJvdXQgcmVtb3Zp
bmcgdGhlIGVycm9yIG1lc3NhZ2VzLiBJIHRoaW5rIHRoYXQgdGhvc2Ugd291bGQgYmUgbmVlZGVk
Lg0KV2l0aG91dCB0aG9zZSB0aGUga2VybmVsIGRvZXMgbm90IHNlZW0gdG8gcHJpbnQgYW55IGVy
cm9ycyB0byB0aGUgbG9ncw0KaWYgdGhlIG9wZXJhdGlvbiBmYWlscy4gSXQgd291bGQgYmUgdGhl
biB0aGUgcmVzcG9uc2libGUgb2YgdGhlIGNhbGxpbmcNCnVzZXIgc3BhY2UgcHJvZ3JhbSB0byBw
cmludCB0aGUgZXJyb3IgdG8gdGhlIGxvZy4gQnV0IHRoYXQgYWxzbyBjb3VsZA0KYmUgbWlzc2lu
ZyBkdWUgdG8gdGhlIGJ1ZyBvciBiYWQgZGVzaWduLiBUaGlzIGlzIHRhcmdldGVkIHRvIGJlIHJ1
bm5pbmcNCmluIHRoZSBlbWJlZGRlZCBkZXZpY2UgdGhhdCBpcyBwb3NzaWJseSB1c2VkIGluIHBs
YWNlcyB3aXRob3V0IGludGVybmV0DQpjb3ZlcmFnZS4gSWYgdGhlIHVzZXIgaXMgaW4gc3VjaCBj
YXNlIGNhbGxpbmcgdG8gdGhlIHN1cHBvcnQgYW5kDQpjb21wbGFpbnMgdGhhdCBiYWNrbGlnaHQg
Y29udHJvbCBpcyBub3Qgd29ya2luZywgdGhlIG9ubHkgd2F5IHRvIGdldA0KZnVydGhlciBpbmZv
cm1hdGlvbiBhcmUgdGhlIGxvZ3MgdGhhdCB0aGUgZGV2aWNlIHdpbGwgc2VuZCB0byB0aGUgY2xv
dWQNCndoZW4gaXQgaGFwcGVucyB0byBiZSBpbiB0aGUgY292ZXJhZ2Ugb2YgdGhlIG5ldHdvcmsu
IFdoZW4gdGhlIGxvZyBpcw0KdGhlIG9ubHkgc291cmNlIG9mIGluZm9ybWF0aW9uLCBpdCB3b3Vs
ZCBiZSByZWFsbHkgbmljZSB0byBiZSBhYmxlIHRvDQpyZWFkIGNsZWFyIGVycm9yIG1lc3NhZ2Vz
IGlmIHRoZSBvcmF0aW9uIGhhcyBiZWVuIGZhaWxlZCBpbiB0aGUgZHJpdmVyLg0KPiANCg0KPiAr
CWJsX2RhdGEtPmN1cnJlbnRfYnJpZ2h0bmVzcyA9IHJlcGx5X2J1ZlswXSAmDQpCTFRfUFdNX0RV
VFlfTUFTSzsNCj4gKw0KPiArCS8qIFZlcmlmeSB0aGUgc2V0dGluZyB3YXMgYXBwbGllZCBjb3Jy
ZWN0bHkgKi8NCj4gKwlpZiAoYmxfZGF0YS0+Y3VycmVudF9icmlnaHRuZXNzICE9IGJyaWdodG5l
c3MpIHsNCj4gKwkJZGV2X2VycihibF9kYXRhLT5kZXYsDQo+ICsJCQkiQnJpZ2h0bmVzcyBzZXR0
aW5nIHZlcmlmaWNhdGlvbiBmYWlsZWRcbiIpOw0KPiArCQlyZXR1cm4gLUVJTzsNCj4gKwl9DQo+
IA0KPiBEbyB3ZSByZWFsbHkgbmVlZCB0byBjaGVjayB0aGUgYnJpZ2h0bmVzcyByZXR1cm5lZCBi
eSB0aGUgYm9hcmQNCj4gY29udHJvbGxlcj8gSGF2ZSB5b3UgZXZlciBydW4gaW50byBhIHNpdHVh
dGlvbiB3aGVyZSBjYmdjX2NvbW1hbmQNCj4gY29tcGxldGVkIHdpdGhvdXQgZXJyb3JzLCBidXQg
dGhlIGJyaWdodG5lc3MgbGV2ZWwgZGlkbuKAmXQgbWF0Y2ggd2hhdA0KPiB5b3UNCj4gZXhwZWN0
ZWQ/IE1heWJlIHdlIGNvdWxkIGFzc3VtZSB0aGF0IGlmIHRoZSBjYmdjX2NvbW1hbmQgcmV0dXJu
ZWQNCj4gc3VjY2Vzc2Z1bGx5IHRoZSBicmlnaHRuZXNzIHZhbHVlIGlzIGNvcnJlY3Q/DQo+IA0K
PiBJJ20gbm90IGFnYWluc3QgY2hlY2tpbmcgdGhlIGJhY2tsaWdodCB2YWx1ZS4gSSBsb29rZWQg
YXQgQ29uZ2F0ZWMncw0KPiBpbXBsZW1lbnRhdGlvbiBhbmQgdGhleSBhbHNvIGNoZWNrIGl0Lg0K
PiANCg0KWW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0LiBJdCBpcyBleHRyZW1lbHkgdW5saWtlbHkg
dGhhdCB0aGUgYnJpZ2h0bmVzcw0KbGV2ZWwgd291bGRuJ3QgbWF0Y2ggdG8gd2hhdCBpcyBleHBl
Y3RlZC4gQSBidWcgaW4gdGhlIENvbmdhdGVjJ3MNCmZpcm13YXJlIGNvdWxkIGJlIG9uZSBwb3Nz
aWJpbGl0eS4gQnV0IHRoZW4gdGhhdCBleHRyZW1lbHkgdW5saWtlbHkNCnNpdHVhdGlvbiB3aWxs
IGhhcHBlbiwgSSBkZWZpbml0ZWx5IHdvdWxkIGxpa2UgdG8gc2VlIGl0IGluIHRoZSBsb2cuDQoN
Cg0KQmVzdCBSZWdhcmRzLCANClBldHJpDQo=
