Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D58286CF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 14:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA7310E437;
	Tue,  9 Jan 2024 13:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63BE10E196
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 13:08:32 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 409D4Hnv032103; Tue, 9 Jan 2024 13:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=PFPE2x9nbqDXlnI53Mxq6EY9JD1iYGHtFJScj6J0RnI=;
 b=LRM8dJzRVhFSZ7jNsswLQCfhuT/ZLM3Y3jPzo+jHM+ruInJY46/sHKFOqsjAYrR0mMS7
 QcAulJhYltwO7tG8Dq67ViymO80oF7rQa1cCpkCS9ucNX8g8n0qPthm09gq/oC1ylJFQ
 929MXyodv3T6kXYifnr6n/ejm7ITsYcLq15bLIZ3tRar4veT62m8DQRphiWPorKymO/e
 u5nqG1o3RKwEx1ZN0DIQ2+/Rlv4cSNlQtGBZWGPqi2i2OKu7F8J31y8abVa/xdACyEmC
 EjjnPhnzXL0IwdgB3RLgb+8X12113o07er45DvfVAYhuIdZwyn3pIL1lHlK3jqtkCt/O QQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vh6py80hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Jan 2024 13:08:18 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 409CG9d8035159; Tue, 9 Jan 2024 13:08:17 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3vfuu4e5xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Jan 2024 13:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MB9AccT8qI1mR4YZY896ET7szXIzUQ3Jy0onttW7Ap5JAcg3H4Y+IDkKnHnNBDQ7Ib7ForDq9k0W05k7nMV/u3pb/330n1dsAW0r4c9iKvyCr1SCF8pXFioUVEHuA5DqMxRpI0htpouNLNTURPtEe8A5E/Qk/Rzj1E9fHoBqrPm7NeVG9PHQdolfYEWIYUjkpvJitGateVPuniJTE9GkB5R7BjLVBZCoNbMray+icj+zfzj6PJiuPU5fNqQrH6gc02mUBuxoVJb31LONSCSfmENIXc9TI6DE4PqaTSA7EsuAAGCeJaqUa83WJZDrtnSjwMVg3miPLJ+WztYF0Pj5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFPE2x9nbqDXlnI53Mxq6EY9JD1iYGHtFJScj6J0RnI=;
 b=Zh4go+Dh4gVp56G3iONKNkeuMLdlu53gqbqCNZum6Kz6DfBfTV+V1nJwGLEgFEfGnxZnNMyyt8nZelxLNrC+5VsJX1lN/dobR8iS5WvQSsodMx1iRa3XJevqXIjPk8uh3RCdNByLxMxQNKU9S2ehTZucttLy0xY6eQyG3mtGg509QR6SXw79a4gQVbtvJ6FQy2BCb6AdJcnZ9uZziYM+KBKEyasnq8OntB9xQgXh+RdVStdO2t3wsdpH24tJpbwFjTn/csS06t5DI3jgDH/cubtI7VZ6VxV7NWrqSeeh5kcEyB7oF9vBgCpQnZzNgUsmtOSk0BXF8d70TlzD7VxrNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFPE2x9nbqDXlnI53Mxq6EY9JD1iYGHtFJScj6J0RnI=;
 b=pIUxFZn5fqrgG4yAem5hMbZn3KLQ+sEVZgK1lU9oDfq/nVnGDdTIKpMkZIMpvntNAYfzkla2Qg7PIxHEQbG+edZBwntxtbJBHjaoY1dD5bEll/BbgtpLCuxqpQTpxAl56UZxf8NakaS6TB0l2quqPOJN5ioSYEc7s5tWIo0OBk0=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by SJ0PR10MB4589.namprd10.prod.outlook.com (2603:10b6:a03:2d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 13:08:13 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4%4]) with mapi id 15.20.7181.015; Tue, 9 Jan 2024
 13:08:13 +0000
Message-ID: <9712abdd-cbca-4ad6-b1e9-ff9bf054b278@oracle.com>
Date: Tue, 9 Jan 2024 14:08:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] Documentation: usb: Document FunctionFS DMABUF API
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>
References: <20240108120056.22165-1-paul@crapouillou.net>
 <20240108120056.22165-5-paul@crapouillou.net>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <20240108120056.22165-5-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0529.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3db::22) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|SJ0PR10MB4589:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9b0775-be6f-4100-352d-08dc11140916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VPJmDnDPp4QfwJh9wSew+HUjegDU8N5dtwtwzFSK1LWK9P+e0H0YRr0UZblLuNOm10ckacS7+YMXpfT2cvOHK+97jltu9RR5Kq1GZ+0APY8z4+sH+zKt9Go0QydmTftvY9hMQLFU6vlr3/lZzxr5WruPHV1UAqgSvOVOSYh3JLMLfhWQtsR3Wtbjt5brTWWjXzzRgHoEgycqibGgLee3sz15KucAlAoIWfMAcC256fg3rakyGzkNHmanDLit9sStK9cdED/fU4+Jvk7wcDhCWIlDVMN2EmkC9kuEwP6DXAjaKZ7EDi2s3l4Vr4WZXxlqHjUcoB42rcSDEK8d7ERirFb3mml1ohAast6Kua6lT24PMjZFDGtMX2zJwpMs0QZTh1S5ao4kgQIYcDegAfc1ZghP+AdX4JW11tlpkz3XziVLDa4iaf66UAE2OYyr+wst4y5B3eTxtTVlHzlEtO3c6gXM7zmT6iVQ3zjs+4sr9h4s+tnITgvpIxdXNR4y1z0w2aUtBSng/qxJuse/teesPdCEQqd+NE/gdSw5DvPfX0ObZ+qFgOTiK1LEBL1FjrAx2Mvdr7rXL36dR6gHUZ53VcYAoTtEwenM0u2DCSKC7JjuXs8YlvBMbkNjLcUUiGWa3RVEtSsbjbRbl5rYdUNGJlnc96egKNj6VEXUbIKTIjjg5qe6cLMc3S51e5tZ1CrM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(230273577357003)(230173577357003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(26005)(2616005)(38100700002)(4326008)(5660300002)(8936002)(8676002)(44832011)(7416002)(478600001)(2906002)(6506007)(6512007)(6666004)(53546011)(6486002)(54906003)(66476007)(66556008)(316002)(66946007)(110136005)(41300700001)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFJnekFNQUxXM1R4UE82djdEREdyZjdvQTNCNUViVzhta3BOblJSUk14Sm1O?=
 =?utf-8?B?SWltSnU0bXZnZVhkK0k2YkEzTWt1V3lsRTFYMUxMelNvSksrOFZ1VGtZVXJI?=
 =?utf-8?B?YjZIZUFJaFpzaFVscGFqMHlrODdadEExQURjc0ZreHNOeWhRYy9NcWc2UC9m?=
 =?utf-8?B?T2ZjWFBXcDNZc1lNd2Zla2htMW1tSWV6TGkrN01DSTMrQjBZTGZpalhUZjgw?=
 =?utf-8?B?K3lDVVZnSTZ2UGdhWnFPYnlESXJHOEZlbHdvN3JTZitoWXIyRXZlUWttVm1x?=
 =?utf-8?B?TE95YUJ4cHM4R243VG9RM1lqd05sOUZ2WW14eVdNd1V1bXRDdDlwK2toSTBO?=
 =?utf-8?B?dXR2WGhQa0hFQWNaQVh3UHZ1WjViR1pWZFROc3FsTng5RVBBaDZHeE92R2NU?=
 =?utf-8?B?QmRqUU1oUkRaZGd4ZG43ZThiSy8wQVN1ZlB2OGdCb2dHS1ZpRUZ6V0t3OHpV?=
 =?utf-8?B?cnp1YXBsclpvTXFtTHJNU2Z4SnNtdUFBK2tQdVBvMWlHYkNiMk11T3NlZDFO?=
 =?utf-8?B?aFc0Nldyb09oSGh2N1ZUdE56T0lzSWIrN0U2eFVTQ2Q3WS85ajBhVnQ0cTE5?=
 =?utf-8?B?Ly9WaFNGcHNZVkFmbmZNaCtZdElRamVLOCs0YW9yemFDZFpQdzV2ZkRuUzdH?=
 =?utf-8?B?bUZRYWlCRW4rU0FaU0RXRzRLUTIwcVF1NW9ZQ2FVV1NtVGxQd3pPNjRPRnFL?=
 =?utf-8?B?WmttbjhLWVpVdXF3Vmd5ZWZ1a3JHb1JpN2ZGQTg5WkxHNTVrSnJNVFozc2RG?=
 =?utf-8?B?TkRGWFQvTk51T3JEblhvTG5ZTTF0aGRLaERqMTdEc2c3cTVyNTEreHJsNkl6?=
 =?utf-8?B?V2Z5ZGVRS2JURnJjTVJvL05nbCs2c2tLM1k4NFpQa0lpSHB2N3NPYnZaYkJu?=
 =?utf-8?B?TWJMc2NpWHRpUHlQeldkQlV6NitLTmpJbWtVMjdkZWxoZ241SmphdU5XSWlu?=
 =?utf-8?B?VEF0bS9rQ0FVaVFySmFLNUo2TXVRKyswcWtUcHMzOGlyWmQvVG5aU2FROW4y?=
 =?utf-8?B?UlBuT245UjVmTytCcHB5L1M2MmVrQzZFeG9FbVh4S24xWTJmajl0RXVVZVBw?=
 =?utf-8?B?aWVRUm5xUnVrNysxeHVFL054cWVjOStsUGNKSkxnK0ZQZHdVWUlRS0Y0SFR2?=
 =?utf-8?B?cUQyQzN6SHZ5TGxCR3dZL2J4cFVjNTVRZ3I2bFpKTFZBeHNhcTJkTEd4SEtx?=
 =?utf-8?B?ZGJ5bUVCYnhYMUQ2L3FYMTlSd0h0Rmt6cjFPVi9XelJiUTZTNzA1dTVPdWxn?=
 =?utf-8?B?azRpMncwRXhHZ0hLaGVReC9kcTluQnhrcVErWGVmQVhndkpzdmlCU0xVZzdU?=
 =?utf-8?B?NFU4T2V2MFZhZThiY1RlekNQZ28wamxya0NNQUFZY0ZxRTdvd2swMHJLTmZP?=
 =?utf-8?B?dkhPOUVIQWlZNkxBQmpGb2I5Q2lmQTQ3VllQdmtGd3NkRG9rT1huMFV2QVF3?=
 =?utf-8?B?MndncWJhT095eFg5MTJQU0ZwanRkbERNbS9jWmVCa3dwR3VqdFpmUFE3Nkg2?=
 =?utf-8?B?b1VsOGZONW5TK3htc3B2T1UzVE5yd0EzZG4xdWJ3V1RjK1pxdjVMdE55VUZz?=
 =?utf-8?B?TmVUM1dONzhxMmtSR1huUFAvYkxjbHpKRXdNU0tzRStTbmNYaGExckxsSU53?=
 =?utf-8?B?YnpORTBiaWZFdnJtalZaZXdOcnZuUUxJS1Vrak5rWVhycHV5SWZwOXpMbXVP?=
 =?utf-8?B?TnFxL1NzaGJCdHRJZFVHaUtTaEVyRDVwRVZLcXhhaXVjUHkxbk8waGdFeWxw?=
 =?utf-8?B?Zkp0UkhKeXVhVDlHRGE3d2traFBXYWcrbXlTaysybFVTWXhCcHlIa0IzcWVi?=
 =?utf-8?B?Mkd6azVFblpERDdwU0ZROUV1Y3BxL1o4dEtpYmhJYTN0TjdMazY4TEs5a0Q0?=
 =?utf-8?B?NEhPVWJjdVR1dUthS2pSazF2YUM2cUxSaEhNaHljVFVsaDlVemNna2lNaXQ3?=
 =?utf-8?B?eEJCM3c4NDBta05pd3FyZFAwcjRsMUpNVVlsWjVmSlE1N1FpR29FTFRlOHc2?=
 =?utf-8?B?cmlQWHhLTXhCSDRjN3Fmc0luMUhKdW1tWmdoN2U1QnVnN2tOczkxNTRSU1By?=
 =?utf-8?B?V2Mwd0pHSWpzREpPT0pvZWVJUFdKRDUrNGF2aEJzTTliNnl6ckhpcS9uNXZU?=
 =?utf-8?B?MndFRDQ1Mk8vcHk3QW1GYVlvYTFScHA5aVVuc0lobFdZWDdidmRBVHZneU9r?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OXNgZ9vqK+fqPwDE5EJDwjfPBcutAkO57pGzeikOq7VA1qqx5iGJNqwIXGV03lHU7MaQ/No44vB7r8812NIllZsOlkSUL76Nk0aT/uTtPNe+O9EAXZlBqHoaQmX13C+d+P5jdrQSNa6vVPGut+PMamo14VHxlLukqwp91l3KZI8oYTIDdPad4zaqsMqCo14wVTKmrKvoNRjtx6DwiqQuvBaBWhKPCBCZ58mv4oPSVsljlQRfEQtiO19faP1ccup0MHDL0vsu+xAa/9AECUJiZiQGH9XRmHLorclzH3DLbUIrwSKcj8LM9DbsNS4wjZ4AlT/98ev4OSIfVW0mu50aqyr2cHikBFo6UEuKwcOK6GMnvIV8BHh3fCh1e30O2if6CbXRfSYhXQpJLSCvp7rg+ZcHPbC2IZNSD5kTBIdSMy7O8N/XBeK/ceCxy3QrltixYSeNUJRBDLkliHv9sr6O1fORFbvNRhLTi8KzFMH+iBjVhBov9NwG39d139yDZCP+4tjN3N7l6OQD+mFXWjDwCKVwgYjUQ6+Zkt7Ig89+YIA662GHwuJ7VrJQS8JyYoJfsGmxB8ZnJ244n7qN0Ex1zQaRjiB7NfK3ldALluRUJVg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9b0775-be6f-4100-352d-08dc11140916
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 13:08:13.0579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tswgqXDQl+HKwXo/D/6sxysg5F4mlnoMst1W4W+C8cu3hU0XqxAuZaH0rwMDjcwUN3IVAz/Gctg2S1/Ry5+gK0O0x9lQHgOdAURdGSeo1Cw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4589
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_05,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401090108
X-Proofpoint-ORIG-GUID: Cq9rqAGSUT90Ew4G1e124nl9s6k4Wgp_
X-Proofpoint-GUID: Cq9rqAGSUT90Ew4G1e124nl9s6k4Wgp_
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/01/2024 13:00, Paul Cercueil wrote:
> Add documentation for the three ioctls used to attach or detach
> externally-created DMABUFs, and to request transfers from/to previously
> attached DMABUFs.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> ---
> v3: New patch
> ---
>   Documentation/usb/functionfs.rst | 36 ++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)

Hi,

I'd like to point out that this file (usb/functionfs.rst) is currently
included by Documentation/subsystem-apis.rst, the top-level file for the
"Kernel subsystem documentation" set of books, which describe internal
APIs: "These books get into the details of how specific kernel
subsystems work from the point of view of a kernel developer".

However, functionfs.rst (and especially your new additions) are
documenting a userspace API, so it really belongs somewhere in
Documentation/userspace-api/ -- that's where /proc, /sys, /dev and ioctl
descriptions for userspace programmers belong.

I'm not NAKing the patch -- I just want to draw attention to this
discrepancy. Maybe we can separate the kernel-implementation details
(stuff about __init sections and stuff) from the new ioctl() info?

Looking at <https://docs.kernel.org/usb/> I see that there are many
other adjacent documents that are also not really documenting kernel
implementation details, rough categorization as follows:

USB support
-----------

- Linux ACM driver v0.16 ==> admin/user info
- Authorizing (or not) your USB devices to connect to the system ==> 
admin/user info
- ChipIdea Highspeed Dual Role Controller Driver => admin/user info
- DWC3 driver ==> driver TODOs (can be moved into source code?)
- EHCI driver ==> technical info + driver details
- How FunctionFS works
- Linux USB gadget configured through configfs ==> userspace API + 
implementation
- Linux USB HID gadget driver ==> implementation + userspace API
- Multifunction Composite Gadget ==> technical + user info
- Linux USB Printer Gadget Driver ==> userspace API
- Linux Gadget Serial Driver v2.0 ==> user/admin + userspace API
- Linux UVC Gadget Driver ==> user/admin + userspace API
- Gadget Testing ==> user/admin + userspace API
- Infinity Usb Unlimited Readme ==> user/admin
- Mass Storage Gadget (MSG) ==> user/admin
- USB 7-Segment Numeric Display ==> user/admin
- mtouchusb driver ==> user/admin
- OHCI ==> technical info
- USB Raw Gadget ==> userspace API
- USB/IP protocol ==> technical info
- usbmon ==> user/admin + userspace API
- USB serial ==> user/admin + technical info
- USB references
- Linux CDC ACM inf
- Linux inf
- USB devfs drop permissions source
- Credits

By "admin/user info", I mean things that a user would have to do or run
(e.g. modprobe + flags) to make use of a driver; "technical info" is
more like device specifications (transfer speeds, modes of operation,
etc.); "userspace API" is stuff like configfs and ioctls; "driver
details" is really implementation details and internal considerations.

The last ones I don't even really know how to categorize.

I'm guessing nobody is really enthralled by the idea of splitting
Documentation/usb/ up like this?

   Documentation/admin-guide/usb/
   Documentation/driver-api/usb/ (this one actually exists already)
   Documentation/userspace-api/usb/

For the stuff that is _actually_ internal to a specific driver (so not
useful for end users, not useful for admins, not generic USB info, and
not useful for userspace programmers), I would honestly propose to just
move it directly into the driver's source code, or, if the text is
obsolete, just get rid of it completely.

The distinction between user/admin and userspace API is pretty clear
(one is for end users, the other is for userspace _programmers_), but it
can sometimes be hard to determine whether something falls in one or the
other category.

In any case -- it looks like almost all of the usb/ directory does not
document "how specific kernel subsystems work from the point of view of
a kernel developer" so maybe we should just move the include to
userspace-api/ for now as an obvious improvement (if still not 100%
correct):

diff --git a/Documentation/subsystem-apis.rst 
b/Documentation/subsystem-apis.rst
index 2d353fb8ea26..fe972f57bf4c 100644
--- a/Documentation/subsystem-apis.rst
+++ b/Documentation/subsystem-apis.rst
@@ -81,7 +81,6 @@ Storage interfaces
     security/index
     crypto/index
     bpf/index
-   usb/index
     PCI/index
     misc-devices/index
     peci/index
diff --git a/Documentation/userspace-api/index.rst 
b/Documentation/userspace-api/index.rst
index 82f9dbd228f5..e60cd9174ada 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -41,6 +41,7 @@ Subsystem-specific documentation:
     tee
     isapnp
     dcdbas
+   ../usb/index

  Kernel ABIs: These documents describe the the ABI between the Linux
  kernel and userspace, and the relative stability of these interfaces.


Thoughts?


Vegard
