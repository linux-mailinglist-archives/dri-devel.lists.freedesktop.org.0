Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNcxMUSMpGlfkAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 19:58:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683251D1264
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 19:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3657A10E3F7;
	Sun,  1 Mar 2026 18:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j9bmJ1Oa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CA410E3F4;
 Sun,  1 Mar 2026 18:58:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHaW6o2MhQPbYuAj5DonsfR/nANx+a+VAgqldBDVC834v5qvYOPn5x2GJqX5eSZFNWFD+kguKJMGEd0Y8m4ZsZUglxk/ltO/A2j29s2VrzAQ1Ha7peyK+6ODkCWbAbyrrxXUN9dzAz8I/pntgh6T33eYSldYFcwcjoHOn2uc/GSa8BxhHCFHt9TtEB3jUoK+1Cf9OO8BvODqKrw69bV7yOsHfN2PQOeyAJSdMyCS3EjK98WGpM1iniJKScDrKTKIRKHRjf7Zd+0HF/VgqVPdspfCFjDCeg/ekO7SrU9NT6S7a8YiYVLw88zzQR3go6+X1f9z1Od8v8GiTBlfNZF+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6zBEpGEDAJbrnN4TM09gDDer46h38xGb3BlzK6FUhY=;
 b=Sevn0r1hJ7fzFMHdZcjvuiSKcLFBOuxNUx+qa5pbyHGRJ2ghZ/jqdXUJ+0KQVobEqAtpSiTCjtiKzP9k2RTfySGSvLXynEpFKoQulWUz4wPkc8PWgAHxznMLW2epTAftJYMLGtBWjL4x3f48H1AX0/rJ68DreCLdUsYA9X2qqV45HkNc0mwdYyLmb3VPjOhma1uFi+TxsfQNen7o7M2C8xfubEQ0xn0LoM/148zSK7tPxQoqPptuS5noru7BwCKYz6eLj/qTkUs7yJUMj/0+o2RPMINll6ouSr1Wf0HxpR11TN6US+lpcDNMuC81yZ3vb3bsZgBtnP3q5BIA5w8cHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6zBEpGEDAJbrnN4TM09gDDer46h38xGb3BlzK6FUhY=;
 b=j9bmJ1OaYL7yxAUx+hG3kgc1V9P5iw7V6aJRTPHZIUIXH49tJu7gcPR6w6tRJrFc24izVIgYepxJGncFwMNAwzJZts7j1I+rG1UD1wC5DLJd4H++3eeSi6fWFT6+N1EWw2crxjoziLhyZyRl2lfxbf5HfSKs5GoSbGNeDFqdc1hTzrOWyuggHVfaiYGJLJQzvPFmDCt3jBhJPOLqIl+vh4Lu2+lAJ6Wiy9SxFDHpF7DSDo9+6wsRIx9lOZM91bDLruUHFqz8ub7LztB/qd6QGLI8mOzpDpfvFBWjDFr3R03s9FtNcHvof2/itxJTF26dQ1LlmtyC+OB2zgq0dvWTkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sun, 1 Mar
 2026 18:58:00 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 18:58:00 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: patches@lists.linux.dev
Subject: [PATCH 2/5] dma-buf: Change st-dma-fence.c to use kunit
Date: Sun,  1 Mar 2026 14:57:54 -0400
Message-ID: <2-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
In-Reply-To: <0-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
References: 
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:208:239::27) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL1PR12MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: f99a3cd9-5886-4013-155b-08de77c47497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: VuXWmohjHY8POKHvoQ3g/o8VVElqBg75Msq/xnFV7R8Nu1THu4VfU7X5jOOLrkjXslbTvB58Wglsi+vLYUk9cPOdseHopCmaDkjGsgYmphEGjz89xcWYGb9To+eoip2b4Hr37oqWGRfnhT2k0Oy3prV0htPbCdX0i8pNy2DaDYZvX500uk+4N5VDcolRPtEsRXvQwtFwC2+FP7TXeX3SbXI8SZFKHbcKhbieShBDRFINkT9eQZRFBe7avqikBA0RC4jiiPiFu6uxYoDagwyOUCwdCx23aDYXPcKpADWO8efMQiC6OGVzOn8TujK6lVF0QKf8KEY+/BrxmPar91XgXBzvM/9FOnXdh/3ZrS0bufCng+nbCkuutbaVR4TAhbEWY75j2cSIrj2zIP1omuQhk5nGyg/lQgyit8ZIme3k7CR8t9I/VYZXW8oAWtCEx1Fqf/At9GCeXG28BmK2IiFJ/6jodhNQHVoTKwX9BZf4PYb6CO2b6I3A2dTPAEma/48vI2m4n3CyUgYm0obIUD+yk5LTMk+rjHa5hstcxoXRO4H62WSeq3kMJDwwHEURBbEfl17KvL1pxNvhnXNNullXbtPunJttDYoD+CYrxPDU/jRR/1+1+XfBXziIMVMqW5N5AExPJOykbW0OMZavrrLoaoX8r90rR+KqwpZXjMed8y+mVHqTJm4jKj002r7AlBAbnhvsl4vjBbB69h5iRCSLviRBpdEfvhaDGwZojg1PuoZkuqe51N1z25gZnFr8gtYep34ANCjobwLROCA73Y9zxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXVpYTlISkMvWXpZK2NxQUtNbWs0WkllSjZRaFQvbTNqSFpvOG84NGhVWUVs?=
 =?utf-8?B?K3ZuV2lCWUlOSS9Id1l6KzEzSW5CQlJaZlYxOXFCL2laTmxVOVBIcE0veDRp?=
 =?utf-8?B?SkdhVTZRWWV1V2NtRXJvL3pvc3V1R3ZkVktjRW5pTW55N0JESWtFME9BNjR6?=
 =?utf-8?B?c1p3bnlERVF3emhZRFYyVnhaVWtBR3cxMDl0Z1lmWGNqUnVKR2drcVlCaVRJ?=
 =?utf-8?B?U1RDSVVCTGlXQS8yQ2FWaDc2V0RuNUhHYnQxR2pnYXF1ZjRYR1l6SlFueE53?=
 =?utf-8?B?OWFWZGJmRnpwR2wxZWIyTXBwV3BLTWZpVVpuczB4TE1nbXYrS2QyOG9RN2d3?=
 =?utf-8?B?dEU2RU9Tamh2dVd6Uk56R0tUL3JVU004eTVMOCs4ZVFFNUcwUmNVZExCVS9F?=
 =?utf-8?B?WVU4c2xxVzkveFJCeTJqMWlkbXphWlBmTmE5TndJMitSV2FzVWdsc2FvVkV5?=
 =?utf-8?B?TDJwSE1XU2ZPbTNtZjB4WlZRZHMrOEd2Rk9Tb3FVb2YreFpqZEhia0huM05i?=
 =?utf-8?B?cFRhK1FIQWpCNkdoVEZadSs1VlJaeWtQd2ZLWGtjZHB1NlVDQXdTeVZGbmdD?=
 =?utf-8?B?L0pvZjNjMHU4Q3RZWHFsVGh1aytnenkxamFDV0FvdlMxeTRMQVQ0azZFbkp4?=
 =?utf-8?B?bVh6aWRzblNsUVpUL3luenF3cmNmeEgyV0hGdXRjV2ZqaVlZdGRCSHpjRXZr?=
 =?utf-8?B?QVFNNndjTXhia21hL1UxSGNHRDBqSThSNnNOZWRpL0R5Zk9FZE5hNVJMRFo3?=
 =?utf-8?B?aTdCeStNam1TMUhQSG5yc0ZaOVZBV2tQSWpiSzkrOTh5cXU4bWVEZ1lPVitz?=
 =?utf-8?B?TE13QmNwOE1xSGw4clNla3JyZEJEUllBM2xac3p5eU1oYW4xTTd1TVFEd2s5?=
 =?utf-8?B?OTJwU0pqNjQydCtiaUFCZ0pOc05CamI0emV6UFVENi9wSkc4K0tvS1JHS1lB?=
 =?utf-8?B?YnFFNWhRV0ZOOSszRTZJMFowZVVrbll0Q05FSERzWjMvdnBuZjJXRlRQN2FZ?=
 =?utf-8?B?Vm01OFViQ0R0REZsWDBvN25xOGtpZVRXcUpJNmpxT0t3Rk9oNk5tekF3aStN?=
 =?utf-8?B?T1FkU2hqbVdIVGRXWnZZenBOVjhBMCtJTXJ1NWJQUjdpc3BtZk9TQ0pOdURz?=
 =?utf-8?B?S0h6NEdobGswSGNZNmtDL0tOMDFpa045YWZWS2VBa1Z2OC9TWHVJTWhzWmJp?=
 =?utf-8?B?QmdTZCs5RzJudWovSFBZdU8xbVV3cGVsY1FlcndQZFQ3MUQ5c3NuZlJiOFp4?=
 =?utf-8?B?cWRyL1RURDlpNVluTlhDaHBrSExzTXBMWFp0OHRmZ0c2bThMYWVGUVZpbFJp?=
 =?utf-8?B?KzV5QlowTXhpVTBGdzI5eFY4ejFJZ3M5cG1zdk15TXNpandMUDRWMktUWHVq?=
 =?utf-8?B?MnVPZWpkM3FXTXRsWWZJQWxERXhWTHYrd1p3WGRrSmhyaG5CTitJT3BOMG9Y?=
 =?utf-8?B?TTlYbjQ2TGcxRTE4UGdrSHJqaXZVOFNTQlVwTERKVU5CUm1RUXBoSFZTNDl4?=
 =?utf-8?B?aVZOOTJaenduWCs1MFdFVlROamdmRGhUdmhqOENjS0lpTzYvaDVWb0cwQytk?=
 =?utf-8?B?M2M3c1JxVjRORmRjZG1mYXQ5ZW5TN3cwWVRybFR4LzF5NWpUcDFQWnVuVHVp?=
 =?utf-8?B?RTM1UFhwRzVrd3BQRVBlVWYvTVZRZW8rZXZFYzlzNGs0SlEwZkFoSDJaYUdI?=
 =?utf-8?B?a1I0U1c2NnlDQ0xCN2xNaDNuOVpid2hUZ3JhRlpaNmN5N0VleGt5Q0pEWGtQ?=
 =?utf-8?B?QUhwQTZXYTg5WXdGeTVlUHJNcWRWbER1REkvL01UMEF1enMvWmViOG1QU2gv?=
 =?utf-8?B?VmxVYWpTem4vS2M2eVhjMGdIMzd2Vjh5eHR2aktZNlZjSmhoWGx5SksvTHJJ?=
 =?utf-8?B?VGRJZHRWNlBpNXNBYlFSWVhjekhaYnBDcU1zdFFlb1NvWU4rcG9Vc2pMOG9O?=
 =?utf-8?B?Y0pSeWxXYUtFbHFHOHFDT0xCSHhRZWY2RTB0NlpHMDFJTVlFUFFnY3YrUjJD?=
 =?utf-8?B?dHNSK1hRemVqUE04VzdoRzhRSnZvWkdjUmV5MDBFM1Y3WVIvNmsyMWxWMzg3?=
 =?utf-8?B?dkxNZHF5Sjl5bXo1TWtsMEZlWEcwYmllbUFQZC9yMXJBdWZNcVhVUkRFbmFW?=
 =?utf-8?B?RExXQ20xMXhZNDgxbGZrRVQxZllMekRVeHlDWFpVMWZGR1NBUGZEVHJuZExP?=
 =?utf-8?B?QVhmWW8rODIzWURnaVU4YW1jcThEWUdRSzFMVk1KQmQxVDBWMVZFSEFTMzV4?=
 =?utf-8?B?amhBYXlVc3BLUzArWmdwaWdaK052c21BTjlDcHN4cHdUMEI3Z0hkUU5NUWJW?=
 =?utf-8?B?NXBuRTZ2bDRBY0Z3Z2NpOU9TQ2xxSXJsTUNiVkI4azVZSG96UUFBQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99a3cd9-5886-4013-155b-08de77c47497
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 18:57:59.2545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7n4fxgcNfTd7WXU4YBWa/JAWaIgIxeUvEZFgg9nSBNYfM5K8amKGchSgjPvQplWZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,lists.freedesktop.org,linux.intel.com,lists.linaro.org,vger.kernel.org,intel.com,ffwll.ch,linaro.org,ursulin.net];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,kunit.py:url]
X-Rspamd-Queue-Id: 683251D1264
X-Rspamd-Action: no action

Modernize the open coded test framework by using kunit.

Add a num_online_cpus() check to test_race_signal_callback() as the
default kunit.py runs the VM with a single CPU and this test depends on
two truly parallel kthreads. Skip it instead of hanging.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/Makefile       |   2 +-
 drivers/dma-buf/selftests.h    |   1 -
 drivers/dma-buf/st-dma-fence.c | 200 ++++++++++++++-------------------
 3 files changed, 88 insertions(+), 115 deletions(-)

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 2e7a1453e2fe04..37c94562e677ca 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -9,13 +9,13 @@ obj-$(CONFIG_UDMABUF)		+= udmabuf.o
 
 dmabuf_selftests-y := \
 	selftest.o \
-	st-dma-fence.o \
 	st-dma-fence-chain.o \
 	st-dma-fence-unwrap.o
 
 obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
 
 dmabuf_kunit-y := \
+	st-dma-fence.o \
 	st-dma-resv.o
 
 obj-$(CONFIG_DMABUF_KUNIT_TEST) += dmabuf_kunit.o
diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
index 2fdaca6b3e92e2..0a348a5cbbebc7 100644
--- a/drivers/dma-buf/selftests.h
+++ b/drivers/dma-buf/selftests.h
@@ -10,6 +10,5 @@
  * Tests are executed in order by igt/dmabuf_selftest
  */
 selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
-selftest(dma_fence, dma_fence)
 selftest(dma_fence_chain, dma_fence_chain)
 selftest(dma_fence_unwrap, dma_fence_unwrap)
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 0d9d524d79b6d9..4992722296968d 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -4,6 +4,7 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <kunit/test.h>
 #include <linux/delay.h>
 #include <linux/dma-fence.h>
 #include <linux/kernel.h>
@@ -12,8 +13,6 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
-#include "selftest.h"
-
 static const char *mock_name(struct dma_fence *f)
 {
 	return "mock";
@@ -36,62 +35,55 @@ static struct dma_fence *mock_fence(void)
 	return f;
 }
 
-static int sanitycheck(void *arg)
+static void test_sanitycheck(struct kunit *test)
 {
 	struct dma_fence *f;
 
 	f = mock_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	dma_fence_enable_sw_signaling(f);
 
 	dma_fence_signal(f);
 	dma_fence_put(f);
-
-	return 0;
 }
 
-static int test_signaling(void *arg)
+static void test_signaling(struct kunit *test)
 {
 	struct dma_fence *f;
-	int err = -EINVAL;
 
 	f = mock_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	dma_fence_enable_sw_signaling(f);
 
 	if (dma_fence_is_signaled(f)) {
-		pr_err("Fence unexpectedly signaled on creation\n");
+		KUNIT_FAIL(test, "Fence unexpectedly signaled on creation");
 		goto err_free;
 	}
 
 	if (dma_fence_check_and_signal(f)) {
-		pr_err("Fence reported being already signaled\n");
+		KUNIT_FAIL(test, "Fence reported being already signaled");
 		goto err_free;
 	}
 
 	if (!dma_fence_is_signaled(f)) {
-		pr_err("Fence not reporting signaled\n");
+		KUNIT_FAIL(test, "Fence not reporting signaled");
 		goto err_free;
 	}
 
 	if (!dma_fence_test_signaled_flag(f)) {
-		pr_err("Fence reported not being already signaled\n");
+		KUNIT_FAIL(test, "Fence reported not being already signaled");
 		goto err_free;
 	}
 
 	if (rcu_dereference_protected(f->ops, true)) {
-		pr_err("Fence ops not cleared on signal\n");
+		KUNIT_FAIL(test, "Fence ops not cleared on signal");
 		goto err_free;
 	}
 
-	err = 0;
 err_free:
 	dma_fence_put(f);
-	return err;
 }
 
 struct simple_cb {
@@ -104,215 +96,187 @@ static void simple_callback(struct dma_fence *f, struct dma_fence_cb *cb)
 	smp_store_mb(container_of(cb, struct simple_cb, cb)->seen, true);
 }
 
-static int test_add_callback(void *arg)
+static void test_add_callback(struct kunit *test)
 {
 	struct simple_cb cb = {};
 	struct dma_fence *f;
-	int err = -EINVAL;
 
 	f = mock_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	if (dma_fence_add_callback(f, &cb.cb, simple_callback)) {
-		pr_err("Failed to add callback, fence already signaled!\n");
+		KUNIT_FAIL(test, "Failed to add callback, fence already signaled!");
 		goto err_free;
 	}
 
 	dma_fence_signal(f);
 	if (!cb.seen) {
-		pr_err("Callback failed!\n");
+		KUNIT_FAIL(test, "Callback failed!");
 		goto err_free;
 	}
 
-	err = 0;
 err_free:
 	dma_fence_put(f);
-	return err;
 }
 
-static int test_late_add_callback(void *arg)
+static void test_late_add_callback(struct kunit *test)
 {
 	struct simple_cb cb = {};
 	struct dma_fence *f;
-	int err = -EINVAL;
 
 	f = mock_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	dma_fence_enable_sw_signaling(f);
 
 	dma_fence_signal(f);
 
 	if (!dma_fence_add_callback(f, &cb.cb, simple_callback)) {
-		pr_err("Added callback, but fence was already signaled!\n");
+		KUNIT_FAIL(test, "Added callback, but fence was already signaled!");
 		goto err_free;
 	}
 
 	dma_fence_signal(f);
 	if (cb.seen) {
-		pr_err("Callback called after failed attachment !\n");
+		KUNIT_FAIL(test, "Callback called after failed attachment!");
 		goto err_free;
 	}
 
-	err = 0;
 err_free:
 	dma_fence_put(f);
-	return err;
 }
 
-static int test_rm_callback(void *arg)
+static void test_rm_callback(struct kunit *test)
 {
 	struct simple_cb cb = {};
 	struct dma_fence *f;
-	int err = -EINVAL;
 
 	f = mock_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	if (dma_fence_add_callback(f, &cb.cb, simple_callback)) {
-		pr_err("Failed to add callback, fence already signaled!\n");
+		KUNIT_FAIL(test, "Failed to add callback, fence already signaled!");
 		goto err_free;
 	}
 
 	if (!dma_fence_remove_callback(f, &cb.cb)) {
-		pr_err("Failed to remove callback!\n");
+		KUNIT_FAIL(test, "Failed to remove callback!");
 		goto err_free;
 	}
 
 	dma_fence_signal(f);
 	if (cb.seen) {
-		pr_err("Callback still signaled after removal!\n");
+		KUNIT_FAIL(test, "Callback still signaled after removal!");
 		goto err_free;
 	}
 
-	err = 0;
 err_free:
 	dma_fence_put(f);
-	return err;
 }
 
-static int test_late_rm_callback(void *arg)
+static void test_late_rm_callback(struct kunit *test)
 {
 	struct simple_cb cb = {};
 	struct dma_fence *f;
-	int err = -EINVAL;
 
 	f = mock_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	if (dma_fence_add_callback(f, &cb.cb, simple_callback)) {
-		pr_err("Failed to add callback, fence already signaled!\n");
+		KUNIT_FAIL(test, "Failed to add callback, fence already signaled!");
 		goto err_free;
 	}
 
 	dma_fence_signal(f);
 	if (!cb.seen) {
-		pr_err("Callback failed!\n");
+		KUNIT_FAIL(test, "Callback failed!");
 		goto err_free;
 	}
 
 	if (dma_fence_remove_callback(f, &cb.cb)) {
-		pr_err("Callback removal succeed after being executed!\n");
+		KUNIT_FAIL(test, "Callback removal succeeded after being executed!");
 		goto err_free;
 	}
 
-	err = 0;
 err_free:
 	dma_fence_put(f);
-	return err;
 }
 
-static int test_status(void *arg)
+static void test_status(struct kunit *test)
 {
 	struct dma_fence *f;
-	int err = -EINVAL;
 
 	f = mock_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	dma_fence_enable_sw_signaling(f);
 
 	if (dma_fence_get_status(f)) {
-		pr_err("Fence unexpectedly has signaled status on creation\n");
+		KUNIT_FAIL(test, "Fence unexpectedly has signaled status on creation");
 		goto err_free;
 	}
 
 	dma_fence_signal(f);
 	if (!dma_fence_get_status(f)) {
-		pr_err("Fence not reporting signaled status\n");
+		KUNIT_FAIL(test, "Fence not reporting signaled status");
 		goto err_free;
 	}
 
-	err = 0;
 err_free:
 	dma_fence_put(f);
-	return err;
 }
 
-static int test_error(void *arg)
+static void test_error(struct kunit *test)
 {
 	struct dma_fence *f;
-	int err = -EINVAL;
 
 	f = mock_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	dma_fence_enable_sw_signaling(f);
 
 	dma_fence_set_error(f, -EIO);
 
 	if (dma_fence_get_status(f)) {
-		pr_err("Fence unexpectedly has error status before signal\n");
+		KUNIT_FAIL(test, "Fence unexpectedly has error status before signal");
 		goto err_free;
 	}
 
 	dma_fence_signal(f);
 	if (dma_fence_get_status(f) != -EIO) {
-		pr_err("Fence not reporting error status, got %d\n",
-		       dma_fence_get_status(f));
+		KUNIT_FAIL(test, "Fence not reporting error status, got %d",
+			   dma_fence_get_status(f));
 		goto err_free;
 	}
 
-	err = 0;
 err_free:
 	dma_fence_put(f);
-	return err;
 }
 
-static int test_wait(void *arg)
+static void test_wait(struct kunit *test)
 {
 	struct dma_fence *f;
-	int err = -EINVAL;
 
 	f = mock_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	dma_fence_enable_sw_signaling(f);
 
 	if (dma_fence_wait_timeout(f, false, 0) != 0) {
-		pr_err("Wait reported complete before being signaled\n");
+		KUNIT_FAIL(test, "Wait reported complete before being signaled");
 		goto err_free;
 	}
 
 	dma_fence_signal(f);
 
 	if (dma_fence_wait_timeout(f, false, 0) != 1) {
-		pr_err("Wait reported incomplete after being signaled\n");
+		KUNIT_FAIL(test, "Wait reported incomplete after being signaled");
 		goto err_free;
 	}
 
-	err = 0;
 err_free:
 	dma_fence_signal(f);
 	dma_fence_put(f);
-	return err;
 }
 
 struct wait_timer {
@@ -327,21 +291,19 @@ static void wait_timer(struct timer_list *timer)
 	dma_fence_signal(wt->f);
 }
 
-static int test_wait_timeout(void *arg)
+static void test_wait_timeout(struct kunit *test)
 {
 	struct wait_timer wt;
-	int err = -EINVAL;
 
 	timer_setup_on_stack(&wt.timer, wait_timer, 0);
 
 	wt.f = mock_fence();
-	if (!wt.f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, wt.f);
 
 	dma_fence_enable_sw_signaling(wt.f);
 
 	if (dma_fence_wait_timeout(wt.f, false, 1) != 0) {
-		pr_err("Wait reported complete before being signaled\n");
+		KUNIT_FAIL(test, "Wait reported complete before being signaled");
 		goto err_free;
 	}
 
@@ -349,42 +311,38 @@ static int test_wait_timeout(void *arg)
 
 	if (dma_fence_wait_timeout(wt.f, false, HZ) == 0) {
 		if (timer_pending(&wt.timer)) {
-			pr_notice("Timer did not fire within one HZ!\n");
-			err = 0; /* not our fault! */
+			kunit_mark_skipped(
+				test, "Timer did not fire within on HZ!\n");
 		} else {
-			pr_err("Wait reported incomplete after timeout\n");
+			KUNIT_FAIL(test,
+				   "Wait reported incomplete after timeout");
 		}
 		goto err_free;
 	}
 
-	err = 0;
 err_free:
 	timer_delete_sync(&wt.timer);
 	timer_destroy_on_stack(&wt.timer);
 	dma_fence_signal(wt.f);
 	dma_fence_put(wt.f);
-	return err;
 }
 
-static int test_stub(void *arg)
+static void test_stub(struct kunit *test)
 {
 	struct dma_fence *f[64];
-	int err = -EINVAL;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(f); i++) {
 		f[i] = dma_fence_get_stub();
 		if (!dma_fence_is_signaled(f[i])) {
-			pr_err("Obtained unsignaled stub fence!\n");
+			KUNIT_FAIL(test, "Obtained unsignaled stub fence!");
 			goto err;
 		}
 	}
 
-	err = 0;
 err:
 	while (i--)
 		dma_fence_put(f[i]);
-	return err;
 }
 
 /* Now off to the races! */
@@ -473,12 +431,19 @@ static int thread_signal_callback(void *arg)
 	return err;
 }
 
-static int race_signal_callback(void *arg)
+static void test_race_signal_callback(struct kunit *test)
 {
 	struct dma_fence __rcu *f[2] = {};
 	int ret = 0;
 	int pass;
 
+	/*
+	 * thread_signal_callback() spins under RCU and it cannot make forward
+	 * progress unless the threads are truly running concurrently.
+	 */
+	if (num_online_cpus() < 2)
+		kunit_skip(test, "requires at least 2 CPUs");
+
 	for (pass = 0; !ret && pass <= 1; pass++) {
 		struct race_thread t[2];
 		int i;
@@ -490,10 +455,10 @@ static int race_signal_callback(void *arg)
 			t[i].task = kthread_run(thread_signal_callback, &t[i],
 						"dma-fence:%d", i);
 			if (IS_ERR(t[i].task)) {
-				ret = PTR_ERR(t[i].task);
+				KUNIT_FAIL(test, "Failed to create kthread");
 				while (--i >= 0)
 					kthread_stop_put(t[i].task);
-				return ret;
+				return;
 			}
 			get_task_struct(t[i].task);
 		}
@@ -509,26 +474,35 @@ static int race_signal_callback(void *arg)
 		}
 	}
 
-	return ret;
+	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
-int dma_fence(void)
+static int dma_fence_suite_init(struct kunit_suite *suite)
 {
-	static const struct subtest tests[] = {
-		SUBTEST(sanitycheck),
-		SUBTEST(test_signaling),
-		SUBTEST(test_add_callback),
-		SUBTEST(test_late_add_callback),
-		SUBTEST(test_rm_callback),
-		SUBTEST(test_late_rm_callback),
-		SUBTEST(test_status),
-		SUBTEST(test_error),
-		SUBTEST(test_wait),
-		SUBTEST(test_wait_timeout),
-		SUBTEST(test_stub),
-		SUBTEST(race_signal_callback),
-	};
-
 	pr_info("sizeof(dma_fence)=%zu\n", sizeof(struct dma_fence));
-	return subtests(tests, NULL);
+	return 0;
 }
+
+static struct kunit_case dma_fence_cases[] = {
+	KUNIT_CASE(test_sanitycheck),
+	KUNIT_CASE(test_signaling),
+	KUNIT_CASE(test_add_callback),
+	KUNIT_CASE(test_late_add_callback),
+	KUNIT_CASE(test_rm_callback),
+	KUNIT_CASE(test_late_rm_callback),
+	KUNIT_CASE(test_status),
+	KUNIT_CASE(test_error),
+	KUNIT_CASE(test_wait),
+	KUNIT_CASE(test_wait_timeout),
+	KUNIT_CASE(test_stub),
+	KUNIT_CASE(test_race_signal_callback),
+	{}
+};
+
+static struct kunit_suite dma_fence_test_suite = {
+	.name = "dma-buf-fence",
+	.suite_init = dma_fence_suite_init,
+	.test_cases = dma_fence_cases,
+};
+
+kunit_test_suite(dma_fence_test_suite);
-- 
2.43.0

