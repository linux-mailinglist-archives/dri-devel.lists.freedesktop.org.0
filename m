Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC16D3B042
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E171710E35A;
	Mon, 19 Jan 2026 16:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="VrP9D6ja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022095.outbound.protection.outlook.com [52.101.101.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1D810E35A;
 Mon, 19 Jan 2026 16:18:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/Kb/aT/0caHYOh/6Cmq/mASGsn4qZMqNWg+JEX/0fS0MzfASP4dc7DrP1PmfDJM7PlS0ReXDU24KNB4tiBVcn6c8LbPVi3FAYCfLhnh+/0FHwKdUVkWdfc457gYC9QxWa6X5/RNQNeevC1k5lS2m3MY0Whue/5GkQpLxJEtN+IBiP2inXS9/DTdjBsMdu/xZy0I5SjNiwHO6j+ocM8wRCT/qAGMlAZYM0JJ/ptAd+8Vreu0mHmHtZV1h1QWUpyo+JqtigUFBM5ynwFBU9matwBn1qoQx1BzM5qTUCPAXwnIR0uqLzLDhwDcVqWuV1mgOqdespVIfnisSa0LEeMT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE8g8j23xaYpltA38H7pqF5m2EZ2erfLzjFpEUWPyMo=;
 b=WRIjJtjE1NVAcau2a/Iy4H+oHdrkh+6J2btLm89xVH29zRGUGk6VCEVL/lrsa4PyLmuMMZyr2cLnW7iYGUH6fWUoBXtbc7ksgKu2Kkj1fzE+pcviz8dUQCImGE6coPkwAUa8OMGLxbcN8Uw+rr/2+lOdlVSjwZb0v1eCBOOHeyTtSLhUfrvlhTMdBerTZun+CeeXDaf7LW7/xx34fNd+SLIJAlLGCHWxR6m6ZgsMECTWVA0i+iS14iByQKSEk+r/KnmqI3vKQ5J9VWyz3+08EItS57hUsjk/Mw+vjeRh+n0gJVIqiq6LSwgU9XsTNEGxwHZZOG3XYCpPpqDufPMLTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE8g8j23xaYpltA38H7pqF5m2EZ2erfLzjFpEUWPyMo=;
 b=VrP9D6jaPM37Npb1qj+mu/3lB7tSAsVwrt82O91aHY7ovk6yY9rhvG736KHA3r4QfJm3tJpUJZhx30Hw2mAxnvk+6NNt/NUHSKNgn/SZZRQsSNztOmpfrsY11lRQLFQOd3TqTaKggXuQXYc5PEl9h9zY6JO0y0F8vOqGde3RA1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7972.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:26d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 16:17:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 16:17:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 16:17:58 +0000
Message-Id: <DFSP9INCK07W.3CR8LTJFJE68@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>
Subject: Re: [PATCH v2 08/10] gpu: nova-core: use core library's CStr
 instead of kernel one
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-8-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-8-dc7b42586c04@nvidia.com>
X-ClientProxiedBy: LO4P123CA0631.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f0d1a3b-0e3d-4194-34fd-08de57765008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1VqWENITVdwbW1NZkNwU3lzbHJIUkk2emxRSytRWlpoR0xLd0ZDZy9zdW5S?=
 =?utf-8?B?ZDQ1SFBxN0ZMcmpVc0ZFY3AxV2NJTnUzR2s5RFMvbnBpc3ZPOWcrQWEzbnlF?=
 =?utf-8?B?aUkyT2lmNjJkakN2YitGZXl2MGdxZHZPTzAwVEFTVnRRa0w0R0JrNTJTOXdS?=
 =?utf-8?B?UmpXaEM4OVB5c1Z0UW1SZXB1NXp2ZWFKR3RZNzlpMHJOYllFS0swVHozc2Fx?=
 =?utf-8?B?VjBqTmpKVmZEQTA5cnJaNVoySTNxcG13MGh0SUZ1ZkZxODFuSlZCM0ppNmVm?=
 =?utf-8?B?THhwV3VyekRCbHpMQlFMNEJiNlRFV2FXRm14WFYzN3ZQem51SzBSeUFNRWxG?=
 =?utf-8?B?TUFvQXZ1dUREVjRjaEhzb3JoREtoN0Y3QTcrU3g3ZGx1ZzJRdlp1UWhteFE0?=
 =?utf-8?B?TWdpbEltSGdlTktiei9uOFFoWm1iYVd4S3BjaVhDYnFycncwOGdqejNseEZp?=
 =?utf-8?B?VGgreERqZEZVbDdGaU9STWRzdVc4bnE3REhwOGQxbUx0bngzOGtvOUFETXhp?=
 =?utf-8?B?Sjk2YTBIUitMVmpJOEZlcXdjWXlTV0xNVmY5emVjWDVKUkFRZ2V3aE1tWDRy?=
 =?utf-8?B?TWRRdFRCU3BXWlcxWW5IZjI4TWdIdVZzY0tSUnpuOTN5NFVGRjhSNVRxMmJs?=
 =?utf-8?B?QVh5REdQTUc3TENzL0wvRlQrbmgxbDV2VnI2Rm15NCtNTEd2c2FnOFBlekIy?=
 =?utf-8?B?aWpTUnUvdEJiS2xnTmtnMytYbTNCdHNmWHlJTVA3WWo4YnZBd3NxbXVMMUEx?=
 =?utf-8?B?Vm5nUXFaLzFZNG9TK0FCY3NnVUpteld2Y2ZDcFB0aWRDeEtzdmQ1Y0RBY0ov?=
 =?utf-8?B?WjJ6eGRBdzNackN4R3VCc3pQZmo3WExteXlvQkhMWUFZeXFwbG9WbXlreEF2?=
 =?utf-8?B?V00wS1EySEdhVmVaUkwzMnpxSmxHRm5aZmVySFdRM2g0emFNQ3VqZUZ4YzdQ?=
 =?utf-8?B?N1U0bFNmaldHTk1HVURKVmhJek83Sm5oWjlXK3FwYmhHbi92a200QkVFQzgw?=
 =?utf-8?B?T2JWc3NlZmI0TzVOUFFuZWZmcURXV3RuOXo5UTRLZU9sYjg0VExwbkJISkdx?=
 =?utf-8?B?NUMyZFIvd2dBcEppaWZKdXBIcVVQR3lYb2V6d1FjUWNWK1RITGhOYTlJNXRx?=
 =?utf-8?B?V2J2UTlOTjZGYTVzamVKTkp0UStPQVRXMm1pVXMzUWlZbWZQcThqeXBSZEx5?=
 =?utf-8?B?ZW9ZRjNmZ3kzRGF4RDh0eXRnU1lkcUJHNndSNUtMSmNjSHZyVWhMUHY2NndE?=
 =?utf-8?B?Sm5YY2xiNUNKV1B5bVo0dkl3UUZraDhXUldFbFpaek1jb1UybjlhQ0ZBZG9O?=
 =?utf-8?B?UVY2ck5LMFg0eGNkVFR1SGZLcmM4V0dMZzVYc29mVEVUSDNxMjdpZzlaZm9v?=
 =?utf-8?B?dUZpRG5BTGRYaFNwWHJSb21qNyt2R3VFOWw5ek9nendlQzUwK2UxY2o4eFBK?=
 =?utf-8?B?Tk5FbmdUa04xU0pndnRXSXdaUW8vNHVtME1UUkxMR3Bzb3NDKzMwbnFhcTZl?=
 =?utf-8?B?ZVlVbWN1MkNnOFIwL0NOMEFHTmVsaVNUaURvcGpUY2ZxUHdJNlpsdGVwVUJi?=
 =?utf-8?B?TEd2TWlCRWZaeGIwYWJKaFo2UGZuQ0ZreDV6Y2xJU0kvVzVVTnJkQ3o3aWhV?=
 =?utf-8?B?SFNRZWVZdC9DU1FwWlRreDE3K04xUFFGdzMyR1hqZHprbTlockZRSjBQb1pU?=
 =?utf-8?B?VG1JdW40VmhNVkY0MTdTZzVkbWdKa2pyZmpqL0p0UFZYalhQL3RYV1Erek9U?=
 =?utf-8?B?RkpPUVdHWGk1Q2RCdjVWQ1VsVldXQmNUc2gxRVNKZFhvcjJuYlZET0JxVDdr?=
 =?utf-8?B?RldkZ2g4TDB6V1pERTFaR0xTblNyUmp4UHVIVEQzdEQ4SVJkRFUrNjJYTUhs?=
 =?utf-8?B?K1pDL09Odk5oYUp6ZDRsVUJZejVqNFloL0tRRDlvYTVCUjRyUWs3UnlJZmt1?=
 =?utf-8?B?RVo4cWhaMWFKcTNBUkVBaFhLWkVUSC8vVUhzZDNUVytFanNpMXpyWnVpNFR6?=
 =?utf-8?B?NDBPSHdXRWpENmU3MUlSS3FFOWJFckw3VDZKd2RhVmtlSUF6YW9oeFJnYjh4?=
 =?utf-8?B?eHFHdlFKbVpIOFBOdmlzbnA5VmNkUDFWVjY2MGtUSnAwMGlTbGdYbmdRSGxQ?=
 =?utf-8?Q?+nA8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uld0T1NNRE1WSWxZd3o2ZTZpY0FGejQ2QTdJdVEyeFRyY0hhTSs3MDBoTXBp?=
 =?utf-8?B?Rm9YUGtSN1dCOHA2N1RNUGhSd21wZ0ZtWFc2OW1tRFlJbTJVaFdyZWhtL3V0?=
 =?utf-8?B?YzZKa3FuNGxiUFdsbWgycUg1ZnN0ZllpOVAzWlFWSGx3UVVRWW9WckpIbXR0?=
 =?utf-8?B?RWdkL0tnSjArYXdBWHFoRFFMT3lNMnQrR21ETnNNQWRWUjd6RFNCRWp5TnRw?=
 =?utf-8?B?VzlyQTNidEtkdmM4a3VydzBWM0poUVo5SkJ2VmZqWjJUeUlzczR2dTJ4ZlVK?=
 =?utf-8?B?M0dNbUx3MHNUYWk5cXlzeGs5ekpPZmIwakx3dVNCT0JJbTdJMU5Ud2F2T0VH?=
 =?utf-8?B?cUdLdmpnZGQ3blc1aHNYTzFBd1B6b3puVXBMQlI1eXE5dWhFMkEyN0JXTWRO?=
 =?utf-8?B?S1JVT1FPS0ZZK25DSldYUm5Nd3EvaHRjcThKaTlJWUhyR2tTR3ZMR0lHeW14?=
 =?utf-8?B?SXRWd3VTMHd6RTFCWmFZaStJV1orczVFWE4wVkY5a01MVDFac3JBeTVpTkd0?=
 =?utf-8?B?OGpSVHdEQzE0NXRsb3FDMnhZZ3pUNFQvYXFCVnh4dTRQWC9rY1FMbVY4bFY4?=
 =?utf-8?B?ZHhHdDFTSXZTb2hJZFVkdk9zelRXR2wrcmFUTVZvZjdxeGhZSzNDQmZEeHR2?=
 =?utf-8?B?eGZpdDhyWnNpYmtGdWl1QWo4UzBYdXFQcFpOU2dIVTN0WG9yK0ZkdnlYTVVI?=
 =?utf-8?B?OE5OaS94ZE8veTRDbHdtTVJYQWJxMGRCd0pzdGZCbWVmNDRMbHFZbnp5eU1R?=
 =?utf-8?B?ZGFweVZjY1pXL1N3aVVRbUd0Nk1HVW41NDVuU0lIWkNCSkFmdzdhaVYzUHBm?=
 =?utf-8?B?djAvRUNNMkVTeG5HOU5OcGFpSEJZSUdrT1B6Z0duYWJiV05OVnBUeEZLVi9T?=
 =?utf-8?B?TjBVUmthTDdqK01heC9INkY0K29NclVJTm5IZEtSaEMwSmdrVXhhanFSaDRa?=
 =?utf-8?B?OEV0aUtZNzRPa2dVKzZKUUZneGN4dkdXdWlMVDdmaStPUi9Qa3JBRGU4ZHh0?=
 =?utf-8?B?NGx3T2ZBRk1JZWRCb0ZLRlQ4K253Q2lTZlE4K0ozN3Rua29icE14M0g3OFNY?=
 =?utf-8?B?OG9aTUdxK2JDRXBhc0hlQWNMNDVMa09HYjVoY29JbWRnU0VOSUE4S1JSbUZM?=
 =?utf-8?B?NVdJWjVyRVF3M0hsbmZJdmJzNW9HY3pFLzdMRitJbU5ock13OWJLUmFXVUFh?=
 =?utf-8?B?a0NPUUVHby9OY0xMU3hzWVlkS0czVmc5cFBGS3hsc2RZVms3SmR4STU3Vm1x?=
 =?utf-8?B?QmNWKzNDWnAzcTVNcjVVNGhQU2RMd3RkRm1KQkUzOVEzWFZXWkgyaEtWVHpF?=
 =?utf-8?B?ajhFVlhLbnJzWURIY2R5M2V3bzhBZzhnNVJkRGRqRGQyOGdMclFoWThOY2tr?=
 =?utf-8?B?Zy96d2kxRXlvbUpZelZIVHJZWjhYc1NadmcxTTJlWXFjc2NvdWpMbzhLK3VY?=
 =?utf-8?B?VmdHWWxvdFdCVXVzZjhoQWhUU0xHQXhRTm5WQlpxb3IycGcvYkRpY3J0OCts?=
 =?utf-8?B?eWpzS1Eza0g5NnZJMW5kSVJDNGZ6L0tZUWtMWTNBeEcxemtTdlduNm9oVlZS?=
 =?utf-8?B?K3c3UE04c3VZRzZDbVlpMkk2RjBKZ1ZHdUNyMnRQVUhjS2xVVGtkdXppQWZC?=
 =?utf-8?B?VDM0N1Q1MkxYL0N6WFdMVW9ZMUR1c1AvNjNvN3hHajhBamxsWkpadGoyZzdL?=
 =?utf-8?B?cmQ5VSttclI2TzZUazJaTTd0U3hGUHlMNlhoRytINHlqanBpaDdWSUVNTWdM?=
 =?utf-8?B?SERSR0o5ZVhDMllhVGZJQlEwOEVMK0JlMCtRc2FacHNMTGU0RGlIMHJ2dHpG?=
 =?utf-8?B?eUxNcmxVMjZ0UGppVlFCdFlMWlhDWW9neU5MMkJVL0N2UU5BNWt6aXM1UEpW?=
 =?utf-8?B?dU9yT2JmbCsraTNURWdEL2FZeUptR0F2aEVsSEhrN3ZpMzVhRGM0SFhzWDE1?=
 =?utf-8?B?Z29zTm5lL0RITTdCYlNZMTE4b1ZuN2xVRzlOMjh0bEJ2ZEg0cEViK2lrSkMz?=
 =?utf-8?B?QS9KUzRtbUN3UGxuRC81MFlZUWgvdTBrRlBlaUxqdStsMDVmNG1xTENqYkY4?=
 =?utf-8?B?WEEvZlExaURDUndSSkdPK29adU14RVpzeVZubWhkNzBKWklMSkpQRVVlQ2RI?=
 =?utf-8?B?MkVuemFyY1ZHck5DSnk1MHdWU0szY201TFg1SDlVdW9ha1JUdm01VkZ6Tnll?=
 =?utf-8?B?Mndnb0VEUGRJeFJ5dFRIM1RGalE0aTVuMlhteHpDYXliaFEyOEdUY1R1RG42?=
 =?utf-8?B?cmpRMWRxV3BxdGlGRHdCWDZjNE9SMHA4NVdJeExWSmZOZTVJeDlWbWpYQ2hu?=
 =?utf-8?B?NUJOWVlDbDQrVWtvUUFRMmE1c1EzYWlvMVhkdTNtRmVOQ2Q5YlZVQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0d1a3b-0e3d-4194-34fd-08de57765008
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:17:59.4365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ql5fUIW9Ra2uk2l/c730ymVvzJkKdtqs8QiN3DahDmsDfR1kL1EedbZDCkXeTfdMg/6DuY+GqiJgILL3r7d8gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7972
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

On Tue Dec 16, 2025 at 4:27 AM GMT, Alexandre Courbot wrote:
> The kernel's own CStr type has been replaced by the one in the core
> library, and is now an alias to the latter. Change our imports to
> directly reference the actual type.
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/firmware.rs     | 2 +-
>  drivers/gpu/nova-core/firmware/gsp.rs | 6 ++++--
>  drivers/gpu/nova-core/nova_core.rs    | 2 +-
>  drivers/gpu/nova-core/util.rs         | 4 ++--
>  4 files changed, 8 insertions(+), 6 deletions(-)

