Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D52DA5BDE2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 11:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF69310E12A;
	Tue, 11 Mar 2025 10:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="PXrlBUYn";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="BG3bPJZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A24810E12A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 10:28:21 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B6uBJx011093;
 Tue, 11 Mar 2025 10:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=7S5YU77nKVhA+PBC3tz35zpLB
 kg9h0l7bIXZdYipCpk=; b=PXrlBUYnk1NSpt02mevxgBHH3TGzTMlzgwA9wLH27
 ZDKhfKIrupsSZx7arnWuEsSpJEojD6KyzL+FoBnj/pWviFHyhXsmEEz7lL5nZMcP
 JfLdH9sZvMnDcCsz3vzufp9LgcMIwJihDrotG0eWVAJdiMzARz4TE9JwAF9xNfdy
 VSkOmFEMIp4vOBkpV+nrZsdu7Fofd8X4fam76XVNaSXAil0C6YUo00ljo9chHiFp
 Jl3SvivDdUU7VbecEme3yUYngmOmAkYXWmqShrFqhLl2uNIuAT8rCKJGcWTzgbpz
 oIfyHE64bgx6XcKyt3U/+UPmMf2OrTyMRJ+jz+RkD9Acg==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011030.outbound.protection.outlook.com [40.93.67.30])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45a224rhga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Mar 2025 10:28:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQ/4/dNBZW70OYJBh2TBhpm+O4/RTuf3BPEJx24OQgi6038JMi+ncdHWgVvUvOmvA1U6YFLUdKLwkC+Ew5zdvWuzZK/vd8M71u/5WaQSV/kU7ZWXBMt12TnVU2Xfm/6rljUiCHt+dCIVYy1I8570RN9vzFexAcmAtM/MoyFrmRrJbo4rNdl7RLi1vrNk45RYhJHt0rfJQyn552yPAYuHMSbHofHVhhDtqHr6YPy/xOoKHvo4lVcVuQgw+sRWIO9dDQ4dlNNFcA/Px0coAKL6WBDp/IXhmOIQHIMyBUmvrN9i22FYXyjM6C+jYXyjh4twsRJz8r0W58WILEviRer1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7S5YU77nKVhA+PBC3tz35zpLBkg9h0l7bIXZdYipCpk=;
 b=lM60ihNykoalXnG3CzVhay74KOUkiDRTIHHpS8SXmpP/Ptq2LWWRuNMo7hW1jgrJMVO9fQc9MV4LAYI5iLrU019AfMFFxxUVLzlozpwMMH1EGYf9DC1TTFQXnjLNgx6RXjHHzQrP9uiOK/7Jlrf0/x8rr7sF/qzDbzxAzK7eACr6+WkBa2G5E5Y2O06N47vWF8s01Kk3rSIzzxiADYywS9oU/++2p/mymNEnJ4vav6eeYnnt6hXCuxGYGcwkUfoUhJLLrA91QekWjrkRD3IN+2Ul4wri9TPJCNu1yR7t6mtaALlSdROl1lO+YssAdL9O1BxfRuGTa0NBHKRtOtMf6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7S5YU77nKVhA+PBC3tz35zpLBkg9h0l7bIXZdYipCpk=;
 b=BG3bPJZwRvP1VRiogg9UIR3mfBj6vPnS2Pa9xt1+38Ndue1D7Wuc57sZqDAycE7gjuszt+baijL+P9nv4FfYHp14GEYbxQWoTrIoB+zc2dmBcOxHWFnwJbtiusffjLqFSjF3yy3eNj4T3Ir1WqSwouib/jIo3fismlQ9H6GcfMY=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB2659.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:a2::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.21; Tue, 11 Mar 2025 10:28:04 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%4]) with mapi id 15.20.8534.018; Tue, 11 Mar 2025
 10:28:04 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 Etheridge <detheridge@ti.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>
Subject: Re: [PATCH v3 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Thread-Topic: [PATCH v3 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Thread-Index: AQHbkb3WxrKi4JKYG0GQQeymxf/vB7NtkWYAgAArqIA=
Date: Tue, 11 Mar 2025 10:28:04 +0000
Message-ID: <7472842f-73d5-49ad-a93e-cd3b8b66cfa3@imgtec.com>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
 <20250310-sets-bxs-4-64-patch-v1-v3-2-143b3dbef02f@imgtec.com>
 <20250311-bizarre-debonair-macaque-451c4f@krzk-bin>
In-Reply-To: <20250311-bizarre-debonair-macaque-451c4f@krzk-bin>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB2659:EE_
x-ms-office365-filtering-correlation-id: c483a77c-dbe3-4c7b-6525-08dd6087685d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?V3c4dHVXdUVsdEpkdFRBVmwzZityYkp1cDhEajFmNGhxY2ljMWZWSGdKMmpS?=
 =?utf-8?B?czYxV1pEMU9lMFdMTVFlTEFKMFlUekV2N3VQdUM3L1h3OW54bllvUEVOd3lE?=
 =?utf-8?B?VFlEVi9kZjVqTDk4bHZ1TUdwVzExT1dmcThmRUhQVE5JVVY4SGl2dERtbmU5?=
 =?utf-8?B?S1NPQ0VCa3hRRGU5cnJ0WVdYdzRmeVorNjVreENlZUhZQUJXTkRVdG53QStW?=
 =?utf-8?B?UU42UFJ3QjZlSEppeE85RXc4SWp5bkZpR01KUWlndE9QWHRkOE9HM1NtMFVR?=
 =?utf-8?B?RHJQZ2k4YVBPanJjMWpPRnRmZU1iQnJnam1oUGkxNmF5U29uOGZabE9IYUdJ?=
 =?utf-8?B?WW9HWmlQUVV6VEhrU3d1TzhoKzdyYWxxZUJkdzhvUkkveUZwOUcxWUNBQzVV?=
 =?utf-8?B?bHYrSGZNaFZCNmV4bXNLbzFFcE5icUNxVDQ4dGViQXZYNTk3bkVXOUJhcmZ1?=
 =?utf-8?B?VSs0SGtoQllCcmdLdTg5S1R0Q2VPWllUcVBFYkE5U082ejB4WWtuck42TTFD?=
 =?utf-8?B?QlFqdVNTU1k0bkZXajh6MmhpUjMvZGJqZTFvYk54SERtOTZvc3lOajNrLy9k?=
 =?utf-8?B?OVdyNXhPKzhQT0dZSTFVK05veGIzS29ZQ2lzemZ6TGZZVCs4MXJaVnV2OFh5?=
 =?utf-8?B?cjFLV1ErN0xIOVdBOXlxN2NvMStYTTBPRHNWVEpvbHczMVNmYk45TmFrQTdn?=
 =?utf-8?B?c2QwN3ZxcC9FdXVrbkh5TVBkK1VqWEo0b3l4aFJFNkhIbkdONDlPdlQzUENJ?=
 =?utf-8?B?QXl2YkR3L1NqLzk4Qkc5ajZkcTdacTFNUTAzUC92L0RhT0NvR2crMG40SEI0?=
 =?utf-8?B?ZDNValVXdU1GUzI3SVhVSFNHUGtETEtvQzV2YWhDOVRlZHh4K084K2VwbzZ2?=
 =?utf-8?B?Mkx1WXpuTVc1Z2dFb3U2TGxLTUo2dElqa0xaYlRPcHZCaUx6N3V6NDRpRmRk?=
 =?utf-8?B?ZVQ4aTBaand4S3hBTk53Q0pJUnA5bFZHVzc0OWNBdFZ6SytKM09UZTRWMVpr?=
 =?utf-8?B?T213WHM1eThXSGV2TmhvMzMxbHBMa2RNT1FPVlh6MWhjcUQvVGZVL0xoR2Zp?=
 =?utf-8?B?MzVUK2hydVFhUUNvLy93akk3UFMwL3QvaisvR3p1SzNCT0dYb08xNnlhSjNJ?=
 =?utf-8?B?bnB6WVdtY09UUUN6SFlZZE1nVU9CL0VnRVhKdWhDOVJwanBXcXNXVEpSUGs5?=
 =?utf-8?B?WXhvOUxWckI3ZXkzL2QveHJ5TVFPd3JtTy9id3BuMnJmT0FmSVpKNHJ6QmFn?=
 =?utf-8?B?SlZUM1VjdndDWG93U2JFUzRJTjZuZnlBTm1nS2hSR3phWHBTRHl2dHJScHRy?=
 =?utf-8?B?bXBvaEhqUFNnOUxSOVJqWDczNFlGUEJWUTlodjNwRzdnTmZJNmN4RldLcllu?=
 =?utf-8?B?Q3lNWHRSeHArbk9GMFdqei9tVWNpcUw2bFZraU5vRzJlUGFCU1dCYnllY2Qx?=
 =?utf-8?B?UHEvSnorRThHMEhHcHRqck50b2VBV2wxQmJualNiaVVUemlJck9GOHJrVFZi?=
 =?utf-8?B?dUpCSC9Id2FPZlQ0SjVwRVJueFh0cFdGcEFlQ1gxeklQa3VEYXQ3N3ZxS0RS?=
 =?utf-8?B?bk53WExOMnhsRG84bVR3K2g5UFlyVHVXS0VMNzBzaGRyRXFEUkIzTk53OUZj?=
 =?utf-8?B?dmd3UlZHNzk2bVJDNjBiRHQ3Wk1FVlBNcG9zMStzdmtqUEs2STI0UGNDRmc0?=
 =?utf-8?B?UzF5aG1ieHVOaGd3bWE1V1lZU2dKaHhWbDBNQkxzWS9kcS9aK2tqUk1vOG16?=
 =?utf-8?B?RURHcXlRclpDZGFoSlZKWXZ4YnlBKzJzRUtqV0tZanhuaWNKQU1iNDZDOVcy?=
 =?utf-8?B?TFB6ZVBQT2dsMGlPR2ZQQnhzQUIvdHZjL3VzQi9XaUZqb001Y3BBUWVLdmdj?=
 =?utf-8?B?M3lOaHNRekJuVDk5bTJsdW5NT3ZrK01VdTJybDNzditta3ZDa29nVkpkVGVM?=
 =?utf-8?B?di92MkxVTWI3Z0RGdUtLbDBlSVNFNC9VbFZoMWxMTHpTZGlndXo4d1UzQ0E3?=
 =?utf-8?B?Y2ZpZHlmZU1RPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STdRcGZkU3E0bWhEdmFiUmM1cWxKV0UxRTNtZ1loVzJ6VHB3QlI2L3FPNkgz?=
 =?utf-8?B?bWNsekFVdXJXVUxEVXh5N0xrWGtIaGZSNyt0bWFKRWhFQ01GQ3JJTnMzeFho?=
 =?utf-8?B?TEIxSWZGN3h6VW9pM3dHb3pkMjR5WkNRUVg0Qkg0c0ZyeEtjei9ZKzBLMENS?=
 =?utf-8?B?aEs3TU01amg5TDlUNFo5YmpKK3hMSE01Nm13a0VDSjFCajY2NXZtK2x5ZnJM?=
 =?utf-8?B?REdBNENiUkZNRUxmb2dieXd6K0tRQVlUdzBCY3MzaVNMc21NRGxtcjY2WVN1?=
 =?utf-8?B?OW4weWd3L1VLUGtxVjdleTBqc015SkRXUzhPcDVNdm10K3VEVDBGQVlrTGth?=
 =?utf-8?B?YmxIYmFsclFBMWh1ZGdsK2R2TUFoSDVCeGh3Q1VDSGtnd05aRzIzVEcyVGJ5?=
 =?utf-8?B?ZVVTd3pZNVBmTEVwK3JoY0VGTWlkTVA1STI4cndpcFF3cjVyK00xTmdUYlJO?=
 =?utf-8?B?OFJnaUhzKzhlaStrWkVNZ1h2U3VJaElnUXVLN3dxUnFWRTArYWdzQTUvOTB2?=
 =?utf-8?B?UXduUXByKytZZERpYVhvT2hnZGY3RnBoYzQ1ZitFZ25LQVY1WFpXaGJadFB4?=
 =?utf-8?B?Q1gvRU9ZRkQrT2diekVaY0NiUGYwYmZ3SmE0cGhoRDV5QXhQQlNlVjlCcnVz?=
 =?utf-8?B?WEFrS1NEMEtJTWZJZEt6dVc2c1pwVnllcHpOcitGZEk0TFBseENUUDZaS1FY?=
 =?utf-8?B?SysyRTAxREtjc3NveU93ajRvVFJpbG10cVo3SXh4bWdEaFNNcUE3UHZUamNF?=
 =?utf-8?B?bjJqaDUvNWk4TFdpbXp3b2xQREZ1d3UvWGx3RklHUlFRUW9MWDJlakFreE1U?=
 =?utf-8?B?aHY4bWlzbVFTNFpSSWhkcFIzRkhMWVhXeHhRcnpKMWJQMzBJSW1KQjh4cTFp?=
 =?utf-8?B?b3Q1SVJSWVgrWGFuSkVieVJndGhqeUlzbjBDMU9vbVRIdTlZRGh0aVV5aHhi?=
 =?utf-8?B?RFZHeHc0YStmQ3ZpSzF2SGI0NzdNeXM2TTdQcjExYnpZTjB3WVZtYUNiamlj?=
 =?utf-8?B?bHRrc1NYYk5LTnJxYnJ0S2k3d3htYWhoT0pvOThMeDhaRU9uQXE1RjhKZVls?=
 =?utf-8?B?MVB1NVhnWWU0M2tsMzVnNnRXQitoSURMU080WEc4N2NXQ3dmMkFZMlhOY2du?=
 =?utf-8?B?blF2dllxV0JIVHJDQnB5LytCQkEvRCt6UWJxeE44eEpJdnlmbkp4dmJtMUp2?=
 =?utf-8?B?d3I2eW8xMHoyVisrOWEzYnNTWU9BU3NFNzFrSzlKdmhwOEVHWDRYWTIycFZ1?=
 =?utf-8?B?MmtnZzNEUHdTZ2lGQW5BREJSeGNPSk9GZ0piaDFPeXVpdXRTWmVoTUh6VlNZ?=
 =?utf-8?B?UUl6cnpoNDlab2VmbThjUmJYbUQwY0pudDA0YnVneDg4eFc4Q2hGYTFuLzdC?=
 =?utf-8?B?cEN2M0NlSDJuaFV2ZG9Sdy9HTGJvRThmdTI4alErRHVkbXhZa09COXdxVmU1?=
 =?utf-8?B?dVdaYXNuajFJZlNFUkhwbG1uQjZSWXVzZ2VUZG9vbCtmaGtwNGFYZC8xRG52?=
 =?utf-8?B?UXBESjlXdkdoZ2ZLUy9jclN6RFJ3djVrKy9uV0hIcURkSlZkd2hVRWp4d0t1?=
 =?utf-8?B?NTIreURXT2xJWjN4dVpCY3J1MVJHL1NUdUFjTG0xSGt6cjd4TGViRXBYOEg0?=
 =?utf-8?B?U2wxMTkzMzBmT3AyMDJDN1d0aXY1QmcxZGM1NTFJdXlNS1k3QzdxT0lHSkU5?=
 =?utf-8?B?UEpRNjh0Z294SlR3OXlJNDdqcEFUdjBhRzY2clhaOUJWSEhjYkozWHBRSjli?=
 =?utf-8?B?akkxd2V2VTBQZWEvVi9EMi9FUG1ITHhWZ2g4RDlPTEtmTThFWWdZd2FXbU1p?=
 =?utf-8?B?djVISVpnWEphc0gvMlZZY0hKQzhaV0svSnRlM2FWR2RRNDRvMnNOdjFiZTdS?=
 =?utf-8?B?SkRia2RmcUxUL3BQV2tDcUxvNXlHSzhXNGgvQkNyZ1p3eUlzNm92OVVndjJk?=
 =?utf-8?B?Sms0Zk1aVTNLa2ladGNvNVZ2OUQreVVGeUJWQmtjYllDS3dwRlF1K1djNzdn?=
 =?utf-8?B?UUNwcmd5NjBSTmdBN2JRbFFST3FXenBpQWdpbE50THp2U0lmV0FPUk1lYkVB?=
 =?utf-8?B?MEV6Z1Z4RFJGRUFOUlVrQzcrNGNZeTRJUU9RWWt1V2tyNFBGc2kyZ2toOVFJ?=
 =?utf-8?B?RUVabXVEK1RCZmJnczhSb09zQm9kYlJMVHlDOXZzUGtXR2cwdFdtSUJReU9n?=
 =?utf-8?B?RHc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gr4byKnpf13JqZuRz1xHb0IY"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c483a77c-dbe3-4c7b-6525-08dd6087685d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 10:28:04.3971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: At1MniWPYxmjSfdBhaLnWEi4uNLm6WNhpTO8d8G8E8l/khxlOoxJ/+R7T+b/JIdDuhS+yZBBnKYTF0MUGD0E5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2659
X-Proofpoint-ORIG-GUID: GhqQU6zyoson-BR3raNi8J0-lL6sPrpt
X-Authority-Analysis: v=2.4 cv=U+eSDfru c=1 sm=1 tr=0 ts=67d01038 cx=c_pps
 a=cRjhvmALJ7+JJty0Yz2dHg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=9vVJUd7ar8FOpOZwlh8A:9
 a=QEXdDO2ut3YA:10 a=ihAo4eevfFZXQa0tqmMA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: GhqQU6zyoson-BR3raNi8J0-lL6sPrpt
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

--------------gr4byKnpf13JqZuRz1xHb0IY
Content-Type: multipart/mixed; boundary="------------9wMnukjF00b8pupIfjMLEGXN";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>
Message-ID: <7472842f-73d5-49ad-a93e-cd3b8b66cfa3@imgtec.com>
Subject: Re: [PATCH v3 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
 <20250310-sets-bxs-4-64-patch-v1-v3-2-143b3dbef02f@imgtec.com>
 <20250311-bizarre-debonair-macaque-451c4f@krzk-bin>
In-Reply-To: <20250311-bizarre-debonair-macaque-451c4f@krzk-bin>

--------------9wMnukjF00b8pupIfjMLEGXN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/03/2025 07:51, Krzysztof Kozlowski wrote:
> On Mon, Mar 10, 2025 at 01:10:26PM +0000, Matt Coster wrote:
>> Unlike AXE-1-16M, BXS-4-64 uses two power domains.
>>
>> Like the existing AXE-1-16M integration, BXS-4-64 uses the single cloc=
k
>> integration in the TI k3-j721s2.
>>
>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>> ---
>> Changes in v3:
>> - Include adding the second power domain so it's in context
>> - Remove unnecessary example
>> - Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v=
1-v2-8-3fd45d9fb0cf@imgtec.com
>> Changes in v2:
>> - Use normal reg syntax for 64-bit values
>> - Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v=
1-v1-8-4ed30e865892@imgtec.com
>> ---
>>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 34 +++++++++++++=
++++++++-
>>  1 file changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.y=
aml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> index 5c16b2881447c9cda78e5bb46569e2f675d740c4..d9409d33154d429019776d=
dbf9d123b33f8c9740 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -18,6 +18,11 @@ properties:
>>                - ti,am62-gpu
>>            - const: img,img-axe-1-16m
>>            - const: img,img-rogue
>> +      - items:
>> +          - enum:
>> +              - ti,j721s2-gpu
>> +          - const: img,img-bxs-4-64
>> +          - const: img,img-rogue
>> =20
>>        # This legacy combination of compatible strings was introduced =
early on
>>        # before the more specific GPU identifiers were used.
>> @@ -49,6 +54,7 @@ properties:
>>    power-domain-names:
>>      items:
>>        - const: a
>> +      - const: b
>=20
> No, you just affected old device claiming it has two items. What's more=
,
> it's not synced with power-domains. Both properties must have the same
> constraints, but above power domains have "anything".

My mistake. This is tied to to my misunderstanding below.

>=20
>> =20
>>    dma-coherent: true
>> =20
>> @@ -74,12 +80,38 @@ allOf:
>>          - power-domains
>>          - power-domain-names
>> =20
>> +  # Cores with one power domain
>=20
> Drop

Ack

>=20
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: img,img-axe-1-16m
>> +    then:
>> +      properties:
>> +        power-domain-names:
>> +          minItems: 1
>=20
> Drop

Ack

>=20
>> +          maxItems: 1
>> +
>> +  # Cores with two power domains
>=20
> Drop

Ack

>=20
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: img,img-bxs-4-64
>> +    then:
>> +      properties:
>> +        power-domain-names:
>> +          minItems: 2
>> +          maxItems: 2
>=20
> Missing constraints for power-domains.

My mistake, I misunderstood your comment on the V2 series as meaning
replace power-domains, not add to.

Thank you for taking the time to look through these patches again!

Cheers,
Matt

>=20
> Best regards,
> Krzysztof
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------9wMnukjF00b8pupIfjMLEGXN--

--------------gr4byKnpf13JqZuRz1xHb0IY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ9AQNAUDAAAAAAAKCRB5vBnz2d5qsEf+
AP9yJXVarXPht7/RAOrQ2tvuRFgl3M/TYnIbpxI9lNQ1hgD+J2AbJ/SLCjF0wWFpmla6Ouf6DWfu
zsGMj6AO3+vSxAc=
=x9Bw
-----END PGP SIGNATURE-----

--------------gr4byKnpf13JqZuRz1xHb0IY--
