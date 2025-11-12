Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA9C5491C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 22:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBB910E1DC;
	Wed, 12 Nov 2025 21:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="WmGboi+h";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HcLXl3tx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B06910E1DC;
 Wed, 12 Nov 2025 21:13:09 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ACLCFGd014704;
 Wed, 12 Nov 2025 21:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=oFc23IXnw44mwHugmw
 a49+ZsfJuDbwakgvZjUGij41U=; b=WmGboi+hg5/rjCl5RJkERTVRrq7P8ZysVw
 cggxAazM7ECamkGZtxnr2YZzOb5y4hQAAqsdKtfrqxTRYrlEBcEb8+UlXlviQ3pM
 tHvn0K/rJ/YfmwHVm8FZ+PM2/15DUyy8pBfaaLYQ6CdBxSSDavpY0anzLLETVXd7
 1/Gy9wUc/faoP3ylWk3DVcfYkYm7jGgqMWKYfoZp6/IswazhzBy6LUsc1dAwu4YG
 OzXYNeBi90ZQPnfB+DW7WCpNafHo/O0jnzjjCDlVrnxjrgPfShlXiTj/iFA3SvOB
 Kcv/B4W88VjUkj/XpiYMU1QLC1Bm4PprCnjvGzVwS7pl2+UrnD/Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acyjt8ah1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Nov 2025 21:12:52 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5ACJpNZP032539; Wed, 12 Nov 2025 21:12:51 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012006.outbound.protection.outlook.com [52.101.53.6])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4a9van0d4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Nov 2025 21:12:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTL14h0KBRqERhnAJMEAfEP8l+iorb4fodFbaA+DOVleaCRTRs9U9KNBYa/EZ8c0uTMg26ZMQkQuohfABoXEjOANs80A2pnzONkB6RQzN7jq9wtnizIja8ZU2CMfVFm7n+MRRFLBpuwQ32F5x3/yPPcS4F2CEBPTCLKkBlxqWqnl83TGYmnVIvwtlzt0xG8gIaXOzT2WriLFKKeAtBUR2WHUaZ/WvcqUtwUTRtwzJuN2A2I/q6GjIa3A1lP6lz/6KckT+0bFY4WUE2gWMTW0Zwr1NaGwAJIINEtIkKKLwwk754kWvho3lILPwz3zpk7dL7+BRO3Q0bSONKOxAtaz1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFc23IXnw44mwHugmwa49+ZsfJuDbwakgvZjUGij41U=;
 b=BXSGt2AMMdR6YNFRfafk4vCy6cVcoMZ2YSe8QU7Ejxyet4cQCUQ+K2o7RaBd4MA6cuNGP1r9NPntJ2FTJTOEZxYUg5g2NrcGWaZ8zV9ibkin70JF9OV5KRDR0gnnCHL0RPENRPX/plSveCG1bbS2J1X0LgjaoiK+XKVscSP488femUtCCLc0tj72nj8NsMr/pS2XRGNzKdX3TGxUuz7MwlnGvZcwAztgAJzcb8ABDgKh71BxKzSV6ZjqXVnnR5weTqX/Gij2CuaHZCA4psXwcwFJ19AJASRLBOkf2oHq70LFGT4brbWGwF3Y0m+vj8sA+fIcdy0qYVWWWTP5k3Yyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFc23IXnw44mwHugmwa49+ZsfJuDbwakgvZjUGij41U=;
 b=HcLXl3txHv8w2o3gIPaVTYKvNwprNSwFXK0EGmkqJ1MjpjOPB6rpp65OjBpAA14nvngbH7H1ywGHLChcbefwklB7RP+0xevKT8cXLGpQMsWEoJ9/Gy/tlAHqojnjXREBBw45S8KqUyF5+qapEsipu1oCsmASDFZK7LFsyUbVnJM=
Received: from DS7PR10MB5344.namprd10.prod.outlook.com (2603:10b6:5:3ab::6) by
 DM3PPFEC98198CD.namprd10.prod.outlook.com (2603:10b6:f:fc00::c55)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 21:12:44 +0000
Received: from DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680]) by DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 21:12:44 +0000
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Matthew Brost <matthew.brost@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vitaly Lifshits
 <vitaly.lifshits@intel.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Sagi Maimon
 <maimon.sagi@gmail.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Casey Schaufler
 <casey@schaufler-ca.com>, Steven Rostedt <rostedt@goodmis.org>, Petr
 Mladek <pmladek@suse.com>, Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Sumit
 Semwal <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Krzysztof =?utf-8?Q?Wil?=
 =?utf-8?Q?czy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Rodolfo Giometti
 <giometti@enneenne.com>, Richard Cochran <richardcochran@gmail.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, Stefan Haberland
 <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Satish
 Kharat <satishkh@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Xiubo Li <xiubli@redhat.com>, Ilya Dryomov
 <idryomov@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 19/21] scsi: fnic: Switch to use %ptS
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20251111122735.880607-20-andriy.shevchenko@linux.intel.com>
 (Andy Shevchenko's message of "Tue, 11 Nov 2025 13:20:19 +0100")
Organization: Oracle Corporation
Message-ID: <yq15xbfez2a.fsf@ca-mkp.ca.oracle.com>
References: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
 <20251111122735.880607-20-andriy.shevchenko@linux.intel.com>
Date: Wed, 12 Nov 2025 16:12:41 -0500
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::14) To DS7PR10MB5344.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5344:EE_|DM3PPFEC98198CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 233f33ee-fa8a-44be-e383-08de22303915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iiXBCrx2EDho605CxOedPES+lBaY4f5uLoAn+RnhjXIJ9MVi7GnyFQGQ4VPx?=
 =?us-ascii?Q?YNn39co+u44V84yYepimNv5wI/PLXacpYW93YOjEzqsMSC+2/+qdxuj/augE?=
 =?us-ascii?Q?/j4rGAOA+/quWsgNA06trrE7eG76QBsHUQC6/h32htDTy69zQVDCyZzw0IkB?=
 =?us-ascii?Q?jKdzVXvOIEaJGvUJmH69m4LKLqtJhEU664cugZjn5M8/lRkndVHhzPqehThj?=
 =?us-ascii?Q?nDE1waihofZaBwXPrXOS8JUU6ixlja0n4iN7ohbsYw/S1FlKyefD6GJTNE4Y?=
 =?us-ascii?Q?av6+nH3M3sfCg3ZfcdOyMvB3ci8miR5XFbxY4wVGjD7NFeza3mMNZJSsQIDd?=
 =?us-ascii?Q?fu+sCR1VgPqzWXfbqh899fR9Hnv++XKWtYYzaRR2H9KQlQt7ogkXPkKHhkIn?=
 =?us-ascii?Q?uN2y5muY5oRAHO71DmKnSXEsQDW069gcwQSeeszKtbw5cJaEhQZNrdIJ5tBz?=
 =?us-ascii?Q?fk158R87VNO3YP0RSwV5SDzmWMz1BCkdHItofm0cNZnepi21YLZ6RyKL+3Ja?=
 =?us-ascii?Q?YE4lDyfQiUR+yhNdHvTWRtUsoPQDqHQZDftOujVv+zcVJCewVwbt+L8rBxY8?=
 =?us-ascii?Q?5aiXwZVjfw1Vpz5Eie+QrGw3Fhqbn13d5MM7PGiJ/pu9pKuKkBH9HMBVePlw?=
 =?us-ascii?Q?I8E353uabOHRv0//8LdOAN9PoZlfWBQLg1EtBi0DWW0npW3F9OrQr01ZboM5?=
 =?us-ascii?Q?/XGce+vcVaemgLdYp94YoBB1JH2lMheRWQU6nhf+0v9QNRXMpoNYvCXjNM3n?=
 =?us-ascii?Q?P+0klwGzUAloiKqIHplxFHjacpvqlyFZMp3ZCLpAq37Y7EmGkbxQWh1LuPw8?=
 =?us-ascii?Q?VzpSEA5rPxvmT6ShCuGGiSemhW9Mi5sBD45SE4eMw9XNbI75t/xeHU3v7EYK?=
 =?us-ascii?Q?O45deVBTMn4Gxpx5H12PVkEZbAwFjLvQax7jMhTZhCV1r/DczO9o7GBSTfLH?=
 =?us-ascii?Q?yKdv0a/nO+V+voF2xmQT6Uv2y54TEr74WGsvfawcOa2jHGROLKdaRTX48iYw?=
 =?us-ascii?Q?d/nxH3N25zUQYc5+r50cLp9CyVCEM0Adf85sY3VxZTz6vmvOIFu3fn8vaahQ?=
 =?us-ascii?Q?3dEK6dnChBZWR0nf8MoHbsYO/coRCnYy1mgVEGWduYudSdpEoXCuQ+4gWtZJ?=
 =?us-ascii?Q?6j3Maj4fHTS9noM7UtrC9yL+uUOs4tsCNcg8tihR8qrzghwzBgIVhtOeoBLF?=
 =?us-ascii?Q?tjAddUneKrRsV+vNExUG6W9wQUzMk/jtHVaudtwI50DIJNRfp0QsAemIf5VK?=
 =?us-ascii?Q?ngXpbQXP5LLvHJRES5ltEi/glMtCIeRH8pVpFC8dtAkNJKq1cjp0W/64baB2?=
 =?us-ascii?Q?uJFmiBHehrJMazJsiEMSd/VhkK6pHg5C2ZYLgGV5epf7u2EaR5gIBYW4850m?=
 =?us-ascii?Q?3zJlI542xOwgvSGhy/e4R2x8EFq1e4QBkhlxS+F5zze5/xYg6YQ6c6irJnXl?=
 =?us-ascii?Q?+kdeQuC59bcYmCrP1XYpwkOBXusPI/Ei?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB5344.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fpNeLao9wOcc9UcxMat6tJjLJ6HLXKAJ2M93kYvO78iQ+MyfVE1BPB1MPj1j?=
 =?us-ascii?Q?IPiGKfy7FuhLnmTvcvrfZCbzFI+22yJKRLOogrNsHB2jl++H/ARg/n7pg3eY?=
 =?us-ascii?Q?ZHupo2vGe24sfB7KDKTCyh9BrZwJnoJ4qB3haENoWkpKpD//Ef2kTbwQyCGF?=
 =?us-ascii?Q?LfkaTLobnB64iEP/JHjtmDAXoB6EMk+7Uf/fQ0p7bjcQIToCQcy+qa/algy/?=
 =?us-ascii?Q?p2pGDCjvOn3LkF2zXFOxn6KdijEpsJMAlmjAJFFL6EEthx4RwSuVR2X3ne/X?=
 =?us-ascii?Q?mwkg7lTToFxhgdg7BfqoAQCJryjy3JM6lNaCs/wCDKFiWsfhB8fVS2eau/no?=
 =?us-ascii?Q?MzwCC0225J83MVYtmGI3XnTIq2qqQCw8qXfc4VoICEaT2VhotB34WC+E8L8j?=
 =?us-ascii?Q?FyYaoq2U/taGTIWnbwE2lceCBtYFYwQAzkNinAMzheAyy5JjMQ0s8vBfP0Wr?=
 =?us-ascii?Q?qmDjS1X27cG1qtYbuToURxjQM3L0Nj8tGBFtfHzuw+IIITTkN/IH2TVjY7zm?=
 =?us-ascii?Q?EW940pR/dd1F8V4er0VWf8M0WcAEnFVlV0ibabIXvgna45Mxgbd0qDFZCg7L?=
 =?us-ascii?Q?L+x/npbeNwQRJjsZwPxOOApHdu4x0nPh724toWP8QbWd4eTHjLu3ZD69lhak?=
 =?us-ascii?Q?fkg7QwqvrbaE/OylAn4r5N7HsjyKeqDDdLG/U0+AZNJsF805Th3oqaV6s1ed?=
 =?us-ascii?Q?YhELFPqKDiuQ/m0IyPia6Sog1YT7dkTk3whxj8+ZWdm31os/AM9S0jySWgwr?=
 =?us-ascii?Q?dp+7/S/jbgViMLKV5NoG4rLXp4WI4BlRW8mFmm38eQutqPBy5qY0qXCorI8h?=
 =?us-ascii?Q?FTEbtckWNBScIo9iy7En5vBVRhqNjVOkkKLeTokxKVqeMa+Ywc4Burh0ef+f?=
 =?us-ascii?Q?bW31DvCqqDWXumSayqmwJHELDLtvEVrEl3dfb7y0p6YKyK0v5uBmWLlNrYd8?=
 =?us-ascii?Q?n9wVZre4fMA4lqT/x0/r9LL11UyIfXl4vlZOnFwLGLZvgLL4jZB/qWv4/cLF?=
 =?us-ascii?Q?lw2Z22JpHEn6Ts9Nai14yjmdJ3aayXjmNVQ6wG4oy7eqYvklZvybd96cReYl?=
 =?us-ascii?Q?BszBMOqTECOobchqEq4sySCeorssEEeYK8imF55Unbg8LwGA3O4MC8FVctFe?=
 =?us-ascii?Q?qQpUXu3MFfqwV2P9Ki0aGYiJTOFMo+0o5BvE+j9xq+EyhKQ69hUrnwfvDh/R?=
 =?us-ascii?Q?o/DkV2X1DOwWAqpRCACmGaHOjLOuvKrTn1plHnODNmG1a71ibwInevmzmoW6?=
 =?us-ascii?Q?HlADJS3AlsQhgYcSIyan6hd28ldD0Tx51gTTzbrM1ubzBXqE5VliM/V/S+xX?=
 =?us-ascii?Q?c/Xz6j4Llim34YhutMqK76k5VQBhUs/gG4fRrjV0lSojOXVLvqufUI7oyz2n?=
 =?us-ascii?Q?+tB1ypiLz+Xwdn+pT1ujfyrJ7Qh73gV6jnpaTbOg8Sm89oMyzHItAjm0k9RD?=
 =?us-ascii?Q?yrZkQt5HuyLOqxMe/6tJrqPUD9g+ZKTiboeKYNk51iI6vS4q7/JgXGO7+t6V?=
 =?us-ascii?Q?+S8Q4dXwR7dRDKbcz7pl5nNwAt7eRCAVkW48hybA+vn6/mDDpFhCYwHVePlM?=
 =?us-ascii?Q?Td3333WLhqnVIPdWFfoDX/JM262h5XzPIOq9HA0XcSt4+rRhtsJabpjrddEX?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xXARhFWp+LTro4WReyXokogveLuZ2RnHDC4MsS3yWHveooLHjUR2SN7/v5JNH7or4MXtp5pMorFFH5Z315AzaOnQAY3P/iXkWOkYaGveipTZW2akURndiQi6i+2+LAGl5DX9qdGM2tK6BJuhUzx7UueWAr2RDj8bE7iiRkXOdKSJR3U+611llHQORwPkPcr1yQB6RdqR9WihRpqAUA/tKIjrXRS4I9zUggZA1hSDpWit/1qsOlMjb6Hs8Z9heI8ZXkUatB3VHzhqfy6Kcq+SOYmfNUFJkQI+M8eha8KMvB03lqMDDag6y3RaCdSC3zTjifnesBKyLsDTwypVG21NMo878I/I/vmmCRfC/OYxjTrnGCjOS3OVwFGEiVqNqlzCBkS/dsWFDJEegpfVoR0RBbkFlQs32abPd3Z2rn7KwzTx79UlUpOnZJ1K/l+KQ/27nLSVZ0vwqguQLJoMhnCZe6wK4s0Ice4qjeQN23tVLJZZUX6lMKcaWawH1V2a8McHExipnVvB1CrOksFicZmPlZUAkJ59b3OiA67t3Qg+m36zFhfSOZw0jm1NYPBv1+XpGO94LtWMOuhHh6h9JLXNZ5St20M/Ju+F3kEIhJh15aE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 233f33ee-fa8a-44be-e383-08de22303915
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5344.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 21:12:44.6032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhbHGcdDMfPmngAwkjC62hToszsrg5snPos907vlZdhC7w3tC8GF6VnK7tGUv38yVW5Zsc4EgfVR5DeS0yMANMGvGphjrAE5wo8Swatfq6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEC98198CD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511120171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE0OSBTYWx0ZWRfX6Im7l94XKZoN
 ITX0DL4GCKeqGd4iWtCa2+LdgNbpDO1OU3Qu1rUzJ+JSMAdwUaNph2dY/ku91+JE8Gct+MEDjvv
 ztNwenn1jCTfa328IBp8caO3KdoxAez0WyvzLm5wCwYphu4mVnvP3aqwzedktpYyOhNZ0WZL8lI
 e4hM1JF6OlRRpKuwW90W1ZZt0hZ8JbnrdpXRKP8Dl8EE2m34NH2jHPlDWquXzq+4LCioNdjERuE
 0rWIE1jO5fSXfqCXAdEEW7k3Pi+30lYPvdeSw3tFhDJJUG/rgRcX2WL8EbahQbdJfAdffIC32Kh
 Y2UMAHCEsNYr7jbbBxTp31Hn6NET+S/CreBweLdtbqUXTDmCoQhKeBbOUAhYQmVtjeLW7MbOw8r
 +OH7UfO5zRekEVRUzYXabWzyv3h/uN3MYJ9ysVzZZTYgRBBSUs0=
X-Authority-Analysis: v=2.4 cv=S6/UAYsP c=1 sm=1 tr=0 ts=6914f854 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117
 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=JNz3O4sEs4oywJvo4n4A:9 a=MTAcVbZMd_8A:10 cc=ntf awl=host:12100
X-Proofpoint-ORIG-GUID: nZbGArbcIOO0OLnFo5zSPZdLTs0Z9zCt
X-Proofpoint-GUID: nZbGArbcIOO0OLnFo5zSPZdLTs0Z9zCt
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


Andy,

> Use %ptS instead of open coded variants to print content of
> struct timespec64 in human readable format.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen
