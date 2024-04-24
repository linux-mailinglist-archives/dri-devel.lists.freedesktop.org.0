Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569518B07AB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 12:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2EA113A19;
	Wed, 24 Apr 2024 10:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="yEY+E6nz";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="BbDx9wQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D2B113A19
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 10:51:27 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O6SNpe003788;
 Wed, 24 Apr 2024 11:51:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=LQnrXSzHZweEW4l3BnymPmIXZ2boMEw9+GL57mooJK4=; b=
 yEY+E6nz8blnlk2JWUnd1LQrjvovSc+YkRA4aI1tz9CmUe6ss2triTcSQHCRnLDa
 VuAns0xJvx0zjTF7AvKfwpAFeVxkTnSrEByfJcg4ysngDHU8mSdzdk5lhEpgnEOH
 t9168CwPJyoHsdA5cUn/DNq2fScYVjmYJMJBjn/y9oGpXzSAjmmC6Ove2EroON+x
 GYrCWdmpwoDn3AjGN3nE4IJImuapXPQ+f/z7aY8455ZRmcUrNm00A09dVaqXR2dM
 DsMphnaiIc2EEYHK3CobUWZeMxGkuZQ8BlBZoTMYk2ux/YuU1Xf59Ff+ulGF4X69
 K/Xbpn9K/+Po4jUO0byk4Q==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3xm3ynma4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 24 Apr 2024 11:51:08 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 24 Apr 2024 11:51:07 +0100
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Wed, 24 Apr 2024 11:51:07 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSvQLPNrY6J482oAlu+/hGRLX6JHVRSBFmhQoxIIObfsaz8rMAwUvl/LT9Z2DgDk5aha17scPO5EAV3pFck/PLsdx4cpGsnqsdf5WIJpDMJbnrJYuV8DH8h4GwPTdTUgep9Bt8pqoYS16k4zYNkHudfqX+wXg0jJAd3islE+cmQJWO25iqy7lJeDX2+ybFdnN3eMVkOPIJd52lbrRxfJnmujnelF/kRlzuh4QPe2R4gn5B9hLkQTw0luy7oXZqgQ6yTslvWui8i9drWbeMZE/25cEiD51VW8ZwtzUTLMx2cEBa5V51f+Q1BAZDdQH9puGweZys3pqSorIEpICeMK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQnrXSzHZweEW4l3BnymPmIXZ2boMEw9+GL57mooJK4=;
 b=DOplAjTT0lhP/616djIrWLVF6cV8LbfgyNGWJw3uP9zW85DDvIkJiHT8u2+2/RIk46MjlcHW0XD9c4V2LWKqtmYg11g4B3KQjJtf9qy/5Tjtpzt0rCqvdzOVle11IJQABYmj5AhRjJFo9WQvRcaxe4Pj19Q7EwmrGcKtP/x9vgfHiOAxRS/iACcEJmuDSg3z/+j+2MSMBsO1DuThN1LfZf/oafvbZT/GPxutNlP3t/2/IFbVK4tkEiq/dvcNtB6mGEKSMJPco55RE7Srr1harxM9A3UX9KZz0x0eK8ZZBg/XNLD/Q6F1D/C0TjlhOLR1yY02MoIqygpwRbpjSx8e0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQnrXSzHZweEW4l3BnymPmIXZ2boMEw9+GL57mooJK4=;
 b=BbDx9wQKVHHz682TAGkpKwC2d4kS0cc3XyILIq8VKPfMepEkh946iN5lhftFzkrSD4uQesNYmTqgp05bOu5DiUvORBxkkUuTInqIjgFmxGXB0BvRtrcef26aUEswVjhuJpO+RBACylSm1x9HtW4Lr+OYLiqNH/cwKCggbLEj+EM=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWXP265MB5179.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:194::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 10:51:00 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::fff7:ee16:98f:e762]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::fff7:ee16:98f:e762%7]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 10:51:00 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Matt
 Coster" <Matt.Coster@imgtec.com>
CC: "daniel@ffwll.ch" <daniel@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/imagination: Ensure PVR_MIPS_PT_PAGE_COUNT is never
 zero
Thread-Topic: [PATCH] drm/imagination: Ensure PVR_MIPS_PT_PAGE_COUNT is never
 zero
Thread-Index: AQHalZilaE7HTvidvkqz+oS3jgfrlrF3P0SA
Date: Wed, 24 Apr 2024 10:51:00 +0000
Message-ID: <d6efd3c156daf6dbae037c1170f8dcb08892a59d.camel@imgtec.com>
References: <489aa9ab-3de1-4bfb-aaae-b093536d16ce@imgtec.com>
In-Reply-To: <489aa9ab-3de1-4bfb-aaae-b093536d16ce@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWXP265MB5179:EE_
x-ms-office365-filtering-correlation-id: 032f41cf-d2de-4784-679f-08dc644c6dec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?UHFKM3pRR3YyWDM2ZDNrWGhZa2ZqdWI4bU9IZDhmdmVaUllLcVZoZ1FMdDFu?=
 =?utf-8?B?U25NQzNKTEJjcUU4anQ5STFHUmplYjdMUDczbnFjVW9YZUZjS1RQRVRQQkcx?=
 =?utf-8?B?ZVNYNGllci9YRHJyR3UwQThmdTBvQ29zaEFTYWNwZlBsZHAxUmVEQUxkbW5l?=
 =?utf-8?B?U2dqOElXU0NqM0djMTQ0S08xWUJRSzVrSzQ2YzJra3ozcWZDNDJnREpiYVZF?=
 =?utf-8?B?a3RqeUxEeGx2ckIxdUw3aEJhcUFZSjdtdHJDMFZoR1dteDlNMWJKQnA1M1ls?=
 =?utf-8?B?SWpjZUFKT2ExbVhrdFhublo5bllHZGIvRVd1SjlNMUNHeUhiMWpYanNzZVlH?=
 =?utf-8?B?KzlOSGZLaFdDVk0ycDNHL1VWZll6ZzYzeEpXdFhucm1MaStFOUtuRXlWRzM3?=
 =?utf-8?B?bWF4aW1VRDZDNEx2MHorakx0cGQzbGEreEpYZkUzNTNrdXdyOS81U2pzOHpB?=
 =?utf-8?B?OGZWMHFQUXMrM0M5b25XTzYyNWlYKzArTVRGTTlkNS9oaitXNzZESEw5WDR1?=
 =?utf-8?B?UStINWl4S0VTaE1hNFBzZVJ5VWZkYU9QV1E5dGNlTGxDdGRCa1BNb1JJNkl4?=
 =?utf-8?B?TXMzS0R0VGgzY0owYk1ySDAzQmRtdm5KNHhieU4xM2kvUHoyeXFQNFl2TzBw?=
 =?utf-8?B?b1kyd0hTSURoVTNDTEg1ekRsVjJxWTNwYVd4MjBQOVZnMjYzenc4bGRiZEJv?=
 =?utf-8?B?WlJkdktlaWtwaUJrdUxwaVMwYU5rYXFlOE1uOW9DZnBoRENQMEdMQ1c0cU1t?=
 =?utf-8?B?T1ZIRWNxTWRUbk42S2NPUkExY3dFRmtsVk9FamVlalRISXBIMUhFdVozY3Fv?=
 =?utf-8?B?VkxkVS9vY2xzQVJ2OVUwL1dMa2NGZEU0UEJLUTkwNlFZWlN3YWUzWGV2MjEw?=
 =?utf-8?B?ZFdwTWJzTDkrcXdRdE00c1pweWdiQTE3SFpIc0RUaG9mblhBNk8vNkhFN0Q5?=
 =?utf-8?B?QWs0R2VwR1pTQWlkRUp3TCtsME91OGFjMS81ZmFRMWlxS1dqN2hHYTlTYkY0?=
 =?utf-8?B?K2IyMDhRcUVKelVUWnFFSFZocUtjTFlsUWF2UzVKT2tMWURrcDd0M3FISURL?=
 =?utf-8?B?THUzRktjRVdtQWhDMEwrQ241R1cxYjNIRWwxZ1dLUDgzUDV3bXZCL3owOTZV?=
 =?utf-8?B?d3ZSanMrY25Ya1V2OUhMaWtDa0JNbzRlWTRtYjJtUURJNE5ZeXdZbUpXb0FD?=
 =?utf-8?B?SUl1MGFGa1hlL1FmWjVhQlJsYVFwTEoxdGFKL3pmYWlMNmZIcVBVZmNqaXR0?=
 =?utf-8?B?Zkl6d2E2amJkaW1JamJUam1pNEViTWtBKy9mQVR5b3lmT0hPakV6eE1xVjMy?=
 =?utf-8?B?NmgxWE9CQUJDYmtMMnM2UjB0RkpRUVh1azlFa0tkZi9BdDBOcDVoenQ1aERL?=
 =?utf-8?B?QndwV3hRWkhJaFZWd3crUFdTUlVmS0VZWklCcXJRaGRJWCtWUnVJbTJXcVRh?=
 =?utf-8?B?dFRoc2xUcXN2RmVtZmtmcDYxQXgxazRSeFJHOFJBL3g1YUNhdjZseVZ1U1oy?=
 =?utf-8?B?S3JhWjRDQXRUTDUrOFl6c09QS1NoZ1Z1R2gxY2hxcG1wNTRQaEhyMEZUS3BO?=
 =?utf-8?B?Y2o2Ti8wR0dpWXBDUWhsM3lrWmFhTmlrSWxZQzVIVVoxT2hVVVdUdlJwZEcw?=
 =?utf-8?B?d3JDUm9DNVRHM0NiQ3FyUDBpa1hRbWRQZ1VwMWhJeGFyVklkZXcvWVpUbGRa?=
 =?utf-8?B?aERaSlYwV0xBc2d5RVUzY2ZaSnQyN28wSFhlSjY3Z0gzSVN0QU83STdUMUxj?=
 =?utf-8?B?aE0vNS9sMVNmcHIyQlRyQmVpb2NVY3NjSjl4RXNPT2I0UjcvSzBGTUxuTEd1?=
 =?utf-8?B?WG9mY29JWDVYRi81dzh6QT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3A4S1RtcDZwUHBGbHV5dFUrclU4ckkzQkZmU0p2WHJnZGI5V0lUREsrdzQv?=
 =?utf-8?B?Y1RURTJ2REZsR0pyTDJsVFl1V0dVZXFUTnR2Lyt1V2lHUzdRNDRHQnhkdEZJ?=
 =?utf-8?B?MHJqMWl1S2g0ZGVHTFlCUXhWeGlMS0V3amk4Y1dkcDRIaVN4KzlhY1ZmZksw?=
 =?utf-8?B?UCtQYkhGVklOMlIyeXF0Zi9rRzZDRE9CblZCUy9lcTA0QzhWSjF4eFRZSmQx?=
 =?utf-8?B?YlV5M0hBUHdVM1lCYzk5a09aUmsyL0J4WVVTL2ZBdms0OFlmYUl2VDQ4STBB?=
 =?utf-8?B?cXNTVVNiR2hoTzRCNjNXYmRwLzhFOVF2SVhLa2Vud0l3bG9GYUM2enVKOGht?=
 =?utf-8?B?T25vSzRtU2hEQlRKdDFkaWk1UDZZc0QwNTJNV1VFV3dxZFRseE5sSk5OUFZw?=
 =?utf-8?B?cXRDZy95eWE2THlYMGZVSXE3YXBOSCsreWw1U2xUeVM5M0FHaVVxeVJBbmxa?=
 =?utf-8?B?Nkh5bFE2SVRxdnFrRDRVUGhlRmhOQUU3ZjFkYW55Tko0Q3k1ZG5TQis5cGYy?=
 =?utf-8?B?T2lFWVJIb01ZN2JzYnd3Tm0ycGdVL2cvTnphc3BBenMrUmpHQ0FLL1BUUXIw?=
 =?utf-8?B?NTJ6ckhFMW5RSUV4a3NnTWZlU09telVTMEM0NERFKzdoWWF2LzNhb2pMWWVw?=
 =?utf-8?B?S0FERUVVMEN4bU5SY0xQMzRKOS8xbnEyN3c5YmthV2QrY2FuSk5Dak1kVEFP?=
 =?utf-8?B?dlovTnZQRkxUNWtXeGZQemNxblNqQU5hZ1pMZTVsazJvZmNGWEhYRDVpQzZp?=
 =?utf-8?B?M2QrVGYzWVk0a1diYjE1RjdrajUxOUZKSUtabG1kWllrZmFyQmFZcE1hR2s0?=
 =?utf-8?B?elZWZ3gzYVVhQXdHdGlPOXFMVS9CVkxoWGtYU0k3ejdOaFJxc2tTaG5nZlBO?=
 =?utf-8?B?U0FqM2dxR0oydThiTFNhTHZlajl2KzVmbFVJTlFFNnBvaktuditUc0JBMDFu?=
 =?utf-8?B?K0R6VGhLV295cmtxZlU4WS9rNVd0QkhmbFRtUDBNOTEydFJIdjNjZCs3QjVv?=
 =?utf-8?B?ZTNNNjNBWmpDVnlFcVlxRFJIZE84MitQaVFRZ0d3dUVvS003SkkxR1AybDhK?=
 =?utf-8?B?angwSXQ1d2w2eFFjd2FhbHFzb2lnZzhhazZ0d0pQVlVXa1VEVmFTR2RDNWtL?=
 =?utf-8?B?YVZUaWd3amdyYi9IV3RRSE5KQTlZTWZDVENtV09NRU9XUGFjR1pydm1hZnVH?=
 =?utf-8?B?dUg4NHdGbmN2U2NaNEtHQWcybC9EdEhWSzE1NzVSS3ZIeU9jVU1QMTRsdEF5?=
 =?utf-8?B?WFZKWDA4NGd3QmxLTUdDQ0wxNVpzdThKSktsVS9vbHU3aUs5U3NUOXlDSUl6?=
 =?utf-8?B?SEl1aWxneU42NzRLS3d1S0k2WER6Tk1NbzdxTUxZYURhYzVIVEJ0QXJ2aTIy?=
 =?utf-8?B?OEZGeXdOS3hnYmRaMXdHb2VNV00zQmR0REhCSHlqdFAwV1pKbEtubU56Ynkz?=
 =?utf-8?B?dnZPR3hrWndpVzhjWTNOTXJCcmVmb2g0S3haRWoxZTNza3ZtY3FkREhDbG0z?=
 =?utf-8?B?WFJCbDYwZDJjUC9PeVFaZWRtelYwbGF0bVlpYlJZbiswVXd4NmR6cjhRNStR?=
 =?utf-8?B?VEJTUW1aZkRtVWpVWTRYc21CeTgvKzMrUUlaZEtYUXNBb2RhMEpZcVFKUUd6?=
 =?utf-8?B?SjZkZlQwOU51QjZvdEVaRWFxY0paWWErdlVQaExBN05Ca2piVlk2R1dZU3VC?=
 =?utf-8?B?MkhKZTBZaFdoVzNuUjA4YzBrTkVQakgxWXdsdmVqK09KcEd4VHdvZmxQVXpC?=
 =?utf-8?B?YzVGcU42M2hmUXdtZnpJVUdnNWdoNjZIL04ydFUxUW9yZFQxTVh6VmNoTGxa?=
 =?utf-8?B?N3A3aXg0dmhqMFRWTXZ4YnFUSzhlZ0ZEc3lZTU5zRmtwbjRpQnRKUEVYZURT?=
 =?utf-8?B?c0owREdCNWJNWnhZOG11SzZCY3N2ek8vY2FQTG15cTByMWdwSGRpQms2Y3Fv?=
 =?utf-8?B?UTJnOExDUkcxMTRMM01adkVkY1JBSUtCYk5YTkFaekFnTHZPMTNEb3Q5U1g3?=
 =?utf-8?B?cmxIcWUxSEMzcmhKRnBGUjQxbWlhZm4zalIrSTJmNmx1a3lMNkxHVjcrTmJp?=
 =?utf-8?B?SlhxTVNQd3UyaUR5U0NZNHg0RE5hQTE2QTVhQi9PMmdSRHR6UStWQzdyR0o2?=
 =?utf-8?B?VXdHVThwVXBIc1Z2Rm9tbGlET2YrVCtLWWdOOHd1Wk1SYnNNb1lXUWEvQWFo?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AD3D8A6C59DD041B5145B6D84992F39@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 032f41cf-d2de-4784-679f-08dc644c6dec
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 10:51:00.4004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x0CI5iPTNnWM2yv7+blJ395hbgO8Kj975qP1AJ9k2fQzPF3gi5zWg66HhOxtbD9ME/UoMBOEGixcjVW0Ltx0PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5179
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: vDfv3qr7WHLBBVblohhsXGSAxbzc99XX
X-Proofpoint-GUID: vDfv3qr7WHLBBVblohhsXGSAxbzc99XX
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

T24gVHVlLCAyMDI0LTA0LTIzIGF0IDE2OjA5ICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
V2hlbiB0aGUgaG9zdCBwYWdlIHNpemUgd2FzIG1vcmUgdGhhbiA0IHRpbWVzIGxhcmdlciB0aGFu
IHRoZSBGVyBwYWdlDQo+IHNpemUsIHRoaXMgbWFjcm8gZXZhbHVhdGVkIHRvIHplcm8gcmVzdWx0
aW5nIGluIHplcm8tc2l6ZWQgYXJyYXlzLg0KPiANCj4gVXNlIERJVl9ST1VORF9VUCgpIHRvIGVu
c3VyZSB0aGUgY29ycmVjdCBiZWhhdmlvci4NCj4gDQo+IFJlcG9ydGVkLWJ5OiAyMDI0MDIyODAx
MjMxMy41OTM0LTEteWFvbHVAa3lsaW5vcy5jbg0KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2RyaS1kZXZlbC8yMDI0MDIyODAxMjMxMy41OTM0LTEteWFvbHVAa3lsaW5vcy5jbg0K
PiBGaXhlczogOTI3ZjNlMDI1M2MxICgiZHJtL2ltYWdpbmF0aW9uOiBJbXBsZW1lbnQgTUlQUyBm
aXJtd2FyZSBwcm9jZXNzb3IgYW5kIE1NVSBzdXBwb3J0IikNCj4gU2lnbmVkLW9mZi1ieTogTWF0
dCBDb3N0ZXIgPG1hdHQuY29zdGVyQGltZ3RlYy5jb20+DQoNClJldmlld2VkLWJ5OiBGcmFuayBC
aW5ucyA8ZnJhbmsuYmlubnNAaW1ndGVjLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pbWFnaW5hdGlvbi9wdnJfZndfbWlwcy5oIHwgNSArKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2Z3X21pcHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9p
bWFnaW5hdGlvbi9wdnJfZndfbWlwcy5oDQo+IGluZGV4IDQwOGRiZTYzYTkwYy4uYTBjNWM0MWM4
YWEyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2Z3X21p
cHMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2Z3X21pcHMuaA0K
PiBAQCAtNywxMyArNywxNCBAQA0KPiAgI2luY2x1ZGUgInB2cl9yb2d1ZV9taXBzLmgiDQo+ICAN
Cj4gICNpbmNsdWRlIDxhc20vcGFnZS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L21hdGguaD4NCj4g
ICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiAgDQo+ICAvKiBGb3J3YXJkIGRlY2xhcmF0aW9u
IGZyb20gcHZyX2dlbS5oLiAqLw0KPiAgc3RydWN0IHB2cl9nZW1fb2JqZWN0Ow0KPiAgDQo+IC0j
ZGVmaW5lIFBWUl9NSVBTX1BUX1BBR0VfQ09VTlQgKChST0dVRV9NSVBTRldfTUFYX05VTV9QQUdF
VEFCTEVfUEFHRVMgKiBST0dVRV9NSVBTRldfUEFHRV9TSVpFXzRLKSBcDQo+IC0JCQkJPj4gUEFH
RV9TSElGVCkNCj4gKyNkZWZpbmUgUFZSX01JUFNfUFRfUEFHRV9DT1VOVCBESVZfUk9VTkRfVVAo
Uk9HVUVfTUlQU0ZXX01BWF9OVU1fUEFHRVRBQkxFX1BBR0VTICogUk9HVUVfTUlQU0ZXX1BBR0Vf
U0laRV80SywgUEFHRV9TSVpFKQ0KPiArDQo+ICAvKioNCj4gICAqIHN0cnVjdCBwdnJfZndfbWlw
c19kYXRhIC0gTUlQUy1zcGVjaWZpYyBkYXRhDQo+ICAgKi8NCj4gDQo+IGJhc2UtY29tbWl0OiBl
OTU3NTI3NTJlYWYwNmM4NjA4MTFhYzVkZGY5YmFkZjZjMWI0M2NhDQo=
