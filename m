Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19E89B11E1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 23:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7246D10E121;
	Fri, 25 Oct 2024 21:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFs4lS4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838B410EB8E;
 Fri, 25 Oct 2024 21:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729893077; x=1761429077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qJltdOa9zzHaE43rZDoTUvvQPNmAf3k66aRnLSDP5W8=;
 b=AFs4lS4tLl6VpuQwFI+cFbDLNt6snfaRtaGUVFQ3dLqJ4SeAf29v4mV2
 NyzLBtGsoRJSuQUpgAKvtXiTLI1Ie+5DXg++iqDw/uX/VmTf/tzU9r50o
 b1n0mDH/he/PzjSyMM4n0ueEY6K4/ENy1FCXFuohCl+UIrOGEwEjhJxXa
 O29c51i4akni1ZVlBD6sbVq+s9vK/ckU8FbFv8GmrdiuacQLX5+uZ0jZP
 JZi85YbcpzLT53qHi2gdqLpa6KfBK6FYy/55evpRAHu3FVouL6+Yocalb
 UCYAt6K/sIz9JQ6Gf18DHozfq/knWPAqeEQVJLHDsi1u2aUN5gbqXIgcv g==;
X-CSE-ConnectionGUID: UtVfjJd6TLm5Joy0pmXy0w==
X-CSE-MsgGUID: /LKRNZEbRTunsc5t15TioQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29683426"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="29683426"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:51:17 -0700
X-CSE-ConnectionGUID: oDl29PNyT9SimuKdfx/5Yg==
X-CSE-MsgGUID: XY2ml2VoTZySHarOGi7chg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="81492900"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 14:51:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 14:51:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXa+T0crMxRVfD+POB1wX1tzkQVUFVzJoXQw/mrbwMSeIpIkXf2eNr2tumtqAYenTglHXtn/r2zuA2IH72XkFVCzOPEMV0OeQbHsU2piyl8Y92hWHWpuB/wDYb22xQHXXZpd1Z3XbAappPSSlrFTbOjjJNIWsztQRhOLQ/DrqCxtxgsYXI9XWb28HCHR64jzOgP6UmPJTWll1pYsV/zwAXkhNH52kmfsDBDu76z+XMz9qhIiJw3cXJEnsdAhQCNsMaWkbVRNQaSq9ehqXGfQAFYkxdRWsxmpFPbnrKpYsd2iYyGMg1hThXJ/kw+LivLS7B80k/ghzZnNwEQU4SDRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROterculxntEPzXGkt8YiHRCMcU9C2S0nxZB0C13n5I=;
 b=lDLPKTqIaVtmFV0E8YaN6mw0ibn6OJWSwz//DvnmZ8u8SlKbF887Qx6YGey24QdHpmxRnQaRogV9pK2CBUS1+UDsszYPbZs0nky9T2R2tphJMYst+hxSTuh3Ds0GkT5FZaNCbkijQGh46byVx8+txBRI5fxxGtuMnKNbg5qcIcfBqKrS6OYj+heYIc7OX4Idpy0AywdkWTVxO0MUP4G5ZKwIIwWiKF/h8BG+QPDU8UoYBJwx5aUk0wlAjgfz6N624Ns9dNwl3b/Z8uFBLuCsfITWkbgCarRTWnRZc+YA2F4/JYplCVeuZwTfZC+Ekcnrr34nXukcY6lVTjnIcleBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.16; Fri, 25 Oct 2024 21:51:13 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 21:51:13 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v4 3/7] PCI: Add a helper to convert between standard and IOV
 resources
Date: Fri, 25 Oct 2024 23:50:34 +0200
Message-ID: <20241025215038.3125626-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025215038.3125626-1-michal.winiarski@intel.com>
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0035.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f4a631-28cf-4329-26c2-08dcf53f2538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0hWSGxBVHdJb2ZmamtOc3licFI4OEMyU0RmNkFLYlBGSzl0VUdTU1VtVDlH?=
 =?utf-8?B?WDFHMHFlVjY1dDlLUVNITjhCYSthTzY5ekxZRlZINFhUUmpTWHpqK21Lbldx?=
 =?utf-8?B?Vmd1b0NsMjZBU3k5ZXlHWjhyM0F1S3BkK3ZKMWpleDdqUjh5OEJwdTlRTjlR?=
 =?utf-8?B?VFJQb1FQNlVBWXRneEpJNUJZZHNPQ3A5MWY5L0Z4MC93bFlKOVd2d2loS1Yv?=
 =?utf-8?B?U0VMR0U2UEtSYW5BTDJUZzZLdmdPRkxmMGxrdStDN0k5YzUrVlpicnRDTGFI?=
 =?utf-8?B?cnk2VXBTT2RLeC9CZWY0cWloa3Z3ZDQ1RkJud3p2TE5DcFBmLzNUVGZzRk13?=
 =?utf-8?B?QTNjS2NyRFFwOUh0NkQ4cHU5VW9UVTZPbllrWWxvSWdPdHZTdjVsZERjV2FH?=
 =?utf-8?B?Kzk3UXpTTHFLY0pTZm5FZURVdUZvOGRtczhEYTdySmQ5TVdod1NKaFVRRUVC?=
 =?utf-8?B?T1VseFgxc1pxY3ZLbWU2eE9sYmlheDlTdWtKVFF0SFJZQzZ2ZkZ2K2JXT2pX?=
 =?utf-8?B?RlFzdWt5TytRekV2bEcrZlVBdmE1aG9Lb21OQ1hQRGZ3a0NqZzIvWmJMYVhS?=
 =?utf-8?B?WDdXTWcvOUpLclJPNFRZVk43N1hHTmJqL3dXazE5cUc3ZGc3SjllMVcwRm0z?=
 =?utf-8?B?ak15ZkVCcXFFTDcxNXZZUk1NcmlrMHFKUHYrSnVHSTI2YzhYQ3VaTUhtSG1w?=
 =?utf-8?B?Q1FWcHhzQ3gyK3hNTkloYnVuM1dTYUxDaUlEUlZyd3FTdjRHYlBXT2FFVCta?=
 =?utf-8?B?amszVW9vT1crSDFSQWk2ZmxTWnNvWFhnUmJiVTFVUHM4THRYeWpTQVFWL3BW?=
 =?utf-8?B?R1VRK1ZUcDlUdjVDVGNqaXNWRmFQYXdvRVYzUEJ6MW91dlFLaTRuMlFZUFRp?=
 =?utf-8?B?cXAvVEdrVTdCa0JSdkt5azdUNWc5REFqKzZydE1nYkNza0RGWUtRYnp0eUtU?=
 =?utf-8?B?cmFsdC94QVlEZWVheXVmOHQzSHV5ZTVzRWNDTWhwZXcyN21PaG9scm9ZclJy?=
 =?utf-8?B?cStBbzF3eGMvTEwrVzFGOU9NREViVTc1NytMSnQzSDlOd3ZSVkhKcjdURWJO?=
 =?utf-8?B?RHdFWGtLZmNJQ0YvQVQ5aGpTRitRMnptUnlOcmZVMWw2d253bVVlclUwdDRO?=
 =?utf-8?B?QWlYMFgvVGNvVzJJenlxdTVCWEU1UXErWFVxS2dpWUZSSGJielJVUmFvcGdK?=
 =?utf-8?B?SkpYczBCbG51eXg4dWhFbE1HemNCVmpIUGZWN2xnSUZvcVBER3lGVTBPVkYw?=
 =?utf-8?B?Q0NiOGUvTy9mMUtCUk55emJTQlJvWHBwUTJDWmhMamVUQkUwRmE4ZTJaOHFC?=
 =?utf-8?B?TWo5U3haY2VGWGZCVmF6a2MxZ3pmUXNsaXFoUGdMRWVLNHVERGJ6cDR6SFlR?=
 =?utf-8?B?L0NBcG5DMmxVcExqRkhXR0RWSHpLTmg0ZzR2VmkrREhpMERrV2pGVDhQTUd4?=
 =?utf-8?B?VTNSd2pVWVBCTkZqSjdXQnQrMTFVMUZQL0lhYmVsQ1dCMndxWlRHQ2dXaVZn?=
 =?utf-8?B?ZE9tZld6cTJsVzdhdGI3REIzV2tDUGpOMDR6RUJHeFRiRHoyb3cwUUYxNlhO?=
 =?utf-8?B?Nkd0MHpiWWNIeFV4N3JBV0NvNzhWRTlkOEJkNVFmd3c1SUQ2ako2NXJlVzF0?=
 =?utf-8?B?S1dFY09YRjVjSCtreHNMTk1JYnFxcXBlQ2p5UXZWVTFQZnJnbHVYSFdvRkVF?=
 =?utf-8?B?cStETHBhWWpEYVo5TExGTVVzeUhUeVhyRXZSZktCZDVQSVFaTmJ6WVFNVWxs?=
 =?utf-8?Q?K42aBJIZKSmB1OM6H49CiHg0BGzjf8QSB67Wm1F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtlSmZjUkU0dGZlMnplOXBFM01sK0JBYUp1TTlZUFdvUnR6NUora2RUTi9r?=
 =?utf-8?B?RHZHcS9aaElCT3c2eHlvYmVicXRhYWFRNFZBaTJvSGExVURuK09mZVhrM1Rm?=
 =?utf-8?B?aEVPdkZqMlozYmFrUFNySEdoUk1XTW1WV2xFOHk2ZHJhK0Y4eHVIeE1SRGg0?=
 =?utf-8?B?d1ZuUElPRUl1dWhzZFBIclZFeHhkYUJQYy90K1lLNjhYVU5jK1pXcTJ4RFFk?=
 =?utf-8?B?SFowN0ZzN0xHTEswazU1WXdnSlVocVVZQVFtUzNZSHAwZmE3bU9EVEF1RGtL?=
 =?utf-8?B?ejROOExkcmNwSXdteGhGLzIvU09uOER2SWh1bmRlQTJiTEVOM3dONTZVOTcr?=
 =?utf-8?B?aUhRMXFuTnFadVdUQlJqSmFRZVdrZVNzY2R3c3FuZHQrT3Y3bjlVU1ZPRyt5?=
 =?utf-8?B?VzJjRXZ2UE1lblNFN3ZNdlhlN1lVbzNFU2tTclZoM2RJYm9sYllkWEo5SW9D?=
 =?utf-8?B?cFFIOHRaT1pqZ3R3K2RFY1R5WHhqYmhvbGtlVGF6RTVVY1oxWGtFYzVoM2x6?=
 =?utf-8?B?ZlZKWW9aUEtxaW92MTd1MitNVWY2ejFweEo5cGx6YUJhbzhoMUI5WlJ4dTRD?=
 =?utf-8?B?YnFOYUpucVd3NmJUYnZMYzBOTW5UWjkrWmtmM0J6T1BHRnRxNWQzYjI0a2FZ?=
 =?utf-8?B?OUs2RnpvU3dpQ2Q1aTgvYnZCS096V0orTlNFVXZqenRCa3hEak1OYkdsakM4?=
 =?utf-8?B?NVo4MkdsTThNMGJ3RFY2bVAxaWozSzYvUFIrcTFwMTYxOGtrZUZWNlUwdjBP?=
 =?utf-8?B?ajdhZWF1bHdpMnZzOS9NK1lQSkc0MDNYYkFhVEJLOEJKQTc1TjZvbmpCQktq?=
 =?utf-8?B?dEVKclJuTDVnK0xPRHR0VlhzTkVoYjEzak9TZGJlcTdXQnlRakVsYnM2MXBz?=
 =?utf-8?B?SG8reVo5dTBUTGk1K3ZiSG9iRC9iQU1rV1VlYmIwVGcvN2dLREs1Y1NVMXV1?=
 =?utf-8?B?RnhHN0FjS2pUa3pHTFJadjdaRW92WDdqeldOZ1owWXI4MzYxR21IREtkakJE?=
 =?utf-8?B?STBvWTU2UytoWUR2TnY2UFlpSDllMlhmWUsyMHZDdEFEbkhIZ29oSmhnZVpT?=
 =?utf-8?B?enJvZTdTeU92bjRQa0VsL2dVSGJJZzYrOVBHblJXVEVKQmZNMk94aFN0dW01?=
 =?utf-8?B?bFBhMitEK1VJWW1PVUJNM2lQNEFjRFZGZWE2aVF5K1JtNGl3NmI2NHVXZ0VW?=
 =?utf-8?B?U3o3RVk5bVZiQ2F0WlFCbSs4OE9IbDJaY25qazRGVHJHTTI4OElQZGFXMW15?=
 =?utf-8?B?Yk9yUzdsMG0wVVVBckdnS2EvQnhhc09LTzA1YUVPa21rRGRKUkFlaXB3K0RR?=
 =?utf-8?B?VXRILzI3VjFLeE1rTnNrMUVGaTNPNFU0LzJnWTgwR3Q2WlNNSXNVTkpvcFU5?=
 =?utf-8?B?ZjVabkNCWTZEMDdUbVNhVXJRMDBrTmFIMkI3OWN4YVZ4cFE1WXBEbjBzMnQ4?=
 =?utf-8?B?V01Hc04vOEFrTndORkxHZVNJRTI1TXpWQlJXNmZUMFk3WGxCSk8wRng4MlpN?=
 =?utf-8?B?MERzaXlCdTU5NXI3c2huYzVoOGFNL21qUFY4eFgzNDVXejVkQ0MyN1ErSEtM?=
 =?utf-8?B?T0xYalpUOEFiMTNrNlBSbXRzMVdLMVJDaWRBUzVXWnFyNEdVV2hudUNYUUhn?=
 =?utf-8?B?djlic0xVYjVTcjV2TnNVVlROdy94VnBzN3U1L1h6dE5weGlXYVNQenlvLzdL?=
 =?utf-8?B?aUZTeS91YSs4VDRsZklBOHJiMkFtL1VrK29pMXRVcnVZaHVmK0hyTFVPTXFW?=
 =?utf-8?B?ZFpGMldwNEExaTREV28yWEZHdTZjYW5NL1BjZXdSQkx6TEwvNDJNbGFtQnRl?=
 =?utf-8?B?MzhYSEkvKyttNXdpamJDVjBmM3dGK1pwT2gyckswNVpZaU5KQkNyVWJyV1Bu?=
 =?utf-8?B?dFMxMitjN1BlNUJpK3NQM1lOQVNyekRLaEFIM2VDaFB3QUxwanNjR3ZrYmU1?=
 =?utf-8?B?OG44MDNkUGZQRjVpWlNrOEdoTEU1L1NUNnpiY21ySXlsR2xJY1JzYUFScjNE?=
 =?utf-8?B?d1AzbXVnR0I4T0VGWXlXTHNTVk1iUVFxak1UaFM1ckI3M0s5Y3ZZMTVkMmxw?=
 =?utf-8?B?S3h0R05sTTBuWHk5M3FqR2xNN0NqMzVwdWNLVHhXdEp4VFVxZjJTTngvMEZ6?=
 =?utf-8?B?SVlLZDh3dkN1M2hYblNnVDZMNDh6ckF4S1VqTVhoNjRJMVRML3NOdkRCUnho?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f4a631-28cf-4329-26c2-08dcf53f2538
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 21:51:13.7509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIvcSHyDkYMQq+stL701h7HPja+aXIvpo4ZnY9Yz3FbS/dPMhxx5mPo4lOvtbcEpLcYIBfOrewX26zSZfGHW6haPEIKg19tKSwrO0Rgu/GQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
X-OriginatorOrg: intel.com
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

There are multiple places where conversions between IOV resources and
standard resources are done.

Extract the logic to pci_resource_to_iov() and pci_resource_from_iov()
helpers.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c       | 20 ++++++++++----------
 drivers/pci/pci.h       | 18 ++++++++++++++++++
 drivers/pci/setup-bus.c |  2 +-
 3 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 6bdc9950b9787..eedc1df56c49e 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -151,7 +151,7 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	if (!dev->is_physfn)
 		return 0;
 
-	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
+	return dev->sriov->barsz[pci_resource_from_iov(resno)];
 }
 
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
@@ -322,12 +322,12 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
 	virtfn->multifunction = 0;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		res = &dev->resource[pci_resource_to_iov(i)];
 		if (!res->parent)
 			continue;
 		virtfn->resource[i].name = pci_name(virtfn);
 		virtfn->resource[i].flags = res->flags;
-		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
+		size = pci_iov_resource_size(dev, pci_resource_to_iov(i));
 		virtfn->resource[i].start = res->start + size * id;
 		virtfn->resource[i].end = virtfn->resource[i].start + size - 1;
 		rc = request_resource(res, &virtfn->resource[i]);
@@ -624,8 +624,8 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		bars |= (1 << (i + PCI_IOV_RESOURCES));
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		bars |= (1 << pci_resource_to_iov(i));
+		res = &dev->resource[pci_resource_to_iov(i)];
 		if (res->parent)
 			nres++;
 	}
@@ -786,8 +786,8 @@ static int sriov_init(struct pci_dev *dev, int pos)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
-		res_name = pci_resource_name(dev, i + PCI_IOV_RESOURCES);
+		res = &dev->resource[pci_resource_to_iov(i)];
+		res_name = pci_resource_name(dev, pci_resource_to_iov(i));
 
 		/*
 		 * If it is already FIXED, don't change it, something
@@ -844,7 +844,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 	dev->is_physfn = 0;
 failed:
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		res = &dev->resource[pci_resource_to_iov(i)];
 		res->flags = 0;
 	}
 
@@ -906,7 +906,7 @@ static void sriov_restore_state(struct pci_dev *dev)
 	pci_write_config_word(dev, iov->pos + PCI_SRIOV_CTRL, ctrl);
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
-		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
+		pci_update_resource(dev, pci_resource_to_iov(i));
 
 	pci_write_config_dword(dev, iov->pos + PCI_SRIOV_SYS_PGSIZE, iov->pgsz);
 	pci_iov_set_numvfs(dev, iov->num_VFs);
@@ -972,7 +972,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno)
 {
 	struct pci_sriov *iov = dev->is_physfn ? dev->sriov : NULL;
 	struct resource *res = dev->resource + resno;
-	int vf_bar = resno - PCI_IOV_RESOURCES;
+	int vf_bar = pci_resource_from_iov(resno);
 	struct pci_bus_region region;
 	u16 cmd;
 	u32 new;
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 48d345607e57e..1f8d88f0243b7 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -584,6 +584,15 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
 }
+static inline int pci_resource_to_iov(int resno)
+{
+	return resno + PCI_IOV_RESOURCES;
+}
+
+static inline int pci_resource_from_iov(int resno)
+{
+	return resno - PCI_IOV_RESOURCES;
+}
 extern const struct attribute_group sriov_pf_dev_attr_group;
 extern const struct attribute_group sriov_vf_dev_attr_group;
 #else
@@ -608,6 +617,15 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
 }
+static inline int pci_resource_to_iov(int resno)
+{
+	return -ENODEV;
+}
+
+static inline int pci_resource_from_iov(int resno)
+{
+	return -ENODEV;
+}
 #endif /* CONFIG_PCI_IOV */
 
 #ifdef CONFIG_PCIE_PTM
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index ba293df10c050..c5ad7c4ad6eb1 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1778,7 +1778,7 @@ static int iov_resources_unassigned(struct pci_dev *dev, void *data)
 	bool *unassigned = data;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		struct resource *r = &dev->resource[i + PCI_IOV_RESOURCES];
+		struct resource *r = &dev->resource[pci_resource_to_iov(i)];
 		struct pci_bus_region region;
 
 		/* Not assigned or rejected by kernel? */
-- 
2.47.0

