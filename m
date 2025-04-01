Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DBDA771B0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 02:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139F510E04B;
	Tue,  1 Apr 2025 00:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SWOhhe3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1E210E04B;
 Tue,  1 Apr 2025 00:10:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UC3DJAx4mbvGM27qngq6MIIX+fN7j/jN/UxXAcyzH+5alKE1L1yXi/+3z1TrqOqjs6sA+jKddpKUdaCcfA78qB/U+Blsxb7wKTYiTn1PQ9WlxNaDKMS4RIuw9GVMw9Cnjx0b5ali8QX/GVm5+uE7IGOMw415abagmU+QX7cAhCmTJ9OZeTAKKkk79svjB0mSPAYOhWunqTMG3kUZerdFHxSljhsfOmsrEllrW6RWxNQKFawIOkCQWO1eX27YxzP4zKIO4dXU2l64EAbm8S00BBnqNMG6bUNw0KnFEtOU2T1sVZEfIs5FrteMPqVysq08s6ojkkCIh2Qlt7EiabUdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHmVZghDYIjlSz5V7QYfQoAW2+sDVpN/VtWl8xETriI=;
 b=OoJxG8v4vr8XQQvgphGDsYE4Oo9G3DTJ1ontqS/s2EjjsLigXCrZXlLQskSo8WmaufLcrPzTD1nUymyHwDUHqV7Lb4Av2BI4DEL3rcUf8JtymjaEEuWrbtBQO1KUDLMkH8p1zznjBvxGNztC79rFFTxK7kCvmuRrF6MeMN2Hpn1EAmcKAOBoSkd4JjzpdlLWdYYcV8tk+EdYDJ2jIbCblHw0OG1gN0+fPW9XM2SLHMCn3ka5z+TCztxqD5sZbMhJYUwhRYcwSWcyzuWQeja+i98/hsJ700ktTOQzzT8CD/G4N6MZ0yPmCZqi+jXIpvG2r+ttZ5PTuwUF8661zo3n7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHmVZghDYIjlSz5V7QYfQoAW2+sDVpN/VtWl8xETriI=;
 b=SWOhhe3erGuS1XOph0eR5NsDMznHgjCDBmaIMMR018BUu7hIYGkiPw4J5t8Kdf9LTrS8vc4VDIkMNMD5yLQwTPF3nL9s39uI4wY9fXZ/LaR8Fo23bbSU2SO0ooFB28FEENPp1eXREQF+/wzpCG+reXJpnTu1NhyA+ivROhXpT1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MW4PR12MB7335.namprd12.prod.outlook.com (2603:10b6:303:22b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 00:10:28 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 00:10:28 +0000
Message-ID: <54869208-04f2-457d-a8f2-e8cba24f94ba@amd.com>
Date: Mon, 31 Mar 2025 18:10:23 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 03/43] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-4-alex.hung@amd.com>
 <ccapGdDxbM4lcrNuX1aXUz2dfv-z2MhxuugtqOXLuMMagujxDDdzmeyU74zve9pRXbILSWOBHOCecEaLtDI-181pLd-0qOQp-giAvPuPlWw=@emersion.fr>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <ccapGdDxbM4lcrNuX1aXUz2dfv-z2MhxuugtqOXLuMMagujxDDdzmeyU74zve9pRXbILSWOBHOCecEaLtDI-181pLd-0qOQp-giAvPuPlWw=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::22) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MW4PR12MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c068c9a-ef02-4c9b-29a5-08dd70b19b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDNheUM5YmNSRTJGcFdkWDM5cUhCTHUxTnRWbGVpVVk1TWxoaW1KSmx4ejJR?=
 =?utf-8?B?WTUwbjBOdmptd1ZTaDZ2eENVR3lyNFg3SVErZGZKN2pITDNKRUNZeitGUldW?=
 =?utf-8?B?ZklFN1ZBbFZVd082MHQ3SzB4ajJZMXV1QWZvWE1qKzU2Z01vdmpGQk5TT2hC?=
 =?utf-8?B?V2xrWGpybmRJLzdVWmhIdTVPNDBMODhDTEtSaEZDYnRxb1M1akxzRnZXQlN6?=
 =?utf-8?B?QUVqVU5DSUV2dWtZTTVOYVdmY2FyOGhDTUpSMFo1ditPUUdOck56VUZiYllZ?=
 =?utf-8?B?a1ZDaXJwQXVkcjNwZ1ZlWis4UnMxdmdXWklRUFU4dzJUT0lQVzRoSk01cmFT?=
 =?utf-8?B?bzFIWUs5SERYREJySmd2d3V3RWI5aWNDclptT3VkSWY2cVhUQlhPczVvZzBy?=
 =?utf-8?B?SGhDRno2dVNGNTAxelFjYXFsbHFOKy95Ui9XblREb2MyTkRNd2M5VTZMNEhR?=
 =?utf-8?B?dXNqQ3c3WTRycWpxSmk1N2tHbDh2bzlkd2JIQW43M1BOeUJxU2ZBV0VsRVI1?=
 =?utf-8?B?OStPbkZ6ckM4UUJROEtXNFBDR2tKRWt5Nldna2ZCRjJ2OFFEeGRlK0Q4aExq?=
 =?utf-8?B?MFY2dUVWcGhmaFpkYk9EODRHQWgzV056L0szSllTR0JhbzhKd1YrdmsrT3ZY?=
 =?utf-8?B?WFVGQ1NRUDZqbGc2QXFEVTIrM2JZNHNPaGs4UEdjLzZRcTJBZ2w4QzNvWDVM?=
 =?utf-8?B?a3p2MFdYSXZNV1NuTGtXcmJBSENjQTBVUEEvRENVREw3ZDJzZEswd2MyRGgw?=
 =?utf-8?B?WklycHUyTGU0bk1lQ3ZrQUYrRFVKSUJHSW1BV0p0cGluS1ZiQm0yTnNOM2JZ?=
 =?utf-8?B?UmtNUDJneXJFUUdJMmZ6bGk1ajNjRzRxTjhzUk0vSnZxZG9NeEFEejNKSld4?=
 =?utf-8?B?elRVN2JSMDZaaUhsZHUvdkM5R1RQNXJxc21Mam5URkp6K2UwWVNXNCtINmZP?=
 =?utf-8?B?TDZnWDMybDUwWG14VkhNY0xrQlhXKzIrY2Z6amEzYXlnT2FkMnpLaENXYWZR?=
 =?utf-8?B?aWdRblhoOGtaeWdSU0VreitheFJIN09nQTFsbU1IeFFqUmw3U1dWZTd0NElS?=
 =?utf-8?B?QVF3RitEMGlNbGVsaTBGWTQwaDlLSWNYdmJNZHNKZVUyZmtrQTlMeXkxdjR3?=
 =?utf-8?B?UG5LQzA0bFVsNDF0ZEV6OGxuQWFsWU9LenIrakUrYzZIK0c0RXRzTGRlbzdl?=
 =?utf-8?B?bmdDQkxOSVQzU3JrREwvd2R3TlFxOVFHMTNLMVhOYXNvSWdCMUZmRFlqRU5q?=
 =?utf-8?B?VGxHcnR6Vkd5Y2lBYUgrZEVXamE0SitlU3ljRktHMFFLMmhnZkw5MjFNYXll?=
 =?utf-8?B?UkM3MVpnYUMycWc3UnVrdFppeEhPQlRSdVBiUHFORjE3dzliYUY0WlBSRzZk?=
 =?utf-8?B?UVdyZVFyYTF4L0Via1NTeHZkNHVVTnQxdUZ6aUIxQURkaUVEcnY2SFBNQU54?=
 =?utf-8?B?SkUraXUvb0F2eFBRWWFEUHpGbXVvenR5elpqdkxFREh3b21TTGx1SWFQWWNw?=
 =?utf-8?B?TmZJQlZtT0FOZVg2RGNMelduTkhQWWlkSDFOSDRpSzRmdGZFNWIrcXRtbWFm?=
 =?utf-8?B?dElkeHJnOXplZTRuVFd6K0tuNzNMN25haFN1Mm1MaXdxZXUyUW81enN4YW9O?=
 =?utf-8?B?MkgwK2xKOUo1OEYrMHBNck1iNHg1MEp4ajdHejdPQk5RMGtZMmlrWkVCNGZm?=
 =?utf-8?B?Qm1zcEhIVytpdVdoZ2NrOWc5c3hSMkpxaG5ReFZCVTNodzVwUEFUQVErdExH?=
 =?utf-8?B?ODA4UWp6S0UxbmtvZTdGNFBzZklHOHl1cURaVGZ1eG1LbzFSZkJhdDFJMUpP?=
 =?utf-8?B?RUhvdWd3MlNzVjNkWXZjeDVMdlE0Z0hkQnhER1hONWYwOUN2cWhKSmIwbktp?=
 =?utf-8?Q?1Ioqew7O1xYWj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzVLam1yQ2xEWnBid1BWTmxtWGNIRFVUN29hK3I5MlBZdVErUGlLdjNBOExF?=
 =?utf-8?B?MzJabjNzNEpWdm14SXlKMkwvdHUyUEFlZ0UycDJGUGhBYitYNFJtZXR6ak1j?=
 =?utf-8?B?cmFnS3JEV3BZK0lwcW9rd0FPaWJBY3pzK3kySkdON2hGeTFWY0doZVo2QVd4?=
 =?utf-8?B?cWhSd01SeVN6VFNKMDVEK2tMTVN1TCtReGg1cjl5S3JvWkN4NDRQSUdCNWZT?=
 =?utf-8?B?Q0p5VGQ3QjRsdGs4d09OaEFLVDhydGM4OFRJV0lVajhtbDdhS1VKYkNYYkYw?=
 =?utf-8?B?SGJzTE0reEViTmdQN1VxQWNucGdBUXlSMFA1emVTRm02VkE1aVVqaDNLbzFm?=
 =?utf-8?B?SFlDTVFjVDFsdnJSMFREOUE2UDhPM0RCVUtTSmcxV3lrVUs0cGxqYUtQVkVx?=
 =?utf-8?B?QjErckc5MkR4OVBrejd5ZVNLQXpkazRuZGRrbmEzaWJVYWNaclM3WXNKa2Qy?=
 =?utf-8?B?WUhoS2hVRnpxSm5QbDZLL1Rtamh3Ni9SMXFvRDF0dTE2MDBiTWl1OHQ0KzAx?=
 =?utf-8?B?NzkrUUljZng2OWVLc3JscjZrWm84eEV4SHpOTzcwWnBteXQ2aVh6ZytaRk9v?=
 =?utf-8?B?ZmIrY05hZk95eGFBSWtodDZoeUNlMUxtL012K0tlWnJaam5LZjZOOHFEemlj?=
 =?utf-8?B?SFE2NG4zYWh2VnVIWHdSZGltL1h1T2Y1N3pxN2VCMTQwVVpKdUV4UUNjZTFq?=
 =?utf-8?B?RWdMekFPTHA2ZmFWSDZRd0UrT1UydW12bmdrNE5CSFplTXQrdEJibE5BajFR?=
 =?utf-8?B?MUd4NE5oMXN5MktWbHl3Yk5qcW5ZNWdDcUM4aWdjMW5rUHJwNFg2aTNPVFcv?=
 =?utf-8?B?TGJ6MVJORGJrU0tFT1R5MERpRGx0cDFOV2dLaU5YVVArbzU1SlJQbjZUVkhD?=
 =?utf-8?B?RDE3bFl2OTJrRWJhdjFtUjlvdm1RbCsvNVhVeFNXVUhkODFSRENIQlN2T1E3?=
 =?utf-8?B?SUI4aUlva3QyM09pdDE4M0t4M3pqN3RNNVI3dEl1K3BUN1hBNFZjSVEwSEdt?=
 =?utf-8?B?TDJkSkp6bHhoVnZVcE9acUcxZlY3YW0weGlaVkM1ZHY3aHN5YmN5MVlieHND?=
 =?utf-8?B?UndmRFUwdzl0aTdSTWJCeWhZZFdlSnBNekdaS2phY0dESUZjazEzOEkyaC8y?=
 =?utf-8?B?ajkwZGk5SzBBNGlQVFZUSnVJM1h5T2pkdEYxZGM5aUovRWpLRnR0cEZxZ0Vr?=
 =?utf-8?B?TTFkUzdmMkcvc29SemhxakFEMHZ4bjQyTk5lUC96M2paT0JtNCtiL0FaNTl3?=
 =?utf-8?B?WjZITVJ3emVHSm96UGdjdDRoYzBIMVFudUR3OVV6elp3eDgyTGluL1hrZkNW?=
 =?utf-8?B?STVjNTZoM2NydFBFN2pXdmplQytRUTFVNzFHNW0wZEt4NTdOcmFOUzdrMnlp?=
 =?utf-8?B?QVhvK3Q5MW5LNlhtVjZyYk1vVmNvUkM5N2VWekpZVFh3L2NnTm9oTDlORkxo?=
 =?utf-8?B?emlENEdIYnZSanR2SUJvK1drTy9xUjhmbUpXTXFyNUNzV3RXclJjbFY1OWxU?=
 =?utf-8?B?cHNkZkJUWDl1OGxQWUkvSThnRlpGYm82UU5oMTR4ZUxTRmQ5dVZwdmxwMHpP?=
 =?utf-8?B?TXdmalRrb09BL2todnFjaW1tY2tHT0RLYXRnTUpQMTNVdkVMQ3BETDk3SktU?=
 =?utf-8?B?VC8wTmdUM1Z1ZDNIYXdMU0xVNmdDNVZuZnlmODJUODVMM2V3YXhhQjB1NnRn?=
 =?utf-8?B?NUM2SVRsR3JuQlZQVDhpaTdmQU5tcm52cUFmWHlySmNTOVVicDhWbUw4THE3?=
 =?utf-8?B?QmVnN21JMktyTUF2dGlFYmM2dGFnWEwxZHMvYmwvcWdTTXlUTXREZEtCdGpK?=
 =?utf-8?B?QkhjdmNSejk0bmxMdDRWYmw5bmIwT1Z3R01KQUJ4U2NWTnB4cTIzNjVVL0Vw?=
 =?utf-8?B?aUZLNmVHdHhDc2p3ZUV3QjdNSWhkU1FtSWoyMDVEbXhmZUJ2d3Z1TEUrYmxm?=
 =?utf-8?B?djkrNEQyVWZKbDg1L3IyeDA0VUtZMEJ4bSt5b215ZVk1OXpYNlZJVFZRYmQw?=
 =?utf-8?B?dTYwK2thaUZkZWNmSGUyNDdmbjIyQWwzTW9vd1FrWUZSR29EL3F6YUhKSktJ?=
 =?utf-8?B?NlA1aG0xNzh2SzZYVFZkbXhPQVVaUzA3RDJxejNkVHRjNUpPY3dLUTZiOXNW?=
 =?utf-8?Q?3PjPJVBSXo6EekBTF/kjdw1Pp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c068c9a-ef02-4c9b-29a5-08dd70b19b97
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 00:10:28.0004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ol7c5Knj1T6Cf9kQn7HZGrK2Sa0wn8sb7+0GqAe2bXS2D0SI8Su9HK9q0+nKo/dWQTZWQXhNxNH0ens9JyMfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7335
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



On 3/29/25 09:26, Simon Ser wrote:
> I would also highlight that we need to seamlessly switch between HW
> fixed-function blocks and shaders/CPU with no visible difference. Depending on
> the content being displayed we might need to fallback to shaders/CPU at any
> time. (A classic example would be a new notification popup preventing us from
> leveraging KMS planes.)

Yes that would be the goal.

Is there any part of the docs that still need revising to clarify this?
