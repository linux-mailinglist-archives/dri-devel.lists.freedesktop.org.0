Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1146974EBDC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 12:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46EF10E367;
	Tue, 11 Jul 2023 10:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE8810E357;
 Tue, 11 Jul 2023 10:09:01 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36B8a0fc019334; Tue, 11 Jul 2023 10:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=w2kAWpNYgHmKcFeGhvRti5KnJsSkjfpdTI7lVsyBHQk=;
 b=ufeDhX9A2MzDMeTQEIiOzWU8+xPmpG+/0s2HQJUnNZISm3lABYGVv1GtK4MjACjJ//dk
 pJW5QOFs/9jYIYyvIhqrLrii0ny2y7R1P2dyLbKnxFreK35RA9McUqdYf2/Dff0s5jBI
 mz7IPy5OsZDAJobgbul66qwR9GRGIG+YmvZrReY6yDRQxpL4PwsV43+kNVgnGozFXfHR
 hPYN502xj95y3W/i5rBgkXpjDD3g7PM1c/8tmn2Joiz4Ih/n4jCW1hAI0M5Cc4ZffcIH
 9q+YgCvO77aGhL0AFI0DnfnkIe+JWQOVUz8JNyQewGhZ8/PyxR/k00+0KVK2AX9v2fFL zQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rpydtverk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jul 2023 10:08:56 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 36B8YenC026015; Tue, 11 Jul 2023 10:08:56 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3rpx8awq7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jul 2023 10:08:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZMiCAm/mWn8SZazuxQqCjfMOngQwHIR5M9mbjMbf6EOoXjPpoGQR5Vor9C5OKQVhc4FKTN4actyI9B65V9LGDSUbPlkHhxlOnf/lNIBwnanSplTYKPiZOv7BH+XiII+P83gCbh5aXtjZL0eB1EBQOWuTX+LQLr+3rVTvnAVsU9kxCmZY/53nLHcukui6QWPFYQezY5MbJTu8W7+tZYqtwYa6Qks/3L3OuihFVKlYQs+O6fog9NkzTCnqBRZ1EMXlajmCQ/jZocY/cHYwqRfZ5qs9R4nSrHsTiLudus3IYimXiE2E7dwoVlokURijKyw4yqJto9iP0x+j3BmI65pVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2kAWpNYgHmKcFeGhvRti5KnJsSkjfpdTI7lVsyBHQk=;
 b=AcSuBAUqx075HmBGfsjQEW2wmvubKP6lSyqEGualZa4nWxXEhFmE739sWzufb5VKrYEKHCTBQrdwuypiEyVz8z+5PpOB53zK1mlXkMWL+mlZrVkw55bpeqANRRfz0QZ8zY5fA0xZCF9F/Gq8K8wEWq2+hMDgf3HktSPKGjU0w8eHuuT8b3AuRD8T63xMW4BveaV/jl4VW8l4G0BS4w/wYrGvEkgEHBZJfubqVqgRFXwszZWxWLFByY0zYHaGvBPuCtFkLOLu9qT9ERoxzvyJvyDSOGUzDuixY8pis4ZuDork0b/R0OTBfoIM7t/TqJJTTmoPoAytdGP+0tbIPC7C3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2kAWpNYgHmKcFeGhvRti5KnJsSkjfpdTI7lVsyBHQk=;
 b=exSNNSEhXJg2DHjQOk7luAWDW82Oeqs/c0DhzmIO8ejxObKOimOtOyL4vNttBM1FXbj4TWlQbRbUW1iDG4X45JG9rGIDWwmUsHcaVhfLMECnFFHxJDxcvg1afv7bkSLY4EKC+0PZdtdvoKuOmUScon+KNuJCNUVk1B90cJL8Mlc=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DS0PR10MB7247.namprd10.prod.outlook.com (2603:10b6:8:fb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 10:08:53 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::e38:5b81:b87f:c1eb]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::e38:5b81:b87f:c1eb%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 10:08:53 +0000
Message-ID: <4bec2735-d501-5359-2ac1-ed0d1fca1cd1@oracle.com>
Date: Tue, 11 Jul 2023 11:08:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: i915 build issue
To: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com
References: <ad2601c0-84bb-c574-3702-a83ff8faf98c@oracle.com>
 <878rbmixbn.fsf@intel.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <878rbmixbn.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0147.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::8) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DS0PR10MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b8a1152-4b9c-4db2-0a70-08db81f6d497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pQqtVgTnXbrjU/g1spJfFyj5SiKMJUxOgHfprvveFAwmzUaShTeedjfPabAAcgyeOI/wu+20/2jdUFyTxESvxL1ZYUKhT7xxaRPVRXO4sUeZ8y/7KcwtJ7VaiQgxSxn0jxyyMe9xwGoP8vtA3MpcHsWgDfHio4lrNAEaLCawvCyw21vMRWLWtv2WYMlxr5JvrLJD6JC+LoEs+brioO0E9etZ0B9BozTfO+jhbBWqUV8oehJtCgIbN2rzPAxCdZt/1l1v79FRj1Y6csJVXPw2vJTKN6YNs/kLNULl2ql87SL47kXKOu+Uo2+OruUziZKACAjOQ8CeTUzv6G62KEriKI++3tofwZ4U+kbzUGbjLnGTWternVMVFFPGm1oMwJDZZrmsXAofS+CiJ7m05kBbObB3+Fw7tXLB/YpvCOW3b39CrYifbilgsVpJenuPKH+NW9mL6PBny9oCZsznkaj0CwV6NzBq1EWAtCO5duToWber7OvVmMtIx95ieUqKW9cwD/V2Ao/V+wXX2kMzugdV67uw8r9FX6V5SbA6tdmw/2LQ7s4ODhOkUXW4ZHxKlpkXrBP3PmVB45SZuuO8ABW4kjTKDQ4tBzAMgJ80aqGWLIbVFpkXOsqMUPkmV/SvUN+ku5YFdg8TZ2C7vEHHojePnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199021)(31686004)(83380400001)(41300700001)(2616005)(2906002)(186003)(7116003)(36756003)(38100700002)(5660300002)(26005)(8936002)(558084003)(53546011)(6506007)(66476007)(66556008)(8676002)(316002)(86362001)(66946007)(31696002)(478600001)(6512007)(6666004)(6486002)(36916002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWhiL1lIMnJ2aTA5WmwycnZSODZ3eGlBdm1SOWQ0WFdMdW5FYitOaVgwMW9Z?=
 =?utf-8?B?Y3hQRklldFY1R3R5QjFqeHFoa1ZLZDdwZHRvbVR5RmtoSm9PRmxXNlRLZlZU?=
 =?utf-8?B?YjVPTE9iUFZCMXFTK01vL2NQRUFRcTdhdytLM0JzMGF4VlNaU05Ba2R5Ym5C?=
 =?utf-8?B?bnEwMnRaRDBUZFY4MnlPUXFxODFaKzFCWmVuaWVSRjhDK09Vc0ZJZ3FzdEp2?=
 =?utf-8?B?V2xobGdid21kMzFkckczSG5UOVJHWTBsSHIvQi9ESHlhNXFIVC9zVThpeXl5?=
 =?utf-8?B?NUx4WXhSNnY5WExWN1pJektyZHhVSFQySDFhN3k2TG9wZVJ1S0NwbjE2VnpC?=
 =?utf-8?B?dFEzQlFRY1paZEZPSnVXS3I0WmhzeEgvZS9mSFBvOEJuQWpKaDNYZU9JM2pL?=
 =?utf-8?B?TGhVZDZIdENzZGRaUlFLZG0yQjNJdk9zYm1PWGorSlN1eDl5RC9rVWEzOGMr?=
 =?utf-8?B?Zmh1YmZaN0RsRisrUzA1K1BKSmoxUElHazRKRzZJM293WjkrU1ZvVzIyY2lh?=
 =?utf-8?B?dFIxczlRMTBEczBQbjZpVERMVzc4Sk9GYndDaGdkRzBIT1lqelI2UjA2OFpl?=
 =?utf-8?B?RjZyTmdFUHNrYUtZL29EemtMcnVzV05XYzdBcWdZREZndlJiMWFRNU9DczZh?=
 =?utf-8?B?UVYwRVA4eC9lVFliU2F5a0FCTW9mSEdLMmZuRElibmtpazdwRjJPcWQ5K0NP?=
 =?utf-8?B?c0FYRWVxbDNWeG1UaWpsU2xrZTB2VndTM3dicmdMWHRBTzRnVEtlQTRQbW16?=
 =?utf-8?B?aWV0K3YxenBRV0p1b2d6RHV3M3BGcmJmbXQxanA4eDN6ZUpYUDkwUVdtWi96?=
 =?utf-8?B?cVJkTEZUYTMybitKUEhyWnpPa3lNREZkS1lUMTV4WUFYYW1wSFo3d2FSZ25v?=
 =?utf-8?B?SVNrMEUvRStDTCt1bkk4SWhvMmorNzRoNWp5d2dJL2xkblFTQy8zMElyOURJ?=
 =?utf-8?B?V3ZiaXEyRTBldW9NNlUvQ1FkeFFJdWtrdWdYMnZ5SVY0cEcrVzg4c3dlemll?=
 =?utf-8?B?YmxjNmIxMVpYd1FOUXI2WUhMVjR5VHBIUHFhRHp3OXZZNnBvamF5Q2tkRkVo?=
 =?utf-8?B?SGhnZWIrTU5zcXJJTEkyeFVUTnVZaTdydmxrd1BjSGRXUEwxZDZybTZQLzFs?=
 =?utf-8?B?ZFdFZkdLa3oyU0htUUkrZm5nTmZYSkRjekUwS3JRRTlsa0hwUXE2R0loNG9Q?=
 =?utf-8?B?LzZlei93Zm9IZnBHRmY2UTM0d2hsSjhiR3BwNTRCWEZFTmtzZGdGQUc1eFgv?=
 =?utf-8?B?eUV5V0k2QU9ReVB6QjZqU1FjamY1WElCOFVxWjVZdDhjMDRKTXN4dVhnQWg5?=
 =?utf-8?B?YXhoU2hXRjRaT2R0UkdReXFnSTZHNnNaRXRQSFU1RFNjSlF6RUUzWG5ZMXR4?=
 =?utf-8?B?QmFZelRmeXEyWnhhS1FKQU5RWktxTDU0RVVxaFNBOW55bXhpcG51dUZVKzdG?=
 =?utf-8?B?QnBrT0hkbVhWZUtuQzJVZDBwa21aRFU5b1FoUzBxcmtPNi8rTUVQdHNqV3B2?=
 =?utf-8?B?bmtqVXRrSHB0cUVuMUs5emFRQngwdmJzRFRhejhvdGtvcGtOTXhLTW10RUFh?=
 =?utf-8?B?KzRxMlpJUGlOWGRLUmhXejh5RGlybHV3cVMzdEV3cS9VZTRQWHNlbUUrV2pp?=
 =?utf-8?B?UkZFK2ZoMk80RS9RTldxUmpyUEEwVlFqOG1MVHNlL2J6d05hOHpTcW14Z3Vj?=
 =?utf-8?B?bjlTbkxyVW1CM0VOOEFUNUF1NUJZWm9yY2FTWFp2ZVZOVVlvSVBCN1paNS9U?=
 =?utf-8?B?Z0tEQUUxMHI1SkdvS1pTd1NCRWxJaE5BcEwwM0syNUVQOHovSWl0NHViQTND?=
 =?utf-8?B?eDczUVlPVk1MZWFGaFF1NzlibzNmL1BweEtZVkpYZTRvdU1aamhTUjFFSVJN?=
 =?utf-8?B?azEvdCsrdndwcWNBQXh4VmhONlZ6N0pIWkxtRFRjK0ZXNzhqbmc4alhvNFB1?=
 =?utf-8?B?Tkt1Wm4yRmo1MEhJb1g2bkt5UWhmVmlYa01nekxmWGpydUlDdkVKRWdteldU?=
 =?utf-8?B?Q01lRnpoY3pwcUVSVCtyY0FGWFpIamYrbjFyTWwrL054ckROWEJERENVRTJV?=
 =?utf-8?B?ZmxJeXpPNEtwQ1hjVGZjMUwyeitrZ2ZmU1FhTW5IcTFlUENBbE9BazVMYjBG?=
 =?utf-8?Q?Bo6mlQoxB9d5VOwI1/eUw6LzJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 1E9OQsNFx0gVgHMLcVXv28CdykqZ8igeds+zfKC9FywSRKzkqIgk1+AxaajC+v7hIkS1J5k+V+GXqHgAhGFbNOrDci4SQD8qHzACdXlxUY/XZcZ+N1bpGJrX6FGAwyDETN/eLAr5HbBy0GhI7+Zm+e5hBUAn6hebb+VkXE2Q0JHBYKPT3TgvzICocnwvmCLxzfWsaq0WfOAgVZy00g+eie4vbFWQL1MUG1u2sHJX/F7aVfGdTVZHfHnl7jot6cpG/Q+nBVMz3VXtnRR9CQbewG1OlP0GmqzIprym9knyv71J+EpdSQjPYzNrK44ji9ZJryCKvR+leywU5Lj518CUFC4mqjJHjqCQQC1si2gOPB9+YfLV+cBM0uROHKL6lSsPwVWqEkbB1HF5d1SPIjE8TY5SOfOJmc9AEQbsUYxyHPybCP/gBultQC/3+ki2IaYvpD16/suaoD8cgRaVibu2pwKkBwP1cBQrhBAiD8zwfDB8KLRD5uHOs+Tdc+FTWnQ72OCCkbz6r8GPqQUudcSHIKUrKr4CPVKAduWHsOf9C2MlVeWpCA1DtkioJqphpk92FuMWCzD7ukocGebGdEmL9vS2V9iW6yjEeR0qUNSkyqKQ/HJwjf35Qiph5F2XDbLHrkwddJr99/LYwEOG2tttB1tgOi5fQPzr6aSpa5s4WKe/45QM4L/VA7CE+7KSZ7l5Q7+CzF13UmIzUdUO14oVkOs9lFAn/acvkW9B5pe7o/HdNjfW8VkZPgUb4Llt17O7ADGnnPTQQIJGxmV5EMdBAS0nAvULonVmtcCscEVFH4VYUMs7cl2p0u+1Cu67RYoUSIG7MRt/kxdgj+62LEBSwS817RwqA2BrmVBIxGMeHq4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8a1152-4b9c-4db2-0a70-08db81f6d497
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 10:08:53.4307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOaOqtZvp+KQ998groA0YI/tEqL3LWCwDxfTK3ocZLSUoMAgz2rvJ9aT8aP8dUU6npjg7Or9C/m/xo8n6tzpoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7247
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_04,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307110090
X-Proofpoint-GUID: l3p5ktr4J_twu_gfD7HpVQv3_e_004NK
X-Proofpoint-ORIG-GUID: l3p5ktr4J_twu_gfD7HpVQv3_e_004NK
X-Mailman-Approved-At: Tue, 11 Jul 2023 10:42:46 +0000
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

On 11/07/2023 10:58, Jani Nikula wrote:
>> I didn't notice anything on dri-devel mailing list about this.
> I presume you're using CONFIG_WERROR=y or W=e.

I'm just using whatever vanilla x86_64_defconfig gives.

> 
> See [1] and [2]. I'm undecided how we should treat this.

Ok.

Thanks,
John

