Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD3FC363E7
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8997C10E791;
	Wed,  5 Nov 2025 15:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9oy2sDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3964710E78E;
 Wed,  5 Nov 2025 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355506; x=1793891506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ly4mmcW/4HH/yrSN8by/82mmuBmRUJWFS3MaB/oSA4w=;
 b=Y9oy2sDU6hjMlJhf+3rPEovrdwsl1V6R6RA5RqxAYiS/Q9NWNysOSvJU
 6l+wDB1U/cHFsaq9iEx6yTcoQAvxqSZWotZJOT/yDqsjwqh5ImpFA3vmP
 0diItWt6P7BX8sQ4Uq4Ca1tH31hvuNS8EdsDWIH5gpoXXptXNO+/dmI9W
 xTZG/K3tHVAyN18CCBNaf1JO2+pabXN7epH/fEMWQlF1d1CWxA8OXPr6x
 B40oVoVsIPqxhC3QCQq3hpK2Inbz6jNwm+gqsVRJrhbs79YZ0LYS3KKad
 dcCmavlGQBWVc603BMr4meDBRP3T2nLNIxdaFtPkBn7/Y5NvBQ+bfUr35 Q==;
X-CSE-ConnectionGUID: i+GgMa0FQ52/zQbzRrXbqg==
X-CSE-MsgGUID: jMcx9ojvTTyMVFPJD95K3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64379633"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64379633"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:45 -0800
X-CSE-ConnectionGUID: pthxuhd8SmWaeWs5ichcmA==
X-CSE-MsgGUID: R4N1IAkFTS6F31HKX4pIpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="192649584"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:44 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:11:44 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxjtyN1+lN2R19zbOEwmyo8pzNr4uMLpVPxLjVuBpacpDxwpgUi0RduFK+KH1vpPzC9r9giAFdZKFraOuxOcFBz1MoHj0BYZ7YNsiUzrbDZlMlZKNJQ/T623xSDPLYvk71MAYd6rsVCozvPbBc80ezkz3ZaYgHMN6jOp7VZEwpaa4h7rle8EZeBveZiX1aEWw97k90aRohHi2l10GQfnyIhxAiZN0yg7SY23MXIZ3bMCMRmgCfU663jhYUUrlcKKlmIxf1NXXAZBY03RBmqJ5YuUPfIekC2DnuE1qcAqmPHTkDTNUc4MsH6Ss9h/99DhdKv99gtT6qcUWS6JNYBi/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U92x7DWXvcMQP8so1PdwErrXJ0lIhhGhewZWjHxl0gM=;
 b=LVzK5l/o3F3dwfU2y5+YtOXdjZzvgUzO6NY7BmXbwa2VrR1cHJI/6MHJJ5qPIMDkmL317ifnmjoVi7/tx8GhJ33TetKYbUPs5eR0zcWTjARMSd/nbj7OnI6XvgPBK38Oha+s5LNt5BwDvSPWMw8dlUtpR1LM4SWF1/roydO9l+W44NKs4PbxLR610OOzLG0zRgnrHNu/lS6X96ikVj8d/xdJ6HGT2mX3YjUR+IJTXEG3eGEGmSydYYjAO0DOz/Lly1yPERwcRrTV2mm7O4wYISnuhZjDGW7+Sb27cUmkvAVgnCnL9x5M3cUip7VfkUF8dxkZFAyaEZJlien1gUqQUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 15:11:42 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:11:42 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 11/28] drm/xe: Allow the caller to pass guc_buf_cache size
Date: Wed, 5 Nov 2025 16:10:09 +0100
Message-ID: <20251105151027.540712-12-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: 593c39cb-a01a-4d54-9224-08de1c7da08c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEhrYTBXcnc2T3ExUnZneEJmaFZGa3FISC84TDJjUGE1NHk2Vll6MERpYUs1?=
 =?utf-8?B?Ym9KVE1EWGVjdXZxSVkycW1QdjNaLzJjY2ZPeGkreU1IL0YzTjNKejI4WkRZ?=
 =?utf-8?B?SXJscUd3bVJWdldjbEFTMHVRcTkweklyOXY5cmRoWUd1YUZZY1pMazFaRFFD?=
 =?utf-8?B?TXFzM2xsMncrb2I1T25nWTdvSnNBU3dNaEw3dCtyc3ZoQXdJQ2tCN3RGeVMy?=
 =?utf-8?B?bEtLb3dQMDZ2aVpOSE9Nanh0MTViS0VHQitDNnNVNmRZT0tYWEI3dlpNdzZ0?=
 =?utf-8?B?QVRZdVNQbUlpNG1CVkJvblZsOVdYbnRNNyt6OUFST2MzK3h1d3k3V1JYZ05u?=
 =?utf-8?B?Zkk0S1g5TGUvSy9NUTZMNk5YTzM5ZmJUU0o2VUVJR2FmVGVPc1E4RStaMFBi?=
 =?utf-8?B?SjNmRnlYeWdIS3JGQUMvZFdqWHg5a2l4TXJuQm0xb2VFYzVYbStRbmlsQlZa?=
 =?utf-8?B?TE5tZER4bTh2dXd3TUxwMS9xdURkS0Q4aUVaRkd4ZjJnR0Y4eDJxUVRQVGtC?=
 =?utf-8?B?dW5VRnZZNFd5aVFyZzE2bVI3bEVuK2ZacmVaNlV0SFgyQlBTYUVHSlFHV2hI?=
 =?utf-8?B?cHhWQWF1UU9zZnp5b3kxNzBPWWdYaFB1aU9NWlFYUnNMMFlDT3l1dmhIOUpz?=
 =?utf-8?B?czZaK3B1SEdWUUhYejdZTDB3TXFJOXBDUFVaNjRIOWRPN0hQTkFzR2liTFps?=
 =?utf-8?B?TEJxMXZaL3FPbTE4SGVVbTBXeGVuV3RxUSthYkp5c0ZnSjVteFdoa1ZTeDYz?=
 =?utf-8?B?WmVkWnNZL1M5cVdmRWVZQVN4MWxHcTBsbmFqTGtWL3dpMW1ibTlYMWQySndP?=
 =?utf-8?B?N3krS1c2MW5TdDFRQXZYdS8yZXBzVnZTTUt1aGtDSEhqc2xaZWNBWjBrMUIw?=
 =?utf-8?B?YkdLcUovL2dlRWlZVzA0ZWJLMTg4MzBtYTNWNGZVZ09oUU42NGUrc2w1eWtS?=
 =?utf-8?B?NU5kOXVTazFjbmtNV05sTXE3bG9kZVh1S29TcW52QXliT2lPaGU0dURDUTJO?=
 =?utf-8?B?TzV5Um0xeDhUUEJMSjBKc2VBeEwwNzh1RElZL1pXYUNnVEdyeDkvNllUK0lC?=
 =?utf-8?B?Zm8wNVpZYzZJaGN5bHhYcVltY29LOVZ1WjdCTHY5ME5GN25rRU55MnJ3THIy?=
 =?utf-8?B?N3ZXSVhYV004a0NCbWNrNkdSeDFjSzhkR2V1T2ZvME1rNzF0UmNuVkZad2hy?=
 =?utf-8?B?SFN4bTRIK3RQY2xIN3pya2tXNUZLcHVEek5iVkVKbndzd2l4MDRReFF0YzRz?=
 =?utf-8?B?Ykd0QjNKcWxYeThRSi95a0JuZWUvdHFYZlFld29NYVBUV1dmeE0zREpralNw?=
 =?utf-8?B?RWJ0U054enhSYUlEaThaWFgweSt6MnQ0OUZpc2E1MTZ4eVJQcHpKaERJbWUx?=
 =?utf-8?B?eFJ4M2dtN0wyNXJ1allhTndkMGJodXRZaURzcjBkcnNCNlIzdGFBNEF4RzJ5?=
 =?utf-8?B?dTR3RGtXSzVNa3haZXVEOVJpbDdEaEhFeVNvd1RZUGxQZXY0U2ZuZkdGR05L?=
 =?utf-8?B?aWpMSFZVM1NTT1I5Y05aNDltVkxRQ1p5clhNdmtxSitqNUVKczhDcy9uVW9x?=
 =?utf-8?B?U3MvWm5JKzVlTkMxcHhRbEpWZUsxcUc4eURkOWxsa3hTN2FiYU1tcXN1d2hn?=
 =?utf-8?B?dFppM0Z3NExNUzYyN1lIV2I1RituNm5SalkyWDkrR3JUMmlqbXB6SC9nVkJS?=
 =?utf-8?B?OTBZTjdwZzJzL0ZVMTVreFVaTzlpQjB4WW9yYU9MQ1RTR2pSWXFmS0ZnM2ZU?=
 =?utf-8?B?eDEyWXVGOWxMOWpmb2FQU1VWd213SVNOaVhhNkgwVDVzYWovU3V0bmYzR0Jq?=
 =?utf-8?B?Q2oxcGI1N282YWs2UW80bE9VcHhMTlF2Zm5xa1ZRbkFncmwzTE0veE14Mk9P?=
 =?utf-8?B?eTRabTBXQmNCUG1MTTMrc2NYelMzak9DQjNNc25odCswS2ZzdkJNS2dHQVcw?=
 =?utf-8?B?MTdzdkRBeUtkQ0N2aVVGRGc4QlNmRWxaZHZ2cmZVQnF4akpNTlp4ckVRcmkv?=
 =?utf-8?Q?isCgHC6qWJHp4mY4IB360RxVEuyE7o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3RKWXIxakpIakErK240RThMQVRjVUlGemFRNXcrU0RrdWVZcFcrRzlTY2dL?=
 =?utf-8?B?bVRWK1o0UHBsSXkrY2tKUklZUEN2RER3M0VxTXB2cWxhY3VoMVhQdUpqN05L?=
 =?utf-8?B?MzFOdW5kSVZMMU1iK2hVb3J1WXh0MmV6QXdkWGFoZ1VDTi9ZOFlyQnpEOHM0?=
 =?utf-8?B?eFBCQ2w0UnZBTDhZNWpKRW42aHUxQ0tWNG92aXYxNjd6eS84SHN2cTBrcklh?=
 =?utf-8?B?UzNHQlQxR3JoU08yWVdIOElnZDBDajlBWXdqbWxMSlBEaWE5V2lBdmRxMFBX?=
 =?utf-8?B?Z0pqL2pDMHR5UEt1Q3lkdWVDbUNSN01MT1NDaFE4QWFZVk1IRkhnenVzZWEw?=
 =?utf-8?B?MjNHNVlndk90RTVXcVVpdEtaT0s5eEsrd1VIUTR6eWJpNVA1V0VGVGNmaG45?=
 =?utf-8?B?TDhodnpvR052YnhYTVZFaEp0MjVvaWEwUSsrYzNRTlFDUFdJVDFWQVcxb2t6?=
 =?utf-8?B?d1JKZHZ1Q0JUeElIMWIvUnpqSGNzRVU4citPRnlIZG91L0RNWklwTFppUUpD?=
 =?utf-8?B?ekRGaDQwcHdGKzZyZG02S0FPdTVqbk0rWGZCc0RXTnVTQkVZZm1lZjdYSUlJ?=
 =?utf-8?B?NTk5QndCb0h1ditGK2xQNG51Wm9qdTNTeFRRbkkzYVVNc3RGNmZQMFFVN3FQ?=
 =?utf-8?B?T1dDY2JkdFhGM3AvZEtJamdIYzNBcFhFY2tyMC9iNHJLR1I3RzhwV0cwOEZW?=
 =?utf-8?B?RVFkQkpnQTh5WXNtd1VnSnBsR2I1QUxoRnNYT3g3UldDUUxXSDhiZVhkNXk5?=
 =?utf-8?B?bU1iS3BBZFdaTzNKRVdTR0xObitlSFVqUkpaeHJiTnQrNkplcnN4WEJaSVRV?=
 =?utf-8?B?VTA1a2ZqRk15LzZPeGg4YkNZd1psNDc0Rk5hc2dJendqWVAvV0RqWHF5NHhH?=
 =?utf-8?B?bWRSODVoWlBLYlN5amx3eGdJeTRSWEFZajNCS01TcUZ5Q00wWGZSbWlvMjBr?=
 =?utf-8?B?YW5pTFhhT3QzVlJoRU51ajNCMGlaek9QU21GblF3ZzhON1Vhbk5aTDVrNWg4?=
 =?utf-8?B?WjlBSnVud1UydVQ4ODdIeUZFUzIzM3hPMXltaFR4Ym5CQlVYQlNRZzRSb2Vr?=
 =?utf-8?B?WkVLWU9DUU5JdUNrM1drUlNwc2FwbTJkdFhWMXJlWldxek1GYWZ1MWNJZUNk?=
 =?utf-8?B?VkFsbTRJS0RTWCt4MUhCNnUyblNJc25tM0dmTi80QXArYUdwSjk4SUlNKzI4?=
 =?utf-8?B?eW9yRnJ3WlB2TFR4SjZhZW9iTTRhVjZKM1pFdUliUFNBZStlcExmRUFBSDF2?=
 =?utf-8?B?YzNwckQrRDJNak9rRTk5Sm1ad21SZ2RBMXdna0xuQS9aU2o5M0s4YmUva1Z1?=
 =?utf-8?B?TnY3a1dEd3ZEa2s2WVZWS09WREVkNUpjNEJlVTRCNFpPNlFZcUhmdGRMNmhv?=
 =?utf-8?B?ME1saG9NSzkwTU1veFJmT2hQVEwzemQydkxaUFVra2l4ZWZGd0dobUo0NHg4?=
 =?utf-8?B?a1M5VW1KS25QdzVadjFLNGRrSGxHOVBOUlRhbjYvcGZ2STJVbXJmY2RZQmVB?=
 =?utf-8?B?Q08rd1R4dWV2NGFsZ1ZEZXpXbHBOWGhxR1RFajF4bTNMTWpVQXQ0REZ0dEp6?=
 =?utf-8?B?d2R3TnRjcm5wVUVYemJmc3JYTzBWZ3hBS1d2bTAzdkZMd1pTbXFWQkpxZElx?=
 =?utf-8?B?WHVNRmVEUWp3SlkyeXV2SUt1SXVXMGl3VVBkeDI5cEhSQWg3aDFCYnNnREM3?=
 =?utf-8?B?anc0ZEc0bkRWZ1h2SkdJOTRWcnJXMG9yZVJ2OUtnbmxITW90dGRhK2ZQWUhl?=
 =?utf-8?B?Q2RYbDBPM1NxOFRGMVRidWNHTk95ZVBwOWJqRHNHSU1qa0F6bGZQQ2k2TTlD?=
 =?utf-8?B?Z0VwQWsyaXdJZHIwYjJWaHFXSXIvM256SkpYcEZNcVlaT0lUdmY4Z29ubFZU?=
 =?utf-8?B?enBhSXkxSnVFQTJNaGRIRWJzTXRIVGhBRHFRMFM0RTBOa1dkWUZtTkNJb3I4?=
 =?utf-8?B?a3hBUFg1dFh3cm9zaE5GSGkwRXl0am9tVEFIaUVFS0NGM1BHaGpQK3NqWTlt?=
 =?utf-8?B?aHJFVnhpUW00Zy9iQjdxOUwwQlZwYTVtWFdKaWk0L1QxMGx1ZWgyb1NTMnZV?=
 =?utf-8?B?RitsMlVYWk1wMUU1U0Y5d3hVMUt6a2RsbndEZTgvYkl2cm9ERzkzaXpBSFRW?=
 =?utf-8?B?Z1FNZnkwbU8vMG92Z3A0bU5wUHI4cmt2dk9DTjNqZ3hlY0JyUWV4dDhYaEk0?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 593c39cb-a01a-4d54-9224-08de1c7da08c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:11:42.5116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2J/8eFMf7RnZ2ysAEtxIeIZWXg8cFTXTZ3QQB1t2CrscB+o9J5ZQpCCWNNAgZuVLJn7mjbZWgCbdAHVW1SGpXvTw6Nh6PiqnyvaBK55SpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
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

An upcoming change will use GuC buffer cache as a place where GuC
migration data will be stored, and the memory requirement for that is
larger than indirect data.
Allow the caller to pass the size based on the intended usecase.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_buf.c | 44 ++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_guc_buf.h |  1 +
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 4d8a4712309f4..3ce4425001303 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -13,6 +13,8 @@
 #include "xe_guc_buf.h"
 #include "xe_sa.h"
 
+#define XE_GUC_BUF_CACHE_DEFAULT_SIZE SZ_8K
+
 static struct xe_guc *cache_to_guc(struct xe_guc_buf_cache *cache)
 {
 	return container_of(cache, struct xe_guc, buf);
@@ -23,21 +25,12 @@ static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
 	return guc_to_gt(cache_to_guc(cache));
 }
 
-/**
- * xe_guc_buf_cache_init() - Initialize the GuC Buffer Cache.
- * @cache: the &xe_guc_buf_cache to initialize
- *
- * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
- * indirect H2G data to GuC without a need to create a ad-hoc allocation.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
+static int guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
 {
 	struct xe_gt *gt = cache_to_gt(cache);
 	struct xe_sa_manager *sam;
 
-	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
+	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
 	if (IS_ERR(sam))
 		return PTR_ERR(sam);
 	cache->sam = sam;
@@ -48,6 +41,35 @@ int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
 	return 0;
 }
 
+/**
+ * xe_guc_buf_cache_init() - Initialize the GuC Buffer Cache.
+ * @cache: the &xe_guc_buf_cache to initialize
+ *
+ * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
+ * data to GuC or read data from GuC without a need to create a ad-hoc allocation.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
+{
+	return guc_buf_cache_init(cache, XE_GUC_BUF_CACHE_DEFAULT_SIZE);
+}
+
+/**
+ * xe_guc_buf_cache_init_with_size() - Initialize the GuC Buffer Cache.
+ * @cache: the &xe_guc_buf_cache to initialize
+ * @size: size in bytes
+ *
+ * Like xe_guc_buf_cache_init(), except it allows the caller to make the cache
+ * buffer larger, allowing to accommodate larger objects.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_buf_cache_init_with_size(struct xe_guc_buf_cache *cache, u32 size)
+{
+	return guc_buf_cache_init(cache, max(XE_GUC_BUF_CACHE_DEFAULT_SIZE, size));
+}
+
 /**
  * xe_guc_buf_cache_dwords() - Number of dwords the GuC Buffer Cache supports.
  * @cache: the &xe_guc_buf_cache to query
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
index c5e0f1fd24d74..e3cca553fb004 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.h
+++ b/drivers/gpu/drm/xe/xe_guc_buf.h
@@ -12,6 +12,7 @@
 #include "xe_guc_buf_types.h"
 
 int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache);
+int xe_guc_buf_cache_init_with_size(struct xe_guc_buf_cache *cache, u32 size);
 u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache);
 struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords);
 struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
-- 
2.51.2

