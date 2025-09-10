Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF8AB51E58
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212B510E986;
	Wed, 10 Sep 2025 16:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="VEnX9EEu";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eCF3Xc+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B9110E986
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 16:53:42 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AGfjx8007228;
 Wed, 10 Sep 2025 16:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=/JwLU2i2VKqhh2T52SVrIommJ7I3HnXxhWf9uv43Iaw=; b=
 VEnX9EEuC737b3OzycZMV/NCgegj8ExNXsaMwaEQe+r+XMOZDW1+fKJ85uhhGVtw
 1yjNQzLeQCdYXrxWXYeFdNFZIoQXG0ehajgrrFpBSAO2KgSKl7/v6MU8eTsYtCk4
 fhEbFmxArQ5Vtvda+yQDXmCui8p1Lj7Ou/0dsK0DBvlMcomXvSKUmiRoW+5wmPcw
 eaXvF3e4Fpg5GDJuJu0xIYTA2bIQsPR91xWt9NFv+OulY/SibOChAwD2Gl9yFz9S
 Q8Y+GYza17F9b5PPw/zv4P4z6bzaZsU/I98AV9i1RGgQtzzvhsQtSR2bM63yortv
 a3Z9deiEFc89hMU1dh+kDw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4921pecnsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Sep 2025 16:53:02 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 58AFFvxQ038961; Wed, 10 Sep 2025 16:53:00 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 490bdb9gay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Sep 2025 16:53:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKmShk13Fn269CpsxrwPF/C8YCyUFSWEBqUv5Xt0T0fd6nblIbFM5fXXNfdA5LZWKHs+eBLMJCAMCQGUNKVUJ5v+zC0qXp+IAbYhjqeTOWxn4P/xyo2UJmPpP5J6yf3AvJbWa6c6tSwtw8zAD0uqiSIFiqdF5y10FqexKFVcxopYKF5EP1PkbDlY9yeFyGreblgeWJC2ENJlsw8Q9IYeJjbEWtf91NJ9Zf6Ff5VpXjm7l29VbdWFPanN0AruoM63nBfn2abYFNEfAHf4t04lvJdZ6Y1kU0whjAaCBfYU1RHrKc8N5wmTaxrEp5dgVxqefzBcJmn+KcMR2yUUebym5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JwLU2i2VKqhh2T52SVrIommJ7I3HnXxhWf9uv43Iaw=;
 b=lRFlwI3pz6HXYTMSO8VW3VZUSaWUWDBgf2n8xJ27ccgW0kj3d4IFH2xKPgqNX1eW92cROLhVcf7tP97BnqjE1urRN3/19vSfScVFkIeox38cntrb2bHt4a29AuPnmlgeMFaM0hpNsRdJC8Fbf9bBHR4DBJ8giZBngQ33KKASB88spVoJL5oJZGzOV0UhIhd5YUJjJEoRSF/5siXHfIGd5/eReuJ2lbLcRcMkSc6dHZrXJnDBeI3uXHsiBqcUiBaj8RNF/ikhG8edemjldIM7PzEV+WXwzJQ1S9SJJ1ZpFqawgsuhcSLcVo3Vu4wfrRvUF+k4OaUrB+t2EZRPtcxyuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JwLU2i2VKqhh2T52SVrIommJ7I3HnXxhWf9uv43Iaw=;
 b=eCF3Xc+AQCOk/fcSCWbhB2vVt7SIxWwgORo6D5SXBA73XO1yojyrze7dxxBjAOkLDWVuginefVvD5Kn08xNEXRQqt7FxjmReW584lZN+wz9150tkggu8bJSBnlqCDqYwngT0gpR0adyuLHODg6szQExdykVmYhsfxrLfNO0ggFA=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by SJ0PR10MB6400.namprd10.prod.outlook.com (2603:10b6:a03:44c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 16:52:57 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 16:52:57 +0000
Message-ID: <1184f090-f000-471b-8b66-c4f3154560f5@oracle.com>
Date: Wed, 10 Sep 2025 12:52:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] DRM IDR to Xarray conversions
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, willy@infradead.org,
 jani.nikula@linux.intel.com
References: <20250826154900.405480-1-sidhartha.kumar@oracle.com>
Content-Language: en-US
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <20250826154900.405480-1-sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:510:23d::23) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|SJ0PR10MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: c2dfe722-ae92-4974-6321-08ddf08a7e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHV6L0FOREhEMzVWdURjSW5jeU9jMlNlTjV0Wk4yc3RyR2pjd3VQWm9oVHB2?=
 =?utf-8?B?Vk5mS0Z3NnU0c2J1ZzVJVjQwRGhvL2l0d2xyRW40c3V1WjlyWGJEN2FvcDA0?=
 =?utf-8?B?NEhKN213d2dVYTFwMU81V1pIaUdRTkh2UXMwMStxR0FjQkpITnFpR3VoekhL?=
 =?utf-8?B?eUM4R2dxbzY2cmV6czEyQjgvbzFUWXZVTWZ3Vm9XNnBvZVZWc0QyQ3JTRWNF?=
 =?utf-8?B?RkYzSUE0R0htS1ZaTkZRVTJ6YUY5L29PTEVCNE8rMXdtNkUxcVRNeFF6SlRJ?=
 =?utf-8?B?RWRKdDBUa0tJeHFPcHJZMDRiSlo2Qm5Sa3Y3RXFyMEZvMkdva1JpU3JkQVFu?=
 =?utf-8?B?aGF1NkRJak9OSG43YmRUdnNRZDhLSVZlT3EvQmhqSFVjbU5MMkVBRHJwVCt5?=
 =?utf-8?B?M1IrUmkwTGtpL0NXdlZyTUQ5bWI5NGdoWFFxdFNtUzZqMzY2UldOb1BWVS9Y?=
 =?utf-8?B?TGVMekQxb1hOVWlsaTgzQ21hS3NSMVNHQU4yM2dMcmdRSHAyaFUwVUhXYm43?=
 =?utf-8?B?aXpYT2JrUVpaTUlCbVUxdmpqL2IxZWpvZWV5d3d0d21Rc3h0d2plRjBuR1Bx?=
 =?utf-8?B?ekF3T2VtK3hOZG13ZkxUM1QzeUlHdFZ0T2E4STFleVkzQ1BIM3I4SWQ3eHhY?=
 =?utf-8?B?Ylo4M2NWc0t4UU1xSWRHUnVja3NEd2pZOGtUcFN2MDdhM0hjYVEvUmk4bXI1?=
 =?utf-8?B?bkJ5ckJxa1kxbEwxRzlVM1RtWkpiRWl6SCtCNnQ4eU1RRWNCcnVmT0dJaG1W?=
 =?utf-8?B?SVdtczgxV1c4dk13WHBrMElPWEkrK1BiVlJRR3R2alJtTGFxOTVZdVVZaHpp?=
 =?utf-8?B?T25KeGdabWZrM0dkY25zODV1akxZWkhIdEdVdFk5NUpjV1pWSlpSRUptU2VF?=
 =?utf-8?B?Zm5rR3RxbGNBS1pZcE5kNTZybVEzOVN0MWZWaEliZzVWc0IzQm9ZSGlNR3Ns?=
 =?utf-8?B?Y0JRdXcvU2NXN2RDYzU4RG5PUjZreStMUVB6ZlJvaXhtRGZTc0diZ3dHR1U5?=
 =?utf-8?B?eEJyUXhDSCtlRUZBYzVkZks1NEJDY3puT0NmcGNoRE94WG03bnNtM1pSaWtm?=
 =?utf-8?B?UkEzc0MzcnpJWnV4WE5ieVZNZWhFUTBKYjg4UiswVm1tODZ0aU1jbU8yVW5G?=
 =?utf-8?B?M2hHaHQ1WFVvMmhTOEZFZHhHcndBRnNocEFpcXppd2hWT3hmcGJTTGwwazZO?=
 =?utf-8?B?VUZVREdLUndKSHVTdWRZeHIvaVZTSklnc09PREFGQlB6Wlo3RDRGSmRiWnlN?=
 =?utf-8?B?NUplUUpiQWFLbTJmVGQ1UEpYTGx6bzMvQlFGTHc0SG8wUXVGS1ZBdE1zckhL?=
 =?utf-8?B?dCtWVXFTOXczcHpzL1YvWVNLanpBNXoyWms3VTNEUW1reTVubDF0WlpBd3pC?=
 =?utf-8?B?WTNET1k5YUJ2NWIyU2tGRms5aUdXZWpnd1VBRUwrcUREL0dTRGxOVFplMGNL?=
 =?utf-8?B?bDBlaDIzTU9rZS81SDZDR29YY3dQN1A0dTlFQVlsUHJtMEZqVlMvQjNJeGgr?=
 =?utf-8?B?b1FNb3BIalVmUTg2aXhyZW5BU05iNkwxVlh4dkY1cW1EeWJ3MWVSZ1l6Q3Rk?=
 =?utf-8?B?NEhRVUJ0QnRJTkRYZVhuOUEyME1MUHI0ZjJGendhSFpYcFdRSE1Ibmk4dzA1?=
 =?utf-8?B?Ny9QMmNmU1BhSG1nZGc2MEtMSGw3VDRLQUtWc3o1QVhWb0lvSHcrR2RuMGR0?=
 =?utf-8?B?RDhZSmVmVW1tYmZWQXNVdmJzVXhOUXJKcFNRRDJZM2hXbThpV2ppUVNUdmJr?=
 =?utf-8?B?a2s4R0tWWCtkT3NTeWtKUmczUWNzWXI0VVNydnBlSEZPdG42aUpEN3FXWWxE?=
 =?utf-8?B?LzBsZzY4QmNuRHdleU1ZS3V6d2c2NjRrbWg1SE5HUyt0MVRsTWRtalF4Wll6?=
 =?utf-8?Q?S1rsaHvtHbLJ9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5113.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cC9CMVVFVGx0TTRlTDl3RDNvdHRQZUVqYWdaVFp4MmJnSEYzVzQzRUxMcUdk?=
 =?utf-8?B?d3lwUGE5Tmxad3l3OHRNOFBmZ0NPdTJ6TlFEM2FDODZpeTBIOXFQUWVQbU9i?=
 =?utf-8?B?aUhlQlY2QVc1cFlvVkNXSTdYeGh6MzRwSU1qbWdRR2dTcTV1bkNBTGJRQTJI?=
 =?utf-8?B?cStOeVNOYjUyMUg0SEZPM0R2VHJ0RDkwa1FUYzBtNkxRNk5SLzVNYUJBd2VD?=
 =?utf-8?B?ZzU0VzhCOGEwZWlJOXovUGNmSkdvd3RuNjRnemlQMlg5UFFYcmQ5eXJIUUR0?=
 =?utf-8?B?UWNpUzJZZGJpN0w0bnlsYXg2cHZDb0dpL2F6bUtraTdaMnV0R1VNRHhKUUxo?=
 =?utf-8?B?UGJNS0RYOVZMbEcwSUllRjNtcFE4VUlmSWd3TGhKUU0wQjRBYXNEbkNJYnBJ?=
 =?utf-8?B?SnhCTXJrNlhjaXNUVWNqSHFjcytVUHN2OWpBZHhBZWVFZ3BEc1A1Mzhpb29P?=
 =?utf-8?B?MGFxbE05Z0V2MnR0aDRWeHBkNkNOVXFtTU0rTFN2VlRaSk44Q29QaGVVLys1?=
 =?utf-8?B?bGJPNk9TUDNBOW5LdXFGR2k4bFk1c3M0YkIwbWp0TGhjOGFaOGI5YWxkWFEz?=
 =?utf-8?B?L0c5SnlqMFdGd0JqaXEwYUhWeGQ5Ky80dVpULzREYkpEdUFNY1BwTkdqOEp6?=
 =?utf-8?B?Wms1aFNBRVJJQVZTeGE0Y25uckJwWW1hVktKbUJBVkQvVDE5OUMxb3JYb3p6?=
 =?utf-8?B?VG9kRkVGQXA2cTN2ZkRkdHdvMGV3Zy83NzdBenJ2d09RdS9keWlLV0JiY3VO?=
 =?utf-8?B?QXNQYzBYdDBJL0x4OWx6czlsVmRDbnBEZnBhNW1Yc2ZqRXkxNTNEMWFUNFRq?=
 =?utf-8?B?U1VkSXBKNzhhT1grMG1XZnhWNHg0V2Q1alB3ai9qMmtMTjBRWXVRUXVKU0FX?=
 =?utf-8?B?YjRKc1lWaW5abmhQY3lHL2lOclRGNDJIQVhMbUZTMkJvTUI2ZU02bDFqdFN3?=
 =?utf-8?B?VE1HOXRUbU9KcHBMTEJwcU9xaEdxREVNUlhPWTNkMDdNT2NhSUNRSWhyOTVu?=
 =?utf-8?B?aTZBS0o4MXZoTUd1SEdpQStxRWdXUWpFMEQ1aEk3ek9qblZKT1pQajZoTkRS?=
 =?utf-8?B?RWdQckg3SHVhU0hDcFVLVTIvb2F2Nmc1T3U5UUxjV2MxWHRML1JxUndJMjQ1?=
 =?utf-8?B?OVBicUd2dDkrTXNWdmsvd29nalQ0OWt4QXNQVU94OWdGamVYOUR5TGR1ZEs2?=
 =?utf-8?B?KzZUY2MrdnNmWDBoOENQNkRRNDdwS01pU0RNWXVHTWhla21ZUHF5dkxSTFBi?=
 =?utf-8?B?dFU3UjBhd2p4QjhGVVJtMUE3QUsweGlXSFJuOHkxMGd3b2Y2bnlwNjdYQk9n?=
 =?utf-8?B?SEVQaWRqUEZadHE2TjBEN0R2NHpNNWVXSldtMTBtaGJ0ak0zRzRHV2d3OVIy?=
 =?utf-8?B?NXdQbFZOMlhsRlV5d1RFLzVRaVhSS0Z6Vys4L3V6QnNON2FUYVFTbTN3U1VO?=
 =?utf-8?B?WENsbC9jS2gxM2U2UVU3bTcwZ0tuc3lOeHhNQlk1NTJPQTFjMlBqajluc3Zp?=
 =?utf-8?B?ZmlaOTVNWGhRTEI4aFpiclZSQzRuUGk2NURUVkFHYiszVXdENExsWkwyU3hL?=
 =?utf-8?B?SFdzZjFGczF1SUFBd092Wmw5UFhZT1gwbDd5UlYwTDhIL2g3M0dQajFmaFpz?=
 =?utf-8?B?T1ROY2NwY3Z1TE1KK1p3cmJDNW5GdlJvVzdTVFZXZWthb0J3TFEwdUowQmVI?=
 =?utf-8?B?Q1krSVJKUURZRUticVdtaDU4RFRJeHArbk9CTjVLL0kwNVQwcXYyVU5neHdD?=
 =?utf-8?B?cHBHcEppSmZtbkYvVm5YcUUzeWFBcU5INHBmL2dKcWJHYjl1S3o1NVEySFZP?=
 =?utf-8?B?cURHL0tzS3lrNWZ5dGZtYTkwUjVtQ2NKOVM2ejlZTlJkWllnUmovSk1Ob3d6?=
 =?utf-8?B?bE9ob2h5K3d1ekRMUndsbmdaNXJuNllweDlnOEhMdzdhTkJBQkNrNmpIbUFy?=
 =?utf-8?B?VXM5clVSZjJaMUc0Qy85U3VieXA2VDhQREozQk9uTk44Y1pGVUQvVE9BWmJQ?=
 =?utf-8?B?R1JySnJmK09wcUZRMzV5Q1YvTk5OMTl4TFRRaFhwcmdqUVFJd29uTGVIZzFC?=
 =?utf-8?B?VkdkYlBQS0hlMEp6VWhZUjBmZjdXVkMyem1hWmZ3UHVBdEV5RWU1eGVCUDBM?=
 =?utf-8?B?ZFRUWXJLWmM0WmdVWXhKQUJsQlllRGlQbVBnTUh1WTdFSWFUejZJaVBTcW4y?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: gy/7TSVWz8sWK6q/iCul5adN57VL2XVc0BpvzdDKmurR4Qa88319O1NOcbWbvReFsmKGk6R+fCLjL31dme9QixFSf1NVpXXJQzvq7kOm2f4xGtRA2xXgSspB+en9pk7li5TN4IWkGT0ZuGpeQPeUviHTDTPvDCMOFv8NJRHoVup0XKdBj9FIpyL5spAQ5D+0c8C56+BAWl4MEc6+UtKECH3IkKWqX7utU2QlFnMvdlgcdfiKVZuzpd0nbThge8AbxxdpO1llebl4ta1LmaSiGs8HWulXxVmoB4W9Ev+OQcISe79MkJn6233HiJPjE0eVFJd/Hv+F+ReBryFK+a7qUFpBuaf8I8l056uR2V8zZaldEm9nfuo88DLJcjUhHDs0MS1aRzi25x3GNDftQCmnkoFzbz2pCKsSAwr2lF0az8+jJNVGQDlqFnCmlFOUzI7yDXthFJa8Vei/5GFp7MxCmET7cbpgetqCIFleWwY541qNdjktwATwx/pxP1ILjqfjYYYiRkd5tKXo3NvlTGSEolKPwiA+tJVTmvx1qNNWQ7GYd0YkK+vPAxnifsfjZki1rMm3f9P4v5D4w8IpkP/i1Fk/AKSbFd7D3GtaY0WnXLQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dfe722-ae92-4974-6321-08ddf08a7e72
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 16:52:57.6444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmcO5LxE8AZ29OMi2IbkRAtwiIIwCFl82q4iQWUE9HNltXpvAC0RkWnnmXttGztt+TmENrRoFjrpb0xOo4tnRb7dSUncdjGP/inpoFHSJlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509100157
X-Proofpoint-GUID: AOg_IHztc7cI-Jm1MvM6REYxjNxuWYyx
X-Proofpoint-ORIG-GUID: AOg_IHztc7cI-Jm1MvM6REYxjNxuWYyx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE1MiBTYWx0ZWRfX/xZ7vhxQvVzx
 euX0d8AYzXBRXhdqqyzT/WGsKkPB5ECSCvDAVDnXq3UGej4gHJuWHfBpRs6KhDJVg+5az/RypjF
 8+Ad0ZamWUQBnJy4IQwwqBHYMTYXIBQy3WeXxQ6ygZ80GYhQ5n4/42I9epTYFdewE3PE2YWVdyv
 Y43fbT4nmD7HH6OP9dcqLXL+m9kcRO6BV9kSOYFp9CcdILNzOgaBf4G/RtsB0+Zu0dhckWq/ACN
 JiNpYgZR5mZfAbiqDx9fi0kzgbniU/qLrWjdl6U3N/w/trgvQ43cYq5lZOuXRyjUabnHnboo6BD
 OVLkcvhGeLLyiK05jzC/PT1tpV/8pzI9J5u4p2RYoTtyI3OO/2fh5bbOmXniFGZv7fiK9y/DHNZ
 HA632t3bcop95j6R2oCK5FmpDFtN6Q==
X-Authority-Analysis: v=2.4 cv=b9Oy4sGx c=1 sm=1 tr=0 ts=68c1acee b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=hLJWUbUBNQuHUHWLfywA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:12083
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

On 8/26/25 11:48 AM, Sidhartha Kumar wrote:
> v2[2] -> v3:
>    - indicate the indentifiers do not change in the
>      commit mesage per Jani Nikula
> 

Just a friendly ping to check if this series needs anything else before 
landing.

Thanks,
Sid

> v1[1] -> v2:
>    - rebase onto latest mainline v6.17-rc2
>    - fix build error in patch 1 per Intel Test Robot
> 
> This series is part of a project to depcrecate the IDR in favor
> of the Xarray. This simplifies the code as locking is handled by
> the Xarray internally and removes the need for a seperate mutex to
> proect the IDR.
> 
> The patches are from this tree and have been rebased to v6.17-rc2
> https://git.infradead.org/?p=users/willy/xarray.git;a=shortlog;h=refs/heads/xarray-conv
> 
> 
> The series has been compiled and tested with drivers/gpu/drm/tests/.kunitconfig
> and passes all tests.
> 
> [15:22:04] Testing complete. Ran 608 tests: passed: 608
> [15:22:04] Elapsed time: 34.792s total, 3.086s configuring, 31.541s building, 0.141s running
> 
> [1]: https://lore.kernel.org/dri-devel/20250818190046.157962-1-sidhartha.kumar@oracle.com/
> [2]: https://lore.kernel.org/dri-devel/20250821145429.305526-1-sidhartha.kumar@oracle.com/
> 
> Matthew Wilcox (6):
>    drm: Convert aux_idr to XArray
>    drm: Convert object_name_idr to XArray
>    drm: Convert syncobj_idr to XArray
>    drm: Convert magic_map to XArray
>    drm: Convert lessee_idr to XArray
>    drm: Convert tile_idr to XArray
> 
>   drivers/gpu/drm/display/drm_dp_aux_dev.c | 38 ++++++--------
>   drivers/gpu/drm/drm_auth.c               | 22 ++++----
>   drivers/gpu/drm/drm_connector.c          | 26 ++++------
>   drivers/gpu/drm/drm_debugfs.c            | 19 +++----
>   drivers/gpu/drm/drm_gem.c                | 11 ++--
>   drivers/gpu/drm/drm_lease.c              | 15 +++---
>   drivers/gpu/drm/drm_mode_config.c        |  3 +-
>   drivers/gpu/drm/drm_syncobj.c            | 64 ++++++++----------------
>   include/drm/drm_auth.h                   |  9 ++--
>   include/drm/drm_device.h                 |  4 +-
>   include/drm/drm_file.h                   |  6 +--
>   include/drm/drm_mode_config.h            | 12 ++---
>   12 files changed, 86 insertions(+), 143 deletions(-)
> 

