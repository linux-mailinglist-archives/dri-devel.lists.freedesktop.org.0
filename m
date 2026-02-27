Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOy0DkKPoWkruQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:34:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E051B1B71DC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5E110E5F1;
	Fri, 27 Feb 2026 12:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ej7FoZ6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010033.outbound.protection.outlook.com
 [52.101.193.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E583C10EB2C;
 Fri, 27 Feb 2026 12:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J62zsUUGiTWcAnIM6ZMpQwfNF6zL/fqSf4W65LY4FwIFbyqHTPNTEXi3w6qsfCT9kLaTUT7uJdFijRm6FUtE96ftr0AcEq+Wl8g1spENBXgrf1E6kIZCdffplnMU99NUY0MrtUScTyufvugG9IDI2g/58VC/N0PRlei4dSYVgNKUXB0PlONopE3rS5qZVtXCtm9cJ2CbG2ghtssLNAnaKmUKhqLeDTQmWLKjVuBt4GAXAOLTFsqw1twSdjiZryOQus4/XhffwCdOQ9i7cMHeMWlE+8elML+PgqwxuJ5EZeKhQUDttlbHt7Gf/EBntTerrSOOulWaugHY5PocA1Golg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwS7GEVEGDH/gsnjPS8r22Ta2ROIR8YDVVe5yXYrYcE=;
 b=TfJVwutyxO5sL84fuhPneilMp6FYvZMuifgFMkLGRVUsT74fzksnc/U3ytPfP4xx1FeTEwLGwvQdm4p/DcTFHHAAC+N1GAOFLPsgJS1u+eG2vUVWX1LzDCBJ6Zf+lFqakXYK42sPxoXKiuNb3RLJmJvnyhuFvxTLdS0YJryi4SU3BAF4+vzjm3VlGT9DJugwJicHcI7Klwyqv6VLrOb/wMQa/oiVkaq7v/gfe64vBkON55drbeaY51GYo8ab9FcRATS5LzpOsgZJYgJh5pJKcUiGmh3wrJOy3VeyXHAN+YzkkxGX2mLlU0WuNZiBXGc71uc3fGK/8kT2qzVbFAddYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwS7GEVEGDH/gsnjPS8r22Ta2ROIR8YDVVe5yXYrYcE=;
 b=ej7FoZ6p3zyYRpj04RskQaNKT16HHOUg/a/W/l5K+L9AAuSi6mEA9zrw+umy5G6GPd9cSXj/ytjeWawmfcdlR6oIcJGz5j3bV7vdCeKjWjgORTtEqHLAgbq+Cj5dYNeNa6Mrq6JXbv8hgjycwuEvIw8R72OPOMURRkBciVL+GtEJGSW9WIMV/h6pCQHT53OBQxfPhBmqRIH9KoUKyEgna1qvuApWtHqDbj1Hvf6Fo0LbaCCLPZdEbX1z48njgL4zzYplGfLxyHvnTS+59T0hpRm96s8mcAlSBwHZulo/CCRyj0kj3CXjQhPFzSR7HcaUAHi/a2YxcgiS1kwk+2AAfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:32:55 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 12:32:55 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 27 Feb 2026 21:32:08 +0900
Subject: [PATCH 3/9] gpu: nova-core: gsp: expose GSP-RM internal client and
 subdevice handles
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-rmcontrol-v1-3-86648e4869f9@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
In-Reply-To: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: a3df107d-8ba6-4c86-d28f-08de75fc5521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: ne80Lp+/1ODiz9/xzQFpW+2DdDM54Yh/nYHfUHcPeRdPV9AChOem6yPu9mCgNcH8TRLo1khd/N9WHggEmvBCVLOp/yIhLfq7wvH1DRnVALTPbmWk0k3K33KfQzGoVJMpal1IxsZHycAyiS6CoOkhnVgTQ1+XDdE62nX051CTshN4TBXBeQQCpTxra99gNjbFUI5AAOQ7Nam/SgiNVq7N47+iUkrvznpspXEYBR/4ea5ID2VT3Qxfq96GUhVkrLl6sqgRw/cFwlUNtpfUpapu4V1BVEoWk+w3xWZD72jncDJ4WjJM5MZHRY73GvNn8+Whx3AEahfSDzvQRsplAkcEcxza7Fx9zIO4oxicWXVQPdc3l3rq4jWyLu1XIuhmNqaLmQPjfMSJtBIRqh2j4VkjJ62nfj8Kjjudz8TZUlN3scxXH3AT2FOVK+92uZ2nFvh0mvmg2qad512bmudl9mR26Bz4IWzQOX2BOduIDgpWe+LAt03CzfWnVMamB+M34kkUA+rs5MiWV8EnMz3xQZlyU88HlnPmnEzbSJ0tJQgiVSw4XW489su8ssW9Oafo35GoXP9pEBj2p2uWEhl0htcI24Z9SOrLFQssdXgtX8SK6oRerNZiv9fEqQRaaUcRjvztFO2MBL/IjB5bqHIXK6SJ+TGZhji7YllVafnHhZJCOaWP57Hvp29iJJ6VMLyvlIf+H6MHPhebRNdQLGN4nUOE8jDFo0jKOH8LeaWeiwnkkho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek9TbnRTN0V5SzZudUhNeTR1bnZDejRUcGpxSVoyRExsbDVsT28xU1NyUFgr?=
 =?utf-8?B?dWxlTTMrNTJKU2xvRjZ6TEZlY0ZsQVYycmpNcTJwK0x0b1NoMVpIeFJPd0FV?=
 =?utf-8?B?bTJlN0t0L0xNRUkrdUdGN2U0d2dwRnhHcUVXTVV2djAzWkg0SHFGb0ZnY09K?=
 =?utf-8?B?cVlRZEN6dkh4Znh4TUJBNjNNOFRaZmt6Wk5yVytEa1NYa3dDQ1J6eTJaVTRw?=
 =?utf-8?B?YmhPYnNpQ2FSRGZFdDFzR0M2NnlaVkU1bndHeCtCSTYyenpTRGJXNTlNU25R?=
 =?utf-8?B?c05zeGdwcWpJc2U5Q3RjRUxWc2FVUkdJRU5vYnluS3lRRFZYVGVVTXpub0ls?=
 =?utf-8?B?alVnNjhQQlNQSVJoelVuanFFZXhnL1QwemlKbEM2Vksvc3FSclUrN2t1dzNS?=
 =?utf-8?B?bHFoSSthZmtWUS9FK3RCM3pwekdCZFVZTEV5U1BFRDBVczZxT0VpUmNPbWF2?=
 =?utf-8?B?cnE3ampwYlc3U1M2OUl6OUpBRTNEV3g1MzdKUmI2aXJENkdYelRrVGRkd3ZR?=
 =?utf-8?B?eDJqNm5Qck5IeVFYc045eXkzRDAwNXZ3TnZJYks3YzRGM3hWOHZFR3pzYURZ?=
 =?utf-8?B?KzRrSU5ucjc5UHlVdnRHU0FiMnJJemM2ZXIwdTFrc0lhZkxCUzdHcEVXbHpp?=
 =?utf-8?B?Zm90cHhtbWdOVHZmTkUxWDE0S1A1dHo1Wmx1RHAzWXJENnhuKzF6OGtodWZ6?=
 =?utf-8?B?MVhkWTZlTXRuOUtGMmlVTnRLdEExRmRvUHJBaXZNSTdQbUdkbEt6Ulc0OW9I?=
 =?utf-8?B?b3laZXFic2VaS0ZkMGN0QmRpUjU3NVR0ZmdrVjN4TENkbTB0M1FGaDk4c2Ju?=
 =?utf-8?B?eHZRNERWdkJ4OEZJU2dnaWZLQ3pyOGFLSGZ6ZEJnSUhlLzk4dDFJTmhXZGx5?=
 =?utf-8?B?TFdHN3hWMDBRTnF3UUJIcjVWcGJneWxKQXgvV2RtUGtBM2pxSjlKSmxRM1hE?=
 =?utf-8?B?SWZhYWl5cVF2L0EvRGh6SVN0dFNxNjNKWkNVUHE1OVZoREJqYUFMZTB4TUU4?=
 =?utf-8?B?MTI0MlIySFNLWUkyZlN0U0dRQjEvR2hVN2QwY2RvajhHL3AxR29seFk0NGov?=
 =?utf-8?B?SEdhbk8xZHBPODV0Vmx2SDZ5OTdvKzVxU1R0YzVjTUw1YUlXdktQV3g4SnR1?=
 =?utf-8?B?OGMzNUJDaUYzUGRZUlVNWWY0dVkzQTFxSUZPbnpIamhRTXlIWG9yREVGczdL?=
 =?utf-8?B?c1JPd0s3SzUvb3NlampaVjNRYUU3Y01oVjRyMkRsQVA5bkUrZ2xmc0hWd3Y1?=
 =?utf-8?B?LzNGOVhXZ0F3cmp1MHhCN3lkd29LekF2QjlNOGVlQk5uMUpwQ3FGWEQ2NURn?=
 =?utf-8?B?WDNMeUttUW5pME1KRlUrM3NoVlBab1VxOWZ1QjNLVzB3VFVUbkxSdTdhR2pW?=
 =?utf-8?B?R25rc3p6bmJoTnV2ekFUV0kwSkZ6VXhxMENBVk9RSm1BQ3ovNFRYY0FPY3ZD?=
 =?utf-8?B?M0J6WkV1aXVXWDJDWVlXVnh3a1gyRkxRKzBzV25Qc3pwdXpsZnI1eFNIcnV0?=
 =?utf-8?B?Vk9YUWdCZEl3U29hdGE5bE4zcWd5U1pOZ1NnKzZPWm1LTmxKLzlDd1JQWmpT?=
 =?utf-8?B?ZXVkK1B5bnBpMVhRSllpV1ZXRC9UaFdvN2Q1MkZ1UmFIckRWamJXR292blVD?=
 =?utf-8?B?VjFMZjlwZnUyVDR5amZnaHVrOTBnck0xeWdod3B3cDFWOUJPZmZrWXZHOWV6?=
 =?utf-8?B?TlNxTS8zRW5kRXJoa2QxSVFYUlVrWk5UUm8wVGZwa3MyYU9FZkI2K1Fmdm1P?=
 =?utf-8?B?SGFNdEhUb291SE5HRGozOGZ0UWxUenpTcVZ1Zlp4cUhVQnFESnFGWE5PTnF5?=
 =?utf-8?B?RDAvd3J5a01uM1J1blZZZU9xS2FENlZiaFl0ZFFsSzZTSnk5YS9ETTdFTi9O?=
 =?utf-8?B?WG9NUUNpUEx5bW15a0xFKzhSU2Mwa0o0NEl5RGkyTUZPUEV4RUNhNFN1ZDJ2?=
 =?utf-8?B?NzJSYTN5ZDk2em5oSWt2VE9XcE5ldG85MWpibzhLdFB3Znc5SUtFSGxLYWpK?=
 =?utf-8?B?K2VLNm1vSDdMUCtIaE5LM3ZrbzJmaGZncHhpR2RDaTJ0bS9uSWM3MllDbndJ?=
 =?utf-8?B?NEZNZUYwR1paem1xUUdneWxPL2xJZ25sMzlpU2owTFhxdlVMYjQ5R2hxQzhj?=
 =?utf-8?B?RmNwSjlUaTBsaFBZVW5jVUlZclBvRU1sMlpocXRFdkRjNjNDOFE5TXN4azJG?=
 =?utf-8?B?ODVaV0ZQcTRobmZFb08zSnRuTjIrSjdXMFh5OTRSeEgzS3VqMXZiTlFTT3lB?=
 =?utf-8?B?SjYzUC95OGgvWHVrNDFzZTJ5K2FNcTAxTUtkS3EvQ21BNmZnNXR5UGhvb2Zk?=
 =?utf-8?B?VHMwRE9tVWRwV0N0ZmtJSktBRlRobXJMbmxrZWN0M010RlhxQkhGc1h2R0dD?=
 =?utf-8?Q?X6ffqCdGsGi5a3JyAelbSVEbyj9MzXvtoy3T9pLBsjzpM?=
X-MS-Exchange-AntiSpam-MessageData-1: EAkeIGifkwYsUg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3df107d-8ba6-4c86-d28f-08de75fc5521
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:32:55.4543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuaGY9kc/3P6R58ZKfw8AboG3Ka84kvw11Hq6MhhbJ9pWTZf/ypy+gxPVPCPl/GePCEXNzLEForv2R27eBz4SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: E051B1B71DC
X-Rspamd-Action: no action

Expose the `hInternalClient` and `hInternalSubdevice` handles. These are
needed for RM control calls.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    | 16 ++++++++++++++++
 drivers/gpu/nova-core/gsp/fw/commands.rs | 10 ++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 4740cda0b51c..2cadfcaf9a8a 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -197,6 +197,8 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
 /// The reply from the GSP to the [`GetGspInfo`] command.
 pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
+    h_client: u32,
+    h_subdevice: u32,
 }
 
 impl MessageFromGsp for GetGspStaticInfoReply {
@@ -210,6 +212,8 @@ fn read(
     ) -> Result<Self, Self::InitError> {
         Ok(GetGspStaticInfoReply {
             gpu_name: msg.gpu_name_str(),
+            h_client: msg.h_internal_client(),
+            h_subdevice: msg.h_internal_subdevice(),
         })
     }
 }
@@ -236,6 +240,18 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
             .to_str()
             .map_err(GpuNameError::InvalidUtf8)
     }
+
+    /// Returns the internal client handle allocated by GSP-RM.
+    #[expect(dead_code)]
+    pub(crate) fn h_client(&self) -> u32 {
+        self.h_client
+    }
+
+    /// Returns the internal subdevice handle allocated by GSP-RM.
+    #[expect(dead_code)]
+    pub(crate) fn h_subdevice(&self) -> u32 {
+        self.h_subdevice
+    }
 }
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 67f44421fcc3..aaf3509a0207 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -115,6 +115,16 @@ impl GspStaticConfigInfo {
     pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
         self.0.gpuNameString
     }
+
+    /// Returns the internal client handle allocated by GSP-RM.
+    pub(crate) fn h_internal_client(&self) -> u32 {
+        self.0.hInternalClient
+    }
+
+    /// Returns the internal subdevice handle allocated by GSP-RM.
+    pub(crate) fn h_internal_subdevice(&self) -> u32 {
+        self.0.hInternalSubdevice
+    }
 }
 
 // SAFETY: Padding is explicit and will not contain uninitialized data.

-- 
2.53.0

