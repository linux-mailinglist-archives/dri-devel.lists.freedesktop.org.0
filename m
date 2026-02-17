Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHtMH3HWk2li9AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0220148857
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9828D10E15A;
	Tue, 17 Feb 2026 02:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hqQ+IDAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DF010E15A;
 Tue, 17 Feb 2026 02:46:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9pFZE5i4VtJtY7oIcxkmyBbiGJ3m18Np6CZniqn6Xw8rfpjKAZYob0O0llxAcIa82Zs3EOnAozFw+3NCgQOBKZzO98yjkcE+DIVnjKKxjZHNFRTsJcWszaHAfYNjWXAFCZlboA2JwNLrdy9gzVPSZzZVuqmYdpGL2PwlUOCP0lgGJH1IFJb5bQSAjoI/I6cibnrWCuB1Yus2TIfikJXRRW7DgPmCe/fTs/9SFnXf+2wfjrqwrgM1Rn9AkaLuWBeOr6vp32ky7MfzGubDRSbiv/hp+Y+TFlSipCoXmc41kivyVb8llCIlycGzxCAyO+ZsJwV0F5E/dT4LpwE8aqD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9tCrgbO58tcDEmQ0e2WvmQuBupnSxtdBk/lRC9eII4=;
 b=EW3je60M//uIvpghOrGac5fbcRiHfbAetldXGK7dLekNDd2EpRFvboiV062+tXhM4QLXQvz/kqt2eqIQHgi5dyRoHaz7U95u7BUZ6dh4OdaJvsale4i5s1u7Xog9S9At6VqRzqplDoVaYkVygi2tfdgQwMgPwVdWP5OyIQfSoSjvSqhvLY3AIh7sqjuJzyp8p3lKGuSGgMvJt6MMdCNkOBgtf6XHW/N2OtZjgXFb58gBUUrQH4oTRcbcv2cSt28msh2+oj4hfOluK6fg4GARffxBr7ANIx22SZEcGkv3ADtSepTmZy2wDTC8q9bUwXeoHrCa9uXi6cmKq4ycFThePw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9tCrgbO58tcDEmQ0e2WvmQuBupnSxtdBk/lRC9eII4=;
 b=hqQ+IDAYJ206VEnZS7ium+8BsF+LfCO08D4FDCXAL1W59OoTw2ERg1jCRAoVVwcQuWTOa5hcUvPqwvaxDt2j+EwD4o9laWx2JPZPEZRG0TmvFWSXw0dbjhlN/nQJwaL3C58oaJ8GuKo8h3wp39jvqQHYT1tjOLtPiIh3vUuWhklxvNCOllN1XAwG3j1XLsnXCwG+UHvLjK0ZW8M+4qGdQjoNqDTaOkkXxf8/rpT5jo4zk9Xlm28QYvHaHkV3V6YxIvijvQE7M6GCEDi50soYoWGp7FJDI6Rip2nBNQnXZFhX/YVKcAdOe1vEvfogPyY1ogPNzbYA+yUPxwKyREZNIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 02:45:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 02:45:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 17 Feb 2026 11:45:49 +0900
Subject: [PATCH v3 1/8] gpu: nova-core: gsp: warn if data remains after
 processing a message
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-nova-misc-v3-1-b4e2d45eafbc@nvidia.com>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0146.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: ba9409a4-8ea6-4ee2-cae0-08de6dceae95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0d4TlBmbWtJZVVtTEVzZVhldkhPeFFUdEFwS3llUk0yVXhHU3MwS290dG9q?=
 =?utf-8?B?ZVN4Y3NKMDhKZ2g3YmpEU0lTd21ZQjJKN2NBbEo0bXd2SDNMTTdCOFdRNStw?=
 =?utf-8?B?bEc2SWV0dEZHU0RXa2pRSEZRbHJ5WDRVb2pneVYwaEgxbXNQWDVWeTUrTlMx?=
 =?utf-8?B?NHRHVW8yNk9kaG9tYnJJZkpCRzJBbEh2QS9sQ09Sd285WU1VMVlxVHBXL0ZJ?=
 =?utf-8?B?UDFQTzJTNWtEMjY0bjdpQTVVRzB2RkZjNjVQSzAya1F1em5vczFOTEx1OSt4?=
 =?utf-8?B?aWx5NEdPK2ZhOWJrUjAzbTAySVNlbkt1QXZmdEI0ZFFuR05ERHZKeURQelRK?=
 =?utf-8?B?aWhMQi9PbU1NSnVOa2JJR0FIbnJLa0EvWkl0bGhvZW9tUGlIUHZ1UllNOGwr?=
 =?utf-8?B?WUhKTkcxY2VLVSs2WDlJQzc0dVZ6ZkxRdzFKWHd6SmcwUXFFSHV5Zk5KZG91?=
 =?utf-8?B?eDlGVWxBamxKKzJnRmZjMjYxaEs1UXFFTWticTdtT2pQT1l6WFFGQnlVTmlq?=
 =?utf-8?B?WmhuVXdiUjdKbjRJUFlDZ1JHZGVjTytLb0lMbVJUaUwxQkk4U096RVhRMWZi?=
 =?utf-8?B?RTJFZDlFcjN5c3pmeS9PQjRhQkhIcHVYSElzYWwyZEtFYndUUXdqVFNSY1RC?=
 =?utf-8?B?R0s5eXBEbmRPakU0dkdaTE9qVXN1TURiVkhack94TE55bjc3QkJhekpwM3U1?=
 =?utf-8?B?NlAxcUpHdFFEcDZOSkxISGpJUDdZOG9JRWcyQjZMRGZHcmFXdjYwbFowYW05?=
 =?utf-8?B?TFV1dWlpT1B5UWR6eGRja1JQa0dCZ2pWcTZQZGQwVytLcUJzYzdjL1M5cFVk?=
 =?utf-8?B?ek9kL3lvSkVWYm9IZ25neFFXMzFiOE0rYi8vRjlzcDNjdTlPeWpyY0JaQ0ow?=
 =?utf-8?B?QTFVZWdaNWtkamFWYVNGZzcvTC9xOVZPaWFDdHBXay9vOGtmWGd4TU5rejFt?=
 =?utf-8?B?MTgxNE1aVkc2cDhmUGlCeHc0TTdJNE1GQzdyQnkyeTB0blllWjl6Z3Z1TXFV?=
 =?utf-8?B?c25kN0xqUlV4TVM3OVZUVGVxSmQ3N1JsN0ZJa0VRdFdydmxsbXEzYmxTaVhP?=
 =?utf-8?B?SlBsMk1abWtsOEFMckxjQnFBcHNya1lBMzZPelpxN211Wjk4UFNqREhuWDBa?=
 =?utf-8?B?Rkx0WDZ4endkVnpQcXNLbXJTT2U2eDA1Y0xpbjZJYVkwYVlFekd5MEdsNDRG?=
 =?utf-8?B?alpaUE1iamo3eS9XSGRpQlFlOWhBWElGU1ZoKytlQmx1VGQxUkpDeFRXRVlR?=
 =?utf-8?B?K1NUK0lmazRteEtOMWk5eTRJV0JlVU9FWWJqd3B6a2VLRnRiNWxvbEFwWUVj?=
 =?utf-8?B?dGZTblVpcEdCQzlmTzRBOXMyZ1pwTmJlTGE2azVXRnAwQ3QxZFh0TlErODFn?=
 =?utf-8?B?aGFFblFrZWdld0NNeW03V1VlYWJISTY2YlB3MXZkeEhDNDBqbGlCVERRZFFi?=
 =?utf-8?B?OUhkT0wrQkl3bkZ6aUsxMlduN3dldW5mNUNZcThteG40Tm1WWVAyQWVzUW5Z?=
 =?utf-8?B?VC9aekJHbW56dTVsMGFaYzFhcHRxSzQ2SldYMTBPZmxrdm9mY04rb0U4YlhT?=
 =?utf-8?B?MWk4N0N0a1orSWJUUnlBNUQ2UHRJZkRPekxXemE0bmRTTjUvcGU1d1diNGFC?=
 =?utf-8?B?TjNjaXBpcXRPRE9RS1FVZG9EY3R4RW9JWnNvRDlOSUg2bjlCV0FZSVRvOStw?=
 =?utf-8?B?bitYTHJQTmIwd2NYM2djaWYxMVRobmJIaGU2cmR4bldxWklLQ3BNRTNJNy9m?=
 =?utf-8?B?VW9LN2RmOFdZKyt3VUVoMkowb3VVVFZBbnl1eENJR0NqVXZseGVUajR3NHVa?=
 =?utf-8?B?eWRUM2NhM3pNZ1dQUUgzRXZZQXdSSVFNOFZqTThMdEkvRGphY2RiZzhGK0M2?=
 =?utf-8?B?RzZ3WEtIWGMxeVlSNTRXallZakpOckNVZTAxWXlQWE9wMGZmMHUwWWJWTytB?=
 =?utf-8?B?aGlqTGIyVXV5c3Y5S0h4SGFaV0hjWEtqeEVYcnZSaFl1Wi9jMXJmd2QzWVFZ?=
 =?utf-8?B?ejNob29OS1p3Z1g3L0dlTlVYTWg4Y2xNZWdXMUpqMkdBQ1pJOUlubVowZHVC?=
 =?utf-8?B?QjN4bStmaHhGRkZnZDdHSmJWS205S1NuUzNaY1BjM2NEZEVZakpSUUdGRGRN?=
 =?utf-8?Q?g+mE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2Ezb3lWYzdxNHJaa3N2eXY2cmZ3Ykl3NVhhai9vc1MySUxucERxWVJsY3JL?=
 =?utf-8?B?VE5BSTlGNmlXQkcvdGdIdmI3R0JNdVpLYmJlM08zenlsZHpCYnlGWFJsY1gz?=
 =?utf-8?B?Wkg3MExuRG1mUTFGczdSSE81THRmMnFVbHhSVGlPaHBpemIzV0NaMFBIV3Bn?=
 =?utf-8?B?bHhEbFFScWtCbk1zYWp4bytwREQ2MXJscXNlU1pQNnc4aXk5OUhrMGNuTVcz?=
 =?utf-8?B?NXBBUWhGOS9iVnd4eVZ2eWV3Vm1KMGZHMldRS25CSVFIdkRyc1Y2WXJXZE1V?=
 =?utf-8?B?WG9zQVVMNDZxSTc5Z3JBZ2FYNEhYdW0wZTljazlhbUpUcXNDd1FkTW5rb3JY?=
 =?utf-8?B?MUVwZzRTVHgwL3FHNEJDK0lrOTVqZTdLWXREWklzR3pRSUhqVkkvcmxKTXA2?=
 =?utf-8?B?Z1hVOWZuN1JIalU5clhmMmxVNkJWYy9mNFZnNWN1VmFoaEt4QzBWOHFkdW5W?=
 =?utf-8?B?ZWlpaGRpWStsMml6Z21INmxFZG9CUzBFaTRzcElPQzcvS3RuUzdES04rSDNx?=
 =?utf-8?B?Wi9ueFhnVXU2TkhGVnBGRzg0SlhJN3N6a05pOC9RM1Mxai9YQ2pFRFljeC96?=
 =?utf-8?B?TEZuTDJySVBSb0pWSkNmWGZaczJ1YkdNNzRQMndZdjM5cUVXeExmRjAxNzlM?=
 =?utf-8?B?K2h3MGEvSlhTY1JzNkJrZmZXTzlIWVlNS0xaejR3eTJ1QXZKbndzMDlTb2Vj?=
 =?utf-8?B?TnEwbGQxZjZWV2NCeXJySE9aQmtzZzJiWDVXQnNhckxiTXRuQlhYSkdYN1l5?=
 =?utf-8?B?MUVDdEpKbmFWblpHcS9RcmhydDErYk15eEMzOThtVUpqTllNWEw5L1Jib1p1?=
 =?utf-8?B?aTVBNzA1M3haZzBkOVhUZFJQOGxPWXp6eFh4TEhyYWovYUtuUytpaTZ6V0t5?=
 =?utf-8?B?WlNxaUFwZWRLLzVtQ0RpQkcwSmgxWWQrdkpFd3ZBVm9FR0dTV21DaUZ2azNU?=
 =?utf-8?B?bDRSMk9JK0tjYVp3OXRyeFhEaFRIVkUyZWxQWFdkNVE3d29HcEhaVkUxaURt?=
 =?utf-8?B?aVpFMzFmVGZFR0NpdFdBbjBFb0FZejQ5ZkNXekYzRkJpU0duL1ZCdmpEZEx6?=
 =?utf-8?B?dVFnSEtkWXdPRFlISXZLQmVRb3dMVzZNbE00OWwvTXdWWHRSSUJZdXp0K3Y1?=
 =?utf-8?B?ZDJHbUtRcHZBcTk1dEdhR1kwRDU5ZkRHWElScVpOb3RTVm94T1FhNmFsemtj?=
 =?utf-8?B?WEJVZXNjM29PNWU5MFdva2czd05aWjN4RmlYbTVoakFabUtPSFg0MmR4aTRi?=
 =?utf-8?B?aVVZMy9QbFAxQ1FOczhUQWFHVnJxMFk2YkhHVCtXM2FxQWdQd3JDVlBTK3Bw?=
 =?utf-8?B?UVFhdGgwSkZtbU5mOTYwZWFaVnlyK1RENERla09OQk9Qci9yVnBRZERyeDZK?=
 =?utf-8?B?bEJPYlpNc3I5TnAwK3lVQTQ3M1VJKzNCOGZsZHZib054N20yUEtRdlZNeWtY?=
 =?utf-8?B?bEVSemRVR2xYOGl5KzZZTmNDeXVRaVo5TzVHVjVPN2YxYzc0aTQwT0xqd1Yy?=
 =?utf-8?B?M1NNMmRRWGR5TVo3NTlKa1FGbjhTSVZkRzBHSUNxVGc0RVFyaHBUUUFyRGpH?=
 =?utf-8?B?WWt5cDEyWGxXV1ZjTU01MkNJbzA2T1hLNXhWM3FURmN3RUdHaFFxMTV4TmpZ?=
 =?utf-8?B?MmtqbVNIaCtkcmtRdHIwTVRER3pWMlFZaHNRa1FUUUc4VWtLWGVUdDFrRUdX?=
 =?utf-8?B?WTQvMnV4V1NzN1F2RjRpNm1kaXRRWnB1U1Z3aFpCMEpZd3g5eS8wYldGbFZi?=
 =?utf-8?B?cy9vUzBIZkVFZDd2NWdvUkdHSC9WZVZOdlV4M0g2Y3UvT0dPckJhS3RDK3Vm?=
 =?utf-8?B?U1NCKzBFNXRJVzFmV2Fwa2VwUG1CSnpIdFg0ZGtNNUZWbmhROVUyaDhtOWxQ?=
 =?utf-8?B?QmNqdi9QRmg4cndVVERwZEZwclRKN1ErZTcxRWxhOGFFTjlieXRrRE01S2J3?=
 =?utf-8?B?RHZQMkFNRmdXSFBEQ1JyN1JjYVVkZ1U4SkpEOURHWVZMSENzTHlMUnRONDNF?=
 =?utf-8?B?NitWN09WVytZZm9kaURjb3FELzUvcUR2bTlYdUkyQ3hjZGR2cHNDVEJDMmhN?=
 =?utf-8?B?UnhPeURnV1pXSkxvSEk5SWszMXBkZGhRWVMvaEw5cHJZZFdYdEhLVDJWcldH?=
 =?utf-8?B?U0F6L0xJcytmK1FhYlc1UU4va3F2ZzR6Tkc5TG9PanJMY2ZtS0JtaDJmRmZw?=
 =?utf-8?B?SHJJYUpuMW9wZE56dEVyMVErYzVjQUc3OHY1Z2U4T1pzbDViQ3Q0ejByZ2dF?=
 =?utf-8?B?Zm5icmVSODZJSTk4N3Y0OUk3d2MvQmZoT0VJbWZZdzdUWGVIblVYRVlldVpy?=
 =?utf-8?B?K2EwbklsbHF0cDM0MnlOT0N5NXhLNWNuUlluQVhNbEg0Zy95UnRUakZvV09j?=
 =?utf-8?Q?lTsLYEhRu8P/l+KhrlVDzTg8ovCPo3iWm/gFFgKnboYCc?=
X-MS-Exchange-AntiSpam-MessageData-1: kSgar5uwQJ8qYw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9409a4-8ea6-4ee2-cae0-08de6dceae95
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 02:45:59.4484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsQN3cdNNtT12soPbbwMXBoRHRprepKBhmB7NYJYkiOVcwJRMBo79VGCHNdKvpJ6NsE0br/9VaYthQgOSjycag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9476
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: A0220148857
X-Rspamd-Action: no action

Not processing the whole data from a received message is a strong
indicator of a bug - emit a warning when such cases are detected.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 46819a82a51a..607fb9ad69b0 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -661,7 +661,17 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resul
             let (cmd, contents_1) = M::Message::from_bytes_prefix(message.contents.0).ok_or(EIO)?;
             let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
 
-            M::read(cmd, &mut sbuffer).map_err(|e| e.into())
+            M::read(cmd, &mut sbuffer)
+                .map_err(|e| e.into())
+                .inspect(|_| {
+                    if !sbuffer.is_empty() {
+                        dev_warn!(
+                            &self.dev,
+                            "GSP message {:?} has unprocessed data\n",
+                            function
+                        );
+                    }
+                })
         } else {
             Err(ERANGE)
         };

-- 
2.53.0

