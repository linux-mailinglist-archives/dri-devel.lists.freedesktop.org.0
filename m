Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B6C52634
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF0410E70D;
	Wed, 12 Nov 2025 13:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdNzflcQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201AA10E025;
 Wed, 12 Nov 2025 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762952967; x=1794488967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s1t14RMylUslqBlw37Wt8bNnQgW7654Cjv1Uc3nqzfQ=;
 b=jdNzflcQO7tIaW8r8M2OMMPyVqy+XSCnVb2kufQ55B8KZopVpGOTcJsc
 yRZmavsPJG1m0C2XcgITmmq5sPmXMEYL2tnHeV+Yztv7q+UTXumQL5qRT
 k9jRcxDnZwB4zIuFlYmVfus26xlxrVG3W5Qk6DLHb09msZlFZ01b2pl0W
 ymNoqwMoGvO2BKX+hAwl8rh5sBSel6EhkPtxJBZTGscgcthupki6sr0GX
 WQGJO09zgWxOcPVJi++cnxfha/12Q3YRM7R2cyZ4RecYiSFyBd1+f+VTP
 BpJT5nbgVioDR51M+OpT8MwdwZTW2zauQSPS5nVmEv4lIzCcTSc4V2zR7 w==;
X-CSE-ConnectionGUID: kb5Xn7GLSKOithXSED2M0w==
X-CSE-MsgGUID: eDQto2WvT96Qvd9/+IjR5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68874098"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="68874098"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:09:26 -0800
X-CSE-ConnectionGUID: I9spMGdfQxO8sjwjbSCWKg==
X-CSE-MsgGUID: GeOyr/wySnqq8WCU1wAeQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="226483714"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:09:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:09:25 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:09:25 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:09:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Me1M2+llsukNlQVMtapgcNar905DX5Djd4DUrdKXDJEkQ3l0dcoS7G7uRcztm6+6aRC//lGaaVJkMCeq1/Dp9xmmEMkqJdaAKFvRHyZQvNDWxe+GD84mdxuum70tz03Rw9a640qv4Ay+RRSeexqtELm58HE/0b08q/dlTCWA6ueslh6YW/kUWQ/5UXUIZY2zR1KhiVFQBPnkA1/CZnufkMXjU+dLeTOKT7msZ66KQx5yTfbtPc3T+wWT0RSxYlAFpaFsq5yZMRA1V40d8kK8/0kINwVYL4VlAJeegmWxfKtzPHx67KfVGrUTBku6pOpYcpkzA5X9Zfwb7xqM6z2MNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bT0KjzX+4ByZ94zp+97WAStB21qHgQ25wZiCWk7jsyU=;
 b=N6bg/mZoonECZhHYn+M8qXPubvFVSHkOFhdOEGQHUbiAGVjYyRYqmbfQDUte8nEdlTriz2BY4cqavZoO9EzCM8wtXSvtMGSAq/vpum5dOPMugT8Ip/2c+wSXN0WPNHCydkEeSwRYgt8in8SXhIu8xjBynujOOEK2bn9iL9jMh2caSrVJUNgqP/elakX6u/i8ZsZOJOlrXTFmOdzRhxEAAEexFkYfsoZBb/xSQmSAKp9wFLTxVfRTYNBiEIA9u9Yj4szb5GNkbqhVM3tBz2/dLSRC4aCRMnn6lu1NnKQRjuFnswUWDLDjnZ+K0Gd3IGc0SWv8/TgvYfccJlg53iCuYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by DM4PR11MB7280.namprd11.prod.outlook.com (2603:10b6:8:108::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:09:21 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::395e:7a7f:e74c:5408]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::395e:7a7f:e74c:5408%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:09:21 +0000
From: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Corey Minyard
 <corey@minyard.net>, =?iso-8859-2?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, "Lifshits,
 Vitaly" <vitaly.lifshits@intel.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>, Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Karan Tilak Kumar
 <kartilak@cisco.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, "Casey
 Schaufler" <casey@schaufler-ca.com>, Steven Rostedt <rostedt@goodmis.org>,
 Petr Mladek <pmladek@suse.com>, Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "intel-wired-lan@lists.osuosl.org"
 <intel-wired-lan@lists.osuosl.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "linux-staging@lists.linux.dev"
 <linux-staging@lists.linux.dev>, "ceph-devel@vger.kernel.org"
 <ceph-devel@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>
CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Sumit Semwal
 <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?iso-8859-2?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Nguyen,
 Anthony L" <anthony.l.nguyen@intel.com>, "Kitszel, Przemyslaw"
 <przemyslaw.kitszel@intel.com>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
 <kwilczynski@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Rodolfo Giometti <giometti@enneenne.com>,
 Richard Cochran <richardcochran@gmail.com>, Jonathan Lemon
 <jonathan.lemon@gmail.com>, Stefan Haberland <sth@linux.ibm.com>, "Jan
 Hoeppner" <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 "Baddela, Sesidhar" <sebaddel@cisco.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Xiubo
 Li" <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: RE: [Intel-wired-lan] [PATCH v2 14/21] net: dsa: sja1105: Switch to
 use %ptSp
Thread-Topic: [Intel-wired-lan] [PATCH v2 14/21] net: dsa: sja1105: Switch to
 use %ptSp
Thread-Index: AQHcUwavxa5ViKTMpkSfa46Bt45l6rTvBP2A
Date: Wed, 12 Nov 2025 13:09:21 +0000
Message-ID: <IA3PR11MB898682C2F9484C7DFAA9BE00E5CCA@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
 <20251111122735.880607-15-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251111122735.880607-15-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|DM4PR11MB7280:EE_
x-ms-office365-filtering-correlation-id: 15725d75-b397-47a6-3cf2-08de21ecb1ee
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?9bmldDxBbYpiusBFFKjfq5mv5PrwJ2UV36xj7sEFcrMMtF1pdTPNgKDHDo?=
 =?iso-8859-2?Q?RA//A1kCLPruqLcoy62KJb5ADdIjLacJiyl9fwg+Ay23C2SpmW5u0nDY1Y?=
 =?iso-8859-2?Q?PjaF8yYPOXd7bhls7lcl553wmo9MV7GskjKEZf866eHAi6/Wmf+4LfxZqG?=
 =?iso-8859-2?Q?etOOBx51ogzuaeXGqjpfUCro6zjQ9uLAtk837F5jmeK8veWrkuErAEVWO0?=
 =?iso-8859-2?Q?1z8NvVvj0bPrYpxRzTw1DBEgnQJOKuMDo9PM7eVWoxAdAojS8RM2haqROy?=
 =?iso-8859-2?Q?RvE+GOAKrIACXo7ypfdSxU/ck/iVaIonXmgCkfUMBbb3Cs8uaMEjOA2twm?=
 =?iso-8859-2?Q?mSbGT1NVekp5JJW5qYels+R0Vznf0fGUmKbzJ9HND6BPM4tYwmkzFXCMj1?=
 =?iso-8859-2?Q?swlkcO++7IbjoFru9Ts6OprdUxVlXzex854omnHN/pRRqVrJPW8/ofpTQA?=
 =?iso-8859-2?Q?RMOT5kOvq+j+LMW5HhBi+o8Mi/dM5dPldS0VzMcPNQrb3YcvD1ha3iJyyp?=
 =?iso-8859-2?Q?s6gUr3nw5CFSqd0d9hjix2aK8xYNWuLmNvu7BiealtiQi5ImfvV/hsoxsC?=
 =?iso-8859-2?Q?PLsCZW9yskMiWsB5//D6YAV5JNhBs7tNn2fEj+HPdM8oT1IBvmuiQdUHsI?=
 =?iso-8859-2?Q?VykA7XJaep+NMlNNsuSgkleDXtRGYN5wAi73e9fBrkk4iXYEJDxUTAsSPm?=
 =?iso-8859-2?Q?0xrBSIky4Bwwf/4mic8QiaPQelOF/M8rTHD2peGehcgRckZgL0/SXVQitU?=
 =?iso-8859-2?Q?S9H7g/YpRa5grw5V78X091wYUZ7Z/vjgYBoijMMXXi1uwjfhENZbSV7i6b?=
 =?iso-8859-2?Q?NLH994gpU82x30m0HJ+uyxqBqaQumt95X5fsPmmhBWveNgJcZ2BLSDTKtA?=
 =?iso-8859-2?Q?uhyetchkXq4QW41/YCTG/o1aXE/9w+qWNxZzcvShCNPAkWsnk3nBh3dsXF?=
 =?iso-8859-2?Q?N7dz5SXMcseE3v7CXiOcVRAldz9+6uEY0k2JrxVnS3nk3aELkSW+IuXKph?=
 =?iso-8859-2?Q?i+pje3hlxjFUOoMUSA+kp9qPwbOrHZTz7yWveju9qLufx9PXLAGJCKMYxm?=
 =?iso-8859-2?Q?dzwvhKJBzWNIFLrh3wnbKKtt3W/6fbtK+DGuU093l8RWL+H5PnyfV/r4Jl?=
 =?iso-8859-2?Q?LnYmTtGpHp8vE/6eNXRgdGgnDCYYHfnmXRLCW7n1fZKpKy6M/bK4CAch6N?=
 =?iso-8859-2?Q?dlHJZvvcbTkeVxxlRYLYOw3Miuzs3aXu5yLDOrVdr0pNLw18Vjy0NSO1wd?=
 =?iso-8859-2?Q?lkg2JIEZCmcRQRaRI1DCj+ddRkpF1cJWw4kAcwmAXPGxC3yKzTMhYiXJuw?=
 =?iso-8859-2?Q?/gHZXBsQxBRIpcgfY5SUFldPUjdNVxY17bAw1SwbQkxsr39js+EJXc9527?=
 =?iso-8859-2?Q?bHn5RC/qZPBUZEOw6zRNB/nQCaXdgBjYURBoKRgtuGpAIj7hwUGX9uhq6m?=
 =?iso-8859-2?Q?nA49rmGFnywohbPBGGJUisjkm1bJ+diJRO/zjoyMNFpNuxQSXV4PQiqavw?=
 =?iso-8859-2?Q?UUuIc0oXFgVglfRnCXiIj2LeSYS+hrk8QDoKsENivrPZz4/e4e4yAHg8DM?=
 =?iso-8859-2?Q?brZkLDi2GiMkFlpuTEfIUZrwbbbro/ihYlwC2R8201zbnNMACA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8986.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?W23gpgaQXH7ZolnB1jvSYX3M+W0yfZAJZvjSkZH/j06/B9PHQVw2CqpcUj?=
 =?iso-8859-2?Q?UGPKy7q+5rQhP1OfbZPkAWjDA9na/TyXdyBKkElB/aQm9fsShnS0OuG3wn?=
 =?iso-8859-2?Q?yJjTPm+9asEodSiDhNmjua5Lm8ggKogRp0gg8F5OpPN4GCy7ahkx9bk79q?=
 =?iso-8859-2?Q?3NlAjD9LWL2PtmY8tx3iSrTBonaO9dPw1Oen55Xi3Xu4ng/NAb0+svzBKm?=
 =?iso-8859-2?Q?YLV1coeUd1PrtnNkptooLvelWs3wQFIxvi+/Fjy+GfOl3RS0H1Y/b/DXsc?=
 =?iso-8859-2?Q?HZGcRiSdhQ3lOdHir5k1AuO2fiPCUmwxqXd97IdDm83wgMVinyK87jJizy?=
 =?iso-8859-2?Q?5h7chM7RHsMPjrNHdTLyJucmkjdPYJ3shShvWnSO3c5wrpy7XDRZdw34VP?=
 =?iso-8859-2?Q?MwmmXpyPwkEkiJ7hbw0kXWKelqFTiq5GdiJ9xuImSpkmVthcfHLFFEgyVI?=
 =?iso-8859-2?Q?d+c94n0PPpzNdscJZweYFLRJtpJvdzbLFtxzxCKUFuPD6RJRZlxKGZP+HO?=
 =?iso-8859-2?Q?L4VCbbRnPP2wAzCV1bq92jTIIFGlG7TnNHB1v6FB/lazBzpbapHj+YejVX?=
 =?iso-8859-2?Q?9olpYHPsCLdRWcfgkrIDifH+pY7EcM+dFM6Qi2vgrOqQPRKU9xzdaORXmR?=
 =?iso-8859-2?Q?Uw3KUHscqobVc+F27Z8If2ZMq2NbeYgYLzErmZEuXq5Xl7l5kWKDIZoCUe?=
 =?iso-8859-2?Q?7VCeEhMhH1r9Csx7zpVPJCGmaazKNoHYRCpcUn1yxITffiZR5DruFaRVxl?=
 =?iso-8859-2?Q?jCGwEFcazMZ352vWbg4dz+1sC8eE2TpoipZr7sRIES27UcnEYOa+6A1fHT?=
 =?iso-8859-2?Q?W1umPuagaSYB6a0zTH9VdrVirsirv0QxHv8cHCSqiQd/9JS3tbCt3z4OHL?=
 =?iso-8859-2?Q?HNuHUbJ3guobNmYXowdV+3N9uGQGdfXgrVYfU1n2XwPkvVS6Tz5GGu9eAN?=
 =?iso-8859-2?Q?dk5Cc8SVkpRMM0S+E2hHFe9ijdKs7svC1hMGjZ2OfCCsNuHYg9/kevlU4R?=
 =?iso-8859-2?Q?2mg+EB0dXInfp14Xv9NJ0xVG50axF2nreZBAu74BgpygkGD3CZF0qhL34Q?=
 =?iso-8859-2?Q?7eMNkrSoclrElPAe6FuAx+GXctU8XKJ9l3TeP9asYevbHVp1x6gvsCdS5m?=
 =?iso-8859-2?Q?ECBYu87ZojErNwd57iNKxX8Y6in/N67YKBMkNLyTW6mo+yd0IClTe1a1PO?=
 =?iso-8859-2?Q?zJzcWOgNzhGkA/Z71BiKTVFBexJiE3gqr+aj0ZD21D0XK4PRnHbgEVxfpC?=
 =?iso-8859-2?Q?evQeTTWeHaK50Q+Ax7rsfbPpoIbhOR/RhO4ZUsSILJabh3NcxmzLilXliL?=
 =?iso-8859-2?Q?gCHvvRRZFjzCXO8uCNvP2ZgCdksWF6F/lLYdsPgcOcNJ/R3QNE3jNqxxE3?=
 =?iso-8859-2?Q?sCvdaetpOkXMm6RPGvHmyJZYqlvP1CQxZnbDl6mAI3/7/kTtrGrMzOVtav?=
 =?iso-8859-2?Q?+9cirMHqjOzYKB/edjU0BheV8Ru3Bh/fuFcqO1ywRuzkbgG2321pzV6+nS?=
 =?iso-8859-2?Q?2lW1sZZkIZ5mOEKWIgkHLONV2lbIWEg2UK6ipn/JQ2XRyWQMxd2kqWk2aB?=
 =?iso-8859-2?Q?Jp5UodtephQNdCQSeNIBBSh38bPuofC9c0XlHnAVY3WjV/+i5FrEnFQrkw?=
 =?iso-8859-2?Q?ZrJzR5B0Da5InWn1kKVB7DF84BVyQa3pBvhBB2GlZA3tzRQZ6yaUIoIw?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15725d75-b397-47a6-3cf2-08de21ecb1ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 13:09:21.3920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3fA6UKAJLbL5WE8NCjAxyZp0HwMbh5xUVUi71H4bICbYp1q2LtHkkHk8UnwCWd8ikvz2LTNqrFpcIp7IkNR3pwrX04L0FxUUXqofNglRvTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7280
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



> -----Original Message-----
> From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf
> Of Andy Shevchenko
> Sent: Tuesday, November 11, 2025 1:20 PM
> To: Corey Minyard <corey@minyard.net>; Christian K=F6nig
> <christian.koenig@amd.com>; Dr. David Alan Gilbert
> <linux@treblig.org>; Alex Deucher <alexander.deucher@amd.com>; Thomas
> Zimmermann <tzimmermann@suse.de>; Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com>; Rob Clark
> <robin.clark@oss.qualcomm.com>; Brost, Matthew
> <matthew.brost@intel.com>; Ulf Hansson <ulf.hansson@linaro.org>; Andy
> Shevchenko <andriy.shevchenko@linux.intel.com>; Lifshits, Vitaly
> <vitaly.lifshits@intel.com>; Manivannan Sadhasivam <mani@kernel.org>;
> Niklas Cassel <cassel@kernel.org>; Calvin Owens <calvin@wbinvd.org>;
> Vadim Fedorenko <vadim.fedorenko@linux.dev>; Sagi Maimon
> <maimon.sagi@gmail.com>; Martin K. Petersen
> <martin.petersen@oracle.com>; Karan Tilak Kumar <kartilak@cisco.com>;
> Hans Verkuil <hverkuil+cisco@kernel.org>; Casey Schaufler
> <casey@schaufler-ca.com>; Steven Rostedt <rostedt@goodmis.org>; Petr
> Mladek <pmladek@suse.com>; Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>;
> Max Kellermann <max.kellermann@ionos.com>; linux-doc@vger.kernel.org;
> linux-kernel@vger.kernel.org; openipmi-
> developer@lists.sourceforge.net; linux-media@vger.kernel.org; dri-
> devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; amd-
> gfx@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> freedreno@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
> linux-mmc@vger.kernel.org; netdev@vger.kernel.org; intel-wired-
> lan@lists.osuosl.org; linux-pci@vger.kernel.org; linux-
> s390@vger.kernel.org; linux-scsi@vger.kernel.org; linux-
> staging@lists.linux.dev; ceph-devel@vger.kernel.org; linux-trace-
> kernel@vger.kernel.org
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>; Sergey Senozhatsky
> <senozhatsky@chromium.org>; Jonathan Corbet <corbet@lwn.net>; Sumit
> Semwal <sumit.semwal@linaro.org>; Gustavo Padovan
> <gustavo@padovan.org>; David Airlie <airlied@gmail.com>; Simona Vetter
> <simona@ffwll.ch>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Dmitry Baryshkov <lumag@kernel.org>; Abhinav
> Kumar <abhinav.kumar@linux.dev>; Jessica Zhang
> <jesszhan0024@gmail.com>; Sean Paul <sean@poorly.run>; Marijn Suijten
> <marijn.suijten@somainline.org>; Konrad Dybcio
> <konradybcio@kernel.org>; De Marchi, Lucas <lucas.demarchi@intel.com>;
> Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Vladimir Oltean <olteanv@gmail.com>; Andrew
> Lunn <andrew@lunn.ch>; David S. Miller <davem@davemloft.net>; Eric
> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo
> Abeni <pabeni@redhat.com>; Nguyen, Anthony L
> <anthony.l.nguyen@intel.com>; Kitszel, Przemyslaw
> <przemyslaw.kitszel@intel.com>; Krzysztof Wilczy=F1ski
> <kwilczynski@kernel.org>; Kishon Vijay Abraham I <kishon@kernel.org>;
> Bjorn Helgaas <bhelgaas@google.com>; Rodolfo Giometti
> <giometti@enneenne.com>; Richard Cochran <richardcochran@gmail.com>;
> Jonathan Lemon <jonathan.lemon@gmail.com>; Stefan Haberland
> <sth@linux.ibm.com>; Jan Hoeppner <hoeppner@linux.ibm.com>; Heiko
> Carstens <hca@linux.ibm.com>; Vasily Gorbik <gor@linux.ibm.com>;
> Alexander Gordeev <agordeev@linux.ibm.com>; Christian Borntraeger
> <borntraeger@linux.ibm.com>; Sven Schnelle <svens@linux.ibm.com>;
> Satish Kharat <satishkh@cisco.com>; Baddela, Sesidhar
> <sebaddel@cisco.com>; James E.J. Bottomley
> <James.Bottomley@HansenPartnership.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>;
> Xiubo Li <xiubli@redhat.com>; Ilya Dryomov <idryomov@gmail.com>;
> Masami Hiramatsu <mhiramat@kernel.org>; Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com>; Andrew Morton <akpm@linux-
> foundation.org>
> Subject: [Intel-wired-lan] [PATCH v2 14/21] net: dsa: sja1105: Switch
> to use %ptSp
>=20
> Use %ptSp instead of open coded variants to print content of struct
> timespec64 in human readable format.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/net/dsa/sja1105/sja1105_tas.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/dsa/sja1105/sja1105_tas.c
> b/drivers/net/dsa/sja1105/sja1105_tas.c
> index d7818710bc02..d5949d2c3e71 100644
> --- a/drivers/net/dsa/sja1105/sja1105_tas.c
> +++ b/drivers/net/dsa/sja1105/sja1105_tas.c
> @@ -775,9 +775,8 @@ static void sja1105_tas_state_machine(struct
> work_struct *work)
>  		base_time_ts =3D ns_to_timespec64(base_time);
>  		now_ts =3D ns_to_timespec64(now);
>=20
> -		dev_dbg(ds->dev, "OPER base time %lld.%09ld (now
> %lld.%09ld)\n",
> -			base_time_ts.tv_sec, base_time_ts.tv_nsec,
> -			now_ts.tv_sec, now_ts.tv_nsec);
> +		dev_dbg(ds->dev, "OPER base time %ptSp (now %ptSp)\n",
> +			&base_time_ts, &now_ts);
>=20
>  		break;
>=20
> @@ -798,8 +797,7 @@ static void sja1105_tas_state_machine(struct
> work_struct *work)
>  		if (now < tas_data->oper_base_time) {
>  			/* TAS has not started yet */
>  			diff =3D ns_to_timespec64(tas_data->oper_base_time
> - now);
> -			dev_dbg(ds->dev, "time to start: [%lld.%09ld]",
> -				diff.tv_sec, diff.tv_nsec);
> +			dev_dbg(ds->dev, "time to start: [%ptSp]",
> &diff);
>  			break;
>  		}
>=20
> --
> 2.50.1

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
