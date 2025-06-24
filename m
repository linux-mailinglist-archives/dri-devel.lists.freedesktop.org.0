Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9C1AE6763
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 15:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6173410E5C9;
	Tue, 24 Jun 2025 13:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="vbf2jnRV";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="SYMM9EHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3522A89131
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 13:54:26 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 55OCIbP2036377;
 Tue, 24 Jun 2025 14:54:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=7CY21619Qj+Or02RMB27IZVMI
 AqzFGWX9lrzVU6VfZg=; b=vbf2jnRV4qFobllPaQujpW2xAgjSQkz0MwmdPdIJt
 kmVZhMlqDJh+Rmr+3celn6M8SiHKkOeJrXu1EO1Dl9OV26JtzWz1BC57v1IBAWwv
 6PALgyQUW7Q0ZDVJN8wkH8WmLhnYC8MDML4CAoNiarO9NDdLYPLBcYJivYhWkBTf
 p01N8EPsdwPfFWn0KwdoIl84J6kVbwi1x8GuWb1jsbksrUfXWKWBocaiDIdYWkBt
 GM2DI8es9ml2xUYmmJWuxZFrUcEmiYQXN1usAg3nv+8GgNMlm+c1DlNqWSBSkY9o
 h7QhLzDPvCH3Uv5f3XzfEEZzXRgJxLrglNzw0PH1/p4Rw==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021089.outbound.protection.outlook.com [52.101.95.89])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 47f7v6rrj5-2
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 24 Jun 2025 14:54:00 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzP+AI5Q/BBjZvkUjDL+XUfaKScnBubDahuPKW9EJy3y0vf0XTUoDcTI3IIoyZYWOJ/fgmBzgbEAuqf/jCDVJ2guuPUM+otK5l6E4m7SKa+bEdllz71AB8cqYt/vmZVwyIEgc10szmuN3cVrYHCN2xd2VRTShhoxlJxl3IOudBYEEuge2TKYIueEBP/1OIhYbJhYNHrhfd8cPEoMlT+6BU16Nns/1njqKJRyRF+ax0fU/+UsIdZpf9aeJyUyeNW+M0ezB0AVQBtyvLQlGwOeD9xNVwseqsMP4fSTtpmOXocRw3OcvXNGslyrcGHH7/Kitr0voNYNYbctspglwxTe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CY21619Qj+Or02RMB27IZVMIAqzFGWX9lrzVU6VfZg=;
 b=ezpwzHtO8g1Cym7IRf5UFSlYPuZzvJIC7A/pnXwNhsgLF3G8fwv3m4rPWLh/jFXD9ZVs+/526OVOTaFSRGBAiDIR3DPFrt/e2nfEC2qqaCZOMuQpa7Qhf3G5oAgEMRYcdt+g8B2gKDlrF/G9HK2JSoFyygBVC1Z28dAN/IQ8DikJq8Svkcd8PUUctIEb7HtE37sN2i/VhgZ6glz3boSa2lFbadK0uEVHuVP9fG6HENYiknx5xeq8BoNecsuejzkdGruqND/HFYZ7ifa2UIrCROcEVzuVf4FQD4Jf6gCD7gxR37xtVlCXuyItfZk1LUKyIoEXo/O4T8+holmgZTXHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CY21619Qj+Or02RMB27IZVMIAqzFGWX9lrzVU6VfZg=;
 b=SYMM9EHUPt40lJGU/ddffnEyPg5hhd3dEyRVbtnfN7KYttp3RvE/bDVEL1mDxd1jhxnWaaks2Mu6EjVfjtgqyTZ5xIgDc+OVewvBEwqJserokW+yQb2+ZRgxq4/6UIWaeD6VxJmOoVaGRN4+MVkrGchrESSspBA4LVNi/yAPlWY=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB3595.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.28; Tue, 24 Jun 2025 13:53:58 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 13:53:58 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
Thread-Topic: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
Thread-Index: AQHb5Q9uNqYQ6k914kWJhE3qcRDxkA==
Date: Tue, 24 Jun 2025 13:53:58 +0000
Message-ID: <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB3595:EE_
x-ms-office365-filtering-correlation-id: d519252e-fe66-46f8-5bf2-08ddb3269146
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Wk5VZ0phM0l1QjdmendqWFdMVWxjUzd5Yjlhb3ZhWDVVcUtoaWJrcjU3VjJt?=
 =?utf-8?B?UnpydkxqbzRLMTJQZzBNZFJQdk8wL1hnblNlVTAwc3pxcVpUNnhaOFRRV3c2?=
 =?utf-8?B?QlZWRThOakdxRTlpWHh2QmZnM2UxRDg0Y21rb0V4ZTA4QVQ4YjlwZll2UVR1?=
 =?utf-8?B?Snl4eE9lTDNJWmpvZjBjSCtZbVNuQ3FGbzZmb1RKZUhDN2hkdXB3ZzVnd0dq?=
 =?utf-8?B?em40andBMVc1cU8wdEtxMnFyTTVISGtmV0duVmR2V0EvMDhrSjRabEdsbTRv?=
 =?utf-8?B?NEtyNWZtV2kyQnBDaUk0eHFJdmVKWmJGV3RmQnBPZVVKOEZYTVNaOWhHbEs3?=
 =?utf-8?B?L2lMeUtyT2hLMlBJU0cyWVN5Z2RjT3ZTV0Y3Vm9YR0c2OURKMFdNTXlIU2V1?=
 =?utf-8?B?aStMWTAzTFl2aEp5TmwzOElzWW1PL0RGOGlMKzdjRWxmMVJHcW5JZmplWWdx?=
 =?utf-8?B?MEpyNnhkNVExZ21vNmUxdEJtckxaSDdoRklmZXI1N1p6ekxhSEc2QXF4ZzJU?=
 =?utf-8?B?cXRsRm4yVkZ1WjlyNmxaOTNta2ZlanFDN0ltMzAyeFJJQS9pR015V2Y3OFNx?=
 =?utf-8?B?c2ZEUmEyZGpJRjZFUzJNQ0lTWTJtWVlpMzJNTjltdWFqRmxnNWNJN3hONmtz?=
 =?utf-8?B?RmFINlRMY08rVSsxeE1iZjB5NVBGdm15UW94akdqU01zaTNuSWpqTnA3L0Zw?=
 =?utf-8?B?ZzMzZzRMc2UvcmdCS0NFaWJ1Z0crYzJGT1NSbnY4cHdhYVlwU0NPb0d4S2RO?=
 =?utf-8?B?bnJBZ3FTN1pmUGZ6QWNaWmcyQ1MvQmlmek00M2dFSElZNXlSVytVMktubFo3?=
 =?utf-8?B?SXZ4WnkycUJ5TDN1eE5vY0QxdlNFQk9Jbkk1dWhIVmNxbVEzRUVLb2FnRGlZ?=
 =?utf-8?B?K2lNVzVhVlpDYlpHWGZUK04rdFRzbHk2SkZ5SnhJWjVGeEtFczFocjlzYnF6?=
 =?utf-8?B?dzNHL3QzbmJLSnZ1d1lPdHpLY2g4MHpIemduTk1raW1tMlQyV1I1eEZNVm5t?=
 =?utf-8?B?VEpqSU1UWjFPaFhDbmdoTjF4eUFqOXpVeU5rS3ZLYmd0enl6SVdjcVlTRC93?=
 =?utf-8?B?V2k0VS80eXBmdnVjenRTNjBxQVBmOFQ3Qi9LQ1NpRjR2d3A5RHgwQUdRQ3Vh?=
 =?utf-8?B?aDgzWkdVL1J2MExybTU2ZFMyTU11RWEzQTZ6VkRCUzdZczl3Rms2cm1sZVhO?=
 =?utf-8?B?WE93VnVhUHVJR3k2OHRtai95dGNmWUgxdmFPSStaV280ZE5vQUptL2VFNzdC?=
 =?utf-8?B?SUZ0Z0lzSEYzS3ZiYnlYaWxyaE5uY0R5WklVd0xUb2ExalVmM2JrRnhvNCtm?=
 =?utf-8?B?enFnaHRUOG1YVmpBOTU0ek4xdkNBd29wc2l0Wmo3SGZHZHFUSlo5YlExVHM3?=
 =?utf-8?B?eEs0bXY1Vm9VM1BjYlVwOXhlOTh4RjhsbWVxeVZuUVpOMngrODVCQksxNnFL?=
 =?utf-8?B?aG8vSkU2dzVWczRYcnZ1RWRjZDhSdUFLMWx5SVUxRHM4RThXMUtGU2hnenVM?=
 =?utf-8?B?MzBlOE50U1NYVmdIM1ZKSlhpaWpEc29BMUYwRDZYTGZLK0pPWjYvT1dRWEM0?=
 =?utf-8?B?L252ODlDL1RUM1kxQWRZZ2RncHcrSW55b2RwVTFPTE5Vc1dhb2w5eCtYNWNZ?=
 =?utf-8?B?S3NuMnpqV1RFUkNFWnpYaHF6TDRDdFk1UmxjNGtCTmRpNFFBS0xiRzBqTk1K?=
 =?utf-8?B?YUdhS3dveVFYaFFVQUJwNGlNSkpMbWdLbkc2MVJOM1RkYkNzYzk0ZUpVWnVC?=
 =?utf-8?B?TjgwbzE0cVU3SWlXUWdKWEczVVlGTnV3SG84ZDE1dnU4WnRpYVA4ZFR5clRW?=
 =?utf-8?B?VVRwMGUyTkg3c1lma1FjeEtyc2JsVGlZYUx3MFN6bVV0NmhJbDhEY2N6aXFx?=
 =?utf-8?B?V3AyWWN1NmNub3ZDSGxyVlJPbWc2TGIydGh5cW4zdmx1ZTlnZWJPZzgzQVAz?=
 =?utf-8?B?R2dZbHpOUVZhUnhHWU5vMUhVN1lMYVdEZ2lCYU5kTHMrcnlRMU50YTJ4QS9Z?=
 =?utf-8?Q?hfzoYq0vgjlXAeniMcYTAf1Yi3Cmi0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eStQQTNEMXlLbmhVeitlOXA0TFRBVTVualZwR3kzSXp6MitwVHNvem0wSkpZ?=
 =?utf-8?B?bXR4Qm5EZFBZdlp3TXhzQ3dzaEZ3ZllpUEcwYW03eUJxZHU3QnhxQlZJSGdE?=
 =?utf-8?B?Unh0K21xNTVRTDB0ZWpPVVB1R0k5TmNBNytXUi8vaVk5OXh3OXB1NnJFd3A1?=
 =?utf-8?B?dzFjeHd5M1lGNkxXMXVreGRueFBVRGlCUGVMT28yd3o2WnoraTlFNGh3cXQx?=
 =?utf-8?B?Z3NpTzdtaFY3TVhlUStNRjZpRktCRCtVZ2VEYzQ4eVV0Y3JlMko0ZU9RVEJB?=
 =?utf-8?B?aWxFRHRJS1VId2ZIQkRoNDY0b1RRQ0xvSm5obWhQakU4Wkplc2pwOExjZU9U?=
 =?utf-8?B?d2J3UVRDZmx0ZjhhSkdkQVppMGNQa3VONFcvTmY3ZG93M25NUC8ycmdhdE03?=
 =?utf-8?B?TlVLSWxUUzNWYVhDVnF2Mmk5R0RHWmtnNERReGFwTVdXTUd4R2J4TjVwcGha?=
 =?utf-8?B?V2xTUDZ0SVNIYWlyUERPWCtRem1uNHF2Y0hhOGliWC95M2owcTBla0llU2hr?=
 =?utf-8?B?VDZDVHVBQXJoT2hmdjQyOWxsNWh0cmdWU1lWN2g4cGk2TllyalJjZG5Rd0Nu?=
 =?utf-8?B?UlY3ak1yb2hTeTdqMTNmTWxpY1VVZUxya0pnUm5GUmc0VlpaYng4NzI2WHR1?=
 =?utf-8?B?dzlQcDdzL2RBUzEraUpuUThuNnQ1WWluOEFaa3oxU3drNDRmclJNL0hGWGs0?=
 =?utf-8?B?NTlHQTFoTVZoL1hmV2psZnplT3hwYTZWY3RiNzRzYnJHYXpJZVVXNDY5Vnlx?=
 =?utf-8?B?ZTYvc0NobWx5cUg4SHRBZ1lSWHduL2U5MFcxUldQRmtlME9VNHVoMGdoZFl6?=
 =?utf-8?B?M2dWOXV1cVNHa29NNzExNXhVSTBTVWlvOHFWODVnV29mY1J5NWVsWTEvMkdU?=
 =?utf-8?B?MnFxODR1ZnNqVmZLQzVtc2ZUaGlqOFh5VXRaSE5aUlM0MEwzODRwRis2cmNC?=
 =?utf-8?B?VjhWVDYvR0haamhXRVFON2VHVHl2bjMwV1QvRENRc1h4RTNSR2xnVWwzUitw?=
 =?utf-8?B?SC95WTBBZzduL1d6VmoyZHo1QUc0YWg0bWlvcndkTWNsV0swNzNINW9zSkky?=
 =?utf-8?B?OHM5SEh6NUtXVFVUcGI4dWgyZFV6Wkk0ZUdNZm1iQzdWMFFESVlCa0lCS1Ja?=
 =?utf-8?B?ZmZQTmNnT1h4S0xqOWdKa01HVXZNNlIrYXZRVVNFM1d6emt6QlRhc2k4NnQ1?=
 =?utf-8?B?RXlMeEdMQnlPVU4va3FsMk5KSFJEajl2RnBEM2UwcmZGZ09LTXFEUGtVQmFn?=
 =?utf-8?B?N2dWc2ZZTTQ1eFhIeWM3SkNiVHlkRUdnVEhpKzBoME1wU2VSMmRYK2l3VjZO?=
 =?utf-8?B?bno5aUZnMVpYSHk4V3R1L3paR0FYVG1heVpXdDR2aXl6OC9uWENiMkVDMW91?=
 =?utf-8?B?Ym5mNENyVkgyZ3I5aVZJdm5TS0NTVkpaOEsrVlN6VGtIZTcyUmloTUNkcFFS?=
 =?utf-8?B?aUFqZFA1ZTZ4UzNyS0g3TE0xdCtSVUN2clRHYmxxcVF6ZlV1L1pRZVJ5WEgv?=
 =?utf-8?B?ajZaMUhiWEVLU3VIaTZTOU55MktibHBrcmZwUEJEK0hxdkJHV3NCc1pkbk1T?=
 =?utf-8?B?RGVWZjRDakNLbkRyQ0MwbnRRSnJZeG9EYkdFNzJGcWZUZG9ZMDRFRzRWNktW?=
 =?utf-8?B?ZFZYSjdVN0RaOUlpT0dTSVk1US8vS3FpMmNXa01iOEd2N3FRbmFIaFpzaVNh?=
 =?utf-8?B?cXpIZkIzRFUyaU9wcS9FSzFVc1ZyZzZQdmw4RzUwcTBGS0ltQUplek8vMk5n?=
 =?utf-8?B?aDMvT3FQMWdFVnBzdlR6WWdwMEVqWHd5cnJmaG56QXBUL0RWYUxNVXZGaTd2?=
 =?utf-8?B?dzNKbEhiRGc4Zlp6eUZOWHdodnRpTmo0aDgyeWZySWVpSEJnakcxcnh0UjRD?=
 =?utf-8?B?RWwvT1BmMlFwbUdvL0RGUzE2OCtFcFNOaW8yQkpZbURFT0hXTGM5WWxIWkJQ?=
 =?utf-8?B?WjEwYS9YeFZzVk1nNlRzdWNsNEJCWFR4dSt4MnkzOHlOUC9zMnlQSnBlYW54?=
 =?utf-8?B?Ui9UMTFWejUrZ1VLRDBuWFc5SnF0dkF2cUZ3UDJSaXM4WVhhaXBZaURKeWRy?=
 =?utf-8?B?dVBDVGFKUHRtQWViQjhKbG12S0FqTFJzd2djcWcyeXBJK0VjbFNJZUlZbVRJ?=
 =?utf-8?B?ejZ5T1E4ZDBqcEFuQVZNZUdvblBxSis2Mjdtb25raDZrbDFNR09DMGJhbEdX?=
 =?utf-8?B?M2c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YB0lH8fSBKW6eARj5tEidDOX"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d519252e-fe66-46f8-5bf2-08ddb3269146
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 13:53:58.3365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 74i4hnqKux8iTlp9AvI/A14axY+TNloGbkXewPpFPQuI4LntxPsRmuDP20xBMdK/KajFupRymr0hLz604sugHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3595
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MSBTYWx0ZWRfXxQWGWuHSSBWy
 vBklAvw+JpriCmS9nRi3Y07EqRxiUpGX6ZmliacbReADAdLubreoIaYST8ShGL2C4Nkbi/iJBPq
 ol/BeTlqE18HoTaRP2yBhd/fnfJDJClAGQ273ZHEDHtRcMPWvcmTcLWn8jHXz4CU7PSH/uh9Ko7
 KtGC43md50YZ0vaxrK/oELSMFfa3ajrux4yjiqE6i3dhZ+u8RJfNtblmjVi6/mjGnQGpZ428NAM
 h4LIi+BoT6690ZVvPx4+ISGe2fHOIEoX42NBEZl02PK2ZuTxegnTaZ/uMaf36HYvFH5Y3IEKH7k
 oKER28n9qmqNjFR02K3uZnjK56oemlpieSgLwossx8uei2z1X2KAPghKGT58kvAkvmCrteo+zLq
 EXeCOgPS
X-Proofpoint-ORIG-GUID: Zy1JLLdOeG1DR0Ne0Ui0R2JcwKQt5ieI
X-Proofpoint-GUID: Zy1JLLdOeG1DR0Ne0Ui0R2JcwKQt5ieI
X-Authority-Analysis: v=2.4 cv=HL3DFptv c=1 sm=1 tr=0 ts=685aadf9 cx=c_pps
 a=XGMez45H97LGCOkXRSAzOA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=NgoYpvdbvlAA:10 a=KKAkSRfTAAAA:8
 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=ant1DquXyHx79FaOS1cA:9 a=QEXdDO2ut3YA:10
 a=RhpC3D6hUPxS_rTFCncA:9 a=HXjIzolwW10A:10 a=T6a71-JsGAwA:10
 a=xLFm1Ez3F2UC-pFh9TYA:9 a=FfaGCDsud1wA:10 a=cvBusfyB2V15izCimMoJ:22
 a=t8nPyN_e6usw4ciXM-Pk:22
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

--------------YB0lH8fSBKW6eARj5tEidDOX
Content-Type: multipart/mixed; boundary="------------tfd40Nn71PxbBF54x9zMXJAf";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>

--------------tfd40Nn71PxbBF54x9zMXJAf
Content-Type: multipart/mixed; boundary="------------YEhTj5UdEG6l00tmrnCG8Hsr"

--------------YEhTj5UdEG6l00tmrnCG8Hsr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23/06/2025 12:42, Michal Wilczynski wrote:
> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
> specific GPU compatible string.
>=20
> The thead,th1520-gpu compatible, along with its full chain
> img,img-bxm-4-64, and img,img-rogue, is added to the
> list of recognized GPU types.
>=20
> The power-domains property requirement for img,img-bxm-4-64 is also
> ensured by adding it to the relevant allOf condition.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 9 +++++=
+++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..9b241a0c1f5941dc58a1e23=
970f6d3773d427c22 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -21,6 +21,11 @@ properties:
>            # work with newer dts.
>            - const: img,img-axe
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - thead,th1520-gpu
> +          - const: img,img-bxm-4-64
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,j721s2-gpu
> @@ -93,7 +98,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: img,img-axe-1-16m
> +            enum:
> +              - img,img-axe-1-16m
> +              - img,img-bxm-4-64

This isn't right =E2=80=93 BXM-4-64 has two power domains like BXS-4-64. =
I don't
really know what the right way to handle that in devicetree is given the
TH1520 appears to expose only a top-level domain for the entire GPU, but
there are definitely two separate domains underneath that as far as the
GPU is concerned (see the attached snippet from integration guide).

Since power nodes are ref-counted anyway, do we just use the same node
for both domains and let the driver up/down-count it twice?

Cheers,
Matt

>      then:
>        properties:
>          power-domains:
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com
--------------YEhTj5UdEG6l00tmrnCG8Hsr
Content-Type: image/png; name="Screenshot 2025-06-20 at 11.28.44.png"
Content-Disposition: attachment; filename="Screenshot 2025-06-20 at
 11.28.44.png"
Content-Transfer-Encoding: base64

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
LOzkwwAAAABJRU5ErkJggg==

--------------YEhTj5UdEG6l00tmrnCG8Hsr--

--------------tfd40Nn71PxbBF54x9zMXJAf--

--------------YB0lH8fSBKW6eARj5tEidDOX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaFqt9gUDAAAAAAAKCRB5vBnz2d5qsAT+
AQCoAhvrP0+A980jCyRE+bRmYpRn8nER4EZq2D38GLXkAgD/YL6syFC5Hy6dW2akUzck9aRGEAlu
7tGHLMpeDRFYvAQ=
=Wrj/
-----END PGP SIGNATURE-----

--------------YB0lH8fSBKW6eARj5tEidDOX--
