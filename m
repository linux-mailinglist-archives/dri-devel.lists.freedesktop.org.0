Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0733BD920D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0430010E5AE;
	Tue, 14 Oct 2025 11:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="mnMhLVIJ";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="XWelTGTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A78110E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:53:09 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59E5o21n3835823; Tue, 14 Oct 2025 12:52:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=8QL0PrPKuKHi8/BMZPkW2KGuP
 qztl3noJsQPDH0bGug=; b=mnMhLVIJXQSoh87yAi9WfGGOw9iWJgbNUjaykv+Ux
 6SGroHmZkxW29mIvMjLGVjgfHiZy/NhPz6SN8GyzDVrspqgtOEtm4BMYH9BxaBAK
 ItnoeNDXhVIxMVi03/ClyV5lMPULM+t3QNIhoh7xL35vCEvl+5C94xnSNiDn2TdQ
 RCT43jrXignCY5ln4I4LbkWNLxyRjl129UKYSSRvhveDJCCBeaqAkPdXob1PqVyT
 XoLDJhLBkTWpnT0XpH5rVT8bi22vhos2ZYIqhHGd1xP+fFLy146er5qA73vDHqa6
 xunC0gWgp5CvMBAZI3w24OpmbeE4ik4JZQH9hugJ0SX4w==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021115.outbound.protection.outlook.com [52.101.95.115])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 49qdgn2xxw-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 14 Oct 2025 12:52:52 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pu9q0xBtz008sEaKl0oHclwnnoiGnkyOifkP/36Vti9EkB15MhMtjmXcRPqeXL/0RpirYdhzUcvagda2NJRFIZtAUSYzrltyHZcPnnmPGixmXjv6pXEFLJ44ABOEQOgyPFYbW0fHA3aViT8zXQLw0C2dbMwmgbffIyOP9/rXSdPKBy2lvyk4Ht4imtn981jCxHjEcIFKU5uYQENrraZTcgFaI7F7s7hUdjlsNcgpLUfV4iHSDmbi8hDxDZCnlkVIWIQO5PONTV3jEPm89qfEv3Qbc9kD+g9pqN3e4BcmyEfBDQ0WwmRafiASA5ssc2apkhnuIAru4OVfF/7oqlRa0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QL0PrPKuKHi8/BMZPkW2KGuPqztl3noJsQPDH0bGug=;
 b=uCBzDlPZLO9bCFZr5MRO/smJoG4lxw314BgWSs6EiqcZ0YrnJZU2yY8b/75lTOgBQLm7zXRaEFJIpiIXT+CcooIJIR/i+QVmgs9lvy+KDzQM3Z5/V84rB77MrudreSFwkCWl2omtiVc/fJ65KrrnV5AgU8+v1RFndvvhexrdkCZ4ruRT9qaJ6eycsVThUIPZJML7VaKVEeWq+Of57otGdNsxBbQNJH6gXq763hG/0U4g2hvWxJBiNB8/z+RqR3yL0TPbkOriwkG9/Iyi+oAfR/WQZBB/ao/xNgbzlWkptAfZmWhsupugwn5b9Up8bUtVfBgMvv0WX5YLzys6bf3WYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QL0PrPKuKHi8/BMZPkW2KGuPqztl3noJsQPDH0bGug=;
 b=XWelTGTmGstbvMlnEyEwF2L/uMrX0KRa9tK0JyrFl0YuxKx3xOWtO015FVBk/XFcmzHAQNZrt5crICNdxBsRTmMc6T4+8uwkVHCLSb1UTf2Cf87D9wQiAVnMSY2iwEUYkXQLG1yCU7pNZfDoeKKKXXGjXl6DW/0AoyZdH3fT4Mw=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO4P265MB6556.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e2::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Tue, 14 Oct 2025 11:52:49 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 11:52:49 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, David
 Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, Alessio
 Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, Rob Herring
 <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
Thread-Topic: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
Thread-Index: AQHcPQEQSCmSLRjXXkGNw3XHvZtNIw==
Date: Tue, 14 Oct 2025 11:52:49 +0000
Message-ID: <d4ec2cc2-882a-4842-ad8c-42033ceb2bc7@imgtec.com>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO4P265MB6556:EE_
x-ms-office365-filtering-correlation-id: e4d0f724-952c-4d7f-8776-08de0b18330b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YlhrWnoraHJnQzVLV2pKb205MHJNMnBTbjhiNzlBbm5Obm8rR3JTcjB0TW1N?=
 =?utf-8?B?WHcrNGpBTHNzRDNuVDU5bFZIVFl6RWNGako5U2tQT0VwSnlsK1VJQUlIQW0w?=
 =?utf-8?B?eXNmOU5KZmhmQkRSMWw1UlNQUkpRS0EzVUtuUVlFckI3bFNJcGVpTjNFN3Ry?=
 =?utf-8?B?M1lOY3loMjY2TXBBdEYxSnc2OWZHeDRYSzNNaytwaU9YZW9IekNOdHBqam5w?=
 =?utf-8?B?OGY0MW9TL3BFTUZrMGt1Ri80enF0TUJHdXF0b2d1blpLbzIxVGd4OUVRS0dU?=
 =?utf-8?B?b2lnQ1FCejNaa2ljN3F4RTdzVHplRFpUY1k1VlpVdzRYa1gxM0h4cGZocWt6?=
 =?utf-8?B?MDNUM2dUdm0yeFJnTTBKTGpVNXlKTXFhcTN4UUVKYTB2QmdlZXVjZUVYNHJM?=
 =?utf-8?B?RWNIZkxDOXlNTUV2QUI5OThveUl1RzVDWkx4dzkxWVRLbGQwRDZHa1lmUDRR?=
 =?utf-8?B?L2hnL1djSUR1TE1hMlFYV3JmS0RtTlNqeWx6V2VBZHQrVDJPTzliM3RBNk1R?=
 =?utf-8?B?eU9KN3FwaUwvSmVkN3Vtdk40OVpmN2FadzF6Q1BkbjVNUnhhMGpjVThpbGR4?=
 =?utf-8?B?eEFrYlhKNDY5NW1JM0l0c1pYZUNCa3JuK3U4VDlQcHJkV2N1ckhBQ3o1WGlW?=
 =?utf-8?B?ZEphbEMvQllIN2p4NFQwMXNhaEV3ZERRY2hQV3JsRW1yT0d3SGtDdGU1MU53?=
 =?utf-8?B?S0lLem5YNFg0aEFRNXRQUEF2Q2JZVEhVbVg2RktlWnNXb255T3VxVVhBM1Ev?=
 =?utf-8?B?cnFrTVlLVFdxbjJBODRYYno0TDJPeFlqMjhZSi8ydnZpZTh1dkcrSmpWcldT?=
 =?utf-8?B?ZmpyOFlsM0F1MmNjQ0owKzFNVnZOcitURURacTJpZDB4ZlVjd1d4TXo0ajY0?=
 =?utf-8?B?bkFyUTRoV1NsQit5Y1ExRjkzMko2STVuZDh1NFd4VE9ESm8rMDAyK3Q1NUE5?=
 =?utf-8?B?TGoyRXIyM3NkRnJvaFBqTDFFYldGWHMxQkJtWU9jZmhWT01mRHlpUHJ4YnVB?=
 =?utf-8?B?TWUwNHpkeFVVaEpGL0k5ZHo3TXdOZ3NkRG93c0hTaVJTcTdXYXBOVzF3blBi?=
 =?utf-8?B?RVU2RXNVZEdsUlNIQTNaaEV0REkyTUdGY0JNRmdMNW5BZjM1K0hrMmVIc1lx?=
 =?utf-8?B?K2kzU1huY3p0WEJFbnFNODJMYUFITUdhUHZ5RzhHMmlnNnNKQU82SjdKdXpB?=
 =?utf-8?B?M3NtZ2xob283b2hYdGNRK1ZWRzc0UGhwVlk4SDNOMkE4dlJMZDZDNStkSU9K?=
 =?utf-8?B?NzV3bWpWWWp3QTVkS2xyL3IrUTg0MmUra0lpUmF1R0ZpVjhuSm4yUy9IQ3JY?=
 =?utf-8?B?TFVKUStFSnQ2SjRNNnRKQXpKT0toT1BURzM2SE81NzUyRXRKMU5wd2hVdnEr?=
 =?utf-8?B?R2txUllDcVdLZVpvQUYvQVQ4QWp2YWcrUkp3eDlnYVVaaVBtMzV0STBQTk45?=
 =?utf-8?B?TGJVNHk1aU5BbEN2eXJLcHJOZDlJY0VZN1lEYmJkcVEwRkhXQW9CUWFZSSt0?=
 =?utf-8?B?K1ZkZ2ZaZnJSRmQwRjlZdGUrRWlGa1RBV3c0SVpTZ0txL1l4WDdlQTBQRlkw?=
 =?utf-8?B?V3Q2Zk1DZ2g1Y2ZjRXozbFk0eWdQcjR2elRLaEhhYlF1V0h1RjgxU2h6bDNz?=
 =?utf-8?B?eklKTVA5VWVMaFN6WkpIWmcrL0llaUc2N1ZEdW1sV29hR0k1WTM5R2M2VFpL?=
 =?utf-8?B?SVRLd0FXaEFvK0UxK3pBQjluZHFVNTFaN0JuSzhTYzd6TThxL3phdGQ5enJw?=
 =?utf-8?B?TVVxOWM3U0dWYlQxZThGYTYrcnQ3YTdsY3pkSUNaTkxuVU9Ba2pxbnU5Mi96?=
 =?utf-8?B?SHFlSnBsRDJkMG9vd3BEekk1UlR2cUtKYW83YTk1anplZ0cyek4zYzB0Z044?=
 =?utf-8?B?SHMzOEVMVGRUdHBMa09CdFp5UWVtR3NBTS9Sd1hsdTh2SURmVDIxYld0akNm?=
 =?utf-8?B?ZXNNbysxaXpUYmFEMlR2RFhOOGQvd2JtbkZzc2x0YjVyQzgyM0dyaS9sbXdM?=
 =?utf-8?B?bFQwS0dtZmdoR0VNQ2hUQnVSakk1UjBvQ1ZCNDZYdndCZXVyWURZSFEvTmJx?=
 =?utf-8?Q?yuXA5K?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(4053099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzlDUEpkdVppczlXOHZaQjNGSERkb0VZbDgxamt0eHgwNjgzVWFSalRRNnZG?=
 =?utf-8?B?cGptTnlNdGNkWkZMK2E0bVRwNmZBU2YzOGVxSEZkcVZyY1FIendvbndIN3NL?=
 =?utf-8?B?RWhKeEovWktuTlBqRGNpMU16YnB6alhlOEhDbnNCZ2pjOUJrM25GVDZuMUJ4?=
 =?utf-8?B?RldMUnpKNHNqNlpSaDl5SUh4VmFKWnpTSW8yMDczUWtQdEdadmtkMkMrK1FX?=
 =?utf-8?B?MlVSOUFUZndTRkRsZXdteGNwOUpUSkt2ZVFRTzZMWUJtZkhFK0djWUlsR2Rm?=
 =?utf-8?B?c0owOTNKdzVqMkM2dE9VMWthN2dyTldHZlRUZVo0UU9sc1diOFJ4OXV6UzEw?=
 =?utf-8?B?d3pSVTZqZ00xUDZhUXpMOG1DcFp1WWFGV3U1cmlqaVlsM09uK08rT2FabVA5?=
 =?utf-8?B?ZUxYd3h1VFZ2R3FkVjZqZ0dzaTM3N2tkYXFVU1cxOFd2ay80YVd4cU1ONVFs?=
 =?utf-8?B?bytKQjlHdUJCM2NSaVJRRGFzLzhIejdwc204RDdQUlh5Ykk5S1NlTStCd3dN?=
 =?utf-8?B?TjRTcmNZSHB3cm12SGY4WHQ5YkhnUTVuc2h1Y0MwWUlSMkQ2R1RXaGJFRm5N?=
 =?utf-8?B?bWczWm1IU1R2dS8wZEpxUC84VEp4Q3NYVkJRMC9jVUk4VlFpRjJLUHEzR1Jj?=
 =?utf-8?B?TWR6eGF0ZFczUEFaNGR2UWRYUHJ6WjhYMjVDREUxV1NJeXBPdjhEaTlybk9U?=
 =?utf-8?B?OHI5TllPTW5jdTV4dFdock4zZEx5WXRoZ05OV3NDb1FYeHhLcUc2QkYvRXZt?=
 =?utf-8?B?TEppQ2ZpZS9HbHUwY2JyLzlxdVhORWNObVk0N3JLRklObEFSMDIxb3R2Yko2?=
 =?utf-8?B?OFpiZ2x0UjJRSFZtTkoyYmxLRlkxWG8vbnFUUnFoV2ZyQndYbHFFSnhvcUtO?=
 =?utf-8?B?VXdvZDhsQ1c4QzNKVHFONzFnR09GYm1jdUduc2lJNTRibzFwVFJYY0FKZHhm?=
 =?utf-8?B?OFdTNk55dFlOd0NzM05vd0NxKzNOblR4RWcrMTZnMnRTZzYzMnJvZ2xsakRa?=
 =?utf-8?B?NE90OUl2OUZ6VVN6MDEvVVFJVzNuaU9GNEZtV25wRmNYZjJadFUwdXVpQ3lh?=
 =?utf-8?B?dFZVc2drRkdBc0txSDlGa3lBRjVjMG03UFFLZG56dUkxZjV3V1M5UmRneXhW?=
 =?utf-8?B?NzNPb2QxQUtvRnJCQVJjdkJKaVpSS205czZQdkxDRUhZUVB2M2FQZ2RGa0hh?=
 =?utf-8?B?U3BtbFc5TVZETWhWZUNEaDkzQlZuYlJhb2p3ZTlTdWtBRkw3ZVFhWVlWTm94?=
 =?utf-8?B?NzBPd3IrTUNDVEpTSC82Z1RBejJIOHdJMDhPdytvQ3o2ZTNJNWZUWlpVTlBJ?=
 =?utf-8?B?SEZMTnQvRU9Vc2o3WE9aeDdLcW5FVzd4cW1ZeDZSZ3BhaytLQy9lUVhjU09u?=
 =?utf-8?B?ZDlVZDdqTHMzUDZ0Z0ZqeXNGU1J2RHc5cDFpRmo4Q1pURTE4MW41TFVoRm1T?=
 =?utf-8?B?eHZab2lOSWZYYkIxcXl3Q3dpcHFzN0FWU0xpKzMzQ3Q2N3BHWlAxTit2NUxW?=
 =?utf-8?B?NUJrUDAzaVMvWjVodkY3SHMwb25YajBVcHpNbU45MWFiSjdybWJVQjVQdmJl?=
 =?utf-8?B?cnBHRUs1ZEdlZTZDckx6QXplL3hhbEg4TVlIU01QSUNUUUtycEZUNWlPOVBX?=
 =?utf-8?B?SWlnYjUxUm5wZlAySm52WWxkL3NWSWpOcUg2cWM3cXo1SHFUWFhLSnFlTGlU?=
 =?utf-8?B?WGJBczJVVzBNeE45M21jcXZYMk1YWVJMMG9FS1ZpSTJ0OXNtdkIzbUgrbXJL?=
 =?utf-8?B?cy9JT01HUFhzR2lPbHg4eUlaeWtoaW9rYmUxMmdaKzl6SXQrTGdyNGlxN2dT?=
 =?utf-8?B?cFFCbE9uUCtmRG1lbFVaNUJ4Rm55a1FHd0tmMjh5VDh4QmpvODVYNVpQUUJs?=
 =?utf-8?B?aC95TDFKT1UydEh6cHZNUmtVY3RDTmZ2WEpPU0V1YTNtalM4OVNqWXR3R2d0?=
 =?utf-8?B?UVlwdlYwMExzMkltNGlrdFRsMDRhRkRxbXIxM3VHQmRMZjRVMFU0YmhadFNv?=
 =?utf-8?B?SnJFbllGWVh4R1laZmU5RHNpbzlGZ0lmZjB3Ym1ESDhUTm5KZFE2eXpOVDkr?=
 =?utf-8?B?OGN3ZS91Nk5SY2QrazNpSTNKWU1ETURHdEJEQUJzWElPK3pwakVmREtZSVJR?=
 =?utf-8?B?NUtwbmp0QlRUUFNDLzlyd3ZiQ1FKNDF6eHFVQ00yWVNaZVVOZ2w3SUowaHdi?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RTOkVgZiVDEI6JGIP7yqqGXE"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d0f724-952c-4d7f-8776-08de0b18330b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 11:52:49.5874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dWreifvi2opHKOH5JwU48kF/XRbYFxAEb/YXZUfkylStdEbLO8Foqi1lL/46LvLA5bqsODKFr39tSBlkEcTIPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6556
X-Proofpoint-ORIG-GUID: SvSj_NrmuXVaBqVYPQLt3GzTeIHOIsGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDA5MyBTYWx0ZWRfX/lUBudbp5pWY
 7bmD/bkIdsrkbL/T934rntUc1ia0FyTk9DwKwluwrpR+BymbkYWs+5WPxmgcD8b7y2iCoQP9Lt4
 ngfU24koQz1ojLXeA2xwXlz39YUV5ydmwlnKPo4V/mCRIY2R9RZL6MVPp4UpEP6i9O5/wx/w4MA
 mwNiGVzV5ZKWGAHB57H2g7hKGLQnbNKRcz4XnTwC52MPJxidlHRw2KtIU2cg1z7lgMd6AZmSXQv
 HPQjT2gSCuvKlHHnH2llz248sELa1JZFjRBEQohDI9yCAcY5mt/U4WPzrBypqI5pStHZ5TkWT2B
 sZDc8DKND6WjoAT2GCh6G5VNb/t2fsMn8ezBxTg+LN5Nkylxxh/qSBfyNda0lMpQMqJCf8o3cDB
 V/jgLcJCQZRXQe+1UfeTGNkj5V+3ZQ==
X-Authority-Analysis: v=2.4 cv=H5PWAuYi c=1 sm=1 tr=0 ts=68ee3995 cx=c_pps
 a=VV8/NmQTY6T8LX25TfDSnA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=yC-0_ovQAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=HwmaPvt4cbKsgEULfvwA:9 a=QEXdDO2ut3YA:10
 a=9MIGEPR3VM65bi6w63sA:9 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: SvSj_NrmuXVaBqVYPQLt3GzTeIHOIsGN
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

--------------RTOkVgZiVDEI6JGIP7yqqGXE
Content-Type: multipart/mixed; boundary="------------0KTB182XE31koXP3ny3KHuyR";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Message-ID: <d4ec2cc2-882a-4842-ad8c-42033ceb2bc7@imgtec.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>

--------------0KTB182XE31koXP3ny3KHuyR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13/10/2025 20:01, Marek Vasut wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W SoC.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a77960.dtsi
> index 6d039019905de..4f7b2e838c026 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -2565,6 +2565,18 @@ gic: interrupt-controller@f1010000 {
>  			resets =3D <&cpg 408>;
>  		};
> =20
> +		gpu: gpu@fd000000 {
> +			compatible =3D "renesas,r8a77960-gpu",
> +				     "img,img-gx6250",
> +				     "img,img-rogue";
> +			reg =3D <0 0xfd000000 0 0x40000>;
> +			interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 112>;
> +			clock-names =3D "core";
> +			power-domains =3D <&sysc R8A7796_PD_3DG_B>;

My comments here apply to the other dts patch (P3/3) as well since the
integration appears to be identical between the two SoCs.

There are two power domains on this GPU and the SoC exposes both of
them; no reason to fall back to the single-domain scheme here.

I know the sysc driver declares the dependency of _B on _A, but the dts
shouldn't rely on that, so can we have:

   power-domains =3D <&sysc R8A7796_PD_3DG_A>, <&sysc R8A7796_PD_3DG_B>;
   power-domain-names =3D "a", "b";

> +			resets =3D <&cpg 112>;

Is this a reset line? Is it a clock? I see this pattern used throughout
the Renesas dts, but I'm just thinking how this will interact with the
powervr driver. The reset line is optional since some hardware
integrations manage it for us during the power-up/down sequences, which
appears to be the case here with the MSTP control (from my brief dig
through the Renesas TRM).

Related, see my comments on the bindings patch (P1/3) about how clocks
are wired up in this SoC.

Cheers,
Matt

> +		};
> +
>  		pciec0: pcie@fe000000 {
>  			compatible =3D "renesas,pcie-r8a7796",
>  				     "renesas,pcie-rcar-gen3";

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------0KTB182XE31koXP3ny3KHuyR--

--------------RTOkVgZiVDEI6JGIP7yqqGXE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaO45kQUDAAAAAAAKCRB5vBnz2d5qsGIA
AP4yZG2Lx9KJbPgW/h3huYxk3vuJ6yf+3yOAd1Mv5gSO3QD/RzzCbJ6cS2vUGnzDuden8qz/E1T4
7plXlDC7EWe7GQ0=
=AsP1
-----END PGP SIGNATURE-----

--------------RTOkVgZiVDEI6JGIP7yqqGXE--
