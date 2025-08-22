Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E527DB31BCD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE0710EB29;
	Fri, 22 Aug 2025 14:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="ckXDXPFL";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xEOK6T72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA76610EB29
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:36:45 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MEQiMR030623;
 Fri, 22 Aug 2025 14:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=ptJOPwxA9vyL2weyksHx+qrF0znbWLb0E30KRRDxzeo=; b=
 ckXDXPFLpVkNAegNZAIlzBiGvcF2GSVfbuN2bCa/wjeeKMw5AG8gvzTNht1ckt2B
 twJeUa8fL06Mt55sjSGbMIAmIO63fmWTiet965o9Ih7SzrA4d8Nkx82MrwV03Rdr
 R12NP8TcBFRdPCf4iKpdo864PXFrtFWwBehq6nPXq1faju/zCMO1VC0DIVUrUuNR
 XojFu2kN0eUDhr4RohNGoL03mzJiRatzjTzOUVehzY/RQzhYb5GS8771yCXOIJLX
 dPWiMOlvxP/2YwJI4JqRW9yxBp80gXwsoayv8QhMNqNij8CrZxw9NbWCOcXs4aWC
 f9YNIxkVsSRDaubgaCzA6A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48n0trwy4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Aug 2025 14:36:31 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57MEKIVG020625; Fri, 22 Aug 2025 14:36:30 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 48nj6he5x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Aug 2025 14:36:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slMjuRtz/UvQXJHfHltadO8Lo6q84Lf2KjPicbhLH+cuyAVnx3b/mD7EtIgQmhCxhTex9m1qmufLVXoskFC++1ta76nyanQwDZ+a2ukveZgzHaCnvBWVLDYd+YQFPrhl/4LbaaEjoeqpfYpI50h2BiA8XZO+Pe5iqbgYCAbWSBtYTpqp+n5koN4Xu9a2z3qe9MYWlsqiUPH/wmGDdv44FyMCa0tqhEKNjf5W4ujizoD4qb4ogQNb0e2D/GgtNcchQzrEZU1tEghP1v4IAeC8cFn+xuZMwcIP1RRrXdkIqlu5uU9dsd2v19UO11Zxaju4jtSgZ4+0d6M/tHNit47DBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptJOPwxA9vyL2weyksHx+qrF0znbWLb0E30KRRDxzeo=;
 b=QCkqUtxd9PMM+cx7FZvHFdHTFmWsQ0+1SsBj7/ehxIAQcRs9gdjJHCsBS5HLPKZkPJu4c5bGzlk6f8pabZTl8suEz04BKZmTvVQXcjJEZExGWwjBF0+JS3zw0YGTTX3fyArSj/KmD6ZSeyefZvpf4wDEmJxDsCNUu7NZgRMFFKuHpA44bRyOCvEHm3l2dl7wg9onav5RwZiGk2avcSmwyEzF4OythTe8BdVd1PjVoDHrqUPQA0yqeipfXrQuX/OGhkmTzIVGn3+aUFSvsSGMYlmksBQX9spsrO9sLzFAbqebHfXFbfxQ9BAv9sWnqTcQNx1Tan23gW/rj2Wdd9KsJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptJOPwxA9vyL2weyksHx+qrF0znbWLb0E30KRRDxzeo=;
 b=xEOK6T72dUP0iVVPmnY7WSLnZGsW/TuOIu59F+a9vqb6/B9joiHJ5K5kWEyMH4abdPFqI9Fyz25I/ANSxDaRgX9CJtv7dNfeuMR4FcgFspVGHsN0MWonEDAuLhpw+q/EsdjJAm5GUE8wTDuKUMpjevv8SjRX07j8jwsRlTQ1X/8=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by MN6PR10MB8069.namprd10.prod.outlook.com (2603:10b6:208:4f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 14:36:27 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2%5]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 14:36:27 +0000
Message-ID: <e80a3fd9-56ca-40c5-8ac8-237ce14cc79f@oracle.com>
Date: Fri, 22 Aug 2025 10:36:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] DRM IDR to Xarray conversions
To: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, willy@infradead.org
References: <20250821145429.305526-1-sidhartha.kumar@oracle.com>
 <f69669c873dbb99c239e9f2ddf154e983baa61e3@intel.com>
Content-Language: en-US
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <f69669c873dbb99c239e9f2ddf154e983baa61e3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR21CA0001.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::25) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|MN6PR10MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d794069-29e7-4129-bbdf-08dde18946e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDFGTUh5dEhVWG9Eak9Bb0ZPQUdHWW8zSCtwR3FmcEswOUpJVWtaSFRiSDla?=
 =?utf-8?B?VTFXT2FEdFNUZThqOVl3WXVIM08rYnlrcHczaWJPVmdhejdLazVjTkplaVpE?=
 =?utf-8?B?QzZTL29MWVVqLzRqNWxGNDNYbmJyZTlDT0R0eG4vanN0QVQ3clcrKzZtenpV?=
 =?utf-8?B?MjBobC9VSVVxR2VYb2U4Y2MvVlh6eVRMZG54Vis0Y0RIZ3VqSmpEUHp5anZY?=
 =?utf-8?B?QkhkQ2JRQ3dCb1U3TFY3d0VpVStEZzFDVThHdXU1by9hK0puLzhLZW5XRndI?=
 =?utf-8?B?aTQ0U0wxejZRdk1YS2paL0JDMUkydEI1ZVhBN0ozOGFleFBoUUZWYk5aMHAz?=
 =?utf-8?B?a3F6V1laWDB3U211TXlqb0JvRTZoWWRqL3NmcVRQWGRjYStZZVZjU0dJOFk2?=
 =?utf-8?B?clZWcXdTNVFlcTRteFlxYXdCMjdJTWM4eTZCcm9ZRFRrcmdKMTBxNXFRMXhX?=
 =?utf-8?B?K3ByQ3lLelN4VDNwL3MvQW84b1BNVHdzVFdDSEJWQ3IrM0JJN2VrZlY3MHEv?=
 =?utf-8?B?SmdxaGVKaTAxYW9VN013ODBBbHpMdm1pUGJTN3NFSmRxcmtHZ2c0S0M4SVgy?=
 =?utf-8?B?N0p6dmFVWmNVUGl3UVdJTUxNc0Y3OCtXOGRaR1I0cVVXbERKeUVMMlJxaTBJ?=
 =?utf-8?B?aFpWMGZrVGpLZDE3OVZwM2kza3g5bmpjVVI5NEREQ0NEcFUvdE5kc0ZWREM4?=
 =?utf-8?B?RTMwclhLd3hQQVVCYlJ5UU5pcDN6aXV2OGRrYyt1NGtwQmRaWk1kL2txODNP?=
 =?utf-8?B?YTl2bkQwUWJpNkF4eFhOREYwRjFYNndhMmcwd0RreVZ4UmJVSVl3N0dIVC96?=
 =?utf-8?B?U3I4YzRwSDNxb2NUMFJtaTZUMXVnMktialBobnJkQ0IyWWNKemlDOVZFa2ZP?=
 =?utf-8?B?TklNRnV4ZjE1djJ6VTY3anljR3hseEJsNkgwNHZvR0xXS0txYldPVFlDSTQx?=
 =?utf-8?B?WllPRXpEaEtNRjBpNHRUUWlvbWU2Z2FBcGpPeEtNNk92cDNkV2ZzQVczNjFh?=
 =?utf-8?B?bjBaTDZQekVReFJDYi9idjRZeHFXUFU2TnprRVJ1ckFJTHdZQ053aS9VVlFu?=
 =?utf-8?B?VThPRDcrbDFBRmU2Ty9SQmdsTnJLeEFZNVovWEwreVg4SDd3dm4rUnVTMnRa?=
 =?utf-8?B?cE9PLzd3Zkpwby9Fa0hmdXhhRzB6UUo5OXlxd0M3ZHpmZlNVbi9KYXhrME1Z?=
 =?utf-8?B?SzB0dkpYQXVqQVZWY1AwenFhVWphb0Q4VW1DZktWUTc4Mmo4K0VJa25PK0E2?=
 =?utf-8?B?RFZOMVZVZGFUL1JrT1p1UUNqTmFDTitIeEpLRTY5U0EzcmtCQ2dzOW9jTjRa?=
 =?utf-8?B?dDB1TElTbTk2ZmRPS1cwU2s4WVp6R1gwbGZpUWJuTFk5bnJBbHNSVU54K3ds?=
 =?utf-8?B?ODNNWFgrRlI5VE90by91UlNuU1JNWS9vaVZqdG1pa2RvZWk5Y0FJbWp0V3Ir?=
 =?utf-8?B?cHNsR21MTmY1dkx2Q0NlSnVROWdWdHM2QmVuYXEwRWtVUlY2UVRmQ0RUejJO?=
 =?utf-8?B?T0UwdVFlZngxOUNSMFJyVnJWc0hRZ3hwd3lZVm01SGpLRUVkaHlPdHBrZXE1?=
 =?utf-8?B?U29BZUtvTUE5UVlVVlNpWWxRc2RYVEhxVFpDZ3o3aTJPY0Q0cVdySnpwT1ho?=
 =?utf-8?B?V3hwUmZvejVXUHg5WE5tMjVHVis4OWIxcFhBaDVrRlY3empLczV5Z2M0ajNB?=
 =?utf-8?B?dEg3MmJHT1k2WVhJK3NPVjU5dmV3M2ZTdXZsOEV5YnA2RkszYWNpUE5UdFhS?=
 =?utf-8?B?OG8wMzQzbWJ5UWJrNDFrQTgwMURxZGgxNnB1UnZwZlB3Q2FNb2U2dW5Mekll?=
 =?utf-8?Q?JqezfxgcRfdpLbMvai4UB0qvqvXhUQD5JrErw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5113.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG5uYU9ZUEVJWmM4M0lveTZiWTZYMzBpS1AwNDg0U2JDZUxCbUtVOG9mTThz?=
 =?utf-8?B?Qkt3UTc3Vlk2SGk1QkUraS9TTEVSSENmZ00yVE9MN21aY012WHhhS2wyWTU1?=
 =?utf-8?B?T05CVi9HZHo4MlNJYVZaSGhYTjFZbnhMWlVIb1hqa1NhbWJ6MG1aM0hjNng2?=
 =?utf-8?B?Ly9DbkE1elY4QUQ3WVMxdVArSmoybVNza1k3bmpaVDkrTHFseWExekVrWXoz?=
 =?utf-8?B?Uzl5MDNSL2pkVmR3UUlXcWtndG9XRnlRVm9KSTNmblF6UHdic1pDRHYzSmxR?=
 =?utf-8?B?SDNiNHl5c3MvWGR2aFJsNFJUa0tvUjd2REdNZ3BqVHl3VmYwUlRGaUE3RjV3?=
 =?utf-8?B?Y1N5L21xeU9jWDhaK1RlNjM1VG5YV2JLNGFUR3ZzeWhxQ1dCNGpuRnkrQkdk?=
 =?utf-8?B?L1E0YTRIWjc0RmVNYUNyWGlGbGRCcHJIRFNsVCtxY1pRb2ViSnI2WmxHSWdX?=
 =?utf-8?B?eVY1ZGxOSkxqb1IvK1FNSGNTcnBUSjlxMGh0VU15MXRZQ2VtMUtpU3U3QjNq?=
 =?utf-8?B?RHgvVzcxUE85VWpOUFphZVJYeCtoSXJCVzhIY2Y5blVuOEF4Z2MvRHRjWEVn?=
 =?utf-8?B?SE5uT1k2TEU5OHdJd3dpOUZLRjMrT0VHTWQ4ako2ZkUrQjhyWFNxSzJ1NnhB?=
 =?utf-8?B?UVhlU3pnRU5ZdWR2UGR3ZDMwMFRQdWtRMzhNcjV1bGduWUZRcEM1bzdMdUpR?=
 =?utf-8?B?OU53b28rY0VaRnFTT0NpeDltbUN5cExsamhDVEhmaFQzbGpINTBHRko1SU9U?=
 =?utf-8?B?eSt3R1FoeFVQTlhqVWNmODg2bVM5UTExYmZINk9HbU5udTJGR1gxTDZWeU1t?=
 =?utf-8?B?WTgrNTFXUHkzM3NOY2k0UHUwdGY2VjkxSnZKWW9kRjgwa1ZnR1FMQlVOaUVM?=
 =?utf-8?B?Y0xkYjJHRUt2SFZrSmpXUVRmYmRPZVBRbnpRZmlFc0VQRUtzNTZBaGFpclVW?=
 =?utf-8?B?S1hyNkp2U1NjMzJxV0VabWErbU5HOWFaaC9TMFJ4Z3hTdVZjdDdHUXVYWFZK?=
 =?utf-8?B?dm0yTXJ0cmJPeWtMRHlSSUJRbGVXYUM2MnFaSlptREZ2ZkRpL2oxeTczTGFz?=
 =?utf-8?B?UWc2RUEzSzA2VHpzeFdCaGVwQ2JmOVg4aHo1VjBlUFIwNCtPNjFCcFVlQWhL?=
 =?utf-8?B?TVpTdkNvRzJwaTJZa2htSFBobW5FVnNDdjVDVEI5eEdDb2RTMFZ4VFFQL0JF?=
 =?utf-8?B?d2xjeVVQanFPeE1XSEpqMVFnVkNSKzgvOEZXTkhUU3dtNDNJOXFLUFljaWZD?=
 =?utf-8?B?Mk8zb25mZUFRTWpOeTFYNCtDRlMxZTBzcmFPeWgydkRZbmIwTmN4Zjd2a09M?=
 =?utf-8?B?WlZhSlFUdVZ0ekJFTXVRQ2dLR3JLeFRYaTdmU25YODgvaVIxcjhxdkUvQ3po?=
 =?utf-8?B?V3ZNMStrTSt1amIva0t6UWxvMCtMeGJEODVKOUYxYVc2eTNaVjlUMFhBZVpK?=
 =?utf-8?B?SVppTDdGRm1Iazl6aXlJNmZFNnJwU0wxNllDenFVSXBpODRBZkp4Njl6LzBP?=
 =?utf-8?B?WTQyQlhyeE5Oc2t2NTM4TEx0UVd5M1dHSXpuS3pjUW5pdUtkTmg4L1ExdHMv?=
 =?utf-8?B?S1psTkRmaEVTODBVMlhyTElTNmEzSnZ0bnNhTHFwSzMvUjBTOENFaXdPU25w?=
 =?utf-8?B?cmdod0tIbmdNZlhUU2Y1dGY2NlNpVk1yT1VaaWVOWFJGL1JzY2xSVGhSNVFJ?=
 =?utf-8?B?UDVDamdDQzc0MTR5ZWlDRm83M2VhV1pYRmpnaUc5QUlCb0RXYk9KSGFXdUdq?=
 =?utf-8?B?RENjcnlHVk5tcTJNM3pZYWJUcUxIeWorVkZ2SU9QMVpCNXU1dUlaMWx3Yjdt?=
 =?utf-8?B?ZEFCdnp4M09uaVRtaER2aWo4bW1QU3k0cDhUT001R2Z2OW9BQjJJVnNoK3Nt?=
 =?utf-8?B?bDJoaW9wVys4SEtRQS92RkNDbDhUTnhKYnc1MTU0blhPdlp3Z2N6RTQ0SmY0?=
 =?utf-8?B?MjFML2F2ZmtScUVFblNOQTNwb2ZkdStCODJ4SUZFSEg5cW5iZSt5eCt0elFa?=
 =?utf-8?B?c3p3VzI2QzNxTVQ3V2NENkZIMFZtaG4vd3FBQXcwRWh5c29hYU1kMjYxUk9u?=
 =?utf-8?B?Wk5jaVpoU2VBQll0WkduVkhnRlpQWHRQTTN1dFBRdmVzTHMxTFBOLzN4clg0?=
 =?utf-8?B?eEtKdDFmNmREYkI5SzZUNTBocXRNVjRiRTRJUDVPN0F1dUZoZGJKRmxmUU53?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7Gw3OQnum/ywVGu0Zcl46p5EXz/Lkg6yUApjhR1+ML4EG3E3OrUzuCUPaOejivvZwNgw09+tYTxHh+n+vH4S0N4RDIKr8HgysrlDjbThP7Oo/Qo/5F9BIEYg060Q3eUmkcJG2ldDcbB1PzXcFmCgaadNFG8wA8ANY+ym53OQeo7DByoX2ZlaJVVsNDU+QZI9XafZRIlMW9fdnIcKEHJtRbxOQUfPe1lZSXml81ODj1BJDTl4R9GadV6IDchtcIw/68xtGHnj6/mvFxh0SUZ3ZHg1kPOIUDT98y1ag2sE6x/5sfXEGHH/4o6F4FqFo/u1ZJAqnxKJd9fT9wvx5VDMW4e8EhtsAktNCJT73Kn/8WrmXTV200KnIVM/6Gxt6ci3i3fmb0ulo2UGKZt2dEyV+P7OH0HT36HUnlxQnor1wWdckFMht3WkE+/XHPkB26+KDlm3RTmkbNyxD5peqANLz49ikLeQbbINayR+AtimuspVDqSsTmgm6ZyYnMQfwtrYbHvaOD9d7HL/LDNGAGbNagchMONMSb6g4XRcM+RGpzCNYaHssIjUuI2mgDTfSoWk3Xdt0TyHzKDLEkki5zvggiD9rsviuMmo4k2EmvTGdzk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d794069-29e7-4129-bbdf-08dde18946e8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 14:36:27.4969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TgyisE4Gx1A2gb/HO74ykjuLAEJYLRFlx7x+dpVGRq41VQO6qBvQ2G51q+7RlFXdN1N+ABzafznI0nQXuNPVJHdTHPxzxofAW1bTF/5TLOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8069
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508220131
X-Proofpoint-ORIG-GUID: aHxeVl9U6pXjZc_4UrWYnoVE6NKefB3c
X-Proofpoint-GUID: aHxeVl9U6pXjZc_4UrWYnoVE6NKefB3c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NyBTYWx0ZWRfXzmqf54D8Pkxt
 eEVPHVR6LLBUZG15ELEnm283muZkoiYJy1Nw5EJBr9WQedkQAk2mbzYmSF0jOVgn0rGA1LmCzXp
 KpJXHPheTPs8FJ3nY6tQxCBqmRmffgcrNpTvWdf3+crWYQ5lgToMlIhsIlya7aYioZnwYBH6E6n
 s4vW8CSIeqqe+4+3z2Kq/7BEC38UwEz+q+7c4RP1qZeY12dDm6Yp5LUM34NqdFRImVxBaFpwoxO
 a5S3k5T7GSe3tJJogJQVJUuI520oEvS8Genu0SLPE0eE7vVR1DHvh4uNOpsicMgblHFwZybznGN
 Yh+J23aFcz5s4LR6jp+JJOfOA23GFETOJSqsv0gREVm0jVTNIQBvSmypzzK6Y/CGRFsNmy6dgdu
 MHdQGajKs3PY2DkDYQF+0625OiwAn/fgl+6kWuZviQjop/8UGzs=
X-Authority-Analysis: v=2.4 cv=Qp4HHVyd c=1 sm=1 tr=0 ts=68a8806f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=nbEhsuhSlDpIKRCp6GkA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:12069
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

On 8/22/25 8:33 AM, Jani Nikula wrote:
> On Thu, 21 Aug 2025, Sidhartha Kumar <sidhartha.kumar@oracle.com> wrote:
>> From: Sidhartha <sidhartha.kumar@oracle.com>
>>
>> v1[1] -> v2:
>>    - rebase onto latest mainline v6.17-rc2
>>    - fix build error in patch 1 per Intel Test Robot
>>
>> This series is part of a project to depcrecate the IDR in favor
>> of the Xarray. This simplifies the code as locking is handled by
>> the Xarray internally and removes the need for a seperate mutex to
>> proect the IDR.
> 
> It would be great if the commit messages mentioned whether the
> identifiers are expected to remain the same in the conversion.
> 

By identifiers do you mean if the name of the previous idr variable is 
the same as the XArray variable that is introduced? Sure I can add that 
in a v3.

Thanks,
Sid

> BR,
> Jani.
> 
>>
>> The patches are from this tree and have been rebased to v6.17-rc2
>> https://git.infradead.org/?p=users/willy/xarray.git;a=shortlog;h=refs/heads/xarray-conv
>>
>>
>> The series has been compiled and tested with drivers/gpu/drm/tests/.kunitconfig
>> and passes all tests.
>>
>> [15:22:04] Testing complete. Ran 608 tests: passed: 608
>> [15:22:04] Elapsed time: 34.792s total, 3.086s configuring, 31.541s building, 0.141s running
>>
>> [1]: https://lore.kernel.org/dri-devel/20250818190046.157962-1-sidhartha.kumar@oracle.com/
>>
>> Matthew Wilcox (6):
>>    drm: Convert aux_idr to XArray
>>    drm: Convert object_name_idr to XArray
>>    drm: Convert syncobj_idr to XArray
>>    drm: Convert magic_map to XArray
>>    drm: Convert lessee_idr to XArray
>>    drm: Convert tile_idr to XArray
>>
>>   drivers/gpu/drm/display/drm_dp_aux_dev.c | 38 ++++++--------
>>   drivers/gpu/drm/drm_auth.c               | 22 ++++----
>>   drivers/gpu/drm/drm_connector.c          | 26 ++++------
>>   drivers/gpu/drm/drm_debugfs.c            | 19 +++----
>>   drivers/gpu/drm/drm_gem.c                | 11 ++--
>>   drivers/gpu/drm/drm_lease.c              | 15 +++---
>>   drivers/gpu/drm/drm_mode_config.c        |  3 +-
>>   drivers/gpu/drm/drm_syncobj.c            | 64 ++++++++----------------
>>   include/drm/drm_auth.h                   |  9 ++--
>>   include/drm/drm_device.h                 |  4 +-
>>   include/drm/drm_file.h                   |  6 +--
>>   include/drm/drm_mode_config.h            | 12 ++---
>>   12 files changed, 86 insertions(+), 143 deletions(-)
> 

