Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHvCOoy/l2nL7wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 02:57:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6726B1642D4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 02:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D00B10E766;
	Fri, 20 Feb 2026 01:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tGVKUIqu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353F810E766;
 Fri, 20 Feb 2026 01:57:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wbv3hoSiZZ1LTrgwG8dw3N1FRBhOza7OOVZTx18CMtA2r1xYK2ho551cnLaHbIrtKMkTBIEN25M47ZHIjaSfaQOaG1eA5nf40qJme2w8cqVcifPoXlLo9jrbUEJDIxYonY7hfTRcy2fzCbZJIrsztDzFhX/nMm+R4R4ZkNu3wBq44k9/bY4wJNAuc0GP6mGI/Xp0xfjevV9FqLIjVMg30UxT27ifBbCmXXnOE92P8eh1/6qfM7/mhrqujAVTbpxbJ30hvCDqL0nB67uE/+7B0e9v+9ptpZZTyQDOysOgNNOzLWyQYvcQxDg/IHhfqZEjeKlyWGIDV2HPj0BeTTM09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZCkcTXnozfSUzpeBwlQrG0AjDqXfI6z1PbQrQYw67w=;
 b=ux4EeuSDfreQjAAZQXdLU9Qqwj2rR5qV0RqNYozUievSmog6eUJwkh/Ih1JW29AaEiYHwwjcebPRYu0DReIDq1ddIwqY14YzFj48RgqFlNLoT37nzvAuC8bIqwiFl+OelwCzTzHaWfOsdVnzoj2/kmC0Z9bT0AWMUoErRLbZyysaqILIwc4mpkLWVY/q7FK2pv1OStmhcXLVP/WbjAcrtXXyK7vDwDiCq2y91IbCUzIVXzrAp3vtepN8udDXiuADYyJIqeaDlTeY848JyuynIC+5CEd9Fe+wYLup/fWY3RwWw4E5z7uuXOAsJ16PziNWgv6ECuPlwkuy/N4PLtwqBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZCkcTXnozfSUzpeBwlQrG0AjDqXfI6z1PbQrQYw67w=;
 b=tGVKUIquqqLN/LodbqYuMSxMUeqV6wQJZstBEV3tOdC/Pj8iupNZ7iQVqtM8O+wYwwG0B8B+SLZdaaMK3oQhorHs1Yx/5uoOF3b6H1IJTc52Sxzl55wmaIgg5j1QWwg+1AR559xzun3PefY442RF0AcnB14wqiBup2H+lZ6tut835gg0yovXjKQQ6bzqCKG74xHZJRpHEt0ZMzbyB8muNNammYc41A27jtStm0JcGSNo9aDzYSDI/gUcB2bsNNF2YVYjEWIG+WgdWLh2Py+3PVpy0msfIHDSgkAipzfkH10s908DFmuhbErKkbmewTUUApALhLURayvLbb5B4URI0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6181.namprd12.prod.outlook.com (2603:10b6:8:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 01:57:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 01:57:21 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 10:57:13 +0900
Message-Id: <DGJEZWJ0CXBS.1HN17L6PQL326@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=EF=BF=BD=EF=BF=BDrn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Dave Airlie" <airlied@redhat.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nikola Djukic" <ndjukic@nvidia.com>
Subject: Re: [PATCH -next v9 1/3] rust: clist: Add support to interface with
 C linked lists
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260211-v9-nova-mm-v9-0-a8e261c2e734@nvidia.com>
 <20260211-v9-nova-mm-v9-1-a8e261c2e734@nvidia.com>
 <DGIIMT4F1GWA.12UFBEUAC80VW@nvidia.com>
 <ebd17ac8ab6d1e1ad6a8eb8defa49915@nvidia.com>
In-Reply-To: <ebd17ac8ab6d1e1ad6a8eb8defa49915@nvidia.com>
X-ClientProxiedBy: KL1PR0401CA0017.apcprd04.prod.outlook.com
 (2603:1096:820:f::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a65044-1bf6-4be9-b358-08de70236291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amd6SHM2WG84RFYzSWwzZlpmcUQvSzdGT25wYStGMFgxYVhJZGtTTExVc2Zm?=
 =?utf-8?B?YW9WTkZhbHo3U2d5NUxFeStxQnBiTi90TzZXUlBkdXR2RjJka0x0RFVvWDBN?=
 =?utf-8?B?MjAxZkFQN2owcW5pdWVpU1BOTkdmM1VZbWlSaDVDbGlaNTRhU2NLWGd6Zi9j?=
 =?utf-8?B?dVlBSVd4djlPb3l0Qm1Od3lVVHVzUVBNbUx1dTZxWkFaQUlvOEJ2U1NMWlZa?=
 =?utf-8?B?OUVwazZ4UkQ3RzJ0ajBmYm40dUg4alFPUjB5MURZQ01tZXVoMnBWTktDSmJr?=
 =?utf-8?B?dnpRdFU0TjRGQkIxQmVsWkJFd01aWEczaFBiWnBGcG1HeW1DQytnTGs2UWxr?=
 =?utf-8?B?amlTS0NZakFYcXB3RW1pNUpsSEtxRWpieHRKbXFZSXQvNCtqWEJMaC9jTTI5?=
 =?utf-8?B?Y3BmOVBjM2c5REl5RFV2eWMxYkJ5T0ZUd0x0SXJrS3VZS3FYb3FpaUpObG9T?=
 =?utf-8?B?ZXFneXQ5ZjF5aDIzVnJROC9QNEhONWdPcjV0NXBPYWNlMzhxMTN4Q1pUQVRi?=
 =?utf-8?B?QW9EWWlYY0xqdkpyMmREdGRCNkZUTTJIckF5ZVpsenQxa05qOEtLRGd3YVN2?=
 =?utf-8?B?ME5zSnJ6dWFOOUVKeHRBWmxmV1U0dHg0LzVBNFpFQmg2M2F6OEFlOVh4ZXFo?=
 =?utf-8?B?QWZZNEtHY3FENDFhZ093UTc4elNla1BseGgxTUpmcEVJOGh0eFZKcnRsUWx1?=
 =?utf-8?B?Rk82cmQ2QzI4OUU0aTZLdStCbGNZL0x6aUQydENaWUlKSkVGSWVCbUUveStW?=
 =?utf-8?B?MVVFOXRkUUE5T2ZubGFodkd3SHRjcWF1VmYwRHMxTUtHbVVYMGJsK2pXOXlF?=
 =?utf-8?B?ejZjaGdhaEluc3ErUVBxRFRoV1BpMEg5UTNscThvL0lVL3BsTlkrMW1TaW5D?=
 =?utf-8?B?c0l6VlhtVTUzdGxqeGVDbGlCbFRyaFRIU1docHFXVU1jRTN4NTl5TzY4N2Jl?=
 =?utf-8?B?QmZ1OGhlN3hoVGNwRUlZNGVDUHBWelQ3bmgwNkt0U3hVNStOREJIU0w5aXlu?=
 =?utf-8?B?NExhcmZLRHI4Q1FBQ21OektTQzd6cE9LaWJKaW5ZQUY1Y3lRWUpESis3TEZQ?=
 =?utf-8?B?Q1Q1ejhGeWZtbGlYVU15TG5hT2kvNkVJU0trdGVMTXR2YVQ3emk1M2FIbXZD?=
 =?utf-8?B?aVljSnpXa05vY0lrSkI2aDFmdUsvQ1I3VHJwS1BPRVZjbE1XUEJtQ2txMnVi?=
 =?utf-8?B?dWg4SjNQTFhkNExncUxjM2ZNZTZoL2FXY1U3TGhrcldOTTN1dTRwVnYyd1c3?=
 =?utf-8?B?N1YxOHNPYXpOTEZaU2EwMkdENUdaKzZHSGwzTGNrSTdicXhXUERpM0tOM2Zl?=
 =?utf-8?B?V0NFYU80d2tzNmRYTGhZdWlrUFBwajdMMVVML0l1amZjU21SNy9XWW1vOU1B?=
 =?utf-8?B?cTFjY1A5c29zVE90b1NKRzFTeUJYaVVFd2dvaGVsMlBSU1lDUWZSSkIzUkUw?=
 =?utf-8?B?aG9MZGZZdVBCVURGeDNqMElCbWZ5VUZ4RVhjQkhJSGViTVRkOXQvSUZYRHl1?=
 =?utf-8?B?RlpUWVBTejByM25RcGVJY0JxN2dWQm5vYnZ5NjY1UE9RSk1TaG8xRG5OdTlo?=
 =?utf-8?B?NmhUdFJuRkZYK1RQYitxakhONG0zMHZnODg4WFhGVHVEN2RJbUdiWGFrRHdE?=
 =?utf-8?B?QThTV3k0Kzh3anZLUkYybzR3QmJ0djlLU1JUaVA0NnJkeUpZR3BlRFVZVlBy?=
 =?utf-8?B?Q2VNMEZmQmo1YTd1TGs2dDU2NVlscVNvSFRjZ2JuTVEwVUM1Wi83bnZHTXM4?=
 =?utf-8?B?eFc0U1pyQXhOMzM4d3NlMmoyclRtNWVraHIybDdOUlE2RUFOekxuL1ZPWk5u?=
 =?utf-8?B?OGwvT0k3bTFTU3NNS0tPZkdMellKVlFLU004Q2FGbXh2d1VkZXdaVWpPOEN0?=
 =?utf-8?B?QWdaV0tiRmJ2enFrQ3M0elVxdHgyNWVsR2xDZ2JjL1RCUHk5Z3cvdjJlUmkr?=
 =?utf-8?B?T29WYWhNZmYrZGJjODRxMDA5RnNmdWVJZnRudHdaTTdkK1BnOUo4aDZxekNF?=
 =?utf-8?B?Mlg5RURXRUhzdVFwN2VQckY2bDlYWnFCTGIwMytpSkRzR3BCZDIrTnV1bEp2?=
 =?utf-8?B?bXVZMmx2N2RqMmFkbzB1THdiNllWYmVFc3RnUTlibGFCSGxMYzdUVVBIb1Z5?=
 =?utf-8?Q?F+qg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1NNdGErcms0Z2Q5V2ZsUVVaNk5mbzZtQzU4dGt1dFdyaWQ3V1pNSTd0MUEx?=
 =?utf-8?B?V0FOdWFON2UzUkwyVHJ2aHFpZ2txckQxSjNvZjRiak0zd1A2UktVc1JWSW83?=
 =?utf-8?B?MWlKQWtZdWdmamNUYmJTS0h0ZGZ1TkV0Z3FySTdtYWRjYWVXaWF6TWc5dW5C?=
 =?utf-8?B?cjE3TUtpY3J2Z0xGemxmcmpmSTkzZmNJZXVMN21HVEN2MGZ1YmN3cFkzZ0VD?=
 =?utf-8?B?Y2JDdm5Ham9iZVAyKzZRQTltdDV3OHdkbzlzNGNsR2lWSi9pTUdrT0Z6clRG?=
 =?utf-8?B?SVVhUnFRbnNiVmNZUDIwWVVZN2w5a2ZCRXA3dmtQS21sRXhyWXAyZzBmZDli?=
 =?utf-8?B?OWg2OWx3Rk9nZHdsU0Z2bjBSM2lyT3ZzVHV0dDZhNkp0SXpSZ3c1K3diMThm?=
 =?utf-8?B?VCs4NGFjbVArVVJYazNsYUNoOFNWcXhOWXRWQnRHVzdVc0pxYVlFeWxUUDBS?=
 =?utf-8?B?SitER1Zaa3dKanhmQzJLNXZnYnBndTViRmRrckxIU2tCQ0RCbEZQUktoSWIv?=
 =?utf-8?B?bktaTWxOMXBQSEpvZWRiVmNheE1zaWtqTjdtVitlN0x2S05rOHdnaVYvWUVm?=
 =?utf-8?B?QVNndTludWVXTThjTTRTRytqKytMUmpMMCtjTVRwSlBsTnpWcHZIekdYYmJT?=
 =?utf-8?B?a0ZNckx6WjFaT3gwa1c5SzBpOVJJRVJWMm1OZm5wbHp2QWRIZmc5NU9lclVC?=
 =?utf-8?B?cjZyeW9ia2c2MWF4YUNWbFdmOVdPNWhBcWc4NTExQ0ZrWWFWMmFRYnp2WGx5?=
 =?utf-8?B?U0V3R0d4Vmk1NCsrVnVXb3UzOExITUxhRTFFSndaZFdkcUNFcUZ6cVpIbTVl?=
 =?utf-8?B?NzZ1U1RGakd4YzhmelRrQjZ1TUthTUJIcEFNOFBGS0RjTS9ibnk0ekZONCtB?=
 =?utf-8?B?ejlUYkRYWklDWkVqL3dzL0pPK09DQXpQbmcvaG5qNEJISDZxNUw0TEJHN3M4?=
 =?utf-8?B?cHliSEd5ZS94cVczL0dqWHpxSjVKeXJ5SjZWRDQxSEVSdFpUSXZqZnJpejd1?=
 =?utf-8?B?N0kzMWo1VVpxc2E2QUQxUkdsMzQyRmVFa1NDYktKOEJ6NjZTWlNBSE9yeXNo?=
 =?utf-8?B?OG10a3M1dEhtZUpqRDhEUmZTaUlhdTVYT0k4cHRHUllKTnNWa1dETUhpZkFB?=
 =?utf-8?B?WGgvMC91YnJwZjFHZllJZFZqbFJNejM3WStnRitPUWdCb0x6NHpzL0xuVStW?=
 =?utf-8?B?N3NKSitYSWFDQ0pIdzVWMTVGWDRSMUNBN1N2NUlyd3B4cURiZlhJVEpYbG5z?=
 =?utf-8?B?R2ZIUmczK0ZBblVqSGpGUHVUSExRbk9rTFo2SzdGL1RjbFgyb2gxYnZNNkRH?=
 =?utf-8?B?cmhsV0djWnpDS1F4TlZWalhLNitDbHBVNnNmZFF2dTFLbjQxOW9zdlpxTXRR?=
 =?utf-8?B?eDRpTGR3cWRDY2luSEtVTTJhQ3R1VDNDSFc0bjNLenB2M0lJT1cwOEdYcXZw?=
 =?utf-8?B?T0g3OE5CNjc1MG5LTWJqbHlLemVRbWZ0Y2I2cmxwYnJwZUd3QVVIaHZQeUd5?=
 =?utf-8?B?bEhIck5DVnZqT0FKOU9lMUk5OEVkcU5UNnkxZWw1NFVaTVZYWXJEaGtoL0gv?=
 =?utf-8?B?RFQwcitaR04rVWRQWG4zRmpGYUsxZnkzamJHdVZlVUp1NEgzYTZUV3dVSnRK?=
 =?utf-8?B?a0lBSTBGZjA3dHp5a29hN0pCSEQ1Tm1DZmpJTnlRcnBEMDlYNmJpYW1zaVlI?=
 =?utf-8?B?Y1FkdkZwRzFzSXV5eGIrSU5PT3FXMWkvOXlRM1V1WmtCSksvakZhaGQ0Szh2?=
 =?utf-8?B?eXNLOW5rSy9CU2VQem9GMEhPQmZoSFVFVVB0Q2hwVGN6R2hvUG5tTnpYVTha?=
 =?utf-8?B?YmRFTGExMnRGc0NUV3l4Z2IxM1ZTSEZsZzFqV2NoVW9BWlQ2OUxJRHpNK0dT?=
 =?utf-8?B?MDkzeGdyTVhGWFk1TmI5Zk5Pdk50a2hjdzhZQjg4Z1NSdXp3VHlTTW1LN0hT?=
 =?utf-8?B?TFU4YmQ1WjlxT2NLamJVb09nN2FkN1MzTTRlTTNRNmR2YTNYU3NETlN1ZXBU?=
 =?utf-8?B?K0UwaUF4SVJZb1pWQXUrTGNyUFBreE5yeFFBTmdwMHUzMmpoeHF5R3dTM3Nt?=
 =?utf-8?B?QkU5UDBUL09vSkQxeWd6bUgwSW1oYmJBZk1QUW02dWdxK0o4Zm1GTFBpTmxE?=
 =?utf-8?B?SUVmTmI1V2xEWVhFTFMyTVJRZ2xBQUpJN2ZKWTdmVFR4QVBMazRwSVFjMXFs?=
 =?utf-8?B?dkhrdTQrZjJRaTBhUk51WEZCUHpYQWlpaHBoOFpuaHFPbkpkOWR6ZUdWYXdx?=
 =?utf-8?B?VHZRczd0b2ZCaEoyMXQxNFJYdTM4ZTZtWTJlMlNRdE1zMmVQcm90cUJWandX?=
 =?utf-8?B?ZVB4UzRRRldaNkhsUncyeWlhUlNKRUdhY1RhZWpxQmZTSkNTOFRPUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a65044-1bf6-4be9-b358-08de70236291
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 01:57:21.7546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scmRW4oHeN6pBekQ6rsvq2EuTsKrwMgDLf19iAA93h0HkzroFkCYmDAKhfR68D9oFo4m9BfdQyjn53kTNREuFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6181
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,lists.freedesktop.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: 6726B1642D4
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 12:29 AM JST, Joel Fernandes wrote:
<snip>
>> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a =
Self {
>> > +        // SAFETY:
>> > +        // - [`CList`] has same layout as [`CListHead`] due to repr(t=
ransparent).
>> > +        // - Caller guarantees `ptr` is a valid, sentinel `list_head`=
 object.
>> > +        unsafe { &*ptr.cast() }
>> > +    }
>>
>> IIUC you can call `CListHead::from_raw` here instead of repeating its
>> code.
>
> CListHead::from_raw returns &CListHead, but we need &CList<T, OFFSET>.
> Since CList is repr(transparent) over CListHead, the direct ptr.cast()
> is the correct approach - we'd need an additional cast after
> CListHead::from_raw anyway, which would be more code, not less.

Ah, in that case that works, yes.

>> > +    fn next(&mut self) -> Option<Self::Item> {
>>
>> This method is the only one not marked `#[inline]`.
>
> Added #[inline], thanks for catching that.
>
>> > +impl<'a> FusedIterator for CListHeadIter<'a> {}
>>
>> I asked this a couple of times ([1], [2]) but got no reply, so let me
>> try again. :) Given that `list_head` is doubly-linked, can we also
>> implement `DoubleEndedIterator`?
>
> Apologies for the missed replies! Yes, DoubleEndedIterator makes sense
> for doubly-linked lists. I'll add it as a follow-up patch since it
> requires a prev() method and some additional iterator state tracking.

Mmm, I expected (without trying) that it would be trivial, but if it
requires big changes to the iterator then let's consider that as a
follow-up indeed to avoid delaying this series further.
