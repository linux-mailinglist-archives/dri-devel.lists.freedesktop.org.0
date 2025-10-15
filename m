Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56D3BDE14C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 12:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D0C10E28B;
	Wed, 15 Oct 2025 10:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Nes6tojp";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="NKQok/5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F80C10E28B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:52:27 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59F61VHk2709269; Wed, 15 Oct 2025 11:52:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=HOo+gSN7/s4tjR57QPQcClScL
 qVV7lOepu8Y4twy7yE=; b=Nes6tojpARmxv5sZyDqxKiGT+OhPKELH6Kv5MrvHj
 9YZ8rHTke4EstFfCvJwVF/BH312n/3vcogXTiHMmqE9ITSpKD3V5i2VoWVMsuq06
 1JKpfF721fgt6HyU09dwzjA6jwDEs9Q0cD1VcqDxfra1HKsOOxM8xvriTS6EuCKo
 uoS53MtwZBh1738+Kg5vDtHUL7hYGyJhPogQ/RWjdx+H825xaNudWMS8ih5F+Oq7
 B4r7P+1qt6ns99jjL8BHiWbmf3vNv9+VGxPaOzc5mozdHRQtLvv/ZmfqIb+rK56b
 nu8YcRSmT+Ob8na+LrmnaBtC7vz+HdZKTSLvYn1quh9WA==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020079.outbound.protection.outlook.com [52.101.195.79])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 49qdgn3vxs-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 11:52:13 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUYld9DBdEGm3NSAeQLQbLy+w9hndUiwZJBAzZqSMoeQy54zVQi/fKW3Szp2/Kt36cbXUv46QKW0V9tDwfnMhxXR9gIDufcEh/rvNazCB3fjsHIz1G1efX+KY8SoWucNwIMzNfEslanPuwlWO1cq3I1Og8YzNCIsWCc+4J4nfFBN8HYtorArPWE6wNGEBowEaUJm79zmwWoiJ0+LckPkonHeQ6VjZAWwRfV0K1yOzNy3wU2jKzQ9gknUKsJrepdhcnahF5QBjMIk5NeNfrgtUOl90MI7YbKn5g6zmjSENV/Nr8U/ZPxaJScnyTLkvObPqB1VLaak7NS1o6GN0Y1UkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOo+gSN7/s4tjR57QPQcClScLqVV7lOepu8Y4twy7yE=;
 b=VN0lfaEg+aFvPW1AdJVv36HLT07Bd55htJLFbTtfoWx3bjYByBT93QMefTONjoMbVYnieYtO/zmqHInoMcnVDurbuJ2UgdZzP8vQh1kV0oFNtf3vrbV/VbiS6puPVhV8XP/zk7HBjsJayTfTdMwPaT1kHy/5T6rOUhB/vm9I/NMWTO5zPU6kgH9lTLiNUp98jEpNoRGyJadp1OjDiG98xPqqPr7zA19n2jr13ulfaO1JgU/fbfCclAXI/avgwftka0TXJ7H/4tTjJWcX7FpUjU8EYQaaz3Z/QPVcEUZRGShwmYJUch3Y6biBjEzkSSDmFdQo3fN3PT50A2qoOV1Nvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOo+gSN7/s4tjR57QPQcClScLqVV7lOepu8Y4twy7yE=;
 b=NKQok/5kYw12oORSb5beP1QSAUkVMtb3IQ2TFmquTMY/k61JXNmaBx6/6gKsci/cR6RFXY/LfgSOwOmmtwerc3lpynSsTCUo/9cwdMLvuvG/U6tJ7jnVNNJfXdWYa5sVYv7G/nBBTHPfno/nKXUJ3Jba3pvbQjyTSoszeGah33E=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO3P265MB1898.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Wed, 15 Oct 2025 10:52:11 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 10:52:10 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Marek Vasut
 <marek.vasut@mailbox.org>
CC: Marek Vasut <marek.vasut+renesas@mailbox.org>, Adam Ford
 <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, David Airlie
 <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
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
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img, powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
Thread-Topic: [PATCH 1/3] dt-bindings: gpu: img, powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
Thread-Index: AQHcPcHBk90JKUhyHEK8NGulGuffcA==
Date: Wed, 15 Oct 2025 10:52:09 +0000
Message-ID: <b5b47ad5-b3e4-4213-84e9-9e649a250237@imgtec.com>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <c65950f5-010a-4d5d-88d9-60697eeddb46@imgtec.com>
 <f4e1897c-7073-4ab0-92b3-6f7d69382825@mailbox.org>
 <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO3P265MB1898:EE_
x-ms-office365-filtering-correlation-id: b3f12dbb-f7f9-4acb-450c-08de0bd8e40a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?VzhGdTlITlZkblRlTTM1V0MwZ05pT3djSmJsQWdJclJHUkdqUHBWU3ljaGw2?=
 =?utf-8?B?bkovQWlXUVVST2YzSHFwUHpwL1Via05IbVRTeXFoRS9mZUxRSVl5NExIczRV?=
 =?utf-8?B?TXFDRUhXZTlOMjdEN1JSMldkaG9DeVp1a0ZIMXFYZ2I2VVZFb2J1Zk9PUHBq?=
 =?utf-8?B?NHdhclo5MGxFdW9lajVPMzUzN3psYzBqMnFGZEpZQTZZbkY4eXBOVjhJbXZ6?=
 =?utf-8?B?bVd1b0xCRk9DN0F4NEpQTGtGMWIzUHMyUjJlQ1V1Zk4yL0plTkRzUzNCZkNs?=
 =?utf-8?B?NkZVckRvbGE2WnVtRnVXZDhPVlROK0NSbk4vWllqeDdHTnhxSWpOV3QwVFlP?=
 =?utf-8?B?WWtDb2dDMzM0M216bStBQzF0Wm1WV2NHRHMwdEVWR2YvU3Irblc0RkVpa1ow?=
 =?utf-8?B?KzZJd2h4RE95TWtBei9LVVlYMHBZSk1NQUZ2bTdiNndyQ3Y4RXdMdkVuZEE0?=
 =?utf-8?B?a0VzUWNXS2ZMYzFQT1V6NjNRYzQzck1yempsYXJFZkZKb1IyZW5CU2RJUTFx?=
 =?utf-8?B?NDFhckRQTUN6ek1WSTdERDhmaDFZR2VhZ2E1aWNDVXUxVjdtaHdBUEVvdDlN?=
 =?utf-8?B?V0haWWdOcHp4STI1NjdnVlZSVldvNDdhRWJOR0ZQc3FIMFpWZDBJYUU1WXpr?=
 =?utf-8?B?amFXWG9rdjhiQTh3RXZTWC9zSjdFbmFTWVhPRlRvZmpuMHZrNFY1M0prbE55?=
 =?utf-8?B?cGRGQldxancrbzlJUFk5bWdwbGZnZEVNRHVXMEtCcUc5OUw5dVNqUlFFZ2Ri?=
 =?utf-8?B?cnJUNi80UDRTc1U2WnZGeWFXdlI1SGFTVU15L3cwT3phaW1lUnZ2cEpMbGhz?=
 =?utf-8?B?RlNXbmJlUW5ESFlIaGN3Uy9HakhtbzJVVVdiRWxvWGEyaUdaMURZeTNDdnRC?=
 =?utf-8?B?RkRKeXlzZWMyNm9qZ1ZIK0NJMVdJQWtraXV3TXlVbDRWK0YxaklGY1E3R09q?=
 =?utf-8?B?dGJKRFduTFA0eXFTMmY4dEQzbUo5UmNjT3NMR3ZYd0FVNitVU0MvTjNYME5j?=
 =?utf-8?B?ek5uS3BZWnBQTWRUWWgyblZZeTVHeXQ5OFJ5cGpRMEdGNGNkaDg1ZnpkVWpB?=
 =?utf-8?B?S3dJMmxXZlhsbTF6UnlteDcyb01qYmMwSytXZEJnS3hlZmV6L2ErR3E3ZG96?=
 =?utf-8?B?OWd3c1lLM3JrZGZDNnltYm1WN1VjWE5uM0hpRTc1MFhRaGd3VEJZOHcvZWp4?=
 =?utf-8?B?MjhaeWhJNFpZQ0FPdUtvWkRibUh0eXFONEErcVVQemZqTk5yRGl0NHZORjlr?=
 =?utf-8?B?RmhlRlVzYXNUMzljWHQ0WnA1bzNqNmRFMEZMYTA5ZkxsWW9udHVLVlErTWl1?=
 =?utf-8?B?cCtqNHNUTjE3ei9GYWFHTExMMnM2WnpZRnlIZFZ1bUd2bmx6K3BsVys5M3FJ?=
 =?utf-8?B?eDV2RlRUUm1sU0llblZlZkpTYWdHTzhBd2ZXdGZBc3RFazkyS2V6QW85eEp2?=
 =?utf-8?B?R0VuQjNMNVI4OFRhNmNTdU55Q293YktBRWg1Y2RtNlliS1llWnNOUDVYTWNM?=
 =?utf-8?B?TjM1TlB1c2VBekw1cXdWbHNXR1J6WWl2cUFTWU5jMVdrOFJmeWZoZVNYUzUy?=
 =?utf-8?B?Q0EwcnZ0SW9LdFZLT2VGUXF2UkVZdGVUT1IwaHJWbWFqdWdoM09sTnJPTklx?=
 =?utf-8?B?RUpDREI5WVRNY2l2RVpKWnlkR1o0WWRpZzdMckUzWVJnOVVMc0R0eXNkandm?=
 =?utf-8?B?ZFZJbVlWdFMwYUdvMW43MGNhVGNOeWxLYTFlY2ZDa2tPTXFvS2hmYVl0SUdm?=
 =?utf-8?B?WjNFSGdqM0lEWDlUNDBmTklNS3BCYW9vYXU0WHRwUGFZaVlUL0VOTHZpd01q?=
 =?utf-8?B?bTlFYU5YWEpabldidGNIRkd6SFRGMjJTUitHM3hYWDEyeStTSWwzQlZrRTcy?=
 =?utf-8?B?RU9MTWsveXB0Q1plcUxqYXpYVUV0MldJYmVIRkRUSXpzSklTaVkxQ0lOUDNX?=
 =?utf-8?B?N0dEdG14bVVKSzlHZ0tvL1p4eVh2dXl4STY1bEVpMUlkcXd3NEJxODR4QUNC?=
 =?utf-8?B?dUtHMllYM3JlM0RzYlUyK3Brbkl3R1NHbXkxWjlwK2M1UTV4cU53WXg3Qktn?=
 =?utf-8?Q?qkwbH2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUFxZm5Yb2ExbmhqWHNCbzV2K1VuYno1RFAzQnczRHU3UjliS2FKM3hJdHpn?=
 =?utf-8?B?SmpOQVpGaG5STnk3aldLNGNkaEtBNUd2QkU5OUtrWGk3aEpnclRRTHZwdnNW?=
 =?utf-8?B?YktmKzc3T25meFNrNTlFbUwrQ1dzVGgxa0M5RFE1UU5icVljb3BIaXlnZFdu?=
 =?utf-8?B?OGpFQkhHemNFcEZxZWI1RHZid0hMSEF6byt0b21oT2NQeUh6blNLaGJ3eGgr?=
 =?utf-8?B?STg4WUtQN1dLQ2F3NjA0bWhaRmx2STZRMDJLUm11d05IVmxIaGNuUUdPbk00?=
 =?utf-8?B?SGRiSm1MQWZFaGVjWWdkeHgwQmNRMFBLZzhLb0tyOEhrL0dOQkI5L1lEU3JR?=
 =?utf-8?B?cFpCUGZsNzBUTG1nQzVYOUFWQWtRbEEvS0lGUkdxdFN3eG9IUVNvd01ZdXFy?=
 =?utf-8?B?RWNYMnZVMVZvVi9WYlFuVUhpdDl0Y0lFTmRSeVprTDZKRnk2ZHlHRzY1VS8v?=
 =?utf-8?B?eTEwRjhEWnZvZWdHVlkrVVk2NU0rd2JFWEtVK1huVmZLY2E0K3BNNjhXeWtr?=
 =?utf-8?B?Ui93bE5FMGYwbGJ5aEJnVUt5UTNERTRpT2czRi9rTVBUdnVFU1hMMmd5QlRu?=
 =?utf-8?B?TkVwRWpheE9rSC9SZThYcDNxK3hNdVFFMWJYRCtIdmFFN1hSQW5kU1JUUzdX?=
 =?utf-8?B?ZW5oWjZHS29TZHZqWktvbXg2dllkaWhzY2JiTDlwR0lEZC9ZeDZNWGcrbTY5?=
 =?utf-8?B?RFBycnFoYTQ5VWZmNHZlMzU5cFFmV3JXUmw3bHkyVW1JR1dUdkpNRlVBVzBZ?=
 =?utf-8?B?ZTNkbHp5ckVaQWFpRU83Z3QvUVZZemlxYTE3dTZBbmNrNnU3MUMxcjk1aWdo?=
 =?utf-8?B?RncxOWFSZ2pCQ0FSajhlRitkb3oybUx5Z0JPbUcxZnN1Ryt4emNkNkhtMkVj?=
 =?utf-8?B?a1pTWkI0Z2dZTVdabUJNakVYZStnU05NeHFzakQ5VWxvYTRuWFZZMFpHbWZG?=
 =?utf-8?B?eDJGcC9SSHN2cTFGTGNybnpEZjFOSW05aDBJR2hkUG44cHFuZFNKUTlSTFdl?=
 =?utf-8?B?WlE2UnMwMmEraXpQb2o2WXA1OHl3Z1BEOTJ0YmFKYXBSQVFtdmVkZTNqT0dr?=
 =?utf-8?B?L1ZHUmo1d2dkcVhrcVg4RERtcWMxMzk4TThwVHArS2Y1VzNjRlZKTkRBOXA4?=
 =?utf-8?B?N0orUnl2czlFOXdDVVduMjV5N1VoZU5pdjF4d1dJSG1MUU1FZTU2UWw3Q3Nq?=
 =?utf-8?B?Y1FKMXlYb3BRN2FnSndHNFUyRzRVdGFFUUFlSWtHTkJ0L21GMlBoY3dITm1t?=
 =?utf-8?B?bG9tWHFNeFFhZGtUc09sQVkxUEx0c2xkSXVKbWYyaFhrb0EzcmRqSFdtMGdj?=
 =?utf-8?B?dHh3WEE3NXBsRnpMUGJTWkRSb0R5M2JqcnVpL0paNVArNm9HdnBqcDRTRXdq?=
 =?utf-8?B?LzAzTEJGRWxxRkRIb2gybHZVQjVGMUxJc01jRkUzQTYzWGkzWXliazFyLzlo?=
 =?utf-8?B?Z1JMdFZhZnBKYnRsQmxqSU5wL2tISWNtSzdTWFVEcGRkSk5vRUpsR1lzbThD?=
 =?utf-8?B?NER6c0cvY20zYkwxeCt2TFM2Y3VmOTg0TTlXa0hSNmEyb2QxUUVFY2k4dk1k?=
 =?utf-8?B?MjZYSEVVaUxZQmhQVEliWGVFSURyZE9JVlhNYnQ5anZ2eXRxcGNRSTFEUkhV?=
 =?utf-8?B?Y0I4UkRmdkFQV251VTZFVi8vTDc1Mk9GdEl5Y2czcGJLZ3FoMnp1K29aSmdK?=
 =?utf-8?B?Uit0aTUwNWFwVzFuWFJiZUkxWkxSamFmd3VUVzRia0sxRTFOV0xpRHRCWlFi?=
 =?utf-8?B?QmJhZjVDQ2d5TFNKU0NjVVVwUU0yK2JZRWRsMkY2Q0Y5bTRoQzNFOTF6MSs5?=
 =?utf-8?B?TG5VL0YrVzcxTTdNRVZOYnkzMkxJMXZhdWl3YzZ1MGJzVEFMV3VTRXFlOWhm?=
 =?utf-8?B?cWZ5TWtPOVU5Qy90YkZQQkt5enlIQ0NxbWowQkNrck9GN3gvUnR4UDJGcmx0?=
 =?utf-8?B?UU9Yb0trWFI4clRpQlk3RmJXUHR2dm1aUmZCeWN5VlE5ZXlSMWR1Mloza3JW?=
 =?utf-8?B?KzlmRzZlZW4vU0RuR3NvNStjWFM3L3NVNlBHVVpmSmJCZXoybit3cFRjL1Yz?=
 =?utf-8?B?SFZTZS9DNnVrc3dUVVgrYUNwQWxoVlhCMC9vWWIyRlBCTE16d0lOY1ZXSW9Q?=
 =?utf-8?B?dTdqeDU2emJsZ3l1ZUdCMDduOHpxb1Y2Zk5GTzQ1Rm1Fb04vU25rMlN4MmVZ?=
 =?utf-8?B?UHc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8ClYvuas0r2xxcD1fuOfoNI2"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f12dbb-f7f9-4acb-450c-08de0bd8e40a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 10:52:09.9476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gpqn9HFQr8q+0zJzVBpF6aqqdb0CrFA6HzowUUwj0TtEIDo9hgbILzV4bfTk3LPi1hSOKBdyntGUfWI8Ox41pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1898
X-Proofpoint-ORIG-GUID: uM3KnWkUC6yXFjij3tdgoMS8ayC6nvWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA4NCBTYWx0ZWRfX742Fq9HnoIdD
 0jMUxIqAOyKbCvyfZnj5e+SrX8h/z6smZjFf/ZFinhSB1C8pVmvtq5X1AUNT4ICcEGMPLUzG9OL
 /P9QbuO8GDVz82UQpNfBh81hAEEYWCKtPB0sddVgRNRxArHbadswxLMTILFBrC/nd0H+DzhPjxh
 UHGJcE0gFspSRz17uytSXBMh9Hgd14uNXauR92+Z7HSG0Y8USCTEjaPaxwjuHYZQ0HnHYyE5f80
 cEtj+4wUhGrg7bNrRvrLOyK5nHEPSMFHTcNRI5FmFLfbo3ECpggJohHTurEHhjI6rd6SnGtHHxN
 ZkHBSfdEcKqH0jTUpgpto/fSE7yuzkczsDqaei9k9GTgFCvgzcD7J7jJLs6DPUGI2ugvn+tkIIE
 GoTIanUFz6u61JDAF8eqGCMtrgqmhw==
X-Authority-Analysis: v=2.4 cv=H5PWAuYi c=1 sm=1 tr=0 ts=68ef7cdf cx=c_pps
 a=e0JUR8hJ9jH4KmauMmA2cA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=r_1tXGB3AAAA:8
 a=vGZ9WZSlCGPvlxs3FY0A:9 a=QEXdDO2ut3YA:10 a=5Xx2JvFwn3kT6zIZwiMA:9
 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: uM3KnWkUC6yXFjij3tdgoMS8ayC6nvWi
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

--------------8ClYvuas0r2xxcD1fuOfoNI2
Content-Type: multipart/mixed; boundary="------------N2AKETDTt7oPe1joDhfliaeQ";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Message-ID: <b5b47ad5-b3e4-4213-84e9-9e649a250237@imgtec.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <c65950f5-010a-4d5d-88d9-60697eeddb46@imgtec.com>
 <f4e1897c-7073-4ab0-92b3-6f7d69382825@mailbox.org>
 <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>

--------------N2AKETDTt7oPe1joDhfliaeQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Geert, Marek:

On 15/10/2025 10:10, Geert Uytterhoeven wrote:
> Hi Marek,
>=20
> On Wed, 15 Oct 2025 at 00:48, Marek Vasut <marek.vasut@mailbox.org> wro=
te:
>> On 10/14/25 1:52 PM, Matt Coster wrote:
>>>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue=
=2Eyaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>> index c87d7bece0ecd..c9680a2560114 100644
>>>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>> @@ -13,6 +13,12 @@ maintainers:
>>>>   properties:
>>>>     compatible:
>>>>       oneOf:
>>>> +      - items:
>>>> +          - enum:
>>>> +              - renesas,r8a77960-gpu
>>>> +              - renesas,r8a77961-gpu
>>>
>>> I think this can just be renesas,r8a7796-gpu; most of the devices in =
the
>>> dts for these SoCs appear to use the same pattern and the GPU is the
>>> same in both.
>>
>> Not really, the 77960 and 77961 are different SoCs, that is why they
>> each have different specific compatible. Of course, most drivers match=

>> on fallback compatible, since the IPs are mostly identical, see this:
>>
>> $ git grep compatible.*7796 arch/arm64/boot/dts/renesas/r8a77961.dtsi
>> arch/arm64/boot/dts/renesas/r8a77961.dtsi:      compatible =3D
>> "renesas,r8a77961";
>> arch/arm64/boot/dts/renesas/r8a77961.dtsi:
>> compatible =3D "renesas,r8a77961-wdt",
>> arch/arm64/boot/dts/renesas/r8a77961.dtsi:
>> compatible =3D "renesas,gpio-r8a77961",
>> ...
>>
>> $  git grep compatible.*7796 arch/arm64/boot/dts/renesas/r8a77960.dtsi=

>> arch/arm64/boot/dts/renesas/r8a77960.dtsi:      compatible =3D
>> "renesas,r8a7796";
>> arch/arm64/boot/dts/renesas/r8a77960.dtsi:
>> compatible =3D "renesas,r8a7796-wdt",
>> arch/arm64/boot/dts/renesas/r8a77960.dtsi:
>> compatible =3D "renesas,gpio-r8a7796",
>> arch/arm64/boot/dts/renesas/r8a77960.dtsi:
>> compatible =3D "renesas,gpio-r8a7796",
>>
>> I can turn the first entry into renesas,r8a7796-gpu to be consistent
>> with the legacy 7796 name for 77960.
>>
>> Geert ?
>=20
> Please use "renesas,r8a7796-gpu" for R-Car M3-W, and
> "renesas,r8a77961-gpu" for R-Car M3-W+.

Works for me. I mistook the non-0 version as a generic name for both,
not realising it was just a legacy thing. My bad!

>=20
>>>> +          - const: img,img-gx6250
>>>> +          - const: img,img-rogue
>>>>         - items:
>>>>             - enum:
>>>>                 - ti,am62-gpu
>>>
>>> You also need to add img,img-gx6250 to the appropriate conditional
>>> blocks below here for the number of power domains (in this case, 2) a=
nd
>>> clocks (that's more complicated).
>>>
>>> These older GPUs always require three clocks (core, mem and sys), but=

>>> it's not immediately clear from the Renesas TRM how these are hooked =
up.
>>> I can see three "clocks" connected (fig 23.2 in my copy, clock detail=
s
>>> from fig 8.1b):
>>
>> Which revision of the RM is that ? There should be some Rev.M.NP at th=
e
>> bottom of each page.
>=20
> Rev.2.40.

Yes, that's the version I have too.

>=20
>>>   - Clock ZG=CF=86: Appears to be a core clock for the GPU (3DGE). Th=
at would
>>>     make it our "core" clock.
>>
>> This should be 600-700 MHz clock on M3-W , so that sounds like a GPU
>> core clock.
>=20
> Agreed.
>=20
>>
>>>   - Clock S2D1=CF=86: Appears to be a core clock used on the AXI bus,=
 making
>>>     it our "sys" clock.
>>
>> This should be 400 MHz AXI clock, but wouldn't that make it "mem" cloc=
k
>> ? I think this might be the clock which drives the AXI bus, used by th=
e
>> GPU to access data in DRAM ?
>=20
> Agreed.
>=20
>>>   - MSTP ST112: Appears to be a whole module on/off control of some
>>>     description, and definitely doesn't align with the missing "mem"
>>>     clock.
>>
>> Maybe this is the "sys" clock, since it toggles the register interface=

>> clock on/off ?
>=20
> Probably.

Yes, this is probably correct. I got my AXI interfaces mixed up =E2=80=93=
 we
have both a manager interface for accessing memory (using the mem clock)
and a subordinate interface to expose to our registers (using the sys
clock). Here's the summary table from our system integration document:

   +-------+-------------------------+------------------------+
   | Clock | Modules Clocked         | Dependencies           |
   +-------+-------------------------+------------------------+
   | mem   | SLC / AXI Manager       | Run for all operations |
   | sys   | SOCIF / AXI Subordinate | Run for all operations |
   | core  | All                     | Run for all operations |
   +-------+-------------------------+------------------------+

Cheers,
Matt

>=20
> Note that both ZG=CF=86 and S2D1=CF=86 are always-on.
> MSTP ST112 is the only gateable clock, and it is controlled through
> the PM Domain and Runtime PM.
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------N2AKETDTt7oPe1joDhfliaeQ--

--------------8ClYvuas0r2xxcD1fuOfoNI2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaO982QUDAAAAAAAKCRB5vBnz2d5qsIEL
AQCWq8pFRurOvNSr+zCGcxsOWOwgDdloNi9TvHRndL8x+gD/f2a8ED/0Z7yST1JMvbr2WEWsLVBE
4S6EG7z4hkFX/wk=
=+BS2
-----END PGP SIGNATURE-----

--------------8ClYvuas0r2xxcD1fuOfoNI2--
