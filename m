Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE4C1FF82
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 13:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FA410E986;
	Thu, 30 Oct 2025 12:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="YFzbi3dW";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="e5ecGf7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B019A10E972
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 12:18:26 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U6HL0C3748337; Thu, 30 Oct 2025 12:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=UWvVJVR675AnBbXvCQ+iIoXUt
 VFriQFB139DijWTPAM=; b=YFzbi3dWbehXN/Y41vwyVbXDZM0QAV76h7uZC67ZE
 4639pkOK27WU58Te2Ou6fSgcMfsFHgVKKEXzCWjUPrHLG4CqbEyXp9CCU0gVcuEZ
 5W9ZQ0cPfK8fdURajKrSv1BO0hSWvVeR6sSSKvQR1kI1ua/XPebKGG0xwG7iRMev
 KQDtYbQbVrk5ctSjRYOh71n5vnK6hsr9prGpE2BiTVEnZPJGk9YMCwTK+0IGRhGW
 BiugsqkKKhroaYfcAx6+M4zmXrvjZwzicSvRa4mAZHh0mugj2xuM6oS1G5AV1MPI
 jaeshI1s9VYODu9LHs39NDr2LRY/M4SPTvxx6wTIBn2iA==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021136.outbound.protection.outlook.com [52.101.95.136])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4a3whxrcem-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 12:18:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idjBfkyu3fQvq9W7MxaNSB36THwzPyioOA1hA6hduzdpSCXs9lq//1bPOeSmU7BL/z8pED5NoxT+6KhOo0EHf3P41QqQkuztM6QRRcJ7NEegGi2WJWCaIlcJYbr9HSuoZ2vcF/fEG7o3fAOi5v55q59RkODhPv3NlzTPHn+nDiFgKE8nhlstJyQN8tomiUiwIwEbkKMo6t09xX+DKMj2JO6OGnbFS19ZClHlN0df+cvHeEVPehv9/v+y5YTMZ20A+N0L5P4/piImzuXXjizo5zpwAtqCG5pB9krYrMZcgtn6hv3E5o1Al/x1ElX86PyUBEOhRH3VrX+lW3ojguOTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWvVJVR675AnBbXvCQ+iIoXUtVFriQFB139DijWTPAM=;
 b=IKJd3CQWp1INbkzMDir2q46zfKNe6A7n1/C48E7dwibL7fc1fKL2Trdw865EgdUdW3nKbYbcXWXRGQB+kKHHEyl/0M8Sj3Q5WqnN/KKsYwpImnpjv+lIZdLcU9eZoVmQN8o84gAhtyV69wJa9OdeyM3CaSA8I3Sfu2k3wP1OOTZIuPpsGUVIXx7FScANwLFgoEaHSSVsrVrp5W9fy5n9uLzbnexX0YbSxSYs2Ff0pAa5989nTGIDs5vZ1q/YS2E67iIcUHh4NAVo1ox5XiIuUhZ5nKJW1bhQDNm4cqSGRyYI3/pDObvBzuzTRuX66zexz4K40GHv48R59RMEaQmw7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWvVJVR675AnBbXvCQ+iIoXUtVFriQFB139DijWTPAM=;
 b=e5ecGf7wsVxrsHcYHjKT+SBhNHtaEqp+HJ2MAdCV5vudh2cGxK3c/sAUEY88091E/qwK8bZmoWGLUNfoJW4K4GdrZ8bCL2fYDJP2WV0ERmQwfOWYI7jHrCVNgYR2bPCYXzjpdfDmnUSElDHb9xuJe06ozQSUEcHAxok3pRdjZxs=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CW1P265MB8446.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:26f::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 12:18:16 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 12:18:16 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
Thread-Topic: drm/imagination: genpd_runtime_suspend() crash
Thread-Index: AQHcSZdFllTyS/HWbkiEwKvB2dr+XQ==
Date: Thu, 30 Oct 2025 12:18:16 +0000
Message-ID: <6854ea2b-b316-4711-b849-038d532f00c1@imgtec.com>
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CW1P265MB8446:EE_
x-ms-office365-filtering-correlation-id: 1b0adb77-c88a-4c04-c525-08de17ae6796
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?ZUdGWDFwRlhVanpDNTdZMkc3a2pBOE5WK0dqMnNTQ3Y2Ujg2Zkp2cWNWZUlS?=
 =?utf-8?B?dmdvMTFpQi9GL3dIUS82am1mL1BjZ2JBVWYwV2hCN2syOWdlMjkyRnF2R1kv?=
 =?utf-8?B?QnY5WGtKUEpIamJGeDAySzhHMTRzVmZhVk8wQ1l5cGJGWjhpNWd2U000dDhI?=
 =?utf-8?B?ZTcvcWZoaWUxak5NU2xJRjZUVGdVU09GNnZ5MnZmUTRwb0dDTjZtNDFpZnoz?=
 =?utf-8?B?bTVTK2FhWCtPblUvVEpHU2FpNWI2T0ExeFhWaFp4dkNVUjMwYk5TT1BldnF2?=
 =?utf-8?B?RFFlUFFTVllORms3eWZxUm9aZStpbjZVUVowSWs4b0dKclhLZ1dpNmVzSUpt?=
 =?utf-8?B?OXdZQTNrbjBla2tBVTZGQmo4cmEraVJiTFVPQkxabEJsbUtYa3I3NHBGZnA1?=
 =?utf-8?B?Rms4VlU1Rzk1bnIxK2xMdUMwZ0RYWExTOFJ4bnc3bnN4dk5oeEdMN3g5enZF?=
 =?utf-8?B?OGpJR1JoNll3YmUvNnc5dEwzZ1FlM1BKQzBNN0hoVE5MUlRNQ2ZSZnRLdy9M?=
 =?utf-8?B?enBwRmRCUjByZ2tlYWVoZGRzb1hZdUFIWVl6Y3FjcDM4WTRsRWRQd0NGUHhN?=
 =?utf-8?B?aWtGOW1GaHR0QTMybzJ6bjkvdGRqSXBnN3pRYkMveG1UTzBtMGRiYWYxZlpv?=
 =?utf-8?B?ZUZwS21zWTZ0TVdoSWpibjBhb1hqUmdIbDZnZlpBcjFta3ltQkhuaHZDSDZh?=
 =?utf-8?B?R2dPWWV0UVFJZ2FoQUMyaFNxek9BRnRhRUNzdXBHL3NORnNYZWs2S1dYeTIy?=
 =?utf-8?B?YWtOcG9PdkhmNkFhbjB2ZTdscjBWaTlvQUYya3lJNzdmc1JUbzdnME5POUpT?=
 =?utf-8?B?Z01yRzlud0xRY0JCRHJYd1lrRlZOU2VPQUJqaWpCajdiVkhmRHprYWNCUjhS?=
 =?utf-8?B?SDBIa2N4VWhxUFZxMmVqci9MQ2lUL2l4SEt6eFpSSUFZMXBjWTVyanMwMzdL?=
 =?utf-8?B?NW5MMkRUOHBSZW5MMFk0bUJERG1MemI2QjluQTUvOHhGTlY2MjNjajBFWjFP?=
 =?utf-8?B?MEQzQmJGL2ppdmhFR3htZWFoOExjM0NWQWdiMGx3YmlBazR0Y0ovdFRMWmhG?=
 =?utf-8?B?V2kySCszV0tpY0sxc2FNbHRqSzZ3Z1VHUzlBZUpMRVFuZ3BtanRQaWpGckJl?=
 =?utf-8?B?YkpDZTlMRjR1aWZEeXRoMkptNW1MQjlHWGJtc1VGaUJ5dExwdEE0QmVNU1N6?=
 =?utf-8?B?UUlWU3lwS01zZ0FCVElPQnJOS1YrSUl3NGZDaUdLdjlVZGI4TGhjRDZPOERt?=
 =?utf-8?B?TGRRYjZwQ1Nzc05mOTJnM3QwZG5oRjJ3bkh6NDVMVk10SGJEb09Gc3ZMeFFy?=
 =?utf-8?B?RFlvb0JSdHRBdFVHWlhoY1FMdXhBRG5hb0N4RUpoMTN1WWQ0TnBYRThsRU1B?=
 =?utf-8?B?Wm5sZS94T3ZZckwyQmpsaXlzWWdPNHpVSW5kaFhBa0I5dEpnWVdST1VoYzMx?=
 =?utf-8?B?azJsQU1GN0c0ZGxweUVSa0pqNGNoN0laUmhJOW0zdUIya0M5a083T3JoK2hw?=
 =?utf-8?B?dFZHNVNEbjlZQ1BBZTZlTjBSK3NHdnVpZDVvdXZuNHhML1hFVnpRT21wWEdX?=
 =?utf-8?B?clp5WWJ2aldtMGtMdVlwMFBPd0VoZ2Z3UzhRc01DWWVkdjhydEcydUtQQkVW?=
 =?utf-8?B?L1pOS2VBRE1wcnp1Y0ZNOTRyUlBNMFZyMnIvR3VwWHNGL2N5TVRMbEZoQ0Uw?=
 =?utf-8?B?YXY4Z1BZdElhVFh1U1pXb2crYTFsbkRkYkFFSmpXVmhybTlPRlAzT2phRk9u?=
 =?utf-8?B?SWt0U1lBc0dvclFmK2t3a0d5V25WelFmd1ZVYUdzRDFmSDJmQmlkZmRRYmgw?=
 =?utf-8?B?TmhuYUcvUy9neVJrK3F2VEFuS1ZXdmw1eVJtVVNwUUtIK2JxQURMVU5vQ2dX?=
 =?utf-8?B?RWZRZVpYQmJJUFlMbnFmVHBoZW05RXR3WXdTQ0RvbVAycEx6eVZlc3l6QXJK?=
 =?utf-8?B?Y1NobmpPUytOSjVSYUlvT1c0cGpROWhvLzNBQmpjdVBicHJONjFOak15SFBS?=
 =?utf-8?B?dVZnam0wbGJaTWs0S3dteGg5Tnl6ek9CalNkUXNXL1Q3NmpCMFZEa1lsK3FF?=
 =?utf-8?Q?WCvjoe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(4053099003); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnFUREJnS2NuYjNBT0JCd1AxS09zUU55V2RBWEEzazVWRUJSK2RVYll0OVlR?=
 =?utf-8?B?djZEUTV5WkJzU2lRaGdqMnpENzFZM2JuYUtVcHQ1bHdsNTgwQjhLQXNMdDd6?=
 =?utf-8?B?cjQ2bUFyaVR0bkJxaHRFZ0hOWXFvL1RNRXdodXVHRnBYUXEwWHRHcHlxS2VN?=
 =?utf-8?B?RDd5eFBqdzVpRUpteFBkT3Jkb3QxMGFuc1habVBQZUdzMTFibGpmOUlZSGJF?=
 =?utf-8?B?bDE2WkJ1QTdNcFhZSURhZFdQQ1d4L3BQUUttN2g5UjlvSmhVbzVNanIwM1VF?=
 =?utf-8?B?ZVd1a1VaZGpyc1BhNENmUXVDY0s5Z2w4cDVkTjJJdmRnMHFOZVk0T3hleWx3?=
 =?utf-8?B?SC9BWThvbUxzMmdhMWY2OG0xZzBML282WmZKSE5CNG1XNVZ5TTNNVWJpTm9D?=
 =?utf-8?B?Z0ZqbUJnSSs0SzBZUk1SeWNUY3A4czJteCs1V1R2aCtUTm5hWEZRT2hhSjZz?=
 =?utf-8?B?S2FaMkROcGNraWZyVzJsVzZ5WFBtSFZPWExmR0tVL0FTZFRTbkdYUHBIdDMy?=
 =?utf-8?B?NTJPVTNoa1N6R0c5RUZnc2ZtQXdyelp3TE4yUnAzUlQvRjRYaFRFQitPc002?=
 =?utf-8?B?QkJBUEQ2S3UrY0oralkwcFZ4Nm01NXA2RzVZZFo0aGk1V3dlL3A4bmhUUkg3?=
 =?utf-8?B?WHIremQwbjl3RFU0NUV3NmlScjlaQTBVMXFmYm1nc05NYnFzbkIxMXVaazB2?=
 =?utf-8?B?YVdDU25TU0Jpb05Ud0lSVFN6c1Y5MVhYcUpRK2RPcGtsajVsd3N6djRrTGVW?=
 =?utf-8?B?UjZlc2c3TGtwQVViajZSZmpVRGhoVTNuVDNGWEtNYjNlbkJDek1sc0NldTNM?=
 =?utf-8?B?b0pjVWx1b1Q1OVFxK1R3REdaeW10SThyTHRGSEJvTEMrQ3JYK0Vud3lYeGVy?=
 =?utf-8?B?OU1TMjlabGlSWXlHYTB2OHBOUFhCL2h3SGZJWkQraDBXTWZWOEYrVGJnSHZ1?=
 =?utf-8?B?TjVhc2F2Wk5IZ3RBbzc2TjVHTUFGamtna0dlSThtRXlGcDFTbDVtbUZsa0V1?=
 =?utf-8?B?UzYzWklCRnRxTWVGTGVnaGtTdHJUT0ZGaE40WkpDUmZDNFdOY2QyRFpFempw?=
 =?utf-8?B?d3NReE9WRExzQ0o2Tk0zcDBpSjV0VStBRXo0M01wRGpSLzRwSUo0cXFZQkMx?=
 =?utf-8?B?U3UzQjBDNTVkY2lBRFJCUFhuK1JCdVAxNUFYSmtmTnRMaFFwbDNUaEVGS3dl?=
 =?utf-8?B?c3BnRUdkeXdxQUdocHFNQ00yRjVlektzSmpyOTV3c1JWUHdjMTFxUDJPRlFo?=
 =?utf-8?B?aFQ0a0liRVlNU2pJS3B5TnhyTW9PVTlXUnB5ZFNQTnBzdFVGVFZvdXJDM1JK?=
 =?utf-8?B?bXhVSWNtYW9QR0pTZDN3UzdSYmNTLzFTSmV1b213RFcxNFA0ZlNwUVdKSk5v?=
 =?utf-8?B?UVVuRXBSV0hvbWtUNzF0dVJ0SmVETlRsTkZFeWNGVnY4c0lFNGdOU1pQSVI1?=
 =?utf-8?B?dHcyOVZGK1FCdlJIa01xM0NBZWx0eHZUeFAvWGNHVE9lMWw1RW9LM2poeWJn?=
 =?utf-8?B?cmJZcEdubzBVUElnY0gyL0VmL3dEeDBrYWl6UGhYMStUdVBjbG0ydmx6YmNY?=
 =?utf-8?B?MDlIUG9KbEdmbGxHclBSSldjOXJ5a2puN05iVzZYeVZ2YnQyZTlEVmdNd0do?=
 =?utf-8?B?Y1c2bEdmYTN4Z1B1blBCeFJwNWJXT1g1bldjMTR4R3ZYek5PL3lnaTc1Vkpm?=
 =?utf-8?B?K1FPeWMvbzcrT21jN1J0OW9BNisrOUtvUGtudnJtL05YZ1kwOEJUUzRvYkJi?=
 =?utf-8?B?OUI4UlI2V0hENlVLMkppQ0RFeXpPOGRzeEErWElHUEMvUHQvRTlITk9kckF0?=
 =?utf-8?B?NGlCd0FydGlDcHl2WllhOENQZFFqb0lTWHZTbW5FbmFDWnRZeHhscTVYVmFr?=
 =?utf-8?B?VENNNFl0dE9PdVRhTnJ1Q3hHTnlKcFFseDlVdW1lVlM5RERJZWZreVBVbTVQ?=
 =?utf-8?B?R1hHbktqbmN1SlVwVk1GdXhPalRkMzEvTEpQandpenN6RE1iS1g2cDdsdE5a?=
 =?utf-8?B?RGVUMVNyNWNsQjFOSzAwam9NNmR6RG04Z3ZlUGhZRlVNN0ZOdnNIaFZjRitR?=
 =?utf-8?B?cVhFNzZzME40OU4wNEx6SUJZWVplOHZKaW1USXVIaFAvN3R6L3NOTFBWODds?=
 =?utf-8?B?bklmaUR0aVcwbHVRWFFtMUhwbjlsY3h4aXllVEhuZlFTSStYTURYbjdMZ1cx?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a1f2jZjmUN0XDF30ci99LWFw"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0adb77-c88a-4c04-c525-08de17ae6796
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 12:18:16.2311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CF4DqRvb+va/CZE5NcFvaW5YZCBob8cX9beyJzAOJXkdgYVgyiMfs4z2yIuJ2ySguEI8GB4nmQ/MakNx0THCuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8446
X-Proofpoint-ORIG-GUID: v_i9sLJkusEkf-QOIS1llPHWna8_64vV
X-Authority-Analysis: v=2.4 cv=C5zkCAP+ c=1 sm=1 tr=0 ts=6903578c cx=c_pps
 a=BlprNghut5JHYbeQ3MlmoQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8
 a=5jVDs9gtJI88vnSHwZEA:9 a=QEXdDO2ut3YA:10 a=BcuuvNNgR-IJ-juQ7BwA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: v_i9sLJkusEkf-QOIS1llPHWna8_64vV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEwMCBTYWx0ZWRfX5Ir7jxazB9Dg
 4v3+C7r2AUZlfgW06NQA8NPfp2DpyLWGaUrOe5QS/Ac39GJ1fgtDO0vD5OBsrrDZQKtyvG7AUP7
 dZR7PFq2tr9ejIq4ulVzeoDu5rHZ50itM7PyjbZKkyLYHke3eOQqFx5v8ifglCdeaKHHPHjZdwq
 R1P0VTJYLC/Caq0oik7bGtaomlc9+jt5aBCyrayrJWAXkmAuiqTmVHgVEKnu/jpmeykjFUlENhu
 GfI1FJailqZFkx3rYidfyHycaYXBywcIs5zGGLGVxM1ONxnx5BJm2Gzz+J89fw65X4ip4gvCwR7
 nKrjIoJ1cdXQx6M1zXB+mEb/FAn7LoP99/NC3CwEpKwbEWeYEjaX+preieix9YlAE+rd38o5l9L
 QA1uYwmOWCGVuX/1l5aZHoVR2uUCcw==
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

--------------a1f2jZjmUN0XDF30ci99LWFw
Content-Type: multipart/mixed; boundary="------------i0xtl0UtikhWjP0UHebdwmJh";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Message-ID: <6854ea2b-b316-4711-b849-038d532f00c1@imgtec.com>
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>

--------------i0xtl0UtikhWjP0UHebdwmJh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On 29/10/2025 14:08, Geert Uytterhoeven wrote:
> Hi all,
>=20
> While playing with the PowerVR driver on various R-Car SoCs, I ran into=

> a crash/race condition on Gray Hawk Single (R-Car V4M).  After adding
> the GPU device node to DTS, the driver fails to probe due to lack of
> suitable firmware, as expected:

Thanks for the detailed report! I'll make time to look into this. Do you
encounter a similar issue on other R-Car platforms, or is this exclusive
to the V4M?

>=20
>     powervr fd000000.gpu: Direct firmware load for
> powervr/rogue_36.53.104.796_v1.fw failed with error -2
>     powervr fd000000.gpu: [drm] *ERROR* failed to load firmware
> powervr/rogue_36.53.104.796_v1.fw (err=3D-2)
>=20
> However, after that it crashes:
>=20
>     Unable to handle kernel NULL pointer dereference at virtual
> address 0000000000000040
>     Mem abort info:
>     PM: GENPD_STATE_OFF
>       ESR =3D 0x0000000096000004
>     PM: sd_count 19
>       EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>       SET =3D 0, FnV =3D 0
>       EA =3D 0, S1PTW =3D 0
>       FSC =3D 0x04: level 0 translation fault
>     Data abort info:
>       ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
>       CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>       GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
>     [0000000000000040] user address but active_mm is swapper
>     Internal error: Oops: 0000000096000004 [#1]  SMP
>     CPU: 2 UID: 0 PID: 46 Comm: kworker/u16:2 Tainted: G        W
>      6.18.0-rc3-arm64-renesas-04934-g585255656363-dirty #3296 PREEMPT
>     Tainted: [W]=3DWARN
>     Hardware name: Renesas Gray Hawk Single board based on r8a779h0 (DT=
)
>     Workqueue: pm pm_runtime_work
>     pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>     pc : default_suspend_ok+0xb4/0x20c
>     lr : default_suspend_ok+0x9c/0x20c
>     sp : ffff800081e23bc0
>     x29: ffff800081e23bd0 x28: ffff800080e2d240 x27: ffff0004402d8bc0
>     x26: ffff0004402e2900 x25: ffff000440b554e4 x24: ffff80008108bb70
>     x23: 0000000000000001 x22: ffff80008108bb88 x21: ffff800080e2c568
>     x20: ffff800080e2d258 x19: ffff000440b55400 x18: 0000000000000006
>     x17: 2030683937376138 x16: 72206e6f20646573 x15: ffff800081e23510
>     x14: 0000000000000000 x13: 3035616234383138 x12: 3030303866666666
>     x11: 0000000000000533 x10: 000000000000005d x9 : 000000000001b64f
>     x8 : 7f7f7f7f7f7f7f7f x7 : 205d373032323131 x6 : 0000000000000000
>     x5 : 0000000000000030 x4 : 0000000000000000 x3 : 0000000000000043
>     x2 : ffff800080e2d258 x1 : ffff80008108bb70 x0 : ffff000440b55400
>     Call trace:
>      default_suspend_ok+0xb4/0x20c (P)
>      genpd_runtime_suspend+0x11c/0x4e0
>      __rpm_callback+0x44/0x1cc
>      rpm_callback+0x6c/0x78
>      rpm_suspend+0x108/0x564
>      pm_runtime_work+0xb8/0xbc
>      process_one_work+0x144/0x280
>      worker_thread+0x2c8/0x3d0
>      kthread+0x128/0x1e0
>      ret_from_fork+0x10/0x20
>     Code: aa1303e0 52800863 b0005661 912dc021 (f9402095)
>     ---[ end trace 0000000000000000 ]---
>=20
> This driver uses manual PM Domain handling for multiple PM Domains.  In=

> my case, pvr_power_domains_fini() calls dev_pm_domain_detach() (twice),=

> which calls dev_pm_put_subsys_data(), and sets dev->power.subsys_data t=
o
> NULL when psd->refcount reaches zero.
>=20
> Later/in parallel, default_suspend_ok() calls dev_gpd_data():
>=20
>     static inline struct generic_pm_domain_data *dev_gpd_data(struct
> device *dev)
>     {
>             return to_gpd_data(dev->power.subsys_data->domain_data);
>     }
>=20
> triggering the NULL pointer dereference.  Depending on timing, it may
> crash earlier or later in genpd_runtime_suspend(), or not crash at all
> (initially, I saw it only with extra debug prints in the genpd subsyste=
m).
>=20
> As the driver mixes automatic (devm_*()) and manual cleanup, my first
> guess was that devm_pm_runtime_enable() would keep Runtime PM enabled
> too long after the manual call to pvr_power_domains_fini(), but
> replacing that by manual cleanup:

Regardless of whether it fixes this issue, it feels like we should clean
this up and stick to one cleanup method driver-wide.

>=20
>     --- a/drivers/gpu/drm/imagination/pvr_drv.c
>     +++ b/drivers/gpu/drm/imagination/pvr_drv.c
>     @@ -1424,7 +1424,7 @@ pvr_probe(struct platform_device *plat_dev)
>             if (err)
>                     goto err_context_fini;
>=20
>     -       devm_pm_runtime_enable(&plat_dev->dev);
>     +       pm_runtime_enable(&plat_dev->dev);
>             pm_runtime_mark_last_busy(&plat_dev->dev);
>=20
>             pm_runtime_set_autosuspend_delay(&plat_dev->dev, 50);
>     @@ -1450,6 +1450,9 @@ pvr_probe(struct platform_device *plat_dev)
>      err_watchdog_fini:
>             pvr_watchdog_fini(pvr_dev);
>=20
>     +       pm_runtime_dont_use_autosuspend(&plat_dev->dev);
>     +       pm_runtime_disable(&plat_dev->dev);
>     +
>             pvr_queue_device_fini(pvr_dev);
>=20
>      err_context_fini:
>     @@ -1475,6 +1478,8 @@ static void pvr_remove(struct
> platform_device *plat_dev)
>             pvr_device_fini(pvr_dev);
>             drm_dev_unplug(drm_dev);
>             pvr_watchdog_fini(pvr_dev);
>     +       pm_runtime_dont_use_autosuspend(&plat_dev->dev);
>     +       pm_runtime_disable(&plat_dev->dev);
>             pvr_queue_device_fini(pvr_dev);
>             pvr_context_device_fini(pvr_dev);
>             pvr_power_domains_fini(pvr_dev);
>=20
> did not fix the issue.  Calling pm_runtime_force_suspend() instead of
> pm_runtime_dont_use_autosuspend() also didn't help.
>=20
> Do you have a clue?

Not yet, but we'll look into it :)

Cheers,
Matt

> Thanks!
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------i0xtl0UtikhWjP0UHebdwmJh--

--------------a1f2jZjmUN0XDF30ci99LWFw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQNXiAUDAAAAAAAKCRB5vBnz2d5qsH4+
AP9shaMxqGw31OpWPqvXc+sYJHZWjNqjRJoSrwH1L4IJkwD+NCuHjE+fO+kmVGViNMSBePCEiViC
VsP107n9OJOaQgU=
=WWB6
-----END PGP SIGNATURE-----

--------------a1f2jZjmUN0XDF30ci99LWFw--
