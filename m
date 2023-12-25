Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E8B81DF2F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Dec 2023 09:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C72710E0EA;
	Mon, 25 Dec 2023 08:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E0710E055;
 Mon, 25 Dec 2023 08:30:25 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3BP4nRt4013682; Mon, 25 Dec 2023 08:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=QqD5ebM2DBt43hU41c3s2D9y5jV4G3Msw6ol+T2D7R8=;
 b=oFMFHlZnSIo5OjBEaBjsBDybw3tA0WVX+WoQA9Kk+DNDPIhZ2Lfa5nnWN8X4d8eVxB9T
 rnnN2sL8HmZWSabDNi019lfHFTEtgbwShGAwAXE0s8pGiQpDjMBoOz/Lyq5wqoYrHIyW
 DDjATrG78mtUJQR/p+5GASXXiNT9CFwYTU3zirf9gGeakVpqhNOGphnuCmyF0GpY3ZvP
 m3nUek/5JVRLmyb040k5NYitXQ5IR7c0w4BrNZNiabrrSEhVCPVVXUjlNiyoKLEdhldk
 9a3w5UQnQ0qsSPvryp02OQ3hEw0nWwZR+5pmhs66vwLVftlia5mgE5ulS60RxtkBW6j/ Fw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3v5r3v24aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Dec 2023 08:30:13 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 3BP7GCRC033071; Mon, 25 Dec 2023 08:30:11 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3v6a8yf4jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Dec 2023 08:30:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4Tngh0gygBpPIDN2yQCoCOoYm9yUGumwsjNBF4CaWwnVbNEuUSSfT/4pBfrmx2MNXG268QQmezHlz8ST7CZtOTXitLT8GP4a/3GGJ4BiQi9Pc1L10te5L70CmLWIV9rTQZupuo7/gCZF6LVlz4yjYSpAVS92p6lXYMiAn4UZaskAjHSMrVDe0M5fZ1iPf5j+FCTHwT3rfEOqCLB5Dvd/srSSkkQpzmrbM8pfLgXFK0x29OR9llf/j3TMQHgSTCa7HsytkH4ZbJJdd4OrZhUA4lTRBVgBld4yddxMpXOA10g3GzVdg4dd3OdYmMdTOzY+jNnqOlv3Z3gKv3ZN8j2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqD5ebM2DBt43hU41c3s2D9y5jV4G3Msw6ol+T2D7R8=;
 b=n0mSy8afhcXHZIyID1pqJStp8S2bQzs7aNvAZ8xj6VeIe4xMePvXMl3ARYlCrZvG2fkTQ/lDP39stnwE2G8WeuAZpvvjzZtwcHehoG4PeHR409ayBJFTZus8Tvwg3tFOTI0keX4ffWNUP1yPizPLi7zFhIEkuIcKcpZsLhyL8WFWO7PU6Wg2nc9n18bJxNTZciDOAVLMaf7d3oLZIK7TRYIWs/oEFwoCt6wCRXdxNszvkrNlABx3iLjgCYSjDx4nNdjBdma5hlFeEqRHTDxQjsej1Ifeh2rm8gRjQjSW+T7l0I16uqAwe52j0Cl6L2NSDfzMR09r9h3eaeUCWxBPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqD5ebM2DBt43hU41c3s2D9y5jV4G3Msw6ol+T2D7R8=;
 b=st8bde3jsBXymiK+aMLL6ReKpnlH4mHeK3qhEtGVj+ePfMO9n95UPPMMitgf9/WyCQBqOwT94t2e4beu1uTnprcI0lBHXjRo521cjQyTHugkGMgcfVY80PrybYyTbq7RjrfU/SmCTUJ00cK533N4NtV+3tsSrlW3EP/Ka/S8CnE=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by SJ2PR10MB7617.namprd10.prod.outlook.com (2603:10b6:a03:545::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Mon, 25 Dec
 2023 08:30:09 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4%4]) with mapi id 15.20.7113.026; Mon, 25 Dec 2023
 08:30:09 +0000
Message-ID: <0f04dd81-1b0f-4408-b4de-63a01895b0a5@oracle.com>
Date: Mon, 25 Dec 2023 09:30:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/nouveau: uapi: fix kerneldoc warnings
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>
References: <20231225065145.3060754-1-vegard.nossum@oracle.com>
 <009fcdc4-b10a-4ab9-b368-7cea75bb74e2@infradead.org>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <009fcdc4-b10a-4ab9-b368-7cea75bb74e2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAZP264CA0197.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:237::18) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|SJ2PR10MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 55abed11-5e9e-4fe1-df01-08dc0523b45b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NLDJJuqmrRfgySD4SFxZ7rXnoNXSxsDeYlniJgNgM6Z3NTvjnuNDePLaoqKFw49d5Avi4Q2vbxj7EIra8klvFS2mI34OYIKNxseuIX/WvSiwZmw1aCXCDwt2898M2wExP2FRDN3f7Jd/cUuD/nC6yg8Q8BDEhs9L//q44CBJznSb9riqwtE06FZZoKJeQimNb+vGcbtmBaUM8CQ3jZQGg8rrWkOdNKBB2clLZBGPW71nFTsssjSsq+MBsh5cx+AlH+PTbEGwsW9AAx61fIoBUpWLy8TS4rD0sx6qIMwWnrbeYql6vLq3ptk9GXqN42AOIhO1mw9TkCT+BnQ56Hpry12ome7KSRvIEWEUR8jBL5uViAGQZm0x94znn65MAX+chZnsJ9QY6yDrcJEbve/4T2JJYG7HP6vI1yNCWq1sE5D1BOcenZy/5b8kRhP3g4E2P+f/3LbkGxULp71iK0PNU9eW/KuV5AnC3C/7X89FGB97V5fznlvA7L/jPV6a9KF80hSuK/6V1mAUneDrsGki1tzg52D++Z5+3MLBg+PRKwe5Put0PLhhgbkFHBd0Zn7qxHKnYl9hwUair/0s0bb/RK713QbyPvaZctL78GLgtK4JhfISVQxd0P44VcA64Cw+3nzIOwq6DKXK/V4l8Mef6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(53546011)(31696002)(86362001)(6506007)(478600001)(26005)(6666004)(6512007)(2616005)(2906002)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(4326008)(54906003)(110136005)(44832011)(6486002)(5660300002)(41300700001)(38100700002)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1loRE9FSDk3aUNpWUdYY3hSYnBOTXU0YVR1K3AraVV3c3JvYlU2STUrZHJ0?=
 =?utf-8?B?NjlJYzZqMEtVSmdSazVhZng0STVnTEJ0aTg5Q05PRzhETVkyTFJldjMyVytp?=
 =?utf-8?B?VEk1UU5SNDFDS1R5RWFVdDhsY0txaTRjSis5UTNCSkcxeUl0YUIvQUVKdktv?=
 =?utf-8?B?SXhkM0Q3bm1Rcnc3M20zNEs5cndKbEFMNytlRHBLeGNKZ1hOd2tybGMvR0o3?=
 =?utf-8?B?TEN3NFVtWjRqZjNzN0EwSGJPSDh3d2d0aTFFUFlPRTVJeURsZ0tqQ3M1OEh2?=
 =?utf-8?B?Z0VvOGlDa3hBc1k5c2pCa2ZTK05XK3FjQ0xyTlpJMm9wN1NpMVpvMnZUQkVL?=
 =?utf-8?B?R2pIaE4rNWFrbTExT3dMM0k2YVJQK0xwR0kyc21rVmoyVVJsaTkxSXN2b3lr?=
 =?utf-8?B?clpvZE56VXpPbFV5dzJ2VEZqamtFWDdhUy9qdGE5OW9yTmNkL3ZSNFdNREpj?=
 =?utf-8?B?RWJpWUYvak9ncjB4aXBISHZaSnl0cVNxL2dtYW9qL2R1YVArZlpFZDNsOHJQ?=
 =?utf-8?B?YnhaODRXWE9HN1JqalRNN1hIZlp0SXNzeXdWQ2hRVmZuajM4djJ1Wm1JWW9I?=
 =?utf-8?B?ckZUYytxMWVOZHlaYXFDbWVURnVSWjZha21mN3R4K09ZeFQwUEh6cENseVAr?=
 =?utf-8?B?cng4TEhUUWI2WlJHSkpBbTZBT3VQR1kyOHZMU3hxR1VPSWNrOEtjYzExRHg0?=
 =?utf-8?B?SCswWFR0YTh6bE1NUzlPaWtvTVhySCtDQ0FmY0xyUC9Fa1pJM0ZYOUx3eE1Z?=
 =?utf-8?B?MWg5d2w3Sm1WeVR3WU9zM1ZodDl0eXFYUjR2REExcjVWWEZkdk5TZnByekJE?=
 =?utf-8?B?UkQ1alRQbTF3UFRXcXJPNkpBSU1ISDZrOExMRm4vTWZOQUxaNVlQUmI0R1Mv?=
 =?utf-8?B?bjdXenNmMjQydThDcENaY0V4UDBZYW0wQkJUdktONVBpVUdUeGRBbUVUUXBX?=
 =?utf-8?B?N2lUaE5uM1JWT2RuR0xCbDg1SFp4V1YxajBmeWZCUVhJZmJtUnE5UC91SEc5?=
 =?utf-8?B?MFBFNGpaV3hBaVRWeXc0VDQyRXNJN0tydm5mNFBCdXRCdERLdmgvdmkweHdP?=
 =?utf-8?B?dXJ3QytVME5OcldqV29YczMzeVJlR0doYXVYRVhoenRwMjdWZklPd2crWFdy?=
 =?utf-8?B?WVEyajAzcUZ6dDVTQkQ2My9IajhXQktpd3NuWE9kWDU5Q05HcHpVeXE4U2Rq?=
 =?utf-8?B?OVBUQnlPRGppdVU1RWNlbXVDcXFyTHpkVEJSdXBSOFI2QXk4OURVT1NFdC9L?=
 =?utf-8?B?K2hjaFhYQnVTWUl3S01kU25rSGt5d21ZamwwK2Zuc3dnMjRFYld0ekNWSjNs?=
 =?utf-8?B?c0lqTjVyeFJldXlOTVNpVXd0bjkwOFo0bFk0V2RZOS9iT0c5VWMzaWVrZDQz?=
 =?utf-8?B?VTM4TUIyQlRtaDFTZTU3SDZOd0w3TGNMWkNMT2hqUlVYenpqTVVkUHQwbmM5?=
 =?utf-8?B?ei9Ja2ZlcmNRV2NpM0FkczJTRTJsanpsWGxORW1rYWMra000WEhiRDJYR01Y?=
 =?utf-8?B?N2xZRFd4VU0rNGdBMXFxQzB3cE01eSttR0dNU2VJek1YdVJjdzBCaEtXaVY0?=
 =?utf-8?B?YXJPbHgwV2JYU2tVcHdNcEIvcWhKa2Y3OWxvQjM4ZzN6ck56OUV4amFBRkNQ?=
 =?utf-8?B?YmlVTWo5aEgxRWdBZ256UStoeE5LaUhWRUk1akUvN0I0ODlLdzlUbi9rMEtx?=
 =?utf-8?B?L3ZJQUFKaWlDSzh4ZEtSUzdNcGM4cXhsRnk5UUgxdVpkMFZyekVFRmNVYmhr?=
 =?utf-8?B?ZXBMUUpGRUQzd3ZnaGhRUXluNHFCVTFockZyUityM3gvK041WTlOVnlmTGhv?=
 =?utf-8?B?aVRYWHFoeW4wQUt4QXQ0cWFGdlJ3SDhGN29ucmpaK09sWVpNL1ZuVVNQRFBq?=
 =?utf-8?B?U2NIVTRmMzBCdFNMejl6L2RBcjUwcWpYOVVwSmVlVVhwT2kvL1R3ZC9ULzVh?=
 =?utf-8?B?UXpNZmd0NEc5STZRNjNnS0U4Mm85cXJxK2ZjVzBXV3N5cldxdUkxeTRrT1VN?=
 =?utf-8?B?V0ZablpOKzFGelBCZ1ZUaHoyeFByUDQwUzFmb2Jwc3N0Y3ZQaVNRNWw2U1hj?=
 =?utf-8?B?U3kwcHdmTFlPa3RERFpXWTNFMGlwWE5JeTI5UmZhU2VYbGJJS25RMmlsNjFE?=
 =?utf-8?B?cnlhbzdZUDlpMzZQaXV5K3R4eENUV1RHNHhuWjQ0YWs5cjJvRnRWRjJpNXhO?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IWRPJg10zwAIEseLPV6GTZqfSBg6Hj2wC5qGczHSRK8gdoV2a4ctwgtCYNeQ4MpBk+Cs5i1ZhITj8YnHxSGOuX4GVm/0MuffvwdHI+IC9eAR+lACTor8ceJ++drkpoS677GNExku8wlJLYf8pJ7qdH2I7HJ3uQ0FIeCeI11u158NEWChREMIpCgmumRtuz02pcF6z/jRyjiN7Qme3idwFITNKR82FruPoISJhXenoNnWvOEAroo+Nl1f1VuDKU3SvOTmQxSNc7Aj1rTOcOgaBVL7i71TSy3w9FtY3KktnIe0AA13JMj8G1jMclpH1xKilyw+yq+EnihNSM3fXnaU/ScVh4TAr4fgoqrEjvT8E/oNMutMcWE0UDkYCKTw7qCn7SFoWGXe3Nw3vD1uOdAbBDD9jMDHS+pzKWoMBZf05I34WWZ0yGtpWz99RToB2MhPOfTUkOMplSvjqTf0mzAEMYHXH11YL/7CW8vSMmoqWUKd+jp0ybOzPyWkktO78UNl4SmRCZ+eXuVllJmHA6p7ZtMt1sAAugEPuycp0b0+PCuu7zgogqrKmVzbYux4XTO852uPrxodUP67QjXS3B7RefuAaj2b4nO9PCRVKA5Rnk4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55abed11-5e9e-4fe1-df01-08dc0523b45b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2023 08:30:09.0623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32KqSFDHBwhtpBhc/kJz0fDVu8duj19wilm9qu7own9b2nIi1O7iBIUK6Wu7aa45mcQfQIZNC+CFkbjC042Gs4gRQlTvZ9OgauF3ffPLYyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7617
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-25_04,2023-12-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312250063
X-Proofpoint-GUID: AHh7TFj2HHZliOyKQOVxItUOqeBHaqgr
X-Proofpoint-ORIG-GUID: AHh7TFj2HHZliOyKQOVxItUOqeBHaqgr
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
Cc: nouveau@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/12/2023 08:40, Randy Dunlap wrote:
> I do see one thing that I don't like in the generated html output.
> It's not a problem with this patch.
> The #defines for DRM_NOUVEAU_VM_BIND_OP_MAP etc. have a ';' at the
> end of each line:
> 
> struct drm_nouveau_vm_bind_op {
>      __u32 op;
> #define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0;
> #define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1;
>      __u32 flags;
> #define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8);
>      __u32 handle;
>      __u32 pad;
>      __u64 addr;
>      __u64 bo_offset;
>      __u64 range;
> };

Do we actually ever want preprocessor directives to appear inside
definitions in the output? If not, I think this should work:

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 3cdc7dba37e3..61425fc9645e 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1259,6 +1259,8 @@ sub dump_struct($$) {
                 $clause =~ s/\s+$//;
                 $clause =~ s/\s+/ /;
                 next if (!$clause);
+               # skip preprocessor directives
+               next if $clause =~ m/^#/;
                 $level-- if ($clause =~ m/(\})/ && $level > 1);
                 if (!($clause =~ m/^\s*#/)) {
                         $declaration .= "\t" x $level;


Vegard
