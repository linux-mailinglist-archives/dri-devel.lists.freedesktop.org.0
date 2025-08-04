Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318ECB19E01
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 10:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCAA10E41B;
	Mon,  4 Aug 2025 08:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="sCbVc1mv";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="KGvIimaF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DC710E41B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 08:54:13 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5745vKow511042;
 Mon, 4 Aug 2025 09:53:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=QetpA4+izA76mMVMzYk3PhWr0
 UAhjmrb8X3kEkmIB2Y=; b=sCbVc1mvTYdZIG7QZjk0MOERJd0fTsgG3HKGOUj2V
 qMvYjPWmwMCjVHvQ2dvheXspASx/Quz2QlMH5d/SphgOF71vXjfkeWljmACZas4d
 ONy4ejqAyd/2y92cEiyP74zhLPWJumR5SO56hFIfj3iGVxIcD1udTTo5WJft5W1O
 iD2wayPt+a2S7ioabP/4janCMReeRpcQ84Avfvz2pgoIQtcVMpUdomeo0x461ecf
 dC21UqQlazAO4P/nabchFMrOAj2Wb7V9OfYFyiW3KgXJiulJX8Dm8uK3PhxzzzRg
 dEDO/+WR49AcGFtoNdAuzaOXPq/5ZonFo2se5c4a8RFrQ==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021123.outbound.protection.outlook.com [52.101.95.123])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 489arthu4n-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 04 Aug 2025 09:53:48 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iT4Ta00Z0+5t/7s5V0IoBwwy8taf+/KlGWbdnW447pk1PbTNjOnPajFFmRp2xFYOSaGC+4wlqERTvwSbS8n7fuqUFZA0x+qZszLoLS7TymneU+oIPw5WTkRpvfSCSNyqhhmDGF1gxesMVXYzAYWw0oWxZpFE3N3rk9UETFFsOsrlZwJxTIi5ZaQWJPl17nlTxPlSahPCvMO5bNk3A9bxhEsP9CqOfPM7FtBnABMWovxkvUqvL+YUiYyS3E1+DurzpMHQDwnb8tYiqvfFJ/v8PRPJALZzA+LR2UYqEiaLbfQA4En5B6XS+xRXlGQVgBbT808Rh49UY+vaPFybAonjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QetpA4+izA76mMVMzYk3PhWr0UAhjmrb8X3kEkmIB2Y=;
 b=w0cvM/LcyF4jepgtWB8PLx0YE06aoI7JChLft7bjClqDmAa2nK73xYIfENJtGYRCUqWd+Gr06l0GWY5TLG3IRIQwaOlQDYA3oRgE6pg6NQznkdHKA9tzN0qhYmrLZEMLkpn+iXsrQjQNAuUuXd1I2lT+rYICIzT3LHYX2LsRQ2GB1m1ByZ/XQuEnhne2dQCDgvtqFcbsxlO5MMTLtBtkGy/TBCiBspA8Oj/hYZHw2/Wl5Nv4j8otz1eXLWn3L71wEH2PYHzSgbqTnbkqRh0O0+3tHe9PdHongA2mRyjZ+0dz9q9D8XK2wcx6rVPu9kzaEHzKCyPruxRsX6UUqj55oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QetpA4+izA76mMVMzYk3PhWr0UAhjmrb8X3kEkmIB2Y=;
 b=KGvIimaFNzQ3gvjdzkD4ioGwtwjm+WZo1dbA2iIh5RQkyS0v4BVhpfGdx8KP/7Ek/UJEp1cd7naAyZfXQd5WVE0Sr+UTb5QhQnMaIWC7fz8ZcLxld6deJ2g30oTsegP/I6okgQvKHP42KEJ3PVGirLHTGpIrSHW8jSOXRO8cIIs=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB2067.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:62::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.21; Mon, 4 Aug 2025 08:53:46 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 08:53:45 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Fu
 Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Drew
 Fustini <fustini@kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v10 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU support
Thread-Topic: [PATCH v10 2/4] dt-bindings: gpu: img, powervr-rogue: Add TH1520
 GPU support
Thread-Index: AQHcBR1JP3/D76qAck6acoMzADQXnw==
Date: Mon, 4 Aug 2025 08:53:45 +0000
Message-ID: <f0d978aa-eb78-4494-9574-01566ac28b12@imgtec.com>
References: <20250801-apr_14_for_sending-v10-0-e85802902a29@samsung.com>
 <CGME20250801103106eucas1p11c945f612fcf56ad2521151962d745b8@eucas1p1.samsung.com>
 <20250801-apr_14_for_sending-v10-2-e85802902a29@samsung.com>
In-Reply-To: <20250801-apr_14_for_sending-v10-2-e85802902a29@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB2067:EE_
x-ms-office365-filtering-correlation-id: 3e41b61b-48f2-4a4f-9091-08ddd3346bdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?QlQ2M2NpOXprQUwzOTdSaWNlYlV4cnJ2NFlQTHhNVU9lNitFQXlPRGNGODY4?=
 =?utf-8?B?YlpsK0JvbDIrV0c1QWJJL2llZFduS3dVdy9BWGlEZXd3Y1hjOVdueTI2a0pj?=
 =?utf-8?B?Zk5xSm5KV2RBRS9sM0lraERzMlJzMVhGZ3ZGYkNFLzJnK2Z0R3g3OHZvUTd1?=
 =?utf-8?B?MUJHNGg4WTRMRGQ1ckVSc2ZkSWpES2dpcVNXMXFHMDZqTjdlYVF0cEVITVlh?=
 =?utf-8?B?RnhxMGM5WmJveWJMeUZmMmtlZVR1M0N3ZFVYdzJlcE9JYi9BV0d1ZDNhSEJy?=
 =?utf-8?B?ZUQwLzhxZzBCeUVpcTEyT2psVm9DK2ZORUJEWmtZb1JDdEN1SEg4cnpyRzl0?=
 =?utf-8?B?Ym9nblJPTzZNb1VRcmpFeWQvMnI3dHFwWFlBQm1lSUxlRzQxSFc3SklHMjFD?=
 =?utf-8?B?QW00Y05sSWtYU0x5UkFsNCtYcTByU2sybGs3NmE0RXArVjR5SjFFN3Vwd2tM?=
 =?utf-8?B?YnEzR21zUzBHdHc4MUYyaENVS0xaYkxOcmdBY3N4VzJUQXdIcDZDcFdxdWNz?=
 =?utf-8?B?QTlmR05TSHNkYUJ3ZU9ranp0TWZSNnduUE94R00zNHhUS0ZYUll6QWNFa3Nr?=
 =?utf-8?B?NmI0ZFg5QnUzUlZ2Y2JHcm9wRnlxajlYcjNySkdGSTNrSWZhZUZqclZmVyt6?=
 =?utf-8?B?ejVLY1ZEZHBpeUZmZlVYckMrRlZNV1haVzJmL0VqVzJlU2xSeHhRQ0grQmpV?=
 =?utf-8?B?YVplN2dFSDNVTVh1VERJTXNZOW5tKysxdUpwcWgrREVvL2ovM2lqMWRrU3Z2?=
 =?utf-8?B?UmdXUDVBckVQZUdlS0syZ1VjSVZTMjNzTXg5WjRxVXc4aCtQQW9ybzJXR2tQ?=
 =?utf-8?B?amszVzZGR3p3dGd1SklGbVZtL0ZPcTV1R0tTLzBWdUJvSUFaV0JLTVFKYi9H?=
 =?utf-8?B?b2pFL0I4M2M5MlNNK0V5dms5V001czBPckUvenE5OXlGYk1yYnB3eDlxbm9Y?=
 =?utf-8?B?Z1cvYWQxUGVDcE1aUURyNGpkMVdPd1JIYUZvbVRlNG9OTlpKSThDVDFLVDBr?=
 =?utf-8?B?cnJsL2ZmVlZVZ2hZOTIyam02a1ZGNjV2d2dUWWtmSC9HTnIwcWozTWVnem5p?=
 =?utf-8?B?cWRaTXJ5aFN4TGVnQVQ0RFJjUHc4QWRvR1J2ZnZvelI3U3I5MlJrd1B4djd2?=
 =?utf-8?B?dVhhVlpERnJwdjhIK09xcEFPUWQ5NDV6VHAyZ3RvcWV5NUpISmx6VHF2M2tm?=
 =?utf-8?B?bHFlM2R4NmZNb2NqOE90V0Q3SklUdkJrSERHWENibW9OYThXWUxIaC9PWnVT?=
 =?utf-8?B?aTFsUWU2RnBwcXhETExrYW0yWlhDNXo4MkwxaTEwdkQzNzBENDZ4L2FyL0ZS?=
 =?utf-8?B?SjZ4WjRsYUhYQTVYaXIvc0puNjdXcDlXMjd1RXd3cHRVSXJuWWV1Uk5wTnFK?=
 =?utf-8?B?MGNpaGVGaVhTVDNYcUFSMFlsMU1CWVlBY09COHlWU2g4VEJaVm5KQlpHbjdv?=
 =?utf-8?B?elJ4dXhvVXNBbTVkNno5T29RRm1wTmdEVmRZdWJtNkZzdmVpRkVzU3hqVkRv?=
 =?utf-8?B?aG8yLzVjSTNvNjRySkdiUW5xaVZwb1A2YnlDQmlMMWhrZXd6VmE3UUpIQ0xE?=
 =?utf-8?B?UGEwcFFRTzV4eXBOQVU5OTNUeTY4RlpQYmRSTjErSlU2ZFhtZzhwZ0FoRHpQ?=
 =?utf-8?B?UGFUcTk2TUY1Vjg0R0ljc0V4N1MxZDE2eUhrbU1aaG1nR050RHlhaC80U0RO?=
 =?utf-8?B?aWtsdDcxZjBtVlF1ZXQwR0cxVmovRWVNSlhLK1BpUHVXR2ozOFFQM2hMRzZI?=
 =?utf-8?B?OWRjenJ6TTA3MjZzT0pNKzIzQzUxQzF5Mk15MlQ3OEFiWExmTGpjekliZFU3?=
 =?utf-8?B?Z2pzVmxQRzRhc1krV21FU1VZcXdBZmdCL0IxNHUwZ29jbGxjZ0ZXd0Nvckpz?=
 =?utf-8?B?enlVUFFrVy9WTVJ3cWpudWFFcHFlN052K2Evbm80cWs2R21QTys4aEVFRVpv?=
 =?utf-8?B?bDdPZDU5cmtJVzgvR1JkR2duUTVHeEJMVnJiTkxYU2NLa3lpNjQvQkRYZkgr?=
 =?utf-8?Q?zYZNOg9tcRMvijpvpiR+fhkSsyYhDo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDI0dHo2MGhQSEtEZ2R1QW8vRmc2R3RWODJwUENLaDZnM1BUcldlLzIyQkN2?=
 =?utf-8?B?ajkyN1RHNElBMndnbzJtOER6UEh6MmxLcnBtTHhzQTJkMDBOTHo0YlNlZ1VP?=
 =?utf-8?B?NW8rRjdEOUVnM3h0TG81V1pVam1IN0tHNlBxa0RMb0dobjB4R1VDMWZMbTgy?=
 =?utf-8?B?UzJvdTlLS3dlWGh2UEpCTG5HVU9LVmp0dDFjUGI1T25tdTRpSmdESHRLMEFi?=
 =?utf-8?B?UWhBN0JmNWUzZ0NKT2xZK25GRDhYK0JYRGkvOWtMcWYyeFJhdDZZRUVDZlRX?=
 =?utf-8?B?TWkzUGVEVGZHTldVSU9hTnlqVW9JMWc0aUxGRytFak4zWWdhcStyRGY4b0dG?=
 =?utf-8?B?N1JhTEpuaDJzRFMzZ3lqMm9yT1JVVjJRWHZRMHkzbmROL3JOaGYwbDcwbFdF?=
 =?utf-8?B?a2NFZ29lUnE0ZFduNWlmRzlYenlSSW5RZ2gvUW5zbmIvSkhWdEg1enBid3FW?=
 =?utf-8?B?TzZSNWtydEhKMStmdWt2YldKeUtZWUl2aEtTZVlTMGcyL2JSMFhrT1hTZHho?=
 =?utf-8?B?bURLaGlTdno1ZTNNcStEcTN3akJBa0paR0YrUW5rdXgwbGdXQnlyY1ZWZW5P?=
 =?utf-8?B?RlNQMXhoR1R3UUdNM015bVk0Y1ovMk5ocG9SY1dIREhNUlhFWHZhRFFRZUpy?=
 =?utf-8?B?QzV1bk5sTzZKTnFka016bWgxZTBTRWNWK3YrR1podkFpeHkzSTJWNXJEUDZB?=
 =?utf-8?B?REVaK2VFQmtNcW40NnNvMkp2QVJKWWkrS2JlbnkyYkNqRnA4a1VNU2ZTakls?=
 =?utf-8?B?dGFQWmtnM2lqREZzVWVOa0J5TWltbmI0WUVrMlFTQVpVYndxM09YbVFHbFd4?=
 =?utf-8?B?RXRhWGQ3QThBUWN0M0diSVBTaldmdytCWXI1VXBpZFd0UW91bTNvRStIampB?=
 =?utf-8?B?VGRjUHI5NnBnNStlM3NUOUhnMUNUbmROS3JGQUZLdWtYT3RVeWh6WXBKeXhT?=
 =?utf-8?B?bHNsaEdobmxzSUlhMGRwVlErU3Rac3NXTmdSYnlDeTBkMUhGVXp0YVRIQjlW?=
 =?utf-8?B?UEFhZmU1NEhGMEFkV0RsRUZxU3J5eFhCb24vOHA3WWxKZXd3UFlVdEJnQ3B5?=
 =?utf-8?B?bkF4RUFIa2tMdkNVc0EzOXltYjBHR1R0WFVyL2w0QkhmaWMxZmVTNFRMVUdU?=
 =?utf-8?B?YmVWYmdHdnJ6RmszYmFCYzNGL3BjVDVRZFlCbmtQN05jaUt5c1M4QUVZVDRn?=
 =?utf-8?B?VHRwMGVQNklDUmhFNU5HcXlsL1RTdDJ1UGtWS1diZW52dGRuMXRIQ2N6aVhj?=
 =?utf-8?B?ZzZKVTRNanNwUFlvd1V0dzk5dXpYV0daMks5YkpyejFxS0xvcXd4RFo0SVcr?=
 =?utf-8?B?OEY1eWdBQ3dDS21YVXBOczF3aVJsZUNjd1BSbWp5dFR4OEpsb1lKL0NmUnhG?=
 =?utf-8?B?UnRwR0JoQjdvOEY2aGU1aVlOYVV0SEl4eWxSNlFCelM0RHRFQlJQYk4rTHZQ?=
 =?utf-8?B?SGc3QUgxdVYybmtvVEEyOHNFN0pCNUpCWnYyZDhPdFFLeEg5cS93UkVYM2NM?=
 =?utf-8?B?Y2NHQjdLLzA0clYycG14SVNuRUFHSkYvajlwZ3JyeWh0bU5qRGloRnVJVldC?=
 =?utf-8?B?SHg4VjI1dkxaWkVFVjFWNkpaZVpGelUvZWQ5dUp6Q2Foa2ZmUTVTRGhaMlZh?=
 =?utf-8?B?aVZkd0FVU0U1Q1pYbU1YcVNvWVFCeDh4aFo5MENOdi9iR2I2alFxdFJoaE1Q?=
 =?utf-8?B?N3d3VWNzczAwTStTV3JrNVRsRnJwZWlER3VUN3dOK3NrK0YvaGlGaXZqc2Zh?=
 =?utf-8?B?Uytxa2k4dXRHRnI4b1JQUzFwTG0zY1dnMmIxc2crQjBHQnBLellZWDc0blRT?=
 =?utf-8?B?SndEdXJMOE1vU0VoK3RjNUxsRTBxdDNMWUhXRUZ5T2NYMXkxdEYwbWN2aUgv?=
 =?utf-8?B?a0hFMVYxeEpKWFdlTVhCNmRVc29kMnpPTmVsaVdOdUhUazhtMEhjVVdVekVR?=
 =?utf-8?B?Tm5zeHUya2hFeDd2SDNuUGVVZXg3dit5dFBieEQ1MklzNmpHbWlsdDY5SEV6?=
 =?utf-8?B?Yys1b0hPbFFjUTV3RTluL3M0WkRSeWhhWU1oUVFKNlZwWElYNHFQNWdDV1ZX?=
 =?utf-8?B?QUwxSExBckVBdzVhTnovb2hoUXNVdUJEV3BPWUJlY3ZBbW5SMW80ZFhvT05k?=
 =?utf-8?B?ZEx4NmpSSThLdkV0OXYxWCtya0JndFRXbVNHbktxb3d4T0cxZ0lnY2xVVlhH?=
 =?utf-8?B?SGc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IcUdKS1aQ48zUFZ8Cs8rqA3i"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e41b61b-48f2-4a4f-9091-08ddd3346bdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 08:53:45.7278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RCCmOTbqPXeJ0xwWQO6fXdRXPyK8CNQcxQmNsdgcJ3zuWpRSNefqKmsabVRKxEEE5/t1YfUxEHj7+mpnTSlJDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2067
X-Proofpoint-GUID: 3oYK0Xqd1LdOKkEofy_txDbtRMS-sMMD
X-Authority-Analysis: v=2.4 cv=Y+34sgeN c=1 sm=1 tr=0 ts=6890751d cx=c_pps
 a=2kOSVXLH6HfbNZ/dWSA3qA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=hD80L64hAAAA:8
 a=r_1tXGB3AAAA:8 a=f4pe8lG_Yg_IwD6BSwwA:9 a=QEXdDO2ut3YA:10
 a=JtxHKHj2wRNxxm4u1agA:9 a=FfaGCDsud1wA:10 a=cvBusfyB2V15izCimMoJ:22
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 3oYK0Xqd1LdOKkEofy_txDbtRMS-sMMD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA0NyBTYWx0ZWRfX2ljWFEZQOa6C
 aIYEfKZfL9hjdhr+OHE5z72bvjRXBfhmwD8paMzVitZk4KDnMgG1tbv6TJkgGO9qFLyaVEW34gy
 saKadLFMAqY0tjpa9uCFZhy0BUrInKqYNb1gupOTMOVDDzP+cC/2Fle8aOhKCGz7TP4dZ4cEQaA
 wVTi2fJfT5qu/+0SaSVz9iCPLH5cvkGD6dQKe/fI1/3uMpF1VIYOUZ4QnN7UI+FkDJLyl0GFv1T
 U8mglrtQggnn+IxZhIqIs2M+E5B1N3g4zL/rQHnWOj9x+6izfWRHAUSRh+KFUNKgkuetkNjtS/a
 6LUYs+dZw8q4qCyHaYk4KQQlBy0aHZHNWVa+MClfzTjNWVdfC6PEgx57KJgTMY=
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

--------------IcUdKS1aQ48zUFZ8Cs8rqA3i
Content-Type: multipart/mixed; boundary="------------GAfrn2bG04XtrHUOUDAJdfQF";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <f0d978aa-eb78-4494-9574-01566ac28b12@imgtec.com>
Subject: Re: [PATCH v10 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU support
References: <20250801-apr_14_for_sending-v10-0-e85802902a29@samsung.com>
 <CGME20250801103106eucas1p11c945f612fcf56ad2521151962d745b8@eucas1p1.samsung.com>
 <20250801-apr_14_for_sending-v10-2-e85802902a29@samsung.com>
In-Reply-To: <20250801-apr_14_for_sending-v10-2-e85802902a29@samsung.com>

--------------GAfrn2bG04XtrHUOUDAJdfQF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/08/2025 11:31, Michal Wilczynski wrote:
> Rework the PowerVR Rogue GPU binding to use an explicit, per variant
> style for defining power domain properties and add support for the
> T-HEAD TH1520 SoC's GPU.
>=20
> To improve clarity and precision, the binding is refactored so that
> power domain items are listed explicitly for each variant [1]. The
> previous method relied on an implicit, positional mapping between the
> `power-domains` and `power-domain-names` properties. This change
> replaces the generic rules with self contained if/then blocks for each
> GPU variant, making the relationship between power domains and their
> names explicit and unambiguous.
>=20
> The generic if block for img,img-rogue, which previously required
> power-domains and power-domain-names for all variants, is removed.
> Instead, each specific GPU variant now defines its own power domain
> requirements within a self-contained if/then block, making the schema
> more explicit.
>=20
> This new structure is then used to add support for the
> `thead,th1520-gpu`. While its BXM-4-64 IP has two conceptual power
> domains, the TH1520 SoC integrates them behind a single power gate. The=

> new binding models this with a specific rule that enforces a single
> `power-domains` entry and disallows the `power-domain-names` property.
>=20
> Link: https://lore.kernel.org/all/4d79c8dd-c5fb-442c-ac65-37e7176b0cdd@=
linaro.org/  [1]
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

I'm happy with this version for the power domains (and I see Krzysztof
agrees with his R-b, thanks!), but somewhere in the chaos we've lost the
minItems: 3 constraint for clock{s,-names}. Would you mind adding that
as a conditional on thead,th1520-gpu?

Cheers,
Matt

> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 33 ++++++++++++++=
++------
>  1 file changed, 25 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..dc53ed59331bedee2d74382=
88f482870714bbf46 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -21,6 +21,11 @@ properties:
>            # work with newer dts.
>            - const: img,img-axe
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - thead,th1520-gpu
> +          - const: img,img-bxm-4-64
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,j721s2-gpu
> @@ -77,14 +82,18 @@ required:
>  additionalProperties: false
> =20
>  allOf:
> -  # Constraints added alongside the new compatible strings that would =
otherwise
> -  # create an ABI break.
>    - if:
>        properties:
>          compatible:
>            contains:
> -            const: img,img-rogue
> +            const: img,img-axe-1-16m
>      then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Power domain A
> +        power-domain-names:
> +          maxItems: 1
>        required:
>          - power-domains
>          - power-domain-names
> @@ -93,13 +102,16 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: img,img-axe-1-16m
> +            const: thead,th1520-gpu
>      then:
>        properties:
>          power-domains:
> -          maxItems: 1
> -        power-domain-names:
> -          maxItems: 1
> +          items:
> +            - description: The single, unified power domain for the GP=
U on the
> +                TH1520 SoC, integrating all internal IP power domains.=

> +        power-domain-names: false
> +      required:
> +        - power-domains
> =20
>    - if:
>        properties:
> @@ -109,9 +121,14 @@ allOf:
>      then:
>        properties:
>          power-domains:
> -          minItems: 2
> +          items:
> +            - description: Power domain A
> +            - description: Power domain B
>          power-domain-names:
>            minItems: 2
> +      required:
> +        - power-domains
> +        - power-domain-names
> =20
>    - if:
>        properties:
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------GAfrn2bG04XtrHUOUDAJdfQF--

--------------IcUdKS1aQ48zUFZ8Cs8rqA3i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaJB1GQUDAAAAAAAKCRB5vBnz2d5qsLN/
AP9jweRtBZ0Ycmeolf4ZYOFE3CeeCWjCBIpwiPammU4SyAEAyPCiAT4PiESjiAtVG6kcccvomBnI
d4h53LpglFiFCwA=
=H0GT
-----END PGP SIGNATURE-----

--------------IcUdKS1aQ48zUFZ8Cs8rqA3i--
