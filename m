Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB2DA971FB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 18:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1479210E2BA;
	Tue, 22 Apr 2025 16:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="vHbN2Cdx";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="T3S4N7ru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB7110E0A4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 16:08:44 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6v8Od015955;
 Tue, 22 Apr 2025 17:08:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=AAsnpJ5/2P0j/+hvqdYYPgTom
 bVRDMPZYk8sAl+BC2c=; b=vHbN2CdxtFDL5Fi5fLW0nVsJTxfVclMtNXCNus0ld
 iEkqdreAsjs0A1RkctRB+FAokTLKIF/COPF46M+0WkMXwRM8+U33sonD1uOPHWl0
 QlOrY8xTp/NRPAr+/cMtexibOgulcB11XWRtFo5KD/gY555z4UEWNPip2XTJhs2Z
 tItGBCmG2lWU21toOmFAEM/lIArUtM/CN8lArG3vVe4hA1obnLM1LQEyqmwx46MD
 Mbn+Ek1BQQi80koJ54shngXqvzmT6ZJogAU7l7YWXM9C4a6bWJ0OI78cOv3v7z6P
 1ginm1A4/vPIjtHk1DtrGPMb+vRyjj1s7vIdzTjucwY9g==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazlp17010000.outbound.protection.outlook.com [40.93.67.0])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 46423t1uqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 17:08:22 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enhtMDDdDwPHG/cla2G9TGp4bWT/dbL5Knaxl4QAkd9M/QmT7ar0kSCXvjAF66XJMbwzEOK9A1dm1vZ3F8avwaO8NBiddvWMaowDtbaUXxMmeefOOGIcwUu4Vu0JTBqYyH6mwIF42fL/sPA6TueGtctnExYjVFkikXYDFkpSlJgUq7q8J/w49xVAi53Z/uWqq6G0znySBysnNUYgE0ynxSlHfXcCEPqL6hYUYFKUVnPGBYa9YpeAg3s+7pUtJkOZ/pP11RBvAP39p3okjn+6cQ3qzeKqRK2pxEgKiqB/aZ9KLaxgKltvPdFxaAi0flndw+nG1a6OxkzMpMdwiBMarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAsnpJ5/2P0j/+hvqdYYPgTombVRDMPZYk8sAl+BC2c=;
 b=EDwQp8tN3pG1REJeQ1vtYND1gjZr5q6hS3fMIE7KZmtMW6IoyYCvENccmJmgE46rBvhZl3MH9yNwtXQO3C8uYTYbD5KqMCOFzjIf9PfrrYUbGdNzQYxn8iyluCE9JqEkehKfIDfJMjXnXqMJHpNAbqeYzlrAO8dlvJI+G4hnRl2xXQihufP02hEdeJpOz4Iof1+wvTLV15OlrpeXZJ5WorTf+YMmnnqFCaBc5Aar49zXPQ56njSff8hIvz5qjhyTOLyddsstz7dSOBKJklhE8B3+DnGaSzJ0obhXmO7RwQ+aC/kFwNW+2Rsc5LloHb8RzrQ8m0iKVs8r5l6UZnzc+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAsnpJ5/2P0j/+hvqdYYPgTombVRDMPZYk8sAl+BC2c=;
 b=T3S4N7ruhLMQ7KAd41yrs4PuwqvpPtU0iaKQC9m2EX0S2kV1taDqqBSCYo4JT499i24DYfBXsN/67rdcGDBzfwQ6qr6lqHxnbMuilth99kOsYxFviJJSmgrWGHIiB91enJoOCSBJVyXs56xDkZVMJtcDT41bcV3ISgwiSRO5xg8=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB2921.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:174::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.23; Tue, 22 Apr 2025 16:08:20 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 16:08:20 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Jani Nikula <jani.nikula@intel.com>, Alex
 Deucher <alexander.deucher@amd.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/10] drm/imagination: avoid unused-const-variable warning
Thread-Topic: [PATCH 01/10] drm/imagination: avoid unused-const-variable
 warning
Thread-Index: AQHbqUo2T639E3x4dkeZqiAhvvg4tbOv7vKA
Date: Tue, 22 Apr 2025 16:08:19 +0000
Message-ID: <04e72a15-627a-4ca0-824b-a40add7cd4de@imgtec.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB2921:EE_
x-ms-office365-filtering-correlation-id: 92aa95d6-f265-49a4-4b25-08dd81b7e65f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?NElyTEc5ZSsyb3pIMFUzTW9Cc3B4TWUvWDlpM3crTWd1MERNZDEwVFdRQlB3?=
 =?utf-8?B?TVo0UGhvSE83WkNjQVBhTXREYVd0cU5ZL2oxQWtGSDlBZTdHRW9YQkZJb0RV?=
 =?utf-8?B?eCttZkZlcmZaMW82UWp5WHJkaUN5WUxWdkRRR1JNNHhmdlBvdVh2RS9ubmlL?=
 =?utf-8?B?WTdob1lkQithbGk5SzVHZzE3ZldNUXJVamE1QU44YTEyRncwcHRRRzlyWGlE?=
 =?utf-8?B?UzkxbXFtQXYwU0ZPK204dnRINGpPZ0Z2K3UxaGZQTXhDY0doaWorOTFBK3RV?=
 =?utf-8?B?WW80SElyUmFGZmVuT3VsVVJ0d1JIc0gxcTFaTTdSbDlXQXZZZTJ4UzBZZnVi?=
 =?utf-8?B?M0tzaHNaUUZGWFBxRVNFNUFVKzVRTk05dVIzdGFHcCt4L3RUcHU0VE9BSEpN?=
 =?utf-8?B?dHNaVDYvZGpqdHFiaHhEL2M0NzB5RHFPWWIwL3d1MjJ0bUNXLzlndDFxSGRY?=
 =?utf-8?B?VVlXRXNPUmZDNTNTUDdxRnczU2pjcVRJMTczMWRobnFNblFNOWphSzZLNDJw?=
 =?utf-8?B?L3dYdUhnb3NoVk5jb0kxVGdrQmpSc2JaZmF1MGQzT3h1MWdUazBnRlNWa0Y2?=
 =?utf-8?B?eU1CQ2xPcEhRQmk3eTl1MjRhS3B1ZTJLcFBueHVuVHptUDlUWU5rMWhLRFdp?=
 =?utf-8?B?VDZCU2Rjczd2VkFJR3Jyd2JVclJ0dVpKanhudC85V2JMKzU4ekZQYmdMeWtn?=
 =?utf-8?B?eC9QSUI0WVZ5SW0rakxoVWI3TDFjTTEvZ2JvYks0T3lVdUZvT3c2RHU1Zy9S?=
 =?utf-8?B?c0doRE5FWlcwbllqQ3F0cUFHV09jVk1oZGZ0ZkNqS2JkS2RWN25TREVtUklL?=
 =?utf-8?B?SzdjNDVnM1Q2OXNneXl2aDIxaGRFUjNyaWNoWWtEbjc3eXpueE1HRHl3SDJU?=
 =?utf-8?B?WmJnSzJ5Z29GWEp5aXh2Rmlkc2p5NXdCclhDVVFFR2poRjh1SGhhL1A4bm03?=
 =?utf-8?B?TTMxMldjR0U3YTlkdzJHRnBXYTFKVGRIekl1NmNhcitrNUhpOHd2MkpkQVRU?=
 =?utf-8?B?WkUrcDZDeVdmRUl0OGdCcnBQWkxKRFh6R2UyN0NyVC9uYXBJL013eDluQXJ2?=
 =?utf-8?B?S0I1dTZwcTBWWUN5UlRoZUVjTlVjSWE0NUVQRkRwRXBZOUg4UmcxQytHT0JM?=
 =?utf-8?B?OENpSmlhaHVnSXRBMWl6UkluOEx6cjFaQUtmY1VPcWRKaUxkcGE1VWtZRnJr?=
 =?utf-8?B?MmFVUXdScVgwVlgycjFRejlYaVNkd1EvWjlpL0dvc2cxYU1ISjJqbVBUdUhO?=
 =?utf-8?B?cEloMTVFcUU1clhjQ3doVWx5YURPK0trVG51MkYvYzBKajQ5V1dTOWt4bVN5?=
 =?utf-8?B?ZVZuMVpQVS9iTG9pYU1jaFRybmxWVXZ5UkpJRHYvM1I2bTFmSko0MUYrSGNY?=
 =?utf-8?B?bnNvUDNXbnkxZkYreHlDOFVzSjdsamo4ekN3d1VaVFNZUUxpKzlIQmdMOXhj?=
 =?utf-8?B?aU5rbk1Ob290TzB0MzNkTk1SK0JRbVcxT2RaKzU5L3VoSmZxQTRBNjlaWmw1?=
 =?utf-8?B?YUxveU11b0xiYm81MWJlR0lSSTJISkFnd0J0bjBKTzFNUmJ4MThtVExPOXBz?=
 =?utf-8?B?U040Nm5aQWxra2ptREFiZnc4bGRFOEhQTFZEVXhGcDR6L2tIalpkM2pZaEd2?=
 =?utf-8?B?M2NGUXlpUGFGOGpnMnltdUVnQ0ZaWllMNkRDQTcrNXdidW9CUFA1MWNCalo0?=
 =?utf-8?B?WUR0bkZVUU1ZWTJsOWlueWhXKzJtNkt4aWo5eWN4WGFVcmVYNzVHcklFSGhq?=
 =?utf-8?B?VnlWTmZtWVR1R1FYSldjRGx1TnJ3UHIwSjlYYUtXdWxIc3JncjBpeWN1NTF3?=
 =?utf-8?B?V3lOTloxb0FGcXpZUlJXSE9YYzhxUGloY3NJNzExTmNkdklRTVdPZWlBM2t2?=
 =?utf-8?B?SFlYaFovSjNaVGluSHN6cjROL1QvMVJLenQyU2s1b2RON1VrMkl4OGxtcllP?=
 =?utf-8?B?WDFPZ1pJWkpUcmEycy8rQjdyMlRGNXMzR0orSHVTenliM3lhR2VGLy9iZXVk?=
 =?utf-8?B?WVBTN2trY1l3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0pYUk5MZml1clVkMUc2WWErcitteEllcjFiRW14bFdOWi9ZSkpidzF3d0dD?=
 =?utf-8?B?SVFzQitYRHhVcFAzdVFxWDNLQ2I4empMYWNXbW9yYmZ3T1RLVm5kMklNUmh1?=
 =?utf-8?B?M2VvQjErTnlEQk1rZnU5M2FCSEpNMVh6NXlpV1JPUEVuMHFxbTBJdkVaZDZP?=
 =?utf-8?B?SG50aTZlSFdMWXVSd1F1VGxkRGtHcHBtV1B0eTdvYkhlQU0zT0lRaWFsc2tR?=
 =?utf-8?B?VUdmbktoa0NTMkk5cEFBMGQ3T2hRcW9qWmZxL2FsQ1RrRi83cWN4RHloQnlp?=
 =?utf-8?B?RU9BcEhTZkhVbXlGakd2TGdKWE5yQ0JSdWdoeTJDOEhiV1d0alRDMmxkdUZx?=
 =?utf-8?B?VTM1ckhGaDZTU2xYbCtncUowQVI0MzIrQXFLN0VNS3ROc0FlSElpZXJ3SzZW?=
 =?utf-8?B?ejRrN1lxZC9lSW9HUG9Zc3ArWEZLaVBHbndUcmxQQ2VPU1pYbEtFbVdvcSs2?=
 =?utf-8?B?R3lUQmFQbUNRc2tGNVNCSW9WRDBoUGxudDFLZ0t6N3p5em1ZY0tZVnQ0dGl3?=
 =?utf-8?B?Y1llNGFDaGpLVXhDTW1zY1BMS2lObWZ4VmEzRlpOY3NhSnJYSFNTbUFEdVhP?=
 =?utf-8?B?SVhFdHNKSld6cGhIM2lkUE5mM0cwZWdWcFc3ZDN2eUNyeEFFQzNTZzBMQVU0?=
 =?utf-8?B?a3crM0FhSHAzdjIxTENrQ0d5WStnZVl6UzFmSEJ4RDdTWkgydVB1Mm9Ddksx?=
 =?utf-8?B?QTZ6NHIxdFRBK2VmT09VYzlGeTFOTFVrcTJCSFg2aGU3dDc4Umh0SklwbHkw?=
 =?utf-8?B?elcyMEVOQ1dyV3gwazNCWGRnSHp2NE40aUdkMDc0a1BjM1JBaTgzdjVsVVlM?=
 =?utf-8?B?R2UrbEZlQzR3Wk5FSGl1WGFwbXBydy9SUTEyaXhMMEVHaHVCMXJWWTV6L0sw?=
 =?utf-8?B?TlB6SURBVUU4WjZtRVU0R1BkcDkrUFlzcXdBRm9vSjRaU3Q1V2J0NStKam5k?=
 =?utf-8?B?ajVycEszYXQxb3JZSWNlS2Q4U0NXd2NzVmxkWVV4Yyt0bnUxVzdEZDcxSFdk?=
 =?utf-8?B?QkV5SldScDVKeW41aFB2WXFRY25Pd2haYmZzanNTcG11U3hOMkNtYTUyVzAw?=
 =?utf-8?B?QXZib2ZBMERCKy81ZTZ2N3BEUGJ1RnE0SnV4QkJiMDUwMlMyclFPMGZaczB1?=
 =?utf-8?B?dWpuclBaT2pzUDg1SVVRUEp5aE82NFNESlZUU3k4b3pIeUNhMmZOOVRTQXBD?=
 =?utf-8?B?YzNYSmxaT09rZUZjWEJycEFJdlFwcmQzck1ycFlYeTl6S2NZRGQ5WEYwZlZM?=
 =?utf-8?B?U0Z1SnFLU0Vzb2d0UzB0dkRXa05HTHI1Z0U1UUpCSGIzeVB2ek9OSnFwR0Ju?=
 =?utf-8?B?MVJJRUdORDNVbFVhM2hwVHlPc3MwNU53QnBiWnZpZWxQdy9TSVBHdDB4aFZa?=
 =?utf-8?B?OEg5ZVNxL0lTWllMZXRRN25SUHlBcHdpYzA2T0d2S3hCdVU1KzZmc0dTQkM3?=
 =?utf-8?B?MTNCNkt1T0RUS0ZIakpSNllpMTFVQnpMUjFyNHk5dS9nVDZmei9rQThvdVhN?=
 =?utf-8?B?dk1EZXNRc050SjNuSGVERU1DL0xRaTBLZ252QW5wODZ6REc3Wk5Jajhjcitt?=
 =?utf-8?B?R2ExLy9rd2VsbXJWRGloYW9OaU50bHZESXNMN1JTRE5PMFJjcUJ6Mk9RM3VH?=
 =?utf-8?B?MVFYaG1teWF1enVBTUlWZTQ2QzhxcWc4b3NzL2lVNDl1MWsrZitZRElEbDU0?=
 =?utf-8?B?QkMzT1Rld2dqQWtVd1FPdW1hZGpoeFBMT202TEhkRW44VXI5L0JnSlRQZTNP?=
 =?utf-8?B?dWc3OVJFNW1CeGpXeXRJTGxyNHF4OGN1dHgzdTlqOHhhcWNjZks1cndqWEY4?=
 =?utf-8?B?c2hPN1NpT1RaMlZ5dk9jQWRFVDFsNmNnVmJDWE5BczczTXpFTjlzU2MyRUoz?=
 =?utf-8?B?TkRDMVhXNWFsYWNaTGFaOHpxRTJmK0svR2QveFBNMzI0dkRSNlNxTFpBK2VK?=
 =?utf-8?B?K3YybnJDR1VRaUpSdWhqT3lOWkJxeURmVnQvZm1tNnJObS9TeWgxZHR0cGND?=
 =?utf-8?B?amhWM3ZEMHZKOXIxNlNEWXlFTmkvQTludEZER0hVZ3VWMGhweGhkVlcySXQr?=
 =?utf-8?B?Wlg4TGYvWmU4bEtIcDZvT0h4ZDI1RXd0Q3NmQ2dDRFl4UFFsNC95Rytvc1lU?=
 =?utf-8?B?aUFYNDQzb2JGWkNvdStqMmR3VS8ySUgzZFI2N3RnNmdrOHd4OHV3czNQYTBP?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GI4OjDwxcLSZVMWglndskERE"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 92aa95d6-f265-49a4-4b25-08dd81b7e65f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 16:08:19.9871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zm8t2Rew8q4fSSymEjp1unxdz/4IJNIW+6mKyMsFa+q+PhZSqFes8K+ymw98Hk+5Jv35BM02E8LfFBHTwPrNkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2921
X-Authority-Analysis: v=2.4 cv=L60dQ/T8 c=1 sm=1 tr=0 ts=6807bef7 cx=c_pps
 a=8uRQujWAJeFmirxVo8X+Qw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8 a=ChYgo5OsSTPg3kVoBV8A:9 a=QEXdDO2ut3YA:10
 a=H224zZAz58H5Dt4Z_zQA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: -0oIwHrNqXpY7qhTUCLdEq1_TWLXfNrs
X-Proofpoint-GUID: -0oIwHrNqXpY7qhTUCLdEq1_TWLXfNrs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDEyMSBTYWx0ZWRfX1TFrin3rLnWJ
 Us403F65aRDVemPeDiqzyMpsIz33kRw2rZdH/T0isKW8hRDXhjoEfpHjZ+uGzaBYt/5+6QmRbXI
 E6K8Mm538e3f7sB8/2O6+2rb9qoH/Lq6b496IOz1vs7d4QM0MtP5OjpdQLDvFgKy1rypIR2Y6Xh
 2K4+Pfh48mS4xifX8h5rNmQNW9vyyk4Js13RLBpxIij2SoY9SgJWFhjfIYgh+gmPCN6ZZhIRzn+
 EwbjgzZL73eY/Owr8U18MJ5affAbopB4g+VKHTlxZ0F+BibjlHttUx6+YOfkkYhYp2uQAJTjPuS
 Fq1605tRahwCF4jtC+MgYq+Zlz5xbMHubhmlMLVLx0mLXeQqtHB00xPN0BzBPjllpyHa+rhbFtD
 fs86NsJAbpQhrdq8MYrTUAXEUFC9fiQGMY0IMp68BW3L4xGaFOCqOQFMjm3C9+VUgOqOPjOh
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

--------------GI4OjDwxcLSZVMWglndskERE
Content-Type: multipart/mixed; boundary="------------IIqlIQqRSvRcMtFZgBL0QDpb";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Alessio Belle <alessio.belle@imgtec.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <04e72a15-627a-4ca0-824b-a40add7cd4de@imgtec.com>
Subject: Re: [PATCH 01/10] drm/imagination: avoid unused-const-variable
 warning
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>

--------------IIqlIQqRSvRcMtFZgBL0QDpb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/04/2025 13:22, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> When CONFIG_DEBUG_FS is disabled, the stid_fmts[] array is not referenc=
ed
> anywhere, causing a W=3D1 warning with gcc:
>=20
> In file included from drivers/gpu/drm/imagination/pvr_fw_trace.c:7:
> drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h:75:39: error: 'stid_fmt=
s' defined but not used [-Werror=3Dunused-const-variable=3D]
>    75 | static const struct rogue_km_stid_fmt stid_fmts[] =3D {
>       |                                       ^~~~~~~~~
>=20
> Rather than adding more #ifdef blocks, address this by changing the
> existing #ifdef into equivalent IS_ENABLED() checks so gcc can see
> where the symbol is used but still eliminate it from the object file.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

After sleeping revisiting this after being on holiday, it seems like
enough of my concerns were due solely to my ignorance that I'd rather
just take this patch as-is than spend time reworking it. (Thanks to Jani
and Andi for filling gaps in my knowledge too!)

To that end,

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

And I'll take this through drm-misc-next tomorrow if there are no
objections.

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_fw_trace.c | 8 ++++----
>  drivers/gpu/drm/imagination/pvr_fw_trace.h | 2 --
>  2 files changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/d=
rm/imagination/pvr_fw_trace.c
> index 5dbb636d7d4f..93269299d6a4 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> @@ -122,8 +122,6 @@ void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
>  	pvr_fw_object_unmap_and_destroy(fw_trace->tracebuf_ctrl_obj);
>  }
> =20
> -#if defined(CONFIG_DEBUG_FS)
> -
>  /**
>   * update_logtype() - Send KCCB command to trigger FW to update logtyp=
e
>   * @pvr_dev: Target PowerVR device
> @@ -447,7 +445,7 @@ static const struct file_operations pvr_fw_trace_fo=
ps =3D {
>  void
>  pvr_fw_trace_mask_update(struct pvr_device *pvr_dev, u32 old_mask, u32=
 new_mask)
>  {
> -	if (old_mask !=3D new_mask)
> +	if (IS_ENABLED(CONFIG_DEBUG_FS) && old_mask !=3D new_mask)
>  		update_logtype(pvr_dev, new_mask);
>  }
> =20
> @@ -457,6 +455,9 @@ pvr_fw_trace_debugfs_init(struct pvr_device *pvr_de=
v, struct dentry *dir)
>  	struct pvr_fw_trace *fw_trace =3D &pvr_dev->fw_dev.fw_trace;
>  	u32 thread_nr;
> =20
> +	if (!IS_ENABLED(CONFIG_DEBUG_FS))
> +		return;
> +
>  	static_assert(ARRAY_SIZE(fw_trace->buffers) <=3D 10,
>  		      "The filename buffer is only large enough for a single-digit t=
hread count");
> =20
> @@ -469,4 +470,3 @@ pvr_fw_trace_debugfs_init(struct pvr_device *pvr_de=
v, struct dentry *dir)
>  				    &pvr_fw_trace_fops);
>  	}
>  }
> -#endif
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.h b/drivers/gpu/d=
rm/imagination/pvr_fw_trace.h
> index 0074d2b18da0..1d0ef937427a 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.h
> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.h
> @@ -65,7 +65,6 @@ struct pvr_fw_trace {
>  int pvr_fw_trace_init(struct pvr_device *pvr_dev);
>  void pvr_fw_trace_fini(struct pvr_device *pvr_dev);
> =20
> -#if defined(CONFIG_DEBUG_FS)
>  /* Forward declaration from <linux/dcache.h>. */
>  struct dentry;
> =20
> @@ -73,6 +72,5 @@ void pvr_fw_trace_mask_update(struct pvr_device *pvr_=
dev, u32 old_mask,
>  			      u32 new_mask);
> =20
>  void pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dent=
ry *dir);
> -#endif /* defined(CONFIG_DEBUG_FS) */
> =20
>  #endif /* PVR_FW_TRACE_H */


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------IIqlIQqRSvRcMtFZgBL0QDpb--

--------------GI4OjDwxcLSZVMWglndskERE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaAe+8wUDAAAAAAAKCRB5vBnz2d5qsC6S
AQC7etAvbHHlFsnj6wgwjrG/cGQJbHPRaZYf5vTEW+XaRgEA+XO6x/xdNkJzv7mnaKQDAdOVsl/6
7iEQ2SSJ0b46xgM=
=Iui0
-----END PGP SIGNATURE-----

--------------GI4OjDwxcLSZVMWglndskERE--
