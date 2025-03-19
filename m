Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA98A688C6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 10:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB8410E247;
	Wed, 19 Mar 2025 09:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Wed, 19 Mar 2025 07:09:37 UTC
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com
 [216.71.156.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD1410E2C6;
 Wed, 19 Mar 2025 07:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1742368178; x=1773904178;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ilx6C7LCE6Bpym3x2hTRPEWxNxOsHAGQ1Ug7jpuFx+k=;
 b=jrE46DG1BpQSpJfKwkHZRAuh1rzMcuN5583Ty8T33rkd4qSyReOhdCGc
 Jyyfi5yBUoJ3qRfM0vKEvFKENTT6foAFpThdEt6JjOctBlDi7oEaUFoJp
 axlak+0YGIuMP4/8+gceIb07MHzyZfUlf26kzazBQG6+RLpdLxUAf1gxS
 thHZOmpT4DrUTI3vcb5vVs6wDyrT7WmtHhoc29NNabpcr842LXRDZDqQP
 ZsVlj+zs9Cws13iR0SsqICythkXixVKsIGGObtDwK9on+ByfmDy3PrdaL
 mqEirDLbyObuzfsRaZ317Ea9itIvZQhBwtT82IN/eXjaRhtjO0Jozjmuz w==;
X-CSE-ConnectionGUID: OwLL2cgVSTOts6wY8zAx3w==
X-CSE-MsgGUID: 4x5dfRv9Qj603bunfZsTBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="150165294"
X-IronPort-AV: E=Sophos;i="6.14,259,1736780400"; d="scan'208";a="150165294"
Received: from mail-japanwestazlp17011026.outbound.protection.outlook.com
 (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.26])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 16:02:15 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYdMPtQ7uQmRBurieUr/yFe16nLXHbhsSOyKWRKgsM15Uet0aUbLBKWJ5JuXlgufE3qK4GrAs4SqBpx/JQ7ZQAs8mrRyC9MMQwR1nWwe/y8HtRpUIEMXK343eCFUHhXdOfBqm/IufRI/F2BXLif1ZFkgW46+UTSTRgSmV4wNBaGTLC3LygRJ44KTJ9K+sLaaQ5aNC+dZkWl4BjTWTpdYDKlwRMZDP5OkIry9ajKbytS2RxN6wABCxkMyFTtsx1tA+lFo7feI04riSVxfStcydeb6DbNv5UCn5cwfjeUM95Hl2YK6tJ7956Lcf2mSXn8/c21TWLpZdOFYmZ3GkPRs6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ilx6C7LCE6Bpym3x2hTRPEWxNxOsHAGQ1Ug7jpuFx+k=;
 b=seCPSMyh3JTWwOqPY0KSADSUN2ovf8DJ+aHhGBTnjr/YUBkyphO0goYS4TRVrrau4QAHkIug1qtIAt+MeTc3pyQAcgpY9Rco8TfUNu9x7HEU1E4b7crn2JOjeHBKfg5vZnZ5x6jRS32iYsOHLGt9zrIEUpE4ILDIP4xM1z8f9+3rdBq9n7sKW2BxwOFzVSJd08WolLV7qF1C2f48+aCELzvTWr+Os6/9wMc7Kpvn1mPqTnkFaAHBJTnWvZGZs3AzH+9qgjG2VRin8tJlaE8UzLk4+/2cycN5042XIKIQCmJhWrg+bMafZKs66Ei5Ad80cYgxau3fY7d2c5k7FVOX2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB9865.jpnprd01.prod.outlook.com (2603:1096:604:1ec::9)
 by TYYPR01MB8199.jpnprd01.prod.outlook.com (2603:1096:400:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 07:02:12 +0000
Received: from OS3PR01MB9865.jpnprd01.prod.outlook.com
 ([fe80::c38:6bea:5be1:b3ff]) by OS3PR01MB9865.jpnprd01.prod.outlook.com
 ([fe80::c38:6bea:5be1:b3ff%3]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 07:02:11 +0000
From: "Daisuke Matsuda (Fujitsu)" <matsuda-daisuke@fujitsu.com>
To: 'Felix Kuehling' <felix.kuehling@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
CC: "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>
Subject: RE: [PATCH] drm/amdgpu: Higher log level for missing PCIe atomics caps
Thread-Topic: [PATCH] drm/amdgpu: Higher log level for missing PCIe atomics
 caps
Thread-Index: AQHblH8FwceQlASdUEG3ueKRCucQsrN3tsuAgAAYRYCAAkA6gA==
Date: Wed, 19 Mar 2025 07:02:11 +0000
Message-ID: <OS3PR01MB98657096B7CACA994F9B3E21E5D92@OS3PR01MB9865.jpnprd01.prod.outlook.com>
References: <20250314011809.3243791-1-matsuda-daisuke@fujitsu.com>
 <BL1PR12MB51445BCE0365432BF55DD3EDF7DF2@BL1PR12MB5144.namprd12.prod.outlook.com>
 <efa255c2-efcb-4f6c-8864-3791d1969520@amd.com>
In-Reply-To: <efa255c2-efcb-4f6c-8864-3791d1969520@amd.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NDhjNDdkMTUtZmRjNC00ZWI3LTk1MzgtZDA3ZjExZTlj?=
 =?utf-8?B?NDc4O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjUtMDMtMTlUMDY6NTc6MTJaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB9865:EE_|TYYPR01MB8199:EE_
x-ms-office365-filtering-correlation-id: f180f180-b92d-4c8b-5351-08dd66b3f8c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|1580799027|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Q0FnKzk0Q2VyQTI3cEVOVGs2T1htVkVHNUkwSWsra0xpdkcyeGpCNGtyZElq?=
 =?utf-8?B?WFMyQ25DMjkwd0ttZ1NXdDNIalBrekdkY2xJb0hZREtuMkpQdC9oUDBXN0d4?=
 =?utf-8?B?U2tBRnFycnZMSy9jNGJ3aEJhWVM3bzR1SlRYeFVoZU9VMTFhenVHSWtjQ1ZV?=
 =?utf-8?B?VnI2YlhuK28vZmdBV3VvTVQvdXc4WkhINkJEYWdZRXlmQXBKZmVRVmxlVERG?=
 =?utf-8?B?MU9qYzhNLzVmeWJ4L200bXJxdXQzNDhUTnF1TkR3UXZ2TFVrM0QvM2lZV05r?=
 =?utf-8?B?dEw1eWJ5Y3U2c3NEQk1jTzU4NGg1SGJNbFRuQVdFQzhITGlmaCtUYnlpR0F5?=
 =?utf-8?B?MUtHd0JnR2tYa1RiYWFlRklGV0NPNlBTcHNsbnFEUTJGNGJhc3BkbUNUNVNE?=
 =?utf-8?B?Qlg3RTk4SnFlWkY4dlJhQmxrUHZJZjVsaXdZRENvTVhmNkdsWmJIZkRkQnlY?=
 =?utf-8?B?ekY5VzFCTGJrSVVuN2U3QmI1SWRsNXg3T2xGVDdPV1I4ZzNtWmJveXdXcFh4?=
 =?utf-8?B?VDQvRFF6Vy81a25LZDY2OHdjdWR3T1BZOVVGVjZ1R2R6UUJiRncxa3BQRThP?=
 =?utf-8?B?b2gwRktnQkVNL2hzV29IYkRuWDBjTEdSc3BCME4yOEJzZ0hPbEc1WkV0bVRj?=
 =?utf-8?B?amV2SVpLVjB4NFN5NjZra0VqcmpqU21yWmFkRGxUVUdEd0UvYllrM3JRK0VE?=
 =?utf-8?B?bDNjcmZUemtIT3BJU2xMZjFFZFpRdFpISFhXMmtCOFMrU0NJQ2c2VDBKbnBY?=
 =?utf-8?B?TnhhVnliMlcvUHhKY1h3NDRDRkRUdm9SV01RZHNwdlBRQWtVREs0U0pmS1dl?=
 =?utf-8?B?Tlgra2pNUXUwZWlSMDd0OWZHK3BEV0d2clJPeXl6Wk5majhnSWFMbVVRdkJE?=
 =?utf-8?B?RHR0QnJScDhrSmtTVXEyb3djU3JTQ2RBYXZ4ZUhEQ2VVMnk4ZU9RZVA5ZE9o?=
 =?utf-8?B?ZWJjYnpaL0pvc2txOENtVHA0QXd3aVNqT2xzMzBJZXNSU05BcnlVZ0dvQVRo?=
 =?utf-8?B?d0tLdjcxODU5OWI4cUZjTk5QUko1RUs5NWNTNkQ2L0FESkxCVk55elRNMWF6?=
 =?utf-8?B?eGtXdlFaOXgzellTVThXVG11ek9WdGZnMHhMQ25IcGJRdE4zeHlDZ1VVcHFU?=
 =?utf-8?B?NmE0aGkwb1JrOXNhQzc3WG90TE1aS2x3c1RYMUk4dEFsZWFsb29FK29XSk1n?=
 =?utf-8?B?YjdFNjZUalIzU2U0STByK0Q1WFUxUzE1YWp3Tjl6U25nV3NxeDF6SXdKQlVG?=
 =?utf-8?B?UnJHcXI4L3l5RXR1T2d1Y3JQclF3ZTFIL0RSUmlIOTVVbWxWcTMyQlg1MDgy?=
 =?utf-8?B?cVEvMVk0T3BGSGVMUmwyRnRFeTI1TWFKdGhMT2lLbTBjdHl1eGJhcklJOUhl?=
 =?utf-8?B?MWZ3akxsQUZTY2R3VGg0Z0U0Q1NEcnpTSGdKSXd5Yy9sRVZYRHN3VG5DaDJy?=
 =?utf-8?B?Wk9ZVzJudTdvVGMyRXhuTncrRW5sSzJiQXZySWJjNUE4RXY0SXg0L29GRDda?=
 =?utf-8?B?cjhWZHhlRGFDckxFdWJEblhyMjFYdDdvb1BYaFZKb2JwMitzbUlzai9KUExx?=
 =?utf-8?B?Y0dZWTQ1Y0Nsb3hldHZsWHZRWEN4WkJOb2xkN2YrQlFkcVpGYkl5NzNDR251?=
 =?utf-8?B?WWhBdXV1alRvRTk3UHVNeHg4QkJldUMyRjVPcUtDanRrOGxNRXJiMndOYUw1?=
 =?utf-8?B?VmdYejhaSmVHN0pzcUJob2wwS3p1N0JDamFMUjBIWWhaTFV3TDUwZUoreGtj?=
 =?utf-8?B?eWJ2SjNFTGpnY2xiZnZVU0xsbmxyZUJ4RmQzSkUvMTRvZjVMM3VUdzJhUUlM?=
 =?utf-8?B?RTNETEY5di9razRHUkpEczNXbmhmZEdHb1UyeWtBK2tvWlB4NjNaOWs0bGg4?=
 =?utf-8?B?c2V6SDlHb01VbXJRNFh5MmN1RHh0Z3lVbzZmcUkwREJMZjBTYVZ2WHFGZmJR?=
 =?utf-8?B?Z0hQUkMvWjByc1lUSFFTS2VlcjVCM0ZYZlJRNStzaVZRWWNGbFdYLytSSGZq?=
 =?utf-8?B?UEg3MVp4SzVBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:ja; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB9865.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(1580799027)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXQzWStNaHJ4ckpYTU9DblNWMmRnSjdBWThtYm1Pa3N6TVVJeFBqNlVuSWs4?=
 =?utf-8?B?WW8zVk1PQ0hpcnpIQytDZnRaNldwMU03YVVxL1VXdHdQZ0pwbnE1NldZRjds?=
 =?utf-8?B?WTFDNXdQa3Zwa3BPVllyR3N0TFF6eTRSNzFNS1lUMTZRUDV1TldBeFlsUHM3?=
 =?utf-8?B?UmVYSTVTRnQ0dFZsMXRGUTI1dEN2THQ2OFBHa2lpdFViM0tKeHc1RDVVSHcz?=
 =?utf-8?B?dU5wOGZKaFhTZ0hxUStVWHV6a09KN1ZoaTlNRU1TZUNXcFRwL3ZKUjMzSEF4?=
 =?utf-8?B?aXJyWWhwOCtHWHZpdHpoQUIxQUpNMGNrVFBXekNwM3p1bXRUUkFKdGdEWnVH?=
 =?utf-8?B?UVdSMW9rdTFiMXNGUDhUa2xrQmV0cWVkS1FBa0tMVjVPT0hyNVVnclZISW9z?=
 =?utf-8?B?cm9WZU1DWFQ2djhrb1hvcDRRcGM5eHNSQ28ySHYydm5NZ3JPMzBWdHhFTDJR?=
 =?utf-8?B?RCtodElPNEJSdEJNYkxUaytESVNTTDFlaG41eHd5VjFPeFQwdDRxL3dWUWZo?=
 =?utf-8?B?d2F5eVZmMHZNWW5JSXNoT0ZyVWVmbFZhOGpiY1ZNVFBTdG5uYlRVSklwbEFa?=
 =?utf-8?B?MkRaZCtGa05yNGFPVnBURFhVUmRKckxjdFo3UTcyNG8zcEFlQmwzM1hIaHdU?=
 =?utf-8?B?SHlyYkFYSTYwbTlkeG82aDhXSmlXU0pEQVRRRjJiNlh3RDlISWN4TU9Gclgr?=
 =?utf-8?B?RENMY3VXQ3RLSHRBOGhWUlcrWHRzM2NjdklQcXJGWC92SmYwRFFTemUwZ0RV?=
 =?utf-8?B?SVlQb2k1UHNRVkRoaEJ2SWlCcC9zOFZGem54NUc0VXErTFN3WW4rWklGYTkw?=
 =?utf-8?B?enhpT0VmWGdhY1VNSHVzV2VQRndORnE5WHE2bFlrN3VjR2k2ZnpYZHVaVW9M?=
 =?utf-8?B?ZkJEc0RiRHJHRm5EZjIyZEpnNjJWdzRqRS91QWtSdWZ6WUVqOEpYTzhCaXZX?=
 =?utf-8?B?V0p6enN1YnlrVlNEZDM4eXFBR2pXaUg2K0ZGWW9PeG14Q1l5dDhsOGlJOTFY?=
 =?utf-8?B?b1REUTgweEVHaGNOY3RRUG03V3dDZ1ZqVFFLMTJiMC9xQjhPSlcyWUozZ1N6?=
 =?utf-8?B?NzBKcis0anMzMzNyVEhlclJtY2N0Wnk2N2g0dWRMd3o3ZmpkZFV1YzV2V2lK?=
 =?utf-8?B?OWNBdjF4YmE0NU9JQ1c3c3dEZlpmbU5qSCs5bjhDVFB4ZXVRbW9Jdlg0aW5x?=
 =?utf-8?B?aWZrY3duRzZPbkdQaU1QbmZpZC9pNU5NczF3aWZyY0NUTTN5VElwYjYwZklR?=
 =?utf-8?B?UjBtR215N0tGd1J1YjF4em9Ud1YyOWRzYmdPcFhrM0RLZm4vZGNLSWZmOUxn?=
 =?utf-8?B?c1VEdVdVb0JFWFNLaDAraHoybFhSQjB2a0lpZ1ZrQnNwUTZJL2F6ci9GR2RM?=
 =?utf-8?B?UzZMTTZPc09kTXZTbWZNS0lWOGZETkEvVWFXMDlVSTY4Y3gyYUZWNEtUdXls?=
 =?utf-8?B?TEdJSzJGNjNWOHpKOERuZUcraGFGTHE0Z0NwZHdEZDVwMUQ5dGlEVG5xbUdP?=
 =?utf-8?B?RXpVMmNFaHFzZEc5a2lQTmxXZXdVK3gzU2l4SGZqUDZyS0RHSzU5bXJFNFNZ?=
 =?utf-8?B?ZHVDY3ppV3BPS2s0b2Y3MWxKU1BhV21DbHdLS3lNVko4N0FjK2JwamUyRURV?=
 =?utf-8?B?Y0czUWErcGRJSWY0WnQ1QW9TVm1HbU5LalllMC92cnFtdHRKWGtCOGNQa3hR?=
 =?utf-8?B?MDkraFI2Z2V6M1NHdDhRMkxPMkdJWE9xdmpoUzVWU0RBOSt0R1c4Z0xFa2tx?=
 =?utf-8?B?ZjVsQ3RUcU4yWVAvOGE5OHl6akhYNFFSRWs5OXNEVFU1K1d2eW84dlZIdlB5?=
 =?utf-8?B?cHkyOGllZ0w0U0o2MVR6OGlIVVVCWXlFMVpUMW5oZ3YvcElxYWlBRUd0Q2ZJ?=
 =?utf-8?B?ZzUvOVdSY1N4VzZnd0lhcFB5azFoTDY5MmozUHVEKzBqWFRtVEUralJsVHQ4?=
 =?utf-8?B?S1dKbTdUYWs2VWwxd2NhMXJIS1FjNzk1cStWbVdFQmpIaTl6b001bGRvVnIr?=
 =?utf-8?B?Kzk2b1VWQzJBeStxWU02Z0pEUlhkMnY2TE1GZnFVbkVwVG1CTE80dGx0YW9W?=
 =?utf-8?B?ZGw0SE0zWXM1cmdlUy9mS2RGaURsT1pFaCtVeW9yRjNmenYxejFBbklKY2ZV?=
 =?utf-8?B?SW5VT2kyMGlxZ0x1eDhqc2ZQVGtDa01lSEdqbUJTN2dWMUpoSERJWkRwdXRU?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: RlBGzK1V2uqSAvj7HGFbajX+slFZFyMXVpMaOmQO+8ZJ60+LdrmosFiM1PJaBgNht0pjOmPvBTgzyL4xbSh5G1oVccdTG05FTLLKNaiewX1uqnr5TA0cElsmkdss8s6HwTCYRC4FPPud5OdZ0JCiYuPKVURXZeTnGeiG1RBYVcEjpFYOiB8X+S7tGNavdZw8j05fBQG2FKNWsAt1/64BAZ5JhkK9pFMFXtu/6D7+b9Qs518sp+bgkIfxMQAxizrCYq3Aofy3r9yDkcH/SqWVOlw/uvj3CQYKw2jaabV+UduSPrNKX9GmCTROhYWoLlNrObOrvuOoYz3NAo4KCU6FWLqg7FyYfUymjzDQvZGX5DFUSW5xwZnx5Zod0Wxe3IUOJfmmwm5qtCJC7XVd6ZI95T7wR8bTlpWE6CQ3bmPQ7qX/e2wQK27PK6lAdpts4P3f8G+4v7PHUoxL6HezzmwnqWcoX/It7/+a5VidvrCSWZnfgg8PHHYjGYxc/i6EQhm745NVFsstdcTKmd8IJkPxFpsghMdh0tQTeIy+uzNdgzzw2wLJZkkxbzyQmVaJITma4Lqc8ard1+wxrSFFL4XztMesbc7O7NmWzlO4ZwlBixrMjLtCi19l/CmnayeJRg/Z
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB9865.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f180f180-b92d-4c8b-5351-08dd66b3f8c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 07:02:11.4832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C2YyGgY2SjuUgwTHao3cnnsvkWf6W3e9x2e1WEkkm6fvP8tVSynGLO1uOQlmh4JAvQmfQejoM/p0ufAL/W3wI5M50vBqZ5ZFQKNdjhqHyg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8199
X-Mailman-Approved-At: Wed, 19 Mar 2025 09:53:34 +0000
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

T24gVHVlLCBNYXIgMTgsIDIwMjUgNTozNSBBTSBGZWxpeCBLdWVobGluZyB3cm90ZToNCj4gT24g
MjAyNS0wMy0xNyAxNTowNywgRGV1Y2hlciwgQWxleGFuZGVyIHdyb3RlOg0KPiA+IFtQdWJsaWNd
DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogRGFpc3Vr
ZSBNYXRzdWRhIDxtYXRzdWRhLWRhaXN1a2VAZnVqaXRzdS5jb20+DQo+ID4+IFNlbnQ6IFRodXJz
ZGF5LCBNYXJjaCAxMywgMjAyNSA5OjE4IFBNDQo+ID4+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGV1Y2hlciwNCj4g
Pj4gQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3Rp
YW4NCj4gPj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4gPj4gQ2M6IGFpcmxpZWRAZ21h
aWwuY29tOyBzaW1vbmFAZmZ3bGwuY2g7IERhaXN1a2UgTWF0c3VkYSA8bWF0c3VkYS0NCj4gPj4g
ZGFpc3VrZUBmdWppdHN1LmNvbT4NCj4gPj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBI
aWdoZXIgbG9nIGxldmVsIGZvciBtaXNzaW5nIFBDSWUgYXRvbWljcyBjYXBzDQo+ID4+DQo+ID4+
IEN1cnJlbnRseSwgUk9DbSByZXF1aXJlcyBDUFVzIHRoYXQgc3VwcG9ydCBQQ0llIGF0b21pY3Mu
IFRoZSBtZXNzYWdlIGlzIG1vcmUNCj4gPj4gdXJnZW50IGZvciBHUEdQVSB1c2VycywgbWVhbmlu
ZyBiYXNpYyBmdW5jdGlvbmFsaXRpZXMgb2YgUk9DbSBhcmUgbm90IGF2YWlsYWJsZQ0KPiA+PiBv
biB0aGUgbm9kZS4NCj4gPj4NCj4gPiArIEZlbGl4DQo+ID4NCj4gPiBNeSB1bmRlcnN0YW5kaW5n
IGlzIHRoYXQgUENJZSBhdG9taWNzIGFyZSBub3Qgc3RyaWN0bHkgcmVxdWlyZWQsIGJ1dCB0aGVy
ZSBhcmUgc29tZSBmZWF0dXJlcyB0aGF0IGFyZSBub3QgYXZhaWxhYmxlDQo+IHdpdGhvdXQgdGhl
bS4gIFdhcm5pbmcgc2VlbXMgYSBiaXQgb3ZlcmtpbGwgYW5kIHBvdGVudGlhbGx5IGNvbmZ1c2lu
ZyB0byB1c2VycyB0aGF0IGhhdmUgYW4gZXhpc3Rpbmcgc3lzdGVtIHRoYXQNCj4gb3RoZXJ3aXNl
IHdvcmtzIGZpbmUuDQo+IA0KPiBJIGNvdWxkIHNlZSBlaXRoZXIgYXJndW1lbnQuIFRoZSBHUFUg
aXMgY2FwYWJsZSBvZiBQQ0llIGF0b21pY3MsIGJ1dCB0aGUgc3lzdGVtIGNvbmZpZ3VyYXRpb24g
KGNoaXBzZXQsIFBDSWUgc3dpdGNoLCBldGMuKQ0KPiBpcyBwcmV2ZW50aW5nIHRoZW0gZnJvbSB3
b3JraW5nLCB3aGljaCBoYXMgYW4gaW1wYWN0IG9uIHNvbWUgYXBwbGljYXRpb24tdmlzaWJsZSBm
dW5jdGlvbmFsaXR5LiBBIG5haXZlIGFwcGxpY2F0aW9uIHRoYXQNCj4gZGVwZW5kcyBvbiBhdG9t
aWNzIGFuZCBpcyBub3QgY2FyZWZ1bGx5IHdyaXR0ZW4gdG8gcHJvdmlkZSBmYWxsYmFja3Mgb3Ig
ZmFpbCBncmFjZWZ1bGx5IGluIGNhc2UgYXRvbWljcyBhcmUgdW5hdmFpbGFibGUsDQo+IHdvdWxk
IGZhaWwgc2lsZW50bHkgb3IgcHJvZHVjZSBpbmNvcnJlY3QgcmVzdWx0cy4gU28gbWF5YmUgdGhh
dCBqdXN0aWZpZXMgYSB3YXJuaW5nIG1lc3NhZ2UuDQoNClRoZSBMaW51eCBrZXJuZWwgY29tbW9u
bHkgdXNlcyAid2FybiBsZXZlbCIgbWVzc2FnZXMgdG8gYWxlcnQgdXNlcnMgd2hlbiBhbiBpbmNv
bXBhdGliaWxpdHkgcmVzdHJpY3RzIGZ1bmN0aW9uYWxpdHksIGFuZCB0aGlzIGFwcHJvYWNoIGFs
aWducyB3aXRoIHRoYXQgcHJhY3RpY2UuDQpUbyBhZGRyZXNzIHRoZSBjb25jZXJuIGFib3V0IHRo
ZSBtZXNzYWdlIGJlaW5nIHRvbyBnZW5lcmFsLCBob3cgYWJvdXQgbWFraW5nIGl0IG1vcmUgc3Bl
Y2lmaWMgbGlrZSB0aGlzOg0KICBkZXZfd2FybihhZGV2LT5kZXYsICJQQ0llIGF0b21pYyBvcHMg
YXJlIG5vdCBzdXBwb3J0ZWQuICBST0NtIHBlcmZvcm1hbmNlIGFuZCBmdW5jdGlvbmFsaXR5IG1h
eSBiZSBsaW1pdGVkLlxuIik7DQpUaGlzIGlzIG1vcmUgZGlyZWN0IGFuZCBmb2N1c2VkIG9uIHRo
ZSBpbXBhY3QgdG8gUk9DbSB1c2Vycy4NCg0KUmVnYXJkcywNCkRhaXN1a2UNCg0KPiANCj4gUmVn
YXJkcywNCj4gwqAgRmVsaXgNCj4gDQo+IA0KPiA+DQo+ID4gQWxleA0KPiA+DQo+ID4NCj4gPj4g
U2lnbmVkLW9mZi1ieTogRGFpc3VrZSBNYXRzdWRhIDxtYXRzdWRhLWRhaXN1a2VAZnVqaXRzdS5j
b20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jICB8IDQgKystLQ0KPiA+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRndl9z
cmlvdm1zZy5oIHwgMiArLQ0KPiA+PiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gPj4gaW5kZXggMDE4ZGZjY2Q3NzFiLi5mYWVlZjEzNmUy
NzIgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYw0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMNCj4gPj4gQEAgLTQzNzQsNyArNDM3NCw3IEBAIGludCBhbWRncHVfZGV2aWNlX2luaXQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gcjsNCj4gPj4gICAgICAgfQ0KPiA+Pg0KPiA+PiAtICAgICAvKiBlbmFibGUgUENJRSBh
dG9taWMgb3BzICovDQo+ID4+ICsgICAgIC8qIGVuYWJsZSBQQ0llIGF0b21pYyBvcHMgKi8NCj4g
Pj4gICAgICAgaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkgew0KPiA+PiAgICAgICAgICAgICAg
IGlmIChhZGV2LT52aXJ0LmZ3X3Jlc2VydmUucF9wZjJ2ZikNCj4gPj4gICAgICAgICAgICAgICAg
ICAgICAgIGFkZXYtPmhhdmVfYXRvbWljc19zdXBwb3J0ID0gKChzdHJ1Y3QNCj4gPj4gYW1kX3Ny
aW92X21zZ19wZjJ2Zl9pbmZvICopIEBAIC00Mzk1LDcgKzQzOTUsNyBAQCBpbnQNCj4gPj4gYW1k
Z3B1X2RldmljZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiA+PiAgICAgICB9
DQo+ID4+DQo+ID4+ICAgICAgIGlmICghYWRldi0+aGF2ZV9hdG9taWNzX3N1cHBvcnQpDQo+ID4+
IC0gICAgICAgICAgICAgZGV2X2luZm8oYWRldi0+ZGV2LCAiUENJRSBhdG9taWMgb3BzIGlzIG5v
dCBzdXBwb3J0ZWRcbiIpOw0KPiA+PiArICAgICAgICAgICAgIGRldl93YXJuKGFkZXYtPmRldiwg
IlBDSWUgYXRvbWljIG9wcyBhcmUgbm90IHN1cHBvcnRlZFxuIik7DQo+ID4+DQo+ID4+ICAgICAg
IC8qIGRvb3JiZWxsIGJhciBtYXBwaW5nIGFuZCBkb29yYmVsbCBpbmRleCBpbml0Ki8NCj4gPj4g
ICAgICAgYW1kZ3B1X2Rvb3JiZWxsX2luaXQoYWRldik7DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRndl9zcmlvdm1zZy5oDQo+ID4+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3Zfc3Jpb3Ztc2cuaA0KPiA+PiBpbmRleCBiNGY5YzJmNGU5
MmMuLmM1MjYwNWEwNzU5NyAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3Zfc3Jpb3Ztc2cuaA0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRndl9zcmlvdm1zZy5oDQo+ID4+IEBAIC0yNDAsNyArMjQwLDcgQEAgc3RydWN0IGFt
ZF9zcmlvdl9tc2dfcGYydmZfaW5mbyB7DQo+ID4+ICAgICAgIH0gbW1fYndfbWFuYWdlbWVudFtB
TURfU1JJT1ZfTVNHX1JFU0VSVkVfVkNOX0lOU1RdOw0KPiA+PiAgICAgICAvKiBVVUlEIGluZm8g
Ki8NCj4gPj4gICAgICAgc3RydWN0IGFtZF9zcmlvdl9tc2dfdXVpZF9pbmZvIHV1aWRfaW5mbzsN
Cj4gPj4gLSAgICAgLyogUENJRSBhdG9taWMgb3BzIHN1cHBvcnQgZmxhZyAqLw0KPiA+PiArICAg
ICAvKiBQQ0llIGF0b21pYyBvcHMgc3VwcG9ydCBmbGFnICovDQo+ID4+ICAgICAgIHVpbnQzMl90
IHBjaWVfYXRvbWljX29wc19zdXBwb3J0X2ZsYWdzOw0KPiA+PiAgICAgICAvKiBQb3J0aW9uIG9m
IEdQVSBtZW1vcnkgb2NjdXBpZWQgYnkgVkYuICBNQVggdmFsdWUgaXMgNjU1MzUsIGJ1dCBzZXQg
dG8NCj4gPj4gdWludDMyX3QgdG8gbWFpbnRhaW4gYWxpZ25tZW50IHdpdGggcmVzZXJ2ZWQgc2l6
ZSAqLw0KPiA+PiAgICAgICB1aW50MzJfdCBncHVfY2FwYWNpdHk7DQo+ID4+IC0tDQo+ID4+IDIu
MzkuMQ0K
