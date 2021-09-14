Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63A40A562
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 06:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD95E6E3C1;
	Tue, 14 Sep 2021 04:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7A86E3BB;
 Tue, 14 Sep 2021 04:27:04 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DNXjmH006588; 
 Tue, 14 Sep 2021 04:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=3HMri4GLJLdIRV+/9TuROARbAeU8bHCRtO7jfJiXNuE=;
 b=mNzYzD5VOJBWZVLiD+t6xbeTStosJeXlH4v317Ue44zUaLf06dp2a3yy6ij5AVr0+v0h
 1wfgWKJMHaywvS6dijo9dH/bjdaeRs1yNN81m+vcumu9ezxax2os9kDPyR6BfwNOLNFk
 OzCjPhmzE3e0kfrBoSqUmAGuX42c3DAtqCke1Xr871TJ7D5HPjPCnhSqHcJJo2F5NHmi
 NzisyjkuhZjSTAZ6RNfu27WI3W2ZeusQf+y9CcrRQO7mSmDQwv1QnkZoGbBj33JyLS+G
 4Ib3sNssAVZd/37NDaMNqjUtnsBdvqRqW90YWp6ZB1SkrhDNgFdf91fgiY/xuNVeqaHJ lg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=3HMri4GLJLdIRV+/9TuROARbAeU8bHCRtO7jfJiXNuE=;
 b=Jb1EosiGzkf9nu0Z8ABluKkU01r8/HQyHvGu8c5aBl8dbrvJDBbi+gOALO4ixZtIuh7c
 lFNNomUKTroOBiDtWPMYCTSbIZjD392ViS9MNPFC6+IFoMnAO8YcpGEKbOoDQSanCmxP
 hYhI/XlPm6z6KvjdENwGuYGI6zIQOApO4Z24d7yMMCnJ9xHlFHEPqXsdqbOCvV9VxCV3
 mHYaGLQ6/EmH27Pb4Y1E9fVeeEE3mUMmbtdKuq/XkWT8RysyFjcahOBQbJ1mENr2pL8o
 p4F0zAvxbs6HnesLWHFkxmFHyJkNQq7CjG+uze5Bv9DF98REMVD1G/ncDxOc/Gnl4CYN 6Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b1k9rw38h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Sep 2021 04:26:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18E4B8FJ185821;
 Tue, 14 Sep 2021 04:26:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by userp3030.oracle.com with ESMTP id 3b0hjufutx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Sep 2021 04:26:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l81SZGrVZFDbFGFCqp+ZLDNKayNPYpoxzpSsKLfzJiQEE7hQPFjng/GeoFSivUzm/XpTR6Yz4CuuekLUSnpSOlKi015A/O1lcKTkzgTCkHjmAixQHD0+ua1I8V2xbciQQ4iq6oJTRdtK4crsebOrS2JZ1vLWvZEe+w4hQymBak2lXDahoDhiGLrPLELACt62JsRmBfcCXlqvRrQiBh8HItJzWucI8BuJOWX2B+6xD66eWrpgTqW1jTE34aNHxdGSi6rWJonjk6vPVfYYXxRD4ySA6cbuqokrKUtsYsvjVonZat51f2iqQebsjd+unemhFHq4Ko/Dg5pnfIQMSM3ITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3HMri4GLJLdIRV+/9TuROARbAeU8bHCRtO7jfJiXNuE=;
 b=CizjC6zjBOKAPCpUvORAl/l1Yzigs+SC9QpjHEzUtHuhScxfT5ge5rxvy+ornLw3DlND4iHCez62i5PKUckZy6NNkQ7mnwLKlRDXZTTPUfmPpxuYvUlpSDFMxTSOYkZWTIUcpDOgMchmSj35oi3PQW42KukDngKEFQJN2IQiNvmJ41TbW420AVPaIjSoYCFQadw4QuAPl+OZL0eR0OhwTas33H8euLMZhAE1icRDYaVyyoUpY3JKsccN/mUqqgEvS9FyWgzIzDDx/NYL7c4WMuv3t3W63nMn7P49pt+B262XF81Ilo8J9uN4ixh6yyhX5WIabgFVt4EePs2AIK9OsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HMri4GLJLdIRV+/9TuROARbAeU8bHCRtO7jfJiXNuE=;
 b=kgk1KOYQG1+UPM+Bdbyivqq74YGxQSLdffmYIG6AxZx+7pdg9Dd4RoreGGaD2hs0oh29mDcn3pldsHB7zPGHWVH0mqxWkU9T6f7ne39tQ82VtRG5w/GQL+RI3TLdHqMXASgVHwKtbU9j+lsTN2Ig6fmorTZ/cBMGLAJAfRIK0Gw=
Authentication-Results: kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by CO1PR10MB4690.namprd10.prod.outlook.com (2603:10b6:303:9f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 04:26:52 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 04:26:52 +0000
Subject: Re: [PATCH 1/1] lib, stackdepot: Add helper to print stack entries
 into buffer.
To: Vlastimil Babka <vbabka@suse.cz>, geert@linux-m68k.org,
 akpm@linux-foundation.org, ryabinin.a.a@gmail.com, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
References: <20210910141001.1622130-1-imran.f.khan@oracle.com>
 <20210910141001.1622130-2-imran.f.khan@oracle.com>
 <464d76e2-37f0-87f3-a9d5-2101367a8ca3@suse.cz>
From: imran.f.khan@oracle.com
Message-ID: <ba2f09de-1de7-3a72-1c1e-fe048c50b8e0@oracle.com>
Date: Tue, 14 Sep 2021 14:26:42 +1000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <464d76e2-37f0-87f3-a9d5-2101367a8ca3@suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0401CA0003.namprd04.prod.outlook.com
 (2603:10b6:803:21::13) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from [10.191.131.190] (138.3.200.62) by
 SN4PR0401CA0003.namprd04.prod.outlook.com (2603:10b6:803:21::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15 via Frontend
 Transport; Tue, 14 Sep 2021 04:26:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78124754-25b4-427b-69df-08d97737e047
X-MS-TrafficTypeDiagnostic: CO1PR10MB4690:
X-Microsoft-Antispam-PRVS: <CO1PR10MB4690BF1BAC1E2DFA2C4B38A9B0DA9@CO1PR10MB4690.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q7fhpnojRYNGwcQgrew3JfoRgkh/EKflsj7oLE9ofGDdB0msK06sV+OLPX8Ncmw5us9/pE92ncDpGXPYXWnSt1Hfkx96EsuR+VJwqcjhSMiraZLK5kxG4z+tl6TN9+fQ6EZ9OZGe0EUWnfz1o2PH015WBQ0AuVrF0VgXTviEVgBRLr7umny7rDQBdCx1oB493bTcK3sN4G03Gn5fy4JvjHD/RX30TzOCHFhE+yKDZkx2nyBeWqDYPwZ0IfpLOgCoLrxCMLTW0IY/bnHs0z8jlFdq6Q2iy/cyAaAS/AUCWtOZk8oT6pnRvd7z/aAGkjFkmX9mAd+rFiDSLpbThcrmZoV3SVd4IrYdjmd59Ay/BNDSZg504qu4UVENdUljiipAEzLt6+G2cPaQ9xohgpd/G7qoyUbjqIiFa5JZCh6Jzk1GIZ5AsPzeAcjE/s6XXkXYjqFHMlDDZYugA8sVwOcdtGPx+SegFz/TxNSliuy8sujaoxakXsLLUoKEW19ySSPfJO++Rlv+KAuRaqTfLYfA8+lwgJcXPKNoRf5O6FiSHfJ0h4UWL+4kd7fuxY6Y7A4AWwQbgo47nehvhJbuf89QH5qDgIABbVXBOJnW/KlyU9MYLLAR3Z3yxgubDCyLRmiPdcgzX9AAyHvi24wrI78pTSX2/QkM11JHOAbxBK2XdXc5NvviTDUEChxBk7mExyvuopAzKWcOjWq6IB3ka93/FA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(376002)(39860400002)(346002)(366004)(86362001)(8676002)(26005)(16576012)(53546011)(36756003)(38100700002)(7416002)(186003)(921005)(9686003)(31696002)(31686004)(6486002)(5660300002)(316002)(66946007)(66476007)(66556008)(956004)(2616005)(4326008)(83380400001)(2906002)(8936002)(478600001)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0xFWmFQMXEyUGRrUG9wNE9UWTBxY1dEdDNHL2lCU2xWeUNIUnlGR2RwSjQx?=
 =?utf-8?B?QXpEOEQvaUI3NDBCdm5OQ1Y0KzRDQTRNUUlvYWo2MDFqZ0tNVXRPbTJ6NkRV?=
 =?utf-8?B?VzVpYVJmZVRDVzBOTWlaS1UyMW03NDVFWEpQTnVuVVZXbU1Tb20vWU96MHdO?=
 =?utf-8?B?TWlVcVl0VEpnMUJlVlZvTi9says2VTNHM2d3Q3N1ZVlIcllYN0lmSFBiRjBo?=
 =?utf-8?B?ZEZ5V2szNm9ndDNwSDNwV1NpWmc3TGVuWnhRZnMyUHBsZW5jUnUvaU5qMzZ3?=
 =?utf-8?B?Rm91b05qSjBSZTBzUW5EUGx5bHFzdG9VWCtPQ2J2dXJlV0JoK0JKaHh3aU5V?=
 =?utf-8?B?dlJyQkY4RURrNFo3NCtlZzE3ekhzbjBKb2srajZkUmRlc1RTbUZQeGFlL1E4?=
 =?utf-8?B?TGQ4QndCZmxLbWdmNUFzeWRRdHZlQ3JjQ2hGSDB1RVR4ZkRvWEdVSlkwZ24y?=
 =?utf-8?B?eXVkS1VtWDRBV3lNeXZyaUp4R1lkcG12WHhtbi9lVTdsc0FVUmdxOVRETjJj?=
 =?utf-8?B?dmIvZnVoQzJpTFA0UlVmUFk5REpZVG5LdUF1bjAzdy9xNWs3VUZwSnpFM2Fr?=
 =?utf-8?B?emdsN2hvNkgyakpvbjMvTmZsYlNoZE5wZFM1c2lFMWorU0hiSitzaTV5eHV6?=
 =?utf-8?B?b3A0RExNMXFFTjF0L1E5azV2SmxUa1EvKzdGa1JFSFEraUVIZXRMdE5mNy9i?=
 =?utf-8?B?UHRTdm1KdDdmSm93cmU5UjZQRGdNTjN1aDM4T00ydi9WOVV3UEtHbTBPc2No?=
 =?utf-8?B?bzY0ZTB1aVhabmN5V1IxYjBKK0RoRFBmMCs0K0wvU3J2ZVlRUmtRL0JLOWNv?=
 =?utf-8?B?TkFHM05KRVg3b0tTZG12a2hGQjA0QmpxTkhZVXp5NDlOY0ZpUVRTYVBtUVJr?=
 =?utf-8?B?eGU0YXlsWjVIQUhOaWpOaS9TY1YrYUt0c1NVeGhuUVdIRU9CMndYNHVsaHFs?=
 =?utf-8?B?OTAwdHRsL3hYT3I1Q2V6MUlUcU5OUVJJSmc5WmtYU3AxZXFhWlZQZk43UDlR?=
 =?utf-8?B?cGxWZlEwSFc1SURwQzRLMU1LS3ZZT0kvdGY2WmJaOWNBYU9uUUoyUWRHbW1F?=
 =?utf-8?B?bS9MZ200RmVWMWlQU05hYURkTmRZVk9zVksvc3ZzY0hMcEVlMUpzZUdLbytU?=
 =?utf-8?B?VmovK0JzSmdsQlRoOFJCOTZ6YURwWnlEVlprZy84Tk96czFMUlNaS2Y5M1hX?=
 =?utf-8?B?d2NmdFhMWVRiQjRmYVplSVRHY1BuNkVFbFBtTFp2K1kxdkw2WHlrdUVhNVc1?=
 =?utf-8?B?QlhMeVBNMDBDdHZHZkpSZ0FYYUlKMVN4SzlBQjU2NUV6M2V2U0JaOFpySndX?=
 =?utf-8?B?Yk1WZUxGWTJwdFhsaEZ6Y1pZUmJqUEVmd0VsZ0dMUWZIVjFmdXJSNFptMUQ4?=
 =?utf-8?B?cDIyNWR0c3Axdko2U1FORkZERFUxOVFRL2J4WEF0d2IyMGYveU8zQ2FDYUxa?=
 =?utf-8?B?Wk8vM0FtS1Y1a3Zycml5STl2NW5XSmZxN2VmaUxvSFROaGQ2RmU5dUY4d2NE?=
 =?utf-8?B?enVPSXMxRnoxaHVuK01ENGlzc0hPZTF1WjdJWU9pMHB3d0grWU82K3RtSG5j?=
 =?utf-8?B?emFsZEpLOGhJQUlPRlBpSENRT2NXTG9OMnQxV3RHTjRCbGpUWjltbVFweW9w?=
 =?utf-8?B?ZGVsVFRCbUE0cjg5eE9VMGtNUDdFaFUrMDVJeDJBZEFuODkxdjBTZ0pGNllz?=
 =?utf-8?B?dWEzVUdQeEFmRWFkeHhEcGVxQWtZVklkK1ZaT2o0eUZEN3FUWUZ4TXQ1VjBq?=
 =?utf-8?Q?j7lR1LW2/5ArHsKdBIHIoYrAW4bICs6xI3rq2OK?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78124754-25b4-427b-69df-08d97737e047
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 04:26:52.0921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzMHop/RCgdoRRx/B6hX6fjObG62Yvc+09+4SQcw14GjpInjg6j6l9Q7omNKTjZBqeGB/ns+UXyC2EthVF0Oqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4690
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10106
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109140024
X-Proofpoint-ORIG-GUID: j7XcZsDbV9BpgKsMYMbBc1AV4Wcv5DYT
X-Proofpoint-GUID: j7XcZsDbV9BpgKsMYMbBc1AV4Wcv5DYT
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



On 13/9/21 6:51 pm, Vlastimil Babka wrote:
> On 9/10/21 16:10, Imran Khan wrote:
>> To print stack entries into a buffer, users of stackdepot,
>> first get a list of stack entries using stack_depot_fetch
>> and then print this list into a buffer using stack_trace_snprint.
>> Provide a helper in stackdepot for this purpose.
>> Also change above mentioned users to use this helper.
>>
>> Signed-off-by: Imran Khan <imran.f.khan@oracle.com>
>> Suggested-by: Vlastimil Babka <vbabka@suse.cz>
> 
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> 
> 
Thanks for the review.

A comment below:
> 
>> --- a/lib/stackdepot.c
>> +++ b/lib/stackdepot.c
>> @@ -214,6 +214,29 @@ static inline struct stack_record *find_stack(struct stack_record *bucket,
>>   	return NULL;
>>   }

[...]

>> + */
>> +int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
>> +		       int spaces)
>> +{
>> +	unsigned long *entries;
>> +	unsigned int nr_entries;
>> +
>> +	nr_entries = stack_depot_fetch(handle, &entries);
>> +	return stack_trace_snprint(buf, size, entries, nr_entries, 0);
> 
> stack_trace_snprint() has a WARN_ON(!entries).
> So maybe we should not call it if nr_entries is 0 (because e.g. handle was
> 0) as the warnings are not useful in that case.
> 
Agree. I have addressed this feedback in v2 of patch.


Thanks
-- Imran
