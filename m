Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B73BDEC00
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5251210E7EF;
	Wed, 15 Oct 2025 13:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="WmybiEOq";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="iykJFMPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C38310E7FF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:26:54 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59FB7taO3250741; Wed, 15 Oct 2025 14:26:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=JQU5usI9z1KwoOiWffC9OE2Fz
 CGAU1NdFLjMTArevE8=; b=WmybiEOqXrbAB7dxmXrH05upEs5WKE0K0cWbVB+Qx
 pDRTxLxxcv+aE5EgOmSNXzZxyQeU96mZLPVoNV1bMxXaXW5jw+Q/iiKxZHRza8mP
 j310ZmtWiEv09+RvTfQ76Y6EpOLWjB5xIU2RbiQ+FjLTbJ8/x1HLVUB+Kwt4tpfE
 5/UtixmqIJA/Cx8HQM0AFKhdKpg7DGN1HhY5yCKP4vAuH5Bf9lrKoSAsN+fZs1ZI
 YRMXPXelX8tTV7kidKukI3HBFq6zft3tisoARAWw0mY5nOmi6oIAk+AriMhfYpof
 x9bH+IB3FotKe3D9kmH9wkDA7bEwOv4BHzlbs5+M7uv4g==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021074.outbound.protection.outlook.com [52.101.100.74])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 49qdgn40ud-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 14:26:22 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9Vsj3iwtLxYwMBWE8533ypM+9O0IsQaof4fZc6lMy3LhbNQQT06UeZ1iT7y3Kol9HRd2At+EwEtXnI//OM/PmMNevN4oGFybVuxWWzePsi7mO8LWc0hPrFzSml5NMLHugUE/sNoesl8BFAp/MFzwm7ZJ0zjkW+AY++ds86VF5H1l6T8yht6CvlKX7luF6Z9kg2Gwt6LH+MMW6VlAVCpx8Vn1QdezPZ/Rwrzu7GQS67y+YODq8vy1tbg6Zvjzh1kZac8c4t5DuKYXL/INQEx1zpKhVQRKzZJg556SdISEfWuUtCcxRopoF9LzJ/0U+ob1QenN2Zc5zGgZv/afDpvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQU5usI9z1KwoOiWffC9OE2FzCGAU1NdFLjMTArevE8=;
 b=QN8A6zxR6L6OWUQHDT1qcId1TOogyle1a6tiSVmsVvxYWCNZ+KZj2aUl31/s/jY1al1zsMEstLc2NWE+b2mkpqr/9TuzFvX3YIrBPtWU/f/v1i2QFf06JEu4aujngsF2r2BXNPGDiazis5wkdPNCTxQ8sVLAcwvSVnWOoH3DAeiOfQxHTSVJ2h5u2s7cI3ehmuuEG5bHOFEdmkxdhK4/a7ZiPEEmZuPsuQfPVRAKBYvkCl+xesynif8h1/owfImd/THJ3sh6qkyvNRNzn7SbuCYNwi5SubeaawcSe2hOQn1iv9OUNt68cp8X2wf1Nf2ACMCBHBI0PCJl5hFCIShyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQU5usI9z1KwoOiWffC9OE2FzCGAU1NdFLjMTArevE8=;
 b=iykJFMPSeeCnpANmoRpCTQK23nOB4a1mf+j8GPGPPlST5+1WDFzYGOqcf99U6DcTXK8742nEtsUNOTaHwbyyR15fOWWmamdLtxVeETEkpcEGh7UJ0GFmkQLs2JnzlBVTRYY6Kcf/G35FT2dRjsVFcpIsqfqi+lxJBDNVbopMozg=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB5406.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:286::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.11; Wed, 15 Oct 2025 13:26:17 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 13:26:16 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Ankan Biswas <spyjetfayed@gmail.com>
CC: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "himal.prasad.ghimiray@intel.com" <himal.prasad.ghimiray@intel.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "robin.clark@oss.qualcomm.com"
 <robin.clark@oss.qualcomm.com>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "khalid@kernel.org" <khalid@kernel.org>, "david.hunter.linux@gmail.com"
 <david.hunter.linux@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-kernel-mentees@lists.linux.dev"
 <linux-kernel-mentees@lists.linux.dev>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Alessio Belle <Alessio.Belle@imgtec.com>, Alexandru Dadu
 <Alexandru.Dadu@imgtec.com>, Frank Binns <Frank.Binns@imgtec.com>
Subject: Re: [PATCH v2] drm/gpuvm: Fix kernel-doc warning for
 drm_gpuvm_map_req.map
Thread-Topic: [PATCH v2] drm/gpuvm: Fix kernel-doc warning for
 drm_gpuvm_map_req.map
Thread-Index: AQHcPddILORtGm4VzUKyIFjGte04Gg==
Date: Wed, 15 Oct 2025 13:26:16 +0000
Message-ID: <d01460fe-527e-49bd-a420-289ecbc17999@imgtec.com>
References: <20251015113656.21447-1-spyjetfayed@gmail.com>
In-Reply-To: <20251015113656.21447-1-spyjetfayed@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB5406:EE_
x-ms-office365-filtering-correlation-id: 2dd681ed-ab0d-4ab0-5fa0-08de0bee6b24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dExzdVdSK0JSVTBuckpXcXFreTdVUnJsN0MwTVhhZlR6NFJTNThYVWUrSnVP?=
 =?utf-8?B?VXh6VWZuVjZrYnRSckV4ZWQrcWlJMWwvTm14bWhRY3IyZkNZZ2xYMjluWk5a?=
 =?utf-8?B?Wm1oQUMyN1A4dGkwR000a3gzNkp5elhIYWFlOGhVZm9CbDNRVmtpSVp0a0hV?=
 =?utf-8?B?ZCtSTVJUZjRrcDU4aVNYQThZTE1udWQxODZ2ZkgyMTZRRnhyaEtZRVcvS0JB?=
 =?utf-8?B?UTBva3NLYUpKYmFYUjFMQ3hWRDdUd1duUWtOQWZEb2JhNmY3Y0EvTTY1L0hE?=
 =?utf-8?B?cXdCQktGbG5teGRIdVJjSjNpaWUxT2JjNTdxY3IyeGZsbUdYSU40N3ZwMU5D?=
 =?utf-8?B?ZFpSQTlBb2V6aGN6TG5oMmFidEgxYUwwSmh4Q0l4bU1SUlF3aEdCVVhHbWVT?=
 =?utf-8?B?T3JLdzdxYjQ5NGpXQ0FmM2ZpL0srUVZWTWpib1NibW05RFNEVVNnOXJYTS9V?=
 =?utf-8?B?aTNDMmplRFFkeXhCdnVFcW1JcW5XY0Q5VVFmMWl1VkMrTnJkbFphVEJLbW9i?=
 =?utf-8?B?R0JPNG9wNU1LeWRzQ1dqQWZ5QTVHMTRuSUI2WWhyNUpsQnI4alRNWVd2eDg4?=
 =?utf-8?B?VFQzVGhucHhNM2R5dUZKQzRCYlFhMWFLZDA2MkswQ2UyeEtrVmYxT05ISVRO?=
 =?utf-8?B?WUJrc1k3cVcvR0tiSUZVRG1nVEhBemFZS0NvQkJBMHBYT0piMjI3TmFwQUg5?=
 =?utf-8?B?UG9CY2RTbzdMdGVhWHNkM21rc2gzMXM1NkFHN3M1ZE9QaDFiVDloVU5OYjZO?=
 =?utf-8?B?MjU0cVJENWNXcVhNUVUwZXNhZWxTc2hmcldsQllPeFEwd05sTHVMT1lxckd2?=
 =?utf-8?B?c1VNaVFnNmtuTWRhUEV3aFA1ZE9seWsyb3pnTkMxaENwdHAyMEQ1U0g4Z0Fa?=
 =?utf-8?B?dFhjOW5CaDYwRkl1YzdtVVdjQzFpUm5kR005R09kV3dPNWs4OHdoaGQ2bWla?=
 =?utf-8?B?c1pwZFZaQXNLNU1oSUFQNVU0MHcwMjRWMkkrYmtUcVdsQkVVd1cxM0IzcjdJ?=
 =?utf-8?B?dk1aOHQ2YWp2U0dMUkY4bDJEUTlNWGd1UkZ3MG9STDUyQVM5bEMwck50LzVT?=
 =?utf-8?B?bWxUTUhmWU5PSHI4RXRDb0pLb0l5Wmh5Y2NrRDlpUVY4ZnYwSDhsS1JjV1hm?=
 =?utf-8?B?QzNxbDQwdWlxOHErRzliN0M1dng0eG8wZGwyUldQNWU1TUtIL0MxYU0zRDNi?=
 =?utf-8?B?WGxoNXM0dXFkUlBLMUxQT1JWN1kwWW80TTFiU2lBSjhDejcwcklNT2F1YzN5?=
 =?utf-8?B?U0FOSXJTakpXSElPNGx3S21PL2Z6TUFMRDBtVVQ2VHhwK1h4K0c3VTVMUDcx?=
 =?utf-8?B?cTdoTmEvRXAwM1pYcU54eVhzMkpVQkZpOW0zRnBJVkFwWkxxZmVtS3dmVVdH?=
 =?utf-8?B?VFFTNXRyMHNYWTcvMlpQUk5Pd01HRGtPQytzOXdXSlEvaXg2MEg2VjFmQWRs?=
 =?utf-8?B?eDVoSVRuZlNzUjRXU20yQ0o2OUdYc29iSitGY0dzU0Q0bFljM1JVRWord0NV?=
 =?utf-8?B?WktyZ3c3dmp2Yk9iZnlmOUFXUmZhZVJCUFdrZnk3dFBaazNEU1J0ek9aQTd0?=
 =?utf-8?B?R3VtYnEyV201WXJYOFlTdUcxVVQ2aUxFZVdyN1YzN0d0Sy9yUTMvVE8wb2lk?=
 =?utf-8?B?NUpBTWU0Mk1CbFh6aElOYjNhMHlHYjhwMFRxaU54KzlVenkxNUIzaFRHcDQr?=
 =?utf-8?B?QlZvcDhNN0hON2RhS25BdFJNWGliUkZxUWY5Z1dqeWt3NEtlK0ZpR0VzUFhY?=
 =?utf-8?B?ekk0d1ZFNHBrQ21xRDZHUVYwMzNrSjVsc0VTMjFxeWg2aHFIZjdVTlRNZy95?=
 =?utf-8?B?OEFrTVV6MW1mekNrMlg3V3h4MTVPNjFuYW8wVlpHWk92a3RMMWVhaGZOTjVq?=
 =?utf-8?B?MStVTVFSVnlKN0xwalNNanFZUW5uVFRZZmd3VHIySG51Q2RDZ3Y2VWg3azdP?=
 =?utf-8?B?YUl3ejVhOE1yMGk5R2x6amY5a1J2c01STExFeVZJQnlSZk1OeE5GaXFBT0FE?=
 =?utf-8?B?d3BhVG5JOWlhU0ZrcU9iZTJDcVRDVjVab0xRQVVTU0tTNW5saTFjaFFhUlc4?=
 =?utf-8?Q?E2bDq+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(4053099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEI5Y2xEcTFWSkpyZ2xkSmYxYk5LWk5FdmFHQVJRQVJFTmRGSVFiSlpWOTNX?=
 =?utf-8?B?YkY0QkFXY0NGbFRockdlUWk1UUtVNEc1WFMwZFh6UWMvZWowNER6S3YrVkts?=
 =?utf-8?B?OWR5SVJTYWZCVUl5NEFGaGdCYmdONHZmSElpb1psUGlZdXg2b3E1aWcyU2Vy?=
 =?utf-8?B?dnN1Q3VmcFd1eEoyNnpuNXBmYnh2RW0ySHd1NHV1QkhDVHV6YzhDUktrNEZv?=
 =?utf-8?B?UEZVOHU1bUwycFZKZkplQTY2b3ZUVE9LK2RRcmFsZUkzTVdOcWtrdVN5N0Nl?=
 =?utf-8?B?eExiZWpKZUpxemxHTkUydmlNek9HQ1dxZ2lDVzdGZUNCQVVkR0JZaG53VEFs?=
 =?utf-8?B?bG90cFZsYys3Y3NtSFFETEU0c1VDZXNjZXh4MHlsZGJ0Q3c2blBNVmVEdGJX?=
 =?utf-8?B?cU5EYzJhdGh6S3BzdEZNNlBlTWwrbHlqL2pFeEgwbDhQbzAzYzN5NXZidXds?=
 =?utf-8?B?WUtpMXJKaWtmWGR6cGVlU2RZd24wUkZjL0hCT1BlMm1TZEpHeUNUTFkvaERW?=
 =?utf-8?B?bXZkL2NtakpnVy9lOUZOcDB0VzZHbjV5cmoxTmwySGY4Tm5EY1pPNmFaTW92?=
 =?utf-8?B?MTRIUlU4MC85Znc4MFV0TGlEQjREL1JPT0Z5WFE3M3FCZTg0TW55b2g5MkV4?=
 =?utf-8?B?VFplUTNSWlRZWnB1bUdVS0prWjJENU9DMVZXL2hYODVhNXNDZW9hYmowV3B5?=
 =?utf-8?B?UTU1d0lpNjRtcm1CdlorcEcwSXdNOWEvQmk1eFZObFp6UCtMRkI2eDc1TTFt?=
 =?utf-8?B?dEM1VHdIRndmRE1FRmtnQ2N1YUMrWkxWOEVTUC9ncmlackhUQlBjY3VoSXRG?=
 =?utf-8?B?clAxYW82VWpkWEc4MURPY2Z3dE84WFpuSktDdXNna2R3aElBaC9Td1Jvd1Fy?=
 =?utf-8?B?VUxnRjhMcUMzdE5JbWM4UlBDbE5TMjR0NHc1RDllcDd4WXI3OEFKRlk2Y0dk?=
 =?utf-8?B?WFV5RWhHcTBNNlRCSVhBblNxS0Vwb1JrL2RKdkRUVHNxNU5oVDh2VFJUanpL?=
 =?utf-8?B?b3B6cG1OL243UmljalEzbmNncWhFcG1saXZ5Q0RpSjVzekdOQkxlMUFVa0g4?=
 =?utf-8?B?OGNZSDZ1U1VNdHNES0NEQmM3VGJmV2o2SFlnY2R0VngxS3hVNkZ3bEFZQWdl?=
 =?utf-8?B?WVdnOEtQM09uQkIydll0am1zdlE1NXJMeVlrT09aOU84VVpQQWVOaTA5NXJ0?=
 =?utf-8?B?N1hSTVBHL2FQR0tGNlR5cGs5L1g4Z0hxRVEreU5jK0hhczFKaHdtUjlNNFp5?=
 =?utf-8?B?VTRqR3BEYlF5TDg0bEN0ZThuTllYdlZzZFBOdlRPK0dkQ25HVnFuc3RBdkJC?=
 =?utf-8?B?d1B2NXBYUERTT3dOcS9ZVGk0SlIrWGQ3U3NjcW1RUU5UaHhMWWhEOWhWUzMw?=
 =?utf-8?B?YVhIVDRrdUsrdnhQekNtdDZLdlZzTEhoK2U1MzdsZGE4dTNlWlJ1WU51aHVm?=
 =?utf-8?B?c2FlYVBUNGpra3ZmMXpYUUxDTjhhZWgxa3dUKy9UR3ZseUpFQlA0cG1UcEpU?=
 =?utf-8?B?bkZVVjJhYjVOTTBoNXZoR0hjUHBXdCthS0NqZ0p6RkJWbzg3eTZJQ1lwcVBS?=
 =?utf-8?B?aE1jcXpMOGY0WGFObXNmcTdrak1GU2duL25USzFPRkI5SkpDV0s1MDZBemNt?=
 =?utf-8?B?UUF5WFYzY3hZNVBWbktlaDRjd015bW1NcE9OY1M3RTZSenhkNksrVUFha3ND?=
 =?utf-8?B?aDZUYlRIL1ExQ1VZRXYyYTlVK0pySHMxUUtNMndvU2hSVUd6dXdXTW5wZ0w1?=
 =?utf-8?B?bTh1QUxnTnREeWt4UW42eGZMbnAwcGk0d2RzUW84VjMxYUp6dFQrdmFkK2Ey?=
 =?utf-8?B?RnBxblVtWVhFbWJBNkVWWnlWMzVHWGErV3B3RDhOZi8rcm1QQUtZYm1nSU1M?=
 =?utf-8?B?aXVhclpiOXlnWlltYUJ0OURpQ1ZSNHg2WDZwK0UrdkpqaDAxYXVGQ3F6M3c3?=
 =?utf-8?B?WE9nbmw5WXQwV0ozTVpacUMydGIzL0VoVnlMemMwNDVKdFVBN1V1cEVoVmRm?=
 =?utf-8?B?RklPSnlzai9lYWpFTUtvTHBGVFhoVVBlU0ozZ2hWZWh2M2RsVFB1LzRvOUNV?=
 =?utf-8?B?WFlrL0l5MCtXYjE5VkRCRFI4cFpMKzlSM2YrYzk3Z3haWWM3V3l2YnZQczBU?=
 =?utf-8?B?NjFQcHJaY0VJSHlUTTJuT2oxZ3FHU0ZSaEoya29XQVIrWVZSUFFnVjZ0RlFn?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EIe2OGYpb6MkhXjL3fFGPXBT"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd681ed-ab0d-4ab0-5fa0-08de0bee6b24
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 13:26:16.0708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BmPZ9Fd9djFUJ5RIZ9PaUxnnaJfCCPMNjxYu1t43btooDBliSK9Zn3bfueWc/QAKL8qiTSz9BZol/YnSzOAu/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5406
X-Proofpoint-ORIG-GUID: OEqzh-yb-XUFZso1SHif01lzYRR52JiI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDEwNCBTYWx0ZWRfX8r4E2UHp1iTR
 Ca3EHm+Hm9m4C5A85O+h9Dy3EJmvH8M5jRjIvHpOnChenuCe06Vz08jg/GUrqTEJ4qJ7nzyKtx7
 ColYCM7Gw0bKhagLUpR5Pr2GniNz0Ggpcl6TIKaPoVNcIkj9dFGpU9RoxTg98N243gR/yt87ysS
 bp9YhHk+hnimEdydN5130NRlB0A5D5u8Bo+oWLCt0G+fO9g5sAaCA8QN8z567tGLjpAddqy5u72
 hOl5+KOqKAXKE49c5lmyNrHr4ziEcoHQVdBzJIni68DRZkhm0OyugnkcYz7BVy0NHMDW5Bc7zwF
 Cz6ftyCVDDIFP+cFvb5w5xJmx4BFxZmEoSqV2vjwrzHAI0/JVpPaLikk8xd4bxsouGXX8Bywv+Z
 ZSBJQ2GpQMsLWNo04jCP4hol+ltlQQ==
X-Authority-Analysis: v=2.4 cv=H5PWAuYi c=1 sm=1 tr=0 ts=68efa100 cx=c_pps
 a=4wXkCErZnzjQivPdqypA6A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8
 a=pGLkceISAAAA:8 a=r_1tXGB3AAAA:8 a=oVh64DeYfI8Bqwva69EA:9 a=QEXdDO2ut3YA:10
 a=3nPQxKtFSPMA:10 a=a8BhaC2D4DkA:10 a=xR6xidS4vF8xTFXyV7oA:9
 a=FfaGCDsud1wA:10 a=MP9ZtiD8KjrkvI0BhSjB:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: OEqzh-yb-XUFZso1SHif01lzYRR52JiI
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

--------------EIe2OGYpb6MkhXjL3fFGPXBT
Content-Type: multipart/mixed; boundary="------------3sO0DmnhoYHpGfBtrqJah5w7";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: bbrezillon@kernel.org, himal.prasad.ghimiray@intel.com, dakr@kernel.org,
 robin.clark@oss.qualcomm.com, matthew.brost@intel.com, aliceryhl@google.com,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, simona@ffwll.ch,
 skhan@linuxfoundation.org, khalid@kernel.org, david.hunter.linux@gmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>
Message-ID: <d01460fe-527e-49bd-a420-289ecbc17999@imgtec.com>
Subject: Re: [PATCH v2] drm/gpuvm: Fix kernel-doc warning for
 drm_gpuvm_map_req.map
References: <20251015113656.21447-1-spyjetfayed@gmail.com>
In-Reply-To: <20251015113656.21447-1-spyjetfayed@gmail.com>

--------------3sO0DmnhoYHpGfBtrqJah5w7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15/10/2025 12:31, Ankan Biswas wrote:
> The kernel-doc for struct drm_gpuvm_map_req.map was added as '@op_map'
> instead of '@map', leading to this warning during htmldocs build:
>=20
> WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not described=
 in 'drm_gpuvm_map_req'
>=20
> Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Hi Ankan,

Thanks for the fix! Is there a public report from Stephen that you can
link to with a Closes: tag after the Reported-by: tag (see [1])?

Otherwise, this looks good to me and I'll be happy to R-b and take it
via drm-misc-fixes.

Cheers,
Matt

[1]: https://www.kernel.org/doc/html/latest/process/5.Posting.html#patch-=
formatting-and-changelogs

> ---
> Changes in v2:
> - typos fixed 'map_ops' -> '@op_map', 'map' -> '@map'
>=20
>  include/drm/drm_gpuvm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 8890ded1d907..476990e761f8 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1078,7 +1078,7 @@ struct drm_gpuva_ops {
>   */
>  struct drm_gpuvm_map_req {
>  	/**
> -	 * @op_map: struct drm_gpuva_op_map
> +	 * @map: struct drm_gpuva_op_map
>  	 */
>  	struct drm_gpuva_op_map map;
>  };

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------3sO0DmnhoYHpGfBtrqJah5w7--

--------------EIe2OGYpb6MkhXjL3fFGPXBT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaO+g9wUDAAAAAAAKCRB5vBnz2d5qsAd+
AQCG3AEzrPTdn3w8dqo3Vrq2NjUTSmUzmrkTH3xbFT3VFwEA6uL5WkpVR4rxpj1SYIRCxCm/O86t
NdozUs+xabWFIwo=
=sU0g
-----END PGP SIGNATURE-----

--------------EIe2OGYpb6MkhXjL3fFGPXBT--
