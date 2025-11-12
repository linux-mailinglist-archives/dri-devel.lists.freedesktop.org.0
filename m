Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCBDC52755
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC8010E736;
	Wed, 12 Nov 2025 13:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STVZFgwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21D310E733;
 Wed, 12 Nov 2025 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953840; x=1794489840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JXP2A139rLZcnAkfQTyC7H2E6/Cmw09v4qHnumOZMX8=;
 b=STVZFgwp0ibSedkLtTwTXgzhKNHNXtWBqFZm6PZSxsTQ++RENb+Nkb9Z
 EmWEZdcVs5Nc/L4ezLJOgpZX5/EE/EVa5+719goGgpKOOQD9uyeTPcjO4
 mD/ndO7ATN4HanAlH+ATJCNRz/Fw8ovi8KC7iSOIF97IVAwbV4TakHV8m
 yA9RpjxMwSyXiotNniwPk8N0hiyGrRf4xycV9Ga+OSn3yOBL9nkjUtqrG
 O42Kq0pjwPLSUiovZlKgopaZq7+9fiDBtQRlGTfBxv2T9jeAk6/4Iy1GX
 0edOuGcBed09PFvVhLj0dUgKemDyIwMGGgBhUfjzMbYOlkuF2RmBv8SZg g==;
X-CSE-ConnectionGUID: WGOLyA2PQf+N2jRPIM6JTw==
X-CSE-MsgGUID: oxOMFwCcT1utMTrUM+/IZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75322687"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75322687"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:00 -0800
X-CSE-ConnectionGUID: R5GaSkSmTomzFRx1lrz5xw==
X-CSE-MsgGUID: +dhYqNWbR7q3Tu0IushqIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188858023"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:59 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:59 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiyPYfRebjUXy6C28QItQuOSokj2j3PtCG/b/ufnMNracOGquoTKh4zuqU7tg3mKSl1/TMrV4fMxytWOmYrOXZeofiQonapKUMVm6tMJTfSVGzhuOzGygZN0w1HtIzvNe5KLqzUN3YUSAIcFjbItZpDFC1JBFPctEEdUNc3sAEDn0nN+YLnjLIRh6VqcXrstnW30NGemIxJI5cMEnwwTt7W5OJm9XfavBGaUz96GG85FD/w1Bf7la81HmH2GMVHMjPVjGbuDTXErmhfdKAlSYao0UBVODaVotildBbHOspcIgQ+wMsBGKhE7KqwuZjuw3uHuef1DeSgWwwl2aUGlmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2qaw7A0j3QBtG1WGQNqJQRGpY/GGLgGrWo+a4+KISY=;
 b=qzfc5EWe2pEw4zHWHlMr627ygddjCz8yu/xLZr7tBP5+rUZ3ReuDQ9OSugSEu764Qjjn+YH3OJ/3EK0gE7uk8LdfTYen6oJksCs7JNJTrVapvNHuBdQ+lLXlMvv1RWqCdF8fNQSlA0g+o3NYY9pi3915hhOxrWfBYPqci/wGQCdDYgi+acxadpPxqP6T5v4tRLF2hGXY8ariGyEv12gOLwrMzZ/1F3op8qkRbC6rvjy49jbytIONYL1hsHRc3ff/fc8sRsU3v8Nun/hQLX4tfsqXCmhfYt+e4C8Ido9xa0YUg3k3uoc6gLmowwy91WsQ6Vay5mkUgvyd9oXPOM6Ajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:23:57 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:23:57 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 16/24] drm/xe/pf: Handle GuC migration data as part of PF
 control
Date: Wed, 12 Nov 2025 14:22:12 +0100
Message-ID: <20251112132220.516975-17-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ca4cd6-2d71-4696-cd3c-08de21eebbdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlcxZW0yNmdnN3hZOGJIeTFFNFdsVTFFZGwvb2wxbjhUVE14M3lBQjFLL1Q4?=
 =?utf-8?B?ZXdwLzRSZUJ6ZEVVOE1TdXdZRERaT0ZtQW45akE3cFBCYjNETG5DSnE1U3pa?=
 =?utf-8?B?WWJlRjdjcFRBZWZlYlI1V3I4cWFQRFBVNXc3WmpWMk9ub3hYNDkrZmxPVEx0?=
 =?utf-8?B?amlhM3cvQi96WE1FZ2FRczdTR3JubjdqUkNBMk5JWWgycWxCb3RSNnZQcmJM?=
 =?utf-8?B?VVU5MXRjekNCQ2IxREFJMWo0NmtPYk9kWmtRcWxQOEF0Z2ZSbDZYcWJwUHhP?=
 =?utf-8?B?dE5JaUFubzVrSlpzSFM0c2NvYWNqVVUzUzE3a3RCRFlvUjcyNDEvTVpYRFJS?=
 =?utf-8?B?d1ZHVjFEM2NCRi91RTZwcUVrbTNjQlBVWWZCVXpWOUgybWhoYXpZVHhYK2pr?=
 =?utf-8?B?dVRKN0lZYnZBYVVJVm5MQ3hiYVJaeWRBOHJJYkJtY21oblBMUHNGSWxraE4x?=
 =?utf-8?B?YzBUYXgvNDNGaHNVbnlUNTM1RGRKUkZJbEdORkdrVnVuNDlSS2VHMjVTMGZL?=
 =?utf-8?B?QWVLZXEyR3dzd29UM3pRWWlOSXlGR1JGUVl6cWdCZTFQNXFTS2dNYXhuL0Vr?=
 =?utf-8?B?VmV3aTFTeTIzQUhPOERudXczOUdjd2pxem1wS1dFMnVZR3dUU01tZXhzNjFJ?=
 =?utf-8?B?VFpybTBkanNZSXdHelUvYzFpZERLNDYwNjVObXhOUDJ5MmMyb241azNqeFdG?=
 =?utf-8?B?TEJmTXN1c1pSZEtlaEdIc3M4eVV3c0R6SnZrVVRsdFRpdWZnaWFXaURNOEp3?=
 =?utf-8?B?K1hOTFpNZS96TExnS3NOQ1BSNTVtUDgzWjdyRE1nakpsY2VSM3VmOURsd25L?=
 =?utf-8?B?U09MREZFTUhxbUVxd3hlWldoNlZ4VHNuck5mOGZkcFEzUkFjRmZDOVRadEMy?=
 =?utf-8?B?c2hSTVRGbWlLZmRENnNRUlVOOXNTMUdtVFEySklxMFFocyswRCsySi82U09v?=
 =?utf-8?B?elJUTk8weU5EV3JqRVZjMys0Q2lZQktVdjRjekg1d1NSMm9YMVRqaEVTemFk?=
 =?utf-8?B?Q1hjNTh0MlpjZW8xdVVVY1BRWkpRVzBQRW1yVTZyc1I3OFEybzdndGhkU1Q1?=
 =?utf-8?B?YVNpVDBUN09XTzZSdUd5bzRwS1FkRWlDWk12Y0t0QUNPTGdyR0IxenR2Z2V2?=
 =?utf-8?B?Ri9vbmR1YXQzWGJGUWpKajNRUnVBU0NaTlU5YmNRbUphaHppaXZqN2lGUVFB?=
 =?utf-8?B?RkU1cXJ2TVBmNHZJcXdLWndsZ3NUdjUvUFhVOTNybDZYcUdvUWV6Q08zaSs1?=
 =?utf-8?B?SnlsWU55dE1YYkFwZ0tuWm5YbWlkUW5oMGtabFR6bG1VMnoyRm83U3V3MW93?=
 =?utf-8?B?dUZraDJxWXVyM2JDNE9oMldwbkI4QzVQbEpDeFRFVTAxRjBqVHo5NUNkZCtU?=
 =?utf-8?B?b1VOOFl5Q2c3amJGcUdoVFFwcFNvTnYzZTFZNjNidVQ3cWlKemQ2VTBqcVlK?=
 =?utf-8?B?WStZbjBBOHJlM09qQVNUZWlETVFLa3NJcUVQVUhQVFloVFF5Q2ZMYlAwNFg2?=
 =?utf-8?B?SWVsZlQxNXBPVlZJdlJFaEZQQ2xjbU5GVVkzbGFkcnV3cllmOUdWU01vUTZQ?=
 =?utf-8?B?ZzVBZkJKa2lJZG1tVG5rNWF0SUx4c2E0RStNcEtKSmtVbDNIRzZBR2EwbXd3?=
 =?utf-8?B?NW5vSGtqUzJMMmRPV01EVXFxalRLYSs4SlJEZitOdGNPU2lUK3o1OVZ0dW4x?=
 =?utf-8?B?L21ub041eVdXckFqVjlabXJ6UjVjZWI3MVpWUEoyb04zSjczSmp4VVNrQWFF?=
 =?utf-8?B?enI2UUVRL0pmbDlINXo4VDFuYzlFWEV0ckNkMTdISk8ybWJvU1NjSTN0YnBE?=
 =?utf-8?B?SWxGNS91UkR4bGJ3Y2QyQzJFTnFTYXBSUk1QRFFQU054QTNGZCs5ZDN3aE1G?=
 =?utf-8?B?MDl5cVc5QUFvd3JvaVVNbjJFWDh5MmgwUGJ1SkFaRVZFMENXRkFXWWtBN3dx?=
 =?utf-8?Q?M9Vm4MlqWuWjn5KHFxocrpNnDFiCBQqV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXFLRXQzNWZaM2FpZFpVdDZIOWFtbmpIYjRxZ2gyZVlBczZYQXIzalZFSjhF?=
 =?utf-8?B?WWcvbXJYNURwaWFXNWpkOXJaRVR3eW9vbjY2bzZ1UDZxckJRcTg1OWVLTFVB?=
 =?utf-8?B?c1h0aTVxNk8rbW1pTzRMWlVESVU2ZTJHRHNudmloeCtEa3B5QUlJbFg4aXNY?=
 =?utf-8?B?WkRPcTZUM3lTWlgyUU8yY3VrR2RwdGw2STAyK0lwcjVIUWc0cHBxQXVNa1Ns?=
 =?utf-8?B?eVE5a2VYU3dkOGY4allmckZQL0Qya2F0ek4wU00zR0JLTEMvVE53ZGdjYm1T?=
 =?utf-8?B?bW84THp3Q21xY09ad2YxS3YwdEYwbUZMc1orRENMNXFCZFB3REpzZWF2SmhR?=
 =?utf-8?B?bVEraXE0NWVLVGZNczJnWUhwaVcrYWRUUTFjWTFkOURyckJTZmNqdG9aV1VR?=
 =?utf-8?B?LzdYTmI2dEpJK3ByRGw3cG1vS1dHd0oyYzVPak9vaXRtbXdGKzg3SXdOeDlw?=
 =?utf-8?B?UXZLa2pFd2QxT3pYMDlUTlpXQzEzUHNVRHZUQ2xMMkNnRHovOFd2MDRTS0ty?=
 =?utf-8?B?bkk5MWdqVFhKVVd1ZHZveEk5blNoU3BidnRGeU8xYkFwaDlGejFRQVY1ckdt?=
 =?utf-8?B?Vm4wVnZ5VHAwU2RZYURlQWt4QTBUOVE3QWRrc2JRSWtGalh3czE0a2ZuYTF0?=
 =?utf-8?B?MU9KdDVERTVjNUkyNkdsdUxpeHVoZnhGa2VqclljeStvQTRsZkltVnJETlFh?=
 =?utf-8?B?SXE5V3lLRDlqd0VkQzI2aWpPcHBxcHgvdXUrbktad2d4TUdPS3g1V2c2eWNQ?=
 =?utf-8?B?NTZUbUtVNC9zbDJtTTBxaXI4N3grdjBtWmloQm1TMDdYYk9kQTJpZTdYQ3U5?=
 =?utf-8?B?bk5ZZ3hpclBqOWhFb0JNaWRWTkJKWVZBSWNpVjkyQ094Y3V0RzRCZUpGbUk2?=
 =?utf-8?B?ZFVJQ0FEOXVyUUFNZTI4eFlCenN1T1JhU1k1ekFwcHJJNU5ha2JTMzJNRlBq?=
 =?utf-8?B?VHdSbjFXTnRNQlpmM3phK3o4d24vM2JWMVE5NEtDcDVtL0lvOEN6enl4anBW?=
 =?utf-8?B?U3B3cGZOTjk4cE1xNTBWWUpOcVhmZ3F1eU9xMEZEbWpnV1A3Ui9DRTZqbm9Z?=
 =?utf-8?B?UXkwRFlHcml3S09GREcrTFZSeVBxU291QzNzdXh0WTNOL0JnUVpkTStBejNH?=
 =?utf-8?B?YTRhUDU1aWlhUFRGUjlnL2p4TDRZSEdveVZtajBobUJJRUdNK1RFaENWUG84?=
 =?utf-8?B?cHBCTzdWV2twdld4eXcrTnp2OVZWY256ZnRQN2Nud1BQSXRqWU1BZ2pDNHcx?=
 =?utf-8?B?QXBpSzJ4Q2VYcURwTzVFL0pwcmx0c2NORm9Xb25OZlF3Q3BCQ3ltTCtHU0Rt?=
 =?utf-8?B?UUVyZ1Jvd0lDSHk1OFNxNUVMeWd3a3A2VnFHSEh6RThzNkh6WDF5NmZGcEpC?=
 =?utf-8?B?YzlzSHc4Ti9sN1ZKc0pqL0YydGhycDc0Skg4TXdZUzJLVUMvcFZJQ3d4aEhU?=
 =?utf-8?B?VmF5cHFyYm9WcnBUbkJrU3dWZzRXRmpNb2pOVDhEd0NLeUs5Slo1NTd2TU5u?=
 =?utf-8?B?ZkNUb3NyMElxcVlCWEc0VWg1NUR0WmJ6eURiUlpKMXRqRlQ3TXpTM0FrNmFv?=
 =?utf-8?B?MS9RSVdVd0ROZ1E0TTczVXNuYitKb0htdmRMaHE5MFZzTjV2SnlTMWJNVmhU?=
 =?utf-8?B?SjVycEpzWHZ2T0hwRGlIVVZtRGxyajJucEJxajVmTWlVUnlaQzJ0RVhSbVpm?=
 =?utf-8?B?cFJzSzdjTmVYeVIvOHBoNnBBRWhWUk1CcjV6TFpyOG96V3FKV2NrMTRkMWFS?=
 =?utf-8?B?N05hREpvdXFYNlZKcmhpTm9GR3B3VlBzK1dGOG5QRWZoU0VpUXN1Wkg2OUZH?=
 =?utf-8?B?ckgwZGhFa1BkczJkQnM2WlE1Mk5OQ3hRL09hRUM3Nm9mK0F1YklRbG9qU3FO?=
 =?utf-8?B?ZThja2MrdWFzckNBa2w3RkdxVUpIZy82OHp6WXBrSHMyNUxoSk1iRVhuZVZY?=
 =?utf-8?B?eWNtczZ1d2tFSlFvMkNObkxHWmZWa01uTENTaTRCaDg1dENLMDVOWFVpeHZI?=
 =?utf-8?B?TFdIUUorUWt1b0FjajU2MDVYNzNYcW1aYUtLTW0wbXNhN3VRME1yOFp4TkNj?=
 =?utf-8?B?ZVBaNGpxOXVnN3MwWWVnSFh0dS9NeHBoU0JWdVQyeHMzZTk3UEdtSWdsTyt2?=
 =?utf-8?B?ZWwyd0g1ZU9oNWlQQXZzK0lEM2t5V2owK2g2OE5HdjRZeFR2UE42Uk5DOFp4?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ca4cd6-2d71-4696-cd3c-08de21eebbdd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:23:57.3438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gn5UacD+HAAXjz+lAgW0CditayhEed5zTPlJ0j195JiaAP4s8TUIEqZVjA8GtMAZBKPqXB/SImJKDLNiq3WHLy1/zMBOvjg7xuv+YgJDR48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

Connect the helpers to allow save and restore of GuC migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 28 +++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 71 +++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  8 ++-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  5 ++
 4 files changed, 94 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index bb1ff5ff436c1..7527aed8c7c57 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -854,6 +854,20 @@ static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
 
 static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 {
+	int ret;
+
+	if (xe_gt_sriov_pf_migration_save_data_pending(gt, vfid,
+						       XE_SRIOV_PACKET_TYPE_GUC)) {
+		ret = xe_gt_sriov_pf_migration_guc_save(gt, vfid);
+		if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_data_complete(gt, vfid,
+							    XE_SRIOV_PACKET_TYPE_GUC);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -892,6 +906,7 @@ static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
 static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_pf_migration_save_init(gt, vfid);
 		pf_enter_vf_wip(gt, vfid);
 		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_queue_vf(gt, vfid);
@@ -1079,12 +1094,21 @@ static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
 static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_sriov_packet *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
+	int ret = 0;
 
-	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->hdr.type);
+	switch (data->hdr.type) {
+	case XE_SRIOV_PACKET_TYPE_GUC:
+		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
+		break;
+	default:
+		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n",
+				   vfid, data->hdr.type);
+		break;
+	}
 
 	xe_sriov_packet_free(data);
 
-	return 0;
+	return ret;
 }
 
 static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 08d4753f2b11b..e3d4423df4237 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -177,23 +177,10 @@ static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
 	return ret;
 }
 
-/**
- * xe_gt_sriov_pf_migration_guc_size() - Get the size of VF GuC migration data.
- * @gt: the &xe_gt
- * @vfid: the VF identifier
- *
- * This function is for PF only.
- *
- * Return: size in bytes or a negative error code on failure.
- */
-ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
+static ssize_t pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
 {
 	ssize_t size;
 
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid != PFID);
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
-
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
@@ -281,12 +268,19 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 {
 	ssize_t total = 0;
+	ssize_t size;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
 
-	/* Nothing to query yet - will be updated once per-GT migration data types are added */
+	size = pf_migration_guc_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_packet_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -333,6 +327,53 @@ void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid)
 		xe_sriov_packet_free(data);
 }
 
+static void pf_migration_save_data_todo(struct xe_gt *gt, unsigned int vfid,
+					enum xe_sriov_packet_type type)
+{
+	set_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_init() - Initialize per-GT migration related data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ */
+void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+
+	migration->save.data_remaining = 0;
+
+	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
+	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GUC);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_data_pending() - Check if migration data type needs to be saved.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ * @type: the &xe_sriov_packet_type of data to be checked
+ *
+ * Return: true if the data needs saving, otherwise false.
+ */
+bool xe_gt_sriov_pf_migration_save_data_pending(struct xe_gt *gt, unsigned int vfid,
+						enum xe_sriov_packet_type type)
+{
+	return test_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_data_complete() - Complete migration data type save.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ * @type: the &xe_sriov_packet_type to be marked as completed.
+ */
+void xe_gt_sriov_pf_migration_save_data_complete(struct xe_gt *gt, unsigned int vfid,
+						 enum xe_sriov_packet_type type)
+{
+	clear_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
+}
+
 /**
  * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index fd81942bfd7a2..1cba651b521fe 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -10,12 +10,12 @@
 
 struct xe_gt;
 struct xe_sriov_packet;
+enum xe_sriov_packet_type;
 
 /* TODO: get this information by querying GuC in the future */
 #define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
-ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 					 struct xe_sriov_packet *data);
@@ -26,6 +26,12 @@ bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
 
+void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_migration_save_data_pending(struct xe_gt *gt, unsigned int vfid,
+						enum xe_sriov_packet_type type);
+void xe_gt_sriov_pf_migration_save_data_complete(struct xe_gt *gt, unsigned int vfid,
+						 enum xe_sriov_packet_type type);
+
 int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_packet *data);
 struct xe_sriov_packet *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 75d8b94cbbefb..9f24878690d9c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -16,6 +16,11 @@
 struct xe_gt_sriov_migration_data {
 	/** @ring: queue containing VF save / restore migration data */
 	struct ptr_ring ring;
+	/** @save: structure for currently processed save migration data */
+	struct {
+		/** @save.data_remaining: bitmap of migration types that need to be saved */
+		unsigned long data_remaining;
+	} save;
 };
 
 #endif
-- 
2.51.2

