Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B52B2BBD0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 10:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FC110E221;
	Tue, 19 Aug 2025 08:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="XzxXUz8+";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="m0agEqay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA3010E221
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 08:26:55 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 57J4o2sL1319776; Tue, 19 Aug 2025 09:26:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=h2JBwIiODq8KEu6lk9593JDGY
 2JNXj5O0jghoGllhFs=; b=XzxXUz8+UCvuvsnCEPVUFDu8mhFdA+J88hFu7YfTT
 ope2KnDtCG5ywX0z63CasP+uKqHNMZSt6KwNm3lm05daFad0yx7wc03/832lqdge
 gRojk1gOaj7c0Dy4IOAG2AciQuccxrBzZPeSmPCNWMJHdEFxyDpNin/roMV+S35h
 4Ox3DO+72al6m8mEp6+tJDdlkrCGzGQy6bikGWhDpY+su6NvkkcMUOAkHhSKhqAs
 JsBHeTGP0iYfoAN0wYoBCvP0HTzMWGr9bdKbw3HDewNEL5Z4zVS6bUgAYMNQTnN3
 WYK5OPnLu+zgGlXBTEHQyGnxpfvcVfGKGO16/4bZxyljA==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020082.outbound.protection.outlook.com [52.101.195.82])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 48jg8k2uv0-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Aug 2025 09:26:35 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWY+/FsgdlYN1agwMI0TYETbKyibKQRsWwEAYLPnVD7k0g1bJndNB7D9uuLQla4isHq4fH5yOSakTgBZGeoJtQt0v/eEXsHRRFYc4uM4DBZWs3Lf3hv4Igkx8Qc3vsEDdfNbig8uhFhfaOCMHDXUbqbGsDJf6vXKlsFfy+JyytRSUTIY23Wnv3/BLbv+osNxn3sSX1Mbv8dvuL1EObdkWa8gUgBaL/yICScLtP1eIwJArxvrsr5H7Ht82HMuPjEGqkozBxTjJcH8u6U/D12ByvQfdOX01HNHVcwOYNkDlGCex7q16cSl93gOf45/H2WLbOwfjGcLkVCSRphHkdEkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2JBwIiODq8KEu6lk9593JDGY2JNXj5O0jghoGllhFs=;
 b=MyDoizvqZsmUPWyk9/TpkKpcQhxznaTJOSJkgu/ezRQLv7j1mxzCtdVOYPR6RWIBVH7ECYfKfhDLoc6GDswCDWpEOkHC/1AbxXDv1Cq/SI5LF99Cs9ERi7f0KFtJQzJiN9SPxunCOtsRR4HEM6TOEYOIxLc1Af5UCf1MWpGZ/OWI71Y09bQas9dqKszXcvOLMMRNLr8byepA/qxsv/gfyNvDfvImsojHxZxODQGeOrMSqIl5MnyAcMQxX7LfE1PjPF8vn+7SuC0JmVks7mk1EqJ8O7R4fjOpSd+iCNGd4AePxARq8BaXnC/eqchgo76pyriJCgbaQ/H/zujpgkCkjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2JBwIiODq8KEu6lk9593JDGY2JNXj5O0jghoGllhFs=;
 b=m0agEqayaxGH0kMrLKU0MhQjgaEPEeoqKl3wpTXr6KWj674kxGs7haWw1q8T1PyqGwhQkxK9egmdPJT50Eyfu0kJz7WltrZN4SlmUaSTz0lnAq0PASEVb4nzPYFNgn+/YkzmWPh/PBi7SQjnVld2Xm1kC3hYKgaYyDscZNG+FbA=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CW1P265MB7881.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:204::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.25; Tue, 19 Aug 2025 08:26:31 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.9031.024; Tue, 19 Aug 2025
 08:26:31 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: Boris Brezillon <boris.brezillon@collabora.com>, Danilo Krummrich
 <dakr@kernel.org>, Brendan King <Brendan.King@imgtec.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Caterina Shablia <caterina.shablia@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Matthew Brost
 <matthew.brost@intel.com>, Frank Binns <Frank.Binns@imgtec.com>, Alessio
 Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v8 01/24] drm/gpuvm: Pass map arguments through a struct
Thread-Topic: [PATCH v8 01/24] drm/gpuvm: Pass map arguments through a struct
Thread-Index: AQHcEOL3Ru5RdeWB9EmJ0dVhPltRqQ==
Date: Tue, 19 Aug 2025 08:26:31 +0000
Message-ID: <9d91429f-9bd3-4601-8540-e7a6691a74b8@imgtec.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
 <20250818215753.2762426-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250818215753.2762426-2-himal.prasad.ghimiray@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CW1P265MB7881:EE_
x-ms-office365-filtering-correlation-id: 8963f755-bbc6-4e9e-0dc3-08dddefa19f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?Vm5UcGlERXNadXFLV2ZNRURGSklleUo3NzhzekFlbnBPWnVtYlZkTGx2UnVF?=
 =?utf-8?B?VEI2MzJSUEEwVkt1cjI5VE8zL0dTU0p1WWlEOGNscC9TNy9lSjkzeTlmVjdi?=
 =?utf-8?B?dmV4SHplc2t4eGVzNkFrczNOaWoyK2NFV2JUUkZsM0RFNVZRU1ZKeTE5bGll?=
 =?utf-8?B?MGpqMU1ZWDkzU2FtZjdSNFBVNHQvcUwvSVhBYllGbnViZXdwbXZrSUs3YzRv?=
 =?utf-8?B?MERCWDIyUTFZN1FRMTArUlhZNHo4Z2h6eldMUVhBcTd0RU8rZ0tycVVHeWd1?=
 =?utf-8?B?U241cHRmM0tVYVAwZWI3SXVWSU1JMzMzRm9reDF5YWVYUmZ4NVNNYTdGRG51?=
 =?utf-8?B?dXFNY0hmMW1pU203NGE3ZVo4UFROMTAzYTdtbUlQdTRwTEk3cTIvQUpURmFV?=
 =?utf-8?B?a3Y2RWVtNENMYVFUOFhxY2N0YXdyempUVlJ2YStyazU1VUVuRFMxai9tU0lj?=
 =?utf-8?B?ZjBLWlNFWWViai9ENmJ1SVpDdU85aFRydnNlelBmL1dUV0kyN1g5elR3NzU4?=
 =?utf-8?B?aDZLakxyMWNNcVdlR2xnRlNGV0cxZGQyem5wK0JhVVBpYXNVK1R5TjVJR1N1?=
 =?utf-8?B?SithZkRpWnFadCtSZHBzbWR1bUg1bG9WZ01nZWhuTDE3M0w3RlVQb1pja1RN?=
 =?utf-8?B?bE90bFROQlVUUGk3R2Zrc0krOXhIUitpc0czYmZ4UEhSRTk1ZFlWQW03S241?=
 =?utf-8?B?ekFJL1g1c09ZMUJsTTNGQ2M1cXJEN09PYUhYVmEwelB5RW5DYXlrUFJjUXZn?=
 =?utf-8?B?T2pVOXhZQWJYd0dDZFVoQjRVTFdHUmRYcEh1V1E2KzFmdndHa0FxWmdwQ2J6?=
 =?utf-8?B?S0U5WHBJcHpQM1liT2VsWHdQVkRTNGlRVDRLNzBrelhMNTZ3VTNqV3dYeGtm?=
 =?utf-8?B?bXpRbjkwMENnMkxWeDlDcHBZVHdUY1ZYN28zalJ4L0dlYnRCVFUwVEEzVEta?=
 =?utf-8?B?V1dxVERVU2QyWHJiaVBkbE1HOG5lNndqblpuNnhOMENSNFhXUkVwcEk3TlpT?=
 =?utf-8?B?UjZBaWFZTktYQ2RiZUVrY2V4RUloNnhNWGd0dVlIYjZ4dTZKUXRydmNYdjVl?=
 =?utf-8?B?clN1NlVERWRqS215RVpHRC8rVERwMmVTRk54dG5RL29sWkladTlldmp1dkdO?=
 =?utf-8?B?WEhOajdKcVQram1nZ2g4MHN2YzZVeEI4ZTZzbUhIcTdkeEs1MXI4WlR5NGFK?=
 =?utf-8?B?R0lCZG5YNUNPV0JsbUh5Skk5V0JjOVh6a3VRZlNjdVBTdzBXQ2RBY3dZVktu?=
 =?utf-8?B?YUdPUCtyLzVVMnF1TjBzU0ZnV2ZERnhiRWsyeU5SNE0vdDd2K0g0RkhpakFK?=
 =?utf-8?B?RG9aNG1DbHpxSDNCTW1yQ0NJbFliZ1FzNGN0bUg0WmRPaGE3WEJxdVBJWkY3?=
 =?utf-8?B?eGw5bm5VM1UyYWd3UE03QzFzbERsNDZHZFBTZnFnRWQxS1dad1V4NnN4N0FN?=
 =?utf-8?B?UzZnT0dEOTdZZ3Byb3VzUkVCb1FMVFJyUjBFQmo0enA1RGE0QjFmU3BGOUZh?=
 =?utf-8?B?V0pKQStxQlZqaHE3aUY1OVFJWG50S0Ivek9jREJGQkJZZVU2eXQwWUtGc3o3?=
 =?utf-8?B?T3ZQeTRocUxwR0kyc3BybXJ2T2J5bWprMGptMHA0emo1TDU2b0diMzN3Q3pr?=
 =?utf-8?B?dWNiTSs2UUZuVVMybjhmTXR2V3dSN21WYzlJOFcrc29HMERSQnU1ZzlIZjl3?=
 =?utf-8?B?SWRLMFpUQXc1eHo0R2xnNCtRbmNVckpsR2xJZ3lzMFdQdGhNd1RNV1NnMXFr?=
 =?utf-8?B?VmZiaXd5QkNQd1pPK3E5SkJ0RGZ2Q1J3dk9RcWN3RkRpalZSOEc0Wk5RWWJG?=
 =?utf-8?B?clJlTEFGK3RzTDNTckwvODliZ0VIZTBReFQxWkpNK3Z1OFFmN0hIZnhodzlo?=
 =?utf-8?B?bUhtUFFqVXpNM1lVbHZmYmFjNzVBck9yaU9CVHdXMmtpRWhDQm9rWHVaZmJa?=
 =?utf-8?B?dGEwOVVRNzJYRXBzTjB1U3Mwb3BKYmd2Z3BJTW9tQWl5QVZUWXpZc2JUdDRZ?=
 =?utf-8?Q?9JWltKyUwMOi4FeSz49pMZUQCgGRZs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(4053099003); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTM1UFE4NUc1Z1pCYzlGTStzZGMyeVdYR21pZ2ZnZXZtZTRHQ29MVjFSTGhT?=
 =?utf-8?B?Z3RrMEU2SExFNFZFYzRVRTJZYXhBYVR3NWtSYm1TS2FXbjlUc2g5ejlxVzFP?=
 =?utf-8?B?cklQTFJWVVhIelZBYXhrSEFxbmJwMnhNSW1vSzlycDRSM1N1azFCWDliNFlJ?=
 =?utf-8?B?dGp6OE5UVXFkQUU2WjBNMGJEcWsyNXpkaW00OFVoTFkzUjc0dzVUZXFXQmY3?=
 =?utf-8?B?S2lJaktRVFJsQjlRcnR2VDlRVVFUSXlwMlVVNTV6STVwcmJWYlk4Y0JFVjZa?=
 =?utf-8?B?dnhGMitBYnlBbVFhbm84ZENpbUVTN3hWd3phbVcvOWxpUEF4UFNmeXlzZjVk?=
 =?utf-8?B?eXNWTXZBQ01hYzhKemFZQW9SRTNGVW5Ia09QbUtwK0lNUWZqeFU1OTZTNUYw?=
 =?utf-8?B?YmRLRDFTVThueXYxOWRwbUNIQWZuY0VqNnl0cGNORlptVmhXWmhHWHVkbDk3?=
 =?utf-8?B?d3dneUFtKzhXWXArUDB2K2tIQlhFMnI3V1ZJVmF0anZDSU1mbHlFZzl2SXZy?=
 =?utf-8?B?bTRRYllrQitZUmdEOUVUbmRSVkg5bnRIKzZKVTJxN1lhRGxpMjlYeGJ5cklm?=
 =?utf-8?B?bjVkWkhuU3ppSERVbnliT1VDUjc5blJ4aXAzR3NEWU5BdDBPQlB2dURXd3Ir?=
 =?utf-8?B?K05iQXVpd2Q5ditoSlpXMVpsYlhhanA0cFpyOHlPNE1ELzUxMjlMVW9Vek1t?=
 =?utf-8?B?c2FaWWJ1N2ErL3dUbkl2MEo1UjJzekRYVWQ5TXRFd1lYUll4T0tMcHp6OXlW?=
 =?utf-8?B?Rm5GdENoTzFrTlpScEFrMHBJSnRDL0V5NHM0L0kwUWtnZnBKREgzc0h3UEEy?=
 =?utf-8?B?a3ZCSDQ0TFVhTE5yVi9FZWovMG1UN1BpaHkxNDhLUnRpZEM5SXlUbFE3MEdT?=
 =?utf-8?B?NW8xR3NncEpvQTFEOXlOd1A5SVNEWVNaWjNWbzE4S3lWZnZHbm9ESlFtbHhm?=
 =?utf-8?B?anhVbEl0L3BqKytGTGl4ZkdsQWFWZllqSTZTNFVtd1hLNFdBWUxhaU45S1lG?=
 =?utf-8?B?Z1BiYTYvZnBsRGMweUxwaDdzeE1oSUlISTA2VDFnTFJrUkZhVm0rbGR5UFFw?=
 =?utf-8?B?dTZCRWpaVWlORit4cFUzUHBaZFNqVnNHaEduSVBvU1hqSTFFekM0WVBYcWo0?=
 =?utf-8?B?VjgvdUVxRHIzaUhkcGJNeXVNZ0c2ZmNrZHk0Z1ZnblFWWmU3ZXdtQS9UQWtP?=
 =?utf-8?B?VDlPSWR0TzZrdER6Y2Ztc1dyYld3MmZPam9kMjF4MjNsZFF3WXVXN2lJT2t1?=
 =?utf-8?B?YmhhSjVoMForWjlOV0dWeGRmdTZJd3RKSUhNRWNwNU43MXhlMldOZVdpMys5?=
 =?utf-8?B?OXNmZjBYaFpybWFWYzRiWFNNQmdOV0l4TFNYK29wQlJ3Ymh1anQvWGJEa0hX?=
 =?utf-8?B?WW1PTi84ZVRKWEF3M1BHZnV3MjQ2V2tKNGIvNUwxMmNJTCtTcHRxcEx6UnFK?=
 =?utf-8?B?VjR6WTRKcG1VTHFYa3B6Q0xkRnEzTVBoZEJCbVlXNzgwMlZUQkFDMDJkSDdo?=
 =?utf-8?B?Y25wOVVxZnQxZjNiRk1QVzBTRTlCc0JTVllDbnRlNTRoOWJYTVRZeENSNlRl?=
 =?utf-8?B?Z0lNY0ZlQXRlSk9WSENzMnJMRjdrczIxOW1rbnRUVW4xMUNiM0ZHS1Fic1pn?=
 =?utf-8?B?YmQ0RDRkZ1QzbjZLZnlKQWZEQnN6TGlSZjZMb0VHRkJYWWpSa2tnMjlUY0lK?=
 =?utf-8?B?dUVUTDZDaFJUNHE2NlltQXJGSmJEOElmU1grZytuOGJkNGRaQ3FKTWIxZGt3?=
 =?utf-8?B?cmY5UUo2VVE4WmRicTNwV3U2ek11eU9nVmVCK0ViTnNCOEZaSmN1YmJPOGJQ?=
 =?utf-8?B?UUMzcDNIdDBhSE1tcVQ3RXdQb2REaEUyeFladXduZkZIUExOUDM5UTlydENl?=
 =?utf-8?B?c0p3ZFNjejJVRUNkSzl0V0JHNzlnd2prUFlnKzZHTkRtODJOc3paMXdZUng1?=
 =?utf-8?B?VnZNMER6RzdicDIzaUR1SERPVGdNKzJVUFEraTBRTElkY3N0UnN2ZUIvY3FR?=
 =?utf-8?B?d1crV1RJQy9UZEwxU3J5QWxaVTUrM2NRNGk4dGZVS2t3MEJhaG1mMTBGcExQ?=
 =?utf-8?B?NVJMQWd6UmFlZi9mOUZSbVpGYTVYSSt1S0VmVFRoYlQzVDJCMDkzaXV6T0Np?=
 =?utf-8?B?WlB6SmY0NnJHUGkrTUtnc0tVVkN2bWRoOFMzeGl5OTlwZzhzZzljZjlkMGo1?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1X0Az4j4iTXLMGnvxkGLBRfY"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8963f755-bbc6-4e9e-0dc3-08dddefa19f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 08:26:31.4557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R0VIYxl9lxlFLSse9a0r5NwNQz2yBWj+jiO9+7KRxHZLpwmI+hc9LoMymJpGe8lmcYyGfMnoOCkjPvS858ni5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7881
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDA3OCBTYWx0ZWRfXzJ8O5p3D14/k
 qEAeyFHJPYKRBEhWApGZFaRoGEfZcCjRcqarAlMbV4kBsaBxFaS8KC3D4kKH+SzTYdjEHlXc1nQ
 nkVvRF87+7ramPjp2Gy7xDh6rLZsCl6vCFHEOkdjHUyirMdI4iLnXS7jJboYWUNZtJo4ZbmfQho
 8dmpTiq0wrLX8WMJHSmIR01dUta2jsKNDmzXalTGdIAIJu2bu+PStbi7ZZ60LgQm4+j5xsX1Ocf
 Lui95+WiWAAaKSgGJUezgXJsMbXV7u87OfhZv1gQx9jwTbbc5v8Bh6WI4usB134rXIl9q6VeJQ6
 U6sgLizZiBnNhq/BOUVFvKl6J//oOMa3cf9EoU4lOLvRwY1e3T8SFhEgR01ds2UMqH6PSvtb/mb
 gdNgnP6Af0ZWQbcJ7jRlUH5vUgxPyA==
X-Authority-Analysis: v=2.4 cv=PtrKrwM3 c=1 sm=1 tr=0 ts=68a4353c cx=c_pps
 a=p+UPN3jNURWuIvPtd4M81Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=NgoYpvdbvlAA:10 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=34vvhjMUkiT7KxLL56cA:9
 a=QEXdDO2ut3YA:10 a=BvmlwFSFmKm4wi-JnkgA:9 a=FfaGCDsud1wA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: szEe4kKKprUe0OrRIwvCYOa1O8tY4QrB
X-Proofpoint-ORIG-GUID: szEe4kKKprUe0OrRIwvCYOa1O8tY4QrB
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

--------------1X0Az4j4iTXLMGnvxkGLBRfY
Content-Type: multipart/mixed; boundary="------------nqRvKjD1KZiZ7jtdfDj2UiVT";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Brendan King <Brendan.King@imgtec.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Caterina Shablia <caterina.shablia@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>, Frank Binns
 <frank.binns@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-ID: <9d91429f-9bd3-4601-8540-e7a6691a74b8@imgtec.com>
Subject: Re: [PATCH v8 01/24] drm/gpuvm: Pass map arguments through a struct
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
 <20250818215753.2762426-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250818215753.2762426-2-himal.prasad.ghimiray@intel.com>

--------------nqRvKjD1KZiZ7jtdfDj2UiVT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 18/08/2025 22:57, Himal Prasad Ghimiray wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
>=20
> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),=

> so, before we do that, let's pass arguments through a struct instead
> of changing each call site every time a new optional argument is added.=

>=20
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Brendan King <Brendan.King@imgtec.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Caterina Shablia <caterina.shablia@collabora.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com=
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

Hi Himal,

I'm not sure which is better/more useful to you, so at your choice this
is either (or both):

Reviewed-by: Matt Coster <matt.coster@imgtec.com> # imagination/pvr_vm.c

or, more generally:

Acked-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 74 +++++++++++---------------=

>  drivers/gpu/drm/imagination/pvr_vm.c   | 15 ++++--
>  drivers/gpu/drm/msm/msm_gem_vma.c      | 27 +++++++---
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c | 11 ++--
>  drivers/gpu/drm/panthor/panthor_mmu.c  | 13 +++--
>  drivers/gpu/drm/xe/xe_vm.c             | 13 +++--
>  include/drm/drm_gpuvm.h                | 20 ++++---
>  7 files changed, 102 insertions(+), 71 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 74d949995a72..c0e6f9310514 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -486,13 +486,18 @@
>   *				  u64 addr, u64 range,
>   *				  struct drm_gem_object *obj, u64 offset)
>   *	{
> + *		struct drm_gpuvm_map_req map_req =3D {
> + *		        .map.va.addr =3D addr,
> + *	                .map.va.range =3D range,
> + *	                .map.gem.obj =3D obj,
> + *	                .map.gem.offset =3D offset,
> + *	           };
>   *		struct drm_gpuva_ops *ops;
>   *		struct drm_gpuva_op *op
>   *		struct drm_gpuvm_bo *vm_bo;
>   *
>   *		driver_lock_va_space();
> - *		ops =3D drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
> - *						  obj, offset);
> + *		ops =3D drm_gpuvm_sm_map_ops_create(gpuvm, &map_req);
>   *		if (IS_ERR(ops))
>   *			return PTR_ERR(ops);
>   *
> @@ -2054,16 +2059,15 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
> =20
>  static int
>  op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
> -	  u64 addr, u64 range,
> -	  struct drm_gem_object *obj, u64 offset)
> +	  const struct drm_gpuvm_map_req *req)
>  {
>  	struct drm_gpuva_op op =3D {};
> =20
>  	op.op =3D DRM_GPUVA_OP_MAP;
> -	op.map.va.addr =3D addr;
> -	op.map.va.range =3D range;
> -	op.map.gem.obj =3D obj;
> -	op.map.gem.offset =3D offset;
> +	op.map.va.addr =3D req->map.va.addr;
> +	op.map.va.range =3D req->map.va.range;
> +	op.map.gem.obj =3D req->map.gem.obj;
> +	op.map.gem.offset =3D req->map.gem.offset;
> =20
>  	return fn->sm_step_map(&op, priv);
>  }
> @@ -2102,10 +2106,14 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, voi=
d *priv,
>  static int
>  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		   const struct drm_gpuvm_ops *ops, void *priv,
> -		   u64 req_addr, u64 req_range,
> -		   struct drm_gem_object *req_obj, u64 req_offset)
> +		   const struct drm_gpuvm_map_req *req)
>  {
> +	struct drm_gem_object *req_obj =3D req->map.gem.obj;
>  	struct drm_gpuva *va, *next;
> +
> +	u64 req_offset =3D req->map.gem.offset;
> +	u64 req_range =3D req->map.va.range;
> +	u64 req_addr =3D req->map.va.addr;
>  	u64 req_end =3D req_addr + req_range;
>  	int ret;
> =20
> @@ -2236,9 +2244,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		}
>  	}
> =20
> -	return op_map_cb(ops, priv,
> -			 req_addr, req_range,
> -			 req_obj, req_offset);
> +	return op_map_cb(ops, priv, req);
>  }
> =20
>  static int
> @@ -2303,10 +2309,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>   * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @priv: pointer to a driver private data structure
> - * @req_addr: the start address of the new mapping
> - * @req_range: the range of the new mapping
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: ptr to struct drm_gpuvm_map_req
>   *
>   * This function iterates the given range of the GPU VA space. It util=
izes the
>   * &drm_gpuvm_ops to call back into the driver providing the split and=
 merge
> @@ -2333,8 +2336,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>   */
>  int
>  drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -		 u64 req_addr, u64 req_range,
> -		 struct drm_gem_object *req_obj, u64 req_offset)
> +		 const struct drm_gpuvm_map_req *req)
>  {
>  	const struct drm_gpuvm_ops *ops =3D gpuvm->ops;
> =20
> @@ -2343,9 +2345,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *p=
riv,
>  		       ops->sm_step_unmap)))
>  		return -EINVAL;
> =20
> -	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
> -				  req_addr, req_range,
> -				  req_obj, req_offset);
> +	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
> =20
> @@ -2421,10 +2421,7 @@ static const struct drm_gpuvm_ops lock_ops =3D {=

>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @exec: the &drm_exec locking context
>   * @num_fences: for newly mapped objects, the # of fences to reserve
> - * @req_addr: the start address of the range to unmap
> - * @req_range: the range of the mappings to unmap
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: ptr to drm_gpuvm_map_req struct
>   *
>   * This function locks (drm_exec_lock_obj()) objects that will be unma=
pped/
>   * remapped, and locks+prepares (drm_exec_prepare_object()) objects th=
at
> @@ -2447,9 +2444,7 @@ static const struct drm_gpuvm_ops lock_ops =3D {
>   *                    ret =3D drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exe=
c, op->addr, op->range);
>   *                    break;
>   *                case DRIVER_OP_MAP:
> - *                    ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, &exec,=
 num_fences,
> - *                                                     op->addr, op->r=
ange,
> - *                                                     obj, op->obj_of=
fset);
> + *                    ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, &exec,=
 num_fences, &req);
>   *                    break;
>   *                }
>   *
> @@ -2480,18 +2475,17 @@ static const struct drm_gpuvm_ops lock_ops =3D =
{
>  int
>  drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>  			   struct drm_exec *exec, unsigned int num_fences,
> -			   u64 req_addr, u64 req_range,
> -			   struct drm_gem_object *req_obj, u64 req_offset)
> +			   struct drm_gpuvm_map_req *req)
>  {
> +	struct drm_gem_object *req_obj =3D req->map.gem.obj;
> +
>  	if (req_obj) {
>  		int ret =3D drm_exec_prepare_obj(exec, req_obj, num_fences);
>  		if (ret)
>  			return ret;
>  	}
> =20
> -	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
> -				  req_addr, req_range,
> -				  req_obj, req_offset);
> +	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec, req);
> =20
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
> @@ -2613,10 +2607,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops=
 =3D {
>  /**
>   * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split=
 and merge
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
> - * @req_addr: the start address of the new mapping
> - * @req_range: the range of the new mapping
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: map request arguments
>   *
>   * This function creates a list of operations to perform splitting and=
 merging
>   * of existent mapping(s) with the newly requested one.
> @@ -2644,8 +2635,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops =
=3D {
>   */
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> -			    u64 req_addr, u64 req_range,
> -			    struct drm_gem_object *req_obj, u64 req_offset)
> +			    const struct drm_gpuvm_map_req *req)
>  {
>  	struct drm_gpuva_ops *ops;
>  	struct {
> @@ -2663,9 +2653,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpu=
vm,
>  	args.vm =3D gpuvm;
>  	args.ops =3D ops;
> =20
> -	ret =3D __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
> -				 req_addr, req_range,
> -				 req_obj, req_offset);
> +	ret =3D __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args, req);
>  	if (ret)
>  		goto err_free_ops;
> =20
> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/ima=
gination/pvr_vm.c
> index 2896fa7501b1..3d97990170bf 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm.c
> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> @@ -185,12 +185,17 @@ struct pvr_vm_bind_op {
>  static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
>  {
>  	switch (bind_op->type) {
> -	case PVR_VM_BIND_TYPE_MAP:
> +	case PVR_VM_BIND_TYPE_MAP: {
> +		const struct drm_gpuvm_map_req map_req =3D {
> +			.map.va.addr =3D bind_op->device_addr,
> +			.map.va.range =3D bind_op->size,
> +			.map.gem.obj =3D gem_from_pvr_gem(bind_op->pvr_obj),
> +			.map.gem.offset =3D bind_op->offset,
> +		};
> +
>  		return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
> -					bind_op, bind_op->device_addr,
> -					bind_op->size,
> -					gem_from_pvr_gem(bind_op->pvr_obj),
> -					bind_op->offset);
> +					bind_op, &map_req);
> +	}
> =20
>  	case PVR_VM_BIND_TYPE_UNMAP:
>  		return drm_gpuvm_sm_unmap(&bind_op->vm_ctx->gpuvm_mgr,
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/ms=
m_gem_vma.c
> index 3cd8562a5109..792b35433666 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -1171,11 +1171,17 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job=
 *job, struct drm_exec *exec)
>  							      op->obj_offset);
>  				break;
>  			case MSM_VM_BIND_OP_MAP:
> -			case MSM_VM_BIND_OP_MAP_NULL:
> -				ret =3D drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1,
> -							    op->iova, op->range,
> -							    op->obj, op->obj_offset);
> +			case MSM_VM_BIND_OP_MAP_NULL: {
> +				struct drm_gpuvm_map_req map_req =3D {
> +					.map.va.addr =3D op->iova,
> +					.map.va.range =3D op->range,
> +					.map.gem.obj =3D op->obj,
> +					.map.gem.offset =3D op->obj_offset,
> +				};
> +
> +				ret =3D drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
>  				break;
> +			}
>  			default:
>  				/*
>  				 * lookup_op() should have already thrown an error for
> @@ -1282,10 +1288,17 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job=
)
>  			if (op->flags & MSM_VM_BIND_OP_DUMP)
>  				arg.flags |=3D MSM_VMA_DUMP;
>  			fallthrough;
> -		case MSM_VM_BIND_OP_MAP_NULL:
> -			ret =3D drm_gpuvm_sm_map(job->vm, &arg, op->iova,
> -					       op->range, op->obj, op->obj_offset);
> +		case MSM_VM_BIND_OP_MAP_NULL: {
> +			struct drm_gpuvm_map_req map_req =3D {
> +				.map.va.addr =3D op->iova,
> +				.map.va.range =3D op->range,
> +				.map.gem.obj =3D op->obj,
> +				.map.gem.offset =3D op->obj_offset,
> +			};
> +
> +			ret =3D drm_gpuvm_sm_map(job->vm, &arg, &map_req);
>  			break;
> +		}
>  		default:
>  			/*
>  			 * lookup_op() should have already thrown an error for
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/n=
ouveau/nouveau_uvmm.c
> index ddfc46bc1b3e..d94a85509176 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1276,6 +1276,12 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job =
*job,
>  			break;
>  		case OP_MAP: {
>  			struct nouveau_uvma_region *reg;
> +			struct drm_gpuvm_map_req map_req =3D {
> +				.map.va.addr =3D op->va.addr,
> +				.map.va.range =3D op->va.range,
> +				.map.gem.obj =3D op->gem.obj,
> +				.map.gem.offset =3D op->gem.offset,
> +			};
> =20
>  			reg =3D nouveau_uvma_region_find_first(uvmm,
>  							     op->va.addr,
> @@ -1301,10 +1307,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job =
*job,
>  			}
> =20
>  			op->ops =3D drm_gpuvm_sm_map_ops_create(&uvmm->base,
> -							      op->va.addr,
> -							      op->va.range,
> -							      op->gem.obj,
> -							      op->gem.offset);
> +							      &map_req);
>  			if (IS_ERR(op->ops)) {
>  				ret =3D PTR_ERR(op->ops);
>  				goto unwind_continue;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pa=
nthor/panthor_mmu.c
> index 367c89aca558..2003b91a8409 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2202,15 +2202,22 @@ panthor_vm_exec_op(struct panthor_vm *vm, struc=
t panthor_vm_op_ctx *op,
>  	mutex_lock(&vm->op_lock);
>  	vm->op_ctx =3D op;
>  	switch (op_type) {
> -	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
> +	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
> +		const struct drm_gpuvm_map_req map_req =3D {
> +			.map.va.addr =3D op->va.addr,
> +			.map.va.range =3D op->va.range,
> +			.map.gem.obj =3D op->map.vm_bo->obj,
> +			.map.gem.offset =3D op->map.bo_offset,
> +		};
> +
>  		if (vm->unusable) {
>  			ret =3D -EINVAL;
>  			break;
>  		}
> =20
> -		ret =3D drm_gpuvm_sm_map(&vm->base, vm, op->va.addr, op->va.range,
> -				       op->map.vm_bo->obj, op->map.bo_offset);
> +		ret =3D drm_gpuvm_sm_map(&vm->base, vm, &map_req);
>  		break;
> +	}
> =20
>  	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
>  		ret =3D drm_gpuvm_sm_unmap(&vm->base, vm, op->va.addr, op->va.range)=
;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c86337e08a55..f35d69c0b4c6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2337,10 +2337,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, stru=
ct xe_vma_ops *vops,
> =20
>  	switch (operation) {
>  	case DRM_XE_VM_BIND_OP_MAP:
> -	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
> -		ops =3D drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
> -						  obj, bo_offset_or_userptr);
> +	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
> +		struct drm_gpuvm_map_req map_req =3D {
> +			.map.va.addr =3D addr,
> +			.map.va.range =3D range,
> +			.map.gem.obj =3D obj,
> +			.map.gem.offset =3D bo_offset_or_userptr,
> +		};
> +
> +		ops =3D drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
>  		break;
> +	}
>  	case DRM_XE_VM_BIND_OP_UNMAP:
>  		ops =3D drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
>  		break;
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 274532facfd6..a9fa44148e0c 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1058,10 +1058,20 @@ struct drm_gpuva_ops {
>   */
>  #define drm_gpuva_next_op(op) list_next_entry(op, entry)
> =20
> +/**
> + * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_op=
s_create]()
> + */
> +struct drm_gpuvm_map_req {
> +	/**
> +	 * @op_map: struct drm_gpuva_op_map
> +	 */
> +	struct drm_gpuva_op_map map;
> +};
> +
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> -			    u64 addr, u64 range,
> -			    struct drm_gem_object *obj, u64 offset);
> +			    const struct drm_gpuvm_map_req *req);
> +
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
>  			      u64 addr, u64 range);
> @@ -1205,16 +1215,14 @@ struct drm_gpuvm_ops {
>  };
> =20
>  int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -		     u64 addr, u64 range,
> -		     struct drm_gem_object *obj, u64 offset);
> +		     const struct drm_gpuvm_map_req *req);
> =20
>  int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>  		       u64 addr, u64 range);
> =20
>  int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>  			  struct drm_exec *exec, unsigned int num_fences,
> -			  u64 req_addr, u64 req_range,
> -			  struct drm_gem_object *obj, u64 offset);
> +			  struct drm_gpuvm_map_req *req);
> =20
>  int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_e=
xec *exec,
>  				 u64 req_addr, u64 req_range);


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------nqRvKjD1KZiZ7jtdfDj2UiVT--

--------------1X0Az4j4iTXLMGnvxkGLBRfY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaKQ1NwUDAAAAAAAKCRB5vBnz2d5qsIXA
AP99CztWVuuegyJQyfMbJfIXZ5eSyDQ6at70BzdsJP5SfwEAhYkLkRF83JNe+FYxtptghU7a0hTB
RRTUw9X01S6IWgA=
=oQpH
-----END PGP SIGNATURE-----

--------------1X0Az4j4iTXLMGnvxkGLBRfY--
