Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A774EBDB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 12:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AFD10E366;
	Tue, 11 Jul 2023 10:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7B610E088;
 Tue, 11 Jul 2023 08:35:27 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36B72G9o008639; Tue, 11 Jul 2023 08:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : content-type : content-transfer-encoding :
 mime-version; s=corp-2023-03-30;
 bh=9ktcBJLVVo4s9WCfdCsSti9iI2DO091xnJzZZngD/ro=;
 b=2uhP+FP1GHFXZXDn7QHEyX9CTaEm511P9yjpBS97d5fhZyrbcCHo8w09jOjjqWTYJSe0
 dhbEQMpQzO2D+Lc59qxJAQK6oCiK/cX3WjrjVXbOsBYkWtGAj2qoEm08rDdOWwadgyNc
 DYUvVEKUr0+XuhKl+nnFIjy4rIO0/gYFmdY9zpv2YtqI4GrdqU5vl0ZA50p6gj05JLQu
 8xbRfBmtkQdmgezVXix8G16jug1bzTFtn7CrFeCPypDZbUrpcPlsV15zTvHOncHhmDfO
 IT7KkWjitOwvoYJlUxKuBanJJBrfxWzYMZRtUOPXQf7YYT/NwxqwKRKtrGoqbP/L0Rhk bg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rrgn7t3vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jul 2023 08:35:25 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 36B8YdDO006872; Tue, 11 Jul 2023 08:35:24 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3rpx84j2m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jul 2023 08:35:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qjud90/KMCajBpyc5WGG3NIvjeU5LQyKfJFxTMGVMNZGYzir7MX+QXBqXO/zsdTOnbrbwFYFKFf6pLcQMkKoNg0Y902OdIxijyeYOFenxKr0HbhOaDxojrW3h2GCermrDOlpDR3F6rierHGJcOFOciZrMS2r5mm5Bg2UirPYLFkxsDCNJfhABZplI7R5zeE3fOSRfOcn6HcGcvvpKL0AleWYADtRFGeN4Lyfcyma67UAPl6X2s+pSSkOHGpTfqaI7OmZT+zxhxj59NTInYrnWxWEJWneklLE9v7RvSjLgR/z0KpNFofyNI8/jiytokHTz62rxVXv6iU1u/9RTlpxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ktcBJLVVo4s9WCfdCsSti9iI2DO091xnJzZZngD/ro=;
 b=d+GZ/HE+/RT3hkM6LcrkocscBstXgFhRm12Ea+PaGOCuOXL89EUa+RJnzwGFuFsdGfwsUt4/mVgJI2baVOosLq8OiaKYNDjuchx875TNmhBZ4+gtVpv0C+c62U4pdumxtdVp2jJ5x35JXtm4cHEKzZiaROVjSoVyrSOwt3vfrDOsT23oSOi0hn5VAPEs0rZSJ9MuPwpSkLrmEp9m7TPjklo6OMlnBY8FPcpfCkRp0eaaXDNR27/OhyrSKmXQhxq8UjyIy+JqdlNk9VYffO2B/oCUgDNIckmvir1abP1eHMvKnx47ekvimgu5ZQKJ9wgSEOcsVdiXLE4/6rJ9VtLLnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ktcBJLVVo4s9WCfdCsSti9iI2DO091xnJzZZngD/ro=;
 b=FEpOzxM6zlNXkz9IQZwtY4iFLb9eXmWy34cpo45LuW9l6R9J9MIKAxc47HfgrQYd8u4jAZL4jo9sHJQ6BKnsb8EY3kWu1WVynSM/5mcHpqAY8AtlVsstWJgkez5cDT0CDLGEGag6tkw5LLlX31i8lNWrqdbgjtRU6PtuAf8zF5k=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by SJ0PR10MB4717.namprd10.prod.outlook.com (2603:10b6:a03:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 08:35:22 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::e38:5b81:b87f:c1eb]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::e38:5b81:b87f:c1eb%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 08:35:21 +0000
Message-ID: <ad2601c0-84bb-c574-3702-a83ff8faf98c@oracle.com>
Date: Tue, 11 Jul 2023 09:35:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Subject: i915 build issue
Organization: Oracle Corporation
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::21) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|SJ0PR10MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f845a82-1167-49e0-2311-08db81e9c3e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LQ2O5EDiToIn+HIENF4voUXst9BSFupayaFAIpPJEgVzR3g/JRWZZIj3SeDFuDFgYu6SjBRKPB35dmQ8OCEatZyOuqMPKa2RiVkGLzmkkZoRzDfc3vmKHS3T4d22M5AtxVSHRfKi/qgxwDgoaD1n2zBN181X3XqJggd1csxt/5JSO140eWdh2UxeKtlXpXGLJdJ2Ml1KOeXGGs2znVMTjZdLgRfTmTbN/bUvWQLToVGcegHcEhvbTbBiboPT64InfDKCad9Qw9I0FCdCbGbHPCvB+qdm6MOuaXpsZKntIGaiCcF1JsRz0LYpT5xgqrx70T8kkxByQErg8wWT5uF8ljgalT4yeVUqR+wiJNrBMcP7G/jMYjpwWMJviku2DIYzsURyMbHG4rb6U+RdyI7PbG6GUXDP/lC8oHKRf7z/6OpRwyTf6xoqN3Wv1/jXC+d5xiJqrXjQ4LNwceNE3sJnTa72HPTgIRNu86urNyGG1zXj6Xqf6+Z/Zpv+dlzqu3kBAiI1+up0XRVgRUWMliAO05cTgg2lXLM6Lbp/1ld3/7iiSQm8F+QlRjj8u2Z5sXbl7KAAD18ruQIba1h9ke6zkzCIhYmWHKUWq9PCGRiYQwFKTkpj3HeaRnazdXogUFTq0kaGy/0856/R6T91EZfm4QzVamzv6fqYlzodNEuGDzI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199021)(31686004)(83380400001)(2616005)(41300700001)(2906002)(186003)(7116003)(36756003)(5660300002)(38100700002)(26005)(8676002)(8936002)(6506007)(66476007)(66556008)(316002)(86362001)(66946007)(31696002)(478600001)(6512007)(6666004)(36916002)(6486002)(2004002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3pWMzRSL1FSbEw2UjV2SjJYRVZBak9id2ZIRkYvTG42cUkzQVJ6MGY2SnBG?=
 =?utf-8?B?OE9OR0cxdnNjMy9vdm1VNnE4SWk0dUg4cW5EM1ByL3ZzdFFpcjZsWjF5TlUz?=
 =?utf-8?B?VDVTYXI4S1BEcTJjOXZ3QloydVhDOTFEcTliVW1hTy9VNkNsWFZVK1dJUnQr?=
 =?utf-8?B?bDFQVlN5cWJXMDJwRjZ3eEN5YUVYMlMyN0lZZ1lyWVN4V3lGb1l5Q3kyUEhx?=
 =?utf-8?B?Sm92Ty92V280b0RTbVo5a21IcGhDV0FyNURrb1lVajk0NGR4aVhra2J3U2FJ?=
 =?utf-8?B?cStTWXFRQ0NnVERqeVRmdEpFWXZidVNqTzhmbSt0R1NwcUpvWTl1VEZ1RlZr?=
 =?utf-8?B?MzFsRStrQXZNWVZLTzk5S3NqQU1DMWdaUS9rWkdNcmluOTF2Sllxak1MbXlu?=
 =?utf-8?B?WFJiQ1pjbUxZdWQ2YlhtUlZMU3BYbnAxNDJjQ0lXRmdBV1crNVJ0Uk40MHpv?=
 =?utf-8?B?WElmTHdYWW93U0N4YmRqalFMekpadHRBSW9QV3Y4QmRSVXVKMlM3VVdXWGll?=
 =?utf-8?B?TUNqTXpGbys0Rk9BVCtCeGxGM0hZV1hYQVVIQ0dFSEJQUkRxOUx3V3pLUjRo?=
 =?utf-8?B?L2RxYXlVYTB0S3ZLSFk1clZUZitLZmFQcFNtS2l3WFB1SnNrMlcwZEw4UWZ0?=
 =?utf-8?B?VnFZYkZwVTEvWkVyZWJweHMrZ295c0Izam1Cc0N3OElaUEVxWldiU0l2ZTly?=
 =?utf-8?B?WGk5TnBwSTNnN0hKSkt3cXJNOWZVZlhVRGJmNUNtbW82V2pXa3F6R2EwUUVQ?=
 =?utf-8?B?ZnhuOUJ3aEIreHoxd0FHdVY5MW5jUkxjeC9XYUJTR2ZFdTBpTnBwM3FsZExF?=
 =?utf-8?B?S2Q5bGg5cExqeU1Jdnh2QUhESlY4ckhoYWRGZ2oycnhPWHJ5ekg4RlZVQkdq?=
 =?utf-8?B?NnN3MVhXQUNNdVVuV2xJK2x4S1RqSGFjZW9mbGRMMzFRYWw4WUNZZHhBbFlo?=
 =?utf-8?B?QkJzVkowZm13dXd2L3R6dkkwWXZ6Y0ZabDJ6UE4vOUZuKzZYUVRuRUlWMjFu?=
 =?utf-8?B?MFNCQ0VWN0Mrejh0cTdyYTdtc2diZnU5WnFUK3NKYVpkWDdpRWl5V09UWXh6?=
 =?utf-8?B?dThlYmsrZndneEVLa3FnZUhUYmp1b2dCVHlKRWRzeitSbzZWN2Zkd21TZ3Bk?=
 =?utf-8?B?Wm16Yk5tb3RjcnY3V1BEMDBGQmRqamg5MWlDVG1JaW9GamlHdm1kWjV0cmFy?=
 =?utf-8?B?OVFXU2U2N04vc2RWaVowZnRic2RxQlc2bFZLWHlwdGt1Rmw2UUF1b01mZWN4?=
 =?utf-8?B?UnVLMXl6bXRkalJQc2syUW9OSHMrVk16WUhlcHQ5Y2c4WXNyVDcvaGVPaWFZ?=
 =?utf-8?B?aHc3UXNqenRoM0Zhc0FaNUoxL09Jb1FsRWErUWJxWEhkKzlyTHRwaGFBV2pY?=
 =?utf-8?B?K1RNNUJnVlc1QVJkQlNycjNQaUFpeDZpc3JERFRFekdaY2Q5NU1lS1BBTDNX?=
 =?utf-8?B?cVRlR1F0NXVsVEJ6Q0J4WVRPT1M1a016VVRENllVaWQ3Z2o2Q3JqK0Ewb1c0?=
 =?utf-8?B?ZFE5OXpNREJpUFBWdmNaUEp0REl6NTErR2w1QmUrTGNnd0dPWlowdGxvVVZ4?=
 =?utf-8?B?WEIxb3VRNnptQkdreTc5WkhPWTF0SUxlNVMreU5MSWdXbW1RSEF1c1E3TjhJ?=
 =?utf-8?B?WjlzcVc1WlVLL2JvUEFRdzZaSGdQSmpZVnJmbGl1OC9iYW9meE1NYXN5SEwy?=
 =?utf-8?B?L3o2bW4yOXNReDlUaERHNUV4dktrSWFLUFgvMDFnTndGV3JFOWNYUm56Mmkw?=
 =?utf-8?B?TnFYUlA3S3NxNDhTVlR3WG83M2Ewa0VSNU9lMlpNTU4ydjBiaE5jWHNlbGpM?=
 =?utf-8?B?NzZpRndGSis0S0JnbTQ0OTBOMCt4b2pXeFZIMmJrL2RXeVdpVWpveW1hSUFw?=
 =?utf-8?B?RkdQN3kwSFNhV2dPWmFhQTdSK2lYKzg2TDNUUThwclpWSFRDUWo1YnVrRzFT?=
 =?utf-8?B?YmZGVU5wc2N0OGlMRHBROGxQM2dnNkxCMVFuekFJTk50TG9jRnk2QU81NWRB?=
 =?utf-8?B?eUZVZUdSZXhjTmpoNGNYZWhRZWVEMVhUdFJveStkWlZaZ0ViRDJvVlZnN1dl?=
 =?utf-8?B?OG5YU1RTcmtGK1B5S2hzaC9NQmg3TnBCOVkybWp0aFJLZHNxRG9qZ0lkTndt?=
 =?utf-8?Q?xu1v/7V31Avhuyqr9RQc3yvuo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Q2lL3mwiS1W1B5xz4E2TciV9gUJO6//vFhX+rCRPAsjE9DFsMIk3GajHQbKdDaVufMXj0ClObMcWeZ4w9KighMN7PljPevFHwT58nGIeOodV4n5gIHiHIwf6U26bx3ftSRkb6dDtkOj/Ov0ikm3U41xLfSiHBoMgPePMmAV1AHzj10lNG/slG3E8gJrmblhhhnv0hOvtHBZ5Mdkk4NlddNCiVv4vD5HJtEY6w3IlT27IF1/gNxW9Q2dEybxldxMR1/ybnN6ABr/FUzCCq8wJzBEqVKCgmFXggGkTHYa0PRBZn9tQx61+Bnd8HdAE0pjCvukeF8uKtKmnIOMdJdGLAvdncoQcTslNygD1sCDsN+kTmEnTY0Ahzb0FWPmAYEIJ3gyo4MXjcKP6VEzgxNDHng7mQ+OQ2TQCf6zSOhINatVZypAhzmWAVeUxfSoeWcHpassM0eHPtNTSJp5mAs7KFDuVqczFfTVse1iemjRZrilIzbEbUWq6g+CD0DlrhfmK8lLYUd8RxZrsaltdqoXJKdMzAczgih4Knsufr+J8yRP7EQl6nQ/NuElr4ff6zWptlTpPJ74Eec6dbst3sCl6SjObX/H0Dle3GQd9oMmdhmlciOjDywzPz/DGNOO46DpYJTg6KcTSXJPU5Q4eEEd4eqebHSUmZj5Cce1bEMsOKl5UW/QNjDqAWdBP+6JoHy4OaLH+LbUI5PNWi8wqe+XeAnxRpA2Ki2s+Slr9ZVAvbt5yxryo3yWW+PHMIrPm/x7q0tsG6eNx0+WjoQreEIWFuhZ0GIrGSbMSS6oRu695VeRZzmGhI5iMNDXAlU1g4DNSZZ69TNc8K5LE1UfFi6o5k+BsnbJxxipQfuMuB7T4+BI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f845a82-1167-49e0-2311-08db81e9c3e7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 08:35:21.9073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vcJQ3nJBmSW2fmZ1irQngv5/M+HL0VsatKlnL9YPyhyiRSA36hYQrsK+EU2GZ73Rm39eMcVzCPojfvi1/gk/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4717
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_04,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307110076
X-Proofpoint-ORIG-GUID: 0WvPeGHHE839NJaQ4PA8078jzPOskiX4
X-Proofpoint-GUID: 0WvPeGHHE839NJaQ4PA8078jzPOskiX4
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

Hi guys,

Did anyone else notice this build issue on v6.5-rc1:

drivers/gpu/drm/i915/i915_pci.c:143:15: error: expected expression
before ‘,’ token
   GEN3_FEATURES,
                ^
drivers/gpu/drm/i915/i915_pci.c:151:15: error: expected expression
before ‘,’ token
   GEN3_FEATURES,
                ^
drivers/gpu/drm/i915/i915_pci.c:159:15: error: expected expression
before ‘,’ token
   GEN3_FEATURES,
                ^
drivers/gpu/drm/i915/i915_pci.c:166:15: error: expected expression
before ‘,’ token
   GEN3_FEATURES,
                ^
drivers/gpu/drm/i915/i915_pci.c:174:15: error: expected expression
before ‘,’ token
   GEN3_FEATURES,
                ^
drivers/gpu/drm/i915/i915_pci.c:180:15: error: expected expression
before ‘,’ token
   GEN3_FEATURES,
                ^
drivers/gpu/drm/i915/i915_pci.c:186:15: error: expected expression
before ‘,’ token
   GEN3_FEATURES,
                ^
drivers/gpu/drm/i915/i915_pci.c:209:15: error: initialized field
overwritten [-Werror=override-init]
   .has_snoop = false,
                ^~~~~
...

I'm using following gcc:

john@localhost:~/mnt_sda4/john/linux> gcc --version
gcc (SUSE Linux) 7.5.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

I didn't notice anything on dri-devel mailing list about this.

Cheers,
John
