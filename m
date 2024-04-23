Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64D98AE81D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A9F1133BC;
	Tue, 23 Apr 2024 13:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="JPmxDbJN";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="K89Ra+Vl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D991133BF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:27:13 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43N7Y4A3031878; Tue, 23 Apr 2024 13:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=U+dFQWNn3nRl/EDnKxKeI7RMW9xUWL5O+BDYykvJD00=;
 b=JPmxDbJN6H6iWz+ktjydf1a27VLLWR6qWuIFNeOVzy1ftaPJFgMC3MW99ntozM1IWsLq
 XKNsGWdmo6PqbiSjKJxo34FbwWLt6MM2C2lh7dTewvFRc8r0AozRUgWcqngqAyARIHpm
 ZNJ1NXpAdbwll4GWPn/4QN3CReojMRCCWXvWtsPXnVNnTnFaT8xN8nc1Ll3wdLrbkPRt
 yAU7qFqmfXGUvasWj819lTrRZlCquIAAZYhh+znGLAx0GAPA00STOolVqqMYdDwC6amZ
 uM0b9oOtg29WjHKaa4ca8oAWpTBiK6A3bDomjKpXOnVrYMEaGWIIBVLdsYJz0/rM3Eu8 zw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm5rdw6d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Apr 2024 13:27:06 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 43NCDHQs025469; Tue, 23 Apr 2024 13:27:06 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3xm45dffd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Apr 2024 13:27:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5iTE2rtAI3KougUDgftVjxCEJHin4fjFzctegeSVoxeQmoicrnwSjzorIKN0IfiWk1rzHr4L6/rsK9hg/k5jdLI3A0U1v8zqPuRv2Yzew/JozWvOSQPfcJW9+efXgIPzdhjc6rEMhaNGIqhXwdTKuqUcPBi/c9WHeC2U1k1vJyxXaW7eEWqTtsANhDINeuzBXajtQnqPY1Cjp1liMMpo3xkDlNXQy1RRV4f79sqADB5KleG51jbMIKxMnnjJq0qmZHLf2AjuwH2RXiKlsK1Lu3iRTrX7UtZoNWY5bAetf9xb3ahEI8lYXuI/qqgXvM2m6hr2WRWT1p4XWo0L04LzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+dFQWNn3nRl/EDnKxKeI7RMW9xUWL5O+BDYykvJD00=;
 b=S17SJPmeNkBoKIH0Wkpo71X3zziQqztmBElQq1rV+guOT0m8WM+PGLWR12NrfY3ffJRBkV2zad1fhkfPm1ugSR7fdCxHSEd/3YYAenQ6e79fHRpwg/vyaD/VmLEbB3K+gxl3PACJBO62cQFjwF0Z+GzUkJvdX6Wg5JE+5x/6gz/3ugzePO9s06rMX9VnEu4OsW/sZl1LeUe+95DbuUKhrvKwgpG5eUmvvpOBXHMBbjP3M4RRRyRdAabDZDxp2VyrPNpk9p6XhNCmJFFAvOuq13bs7o61xyz/UHrESDqAVtS6SpZPrwT1Uc2RnrapBncmowz0rps79yGQk8JqPWCizg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+dFQWNn3nRl/EDnKxKeI7RMW9xUWL5O+BDYykvJD00=;
 b=K89Ra+Vl2BBhRH8scXUAMx5AE+Xo9SokTX9uXa7rz27qYPeMdil3Lejg6mJ7xp3AtCYyUoQhkOjZ6QY3KqMYl5ZG1Oqc9Z1rDZc5Wf2xtLfcBfdWgJgpON22pcslR4TCQK9s7NiNelHBa/0XbAS/MYgR/L/Zq64OnjSZqJExquo=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by BN0PR10MB4869.namprd10.prod.outlook.com (2603:10b6:408:121::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 13:27:03 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76%7]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 13:27:03 +0000
Message-ID: <c2bf36b5-3145-491b-b272-d5afae73db7f@oracle.com>
Date: Tue, 23 Apr 2024 18:56:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: fix incorrect address computation in deferred IO
To: Thomas Zimmermann <tzimmermann@suse.de>, Nam Cao <namcao@linutronix.de>,
 Jaya Kumar <jayalk@intworks.biz>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tiwai@suse.de, bigeasy@linutronix.de, patrik.r.jakobsson@gmail.com,
 Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com,
 stable@vger.kernel.org
References: <20240423115053.4490-1-namcao@linutronix.de>
 <1722c1b6-59a5-429d-905c-bc1951a68a68@suse.de>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <1722c1b6-59a5-429d-905c-bc1951a68a68@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JH0PR01CA0124.apcprd01.prod.exchangelabs.com
 (2603:1096:990:54::13) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|BN0PR10MB4869:EE_
X-MS-Office365-Filtering-Correlation-Id: b0fb3b9e-714c-40f5-1a5f-08dc63990ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEdiZ2VpUmxHcXQ0ZXVzUVQ1TFJzUVFlekpBcUhlMkVlY2QzbEFQM3VmYU4w?=
 =?utf-8?B?bSszRmFibHA3U2VjZVlEVW1nQnBXVUE2SlduNzY1U0JYMWVVWWRIYnltN2F0?=
 =?utf-8?B?T0hyU1RoVXFvaUpuazVScUJWdElBdWlIU2FDSm85OVN0QmVuTWZvTnV2bUxM?=
 =?utf-8?B?S1RkWWdwUXpaY1hKRFVrd2pUbUg3Mi9oR1JsMjRyeXB6V1k1VWwxb0VQNWJz?=
 =?utf-8?B?VklueEozZWh6M280Q3BvTmlaTUZxeDVXNHlOR214R2hrSlMveDhHLzhiTGJK?=
 =?utf-8?B?Ujh2c1A3QjJnQitYYVcvQjRpNTN3NnN5UHAxWU1aeDgxeStIMkZVTFRSK2VB?=
 =?utf-8?B?TDd2NGhRSThuVWdQa2tpYWluYk1ZVENWTEUzWGJsUXNzNnE1d1k4T1NOMHpy?=
 =?utf-8?B?eDNiUWxPOFJlakpueE0wZDJzbkljWUdVczNRYU42TVRGS3ZWT0JqRjM4K1Ax?=
 =?utf-8?B?RXh2MUJIMHg5TFlWUDEyaktWVkZPZVVkeHNpZjZ4QVVsbTFOYWJnNWFHYnJJ?=
 =?utf-8?B?SjVyQVphOEZIN1RLVUtkOXY1bFBoaEgwaFRWZXlpVEN2UXlaNVl2NEpoSHY1?=
 =?utf-8?B?TXdPRjdiakxmNzdzWENhTzNSL05vQ3BJOXFyK2V1ZnYxaG9IZXNoV3RmYUR3?=
 =?utf-8?B?UFIxV1JTRWxua3NlK21QRy93bGxBZ1dOaG5hdHBGT0ZjMHpHL1FOa09nVmRD?=
 =?utf-8?B?OStlZjc0Y0hSbzVhYmo4UGxYV0JlQlJqODhpbGQrbXJjS2FuR0M5dCt2VkxQ?=
 =?utf-8?B?UmhjMUoxWVBVRVk2OXNwVVlMMS8zNEN3T2hJZXVYOE5OcUhTM0tlM0c3NWFq?=
 =?utf-8?B?S0NMTVhEaDFOM0cxTkpWQnVYaWJTUWUwdk5TTCs3SmhaVWhsbXFXenYwalFH?=
 =?utf-8?B?NTJkWWhkSlVZRmh3aDIvRzBTZ1NLZEljYkJLREI2NTUzM01tZ0RuK1JGS1R0?=
 =?utf-8?B?VnUxd0JYQWwyM2N3dHdOeFJubUI1aGJ3ZEZ2ZitXWS8vSjNMWkVCRUVESkwy?=
 =?utf-8?B?RXR6VGdGeWJJT2lmZmo2NWZHRXdkdFNhcEdycUtQWGN2VTlSczJvdkJLQXk1?=
 =?utf-8?B?ZjQxUVNGdkhKZ202TE5LTXM5UzdRNmNGRk9GbWkyL2NLK0V6WXg4MVFDZGZt?=
 =?utf-8?B?ODMrY0FXWDN1UzRMYkJhR2pFeVU1SHd6OWRHeWx2VUxiQ3VrWEpFWXc2NTdL?=
 =?utf-8?B?amhOVUVSaFdDOFNhbFpHSUJDZmNFOWdFV0kvcXlYQ3dCU1cxd2IxRVNwcGVT?=
 =?utf-8?B?SHBoQ21jSmp5ek1DVXZvU1F0U1VSWjFDM1VnWXhCdFhFTWxURzh1LzlySFBa?=
 =?utf-8?B?WllhRjhQMVVMVkN6WmVRbVoreWdWeitpUGVBT2VGSWYvM1hvekhRTFo1QWln?=
 =?utf-8?B?ZkYxZUNqR2xTQS9aNTZGVTc0SkNPbzhKWDVyUGtGMWRWa3orOVROMmIxdm1m?=
 =?utf-8?B?L3M2UlpyN1RDN205dzV4NnBEcFNLWWtHS2ZjMVdZNWlHdzRVamhqQ0I2dVNs?=
 =?utf-8?B?K2ZlZFYrVHY4d0tpNm8rV29NYXl1UGowYzNIYi9CUW0rRjNiRHU3NEpMd2xF?=
 =?utf-8?B?WEc5UUVDZEJEZ3h5aG1CNnp4TEFleEVsSXJscWNkN1NNM0ExSDMvdnBRUGpj?=
 =?utf-8?B?eXpVa3lpLytDbnlkdVVIclp0SmtrajVsQTcxdW1VdnBXSE80dWhKeG9VN00x?=
 =?utf-8?B?ZUVFeUw3OWw2ZHlSWmlPdTNiR3Y0RlFGSU9PT3BlRzNWZE9DeXBxdll3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzJhdE5PTkQwOVd4NkVyRjZLRDdXV3JBeElPYTR6WnlOL3ZiQ0wxenBDcHVa?=
 =?utf-8?B?cXZVVXFVZTN2Q0JQRnlrNDZSY3phUGdiQ1k0eUFIZHZ2RTlGR3NxTmVFOWN5?=
 =?utf-8?B?cDhvaDFTN0ZPUm1HVmdBNzJUdlkxR0tXWW5YYzVSVjRYR0N1NmhyMjdmNm5O?=
 =?utf-8?B?MkYxQk9MVWhpTlc0clpXaFVKTHV1ZWkrQVl6S1h5TW11TldyZEx2QU1XSm9R?=
 =?utf-8?B?K2luNkJxMTRUNEEwY2h6bmVwZkFIb2VhQ1BwMkpjSHUveWw1Z1pQVG55LzRC?=
 =?utf-8?B?dGVQRUxGZ1VmdUJTMVBjYXI4eCs4T2RoS1dRVlVJa2hsdjJCTXRKYXlvYVcz?=
 =?utf-8?B?YnNhcVEzeEowUDRBNFpTVEZic004VytZNzZNVHFmWmhZdXJGZ0wxNnJJYU1Q?=
 =?utf-8?B?dEpUK0NoUmFtYjFDV042S2I0S1JTMUsyQytYVGVKV3djL1g2T0FVWTU0NkJm?=
 =?utf-8?B?MHZvQVNKeFUzb1N0NDZWUXZDTEFBc1oxclF2eFhnMERyOE9KNVUwNmxJRVBN?=
 =?utf-8?B?T1FWUzkyR3pvWnpDV3N4VmN6bVJjZUlDMjMzSmdzNGRxMjQ2djlZQUNBbkZR?=
 =?utf-8?B?dUFyUTJkclQ5YWlFTm5TN2I2d0Fobjh4VGlDTUwwTnFQWitPSmpRWWd2MVpG?=
 =?utf-8?B?eHZ5T3ZQSGVaZEdVTFNHM3QralUvMGRPVDYvdVd6ODloc0JTM2U2dEp2OVpH?=
 =?utf-8?B?V3lnK0hJSWVOY2FSVzlVMWZLMGg2emRTcWlRWUdHbWFYajFlUXFQNlltUW1C?=
 =?utf-8?B?SVlBaWVoalRUczd3YzZZVUlkUS8rYmlybFliUXlKOExpOTZEVTJsNU1VbjRE?=
 =?utf-8?B?Sms5ejd5dFBhWlliY0s5TUs4dnI5Zk0vMWFEVlBHejlycWw4MGR6WDB2NjdE?=
 =?utf-8?B?N0tTeU5CN1JGSU1NazZPek9lT21oRXFTRGFuZ1ZqMTFXOFJYVmNiSFY0Q3hO?=
 =?utf-8?B?WE9FaEZPUXhKRjJpanBwYWlTdWkwZlV3VU5vQzBKYXgyb0RlYmttcDB6Tjhx?=
 =?utf-8?B?TEVmRUlIcmpCQXg2MTE0ZmJKcWxXYktCTlRKUkJaaXdiR2ZGNmtWUDhFdHp2?=
 =?utf-8?B?Q2lVYk1wcW43QXRDQ1pESWFMU2xrTG9oTDJmZzcyR21lSmZwdlBvcGdTZ3d1?=
 =?utf-8?B?aEpzczJnTENKS3hWamhuYkhKOEJUb3FqL1hnekxPZzNjay9ZYUZPZHJGb0Y4?=
 =?utf-8?B?MXQzVHJHdkpDUkRFZ255TmplTUtTOTlvbmViMGRLQUN3dE9qKzVRNVd3a0JV?=
 =?utf-8?B?MFZ1MDZMU2srVDcya0h1UXNwMjRSVnBFb292R2s0ZWRvZCs0WGw0YTgyallO?=
 =?utf-8?B?MFpuZFJZRmZNbHJObUNBWjViZitkV1EyenVzeERBV0ZvdTRvS28xOFJzeTFn?=
 =?utf-8?B?QWlvMHZyUnlCc3llNmx6ZXVxR2o4S01KblpRamhzZDFyQlk3VzlNNnFVZm9K?=
 =?utf-8?B?VVBpRnBYdzczZWsvRXFMdmEyTUd5V1ZtUkVqMXIvRFFvMWU5czVhdkFYOUNx?=
 =?utf-8?B?a2RYMUhPM2NaaUEyTWNCYVdhc2RaMFN3bXpLdnNORzFWN2hVdmUyQWNzVmxU?=
 =?utf-8?B?NjBocGpzNUdJRFVqb2R3Rnkra2hCcy9KUzlXZUcwUHFRYVNUSU14NzNiT0No?=
 =?utf-8?B?TG9UN3NibmpyRVBHc0Y4NVZTbWFBN3NHN2FIa2F2a2FNNUVDVkwrV0svQnc0?=
 =?utf-8?B?dlNUd3JHeURjM2FZZVNmWkNJSHpGYlhlWHJGam1SazJKeU1XWitXRVJRYXpy?=
 =?utf-8?B?MVdYczVzc29WblBsYmdCOFcyVzNZZE1hRVBrQ2NYZlpwNHZGTi9HOUlwR0pp?=
 =?utf-8?B?R01SL3JMQWpPcmhlRE53eWdmTXY3Wm5ZMWhBODNBREJyMnR4dFExMFk3Vis2?=
 =?utf-8?B?blp3Q2pDdXpoYmZoSHl4dGxjYXBtSkRDd1VGaWx5cUc4YzR6STFLc3BrUUhG?=
 =?utf-8?B?VG8rdkZvZ1hTb2gyaXEweDJFeXhvNkxtekFZVXVWY2NwZkdVSjVoaWxuUnk5?=
 =?utf-8?B?ZEMwT3AzSWZJNFdiYjE4YmpwRGNKOUF6Mm5GNzBMMXlIVVdPeEN6KzZOcE5J?=
 =?utf-8?B?bFNMbTVsekIrR0oyem5wNkNScndnL0duWWpCODF1eWhuVGVGZDRaQ1l4d2NQ?=
 =?utf-8?B?dy9pMlhNaC9TRzRlSkwzcXU2cXhHWnZaNjBBcFErNXlHRmNWbjFWUDhuOU5P?=
 =?utf-8?Q?3G4DvJUZHOhKIY/OPm424R0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9ERhjl2NqTaCb/nzIty9FZFqI5xr2G2fnRIpZOQzBx4Cg93AcCC+7/26PKHeOiL43gOKAzAPljQPHBhrgqaVWOBOzTzlAq44TqQycTpLm+IMmfdAijfw76Lpfxtd4ZIlV/p2+3bKxLLvSVA5nOI8dHZWDmDRFTYDFON4qdZ1PS0j+19iHTC5bOrfKSmi9to5f/X5+j0vPhW5GbNfAJq29XQRKbbo5nabZp2MAxXuHV57MNTYz+pXKHIwhooY/L2fP2hQDwY6a9V9TFu0OqvIoIfM90PSl/FqVN8eCq8VXQHsybYwGq1gEaZaMlwWpSIFcHV6390bgdMvPVev5KXI6JnfseHyEyN+x0z7lC6zxfZMJN4LFNuWCzEy9+cEVu19QGGSZf3sje2GKsnsdxp83R3rrXQwuSERYxJ2BmK0vp/hq0xzKkHKG2tQ/BSRUyq+PknCUUtxzOAKGv5c508qpcK/VX6Z8dNDheuxospnFCP75RH5t3JQ1f5dLjPxJxmtcMrYDcrDoRN+p4PPy8NnSOx17oVXKJkoekOC1w0V97ed8rmxrTBeS/LNMWHSpDSGahyjMOLp1P1nFbm5G2UrsHF8CBUfYjpkz6CMlcfUgdA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fb3b9e-714c-40f5-1a5f-08dc63990ff4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 13:27:03.2220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8cN3miNXP2dRpsbjEppHkhTPEo6xlyjO+wFPIqK6Uur2J9ZIW4qeLjlfzAVRBcux3I8bQsqlK0zz+1bnOfbjinU2UGGlP4ykGxxWfjTLshqBnNF8jyK7ZZOUtuE9uBM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4869
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_11,2024-04-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 mlxscore=0 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404230034
X-Proofpoint-ORIG-GUID: IxEP8HjvjfCcDORTbagzNIHyYdueev_-
X-Proofpoint-GUID: IxEP8HjvjfCcDORTbagzNIHyYdueev_-
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

On 23/04/24 18:37, Thomas Zimmermann wrote:
> Hi
> 
> Am 23.04.24 um 13:50 schrieb Nam Cao:
>> With deferred IO enabled, a page fault happens when data is written to 
>> the
>> framebuffer device. Then driver determines which page is being updated by
>> calculating the offset of the written virtual address within the virtual
>> memory area, and uses this offset to get the updated page within the
>> internal buffer. This page is later copied to hardware (thus the name
>> "deferred IO").
>>
>> This offset calculation is only correct if the virtual memory area is
>> mapped to the beginning of the internal buffer. Otherwise this is wrong.
>> For example, if users do:
>>      mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0xff000);
>>
>> Then the virtual memory area will mapped at offset 0xff000 within the
>> internal buffer. This offset 0xff000 is not accounted for, and wrong page
>> is updated.
>>
>> Correct the calculation by using vmf->pgoff instead. With this change, 
>> the
>> variable "offset" will no longer hold the exact offset value, but it is
>> rounded down to multiples of PAGE_SIZE. But this is still correct, 
>> because
>> this variable is only used to calculate the page offset.
>>
>> Reported-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
>> Closes: 
>> https://lore.kernel.org/linux-fbdev/271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com
>> Fixes: 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref struct")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Nam Cao <namcao@linutronix.de>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 

Thanks everyone!

I have tested the patched kernel with the syzkaller reproducer and 
couldn't see a problem.

Regards,
Harshit

> Thank you so much. I'll take care of merging the patch later this week.
> 
> Best regards
> Thomas
> 
>> ---
>> v2:
>>    - simplify the patch by using vfg->pgoff
>>    - remove tested-by tag, as the patch is now different
>>
>>   drivers/video/fbdev/core/fb_defio.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/core/fb_defio.c 
>> b/drivers/video/fbdev/core/fb_defio.c
>> index 1ae1d35a5942..b9607d5a370d 100644
>> --- a/drivers/video/fbdev/core/fb_defio.c
>> +++ b/drivers/video/fbdev/core/fb_defio.c
>> @@ -196,7 +196,7 @@ static vm_fault_t fb_deferred_io_track_page(struct 
>> fb_info *info, unsigned long
>>    */
>>   static vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, 
>> struct vm_fault *vmf)
>>   {
>> -    unsigned long offset = vmf->address - vmf->vma->vm_start;
>> +    unsigned long offset = vmf->pgoff << PAGE_SHIFT;
>>       struct page *page = vmf->page;
>>       file_update_time(vmf->vma->vm_file);
> 

