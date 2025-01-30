Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35014A24B57
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 19:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577B910E15E;
	Sat,  1 Feb 2025 18:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="ctxMNYI1";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QzRKKwxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818A110E038
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 18:37:14 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UHni6C017548;
 Thu, 30 Jan 2025 18:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=corp-2023-11-20; bh=J6pVX6LFjP6kaQag
 tWnGhyS1kOv9ynY4q3WfFShkhbU=; b=ctxMNYI1SFUNmUwio76YJHTWTdyschtU
 jz35WCtw1qt+mvqV2yLGbGEFNVTxJGefYjplgf6O2lrG4KijgNY5rgo0m6hUS54+
 RY00iczVePB9l24Qh49VDVLrf4ntYmnYTvwF9gA2/JFRUtEakC13i1RdkZ9H+C1m
 aAMGF0bo1/rwzWyH+nIsXKQm1Fs1JNfawmrdvArH+EJ0wZa6H96CosaxYkIrOeCf
 KDDa3Ts6dm5XuZVZUQQHWPO/PeawXKGV8msHbNhfLxwC3Ou4ZqyXkU7Hfdt2aY7s
 joXaLFOr4Dqwa8ooyUInx56mhbyqRrLNzr6bc9KwT8CwPpJDTnc4Rw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44ge5w837d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2025 18:37:00 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50UHBPRk028275; Thu, 30 Jan 2025 18:36:59 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44g0vbf4w5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2025 18:36:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2VfLfp1JcGMsTXShKSTkckN9zzc3ECb3Dmf87aysbnWmD8FYrutiiI6SVr70ILQ8bFWGVDb1Vq97rBKB2ZXZIzYO1wHPnJx+Fo/60xOkIzq9Epc00ggLOwvU4e/sNfmwNjQwiHSe22s13Y4a1nHZwnM26O1ZqpCJ0ZXyBICgLy75wR04lais2IHrO/UKDhT19n/ZU9Q8HBLATosef7NhqGB9hp+5Ifi5cPTqIRRmLt6RapakkHFTRHhP6NmMgJ4seOyn2XtfpsHL61qOCyHwyLtIHczsauxzTXwtabB/pctYSwsnZ5N5tch+7VzTyfhO0n/lYw9FSCHyhH5LagWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6pVX6LFjP6kaQagtWnGhyS1kOv9ynY4q3WfFShkhbU=;
 b=IptvL0wFVceWUBtVWdPVGpTVnfdKiuEuIfrArqHFYpcO8udJQ9VIUyKGi9inXDOrHkFBtFJW4BXOWklPwQ/kIm67UGfNQXtNELH/Y2W5NVGtVzvdUee/k+qRawf+nVdwEIxaBpO8r0bSRxUyr2hzI4Vi7lzMQL38d4+FewxNT6SaFy5QbJw5Nb0HOY+HPAdroj78E/wW6SZa6enQVN6WeN7LvpNCq1kJHEw6ToeZIyqEuf/IGvXHUve8lID+OaYUKFx/sZrjJps60MkXnx3b6o5jpk7l/ym6+SPlt+nVSqLZaLgDpeAzuhCzqE2tZ4FcgLYDR9WXptm/sDW7KpZhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6pVX6LFjP6kaQagtWnGhyS1kOv9ynY4q3WfFShkhbU=;
 b=QzRKKwxiJ0G41m635AQYSe5IWutiXxIJvD/fwCbMt7msRAA/Jc7s4RGhwVg6n2EizzGegDaxxo2NHTA0CTXBiSAujm9D93OzMnrYtJQXG8DxIDNome7JtxMj++cMLdQSaEZ/D9EDYTIWSO7bky40TLNfzpoDN0YwdC3NZbYYAGs=
Received: from BLAPR10MB5217.namprd10.prod.outlook.com (2603:10b6:208:327::10)
 by SJ1PR10MB6001.namprd10.prod.outlook.com (2603:10b6:a03:488::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 18:36:55 +0000
Received: from BLAPR10MB5217.namprd10.prod.outlook.com
 ([fe80::68fa:11c9:9f82:f7be]) by BLAPR10MB5217.namprd10.prod.outlook.com
 ([fe80::68fa:11c9:9f82:f7be%7]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 18:36:55 +0000
From: Thomas Tai <thomas.tai@oracle.com>
To: "mhkelley58@gmail.com" <mhkelley58@gmail.com>, "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>, "drawat.floss@gmail.com"
 <drawat.floss@gmail.com>, "javierm@redhat.com" <javierm@redhat.com>, Helge
 Deller <deller@gmx.de>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, Thomas Tai
 <thomas.tai@oracle.com>
Subject: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or executing
 kexec
Thread-Topic: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
Thread-Index: AdtzQ0vu6eNj8snBS+OSvfShEIJEjQ==
Date: Thu, 30 Jan 2025 18:36:54 +0000
Message-ID: <BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BLAPR10MB5217:EE_|SJ1PR10MB6001:EE_
x-ms-office365-filtering-correlation-id: bfaac5a7-db21-47ff-2859-08dd415d1230
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wZUeXrAvfcNr9QqfcQ8ZzB8/U6hg5hfXiu3/mmhOezCFxwPZ2L40eQBi1YOI?=
 =?us-ascii?Q?m4NRVXzowJijZVUipYlxWEMwsdpU9Ha9IeklPlL5OEFjzgX76mEeyEft7YPU?=
 =?us-ascii?Q?XB6xoGO/WtipFsgNadbUkpNeGvFjG/EtxN2nC3RE8WSIc8qnC7m6EatqsFE2?=
 =?us-ascii?Q?gM/VJ8WPk5Jg8slRLHuixsK3DbXFZBrh390RuyjPsFpbhB1sbIZqgWmoaLN5?=
 =?us-ascii?Q?4pv7yokbKFFE0kUxJVogqhh0U7HCaICEAO1HN/ogmEbPV5o0jorP27MKc7f/?=
 =?us-ascii?Q?qqrIiToQu1TRw5x3bDH7ycSEzS4qKbIyVSWB/sS/7V9EcdPE3/xuZz0BnXhM?=
 =?us-ascii?Q?bZ41O3EkiHgCjseZSUIwvrigfSyVHQmzPXe2xFD0DfcJ7eckul2GrUSXjdCW?=
 =?us-ascii?Q?hVD8VQznPz+m/KXEfu3eLn4fc1nzEMA+ACXwEHG30GyvVF23Xl7DwQGWTI11?=
 =?us-ascii?Q?bWSiVIrZiehoXwfyMdcQMsfe0xwMT8pxe9LiwkMkzd/G9Vr/U7HKuC8Yldkd?=
 =?us-ascii?Q?Rj4AHx7GTrorxKrJSRTDU5hYKtbQWgEmMvQOqvnkUd0OpAUYFoUveMIKxS3u?=
 =?us-ascii?Q?tgl+Kbg9hVv2E5Uc/DtusC5eRzRKOU9HrDiYYmNHIisJA7G8Wrb9T8ysp3Y8?=
 =?us-ascii?Q?X8ACNHvAtMtK+YyqXYixzluOy/YU9bRDSR15Mj0pDOj4hi3nIL8If+Kesc/J?=
 =?us-ascii?Q?Oi91CtVe/PMUTllp4asLoVis7Lz2IMm0/I1UzLoU7CZjesVlzWKaNzR8qPkn?=
 =?us-ascii?Q?ADRirv0jSy473rNmhZdTlUmJPNZnZ8bkv4rfaKB3yvR+sBx4B5wd/udLdCpC?=
 =?us-ascii?Q?2z2eoDJnJt87lPIsGT+Clt6s0ajS3cVOGtCMS7wJT3tsT38rNnBiKFEdjAaw?=
 =?us-ascii?Q?0O/9fyFm2YRNvw0fcwMcW0G23qbCEY34EeVjTq5VR0tnueoXpOUeI+5mPPU2?=
 =?us-ascii?Q?5DrGXLGTDW0HpqfIIquPDXKQNFrOF9vXYEuMY4OqjNXnvxAzSupeanpgOJ+q?=
 =?us-ascii?Q?M2QysDzf5YYMP1hia76dclWO1G15MFGwG0bHSu0UKnophj7xA3vmLl1EB8vT?=
 =?us-ascii?Q?PGSYg3WjRWG7PtYqYiTVgkhFcfyj2zI/uwjbbYv+qF2I42OlSRHveobeMpRP?=
 =?us-ascii?Q?kz2GaRhO8U8Noc6SVX3d6wKh6Am+D/gC4kv4hn21t7CRAvEwjS270grjeRJ/?=
 =?us-ascii?Q?mizCd8U72M7aaMy0jh3ggjA7zpjq67DaNsuOegF5YuCOnzxv4H3vOvwsjdYE?=
 =?us-ascii?Q?XueC5/pdtselGi8xyY4/8bhHoSopozAbzTt8hfXHpmlujqJg6ktn9iK7zlSC?=
 =?us-ascii?Q?Cb9yNVdhG2Jc26iUUns79I8UO64rqVtg+RrQU2QB0kQlVV6TuEiDP7VFmOnq?=
 =?us-ascii?Q?G0fIxS4D3W4ny6IedUr6+UcKXIn0ArADb0RX6SnokJZoEmvqvyFpl3aU/NZF?=
 =?us-ascii?Q?SJOfWWzrNNwPXjKPibhNJszp57jreNtHtlC4igFwm/qrPjRmxxFs3g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5217.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3djauXFDYkvWfUoXpcNEwmzubbWKf1ze1NT1ULJ3hPxSUl3ZdGdhu+QDaIKZ?=
 =?us-ascii?Q?x/Q3vHohT2E6kqJ8XrheXhay13/VjhsRUnNaXMyspK9lm9oUX5CHNBTtYsDc?=
 =?us-ascii?Q?rwp+rzkva4hGDtYE+WLInvLOBpxR4Nw6LuWzJzrjsEz+D5R8WUkIihB4T9Lt?=
 =?us-ascii?Q?y/KtOgBT2zvB5j91dTFsKop+0T8lCpNDy3wj4G5bv3fy3lGmyh/0XDTmhsAj?=
 =?us-ascii?Q?6Fkk+jFMYmnST0SdGWV7FjItq1duE1ZCQeIQnqkvduwkOzV8t2GNGEyEtHlQ?=
 =?us-ascii?Q?pwFndec8zKUSebnJF9yuX2uipWCRyEcUDw1kjrPomZwGCpidIsrjVSa5rhnY?=
 =?us-ascii?Q?UfwINkXpYYgwhgAr+acsiJXszhg8R5zkpjbsDgipYCpvXwRwIm79cLseBav/?=
 =?us-ascii?Q?kNZTsTnGnjXYRZUMbKlIbHWNL+F3xGQpBfGCngPRogn8VoK4VlNoJUFYvgl1?=
 =?us-ascii?Q?g+D+CNZNACturcqPKps/GcDjx6vBFAOq4009AMSFwdNxvt28/G1vX4Htqo0f?=
 =?us-ascii?Q?3MYzkmJ5zKmic0/s74SFkmbKIwlJvnuvdLfFvNpomy3KFw/PPHpLk1AeWfgw?=
 =?us-ascii?Q?5kZIx5aUKtIFxIxZO4zgC1etogKSceAlV/4s01O7Lkuua5zOEMG+rOB+CrJn?=
 =?us-ascii?Q?hXGp9yYqWcU6Vmp+OdHibx2qRfT58LsDYfbj90n/MO5VIv+050ycL5Y/Ngjb?=
 =?us-ascii?Q?H90RpcXiijAZ8Hjs0qUMp+d8iJNEqn+9KBSH5i/zvRY6+1B4HYhPoUl/3Kij?=
 =?us-ascii?Q?dQrjo4NUBOLwfw2/LMMYfRETx9/bZzQDC9ozfDYpW3K/p1MDStwCkiTVeLpM?=
 =?us-ascii?Q?3Ork7kBDFDxOcywr+31CnvHqtaKMvDHlaVHVBDrfRJw9J5nmvMu3HtlooO2C?=
 =?us-ascii?Q?HXVtD+Xq0kt2DPyEpClHKIP1tz2itjW1XB5Y/oERsjmh+zBS/zFdTDAkHsxe?=
 =?us-ascii?Q?Nf3Axod6VM5H+2Bol7oXoJMyYSgAaBO6tf3ChbIal5H600sIgHzraxZjab9/?=
 =?us-ascii?Q?cBppz/ZTVyvJchXPeek99/AqlAlI7rvHpmhiwnPaVAuOsF4Ug0awh5l9tFXY?=
 =?us-ascii?Q?d6t1M6WuJH+jxJF1j6LsCN6MbaX7v9dt3Btd6beBBMS/gJRjrg2pa7jAl4bR?=
 =?us-ascii?Q?KImk845HS3Pbuyzd6D3/+kSiSa/SnG2Z1R9b3zXTOf8dvADJdLUoWpUNTprz?=
 =?us-ascii?Q?rLMAvaav05YDzVd1z9YNO2EsEDOjVa3rs64Reow/bndk3oSluXU98yMWL50w?=
 =?us-ascii?Q?vLIDl6tR6fHxgu0qfenUkvTN2xm27rfKBaU3wSdGfJbCOsybdNcPfJeYAlrk?=
 =?us-ascii?Q?9gXildm5bhwcT+KTbHhvmTvDyBEqYnX+e4XMyj3hc8FEcrAld9Aqyqonas5K?=
 =?us-ascii?Q?mG4rLsOBtCCo98fJQeyZQPspjpntioQDwOj6ICxFXI+Fjx17ZvdLnA+n1kQc?=
 =?us-ascii?Q?CYcbOnr6vtDrMp906tKymc7p+cNgcMM/NoNMFj0RIYp86nUDSBvnaSBCWerJ?=
 =?us-ascii?Q?5ZumS5IZykElAA1uBNU9lVIZq+ICp0YIHx+PcTbIvZVvUUIGnNGkkteimgPU?=
 =?us-ascii?Q?fgGNSxZk0vIrLVhTnATz5jighTLCzJ4tWH6RVlym?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /9fgoKdenHxO3A/kbVDVMTMRuvYniSVeD6rhm3SjIvVzNnxgqE+5H2PcnLsDekQiwpmXs57J8j95Zb0c72g/rHJIPL5hIr65FRveNewjlmD4LuJ94sIFqvm5jmJ27nnnEn5fxA7/jTrsIy14w5TyISfqJvAUx/8I1VLUsVrL7SClcbCahJUMpWQj1H1qdJartXV1DkOdq+h6GX+uWYGhIY7dfG8QblRFcp+mIgv8EWrgx9RWMj3eHzZWH3B8x+bBB5hRLqS56l1UFa1hXpoJduLBoMQ1bH/VIlsyPJjQhpnUsKjLoE619gJk2tBWuN75qTHiNu56BpSe8VmHQ5VMLQaPi1s8aNyoYIhLHIRm9nlcvumMSG9Y89oNYJnlfECEBbwxliQFiRXgzYXQzb5H3e2U11lH3yEEc86MILQToHbGeaHPUZeVqHNmc5uANrGmR/Fc8ljyIQBz/pmxUe+Pg6b66NUJeM9kNBoi+8ok9bIVO280KIyB/LB4KB7XTaik9Dy/dJDjLHpb9kH9kR5iWpD7lM0vHxSQSGR/k0KV9VN8PjKw8Tx9j/xwts3ayX5HtgSYP1oa4ypKWn+9GF7ft/LglZvdwrhdpz1jKE7WKAM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5217.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfaac5a7-db21-47ff-2859-08dd415d1230
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 18:36:54.8758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mhHpNCoZruSvmomTD5254DdOG+ykJAXo9BcC/gBrpdxME4I4vt/EgWKVp7X3pSEPHzy8tlBPTSvPDsnQgfL+zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB6001
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_08,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300141
X-Proofpoint-ORIG-GUID: SOCore22ldVxRen_Hx6-mjYOgQFSfW_Z
X-Proofpoint-GUID: SOCore22ldVxRen_Hx6-mjYOgQFSfW_Z
X-Mailman-Approved-At: Sat, 01 Feb 2025 18:02:48 +0000
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

Hi Michael,

We see an issue with the mainline kernel on the Azure Gen 2 VM when trying =
to induce a kernel panic with sysrq commands. The VM would hang with soft l=
ockup. A similar issue happens when executing kexec on the VM. This issue i=
s seen only with Gen2 VMs(with UEFI boot). Gen1 VMs with bios boot are fine=
.

git bisect identifies the issue is cased by the commit 20ee2ae8c5899 ("fbde=
v/hyperv_fb: Fix logic error for Gen2 VMs in hvfb_getmem()" ). However, rev=
erting the commit would cause the frame buffer not to work on the Gen2 VM.=
=20

Do you have any hints on what caused this issue?

To reproduce the issue with kdump:
- Install mainline kernel on an Azure Gen 2 VM and trigger a kdump
- echo 1 > /proc/sys/kernel/sysrq
- echo c > /proc/sysrq-trigger

To reproduce the issue with executing kexec:=20
- Install mainline kernel on Azure Gen 2 VM and use kexec
- sudo kexec -l /boot/vmlinuz --initrd=3D/boot/initramfs.img --command-line=
=3D"$( cat /proc/cmdline )"
- sudo kexec -e

Thank you,
Thomas

--- soft lockup log---
[    1.690032] efifb: probing for efifb
[    1.693989] efifb: framebuffer at 0x40000000, using 3072k, total 3072k
[    1.700996] efifb: mode is 1024x768x32, linelength=3D4096, pages=3D1
[    1.706999] efifb: scrolling: redraw
[    1.710981] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    1.716806] Console: switching to colour frame buffer device 128x48
[   29.176649] watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [swapper/0=
:1]
[   29.176655] Modules linked in:
[   29.176658] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0+ #1
[   29.176661] Hardware name: Microsoft Corporation Virtual Machine/Virtual=
 Machine, BIOS Hyper-V UEFI Release v4.1 03/08/2024
[   29.176663] RIP: 0010:fast_imageblit.isra.0+0x2de/0x460
[   29.176669] Code: 07 49 21 f1 41 83 e1 01 46 8b 4c 8c 40 44 89 09 41 89 =
d1 4c 8d 79 08 41 c0 e9 06 49 21 f1 41 83 e1 03 46 8b 4c 8c 40 45 89 0e <41=
> 89 d1 4c 8d 71 0c 41 c0 e9 05 49 21 f1 41 83 e1 07 46 8b 4c 8c
[   29.176671] RSP: 0018:ffffc900000437a8 EFLAGS: 00010246
[   29.176673] RAX: 0000000000000400 RBX: 0000000000000005 RCX: ffffc900006=
bb140
[   29.176674] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8880121=
46600
[   29.176675] RBP: 0000000000000080 R08: ffffc900006bb000 R09: 00000000000=
00000
[   29.176676] R10: 0000000000000001 R11: ffff888012146580 R12: 00000000000=
01000
[   29.176677] R13: ffff88801214658a R14: ffffc900006bb144 R15: ffffc900006=
bb148
[   29.176678] FS:  0000000000000000(0000) GS:ffff888026a00000(0000) knlGS:=
0000000000000000
[   29.176680] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   29.176681] CR2: 00007f8bc160c238 CR3: 000000002ac38002 CR4: 00000000003=
706b0
[   29.176683] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[   29.176684] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[   29.176685] Call Trace:
[   29.176687]  <IRQ>
[   29.176690]  ? watchdog_timer_fn+0x220/0x2a0
[   29.176695]  ? __pfx_watchdog_timer_fn+0x10/0x10
[   29.176697]  ? __hrtimer_run_queues+0x112/0x2b0
[   29.176702]  ? hrtimer_interrupt+0x108/0x270
[   29.176704]  ? sched_clock_cpu+0x60/0x1a0
[   29.176708]  ? __sysvec_hyperv_stimer0+0x32/0x60
[   29.176712]  ? sysvec_hyperv_stimer0+0x70/0x90
[   29.176715]  </IRQ>
[   29.176716]  <TASK>
[   29.176716]  ? asm_sysvec_hyperv_stimer0+0x1a/0x20
[   29.176722]  ? fast_imageblit.isra.0+0x2de/0x460
[   29.176724]  cfb_imageblit+0x433/0x470
[   29.176726]  bit_putcs+0x291/0x570
[   29.176731]  ? __pfx_bit_putcs+0x10/0x10
[   29.176733]  fbcon_putcs+0x139/0x1a0
[   29.176735]  do_update_region+0xf1/0x110
[   29.176740]  redraw_screen+0x22f/0x290
[   29.176743]  do_bind_con_driver.isra.0+0x2ab/0x3d0
[   29.176745]  do_take_over_console+0x3a/0x50
[   29.176747]  do_fbcon_takeover+0x5c/0xe0
[   29.176749]  fbcon_fb_registered+0x4f/0x70
[   29.176751]  do_register_framebuffer+0x1bc/0x2a0
[   29.176755]  devm_register_framebuffer+0x28/0x90
[   29.176757]  efifb_probe+0x544/0x720
[   29.176760]  platform_probe+0x43/0xb0
[   29.176763]  really_probe+0xd9/0x390
[   29.176767]  ? __pfx___device_attach_driver+0x10/0x10
[   29.176769]  __driver_probe_device+0x78/0x160
[   29.176771]  driver_probe_device+0x1e/0xa0
[   29.176773]  __device_attach_driver+0x99/0x130
[   29.176775]  bus_for_each_drv+0x98/0xf0
[   29.176777]  __device_attach+0xbc/0x1f0
[   29.176779]  bus_probe_device+0x8d/0xb0
[   29.176781]  device_add+0x4f1/0x6e0
[   29.176785]  platform_device_add+0xfa/0x260
[   29.176787]  sysfb_init+0x109/0x120
[   29.176791]  ? __pfx_sysfb_init+0x10/0x10
[   29.176793]  do_one_initcall+0x5b/0x330
[   29.176796]  do_initcalls+0xac/0x130
[   29.176800]  kernel_init_freeable+0x134/0x1e0
[   29.176802]  ? __pfx_kernel_init+0x10/0x10
[   29.176806]  kernel_init+0x1a/0x1d0
[   29.176808]  ret_from_fork+0x34/0x50
[   29.176813]  ? __pfx_kernel_init+0x10/0x10
[   29.176815]  ret_from_fork_asm+0x1a/0x30
[   29.176819]  </TASK>
[  432.306986] fb0: EFI VGA frame buffer device
