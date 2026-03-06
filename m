Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOstGuMIq2k/ZgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:03:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98512259DD
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFA010E328;
	Fri,  6 Mar 2026 17:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KmHgLAA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013064.outbound.protection.outlook.com
 [40.107.162.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C004F10E328
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 17:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6K+Mq+QBE0a18Em4g3eBKlG8T1G3mdqnv24ir+Z8bzhgiTSN6j854I7bcmEKP0apTT/G/fLbty1/+zsqPm883rg2O5s4hOC+5YL3Ao0iyD4/jZ/B991lYgzXbVgczipknFvFxqcw1qlMkv+gSrzZ/xv6vYeH4pXN7S1+/zMfaH5DXfiAa8X/QKSFvZICNqDgX6xxUTZCgNGIqGmAdE3VDhB82/XGu22IlupWOuNRmDkqiHx5wlYSgkO40Es+ETmKtw9mJ2BJHUT71MH26yIxCC/EGBKMNPXxN7k6EwRZBUaJgnpn13C6btyiyyD8n5DYt8LLbKmJzfyudEZ6SVxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQ7Meh4XCw9G2JqvaPFlr07/wOblFIzLeOTAGSaJ6Zc=;
 b=bU4BrmmsZTnj3WJGl6N1SzjwbuvqT+OzQdW9J7Sl5ULHa+qlNnr4cwheeRhz+LDtm884t6MpRYu4BF7W7mnI+XVkHmAFJNHYS13XCiyf4gJBqqKHiCmmHd9oOBbB4Y3JBruz1qWKsLSXlaUcv799JO3iSOpclShpOLlrGGi9UIPDyZ2b8FV4mfkgz68kUeA/Drm883h/aqtLjkG94+mkrqSHJLBHf/FVLRdBUhBpo4z4kbu2RqJbfeyD/fjkW5C65git/+svst3v0Lmiwqo7JjwpPNj18EoCOxLYxRrkzmjS+MLVwpUIkFpnxHszZ6vLjKGuKfEEqZDJETkIk5jvBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQ7Meh4XCw9G2JqvaPFlr07/wOblFIzLeOTAGSaJ6Zc=;
 b=KmHgLAA8J3s3Ycq9TNWsWP4u6/ZV4hg9OCJzusRHXvk4aJrz4IYP4OAP/RPeqcJkWbIA5/8b+k3VxeHYGPdud7Ss2+wWMbW9fad4MkX9LQ1cOS0nMaIh4lfNvzHC4XePZR75nAkToNx03JrNNR6TcxE6EFlyqL8L5Nvyb1dr5sdRILCf71D18mBKtTkmCV40IWPDJlAhd7xtppGSIa116gOie3XzJiZ5UtPVechRYO/cx1qCY2KZMccjVj11DeBNkiWeTB8SgTrKK6nVUSVKuszgo/b3qDFth1+Q2vQ42BAPIygM4sljr8Bq2mYkkjddJZBKl5+Zf7FzwFLcCMxy0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB11626.eurprd04.prod.outlook.com (2603:10a6:10:605::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 17:03:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 17:03:23 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Frank Li <frank.li@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>,
 Forrest Shi <xuelin.shi@nxp.com>,
 Alexandru Taran <alexandru.taran@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Subject: Re: [PATCH v2 7/9] accel/neutron: Add job submission IOCTL
Date: Fri,  6 Mar 2026 12:02:58 -0500
Message-ID: <20260306170259.296712-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306-neutron-v2-7-3019bd8c91ef@nxp.com>
References: <20260306-neutron-v2-7-3019bd8c91ef@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0382.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB11626:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9e78f4-3493-4754-1ded-08de7ba2464a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: HtoNGXhwcm2L6n4+1EDtAJAk41zHc+KK8e9wpVWSNeuEUUOiXKI20P1RBaFBmccjXMGYKf5Iwtc0PoZSbmyE6e79PTMWk4bxCaONca+Jn1boW7PT1uGeLVV9RITMHd6yOQftARKOX7SSnx9kQglW/xCcL8LqPIxUlkl1HEmEdr2HriyQHwcol5H2MuKwFAs5eSfBTaXNFga3VbiW68uAZurdmHs+C0qqi9rsPZMZzBRkpivx55o2BrXprVCvA280VtHB/OM225DKZevabVmHGC/c4Q+oIMTmEx3le+e71cpxN1uDQrYvNsed197rSibXin+h9RJseg8HOCpcxmTwCdQa/6IMaBv3vmKrTtdoVoPRXz2e7JtacQsGh4Qo0aCuDlNH3C4PJyQg7py+Ii8lN/R7AzFdmSQel9MNoentfxBpPG+Z3f4GzUgGsMbh8lfDsxAVAsXwp4jw/AmNBbiy+uABMQ4Av4Vm1Q8EmPau9W8dKl38xTpoZhKe3xgIgq8w6v3Wbocwd7yqGCQeD6AORr+a6KVS1PtJi5+I3RGkoNqCP+H7AlhgImO9qDLnfsNJ0MKRN+KGW+bwggEbDXq2N4GKo1ANra0ge+Xwu9AY79gflMT897/gXyhz8i7uO5cSEoFBaCLvWuivKsQT1KzC9AwcMM+Q0VmjYtSVVS7wyTx8Mes7f+bbdLkx35Bzg/0FXeHcA+VUQZVH16qYXidKgHeWxFdVaGQ8VdImzAMV78478yzERvE9/sAaxJuuaqi+lcXweG2b4vqnPUVt4oOqBnOL4NkTF7AXUjxfHmzYizu5nqApOgUcj1T2GB3E9dXh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ticBti0hk91wQ64a+WVU1BDuWHwJIqrIA/KrFi+BgVg5ZXI+ChZAg3VJaphC?=
 =?us-ascii?Q?YiQP9kipf2DbeMwnlhvtkcnz+DYuIz0nzASqZmJN1fZ6tjwGR8cpAEm3Rh/S?=
 =?us-ascii?Q?drNcnTyheITmSogCsWcex2jNEnYPLVqNnVKep3ku10620YZaj3AxLPm0mVqm?=
 =?us-ascii?Q?d31raza6duaM7eTLXfhUCceHp44hC2bY2KalJiwRhx9zP6Qa3TTOmDtJmTIw?=
 =?us-ascii?Q?iIx/23WYlS2RUksc/26ocx3D18MEHNRLypaYp31tqcZ67s5shMxJdaUodAl7?=
 =?us-ascii?Q?C5oQ12zHppXIrMHbD70UgQ2FhcLQctNrcPyl9oBHV6HpZCHZPtT+ty+/Kz2R?=
 =?us-ascii?Q?XW7VBRV66WC7VmV7WfBj50gnMr0HyCB+2ZICOQl/v2L2s6xJlba3RDUlh3ri?=
 =?us-ascii?Q?1VQtu+7OlKTc//VsRqa59Al/i/s/qANFPVB6ovnl+h8j/pZp/C2PohsoP9fW?=
 =?us-ascii?Q?yb9GhjRfBNn6jQUzRaN530AOj5NiKJnUnxAC2zy2F8CAgXKfQfE7fdBmId50?=
 =?us-ascii?Q?AYllL4ZRiEL9HYCdwCppgd1/Yti1fOHQAcROXAEXY8XJimEnha2FPRLeaR4Q?=
 =?us-ascii?Q?9dLF/5Id0VLruDmRsWS79SlVCOo1TX7/5w6SOvut4/ldlhSf913n4ySTdYqt?=
 =?us-ascii?Q?t3Cd6bIsAnpQ4UQfcOyN5sy0C/7GnhCndCAIU4abYpsjPH7shXDVECBy2fA8?=
 =?us-ascii?Q?h7/QHSIMvHW/UPSel5D/J976sD3NtOMDCCztXoN/PGmcAumixfBUROA1ErwW?=
 =?us-ascii?Q?XSLSBAGYpCG5L46KK+6hyx0zWG93VD+S3irfhNMP8tpl+7C9r9IK8+52LS1p?=
 =?us-ascii?Q?z7puHB6eNpAn41GVsAJYAbOtlwpkDAsYE9rWy93ph9VfQ+bK+V/uUWXPNFkw?=
 =?us-ascii?Q?NTH/CQMv51bVfEFC+NZrX8j547KiGWVtM3xdb0J3w0q3AaTOBKvabGbKKw71?=
 =?us-ascii?Q?YB/B3s7hi97zJeEK0L11YdDow0UQ/Qj+iOWvJ3PKi0iY4mnCQUMmYGXwJO5Y?=
 =?us-ascii?Q?4GeCpnSAl1uIkfOJNJId7CSGw+Gh+WtPnxlhs8VIqFvEAichmNC5JvzqDI1q?=
 =?us-ascii?Q?5DurYdKEb/VoFcxkrYVy3qoO876Bt0ERn1rwgpkkMHOA19UFuyQbkvKp2ROW?=
 =?us-ascii?Q?xXHGrylf0a2Kpm4NdiF4eRCV8lOrXVTRgH/bwkxVsNEi7ELKdmOyzGpFrj5w?=
 =?us-ascii?Q?2XC60/MfKoU17qio/Y1hIPOCqxQGFnEjmbFyBEugFIcRVZgQ548RszPUPLUg?=
 =?us-ascii?Q?WKk7Vbo1ayynHsWl5IIyjzmEmISU127i8B/MRBSE606qXN4tMcwfnMxryCIJ?=
 =?us-ascii?Q?II1CpT6SAC39KysrikG/jqWORkOcTlxGhezlmd9T7frIbHzGmaG0Lyb6DluU?=
 =?us-ascii?Q?pSQRR7iImsNzCtbkSvlbycny8sdvQy8TWNxshryzJ3So2GAK845ZLSWIDe3K?=
 =?us-ascii?Q?RWbVDzP6TdQbkSPXanu/hf7Q3zULZpx/wdqLFiIWT7IGEqrMUeGdNyCiczgX?=
 =?us-ascii?Q?dsuJPXXOPiKbLEw5Xn9Y6oHPJL/ZnccdG8WWSetS9W7ko3X/U0fJg3py6yQv?=
 =?us-ascii?Q?2lfNYqvgVz9df8t2Z7EPNfxs3snLG8ONL8ZppSZMh0N3Uzarw/QM+wVQ99ce?=
 =?us-ascii?Q?aVK9W9qHCNpZ41awj+zYTJqc1jFnoH819aqlR/+pOvgZr5oQljdVRMrUuYjI?=
 =?us-ascii?Q?EVlKNshrFXoSmSgpAyc4sXH04u+AseRU0PvC+tw5jn+B9iiq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9e78f4-3493-4754-1ded-08de7ba2464a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:03:23.0379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4imHobV6+15tabYctUXaVdoN/0Qp/Tt+w6YSWPXZzytip9kSweNhA+Vl2au+cT5SK6KieJK4w5h/e/vVkZLHuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11626
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
X-Rspamd-Queue-Id: A98512259DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:Frank.Li@nxp.com,m:christian.koenig@amd.com,m:frank.li@nxp.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jiwei.fu@nxp.com,m:xuelin.shi@nxp.com,m:alexandru.taran@nxp.com,m:daniel.baluta@nxp.com,m:ruxandra.radulescu@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[Frank.Li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

From: Frank Li (AI-BOT) <frank.li@nxp.com>

> +	if (appstatus & APPSTATUS_FAULTCAUSE_MASK) {
> +		dev_err(ndev->dev, "Neutron halted due to fault: 0x%lx\n",
> +			FIELD_GET(APPSTATUS_FAULTCAUSE_MASK, appstatus));
> +		return neutron_job_err_handler(ndev);

AI: neutron_job_err_handler() returns void, not int. Remove 'return'.

> +	ret = drm_sched_job_init(&job->base, &npriv->sched_entity, 1, NULL,
> +				 filp->client_id);
> +	if (ret)
> +		goto out_put_syncobj;
> +
> +	ret = neutron_push_job(job, syncobj);
> +	if (ret)
> +		goto out_sched_cleanup;
> +
> +	neutron_put_job(job);
> +	drm_syncobj_put(syncobj);
> +
> +	return 0;
> +
> +out_sched_cleanup:
> +	drm_sched_job_cleanup(&job->base);
> +out_put_syncobj:
> +	drm_syncobj_put(syncobj);
> +out_put_gem:
> +	drm_gem_object_put(job->bo);

AI: In the success path, neutron_put_job(job) is called which decrements
refcnt. But if neutron_push_job() fails and we hit out_sched_cleanup,
the job refcnt is never decremented. This leaks the job structure.
Consider: if neutron_push_job() succeeds, it calls kref_get() inside
sched_lock. If it fails, no kref_get() happens, so don't call

(Need owner do judgment. Not sure if AI said correctly.)

Frank
