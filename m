Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A56AC4E37
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F7610E42E;
	Tue, 27 May 2025 12:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZzLP6oJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6728410E3D3;
 Tue, 27 May 2025 12:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347670; x=1779883670;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Wn0bvX8sWOWKkAmC2CTjILq5UmFFEdMEXtTy73v0Z28=;
 b=GZzLP6oJkZWm5xJ2EeWhS5jo5pgUsFhqBFxPAPISWqnnvnAv6vzXCmpC
 bpFbG//EhNpM+vev4BilY6ReAAyF5dzzwvIcJhLOqDN0fj4qELtf7J+iZ
 IeAlvLvNKRVLNT7UxR6rPUhXrweRDId/VmVny7xHkKC5QRmHGBt1b9FLz
 spzSHqqAJ033jI8RQOKj3avPKo33ADawMpLze/Dr/poIjLzV+nsas78yP
 buRICq3jtDKtV0VDU8uVLrrwJbfGoH98U8+vncaksAnH/bN0C8lPQckSh
 mroP2tRsdcmbSc/0Poq+yj23TPqafUN5ocsupJLlB3q7aSitg2XP7Rizv Q==;
X-CSE-ConnectionGUID: pXnyrmgAT7KTiGfUCkqU5w==
X-CSE-MsgGUID: HAWEXQBqQ0i72BUTwsj00g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49443582"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49443582"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:07:49 -0700
X-CSE-ConnectionGUID: On26k6kYQ9OT94d7FaDLLQ==
X-CSE-MsgGUID: CQYHnDEHR86eXHXQsWrA1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="142792166"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:07:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 05:07:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 05:07:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.46)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 05:07:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyR6XVAARETLxqiR9iKspPunf7ZuoIpnCmCw2Yy/C6GiE78RQxx/NhweFM4RBjaLzp1LzE9TTj+N+DTVn0JQDJikmdOO9lXeM/nsJ+5ZoMuIwh7xsuT4CvJB/glx8djXUldkQnu4vRQFfOlnyvUZLYj45m9Dv65IHBplzk/76kUDCrRqsy8CZ4Nk0uoiwYXEdvFbIOvvivL9DzxvceNru1hhZJeEORUSkX4zaGhMjlF9uy04yH3oTGd+83nIMJs2XwLyXz0twStdzk1wZWrEsdLSWQQ3jmmsWQkMWyMRuaLnxHZM3JHl1hTlCPodYoLP3EYkK5VrcVvZ0c2ZV6ef0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKlffMKC7iO3lXXd6nMM0MMJwBE/IxC3XXbDNCcMTaI=;
 b=mXxhK2D9dRsLrYsxYN8ZRtRLUZpz2CaOcMvJfofk1HAA2YDhX6j+Ax0mB8J4ugXcyXFcaZzpjDt4Uuf2bQpIQz+WT2crj8+rVIvWmKLuLREMnd1EbBNa5gCo4aOyaoGLCEheHSS5k0iyNLKhTDe3BEOepTkxnWGsq8bJ/6OnmH+LvP3VSnz/y1ltzyco0kNl+X4xJky0RLoCN7gq+FQQ8YrSklcCfovYudLILq2DOMV7Vel6GQY0ZDv/di16ZGAF583RJjqTS9ni5o2B5szoYnBovzmQ1cWPuezf/Y6WUXNuwsOvDCyNk2NjCidHExW7H++7LseSwkerYOKuCFVplA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB7575.namprd11.prod.outlook.com (2603:10b6:a03:4ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 12:07:45 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 12:07:45 +0000
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
Subject: [PATCH v9 0/6] PCI: VF resizable BAR
Date: Tue, 27 May 2025 14:06:31 +0200
Message-ID: <20250527120637.665506-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc6fa0f-4397-4e7e-8d0c-08dd9d17171a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDhXYk1WR3JYN1p5UzFpYUtFeDd4cVZGc2pmWFZYazhOMEZQTVIranpNUUVk?=
 =?utf-8?B?aGZzdGxVMmFKZmxYa1lyNWY3SlovK2dXNTdDeStRYnZuZXBHQUVDNnY5elRh?=
 =?utf-8?B?WE14bFY5eEhuQml0K0dyNys0bzRtQ3BJVGtDb0NnUHJIaG5YeElpS2JUdUxZ?=
 =?utf-8?B?TkJsR09sU0cvUk1BZFlEd3BKTzh5WE5zVXFWN25GdWpaSXF4a2FWSEpGdG43?=
 =?utf-8?B?eTBsUzA0QU9MR244amIzT1RWWmx6dlNQZjVleG5zYVhvaHVBaVg0R2tiNVpi?=
 =?utf-8?B?aVFDSDFMeGJnVE1GSVZ5MDhGbjJIVU85MStkZkxuVmRmWHV6YmFKRDV5RG9H?=
 =?utf-8?B?aWFmV25ETmcxYVRWbktOblg2Mk0rNXZBUmdiNkFZdUNXNkE5RzVPNEttT3Uw?=
 =?utf-8?B?cDZVYy9hdlYzSHNHU0hPeGlRc2RZemw3REs5Tm5aK0o3akYra0lmRENBQVR1?=
 =?utf-8?B?TXl6Ymd2NDc2R2hGaC9xYmo5OFNjL3pzOFNQTDl5S3Zobmxab0MyYXgvVGgy?=
 =?utf-8?B?aEZVZ1lWUDJBK3R1SzFqV2kxNkJ0SnMxTTRwVThuWDZIeUN4NjFiYVl2Ujl5?=
 =?utf-8?B?STFWWkM0NFFGZ2FSVUg2ckpPazA3YURKM1pVREY3VXc5aWp5YU14a2hzWFdy?=
 =?utf-8?B?MjFRSmxoenhRc3MwM0xSV3dlSjYvRWlVUExBZ1hXaTNjY05tMHJGNEFhVFJF?=
 =?utf-8?B?MFFqT1ZzZ0grdHhZZVZUVVZuNGZpMnFJMGtZWHZ4YVRrMC9aTDdHWDZuQWR5?=
 =?utf-8?B?RkFkNnBhaGdKaWVSVlQzK0x4eGtqUFdKR0ZXUEl1bTRBY3ErQldxQmk1MHBE?=
 =?utf-8?B?Ly9uUys5cW83MUZTdkpVdlBRYWRnMHlrWWVYN3R1L0hKVnZOMldaaktTRE95?=
 =?utf-8?B?OGRvVEFGU0xPMFRUWUFtaEVJSXZEbE1meGE5bjc5eHdsb3V3M3o3L2Yva0h1?=
 =?utf-8?B?Sk5iT3V1RVl1a2dVNjRFazNVNHVNbVBpVVJRQ2J2QVRCQ1N5cElEb0VydVZD?=
 =?utf-8?B?cGhGMEpLcURheGh5bmdQZHIrMGNabWNuQktQdUZxK3NaWC9UekIrd2ZpOENT?=
 =?utf-8?B?MGRHeTErR0NNcm1keVdzbkIxdlcvSnc1MlF4V2h6T0lud3hoUk1iWGpFTEp0?=
 =?utf-8?B?WExrNXhvOFpzYWRJSlVvV2pPWXYwN3VZRUluRlBjQ2xDNlhTclZtRXFlVTdI?=
 =?utf-8?B?SUJXUkRRYWxrTnhVMFgyUXFFYyt4aHJFbnpCS2hwUEN2TElhTk1keUZDZ3p4?=
 =?utf-8?B?em4yZUVEQUc3c29MMHBtSW4yUStQb3dyNWdLSVRqT1ZCR0ZsYXZUQ1E3UFNM?=
 =?utf-8?B?eWtmRk5KcHplLzlSTFdRNmJMREN5aHRhUklFdndPNlUvNmFUM21pd3V4azly?=
 =?utf-8?B?eU56SHhsaituSEl4SjN4ald0WjU5cXJxVWFDR3BBd09uQ3RwWG5rTUZUVmZ1?=
 =?utf-8?B?Y0lQMTk3VzJPRzVldklicElIc1RhNlZyM01zN0pqTXhFdUlwdFp6YVd5dXky?=
 =?utf-8?B?UzNGdXdnK2VaMG1hQnVNU1YyNXBYTk8rNHlqNkhsVXRGejJZWmxQVDhBRTBq?=
 =?utf-8?B?MGR6ZHczVUhoa2tYa3lnM2lNVGZ3cnZxcFhVdnJrVC9Ca3JaaUtxTjQ4KzAv?=
 =?utf-8?B?Y1lnL3hqNDZqU3NkbEk5WS9ERGxnUTlrRS9TZ2JKbXhwV3JvUE5NT1BJYVE4?=
 =?utf-8?B?SWFTWXBwQjR6Nm9CNmFDcmtlQ0d0dXJSTVlmY1VJRnJnM3VoMkhUNndDREQ2?=
 =?utf-8?B?eVIyZzVPbzYzSEhYK016a09VRVUyY08zRDE2UVBIcU4rMmFmbUNQdmorenFE?=
 =?utf-8?B?OGJzK3RDcVlsaFJkczBXdU5jTHd3N1BhVDRRbEVmZW9kM2l1SkEwaU93ZGJ5?=
 =?utf-8?B?Um02MWtGaENaVnRjWkVPdzNzSGhEQU5YUzl2a2QvUzIrNUROL3NNNHAxRkdR?=
 =?utf-8?Q?2mPnxUx0cuY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVZhWmJRSHpBZnE4dHVZdmFTOE5qb2FadHVvNnl1M1VFcWZuZ2FvbWJaOWlC?=
 =?utf-8?B?SzJmZkhURXlML2J2RDBkYkZQU0o0Z0NoMzJobU9yMnhPMmJHRGxnVGtuUFFO?=
 =?utf-8?B?MWhQQTFhN0MwV2VtMCtoTmVjRzYvMDhJNE1wZUd3RVRsTmo3MlFwcGsrTlJr?=
 =?utf-8?B?SEZTMFpwNTBHaVp5dndJWGlBODV3S3dwL2VWaVNmd2NBSHBua3VMczVTNWRJ?=
 =?utf-8?B?Z1dGV25vNkU3TmhPci9mckoyaEFTcEIzM3VMWjdscmkvRUtxY1dMMkFjdHM3?=
 =?utf-8?B?czVNT0hybkFDRWlwV3VRbHZRVXZWMkxRTHBVcTI0MTJyVTQ5UEVzUks5UHJZ?=
 =?utf-8?B?dEtiQkpqY2pWbnE1Qkw3UFpQczIvTU1WYXpVc1l2WmFiNjJpTjZtZzYyTHk0?=
 =?utf-8?B?bGxjMWx6TXFPYjZTTllZSW5QenNzcW0wS0U4WlRMVW1NTUdlQ2hyZHh2Y3hS?=
 =?utf-8?B?elJWQVdzRTlyeXM0Rm00QXhpZjhZbUZibGpwczBxNUw0OTF6VWwvTlZaQU1x?=
 =?utf-8?B?ZHlEbmpsSXpoTmNDV0c2NVQ0ZklDNGNIR1hJSk13QS9ZK0tZT3ExSzZUL29W?=
 =?utf-8?B?WnJFNmxUVEVrZXhhdUYzZ0M5ZTZoUnk5bkZ0NGpsWVNvNmNlTXdTQThBalhr?=
 =?utf-8?B?L1VsM2gvT3BWT0xURjNPNlc1S291cFhwTmFBUXVzanJGZStBLzlpVGdWMXZq?=
 =?utf-8?B?TjFtaGc2MlB4Sm1vbjgwRmtXT3FDZ2lhNDNuT01wbGdIVk16WFg5VTFyVWZn?=
 =?utf-8?B?QnZPZGV5N3B6cHF6SjRYY2NPbVUzSDhoazFsQ3liVlMrWXJFTWdoK3NqRkow?=
 =?utf-8?B?Y0IweldvNmFOei9qQTUxNDliUGx6bjRSeWZQZCtoWG5nY3lpTnBodUM1TGJK?=
 =?utf-8?B?aFEyZWJuN3ZDd2dMQndUU2RjZ3NnN3FLQzdZak1XcFQvZTNlTEtKNmtDYTBw?=
 =?utf-8?B?SStQTzlBZTlkdTIzYXllOEIxY28zK1NMTGdYWUNBbm53d3VBRmlqeW15YzNN?=
 =?utf-8?B?dGJ6K0dSbjNaY0xtV1FpNXN2VTZlc0haU0dObzFmYUxtWkFWd0FOYWRLQWFP?=
 =?utf-8?B?NmpPcjZTT2Z1YitBUUJqMDUwbzUrUmUrLzNoSjJYd0R0bmNqYzJqV2E3aUJj?=
 =?utf-8?B?Sjg3QzZRQ083WnMxM1JKbVgxVk9kaXlQQzdmRU9TSk1RclROeldKbSs1aG9h?=
 =?utf-8?B?azZoMVVobFBkL1Y2YTJLcDVrZzM1aDVzcWl3djdHQ2ppU2F4Tll6YmhuT1NK?=
 =?utf-8?B?WUhZMTl0LzlaaEJzVmNsYkJnRFgrRE1EUG5YTmF6TWQzeHBiVGVGck9BZEJi?=
 =?utf-8?B?Z1FQZ3JDZTB5ZkJNWGV1OEh3RlU2QlB4SWtkODFKSEduNFR3Y1BST3Z2c1dD?=
 =?utf-8?B?czZqTHBLeWZ1Mk00VU15TWdDTE1WZTdyZ2hKbGxacWRKOG81ZE5PenY2L1pq?=
 =?utf-8?B?akhLQ0wwMVpqTWNyNEhJWndTcjNGL0g1NUdBdTlZanBCN0htNlB2VzRoUVpB?=
 =?utf-8?B?WmVpMmNhOEs3SGtQKy9nNkVWM1lQRFcwQXJJSnhEMCthNzFxSC9WTGhkTVFO?=
 =?utf-8?B?Y3NCYVZieFduRVNCS2xQLzVGVVR3c0RtWVpRTHpQalZxQTRyb2JrMUlTbG05?=
 =?utf-8?B?N3ZtZERSWlFKTGJZMG8vK05sSHJyVnNUY0MxUk03a2oyK3k1cTVaaVYwUlFT?=
 =?utf-8?B?R05peHNaUWk3TTZ0elcvR3YxNlZ3OHNiNVhibHhNUTRtTDBiTk5iektWT1Mr?=
 =?utf-8?B?NkJncnRUNlR0dW9FYldoZFBkVWNiTTkzaTZQSkVqa0laNkpqVG9CdFBCd2o4?=
 =?utf-8?B?VWEwelpqaUZ6L3ZxZmlzd1FYekI3ZUZPNExzYm5Bek44QTZzMHppRGZtdEho?=
 =?utf-8?B?UkROSG56aWlaUHZ2NkVxSk9TYkNEWmpxUFdET0dxYU1CUFB1Yk5ra3dEaW41?=
 =?utf-8?B?YXhjZDBQLzRkZXg4alljL1QvSEpMdEViRXZ6S0FYSHBMKzJuUElQSEhWT1Zj?=
 =?utf-8?B?TldvR1krOFovckpoVkZMQVZVb2FCdllzNlFnM2I0d1gvUitPczgrVThXSTNy?=
 =?utf-8?B?eE9FUms5T2l3WlpxWDRIaWdsN3luaHoySWNNYTVlc2dBWFZhSzllcklPOGlX?=
 =?utf-8?B?U1FDblRlK1JmTnNXeW5BbVdldlFxWURhT1UyU2JtbXdrR0dKb0FuTjRYenlp?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc6fa0f-4397-4e7e-8d0c-08dd9d17171a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 12:07:45.5186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1VsaphaUJ3t6uSDGaqaAwcjNo0RkM90zGnMnW7sVDpurTJqO2nAjNIXpX5JdiByoAxkiNc+wPJxlQ8McAtYgKrhFZqy17DMK8fi9OeN2Dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7575
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

Hi,

This revision fixes compile-errors found by LKP on 32bit and PCI_ATS=n
configs.

v8 can be found here:
https://lore.kernel.org/linux-pci/20250526214257.3481760-1-michal.winiarski@intel.com

For regular BAR, drivers can use pci_resize_resource to resize it to the
desired size provided that it is supported by the hardware, which the
driver can query using pci_rebar_get_possible_sizes.
This series expands the API to work with IOV BAR as well.
It also adds the additional API for drivers to change the VF BAR size
without resizing the entire underlying reservation (within the original
resource boundary).

Thanks,
-Michał

v8 -> v9:
- Use u64 as do_div() dividend (LKP)
- Introduce a helper to access cached vf_rebar_cap (LKP)

v7 -> v8:
- Update variable ordering and missing includes (Ilpo)

v6 -> v7:
- Eliminate the loop in pci_iov_vf_bar_get_sizes() (Ilpo)
- Use helper variable for indexes (Ilpo)
- Kerneldoc formatting (Ilpo)
- Refer to latest PCI spec (Ilpo)
- Commit message wording (Ilpo)

v5 -> v6:
- Rebased on latest pci/next
- Cache the VF resizable BAR capability position to avoid multiple
  lookups (Ilpo)
- Use pci_resource_n helper (Ilpo)

v4 -> v5:
- Rename pci_resource_to/from_iov helpers and add WARN if called without
  CONFIG_PCI_IOV (Ilpo)
- Reword kerneldoc for pci_iov_vf_bar_get_sizes (Bjorn)
- Reword commit message for VF BAR size check, extract the additional
  size check to separate conditional (Bjorn)

v3 -> v4:
- Change the approach to extending the BAR (Christian)
- Tidy the commit messages, use 80 line limit where necessary (Bjorn)
- Add kerneldocs to exported functions (Bjorn)
- Add pci_resource_to_iov() / pci_resource_from_iov() helpers (Ilpo)
- Use FIELD_GET(), tidy whitespace (Ilpo)

v2 -> v3:
- Extract introducing pci_resource_is_iov to separate commit and
  use it elsewhere in PCI subsystem (Christian)
- Extract restoring VF rebar state to separate commit (Christian)
- Reorganize memory decoding check (Christian)
- Don't use dev_WARN (Ilpo)
- Fix build without CONFIG_PCI_IOV (CI)

v1 -> v2:
- Add pci_iov_resource_extend() and usage in Xe driver
- Reduce the number of ifdefs (Christian)
- Drop patch 2/2 from v1 (Christian)
- Add a helper to avoid upsetting static analysis tools (Krzysztof)

Michał Winiarski (6):
  PCI/IOV: Restore VF resizable BAR state after reset
  PCI: Add a helper to convert between VF BAR number and IOV resource
  PCI: Allow IOV resources to be resized in pci_resize_resource()
  PCI/IOV: Check that VF BAR fits within the reservation
  PCI: Allow drivers to control VF BAR size
  drm/xe/pf: Set VF LMEM BAR size

 drivers/gpu/drm/xe/regs/xe_bars.h |   1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c |  22 +++++
 drivers/pci/iov.c                 | 153 +++++++++++++++++++++++++++---
 drivers/pci/pci.c                 |   8 +-
 drivers/pci/pci.h                 |  39 ++++++++
 drivers/pci/setup-bus.c           |   3 +-
 drivers/pci/setup-res.c           |  35 ++++++-
 include/linux/pci.h               |   6 ++
 include/uapi/linux/pci_regs.h     |   9 ++
 9 files changed, 258 insertions(+), 18 deletions(-)

-- 
2.49.0

