Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5630691EDF3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 06:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A98E10E0DE;
	Tue,  2 Jul 2024 04:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="s1eLJGOY";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="Gz6/aN2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4D910E0DE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 04:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1719895704; x=1751431704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=t43l3q6Oq2Nvq/znApQH6JQjoKSN/lWiK7Tc1oAujIk=;
 b=s1eLJGOYHSZ/4CGoEwsdcR6rM4joxeWgMjoj/yfONIEIJ+gWDMptxcDL
 Fcw2uHs5RzK2FchmyYPmReAIRIFPijzil1uFG4U3NIK1RT0fUcDfIXfZB
 B+VMoPp6Ld6AtoxYGjf/qL74RpYc1e6nMJUaQpCScbPDyPM/ozu/63xeT
 j8oS51vCgo+2gEOHaYR/6SR/L1IZSAvko361lz5vOWVpmEaMgsql0tAtn
 TTCUCKM0f0TxmzGcYzuh57hqVHYinaklPmcviXkiu/wdSgRyxr3S1I8MF
 VxQYriOamquNJabJgjsPuX52u4hHoMUViVuFxcR0FPRSOPeWdZpPWlgrJ g==;
X-CSE-ConnectionGUID: pE0Gq9YcQTW0XH0Dw4+eag==
X-CSE-MsgGUID: UM+VkKWXTK+zZ5HXDb5anw==
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="196132114"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jul 2024 21:48:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jul 2024 21:47:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jul 2024 21:47:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KifTpNeMYpVc07n1UK9yHfgy9VhSVXd25BJjqAcra+1Wf+2Yo/TR44JqPgHuV8gav9zSfuKTOLqAw6khLz8s9n50Nixz9PKX02E6HEA6ENpFZCioJHiv/YQ9Jube6CT0MWxJ1p5dfDV336Rh/FCEuRXCQW73XdPBnJ7CBUcvbCTIPApOO6A+siuGEOxpvT6XQpDCr4piIxONkQ0JKx3JYSJ7QMQMNBvaQ0slVTEXuXcqf0sCcqVltGAOlLSupgez8VdU0jYSMv+JLxLk524k/thHZ+qq7c9c1+g5dek2JSUQj8KycsipaRJefUOrV+nHHX0sy6A7qV6gbbnoR6pXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t43l3q6Oq2Nvq/znApQH6JQjoKSN/lWiK7Tc1oAujIk=;
 b=QkA9WkkRrcGwzeWxGFY4KnWg7+O1blwb3c6Wtwm8ts7TyZyFzaHfbqL09AfObqVMKzz6AZoG4RSaNLIhBoe4MxveieMWnnLK64fVeVhwVpS1esmQoycsV0bWVAqShbE9HNv9SuRK1rHxHFdV/9ILJ6oe6vzfDnVLLnSSq4UKgF9amgmDjUlQzYqO7vhK5BHrcuRIhe4ujr1+t5UA+e+CwutuBjXmgcf/8ROlbQc/qM36kZ9SsmWAc5d3HucxQZsjHFtCNBnnQlpg889YuMf62ltiQoQb+AtCwdcgrjiw1UBPchCwZu2iCjw4PvmcZVw2MrXI4MKvpJgx4P5IRckDPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t43l3q6Oq2Nvq/znApQH6JQjoKSN/lWiK7Tc1oAujIk=;
 b=Gz6/aN2yl24TnH2ofVq2vw//2ko8Wi4w/JFEP7uV0q5kHRg3T8jN2+Sj7olaYECsTqZNOQYaY2FZeIjaq2D8ueiahWWEU/63bv9/TncUpG/BON58waEnZlvI97wo/EaD7MZofTqcH50VZq8s5T6AXCl5g+AC71l2gPlHX3/oXV46WnULx+mGSdOlAF2Xyeep02xwmRPNCDDcp9BIfSYw6RXA74/eHcV6EntWPneSEsDWm2vyoCGFPUiq0lz8HOkgWZBcEcgDk0jXX5xroq4SArrJfbjYCm/1A+r4rE9hqqFPe+bwKPGrNTJMeWJn+aGA5TsfGLOxx9KNZRaVUPk0hw==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Tue, 2 Jul
 2024 04:47:40 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7719.022; Tue, 2 Jul 2024
 04:47:40 +0000
From: <Manikandan.M@microchip.com>
To: <conor@kernel.org>
CC: <megi@xff.cz>, <javierm@redhat.com>, <neil.armstrong@linaro.org>,
 <quic_jesszhan@quicinc.com>, <sam@ravnborg.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, 
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: himax-hx8394: Add Microchip
 AC40T08A MIPI Display panel
Thread-Topic: [PATCH v2 1/3] dt-bindings: display: himax-hx8394: Add Microchip
 AC40T08A MIPI Display panel
Thread-Index: AQHay5TudRMYOyMC2EKaYea4U9suC7HhpI+AgAE6M4A=
Date: Tue, 2 Jul 2024 04:47:39 +0000
Message-ID: <d83e8a51-953d-43c0-83eb-c1a528f9009f@microchip.com>
References: <20240701085837.50855-1-manikandan.m@microchip.com>
 <20240701085837.50855-2-manikandan.m@microchip.com>
 <20240701-preset-shredding-409ef0d80ca4@spud>
In-Reply-To: <20240701-preset-shredding-409ef0d80ca4@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|MW4PR11MB5870:EE_
x-ms-office365-filtering-correlation-id: db7c411d-ed93-49fd-fe9c-08dc9a521a5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RUtRV2ZYckZLd1ZYbWVVb0JURWhxM0xMbDhwQWZzRnlzTEVMZk0rWjI0Q2lP?=
 =?utf-8?B?R1N1dm1HdXhRWjZDU3dEVHJJclY3dm1aSW5LOEhGQWFCUEh6SmRyWTY0M0NX?=
 =?utf-8?B?L2MzNEJyZjA3RlRDUUpHY2tMdGhEZGZxaXh0ZE5EUk1hNzVRbnlOSW9KMnFi?=
 =?utf-8?B?TnlUdzRBdkptMk9yTnVnQTNSelRDTlliTm9iMWYzeXJCdmV4SHFUNVVZZ0dG?=
 =?utf-8?B?WXdyT2M0TFI0eXdNMXNKMTZtYWZiM0ExQTRNYlFmNkhsSVd4NHFRUFNaNE5q?=
 =?utf-8?B?MWErUHhmL3UxUmRLY0NrbVJWcDFyajdaeFM1M0VMd0orbHpmZW1NYjQxWkI5?=
 =?utf-8?B?ZmRmMldwdXJyNlZBcndGQkEvZUJleDhiUjlldEk3eTdWUkpqVW1jUTRRK3g2?=
 =?utf-8?B?cTVVWWVkcVYzRHI1b3NaRmFERjRpeDkwcWN1b0djbC9wczZiYVBUaDJWRkZ4?=
 =?utf-8?B?RGlCSjVxWGFXMWYxelNwTWIxdDluWFVrWndIWVBwdnZjUzVodG1SZ3F6Wlhu?=
 =?utf-8?B?S0RaeDcyUTBaNzM4VDNjSnBNZFJZTE1FUDdpVVVSeXJSUlYrdlZQSHBSWGhn?=
 =?utf-8?B?empYMVNwK0dEbXYwZVhrc1RtcFJoZkhEb2MxSklLdGIvbjJVTXNBVHY0L3Fy?=
 =?utf-8?B?RGhtTnNyNGk5eEdKbm56UHp6MWsvNEFhaDVITW52cEtVbkhwTElmbHgzSmNM?=
 =?utf-8?B?RjFTQXJqQUkrdG0vdHlBb3dtS25Od0o4VkpXSjhwMkJQWVlnS1d0Z1hkMVRY?=
 =?utf-8?B?V0RnOUdNWU1SWS9ldUtIMDlkV05xeXhyYkFVUDdyc2NXNDVBTE13ZXE4RFFu?=
 =?utf-8?B?ejE5MzhSUGVVVzF6Z3pKMnF3aFk1U0VrWklzRnpNTXZRT2xwbFVmaXh0Qmtw?=
 =?utf-8?B?TjFDYVRSdHBMcXZsZmwwUGZ4T2gxNnpmRFdnR1hoZjlHYk95c3JXZHJSUkJC?=
 =?utf-8?B?bVBQb0ZEaHh3azdaOVUvVm1PbVFyTHY4ZVdrNkNQcTBrWEU2UjBaOVpOVjVw?=
 =?utf-8?B?em5mZFJpNHFwWTlpRGpwVVV3ZlBnaUwzNSs4ZjdmNWcwaU9YcU5jWHBEN3FX?=
 =?utf-8?B?bGV4ZjdGQUROdGQzZk81dTdkN3NpT2xPMDAzcmV1NmxaeUc1QjJDZmw0Y3VX?=
 =?utf-8?B?M2JnR0NDSVZxblBWZTFHb0NjVlMzSDRNRzZrcjdRcVVNKzd6WnBiUmMzZGF2?=
 =?utf-8?B?V0UrU1I3Q0k3eDBVK3dqWTRNQ3FSb0Z2cU54L0dWM1lNSjMxV0wyNHFqNWg1?=
 =?utf-8?B?UHZSc1k1aDIxZmswMCtsY1BJdHgxNTUyS0IwNzlDWUFZSDcwRVpPVnVVbkpv?=
 =?utf-8?B?TkZJc3RlQVBqcjRXQTRzSkRnRjlWZkZyZGQ5TnRWUklycmJweitzTmkxMTZj?=
 =?utf-8?B?Y29Ycy9BU1lMc0lLMEduamw1K2pEbzRvRlNZaER2VGs3aWJPSkZDSmYwTG1U?=
 =?utf-8?B?WFlrQXVjbXprS2VQdkpIWndKSXZMbjJEVDdZWStyUnZ4dmNrRHBacWtoK29n?=
 =?utf-8?B?R0xUWEo5N0NMTWRCZy9ESjJsZVE5NStScDRMeit3NUFUQkV5Q3N0S3A2WmZB?=
 =?utf-8?B?SHR1dWFHSlU0RlE0UWpkZGIvVjNEOUdkSWVudnhHT0p6ODR0K0Z5am1ELzVZ?=
 =?utf-8?B?ZVNvV2pFc0pzeUJXZWRveXFVWUlHdmxRVDlTTytXbVNxWFNYNWtRNDErM1Zh?=
 =?utf-8?B?OUphazRJWk5aRW5XOVhjY000WmQ3d2QxcEVOaW93U3ZQaGExejJHOTkvZEda?=
 =?utf-8?B?cFlKZFdURGFQZDFMMFl4cGFIZ21oczhBQ1JiQzljZkpvdkNXK1FFYlRCNmU3?=
 =?utf-8?B?ZS9zeEZRb1RZRkNhWDNlc2V1WTJRNTBEVWRwdmE1YkdHUmZRR3JER0NMMi9m?=
 =?utf-8?B?RGR3V0xpRlV2N3Rhelp3ZW4vOW9IOHV5TUEzTVRsWldCQVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2VuSFlQUlJiWXhmcFFmbjU2cWZ3Y0t6UDNaT2Jub1V3bUhiTFNHbkxiQzJO?=
 =?utf-8?B?L0ZHTFIzUXZsaFU2dVd2YURpcHIwSGRPR2NrbFQvT3lYeWxFVzJSbHArVlE2?=
 =?utf-8?B?N002MTFMaDhtTUNVaVhLcXlFUmtKZzBoKy9va2UyaURzSUdRVGpjVmJKVitr?=
 =?utf-8?B?UllDaGNid2s3NUd6V1BpUnl3RG9ST1h0QVZvaXVTRC8yNlhVVzBwMFE4Wlgy?=
 =?utf-8?B?UnJFWlNaSk1qdkc3eUJnSE5yNkxOaXMvblhBYzRvbVZXZTdPSGRQWTBQOS85?=
 =?utf-8?B?SGtUK3gyU2ZHYkZoNlQ2THFiUmZtL0picm1LSEc1dmRocVRtU3RLVno3L3l4?=
 =?utf-8?B?TEV1d29DL1hMTUpWRlF3WmFmSWxOWGFnMCtSc3prNzd5emtqaHRKTWpkVWtI?=
 =?utf-8?B?M0x3M0ZYY2FFQzhNeFJjbWJSSXNydU9YMzBaYzMyaTdQUFZ6c1FRc1JzMnVx?=
 =?utf-8?B?V1ZQUDh5Tmd6RlZsTCthRjM4VGZvdTJXY3huMGZCRUFCZnFOdXFCd3JQb2Rw?=
 =?utf-8?B?eGxIZWFOL1V3a0ZJQTRjMS81a0piaGpYaXhwKzcySG1ldm5xcHdVVzlJRHRU?=
 =?utf-8?B?QVRYSmt1b05CZ3hYYm5pQ3huZEVveEN4dG8wV3plM1FmNHNkSER2cnNSUm82?=
 =?utf-8?B?Y2ZIYm5vRmV4R2lmcC9UcEY0QnNhQTF5WGdwM2s2MGJKZ1JaclJFSGpHK0da?=
 =?utf-8?B?Kzg1ODlGKzMvYTFRR0NneW9TTEU3RHRnYWlUUmcrNVZMeU1QZEpKWTluZW13?=
 =?utf-8?B?dHFEcnREZGJjazJDYklJVTJWeitnYUZNcm4zUTNTcERUR1oxQWUyaksxc2JK?=
 =?utf-8?B?dlBhcldPWU1BKzhUamlsUVUvQWZmeG9jZ204bldHRndvRzU1UlNibjhwY0lz?=
 =?utf-8?B?Y1Z6VVM0ZkZOb1QxWEhMVmd0dWQxTkloK1IrOTNqMHBFWnNoSURMOWxtQTBi?=
 =?utf-8?B?bTk2U2VTckhESkxpbmR2YUg4NVhTTzVwSWhpMWtGOHlmbEpOQzVhZSs5Uk5F?=
 =?utf-8?B?NVhIQ3RRVGFCVDhtckNFS0F0RTRiWUErck5EeUEydjZzWGZzVDZ0ME1tZUpl?=
 =?utf-8?B?VURCWmVqclJMWFFqSHVJSnNLRExtVjRFWkI3S3h5RVFsQ09VVVUrbHByaldr?=
 =?utf-8?B?YmVsazlGbzUyN2ZrOVdkNXV2NXplZENzME1WL2pFRjkrekgraitUWVp2bTky?=
 =?utf-8?B?VTJTTkJnU2xpSUJOTmFhVzRuMTlYY3NGWkdHeE9kaVFkMHhVTEY0a0RJUTNT?=
 =?utf-8?B?ejBYQW1RZ0FUanV2QzRHMnRvT2pvU1RESlFYbjl6ZWdvdmFPSGRSUi9mVjRC?=
 =?utf-8?B?RDZuMGNlcHVScGprVDZMVHlZNUVJMTVNWml5M01uamtUcHhDalN2cFpOeldB?=
 =?utf-8?B?L1M5OXFSR3BPTXluWEdPRXpRck8wVHRLVE5RTkJ0MlVWUTdzQnJEMERkMzlU?=
 =?utf-8?B?dk04YTBrbzNYQWFYeUw1akxSRkNadVNFRWsvNkRIMVhXTFhWU3RRb3hzNXlj?=
 =?utf-8?B?Qll5ZXRNbkZQVGtmQjBwU0R3djIvVFgxcittM3I2K1NsNnFXSW10bWNDWjhJ?=
 =?utf-8?B?T0kzbnlIbmFBUDBiQ1ZHNnZxeDJRenZJbUhVNWo3UlJ0YkprOUMvR1R4bjhP?=
 =?utf-8?B?S2dGSGtMVS9DWFFqekYyeWlkRk05a2oxd3JhVHVpV1FkM1lpYjVKdGN5NHBO?=
 =?utf-8?B?Qyt4bXlNdW80NjY1S09PZDRJdm1NSFd0ekdOaExITDU1cHV6N1YydDE0SWh1?=
 =?utf-8?B?Y0ZiNytVQ3lHQUpOc1ljNVJObkUyNmtxYUxTcDlBN1hoTStJQ1p3ZWVsVFlT?=
 =?utf-8?B?Vm5tS1hJL2Z6QjllL1M3bzJwL3lsWUFzWEt0VkwySVlhQnp2MWh6MHZVS3pI?=
 =?utf-8?B?OTVJSlpMSTNiS2tZaHVMMGM2R0lubmsrTFIwL3VqMGo1aVlIcmN4U3R4eHV5?=
 =?utf-8?B?SUoxK051QStsSkhKMDNNNG1pdkR2cWpLY21yODB4cmgrVlp5RDg0Szl0Z2I2?=
 =?utf-8?B?NnZXRysrWEVDbElnWCtuOHFYUWNlQXJlZHQ3TDVncHhvR214TnVmZUhCRFpK?=
 =?utf-8?B?NjNlTGE3djdaU1F4TW81MzlRajJlT0VxRXp4bGt5UFRZaTlvM09kZWdKUFZa?=
 =?utf-8?Q?tl5vIGsYRRhW5fW5ri+3aqha6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75A87F5773C98D44B54209A03F25DF41@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7c411d-ed93-49fd-fe9c-08dc9a521a5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 04:47:39.9773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0tnYfkTgLIgT472gqwwAdPLg5hAdZSs1N+Mhw4u5fe8qG+U6lyfYrkVa22bfY10b5xO1CScEH/dz5+cLgeetyU5pVSr6IXq3Og79X6mKuoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
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

SGkgQ29ub3IsDQoNCk9uIDAxLzA3LzI0IDM6MzMgcG0sIENvbm9yIERvb2xleSB3cm90ZToNCj4g
RVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
bGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiANCj4gRm9yd2FyZGVkTWVz
c2FnZS5lbWwNCj4gDQo+IFN1YmplY3Q6DQo+IFJlOiBbUEFUQ0ggdjIgMS8zXSBkdC1iaW5kaW5n
czogZGlzcGxheTogaGltYXgtaHg4Mzk0OiBBZGQgTWljcm9jaGlwIA0KPiBBQzQwVDA4QSBNSVBJ
IERpc3BsYXkgcGFuZWwNCj4gRnJvbToNCj4gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3Jn
Pg0KPiBEYXRlOg0KPiAwMS8wNy8yNCwgMzozMyBwbQ0KPiANCj4gVG86DQo+IE1hbmlrYW5kYW4g
TXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4NCj4gQ0M6DQo+IG1lZ2lA
eGZmLmN6LCBqYXZpZXJtQHJlZGhhdC5jb20sIG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcsIA0K
PiBxdWljX2plc3N6aGFuQHF1aWNpbmMuY29tLCBzYW1AcmF2bmJvcmcub3JnLCBhaXJsaWVkQGdt
YWlsLmNvbSwgDQo+IGRhbmllbEBmZndsbC5jaCwgbWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tLCBtcmlwYXJkQGtlcm5lbC5vcmcsIA0KPiB0emltbWVybWFubkBzdXNlLmRlLCByb2Jo
QGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgDQo+IGNvbm9yK2R0QGtlcm5lbC5vcmcs
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcsIA0KPiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiANCj4gDQo+IE9uIE1vbiwg
SnVsIDAxLCAyMDI0IGF0IDAyOjI4OjM1UE0gKzA1MzAsIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFu
IHdyb3RlOg0KPj4gQWRkIGNvbXBhdGlibGUgc3RyaW5nIGZvciB0aGUgTWljcm9jaGlwJ3MgQUM0
MFQwOEEgTUlQSSBEaXNwbGF5DQo+PiBwYW5lbC5UaGlzIHBhbmVsIHVzZXMgYSBIaW1heCBIWDgz
OTQgZGlzcGxheSBjb250cm9sbGVyLg0KPj4gVGhlIHJlc2V0IGxpbmUgaXMgbm90IHBvcHVsYXRl
ZCBhbmQgbGVhZHMgdG8gZHJpdmVyIHByb2JlIGlzc3VlcywNCj4+IHRodXMgYWRkIGNvbmRpdGlv
bmFsIGJsb2NrIHRvIG5hcnJvdyByZXNldC1ncGlvIHByb3BlcnR5IHBlciB2YXJpYW50Lg0KPiBJ
IHJlYWxseSBzaG91bGQgaGF2ZSBhc2tlZCBvbiB2MSwgYnV0IEkgd2Fzbid0IHN1cmUgd2hldGhl
ciBvciBub3QgdGhlDQo+IG9wdGlvbmFsIG5hdHVyZSBvZiB0aGUgcmVzZXQtZ3Bpb3Mgd2FzIHNw
ZWNpZmljIHRvIHlvdXIgbmV3IHBhbmVsIHNvIEkNCj4gaGVsZCBvZmY6IElzIGl0IGV2ZXIgdGhl
IGNhc2UgdGhhdCBhIHJlc2V0LWdwaW8gY2FuIGJlIHByb3ZpZGVkIGZvciB0aGlzDQo+IG1pY3Jv
Y2hpcCBwYW5lbCwgb3IganVzdCBub3QgaW4gdGhlIGNvbmZpZ3VyYXRpb24geW91IHRlc3RlZD8g
SWYgaXQgaXMNCj4gbmV2ZXIgcG9zc2libGUsIHRoZW4gSSdkIHByb2JhYmx5IGRvLi4uDQpUaGUg
cmVzZXQtZ3BpbyBsaW5lIGNhbiBiZSBwcm92aWRlZCBmb3IgdGhlIG1pY3JvY2hpcCBNSVBJIHBh
bmVsLCB0aGUgDQpTb0MgdmFyaWFudCBpbiB3aGljaCBJIHRlc3RlZCBkaWQgbm90IGhhdmUgdGhl
IHJlc2V0IGxpbmUgY29uZmlndXJlZCwgDQpoZW5jZSBoYWQgdG8gbWFrZSBpdCBvcHRpb25hbCBo
ZXJlIGFuZCBhbHNvIGluIHRoZSBkcml2ZXIgdG8gYXZvaWQgcGFuZWwgDQpwcm9iZSBpc3N1ZXMu
DQo+IA0KPj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbmRhbiBNdXJhbGlkaGFyYW48bWFuaWthbmRh
bi5tQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+IGNoYW5nZXMgaW4gdjI6DQo+PiAtIHJlLW9y
ZGVyIGNvbXBhdGlibGUgc3RyaW5nIGFscGhhYmV0aWNhbGx5Lg0KPj4gLSBBZGQgY29uZGl0aW9u
YWwgYmxvY2sgdG8gbmFycm93IHJlc2V0LWdwaW8gcHJvcGVydHkgZnJvbSByZXF1aXJlZA0KPj4g
bGlzdCBiYXNlZCBvbiBjb21wYXRpYmxlIHN0cmluZyBjaGVjaw0KPj4gLS0tDQo+PiAgIC4uLi9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL2hpbWF4LGh4ODM5NC55YW1sICAgIHwgMTcgKysrKysrKysr
KysrKy0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2hpbWF4LGh4ODM5NC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvaGltYXgsaHg4Mzk0LnlhbWwNCj4+IGluZGV4
IDY0NDM4N2U0ZmI2Zi4uNzVjY2FiZmYzMDhiIDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvaGltYXgsaHg4Mzk0LnlhbWwNCj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2hp
bWF4LGh4ODM5NC55YW1sDQo+PiBAQCAtMTUsMTQgKzE1LDEyIEBAIGRlc2NyaXB0aW9uOg0KPj4g
ICAgIHN1Y2ggYXMgdGhlIEhhbm5TdGFyIEhTRDA2MEJIVzQgNzIweDE0NDAgVEZUIExDRCBwYW5l
bCBjb25uZWN0ZWQgd2l0aA0KPj4gICAgIGEgTUlQSS1EU0kgdmlkZW8gaW50ZXJmYWNlLg0KPj4g
ICANCj4+IC1hbGxPZjoNCj4+IC0gIC0gJHJlZjogcGFuZWwtY29tbW9uLnlhbWwjDQo+PiAtDQo+
PiAgIHByb3BlcnRpZXM6DQo+PiAgICAgY29tcGF0aWJsZToNCj4+ICAgICAgIGl0ZW1zOg0KPj4g
ICAgICAgICAtIGVudW06DQo+PiAgICAgICAgICAgICAtIGhhbm5zdGFyLGhzZDA2MGJodzQNCj4+
ICsgICAgICAgICAgLSBtaWNyb2NoaXAsYWM0MHQwOGEtbWlwaS1wYW5lbA0KPj4gICAgICAgICAg
ICAgLSBwb3draWRkeSx4NTUtcGFuZWwNCj4+ICAgICAgICAgLSBjb25zdDogaGltYXgsaHg4Mzk0
DQo+PiAgIA0KPj4gQEAgLTQ2LDcgKzQ0LDYgQEAgcHJvcGVydGllczoNCj4+ICAgcmVxdWlyZWQ6
DQo+PiAgICAgLSBjb21wYXRpYmxlDQo+PiAgICAgLSByZWcNCj4+IC0gIC0gcmVzZXQtZ3Bpb3MN
Cj4+ICAgICAtIGJhY2tsaWdodA0KPj4gICAgIC0gcG9ydA0KPj4gICAgIC0gdmNjLXN1cHBseQ0K
Pj4gQEAgLTU0LDYgKzUxLDE4IEBAIHJlcXVpcmVkOg0KPj4gICANCj4+ICAgYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlDQo+PiAgIA0KPj4gK2FsbE9mOg0KPj4gKyAgLSAkcmVmOiBwYW5lbC1j
b21tb24ueWFtbCMNCj4+ICsgIC0gaWY6DQo+PiArICAgICAgbm90Og0KPj4gKyAgICAgICAgcHJv
cGVydGllczoNCj4+ICsgICAgICAgICAgY29tcGF0aWJsZToNCj4+ICsgICAgICAgICAgICBlbnVt
Og0KPj4gKyAgICAgICAgICAgICAgLSBtaWNyb2NoaXAsYWM0MHQwOGEtbWlwaS1wYW5lbA0KPj4g
KyAgICB0aGVuOg0KPj4gKyAgICAgIHJlcXVpcmVkOg0KPj4gKyAgICAgICAgLSByZXNldC1ncGlv
cw0KPiAgICAtIGlmOg0KPiAgICAgICAgcHJvcGVydGllczoNCj4gICAgICAgICAgY29tcGF0aWJs
ZToNCj4gICAgICAgICAgICBjb25zdDogbWljcm9jaGlwLGFjNDB0MDhhLW1pcGktcGFuZWwNCj4g
ICAgICB0aGVuOg0KPiAgICAgICAgcHJvcGVydGllczoNCj4gICAgICAgICAgcmVzZXQtZ3Bpb3M6
IGZhbHNlDQo+ICAgICAgZWxzZToNCj4gICAgICAgIHJlcXVpcmVkOg0KPiAgICAgICAgICAtIHJl
c2V0LWdwaW9zDQo+IA0KPiBPdGhlcndpc2UsIHdoYXQgeW91IGhhdmUgaXMgZmluZS4NCj4gDQo+
IENoZWVycywNCj4gQ29ub3IuDQo+IA0KPj4gICBleGFtcGxlczoNCj4+ICAgICAtIHwNCj4+ICAg
ICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4NCj4+IC0tIA0KPj4gMi4yNS4x
DQo+Pg0KDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
