Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F828AA958
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 09:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DC310E0A1;
	Fri, 19 Apr 2024 07:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="bWfHO8tx";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uXQktz3m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B002110E0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 07:39:47 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43J1JL2C026817; Fri, 19 Apr 2024 07:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=Z0BfxWAvFc35+jrm7dQXmnJEiobLWzmpAgX5mmGyoKU=;
 b=bWfHO8txLqXlccgxAnlbHxizNFZvJvEUVhwIKQPIRiJzLSLQhnFxYIXVlDCpkYGEcwZS
 9YK2P/u/3b9gl16rkbkZZSmXkY7NuOeRO6wPyKwJ3DJ6+ye62Vr/ax3QS2ezhO94u2lQ
 n619mssZnBcFK+E5HSFL9sAceSMZT1KMwTNOZlYbC/hxKG1m7gCsOSHbWkiRijt2uGdC
 abFejewsQK8stEvKNxFTxmQjrTFhzdMuPSrV+UvoDhFpvIIIvzQABw+TWLpCI2EFqJ/h
 Ufcvttaq07xMPkPxfEYNZrmc1scu6nCOW2YX3/5ggBpn/Wur6BGsga3uhcOFdd80i+RI hg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xfgycv8pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Apr 2024 07:39:40 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 43J7Aiib039965; Fri, 19 Apr 2024 07:39:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3xkc5fpqhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Apr 2024 07:39:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBZTkXC9QV/u8JLAoJNYZ8qrCqou/Huh5K7HSfP4kQo1aYQI5yJtVczff5o5wo1d2g6ShkrC3y9fHs3QONQ83FhqIxmhOqgCS9tEpeRNlasLH06tqXLr+YeN2G2vRgM9eBSXHO4WCDmuQNkC5WFa7mR7X3J04Jq2Wmaz7QsQSjwVTBRMfbGD737V1RHvjaI3I3ifW5R2d+VXgH5SHME+iPEHFbcnVPwB7a9dZTmCZGL0XbO7W0nkjEMQMrZTl8Q7KeFd7U17JZu1OAXRT9ZinrF0WT3l6fH0p7dUWDWdrUjLjNL8GQ2z3wsOeD+Y5q8c2NLm6ZpZsehGLjzryl+KLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0BfxWAvFc35+jrm7dQXmnJEiobLWzmpAgX5mmGyoKU=;
 b=Ra9q1LiyQ9BZFImRokmHNpDhzomLLoYxCkz8/ovQFi4jMVtHlQGOjZl+gVXAoJx7XybXzwkRLmokghYEx5Sw09txEYks7Mfo7ZpduhxuMvXz3jpMu9rbl8sSeSSGoACmhGUHzV6rz/il4C1GR1mTDAgQaHxoa/0m+unQsEVaRMjLMIHstJl0fOdQwhnR7lPWy3UDt5RTG6zQBoJweXZDbHmJwbmrxkX7dTCdm/ZNoyDv58pTPbDxozSmzGkz0Nd0SBJ6cE1nAPrckNnNCUE9T0g1xWjmahOrJSi7t/fL9UNYSpYt9JKe9RRdYGpXEiNVChXkt3vd4j4xaAQbhQlOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0BfxWAvFc35+jrm7dQXmnJEiobLWzmpAgX5mmGyoKU=;
 b=uXQktz3m0Fa90Orek6YbJ4tol0r5eVBY/1qkLWSmXyR5POcQy7BUucfbufqj175WZWTEZhDdHyT/qISdFBgDO7HN0Q+BZR5K1Wiv6PoWt2jBkaHRjnxMyrqzH1FvinGdK9jL6hTfDbXUUuIJi6LE5a5yVHzjj5VBO0Yw38Efb6g=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by SJ0PR10MB4656.namprd10.prod.outlook.com (2603:10b6:a03:2d1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.45; Fri, 19 Apr
 2024 07:39:21 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76%6]) with mapi id 15.20.7452.049; Fri, 19 Apr 2024
 07:39:21 +0000
Message-ID: <5febb249-1d4d-4ea7-b031-1df4d14620d2@oracle.com>
Date: Fri, 19 Apr 2024 13:09:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
To: Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>
Cc: Nam Cao <namcao@linutronix.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bigeasy@linutronix.de,
 patrik.r.jakobsson@gmail.com, LKML <linux-kernel@vger.kernel.org>,
 Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <20240418160652.68df1a86@namcao> <87ttjywxv5.wl-tiwai@suse.de>
 <a7843657-c3f6-4d2e-8c36-5541d4c52956@gmx.de> <878r19voks.wl-tiwai@suse.de>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <878r19voks.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|SJ0PR10MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0f67a7-6345-4c83-2688-08dc6043d3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlBsMnNETlorMnVJT0VBWEEwbDEzL09GbDRJZkhwVnk4enF0NlYyUFIzVVN0?=
 =?utf-8?B?WWllVmtpM0J1UHNBa1VMMTZhU3lNYmI0NWxEemJobXRCd3hrT256OTJRQ2F3?=
 =?utf-8?B?ejlqaWs5bFNrVGJSUXZpcEdCVDBYRVBubUxsbTg0d1VXcHBTUzY4OTViTGFv?=
 =?utf-8?B?bVpqYkJUYVhCeGJFSW51K0lSSFByUmdwK09RMEhJOTJvejdlYllHVi84bVZM?=
 =?utf-8?B?YUZFdk1sQ0huSjdXQ1BRSm0vSEVBV2ExZlpaOHdZMlJWc0JEUnRualViSlNt?=
 =?utf-8?B?eGFLaWp5elUwNys4WjFKQlMwME1Qcm1UaUdsSTA0OWZQSGhkbzNCTDRqU0Vj?=
 =?utf-8?B?cUUzdUFvUlJtUmdvSjRUUDMrZXRrcjVJVDNZMlk2NkRLYkROVERCdFlFWFVv?=
 =?utf-8?B?OW12UFBXT0RNN1lOb2FBMFhMam52elJQeUJySTJSeWFqOURVZzFUZzRIeXp5?=
 =?utf-8?B?cC9LUERoL21raUhxM245d2VQeUFnZko2UTJSeDdwV1VZWlZRb0kvc2toUXR2?=
 =?utf-8?B?MmFKa2JNNHpNL3lnc29ORmVpVzdDQU05N21yOHZ6M0VrWitLK1VTZ1ZWWkYz?=
 =?utf-8?B?SGZEZFFISng2aDFzaXFkdjJLOUFOOGt0cHJmaHp2SXcyY1BpV21EOGovanhz?=
 =?utf-8?B?bkYxMEowWERmc3BZdUMveG81OG1Vd2dvTy8wdnVkdlQzWjNHYTd3UGJ3OEQz?=
 =?utf-8?B?RUFWSmJEN0hBMlhlQVVMUFJHU2FhdkVSeUN2S3lTR21iWnBVYjBoc3hRdFZy?=
 =?utf-8?B?Y0d6T010WXd2VWRXdktHN3QySFlZdGlNd1RuYmpuN25selpLWko5Nm9STnlZ?=
 =?utf-8?B?UmR6UmJqNXBBL1dMQTBiZm4wMm0xNHJNT0tnMk9JejYzRzgxQmRqTXowTW5x?=
 =?utf-8?B?aW45aTNLSFJrZit6R3prSi9YY3dJSHdXNkg0UHhQOXp2L2FQOTZaRWhsNWhD?=
 =?utf-8?B?Ync1YmdnWG0yUE5wM0hBY213NklaUVhaT2pSSWU5SUtkRnprK2loVU9aeVZS?=
 =?utf-8?B?d2dmcmRDMk5VVTQ3YzBIYkZpalVrWjFZOWh5OWcyS1Y3VmtYbEZTc29jZWsr?=
 =?utf-8?B?OENia0d1OXlnb0pmT1JPY2N4Nnl4WnRFV1Z0ckdPZFhzNkhROWxFWWZzN1cz?=
 =?utf-8?B?SmQrR0xDejExQnZDbWlTUFhMK3UzalpOei9xdFcySVRoR1Y0N1VoZ250aDVr?=
 =?utf-8?B?Mkh3WWdSSVZLWis1bHN0YklDbmM2RHpodXFGREZ0Qk9IT0c2eUczaTJIMTZm?=
 =?utf-8?B?cUZsMldoYjZNSlpuNHYxTWFwdVBRalkzWXllbmVYRUlIblI0YjFYVzFCL0lO?=
 =?utf-8?B?R0RNdSs0QnRXcllwYmpNTmpkUitUajE1bWh3UzBtdTJhb2VMYnlnbDQrQWps?=
 =?utf-8?B?dGtObmdRTWhJdnhlR1Y4UWp6TTZFeHk2Sk1YUjhLdUQ2UjJVUlVLd2RjT05m?=
 =?utf-8?B?MzVtdDV4WnNTRVViNGJ0K3puWTd2c255bENQMURFYlJvWHVWcmNobEVIclVr?=
 =?utf-8?B?NExTbS9KV3I1WlpKTHpKZEl3SnpkYjV5YllLcnhhaVhrQ3pHWU4rcFhFaVVj?=
 =?utf-8?B?em5JU1lVcWZrWkxhTGNnMkhvNVdxekpvbi9KOUo0UWNYWS9Ib1VjbkVlOVlD?=
 =?utf-8?B?eE1DWUFHZEVjeWRoUlRJdkN0RkRaYUJXQ0xZdmF6OXBZMjZUQWNFYjFPZkhq?=
 =?utf-8?B?YzlabHF1NHUvM0pWRTFPVWFHQmR4dnE2V2VHektNSy9nWThqN01HK3BaY1RH?=
 =?utf-8?Q?w6YcktexxaZKBBkG6c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekVVNU5EaUlRekJ1QUZySTl3QVdvYmZ0dkNHL1hDWGpMNWpsNkdISnhRcjFG?=
 =?utf-8?B?VmJVZkFrR1ZCR3JkUmNZLzM4aWRVelYxNVlBek9SZkM3Y0dlL3NYSyt1ei9u?=
 =?utf-8?B?azkyNk5xaERqN3ZjNTh1aVd2c0tQaGVDQ0F1SENHSjh4VjV5OGlUaWxYc29M?=
 =?utf-8?B?Z1FYK0FrYTV2ZG5ZWXJxU0hab0NBZm5uaEU4dUJULzc4QTltK3BUS2NpbjFs?=
 =?utf-8?B?U05vcWFxQ2M3SFNyalIzdWFpY1M0R1NTVWk1Wi9nT3NneFdHMEdGellQTExR?=
 =?utf-8?B?MnpNbnNzOE9RaHc4S0p0dzJLWVFNRG00WVgyaWRxSWRxM0dsSU55U1Z4RHZC?=
 =?utf-8?B?ZEE5ZExOMHBQWWZpMEtaMnhtRFBpVnNzcUVCeUVNMkZkekRkc0dvM3BkL2Vw?=
 =?utf-8?B?eHQzT0VOMXhMZnBFNHg3NU1kSzZNd1p6TnVMT0pZdnFuNzlxVHZGbzN1aGVV?=
 =?utf-8?B?aXhrTER2ZmRXZ2gramhRUGdvdFRlMWxVdjRmWFpDakVtaE9zUmlPaXVJbWhX?=
 =?utf-8?B?V3d2NEk3UDVTQ2ZKTitrb1hJL0dvejFMUVphcndZajR5OEpPVmJZem16Tmtq?=
 =?utf-8?B?MWdpVmZXbVB2ODNnZVlJNEJCRDhSR2I0cUQyRUlrLzFLL0pCU1BySEZraHEz?=
 =?utf-8?B?L0xwRDJZbUk4YS9sNmV2RnZpSG8vWDFZMlR5bGplYnE2V3J1ZWhoYXVKTFpB?=
 =?utf-8?B?MkpmWk85THlLczZGaGMwSDJEVXVUTnBVM2ZuVDBVa056NU1Sa3JYcTdHSXdh?=
 =?utf-8?B?M3grV3RkaWswT0Nmd1dlKzF2Q0U3aXRWTUxjUUxUUFMyVkJCNjh3NVY5cmx0?=
 =?utf-8?B?Z1UvZVNuSGRMSmdMUmhNRUozTFdiVjlLcnJ5RjVxdTBPRkIwL2VFZGQ1cjJz?=
 =?utf-8?B?UUlaekdGREtqaUpZSDhxbHFUVXBDVmJOaldnUjZsYlVXdkNnMjJLd2dXME1m?=
 =?utf-8?B?QjhpeXgzRW15eDcyN252L3FZTlJuYjBaajlCY3NCNjVSRXFRVEFuZnlrblow?=
 =?utf-8?B?UGFZaHdYejh2YWZFMThZV3JBR3RzaXRjOWNtWUt2YUsyVUk5YzFuakhFaHBN?=
 =?utf-8?B?MndtUTZpRi9MUVp6NEpmRkpqZ0lqOWtzVkZYdVBMSSs0a3Nzd1JiamJ2amdj?=
 =?utf-8?B?MzdOem1ZeGl5a0tON0g0TFowd3kyWXh0UTJhN2xiZHJ6U3RYcGZEd3ZWKzBi?=
 =?utf-8?B?ZXovMi9kbjUwY0VBSlFWUTJhRjArMkE0bkpVUEp4SlhjL2pMcmxJZFBCZVZp?=
 =?utf-8?B?K3VBYXMwSmNUUFY5ZkwyUTVLZ09PNWZ1aGdCdDI1UVpoODh0d0ZOdnVOWFQr?=
 =?utf-8?B?RkdVQ0pmUk52TGxFc1ZtVTRlNnlyTlNOckZtaEpSbjVsc09ETDNETnYydHEw?=
 =?utf-8?B?VjRRNFhsdnhiUUk0QVd4bnB2cWErdXFjTGJMRmtQZWNlMGc0MnRjaGw4bVgr?=
 =?utf-8?B?NXZ4VC93TUlaYlFVZkJQQ1BYUElyRE1Gd0xsTitHV1pvbXlCeElHNkVYUENz?=
 =?utf-8?B?dnJ5bkZZNkJEeHV5T0EzMzU1TnplZ2ZtNXkzajYxUzJEQ0J1YlppSlo4TGpV?=
 =?utf-8?B?bi9BUUJyS3dxbVJLM3FkWFBiUFhzT0JZMnVMOEsycmNRYi9sUEVFeGplUlpw?=
 =?utf-8?B?bWtUR3c2UUtzcFA1R0RiejE4NjdZRHFURVBzREVMbDNJV2VTcSt0M2dDcmll?=
 =?utf-8?B?OVdvTWJHMGJsc0FDS2x5MDBtYjlLbHFDR0NVZUF4M1gyaUUrbXRnVi9kQjNI?=
 =?utf-8?B?eGdsS0xrTCtzRjAyaVR1MXVaMkNUMDQrdlRqOUtmZytSWXZETUk1eU1CenBW?=
 =?utf-8?B?SzQ3V1BiRUI4dHNwcExNWUpXUzl5UWFXNHc4UGFPTnc0dFpSb09raTVuQVZI?=
 =?utf-8?B?UnE3cDZ3SWxCbFl5VzNKazNENnpnZ295SFludHluVE5tWVlQVEIxa3BzbDZS?=
 =?utf-8?B?QUFabGsrWk1lWXNyZ0ZMc0lGbGcxRzErdTJpK0dpTldXcHBXV0VJRWpHU0d0?=
 =?utf-8?B?V0F1OGUxc1hOaG1NSUFZMjk5VnlJM3NPa256Tk9wVDJ3WE9rdkxMTDZaVkQv?=
 =?utf-8?B?VnNFbWZ2UVg3RGhCL2ZxZ2dJNEFGMFV2aXgxdVhjOFphb2UzTEcySTA0RWFr?=
 =?utf-8?B?aUtqTXF3c2ZtZVArSjVscXVnbWdwUVFFV1c3clVCRDdzSWdkWHpVdVZZcStr?=
 =?utf-8?Q?KdA0vW8tfCHZWBTI2Wr6Cc8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: GR2/Vcw0R5/Xb0+U4jTu31MpHk8dZnv9w7xe/t18XArqAKuyfOtZfIAzb0S4n8C6XXgEloAEh/3YJ0k+SM+6WCW+d8QwzUHnuWflfTQU5ES/igMkSe4d5po7F88Y7jrXI8hBuOgq+GT+n2Q4t7iuWPOGo55wN0cw0RaK3MAk+cEYlfvbiAME1y/1ZvB+9tHn8NpkWpONRA5DWDzJTUbzvWgyey8rgN8o+Ogqn7EqffXfgk13T0ktngHtVvd9gbU8AQ0WledIJ8Ix4r43gfa3OBsXga1rm7TZrVwB712tLq6eJlHJ8IHiw/CwCPGQCNrC+KDZKkPzmntcjDJiNAuWbm2KUVhdJkCS50FUvPEs6rHhQmvZPBwzNUCwFYbtKoXjAy4SfQp6EyL5ROB115uruzNC/aact4imqW0ierLuCVMzCuzwjpGnXg3RLhOa/xlfnky/RzTjI8jaxwanZTGadV4ASHbedHBd6eCcjsO/Ptb94hheXHzy1q//fO3WuhOaztqmXA+JuRP3ZQi5Ujd1c1kg+1B3X442ILV4gui1EyIorhlYih0uMuGNYtP9AAFpcG2R03gSZ7xfv3W9hkcOXwuXVm/QsD2yHyzTqkk+huw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0f67a7-6345-4c83-2688-08dc6043d3cd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 07:39:21.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9Spe937Go9KEwiVV+X66OyPrxo/oqQqCVUYD4vpqWx80yjflM84ti80udAjFMdQ2o1icHvQzgOAtIqCUrT4WKpDDvOoRnbPs+JjVGlUrypejqjvoEeErMrp691c3jok
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_04,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 bulkscore=0 spamscore=0 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404190055
X-Proofpoint-ORIG-GUID: PwZuqkOBMQYePltcUCbOY8ItoJI-dWsA
X-Proofpoint-GUID: PwZuqkOBMQYePltcUCbOY8ItoJI-dWsA
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

Hi Takashi,

On 19/04/24 12:14, Takashi Iwai wrote:
> On Thu, 18 Apr 2024 21:29:57 +0200,
> Helge Deller wrote:
>>
>> On 4/18/24 16:26, Takashi Iwai wrote:
>>> On Thu, 18 Apr 2024 16:06:52 +0200,
>>> Nam Cao wrote:
>>>>
>>>> On 2024-04-18 Harshit Mogalapalli wrote:
>>>>> While fuzzing 5.15.y kernel with Syzkaller, we noticed a INFO: task hung
>>>>> bug in fb_deferred_io_work()
>>>>
>>>> Which framebuffer device are you using exactly? It is possible that
>>>> the problem is with the device driver, not core framebuffer.
>>>
>>> Note that it was already known that using flush_delayed_work() caused
>>> a problem.  See the thread of the fix patch:
>>>     https://lore.kernel.org/all/20230129082856.22113-1-tiwai@suse.de/
>>
>> Harshit reported the hung tasks with kernel v5.15-stable, and can even reproduce
>> that issue with kernel v6.9-rc4 although it has all of your patches from
>> that referenced mail thread applied.
>> So, what does your statement that "it was already known that it causes problems" exactly mean?
>> Can it be fixed? Is someone looking into fixing it?
> 
> My original fix was intentionally with cancel_delayed_work_sync()
> because flush_delayed_work() didn't work.  We knew that it'd miss some
> last-minute queued change, but it's better than crash, so it was
> applied in that way.
> 

Thanks for sharing these details.

> Then later on, the commit 33cd6ea9c067 changed cancel_*() to
> flush_delayed_work() blindly, and the known problem resurfaced again.
> 

I have reverted that commit, but still could see some other task hung 
message as shared here on other reply:

https://lore.kernel.org/all/d2485cb9-277d-4b8e-9794-02f1efababc9@oracle.com/

Thanks,
Harshit
> 
> Takashi

