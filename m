Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFdyMYIYmGki/wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:17:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDC8165937
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CBD10E354;
	Fri, 20 Feb 2026 08:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ridD4l7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013071.outbound.protection.outlook.com
 [40.93.196.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB95110E354;
 Fri, 20 Feb 2026 08:17:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fF6uzsDnMgTkyfbG76/aJ81l0FFpzbXe61hw75359+Of8R18eW+j+9qtOgX5hVnq0snwOy3+5lFjPXeN1xDcuft3YRD8A197d0I1lAjibOwsA8A0fARQqx2lWz6YpjoWbYXrPGxTnWCoAuzagrg4sTiopdpdn/e7javdl8ngB7x0hJdb7zHPZpkV+/Gi/8I9qkPt5H78vRhyoc/v7oyQW/npW5yVb1A2Jlxv088WqrJFYZSuKgjZBw6/8YnAUJicIBhI//1rFjYnuiYE8HpUdwPYsPCMshX8EITBehAMlIRHyyLTtmTq2A1qmDoKVB+8aJ9aBUUlQ1UAzZq/496fWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LW+/mCJd64tsBXxPrq5KIRjfHyW5njWD2b0vcpgNcQ=;
 b=NpqWdmiXA23bo8WMUy7BoIgunq+KLyoh2Y2o79RwJg3IDPFsL3sBVbHT6NYV+MPiDp9XZjiaUQdwAwh9fbkmnNI0Yula1zqWyntv6xyNmNEKX4R8RmLcVYT8mjQamKyhi3AD3wZLklo0NahxitI57e729xXNen2AEkki5AqLPKajvL0LOf6Ky5Z0+xoSejfF7TpI6ROEww4E9OpZSKV2JAN/xqeLk7JzFdDShvI4GSLyVMkUM4tdPzF+zI0j93JtKDutwDi1exFY3MOa/sMaJuJ4XCEFaJK4YAKbi+2h6ByWwb6HK1Nk5sfvolg4pjKtTLVpbCsSsehyN9GLfBclPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LW+/mCJd64tsBXxPrq5KIRjfHyW5njWD2b0vcpgNcQ=;
 b=ridD4l7vxS1yAI5WKrA5fi7FBsqSt1QnoW2YX4DL9XzW+1ZJZdsiV0CYStPlibpKjWd/mhFjOxU+8A+2tQvxsTFPPaC4GFkSQ4GjnoFF28UU8TIhnYvuz9XH+DQI9vdRkzYV5wIoUCjAvo7dnWlgxZgliQgGolgdAD85j1fWKukwt7fiLJ1v4leOZa4rSG5OB5i0Qqeu0L9NDTyDagcFlEKUJkLjenb+iRDrbAgIZIJvRi7N2E9UkPPXXsniR9OeKm1brcORe238eRJ2jYorte/XHt8Kgm51TLwCqL3vhNnp+N4aNMbJhOYpUzbYS9VQuuq5x4yyHvmawd+TyBnmBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by LV2PR12MB5846.namprd12.prod.outlook.com (2603:10b6:408:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:16:58 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:16:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 17:16:54 +0900
Message-Id: <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Dave Airlie" <airlied@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-6-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0266.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|LV2PR12MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec17444-06a1-41ff-5a9c-08de70586a90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eG5SNi93WlFISEtycUlTczVxLyt6TUFkS1JlWjNiZlAxdFJ3VDYzYUtRUE5F?=
 =?utf-8?B?S2RKZmt0ZmV2RDN1T2dsemJoOXhDcGF5UDFzSlp0RkpaUDYxTFFpZmdKMDJD?=
 =?utf-8?B?ZE5oYjFibXlYRUU0aHVLaWMvUHh5aDRxNVlJWWNTZDJYV3hPdnhoTTlnQlZY?=
 =?utf-8?B?eVkzc1BCTFpBa01HS2hUQVVqcWtoaHJCLyttVk43dDFUVUNKaXl0MmlFYm1S?=
 =?utf-8?B?MmlxNVJwOVZsM0pVT3dwR3BpMnNjTUc0REdTaHcvcjRKaVd2V2xrZWtCYUhi?=
 =?utf-8?B?RjMrZGlIR0FTVzBGazVTeEJ6Mm5LUmsydlNyZG1sZVNKYi9WVjdQVkNyVVNJ?=
 =?utf-8?B?VWcvZm5Sa2RaQUlidXVzYy9aOVB2VUlUN3o3ZEpyQ0NhNnhtVXZQY1ljMmxC?=
 =?utf-8?B?VkJGWno4U0FhQ29uTXRrNUtVVm5qeTMyZi9Za2piSzM1cGxOMndrd1NnVk5v?=
 =?utf-8?B?TDFTdGNkWkdwY3RRYXJvN1g5QmxxaVZtWlJXRDYyWkZUb0dwYUVQaVVvWG9i?=
 =?utf-8?B?UHB4RU12WTdWZUc5RXc3TFZ4TlFIS2FqK1FxeW1PNitQY3Z6Vy84NlcvN2E1?=
 =?utf-8?B?UHlsZ21aanRZdkpLSW1qRHpHdjhLVWhPNDBxTlpsRUhpTHpnbTU1QWR0MUc4?=
 =?utf-8?B?VC9oRlMwb1k1ekxUU0dWdVFBZUhaYUxDMTNCaVk5TFdXV05HM3dWR0ppR3B6?=
 =?utf-8?B?SHBESjA0TTdhMHdIRlMyczZGQXVPcnNlQlBpM0VuOTdRelpvOGI3ZXFERjlo?=
 =?utf-8?B?M1ZWL2lmcXVvMFJzc3FMaDdTUXpzMDRDcHcrVWtIbEd2VTBxb3JBQi9IV1FZ?=
 =?utf-8?B?MzZrdEdLM3VVM05XQXJ1UHVuV1gvaForaThYUGlVMmRTaU5xa1g2aXdWM0Fo?=
 =?utf-8?B?eDV2ajAvc0ZIb3Vqa0thWVlaQmFMZnk3TCs2NU54UjZoOEN6ZFRRd2tiZVh1?=
 =?utf-8?B?WG1Cc0ZBSjJkWDg5cjFuTEREZlVrU2JmZFIxSUFESHZjWjByNUY1VWFQbkJo?=
 =?utf-8?B?RElrbzZpaEl6ZUlvODdNUG5HZW5PbFNmejZuRk5UUnhhNmQ2N3g2cjlNUGRT?=
 =?utf-8?B?WmEzYXBZSzBUUzloS3BUN1ptVmJRMityRG90Q3pCNFVHc0FsOVZwYzdVSko3?=
 =?utf-8?B?SURqbFIrK2hLWnFBYTdXTVlCZlJRcWVJSjNMbEtDZW5VTTRhSFdFLzBtd1lI?=
 =?utf-8?B?NURGZGpiV2I4MTdrSlhid1RVTEJMdlNDL1BBei9TWTkwSmhQUnB3ZHN6M0Qy?=
 =?utf-8?B?ZkxxYmE1dUVQNENwZWF3ZEM0akFRWWZyL0NrM0cyU3Q1NmFqaERTZmRYbXRG?=
 =?utf-8?B?VUdaL2F4S1gxOXRkUGZFQ2RLL1o0eW11b2lJNHU4ZDg5dlNmaHZjQnNoZGRC?=
 =?utf-8?B?OHk1TTVzSitxRWxYOHJrNkdNbzlpUEZmNi90dFZqb2lpZUpIRzA3bGpoVXVp?=
 =?utf-8?B?Y2JLWlZsUk56M2JRK2hJbTNQcWh1TFc5SkxkWWNCdGkzeFUwdytIU2k5c0JP?=
 =?utf-8?B?QURUWWhveFBBbjV4aG1NblVmZ1JvcnBWaU40bmxPRHdpQ0Y1Sm5vNG9oNWpp?=
 =?utf-8?B?QStuTUxmWFZYYnJqY3owbGVXME9nWVA0M1pyaHgvSnZ3a2xtL0dEMUJZR3Bs?=
 =?utf-8?B?R3VnQWdsZVNhRldBMUkzRE1XME05YWE5N2JWd3RyNXlITyt4ZXYyd0tGeVhh?=
 =?utf-8?B?WGsxNjg1SG9tTlJRdndLR0xmNndHU0dDKzV6S0EzTVhNc1dnSDFMaWlvRE43?=
 =?utf-8?B?RUtlc29tYXNNSVpweW1WY1Y5TXFMbmlPZ0Z5aTIrY3l0TzRvVFZnR0k3bFR4?=
 =?utf-8?B?ZXBzL21QczhxN1FUMFRLTkhBdTZLc3o5a0JKYW11bmNOeHBVRXVySjRoMitR?=
 =?utf-8?B?bHhTZjJndUpuUmJ5NVZKbFJmaGtpcWZGNFJXcEI5QnN2WFpZQWNFZDU4L2Qw?=
 =?utf-8?B?NUVZTW5hRFVCZG16MVlhRzR4MTkzY1VxcUJwaDAwVGRPN3J4NlBGZTFmcmpS?=
 =?utf-8?B?TEJMamI0NXRiZWlxRlZDNFoyVlI4cjNqVTk3UFd3OGhvK05Ib3NDbkVsc0Fk?=
 =?utf-8?B?SjhvMHFoWWJvWFlSOURCd2FvbUZCdFUxaVdLcklMNVppaVZjMWd4SUNHMnhw?=
 =?utf-8?B?dnRXU2QwbjJpdXhQVmdiS3lDMkNXQTJPYzdocU02ajdKQ3BzYjQxaXFFYVZF?=
 =?utf-8?B?ZFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFNSQjVkRGNjUjZpNzFnZDRxTnRFVDdEcVFJSC9IdjNLYW4wT2cyN2hPRTNu?=
 =?utf-8?B?OUgzV3dYdlM5QW43K3YrOXV0RlJXaFZDcmRteUxQZTU3NG9Jb3RHMnBvdHc4?=
 =?utf-8?B?cGlDM0VYS3ZpZlVGSXpTUFY4Sk1UeEpCOXp6RGtjMUZCc1pYTGFjS25nU3E5?=
 =?utf-8?B?bUlGQWlVZWtMYXhPWnJqYWwvN2ZRQjhRREFVRkU5V3NCSGp6RVdWWG1YMitC?=
 =?utf-8?B?dE9Vd3NtVysyMVNtcUhacGVFZXdWU0JJMGI2SkNsZ0EwQXNaWW5Kejl5R09l?=
 =?utf-8?B?T3Q3bVlPaU8xUDBaTHo3elBJSWxMN0lxMkF5a0JuN0ZFMTJoLys2SVgvVy9z?=
 =?utf-8?B?NUZMdVZaWWFKYklVV2dSWkRuRzJoQStLTkJyM3FIbmZEQ1lFRTZhYVJkT2tm?=
 =?utf-8?B?cTBIZnVSTVM1ckxxMWtQUGQrOU1ZY25sTHJOYzdRekdOSlM4c3V0RHlsWWRs?=
 =?utf-8?B?NHBGRTB3NWNOU1dpSkN1N2hka2wrZGNuMUJYU2NNRktZU05CMUdwbGVubFp5?=
 =?utf-8?B?SVVOa2tGNnJOV2R1aUtOZEoza1VNK3I3OGhzSmMveTk4RCtFZGhKNGFIWXZl?=
 =?utf-8?B?ZTJnQzdrVk5YaVlLVDhnNmt5N3dNMi9Kd096NXUyMTZkZ05tZ2pscjBPZzB6?=
 =?utf-8?B?bEZ4czhiZnpTRHlJNXBmcCtLVFJyQ0Jka2gzYXp3Sk1iZHBlVEY0aVU2ODNm?=
 =?utf-8?B?YUtwZ3Blb3FMRm5SS1J0MWlFZ01JUjlheTlXMFVZRGN3cC9oaWJkT2VwQ3hz?=
 =?utf-8?B?blFwRTNYc0pmbTRQbWtOdkwweEZBRDZ5cHRTMnhVSkVXQWtVaXY2K3JRb25v?=
 =?utf-8?B?OVQyQWRDSSsrK1JCdGlOVzdWaXhzb1F3Q255YnBHNm02d3IrdTBCYXY1NjJQ?=
 =?utf-8?B?Z0o2VXR0REp1QnExNFVNS0YrNTE0TkJaM0NvaFcrTDRveW0zeHd1Y2hBWEVI?=
 =?utf-8?B?Sng5UklzQ0pYM1oyem5JSkJtdWFJRzdGNmxEdzVZQUlrWTd6UUljUU91TDZF?=
 =?utf-8?B?QVFHTmJjSFRhSnZYbDBMQTR5T1gxeDFleHlKT1NIMFN4dHRZSUU2OXJ5Um9T?=
 =?utf-8?B?aVFlVFBKWlNIOVZ6bWpXZHE4TWgwK2dHS1VlS2VUclQ5RUkvT08wQlBya2Zs?=
 =?utf-8?B?ZytVcTgrakhINWRFWVBZMkNDRitibjFtLzN4Z3AxcGlkL3llWDBocjM0UlZm?=
 =?utf-8?B?LzA0K2ZtZGg4aWNSYlVqRzl3UGZFeEdodU5TK2tFdUh2K3BndmJhSXY5R084?=
 =?utf-8?B?YXRmRzlYSnZHK2lkVUk1cmowK3RsMktwNEg2SXp1dU10TFVMSXo4M1dPbzBB?=
 =?utf-8?B?SDZRc3VwNmdSNDkwSWFSOGtkYUhRcjVlSFZsT09PbGxvem1XMitoSWNqTG04?=
 =?utf-8?B?UXI2R3dEYTIrU0doZlIwRnV4TWdXVDVydTNwU0JSQXoxKytRNVlWNjFkVnlw?=
 =?utf-8?B?YUExcUZ6dGJmSk5CY2QzL3Ewb1dtay9ScWIwQXpEdnBscHR4a0E2OWlqRnN2?=
 =?utf-8?B?SHVxeSs4Z2hWWEFlbG1CR3poNis3TlFyNm9oTExSWGxhRk9XUDVzREhqVEhq?=
 =?utf-8?B?R0RiVjJqMUJuKzEzaFRFZ0NLRDQyc0VvR29Nb1JCQXA2ZjJURVlySmgzd2Ix?=
 =?utf-8?B?dzViNnRoYU53T3g1NTY2bERpWWlXZGFlOFQyem5MWDNITW1uVjJOOUNvajlR?=
 =?utf-8?B?dk5XQjJqakYxdGh6UnN5UjlaY1orcjJnV05xbkl3N2hPZEh5S2o5bDNyY0J4?=
 =?utf-8?B?azlLZnpMeU82bGpsN3BCRkw1cmliZnNqaDE2T1hKaHFwMGxlN0wrVG1jUk1w?=
 =?utf-8?B?d2RycW0wYjhSS2JhSmI1QytFdHBMQnlxVDRjcXhoYzNkQzdDZVB0WC9XTXhK?=
 =?utf-8?B?RU9uMGNxSzNQSlNJd1psTm1WMTV4V055TUpDeDNEdDlqVlR4OSsyZG83NkhZ?=
 =?utf-8?B?bURtaHNTRVNlaWVGQVFFcEVFcUw4SjNXOUxXcWQvK0wxZVNVV1lvNy8xemdr?=
 =?utf-8?B?WXJ1dEdsRWtUdkxvSmRub20xS2pUTDNySVA0ZHVDVy85ZWc2NVBpc2pKL0xH?=
 =?utf-8?B?OHBNeXd3dkpBQ3dlNDczakFWeHdwZnplK09MVU1uU1NyOGxNS2YrU2tGSnF6?=
 =?utf-8?B?aFZxOG5zNU56Wit3WmpvOFBBa1g0NXprZUtDcU41OW9sRXhBRTFzMHdqN3p4?=
 =?utf-8?B?R3lsVFNjSWFER3NMM014cStqaVNENEwzVlRyRGd6cCtUelpVMW83Y1cvdEJZ?=
 =?utf-8?B?V2NZM2tQK21pRmxxL0xiTzBPUUNCWmJVUFhyMExXN09GNFIwUkxZd200OTJN?=
 =?utf-8?B?aE1nVFJpNDNiaVcwSUtBbmFnZ3lBSXFZK3lVenRxTUlaSHdjVHJQMlpNdzBm?=
 =?utf-8?Q?KpK1uABOJ24myKViudFnHZ/Lk08CtPxmO3KrP1FA7dEcc?=
X-MS-Exchange-AntiSpam-MessageData-1: fYPLh4ij/jc6Dg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec17444-06a1-41ff-5a9c-08de70586a90
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:16:58.4194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l06Ib0Y0l0LGQ9kh+00Ne9l3pc7/5KBaQDSSb0fxRG7JEx3ckZX45iBAT6QIrZArqfO1gOm4qaYBfNLDdQvzbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5846
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 4FDC8165937
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
> +/// Create a C doubly-circular linked list interface `CList` from a raw =
`list_head` pointer.
> +///
> +/// This macro creates a `CList<T, OFFSET>` that can iterate over items =
of type `$rust_type`
> +/// linked via the `$field` field in the underlying C struct `$c_type`.
> +///
> +/// # Arguments
> +///
> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bin=
dings::list_head`).
> +/// - `$rust_type`: Each item's rust wrapper type.
> +/// - `$c_type`: Each item's C struct type that contains the embedded `l=
ist_head`.
> +/// - `$field`: The name of the `list_head` field within the C struct.
> +///
> +/// # Safety
> +///
> +/// This is an unsafe macro. The caller must ensure:
> +///
> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to a=
 list that remains
> +///   unmodified for the lifetime of the rust `CList`.
> +/// - The list contains items of type `$c_type` linked via an embedded `=
$field`.
> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compa=
tible layout.
> +///
> +/// # Examples
> +///
> +/// Refer to the examples in this module's documentation.
> +#[macro_export]
> +macro_rules! clist_create {
> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) =3D> {{
> +        // Compile-time check that field path is a list_head.
> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
=3D
> +            |p| &raw const (*p).$($field).+;
> +
> +        // Calculate offset and create `CList`.
> +        const OFFSET: usize =3D ::core::mem::offset_of!($c_type, $($fiel=
d).+);
> +        $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($head)
> +    }};
> +}

This uses offset_of! in a way that requires the offset_of_nested
feature, so it doesn't build in rust 1.78.0. The feature is already
added to rust_allowed_features, so I think it's ok to add
#![feature(offset_of_nested)].
