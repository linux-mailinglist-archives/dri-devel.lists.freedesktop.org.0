Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A917996811A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 09:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203FE10E22F;
	Mon,  2 Sep 2024 07:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="L8mA25SO";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="ZAeifgqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEE110E22F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 07:57:41 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4826raTT005632;
 Mon, 2 Sep 2024 08:57:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=2pqms2fbX+kGRFbeAT/+tsV8QBZcjRHCEdfUzPKSASw=; b=L8m
 A25SOkEipo0XBlO0lDktac6PJDy9yzzb+hweXDtxG1Cw3vOn+WuMiiw9XxUPuhfa
 FCTR3NheqB9NqmbGmseCWZDtnOXcg8kjkdhht1uhHUv+V8rg/WhSA+nD973I/NkT
 L6nor+N61BAQuFHvGarfpuWRmW+Cg4DDo2AEkA66hB4rjscDdp2RJ4o0s1/bkoI0
 l0fF5qB2Wb/wfRw9Ww6xWpsEqOx3EutGXdFuOR/dyxyq5DG7OlGLEaRbQdgoLWaw
 GGG2SOFvT7KBsio9OARiM9FVzdGSRhfaQWfCcoRDcp5gETtAVrTaAQJougg3/ttn
 pRgF8Om+BULmylGRd0g==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 41bses9b2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 02 Sep 2024 08:57:26 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 2 Sep 2024 08:57:25 +0100
Received: from LO3P265CU004.outbound.protection.outlook.com (40.93.67.2) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Mon, 2 Sep 2024 08:57:25 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvhzwcuzJU53InqwL2gNvgjukgY2gfLHq7Lh0jfC1CFLCx2pXu/pCpUxLBc4Y+6LzPaJFX4LQOFYbd6Wspj30/kOHTjdnnL3pHy3TChAW/qHA6bc1a/HLnjGGUKQbBuSDBrpTbEcuoLikloWDNjd/ks8Es/ka3PVTutj2mFIUxv9WFaW7IhN87gnmwPfkY0m91P7LJMmLQSh2YF8tnMx/AJlNFhwGg7ods8uHHbHHoWYXzuVs5q7LgORCOP8o0w7fie02Ax6soNGhTT75bTUgz+g+YL3OWFocmI/Jzj3K1ogT6++Ts2qeBRP6lDWJtnFyr84N/mMtq9gKEsK1/Mv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pqms2fbX+kGRFbeAT/+tsV8QBZcjRHCEdfUzPKSASw=;
 b=AGAtiat1NX9spmSVWs+FujRiR6Vk5/D+mWfgcqydt2S4nmVvgt6Nk5CsYNu9g2IxqA7xRx9LOxdDxgvLf1z9C4/CMryJT4nkco+JS+rCbD3Hg+59ZRlsoZ7I0fQyubXE4dnuMy5vFsPi/yYjNKQccseKvu2eBfryA3nr8D5WFYfxMrQXzEUQFtoGgDG1TL/fFN6cFv+vEwuxIXdLZwj42e0lNuM8bU5yvRGzx6QxwvDEdDDq8NpJx+jvDAMxiG1yWQzTORUICuGz+cSNkiOuWqCalfiKJ4Q48n87ey73HNiCmXgQDo+f28LE0p1X76eUt1tsEqp1p4rubwi7XllXkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pqms2fbX+kGRFbeAT/+tsV8QBZcjRHCEdfUzPKSASw=;
 b=ZAeifgqCpxvCSoF42zfQvkio2fu4mut+6B7RQTbfnnKA+vZw5zyWTZB8A80j4kfAWECdk72ebZLMJJzfXOFPTO1P+b4nBdQrsO5lnKi1bV09JyTrUIEKdYoScIMjEehWfU6GpW0nO9Qu6Uaxwu1hdt8fnl769MoRXe4jYw9fo8g=
Received: from LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:29b::5)
 by CWLP265MB6468.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 07:57:23 +0000
Received: from LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM
 ([fe80::53a5:42df:8e94:653]) by LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM
 ([fe80::53a5:42df:8e94:653%5]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 07:57:23 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, Matt Coster
 <Matt.Coster@imgtec.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>
Subject: Re: [PATCH RESEND] drm/imagination: Free pvr_vm_gpuva after unlink
Thread-Topic: [PATCH RESEND] drm/imagination: Free pvr_vm_gpuva after unlink
Thread-Index: AQHa+u5Ox2Pt8HYwPkCEor3G0lnR77JEJZiA
Date: Mon, 2 Sep 2024 07:57:23 +0000
Message-ID: <55dfb0fe2a3996226e814b6f42014dba76cfa3e1.camel@imgtec.com>
References: <9f26a943-1573-43a6-a919-d6425d9df34e@imgtec.com>
 <35867394-d8ce-4698-a8fd-919a018f1583@imgtec.com>
In-Reply-To: <35867394-d8ce-4698-a8fd-919a018f1583@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO4P265MB6026:EE_|CWLP265MB6468:EE_
x-ms-office365-filtering-correlation-id: e8e4fbf7-b470-472b-1c91-08dccb24e13d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZHpqV0tUY2FIUHBkMFh5dHBKM0pJY1oxdGdvSnh4dTZpdnJ2aHAxRFFHVExN?=
 =?utf-8?B?YjM1M1RDOStXMnFlWmgrNnlISCtXYmQyTjd1dXExUjhrVjVGaFJ6NXZKRUZK?=
 =?utf-8?B?NEU4dFY3a1pGS2cwSGVDUkVIR05yY1dvUTVVZDQ3dTRBMHowVlhKZ0EwQmdl?=
 =?utf-8?B?SitTWEJZTHE4aWpBRzVRNkxKcjhaWmc2OFVxQkdGWVhkSVlFcGl4ZGtRUEZI?=
 =?utf-8?B?SnhEUFRPNkpmTU5BNGRnQi9HT1QwTE8vZTljWUN6aUFURFE1cnhNWCtZTnd5?=
 =?utf-8?B?UXlYbitGb24wWCs0b2hwZ2VZNVNOYVBVRnJncDBUZncyWmNWSjVSVVJEKzk2?=
 =?utf-8?B?c1BlTWgrSkVWRU54V3ErMzQ3RWRhOC8wZU5oWTBsb01GSkt1RFc0K3BKMEF3?=
 =?utf-8?B?UWkzS2kzVFNuZVFnNFhwY0RoalRZOVdGb1pGVmlZZUdWRUZZdDJyc1dvQXdr?=
 =?utf-8?B?V3hUUXVJUjBMMjZBckRRK3p2NlBkZm9TVHRrelZkSFlueXBkck53VWN2Q21o?=
 =?utf-8?B?Y3RTajRpeWhyRDhzaUtSelJ2YlJYL21iaDg5WXRNTEZGV1ZqbzFVNHVTSWRm?=
 =?utf-8?B?TC9kWHFrY0hrZmtsR2pjUW5xdEJuMHBlajFDTGcra0JqMklrekl2d1ZMWmJ0?=
 =?utf-8?B?RVNqd0tXVXptcDh2MWE2aTMvVnMwMm51b3hmZzhBZTlMUlU1dG51eGJsWTh4?=
 =?utf-8?B?YnU5TEtaZjN4UmpIWDIwV045YzJaM0kyN1cvN2ZoUzd1ZDQ4MnNVUGgzS013?=
 =?utf-8?B?ZVhrZ2c0RU5YbVlCWmlvMjV5TlhFSlFFNnVsT294QXJKcjY0T09QNXh3OVMv?=
 =?utf-8?B?S3VKVzlOZ0pVOHRoV3JNaHpVU01wL1FvdjByckxpRDcyYzZPOFpYWDA4TlVC?=
 =?utf-8?B?QzBVTHd5NUwxNE9NSm01UW0xVVNkQmJtTDJQSjFMMUVrQWFtUlo2WjRuekNj?=
 =?utf-8?B?NStkMmZtQXU4Tno0blJvbi9RYWhvVnFLRVhuT3VOK3gvNlFMbXBLTEszYnpP?=
 =?utf-8?B?RVUzVHdWdS9KUCtHYjdvUUtuTGtKNjRVRlFhSGsxNGpEdklBM2FiV2RuVnRr?=
 =?utf-8?B?ZENnWXlpWk0rNXFrUUc1M1FLYWg5b1lkZWtrcU84L3d3MjZYTklmK3dnTjdP?=
 =?utf-8?B?eDdCdDkxVEg5RjN3dXpzZU5jWjM2eUI5UGQyalhVcmp4NzJIR0kzNFVCS2I5?=
 =?utf-8?B?eDFpVGsweWZKbDJXRkMzZDNIbVgyaHcrVytQZzMvYWhUaExHTnA0azBVVURk?=
 =?utf-8?B?cUVTUUxrRHUrVThVSnQvdnJad2VDQkdQbkFLRUZaSEcxUkVnc0luM2loMkkx?=
 =?utf-8?B?WUdoTFl2Mm05STBMNDN1SlJsMFdzYnI5S0s1Q0V5MU1EUGxhMSsrd2hEcGdv?=
 =?utf-8?B?c094Z0IwOXlGSmpqSnhGekhrS0J6eWtnZHpaK0t5R09SRE5zV1c0dUt0emNL?=
 =?utf-8?B?ZGp3YlByRm9HeUFHaVF2WGlSbTk2bHF0dDllRndyODdJVGVnMDl2SFhrYWI3?=
 =?utf-8?B?Tk9QWGkrOHlvUnorOUFvKzhQaFE1bXQwVXFZaGxDR3JaQ1NmUCs2djdkcjJQ?=
 =?utf-8?B?d1lST0xETGFrNTg4RTRDNEdUYnhmMVVTQ1Z4NFljNzVoUXFrb2VnS3JBN29v?=
 =?utf-8?B?b3BKTXhHN3hQUDBwNnVCT3lnNk12YnJhOWIvRThha3l6ZDIzN1NDcDhDWUxr?=
 =?utf-8?B?YVNWQ3dKQzFEaE9mM0tqeHg0bFhieDJpRmJ4RFJQQVB6MTFzWEpiaEpSdFdr?=
 =?utf-8?B?b0pFejYwRDlMdS9ZSnBTK1pYSUx2dnhuVnNHNnM5M1pQR0ZZNElrSEJZQkJr?=
 =?utf-8?B?dy9GV25ld3ltNjc0WjJBYzBCWktEN3UzbkV2Mi8zYlFvMjNESThrMVY3NTF3?=
 =?utf-8?B?V0M3dmcyeTR6akljSE5BYjZyekM4c2lKQjl2NE1JV0RyTVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGkrWWlnVlBPSXhKMmp0czU2VFBhbGtPbk1VRW1ndGFrcVlEWXFrUXFFMUli?=
 =?utf-8?B?eTN3Y1hGNTNVOGQ2bDNBTUFNakdBc3FjQ2ZySkpSREZZMVJzalczWUlpcUth?=
 =?utf-8?B?Um1XV0pvbkJSLysrRHVaOG1qamlITUl1L29NblNGenQwUmtZeXVack9Kakpa?=
 =?utf-8?B?OWFmMHlUaU16MVJVdDlXanBsdjhZWWRobGFGSWY3UjZpditmdi80QitCNDNV?=
 =?utf-8?B?QzdNSTFCVDRyNUltaWxML2ovcHZZSlBtdSt2bEk4UEtLVzdJRFRTY1FhV2da?=
 =?utf-8?B?clVCeXE1eS9OSVd4eDRsSlhxOGdONjFocWZvNzc1WHZYa0kvb3A0c1FUYWdu?=
 =?utf-8?B?bHRYUEZsd3J2K2J5aVRPUUozZTc2MXVFOXUyRytTT0JqZnM4ZmxYSCtCQVJl?=
 =?utf-8?B?V3BoOHhjQzRuZzFlT3FpVUtvQ2s3TVFXRFFkNUF6cFM4NERVWHRHMDkzYjln?=
 =?utf-8?B?SE45UmIzU3N5SGpoMmdxNVdIK2FVR3VSWHFuWEpkV2h1cFVjSm15b3NpSDdt?=
 =?utf-8?B?VzZ4WjY2V3Evd295d2hnV3BmZ0oyanZZTE00L0EzcVFDaUNQSTF2cVE4OHFw?=
 =?utf-8?B?b2lUTVNBVnhiUFA0a3JFeCszY0VTRmhKd214bzhRdzNZYU85VjJISHBiWHBI?=
 =?utf-8?B?U1FXdkN4SDBZaHk1V25QTjRRODhHblhmWkJSaXh2Z2FtRERBRHlPK1htVHg1?=
 =?utf-8?B?K3kreDRkaTRydEtRQkwwOVFXaUZKd2NVTWhlQkQ0ek5ZOUlXU1lNM2s0SXd5?=
 =?utf-8?B?SDkwYzc2TkEvSkJHa1VFbG1uTm9xS0RtRHBqUThIbDJPOHQvV0VEOFBnZlU3?=
 =?utf-8?B?VGlGSjBSd0RDU1VsN01Ya05MeWhzbURjUUNFMDBmL0JtSnM0QjdiSkN0Ri9J?=
 =?utf-8?B?MjZyUnF6KzFxdlhSYkhGSDNndjROZnJyRGU3WldvS1ZOaG5obmZrb3FlZjBn?=
 =?utf-8?B?TUZRcXRWbGduaGluNVFaemY3K3Q3ZTV1RmxlTXgxK1lTamgveHNNS0ZWQkNi?=
 =?utf-8?B?NkExL25CeFZVdlpubnYzUUIrNWpGNE5tL1BPbFRxK2dtSmRnT2JiNHp0UEhQ?=
 =?utf-8?B?RGhZUFI3UnE3NnpueVNZdUhubS92MnV4Skpha05NaGNZdWljUHQ2Nk5La21a?=
 =?utf-8?B?ZGJWL0x3LzlldU9yZC9Ld1loVm05T2VLcFNHYTI3alFzeUJDZ1hzRms2MllN?=
 =?utf-8?B?UHB3cnZXWDNqTURaK0pSdmNLS1orMnc2dzBnT0o4c0JYQUFjMzdyQXRQV3FD?=
 =?utf-8?B?R0V6OWRyYXFtUStCWDM0c29XbnJkNm9NSzZlU20zYWk5TlhZeUdXU0tGN25Q?=
 =?utf-8?B?clRhN3JZc0JOOGk5ZnZqQ3U1cDB4UmxxbE5QSklUalFMNG0wWjB4UTlOQ0Uy?=
 =?utf-8?B?TElRTjNRQVNMNFdaNkp1czdNS1pabGJkMGxuNnFUY1h2YWN0NFZtL3poWlJK?=
 =?utf-8?B?eklHRkdFWU9ldjJCdmowdzVhbDl6MFZKOTR2dGhqT3ZKdGw3VzJtaTZ1Q0U1?=
 =?utf-8?B?VHpCbUJab0V3czJmZEUvVlVGUWdnSlIwcjdOUmVZcHNNaGhManRMMk94cklE?=
 =?utf-8?B?MjluNm91Z2QvTXVYd3h5Q1JvYjl5NHYzMVRxR0JwTjNSdndlMVozZGo2T0p3?=
 =?utf-8?B?YXQzc21RZjFJUjR3ZDl1Y2hvT3lxcnpiakE1OGtxMHFySHQrYWx3bVg5TUY5?=
 =?utf-8?B?Z0dvUVlua3lJNk5UL0ozbTF5K3ZnMHMvRXNlT2w5L1lKL243MUNOYXJ5d1U4?=
 =?utf-8?B?ZUU3NXhOVmlmOEtJZWhQc3pWbzU0c3JTL1Y2UzRSSVM4QncyZzJXMDFNNjlI?=
 =?utf-8?B?LzY4Nk9HLzRhbDdicHdQOG4yVkRSWit4T3RYbXBNQTAwb3RtajYxelpicHlJ?=
 =?utf-8?B?T1B2SGowRUVzTUp6a0ptZ0EyUm1JQXpBVTY1aHJPMGJQS3RFOE1yN1hqNkZM?=
 =?utf-8?B?dC9ON25tSWlxc3I0VTdBaGlhMmlReW1EMGpubk0vR3dIVkZQZEsrRnFFNkRz?=
 =?utf-8?B?SjRzeWJjc3VROEFCNE9XbmJwRjFlOWFyUTNKbHhEc2p1Wkd1dmVuckk4MjQv?=
 =?utf-8?B?ckczdjdXOW45SFBVOHNPRURPVDBQQnVtMmtvZmJvRnBTa0tOTlQwRzdhc01T?=
 =?utf-8?B?SHB4M0Nqcy9ZQ2NHc0JrR2NWRlpLYWlsSUpEQllIUS9VZDN4b3RlL2FiT3Vt?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E35702AE8FB81843A194295A19344741@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e4fbf7-b470-472b-1c91-08dccb24e13d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 07:57:23.7677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hhVwPKdg2OcKcV5vrEMP+uDZBrGFyGQ6ApNpX+k8vROOELJz3q4NtHItCa8xq66DfhbIeZcCdLLD6dElgQbK5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6468
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=aKOiqq9m c=1 sm=1 tr=0 ts=66d56fe6 cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=EaEq8P2WXUwA:10 a=WnR_qW7rlZcA:10
 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8 a=ZVGCpLSUIl_JNhKovNUA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: PDYJ_5iFkmnlzSsCb5Uhb-Kbzp-eN3vg
X-Proofpoint-ORIG-GUID: PDYJ_5iFkmnlzSsCb5Uhb-Kbzp-eN3vg
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

T24gRnJpLCAyMDI0LTA4LTMwIGF0IDE1OjA3ICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
VGhpcyBjYXVzZWQgYSBtZWFzdXJhYmxlIG1lbW9yeSBsZWFrLiBBbHRob3VnaCB0aGUgaW5kaXZp
ZHVhbA0KPiBhbGxvY2F0aW9ucyBhcmUgc21hbGwsIHRoZSBsZWFrcyBvY2N1cnMgaW4gYSBoaWdo
LXVzYWdlIGNvZGVwYXRoDQo+IChyZW1hcHBpbmcgb3IgdW5tYXBwaW5nIGRldmljZSBtZW1vcnkp
IHNvIHRoZXkgYWRkIHVwIHF1aWNrbHkuDQo+IA0KDQpSZXZpZXdlZC1ieTogRnJhbmsgQmlubnMg
PGZyYW5rLmJpbm5zQGltZ3RlYy5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogTWF0dCBDb3N0ZXIg
PG1hdHQuY29zdGVyQGltZ3RlYy5jb20+DQo+IEZpeGVzOiBmZjVmNjQzZGUwYmYgKCJkcm0vaW1h
Z2luYXRpb246IEFkZCBHRU0gYW5kIFZNIHJlbGF0ZWQgY29kZSIpDQo+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92
bS5jIHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jDQo+IGluZGV4IGU1OTUxN2JhMDM5ZS4uOTdj
MGY3NzJlZDY1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZy
X3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jDQo+IEBA
IC0xMTQsNiArMTE0LDggQEAgc3RydWN0IHB2cl92bV9ncHV2YSB7DQo+ICAJc3RydWN0IGRybV9n
cHV2YSBiYXNlOw0KPiAgfTsNCj4gIA0KPiArI2RlZmluZSB0b19wdnJfdm1fZ3B1dmEodmEpIGNv
bnRhaW5lcl9vZl9jb25zdCh2YSwgc3RydWN0IHB2cl92bV9ncHV2YSwgYmFzZSkNCj4gKw0KPiAg
ZW51bSBwdnJfdm1fYmluZF90eXBlIHsNCj4gIAlQVlJfVk1fQklORF9UWVBFX01BUCwNCj4gIAlQ
VlJfVk1fQklORF9UWVBFX1VOTUFQLA0KPiBAQCAtMzg2LDYgKzM4OCw3IEBAIHB2cl92bV9ncHV2
YV91bm1hcChzdHJ1Y3QgZHJtX2dwdXZhX29wICpvcCwgdm9pZCAqb3BfY3R4KQ0KPiAgDQo+ICAJ
ZHJtX2dwdXZhX3VubWFwKCZvcC0+dW5tYXApOw0KPiAgCWRybV9ncHV2YV91bmxpbmsob3AtPnVu
bWFwLnZhKTsNCj4gKwlrZnJlZSh0b19wdnJfdm1fZ3B1dmEob3AtPnVubWFwLnZhKSk7DQo+ICAN
Cj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gQEAgLTQzMyw2ICs0MzYsNyBAQCBwdnJfdm1fZ3B1dmFf
cmVtYXAoc3RydWN0IGRybV9ncHV2YV9vcCAqb3AsIHZvaWQgKm9wX2N0eCkNCj4gIAl9DQo+ICAN
Cj4gIAlkcm1fZ3B1dmFfdW5saW5rKG9wLT5yZW1hcC51bm1hcC0+dmEpOw0KPiArCWtmcmVlKHRv
X3B2cl92bV9ncHV2YShvcC0+cmVtYXAudW5tYXAtPnZhKSk7DQo+ICANCj4gIAlyZXR1cm4gMDsN
Cj4gIH0NCg==
