Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289FDB11A63
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 11:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C58710E14E;
	Fri, 25 Jul 2025 09:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="TwCUbVn9";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="rckB3Gvr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058C310E14E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 09:00:32 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56P5m4rL054897;
 Fri, 25 Jul 2025 10:00:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=Dfxol9bcupJwRtRNejZ2uYwXx
 QB4qRlZOBGnxNjiRIg=; b=TwCUbVn9GDejckF7szYc+mGEJa+njgPqaQyWp1QAe
 msNS5V8dI8QgoUu8/oQtUBj/OwJYPTqA5rHcdGL7lnvVQD0LxMhjj58spNkRCu/r
 fK8XEioql9g27BUM/QzYdXmsyBafNZM+yJdhddQ8qlgIZmgqaa6mUIpi3WYNx2xj
 cXyy3mOEVLcHVG5+RT5q2ys1WkjNpH4lVfSvQ2iwBANiimTpWxqPIVuG43uArz4I
 TTqGRRpTY0YDvX1nYDZlQtxwUp/EfzZPtrcITVsvoKUMJjVT2Y01n8E7Pg+qBWsM
 GsdXEgpkEKJTYXC1txn0b075WL81Cl8ZjaJ2PqSlBN1Dw==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022098.outbound.protection.outlook.com [52.101.96.98])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 482jw32jp1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 25 Jul 2025 10:00:13 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMzVwFepDzNvZKvpOGAZmf5or6b+Jcta5vgS1IoT7Zi+eXuSQ54HsSPdpGA08lPKIoqfgMW/4b4oT5RN6aP/C0ysXzzX/XBliAJaqv7zMtjaOIcdBScvkEircEGKR/FpuiFXPjmMDcun/dQrjSG/QcV0rXnjDIyqGbeIIdH6NzY4p4WFFzYYc17hVsHexve1CKJdZ9c7BwlrWxo6ymJXbTR42POOS7SrP64CRYxwfvB36y6XBWZIS7ybC+ILr9UTlmt/U5x+K7mNqvbav+gieQDdVs0Vgy5m04Rf/GTGjbx8xSkciSaPQ3DIAN21gXZsFwdm18+owJ42fvxtgPQuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dfxol9bcupJwRtRNejZ2uYwXxQB4qRlZOBGnxNjiRIg=;
 b=errL5RPMfApT1J9xNqEL3pzW17wxIKdmc/+nGhwyQqVKUMcDIqSioN1jHRVz1ph+4eZQobaWfDFJSQE0e2Rq+xQOaZ2xoxzNmjaEtjRy5B5DSTx/xvYXJsYVbqlVQmGl3K8tFgR1jO7Sr5jjaBvhX9OvE0OFI4NHark1ws0AShqt6vSKbyV5PYK0OrX0USaaX29cbpaQbnYhrg5vKMIOClz9PMNWTWu8rTvahnBJGzW3Pk6vQxIjlxx+bu/7oLxHgpmuO4WB2iYU5D/nVOOL5T3Dwme2JYue4Tjh2bFnunwzUZ19F8pyG3aE8FVPjQiklwb2/VdnjLJt7yq7burlQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dfxol9bcupJwRtRNejZ2uYwXxQB4qRlZOBGnxNjiRIg=;
 b=rckB3GvrC2aQxQxSuVPKLqUMlLyhPWDYhF1NgngnqptPQ9QZ+KMgDyzY2LP3nHLoJAcbIZ1U+4WEzwZe8OYXMK6Zq3e+//1yawQ542LYNzBWg0da60/8wZ/+8oNPiA7aaU+8FgdieY3rmsKKgZlybl2ahBzjhDLdvmzXdA82d0w=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB6913.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d7::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.23; Fri, 25 Jul 2025 09:00:02 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 09:00:02 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michal Wilczynski
 <m.wilczynski@samsung.com>
CC: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Drew
 Fustini <fustini@kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v8 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
Thread-Topic: [PATCH v8 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
Thread-Index: AQHb/TGq1IgjppbgLk6aQ+EoSucUcbRCip6A
Date: Fri, 25 Jul 2025 09:00:01 +0000
Message-ID: <4461a785-b593-429e-b436-44cd2f1c96eb@imgtec.com>
References: <20250724-apr_14_for_sending-v8-0-0714bef83c59@samsung.com>
 <CGME20250724141911eucas1p17071ea620f183faff7ca00cad25cf824@eucas1p1.samsung.com>
 <20250724-apr_14_for_sending-v8-2-0714bef83c59@samsung.com>
 <20250725-gainful-saluki-of-mathematics-3c0dd0@kuoka>
In-Reply-To: <20250725-gainful-saluki-of-mathematics-3c0dd0@kuoka>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB6913:EE_
x-ms-office365-filtering-correlation-id: af087b89-8492-41c0-ee66-08ddcb59a3ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UmpjN2U2eUF5Zm9NRzFBamh1dUpzdlF3NmxTS05KcnpBYUtQc1dsVlRNNVEw?=
 =?utf-8?B?Ni8xOHN2ZGh5bFZNVXJkY1o0Z1ZqbnRGOXRmdUhhRXo3Y2NXM1d0eEJRekZh?=
 =?utf-8?B?NURHczR0eHBXbEQ2Q1dwc3RlZnBkemw3eHhjR0NlczNib3k5cGhoc2pINnV4?=
 =?utf-8?B?UkhRMmdDODR0eGlXR1VMQ3JReGhIT2ppV0dmOW5CUnlQa1V1MHFXSnprK1Nv?=
 =?utf-8?B?Rmd3TVR1M0V4eHN6cDhQK2RDWnE1ZFExVVM4NFM5R2lVbGk0dHZSRTZzQ09E?=
 =?utf-8?B?dGFxcTJoWjhmRkNxYU5uRXowRG9FTzN1QUxQYWxQQ1dKbTVTdUx3Qkk5UGlD?=
 =?utf-8?B?OHdibW90U2tBMTZGdFFjYTZ0dGh6RGYyT2NIZUtZRDVmNmRWNThjL3NQd0U2?=
 =?utf-8?B?MUo0ZE5XOVROUlJrWkluQWdSamY3RlJGT1ZoL0tjRHlBZm9qLzhZMElmelk3?=
 =?utf-8?B?dGNQakdnN2hIQ2FqbGkxZmIxSURYTUswbUJ2cEdhdkordWdFY3BIc1BzY1Z5?=
 =?utf-8?B?MWxNRkxTb0RQWWd0d2FuQ1p2YXNTT2pCd1o5SkhPMGlMZjlOYkJza1hPaHBQ?=
 =?utf-8?B?NXBwZERMNG1RQ2NWL3U3UGN5VW0wd0tGR0srb0MxeWM5alpLeEY5N1ZObFY0?=
 =?utf-8?B?NWJPYmlGYjZQbWRQS1pMclozUnEvdFlDR2srMkxoamNiUWJhZzFGM3pjeEFY?=
 =?utf-8?B?U20zdU1RaEVqZWtFVDQ2MG1NRzJCa1FHSGFhMjh3STVYN0puWGFNN1l4N25u?=
 =?utf-8?B?dTZrclBaSFoxaGx5bFVMWjFXMzZBa2MyejhGNU8wNEN1M1RUcGYwejJDdCtr?=
 =?utf-8?B?a0hHWldnUDdMdUh3ZTBYUVJZaUtraVMwWEphTlZmWVVTaFNGWERGWWdtV0RF?=
 =?utf-8?B?c2NqdmgrUGRDbGx6NGRMZURKVzNpRmN4RUlldCtzZnltOUNrQUNrQXBWUXlt?=
 =?utf-8?B?LzNBK1ViZnZxelpmZDlzY2ExZnFGdkM3cVU3VnlyZlIwSFBpVWlyaHVpWnZt?=
 =?utf-8?B?eFlTWng5WXRKN2Z6WGpUeS93UlNYQzBod0k2S291Vm50QUMwUXN2VUNDcXMv?=
 =?utf-8?B?a0hTcm9XVjI2OEhqbjJSeUk4TEVjaFptRWttSEd5UDZ6ZldicE1LRDBHejly?=
 =?utf-8?B?VWJkTmR2MHM4aEhFeVY2MUxFd0ZRanpVUmJWVXRvRkpUZHBDajlMU1IzbEJJ?=
 =?utf-8?B?NnpOeXZZbU81anlXSDVha0oyanBzc29hWnZuTGx4R1J6bWhQUFBaMGNzTTVT?=
 =?utf-8?B?dkRNM1pnUDkya1hXZnJEbjE0UWxTZGlKeEpYR21udnR6SURCZVkrc2l4ZVlv?=
 =?utf-8?B?YzFCNExlUStzeWsraFpIUm9xMjZvd3hhdUlJU21kOERRNjczZkFGK1FXclRO?=
 =?utf-8?B?cHhnbTZFQlYvTzRIZFBaZ3BPNVhpVWRRVkkxQVBzeS9lRDRISXl4aXZ1enBL?=
 =?utf-8?B?YWJ4RjIvK0FWNk5qMFhzNkhEZUZyZldvS0ZvSG1xTzRyS3FMbS9FeitwNE9h?=
 =?utf-8?B?QUdPcTZCc1llVFFHYlJ6aERRajdGRmdtZ2Y4Q01MWTMzb0p3NlpYY20wT0JT?=
 =?utf-8?B?d3lmaVp6a0k5VHE5LzBEWkpienFpZ1hRYzd3Wkxrc2FGbzVpMTh2VWIrbWhD?=
 =?utf-8?B?RENNeTB0NlVPVTlaeEp1bEpIMGxSZlhqTUkzT3Z1WllEREt0MTl4UTNodDZj?=
 =?utf-8?B?Ty9LalBqNE1kRCsrKzVzcWpFYm1Lc3BIMTAwVDVJNUNIandrUjA0NmZRTTY5?=
 =?utf-8?B?b2pZeDZmTGdnR25aVUpQdjlueG1JNUp3RmY3OTcrdUdPSWhiZmFoQkptT3BU?=
 =?utf-8?B?ZkJuUkRXMnFKazk0anZxa20ydU1aaU1RUDRNZkpEdGhpQVVGWWJSZ1puVHcw?=
 =?utf-8?B?VUYzc1lGZldkQ3Y5VmJYTlpESlZqVVFpTVM1cnJOL3h4c1lvdVlZV2d1b1Qw?=
 =?utf-8?B?bzd6Z3hOZzN0emlEMklrRW1Kc1FqM0VJRzA4elc4M1ZFaDk1aDIwUkJhSGxl?=
 =?utf-8?Q?DFyopz7X9PGSbz7VNicWUuPnKkA/Co=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0I5d0ViSHIybUF4UEpTRWtDRHBZdUViZ1dJdmlVbEtIZFpocE1sODFlRHd0?=
 =?utf-8?B?MHlIZHViaWtiR1VJU09MbjB0c09aYWhWSGdhdEhYR0xUV0NxQkQ0bTNRSlUw?=
 =?utf-8?B?R1k0ZDFXVGFDVHdvc2xSb3ZDbFJvWWJJbzYrSHVac2dpNlR4SzJSWEFmSkhw?=
 =?utf-8?B?aTZUMWU4ajBjVXJSS0JxUDF6MmsrRnU2Kys3eU9XMkZuM2M2QVlmZCtlbTF2?=
 =?utf-8?B?VVZTRU1MS1MwdlNvR0p0ZXV2TXYyUWVwdGVKV0pSWnJFNFVIQ2tuam91V2xT?=
 =?utf-8?B?VVd3MTJhWFd2cGplSG1LQ2JTTUo1a0x1dEJRcWpKT1hlVDlMZkJvdUhENVJL?=
 =?utf-8?B?d2Z1bk91a0lkamJHcU5GYTBHZHBaaWVPdTJtVzZZV2VoelBtT0hKaitucDdj?=
 =?utf-8?B?SjN3ZTRqd3dDQnNVcHNUSkV2LzBWT29iTEtrSDh6UXNFaUdCcUJJczJieXdn?=
 =?utf-8?B?RVdyTmh4Z0ZuZ2FrNnBUOU1aVXFoYktFOUVZMlZkdmNOSGlSRlc1RFBDb2R2?=
 =?utf-8?B?ZHNDdXB0RGhsd1VTSnFtS2Z1RFZoZkZSY1B6MnhvN3NqL09PU0VvOGhTaEUv?=
 =?utf-8?B?QmNaLzBjbXgyL3VRQU5xL0lpVHhvRFZlanJmR2tKaENLUkZBZENJY2QycHgy?=
 =?utf-8?B?SDdTSldyQUhtRkJBTmx1aFFwTWZ0RmpSa056dmZydmJLMTkrVTlCZGhBb0oy?=
 =?utf-8?B?bGdPYzZkZkptbDlWTit2NjNaTkZIWG5JUE1OdnZmM1ZFQWR0WFRJQlJoM0x2?=
 =?utf-8?B?MnhHYWNvZEt0dWl6ZHJ0VGluQ0VaWnpWVWFaRmV1ai91bkE1TzBXRzgvVVhQ?=
 =?utf-8?B?Nm9BZUpNMHVVTUE1RnRHTGd1dTVaUlByaHNNcjV4M2M1YzNQT0RTVlJ4YXpu?=
 =?utf-8?B?VDBGMWFWU1g4eGdJRUdueXRGSnJJRHFWNkd0c2hhWW14V3lsM08ycGFmd08w?=
 =?utf-8?B?ZTRtUnhNQTRPYWt3eDZOZEZsNXpqbDg1UTVrQWw4RS9hRWJiQ214QUwrcTFp?=
 =?utf-8?B?TC9LUEJCVEk3VktaYXRUd2lZZUo1eXF5WXkzajdMRE9qc0t1eXVIOFFmeC9t?=
 =?utf-8?B?WHpJeFJQMGQ0WU80Q0p5SGV0UEdtbFpneWlwS1E2WG0yUjhVVDVidGxNRUVp?=
 =?utf-8?B?WlhUNW1QSDFIOWIvUnRIQlNLWVNtT2RIQmQ1MEo2Wnh3OThIdE5sZEIvYThi?=
 =?utf-8?B?N2VPRkdYVDdxWUtuNU55WVRCRHVVR0cyNU9wT1VCMVF6WFUvcm5WaHdBelIr?=
 =?utf-8?B?QzVMRGk3dHBqRm1EK0FGcnZIT3NKbFVSbmtYN3FTdlhWTW16UnNZY21iRjBO?=
 =?utf-8?B?LytVNUQvSDRoUzQ2eUx5TUI0QlYyWnpaR2txL0hTRkFoazR1OEdZbC85cFBw?=
 =?utf-8?B?VCtzeUVCcmRUSzEvbWFjbDY3SWhldUV0NlNxcmR5QWhrQithTXdiQ2dKT2ZS?=
 =?utf-8?B?T1ZHcGJDWHlWUDROQ3MvU2xuYlZZVVlma3U3UEY0ODVnNDJtZkpJQmRDTlJ6?=
 =?utf-8?B?Mm04TnFJbWIrS2NsbkMybUlKcGJST3c5QmE2aHJUT1Rud1duZHBiaStHQWlo?=
 =?utf-8?B?dmFZRWpWZGk1V0tPK1hRT1h0MjNhdlNCQW4wUUZyUFNzY0ppLzV0L05RbURh?=
 =?utf-8?B?aXNUWWtGaTNiclcrUFZNTzhPQnRtWFJNcHJrL0F5Z0ZBbUJsZ2E4a0JMd1BG?=
 =?utf-8?B?NnRKN2JoU1lwYjlBZmdNUWVWNCttdkhYQm5aMVAwSjNweCtwL2lORXAyQWQr?=
 =?utf-8?B?aFdIRFROKy9jaWJxeVo1Q1I5K2NFdlNYSnJBOXFUR2tnSTVkck44ZWoxaHBB?=
 =?utf-8?B?eU9nNmtDWjJiUkYwUHZVWmd5dFAwUDRyWi9hSzRvQkpBZEt6VFZ3R0VGeWMx?=
 =?utf-8?B?N1NnVXp4L0RtWDhEdFp4MU93Y2hrNmZsblpMMldPQWRPNVFkUm4yOE9NVU0w?=
 =?utf-8?B?L1UzVEpMT0JOWVN4NkkyeFpwY2QvTHl5TVB5ZWNLRDJ4K0JBcXVwQ0d2S2k1?=
 =?utf-8?B?eEZGajhzR1RiQmJtQklOcDF1RFVCM2xzeE13YXMyNWZES3JxakVvK3VTVlJt?=
 =?utf-8?B?MWI5Y2tvek1OWmhLaWI2cUl5SXFyREdpblh5Vy9zd2xtRVBlRFBiY3hlYUZi?=
 =?utf-8?B?bDZTR3Nla3JybmZLWGVJMTdOaC9qUVVEYzVQMkZVRDlGT2tMZnorNWJrYks2?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FA429wOmyZTDb0lEr1PO30cR"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: af087b89-8492-41c0-ee66-08ddcb59a3ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 09:00:02.0049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kMMAB5SGSx0YRizNnIwpeBJ5QgGacse57E/3fXmTKm5UATGwBVElu72FcHuvDCk1ZL2M35Mwf5FuUYW8IbW4lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6913
X-Authority-Analysis: v=2.4 cv=X9dSKHTe c=1 sm=1 tr=0 ts=6883479e cx=c_pps
 a=7g/F+h/Y0x/HpfuCXpN0Zw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=NgoYpvdbvlAA:10 a=KKAkSRfTAAAA:8
 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=MLCi_6iGXI6muuAwRTYA:9 a=QEXdDO2ut3YA:10
 a=bWh5wrCMk0TJeFD2CLgA:9 a=FfaGCDsud1wA:10 a=cvBusfyB2V15izCimMoJ:22
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: swsyCnIrRnwD6WGdqs2XnB0Vgee9TTog
X-Proofpoint-ORIG-GUID: swsyCnIrRnwD6WGdqs2XnB0Vgee9TTog
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3NSBTYWx0ZWRfXzrzFFvfZ1tKV
 LNTJeKAOix07sf8FDizeAKwwJho8pHgbUbTtRFWMDpc0rZe1XARZs9aysFzLuOQbGl0Kj3u8fZ7
 J/yw0zAuYp5ZF86mEEKjGap4WoQGxNUv8MgVcjOwwyU/CcT+9pJiPQK5EOMXT/BydY5vn4kS3ye
 ZAAp9F16a3Eca+6qheoFpz26tOS0grmHYjw2If71DNtW7QMYnYCTxrzBKbMQAWTmBNBvQmEZedh
 9vfGwE+FBfiXp4TQ8POXzr7gv2fX9K4a/Bz3jSF8J8aij03OuApjzIyBkeIN1qaSDGOmwOTmL/e
 +Cv9vk+E5xXNiGz2avWwcahMwCfNbrR08f2sXmDz82VHCx3pZqnPMWmtHzsRqVwtXPQL/r/w9Hh
 NP7U3llr
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

--------------FA429wOmyZTDb0lEr1PO30cR
Content-Type: multipart/mixed; boundary="------------6hT0JHBpma0FDK7oHoyGXy0A";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Message-ID: <4461a785-b593-429e-b436-44cd2f1c96eb@imgtec.com>
Subject: Re: [PATCH v8 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
References: <20250724-apr_14_for_sending-v8-0-0714bef83c59@samsung.com>
 <CGME20250724141911eucas1p17071ea620f183faff7ca00cad25cf824@eucas1p1.samsung.com>
 <20250724-apr_14_for_sending-v8-2-0714bef83c59@samsung.com>
 <20250725-gainful-saluki-of-mathematics-3c0dd0@kuoka>
In-Reply-To: <20250725-gainful-saluki-of-mathematics-3c0dd0@kuoka>

--------------6hT0JHBpma0FDK7oHoyGXy0A
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25/07/2025 07:59, Krzysztof Kozlowski wrote:
> On Thu, Jul 24, 2025 at 04:18:59PM +0200, Michal Wilczynski wrote:
>> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
>> specific GPU compatible string.
>>
>> The thead,th1520-gpu compatible, along with its full chain
>> img,img-bxm-4-64, and img,img-rogue, is added to the
>> list of recognized GPU types.
>>
>> While the BXM-4-64 GPU IP is designed with two distinct power domains,=

>> the TH1520 SoC integrates it with only a single, unified power gate th=
at
>> is controllable by the kernel.
>>
>> To model this reality correctly while keeping the binding accurate for=

>> other devices, add conditional constraints to the `allOf` section:
>>  - An if block for thead,th1520-gpu enforces a maximum of one
>>    power domain and disallows the power-domain-names property.
>=20
> Why?
>=20
> This solves nothing, because you did not change the meaning of power
> domain entry.

Hi Krzysztof,

Just to clarify, is this an issue that can be resolved by documenting
the semantics of ">=3D1 power domains with names" vs "1 unnamed power
domain" in the binding file? Or are you suggesting an alternative method
of encoding this information in devicetree?

Cheers,
Matt

>=20
>>  - A separate if block applies to other B-series GPUs
>>    img,img-bxm-4-64 and img,img-bxs-4-64. A not clause within this
>>    block excludes the thead,th1520-gpu compatible, ensuring this rule
>>    requires a minimum of two power domains only for non TH1520 B-serie=
s
>>    GPU's.
>>
>> This makes the binding strict and correct for both the specific TH1520=

>> implementation and for other SoCs that use the B-series Rogue GPUs.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 32 +++++++++++++=
++++++++-
>>  1 file changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.y=
aml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..2c5c278b730145a983d1dd=
fa4014b3c5046bcd52 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -21,6 +21,11 @@ properties:
>>            # work with newer dts.
>>            - const: img,img-axe
>>            - const: img,img-rogue
>> +      - items:
>> +          - enum:
>> +              - thead,th1520-gpu
>> +          - const: img,img-bxm-4-64
>> +          - const: img,img-rogue
>>        - items:
>>            - enum:
>>                - ti,j721s2-gpu
>> @@ -84,11 +89,29 @@ allOf:
>>          compatible:
>>            contains:
>>              const: img,img-rogue
>> +      not:
>=20
> Previous patch was completely different!
>=20
> You cannot keep tags when you completely rewrite the patch. Drop all
> reviews and all acks.
>=20
> Above code is confusing and not correct, you just stuffed multiple if
> causes.
>=20
> Best regards,
> Krzysztof
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------6hT0JHBpma0FDK7oHoyGXy0A--

--------------FA429wOmyZTDb0lEr1PO30cR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaINHkQUDAAAAAAAKCRB5vBnz2d5qsPY+
AQC+kjAW0uDtrouiceT5bYpMDndxRI7vRSUj+AHgYJbrQAD/ZRupEgxNo+m/Ltvl25Fsnif7v9bv
H7qAp9Jy0KupbQU=
=apKl
-----END PGP SIGNATURE-----

--------------FA429wOmyZTDb0lEr1PO30cR--
