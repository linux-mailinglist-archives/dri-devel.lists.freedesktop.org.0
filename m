Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA02ABBDDE2
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 13:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3C810E310;
	Mon,  6 Oct 2025 11:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="ZHOzOict";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DII8H4Rr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B718610E310;
 Mon,  6 Oct 2025 11:29:24 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5969EaOT025294;
 Mon, 6 Oct 2025 11:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=corp-2025-04-25; bh=clAKXNYJ02jiWga9
 2AufZEJNc69a1F3A12AsOzPiClQ=; b=ZHOzOictVmyNs0qpgl8O90PSxT62PGNL
 LvvUr01o3hMvenqvRyl7KGtpwia2hqAD4U1GK/N5JlO/h4OP6oi6NEvjG7lcvUFf
 3+Jhy4nt2bkH5teew0PpJmgyIhQgodNgOWf4Wczy5O3gRC5OkCwwZL+YfUgRz1Wc
 +L1ZaMraIjnikdB27paCReErlUT72C7lF0mzUa+UaNmvuEQVSHYuNdicPNxBwzXr
 HVMeRtL1K/EG02Eo3Fvnv7OShWfXLAtaaDHPYfMQRtHrD6HoZpa538bN9U5Hgj6P
 yO9vTQ2a2ok7q20c2wnu8XFdCpKpI0kUEMVCMqIq8/LECocdVjWKkQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49ma7ug9qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Oct 2025 11:29:11 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5969NJdD035953; Mon, 6 Oct 2025 11:29:10 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012061.outbound.protection.outlook.com
 [40.107.200.61])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 49kdp3caeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Oct 2025 11:29:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6lBFC6NWajiL58Z8bgkbfMzpvoxkAHHkyijgj3zEZa493JUmlBg1myj2mBFCYK2oQrsHgQUDh42kkbhcTvdOfKGZz7+sYS+Tiop0rJ9OOJ0xcnuhMrSSCtty7pjku1hFCXMNDN3r+M4D4kQcXjyau4bhGDby7i9naIBERfqBpo2rUnpp4torLbRp3SUt6hIF92XkJFF9LbZafzUUK7ODdwgZFbQqygFScz8a4SwUJXhM86ZW9rlU/dZGIN9JYeCIkyD0sYizIBrjsohX5lts60XK8E1KTE54EbvMqc6ENWiX7zKXJXmUXqEPMXIF75jjklF8P6IqAcMTF8vNOkmLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clAKXNYJ02jiWga92AufZEJNc69a1F3A12AsOzPiClQ=;
 b=vMjrDoT6/DcVYX3yqHeOE7ugknzMvMN7ofw+ks24E4SK4aOK14r2724QjgnOu9CI2n0aQ8r2u1+jbx0cEPYzgiN+tAUsh+c5NBsX1AGsKb1ApTBvTmL+0/ZsJqAoG5nY+cGoME5jVQVnRV081m/N62zviGFUqr73s1sAKZDm4zONegemOMHTKT9aLRMRwsSiGuDa2mYRQsqvSNT3sYVfAGIeDgwHE1flnAA5d0gShEWIBlJf+qZhBA41lTSNkI8Da4eTwGjZ769TwnTjxs1zbMOsqMfiPUIMOO+kiKL7vPb2iad0fl8Je7cLDY9Zi3oyHwvED5dweKYNYd/Y4QOOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clAKXNYJ02jiWga92AufZEJNc69a1F3A12AsOzPiClQ=;
 b=DII8H4RriQqyweqXBVcxoAd5yO0WUCllxzLucnHbzz+drc1iyDmhuxcC5AqDSV6M9P8deXBX7pqiXT2xXt4glS3FjUorDHKR+C5pdNiIoHcwDZcZ3W1CV/ArTAxlnhRFCuAMwgeINudtH2MPDONDLWpNjO68RCp13LieaZi4qwQ=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CY8PR10MB7290.namprd10.prod.outlook.com (2603:10b6:930:7b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 11:29:03 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 11:29:03 +0000
Message-ID: <64ce3b68-c7c9-41dc-9a64-c9ac0891f7e2@oracle.com>
Date: Mon, 6 Oct 2025 16:58:55 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: chiahsuan.chung@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alok.a.tiwari@oracle.com
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
Subject: [Query] amdgpu_dm_crtc_mem_type_changed always compares the same
 plane state
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0579.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::20) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CY8PR10MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 29162c04-66e1-4b2c-d8d6-08de04cb8d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGMwL1JMRittNzZZNE5OUFpWdUlHNXl2bkFhYis5bkk5STZtTVRucUlPNHhN?=
 =?utf-8?B?VjhYd2duLytOUU1SV0YyelNqcU12bWJFVjlZWVlOWGVHa29LYUlBY3JTVENE?=
 =?utf-8?B?MDhvL213YUVQN2RJSHhDOFFDQ3NVc2hiNjM4M1F6VzU3VUo4V2NyRDVudUdR?=
 =?utf-8?B?NEpYTDZPUXZEVVBkb2RhaXkrdTdBaG8razc0WEEwdGxic2x6QmVvaVpGbk9y?=
 =?utf-8?B?WTROOUNkU0JWZzNxZ3N5UDY1UUkyOFZTd0UzL09CQkZjd1EvTm5lSnEycEFm?=
 =?utf-8?B?RXVFNXZ6UnJVSFhSdE43T2xmSkpiRUNUOWNqcnVZeVkvNVhqUllNemwvcmZy?=
 =?utf-8?B?aWx3QlFtZktLMkhmVDJOSkhBUXBjVlBLR0tONS9rcDJBemlrU3IycHhobXBQ?=
 =?utf-8?B?LzZtaTErSGFlbUdMQ1V5bHJyM3QwWUpxc28vQlFlWENQd3EwcTgrOWUwN2RN?=
 =?utf-8?B?a0NiUFVxdEczeFVNcy8vVkRkOVE2QjQvZmNBbi9zdS9kTk9pN2pJeHVBQ1lT?=
 =?utf-8?B?KzRVck1vRlRFNU5McEFSOHBGeEtweUVoTHdBS2lDNEh5SWk4S20wd2RmU3VL?=
 =?utf-8?B?SFV2NUFzbFh3N3F6OUdFYjFLU1FBUE5WU05QQjIwTThYZFZremV4ZVRuWFYr?=
 =?utf-8?B?VWNZR3BxMisyZUtOZ2xITlJaZTVjZjd6S1R6US9GSW95aWc4WWxva1prU25i?=
 =?utf-8?B?bSs2L2NVbGVJL0xmbWJEbStZcnFiYTJSRHBBYlNFUmVwbE1vanZtS3FpZ1lO?=
 =?utf-8?B?V3VCTXdUNlJhcHhGUTBOMGsxeEF6azdzY2VjQmo0eTNsY1JlVUZGejNmZGhX?=
 =?utf-8?B?bXl5Y2JDS3o5NDlWL29DaDJsN0M5R2pRMFordzJpM29RdUdFZUgrTlhQVDJl?=
 =?utf-8?B?SjNHYWdITVRyZWgzRXVZd254RjhwWEVrNjkvOHhCVXNtUkpkT1VtbWc1MkFT?=
 =?utf-8?B?R1M5UVdRK21aY2dqbFdJcDgyb1ZNTVdRNGg0U1gwUTNIT3FzWHdXQWU1QkpH?=
 =?utf-8?B?dVZKVWtaemsralQ0dFQ4NWRJaUJMd3JPdytMQkl4NlhnbU5NbTdFcVdiYU9L?=
 =?utf-8?B?STdmL2lhcTN6WVc4N0pmYWtCWWUxRlM3MFlxNS9oYjlPejBQRlNReml2WEVk?=
 =?utf-8?B?Rmlya3NxMkhIcTVocXEwOWhLeEQyRVdqcW0vY0wrNHlaM2tBYi9Ea05Db1Nz?=
 =?utf-8?B?QUhEb0ZleDZPVFVwVkcrQUZ4T3lIbmh6WndwUjNDWFdCVEJSZi8yQmJKeU9x?=
 =?utf-8?B?RlZMSWdPT0Mxd0tlZHRQU092NnJQam1OWlhaZUFNcjZXU2xSQk4xQ1dkdUl2?=
 =?utf-8?B?UzdKK255MElVOHpkbWgxRHhjSytZQUU2bEhXVDFJejRBN0ZsOHlaV0c5c2ZQ?=
 =?utf-8?B?SWtpaTNNMEZpR2U5bHNrdHd4NVBoUEh3K1BpQjhBK29ycDByVmE0eWU3KzNT?=
 =?utf-8?B?U3ZpOHROR3JacXljWlZ4bmJTWTJqMUtvdVdIWjFNSEpHR1NlY1pCamNibVZ1?=
 =?utf-8?B?Q2RPdmorOCtKT3pvMWM0bnA2UE42QmVNTVlDUHZMTjd1Znc1QURUNUdPcGwr?=
 =?utf-8?B?OXV2YWZVaUc2UG5kOVVaWTl6NVl5aTZzYnlLMjZTdlp2bzkrZW10cEsvbGdx?=
 =?utf-8?B?dGc2QzFENnlQVmFNRHJlRjg5MjEzMmV2MFZaOHI0TktuTXBPd0JCdThoNE51?=
 =?utf-8?B?MTI3bmZ5aEMxQ2RKYTU5b1E3eVZvbXFieEdOSXdzT3NDcUxFSXZqWGlZTkJ5?=
 =?utf-8?B?YTM2alIwQmxDSWxmRUVJUENaWCtDdDRKYmt1NGNsbU5aYTNNNWtZSTJqQ1Zl?=
 =?utf-8?B?QnFIS1c1elNkV3RxNEc5RzVPeUdMQnUxM0c2NXkyQ0s1KzUzRkxRZWdySFo3?=
 =?utf-8?B?UEttLzFoaHVEVGpnc3pxL2NQUGVXeC9RSWdoT2k2VE1xeThML2RHcUtkZWUx?=
 =?utf-8?Q?G4PG1rfwl9ToG8QNvdNJFIlOuukOS0cc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB5328.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnlwU05TYnlCTEZobFM5NEFMVXpsaHhjTU5zVk4wbnRlK0hubEFBanMzUFY2?=
 =?utf-8?B?SWlaVi9pOE1uODdPQjhRVkpZcWc0UmVZRHViZjA5bSt3amI2bG1rc0NTRHNB?=
 =?utf-8?B?NGM2U3paY0FpQWhhQXh0QnZERG44Y2sxUTFZdGh3NWQrNWlKQVNJQ0dhMTh3?=
 =?utf-8?B?TFY3SjAvd0FSYTFWSUxCUm5TN0pldjFuTy9IUEJpZENjRHkzajl6VWUrdHF1?=
 =?utf-8?B?RmNUUmo1ZHFkRHBaZ1drajdLbGFLSVkzSnU4by96UmZFTDc5eERrWEtyV0ZH?=
 =?utf-8?B?ZVU2V29sOTBLbkFoVFBxRzB1RTFpTy9Ra0NHaDVITVJsK0Y3QzRQZjZtelQ5?=
 =?utf-8?B?OTVXL3cxV2k0UUNjVGxUdE5xQ0dEb1NDNW9NN01qeHlURkVTdHlaaGhIay90?=
 =?utf-8?B?SHJnSDVUYk1ZdnZxVUkwcXVpRDB0bmhwQTZ3TFg4YjVTWklkTS8wVFFxRjZh?=
 =?utf-8?B?RElJRUVLUVJkUHBaMjZOckE4OU1zRVNKNFk1MVhZS3ozdDFJUVVLbHd4a0VW?=
 =?utf-8?B?SWFqdDFXbTFwdytVMkhLMVJUczNENVJEOXcrMkdtUCtnd2V3R284OTFycmZl?=
 =?utf-8?B?Ykw5VkVKeDNGU3drYXpGeGRtT0Y1eG5PZ2tXWisvVEg5cjVrTExWTTMwa0NT?=
 =?utf-8?B?dHVQdllsTDloQWY1Z3F0cjR2aWxDMjJaZkZzL3Vva1pqbXFQemlkQ0xNNmx1?=
 =?utf-8?B?ckgwYkp0Rks5eVdLbzE4ejRCMFQ5M0RsR1MvRnNUR0YwMzR1OEtIZEZZZElo?=
 =?utf-8?B?cE5UeUgyT3Z5TlprYnBwcmtaejUxcDg0dXI1bVhzTjQyamVIc1NyVXVyUUtl?=
 =?utf-8?B?RTliSDd1ckpvSkxPSGpzME9DenZUb1RVRUc1QS9VQkdad0dxU1RWSk44a0dL?=
 =?utf-8?B?TEtvaTNQekhUbkFjMEFHeUxHV3BtbXdORFJ4NVF0WEpqSm5ncjc2cS9wdEhK?=
 =?utf-8?B?TXU2MnVlMGhYajZ6T0NTZnBuQVdrTStkMENIZVlwNnBEdWR6NnR2NTcyTm1G?=
 =?utf-8?B?NlhBZTcxUlJDREVQVmNXenFEdVVxYjhtZkd1RXMrcGg5bXZSMlk1dThXZCt4?=
 =?utf-8?B?aDBmUlBBZGUrOFJQNDN3Nmpib2tIb1pwL1A1V3BWc096d2prcFMyU2lNdm9l?=
 =?utf-8?B?M2g5MFMwRFQ4TjNCQTBJZlE4emJVVGhVQURHcFlHRTg0NmMzbjVQZDBtUWlW?=
 =?utf-8?B?OUVSYmZwaTcvQnZzVnpUVFNDV2pzQ2lCTGJoRDhQMEcwZTgrYVlQZ2s1emhx?=
 =?utf-8?B?YU9Jbmt1U0ZXL041ZVBsVHp6UUYzYllzNlUvY09VQkR4U0Z3dit2eFVudW5i?=
 =?utf-8?B?MzhncHpFWlQ2eldhbWY4OVZVd3ljQjNDU2pDVDRHc3c2SmkwNFI0ZDQrR1ZY?=
 =?utf-8?B?T0wwZGdpcEJtYjVpTjlIb0MwaXlROVBmYU1xRjlDWlcyNlFONnZQWG1iN1pn?=
 =?utf-8?B?MHVjdDRLbVM4MXhRcTEyaGdBbnFVVkhoVlpEUldXSzJmTVJJVkRvUVFNSDdi?=
 =?utf-8?B?ekptSzFHenl2U2xIV080bldFdGluSGwwcCtKWExCbXd1QnNsRk5NVGtLcjla?=
 =?utf-8?B?MW9VOWRWa1F4SDZlOEdEQllFSm9OWml0MnJQa0NYMlptV0lUcEFEVEhYYXI2?=
 =?utf-8?B?dlJqQjd5d0kzOG12dWkyT3R1MDNPS2RiRjF5OG0zYW1yU2ZEbk54a1BiSTNN?=
 =?utf-8?B?engrd3BpcDg0OTFFMjVtcXBwTkorTXZCYlVMVVc5VFdMM2VNTmsvNjFDbEl5?=
 =?utf-8?B?TFd4Sk1XNjcvenZHNGI2czEwTFl5VlB3Y3lIbFF1UDNFQkhuMjdscE5oL0xy?=
 =?utf-8?B?clNISnlvUjc0dlJrUk9EMGoraEo3Y29kM2NqbHpONHY3emRtOFdoWDA5TCtn?=
 =?utf-8?B?Uy9rVnkySkN6aTRJdWNHZFVVNndMdTVrUjlYRFRRTkVaWDRmcWp0ZHkxaW5n?=
 =?utf-8?B?R3JXeUpqbE1GcnIwcXV1cDlzenpwSFVQVW5sUmh6NmU2OFhxMW9QdENnaGh0?=
 =?utf-8?B?Y0R1RjBBS3hxdnhTT1NDM0E0UGlQU2tRdExYUFd4S1lyZHd2Vm5QTlFWMGRk?=
 =?utf-8?B?WXFNYU5FcE44MWJxM3E1OU12UEpLQWxCcUplR3lQMlU3cnNIVlZHTVV5WTF6?=
 =?utf-8?B?U1UzcXBLc2hNMG5ZQXZuek5ydnJ3SU1FT2hHWWdqbG96d0xyV0pwQ3ZGODlq?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /0snNzhCzZAsM4hFJpZIYKvEjQCnrmyw4cNYuFpppWQZy8DUipykjyPqlnmhWRHgXe/4bvxjfZpQwJ8d3mi0YR6vzI8LGt+cLxG+QYQmt+1pz5X5STPEMiWrK+tw92nXhGp36mz2u7AhaCZJNheaSQL1Cic3pmDf9Mf2q/FCLytuTW5VWFUFka2LFiB7Y19IsuJs8XEWsZ0VQL5CKQfiB2Pcg1t1GFldhB15aEsflezLzSV/h2m//NCpU7Y9YbawDkNDdAUGvoYmv1zDwTDLFx0vvl7/qlfDFjw0LTQqvkPmmUrPv5iXNq58SDzfHP8P7wOZN8QWc0veIX/00Jbv935gTfFdtafuYUp0SMru0r3aZlbitOWzEaTIug1y/naaidNaBrFI6ZYv64C2pdgUV8izv9ahsg8KLOYMLXTUYLS6SZ5A3Sc0/iBfEXpNYhoDxU5xhAmuoKb3uuNwzR0Nb3DEXudetQRcMZrq8kWUcymsvkYdanTb6M//v1ECVnRSqy3088gNbS/gweFB7sjosWOqv5Wpr6v3hfaBmpyTA71NsVUK3sA37WIWRJkJdkeRxPUeW3RgwOU2mBneY7StfSDzO1QD1jtAGI5HmuLpYFM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29162c04-66e1-4b2c-d8d6-08de04cb8d30
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 11:29:02.9464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uG6q80qGGQGNC0sm2/MfytPPNWKOXsvbd/KmFTw/xkpYP4VjJF8r1Lh27hZL1SXImKsoY23/LfxE9BGZzQVVtcvr2EcqpeUkJXwJK0yb3B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7290
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=949
 adultscore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510060092
X-Proofpoint-GUID: GBHXUFJxmtaoXlm59zGaD5E9ghvwQ5S6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDA2NiBTYWx0ZWRfX85Gq2gChmD3B
 mj5HeOfrTYpX9g2X4Of41uADFoKldvhesqTgzCCKtp+PTrGFycQ5mKH3MfSdybRHvQvBHCEyw4s
 JuZlY1HxQYw80BVIjYjIFyFlDNN0fFzghxg8UM2twuzyh3o7dW9u6oVQ3IYspkIx4iMvijdjv+C
 PoTfqWIfh624pL4y8qEItRGeTT9ZqcTmyPK1ZVpMjEQUIw9LOJwgLDRrSR7+d0X6v7Ck5AhPcZV
 kb0PX34N8b0h9bcAHk9+6yGzJlx9299c0rhiYBc2uHlnt0jYGqPbn0ckdN+lMcm0OGgdqwPsNGn
 lhk6SfKMtiDn2ax+M6u8TAJYwtiTRR3pQgX8FmSM3g8q6sCrbRv7m33hUhWers8q+RGmIhyXTHb
 laId7f8Yd2QUe1/kr9G8mPu4fypYmNexiOSuQP4UA3WDVEcYFq4=
X-Proofpoint-ORIG-GUID: GBHXUFJxmtaoXlm59zGaD5E9ghvwQ5S6
X-Authority-Analysis: v=2.4 cv=BcPVE7t2 c=1 sm=1 tr=0 ts=68e3a808 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117
 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=WHTldkpMQflKi9SisOEA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12092
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

The function amdgpu_dm_crtc_mem_type_changed() in 
amdgpu/display/dm_helpers.c appears to have a logical issue:

new_plane_state = drm_atomic_get_plane_state(state, plane);
old_plane_state = drm_atomic_get_plane_state(state, plane);

Both new_plane_state and old_plane_state are obtained from 
drm_atomic_get_plane_state(state, plane),
which means they will always point to the same plane state. As a result, 
the subsequent check:

if (old_plane_state->fb && new_plane_state->fb &&
     get_mem_type(old_plane_state->fb) != get_mem_type(new_plane_state->fb))
     return true;
	
such case it will never detect a change in memory type, because 
old_plane_state and new_plane_state are identical.

Proposed fix: use drm_atomic_get_old_plane_state() to retrieve the 
previous plane state:

---
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8e1622bf7a42..74f4f7e7b119 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -11968,7 +11968,7 @@ static bool 
amdgpu_dm_crtc_mem_type_changed(struct drm_device *dev,

         drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
                 new_plane_state = drm_atomic_get_plane_state(state, plane);
-               old_plane_state = drm_atomic_get_plane_state(state, plane);
+               old_plane_state = drm_atomic_get_old_plane_state(state, 
plane); //<<

                 if (IS_ERR(new_plane_state) || IS_ERR(old_plane_state)) {
                         drm_err(dev, "Failed to get plane state for 
plane %s\n", plane->name);


Thanks,
Alok
