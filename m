Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B95D46C348
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 20:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6936EA2B;
	Tue,  7 Dec 2021 19:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332D56EA2B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 19:01:40 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B7I4YK5021777; 
 Tue, 7 Dec 2021 19:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=n0gncZPwGkQkDP6w/OPBB+xoS+e1qXfojnzRId4yilM=;
 b=0Qwhp9LC1xxBULAgj0aFi9ksvmbNHDIV3U0gcJRDTLHnha2MvwwuJ3WvKEkXQPlTqL8g
 xFNZyq4waMSMOEKzsl70bz7czXh1taCVllUYoegvmhYIUAZGNPG0JEPCK403ovRp1ztb
 gPDW40ERoy18LJq9pTraVU6XU9mj5wcK8P4aADBk7dVN+zZxx5/IUsi1csyLB2JuP93y
 1yp+ntcYUfTLsFZPYL2ry/MbM/kf27DAiRlRWG+NMf0sz36aH/nYOQJY/xPma/m5yH8w
 SXbguiZjTJRbaq1okBfsMfy0lnZ6Oj+2GFekTjSK0dbfqNax3cNvCFNIZomjO4rsN7W7 9g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csdfje6hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 19:01:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B7Iuf1x112956;
 Tue, 7 Dec 2021 19:01:35 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
 by userp3020.oracle.com with ESMTP id 3cr1spevvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 19:01:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzIdQ2d+xUPgt0oY0hFMgRzNSVen23PTP576QBX3ZMDXjdq80hcxLUDCyBMvnJgd8vD2IOY3dooFakJ9nKfgm/V1OO8R5DOGYM8by9GFuPblMZ9f27ZIW19k3JO+NgbpZ27L0YFNjz77oGbMdHir3HirMMDdpu4cZ5eMWxM3ZOrSXaMAQ9VdwcCyohmXuBzBAQOwyL0vdrl/d/4miVNQ7d0zW2JXKZhxjQlAc4e0J5gmy7FY6Kt7YZ8zpvNrxdryy9vFoJtxXsEFfboVacBAzYP+8RiVJ90BjDiwHHYeU9qxcGaGyaqa3yud2eHPRKGOGVZ4TtGW8TCvfi4d4+5Y7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0gncZPwGkQkDP6w/OPBB+xoS+e1qXfojnzRId4yilM=;
 b=iLagdBnL2A2YxXeADKoDLpQCgsWsXHaUMAvitEI8mBlO23Lt1//v9otRmyoCaBWrac3kCM4c84gdpxTJPvR3+kL/JeKe2APrUxCngkW/Ym/DlFEIi4DYFQI2TPc2WusiV4aevmW5TTGO8ESS6fHb9Wq5J+vwY2dI7tAK/KR7jJVOP1zVoe0N/YUHxIsSrgkusej0R+NtrQSjFjDWYslXhYTNcD3ZT1aq7LI/SSWCxQADYT9VLUy+GNTx/XjleMU3tdr37VAbQMuitWN0vo4gdM9uPo3U5hAcViqhU1pUl8tK4Xw6Kiky0ba28S8nRRzJBvbLDXVqNGnAI69zAN8+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0gncZPwGkQkDP6w/OPBB+xoS+e1qXfojnzRId4yilM=;
 b=iaVF+L1VaO1klaZXODQqpCttSsZwDCXqKViaqFG9y1WMd7fx/cioMnL2PXYw6ZtnArgNBbkNPVnYvuSrobUyXZvCj3WfmIWodhPmnxBhd88pzpi9y5D3K8NAK+xJXJzgytspG6E3kU0VTBnIP3ChH9g7eNVKUKult0TjbsdWth0=
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN0PR10MB5320.namprd10.prod.outlook.com (2603:10b6:408:12a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Tue, 7 Dec
 2021 19:01:33 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::4440:4f39:6d92:a14c]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::4440:4f39:6d92:a14c%6]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 19:01:32 +0000
Message-ID: <226972a9-2e1c-be72-c970-3a16cd51d2cd@oracle.com>
Date: Tue, 7 Dec 2021 14:01:28 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] video: fbdev: cirrusfb: check pixclock to avoid divide
 by zero
Content-Language: en-CA
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
References: <1635366613-22507-1-git-send-email-george.kennedy@oracle.com>
 <CAMuHMdXcO1K7da=4Ck2X0Rc_pfaM32dDKf0EfdDXNG0HL18h5Q@mail.gmail.com>
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAMuHMdXcO1K7da=4Ck2X0Rc_pfaM32dDKf0EfdDXNG0HL18h5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0030.namprd18.prod.outlook.com
 (2603:10b6:806:f3::7) To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from [10.39.208.49] (138.3.201.49) by
 SN7PR18CA0030.namprd18.prod.outlook.com (2603:10b6:806:f3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20 via Frontend Transport; Tue, 7 Dec 2021 19:01:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f702f520-1f84-4112-4c10-08d9b9b3fbb9
X-MS-TrafficTypeDiagnostic: BN0PR10MB5320:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB53204CA324EC21F5F2CD3113E66E9@BN0PR10MB5320.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CqMK5iou7uO1HYwTTc4+ucu5EjKy4ypfVj6TjLGwXTST4cRIufDDe2izbr6VxyE0/QzOyGaOwU2iApOktyXuzacdXr7qmenFZR8kn/ugtsL6Pex5eey46tSpXJKC7qO+XRZ6VhPQT/ASLRWaJCLuWGGJM+8rJuBQFf46yxIc1QLJCXz1ofm3qtOr/tvJ7yTk9aPcxfsY5mUYNERjcUgdbW4oldy93YsSw3FGDM3xUp59FaChKXzVIxuUoirQcRBAcSHQUNm8StxXlfH7mCTNINd6xTJV5ZITugaAk/GKDl8WCtVpV7mJpssuWAE/iKSyzZa3FyOHuk2YmjN5nzWbKbNWPcPoI80lyUpSDxOmBmB3dTNiGNj3RDFepWPyPB/ASm1hYPzP3ooDvkNKOfBu3x994gE2Hlvhv60f42wPJacb/YKcZu/W/qc7v1JWqSrc02eGL5PzoVnzERy9AviB6nu2wgzbk/h1+7Yv+a6sczeaFoD68ch5fiv7EaTTrSFKyZ4z1WTbbBTcUthqH0B87GTI57B036yvBKQPqndqQ1sob4IpD6X62naP+06V4dVvzwZQDGfEO8LjV7fh5y5QMHsHgQLZcdhC4PthdmkoosARafJLFkj1MplJYOMe5i5+bVXip50eOJhyumV/yQj4Gf3DCa1XDppfLEoBZvdAqGFn0oPBTq8T6zoFJKhvTjONBlMbGwWquEHk/H/Rw9XtD7QOTDz3k2mkNtuirlHdGxhlwRZjvaR0TdYkXgQ/+4Q8+LuDWpdczcFoLR5GRIkhDr/BO3UrAv5/I+VvvMrawSX6MuQbRuNA4dM3Z510Khz5nVBmbLfk+RRmN6ChMWtlPJpmWUfhbvDIY5p2xgL4LXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(36916002)(6486002)(86362001)(83380400001)(53546011)(186003)(2906002)(66946007)(66556008)(8936002)(26005)(5660300002)(66476007)(31696002)(956004)(8676002)(966005)(4326008)(54906003)(316002)(31686004)(36756003)(16576012)(508600001)(2616005)(44832011)(6666004)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEdQbDlFeXVnS2NEZFpxemN6ZVlFclJkaEtvZjRTajR0cXBpaWd4RU1PNmQz?=
 =?utf-8?B?ZG9qVHJWcjRHWGJ5YzRiV2hmUEhmNDVRQW5FQ2RNYmpSa1A5a0xlYk82akVp?=
 =?utf-8?B?Nms3OFNSYUZ5cGZIM0Y0dzZwOFBTWnVaZUYrNVJEZWJ0VmNmT2pkTm1Balg5?=
 =?utf-8?B?eDM0Y0dFc1h0ajZQWlFJL1BwZXdKcUxmU3FSOHRjQkRKbE01aFBkWEVROHdF?=
 =?utf-8?B?RTJVMElhbHBHNFZLREExckVHbjFEN1BaNC81T2JOL1JxMkxVZi9WQkh6YTFK?=
 =?utf-8?B?VFBLdkN2M2hqczdxd2Erdms3SkU5YWxnNjJwcmpEYUUxVllXdzhkSjFOR25z?=
 =?utf-8?B?VGo2aEVmY0hxdVhJck5HRndJMDEzR2NubVMyTlpDbDJaUHpVN1VpVmdMM0Z1?=
 =?utf-8?B?RndINDJaRjBacGRkSnBEWEVyN255K01NYkFDZWJmZ0JOTkdNZDhBdnZwckJU?=
 =?utf-8?B?a04wLzJVSUhRVW9NTytManZEYWRRd1BKYnp6VG5aSDlhY3hSd0ZCN2s3RXJn?=
 =?utf-8?B?eDRFeDNhMFA3akZ1eGFJckxpZ3JCK0ptejNRRmlieFRISGwyVjdtQjdubXFi?=
 =?utf-8?B?TkRDblBnM29EMUlyVFpXU0xFcVBMb3V5UXgxdnVOUUlZYm1vTkVBMzA4aG1m?=
 =?utf-8?B?YVdnWVY1bnNPZG1Vd0xlNmJrR1RoQ05NQ0pxUC9rY3Q2RTBhZWxUelpTTzh0?=
 =?utf-8?B?WUtFQnpxNzBoOE1vbVNZdHR0SnJKbmd6WEsxMWc2OFVEczIvS1pPUnk3Zmpk?=
 =?utf-8?B?cmozNVVySjRrblRTTFArelBON05JVStvdHQxU3F2blhxSW9RZ1QrUDBVS0Ji?=
 =?utf-8?B?RGo0YmZSNE9RYmd2N2lnS1JocktiR0FDME5RL25hVHk3NEE4Sy83UitQWjRX?=
 =?utf-8?B?cnVGdy9mY3pwUzUzbDl0SGxSaGlhZDhJZWZ2a25vdzZOQVloZ1orWHphSmZv?=
 =?utf-8?B?ZTI5R2xKZ1R5dysxcytlcDBadzVoUzdMM2ZtMGxoWTRIL2UxVEc4OUd1VkFx?=
 =?utf-8?B?cmk1MGtLOStwM0grdnc0eHJBUXJSVSs0QUpVR3dwWXJoY2RoSWhHR29SVXpB?=
 =?utf-8?B?RTJyOUJJU3lCMXpXUlRKZmpRK3ZVa3J4M0FtZzdETXArOGpQQmM5alhjbVU1?=
 =?utf-8?B?TGE2Yk9SQ2NzL2taYXFxSURydDlrR0VIUVZxWVdnQ3dUVlJaS1BWWG12NDNR?=
 =?utf-8?B?NEFqSGVobXV3VU5rZnhFZW5pcGl3VFlCY0JXVjhXN2M5MFl1emRyazZRTnpR?=
 =?utf-8?B?L0hjS0o4RWF6OXo5UklkcmFlaHg5ZlR6OVJyS1QzV0xrNnhGZys4emNJcWZW?=
 =?utf-8?B?cEcyckdXUVZYdDRaSWlYSlYxTE1xYUF0QU81czhMa2NpV21Mb0ozY3Z2TTJK?=
 =?utf-8?B?UmZqYkI2SGltTWEyeExibGFsbjhSTThNWk9rVERFeWU1V0E0M1kyVlp4eTcw?=
 =?utf-8?B?bnFET3BTV1lGcmFoWVk3S0E4RkhNc0ZHQzl5VWdVSTF6cTMrT1E4SXdkNnVn?=
 =?utf-8?B?T0pjdktYMHdpWUY3NTJoQmFCUGZSNWQ2dmNqNmVxM0twOTQwK3pYeUFrNXNt?=
 =?utf-8?B?bTUrZiszQm1xcnlLQkdSdENrSjFLZjkvSEZ6NklCYjA3ZEVjTy95ektSaXIr?=
 =?utf-8?B?bDVWRkRodzdneVp4Szhyc2laMTVJRHovR0s2bVI2ckxjZHUxL0F3VTNPNitp?=
 =?utf-8?B?QlZwSDFqc2hlUkVzWlpYN01yTzJ4SkkrQ2VXWXlQVThjLzVLV2VVRFk0em9U?=
 =?utf-8?B?TkxEbWlwcFp3ck1QdlZTK0RPZ2JSc0JPdUlqbXhmTGhWdksxWHd4SE8rd2hW?=
 =?utf-8?B?b25jcHFMcEVDdjQySnVYVXIrZzM4NmtEdnpXakxJNEZEVmlhWGN2cDhmeDhS?=
 =?utf-8?B?ZXhBN2xzUTRvMFJldmtGSlBBMU1RemZsNklYOVNETEtYQUFLUmFNTE5DZ0pT?=
 =?utf-8?B?bmRTQzFXNlJrT0hnS3BkRUNQNWtkMzk2QWhGY0lMTmF5TGNhQzE5aG9aWEhm?=
 =?utf-8?B?Q2Q3dS9hVjJzL2FabFV4Qm1xY3NsMGpodUx3NjBEdXMyTUVRRjRudWZpa3U0?=
 =?utf-8?B?Nk9OM1JtOHB4a1l1aGhTbDBBZzRwa080Uy9Jejc4aHM1cWZJRk1BajQ5dEww?=
 =?utf-8?B?REtKOEk0MjdSK1A5MXc1OHZBdDJxZ01JSDh5Znh4UUdjeXYyVVZWQ0Z2UDYx?=
 =?utf-8?B?Y0F5NlpyTGtVMXpKUjMzWlNFbHpQTUd0aUwybHVqcGRFMXYyKzZNOFpQN2hj?=
 =?utf-8?B?UlRwckdMVURrdnB1aS9EWnZQNHN3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f702f520-1f84-4112-4c10-08d9b9b3fbb9
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 19:01:32.8144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1RnkzQhB2M20lppnPbZ168mq22mMtxSNOTFuuEImsT2GvMVFH1RhpmctJNUrK1nUrniQvSLsAcGbnwRSxwGIZ9TU0550nlvstWRny8e4Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5320
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10190
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070118
X-Proofpoint-GUID: blDjbxzLCMMTmbVKIvxWpOK5ObVtyy5K
X-Proofpoint-ORIG-GUID: blDjbxzLCMMTmbVKIvxWpOK5ObVtyy5K
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
Cc: Greg KH <gregkh@linuxfoundation.org>, Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Can the DRM maintainers accept this Reviewed by patch?

Links to the Reviewed by patch:

https://lkml.org/lkml/2021/10/27/982
https://lore.kernel.org/all/1635366613-22507-1-git-send-email-george.kennedy@oracle.com/ 


Thank you,
George


On 10/28/2021 4:05 AM, Geert Uytterhoeven wrote:
> On Wed, Oct 27, 2021 at 10:32 PM George Kennedy
> <george.kennedy@oracle.com> wrote:
>> Do a sanity check on pixclock value to avoid divide by zero.
>>
>> If the pixclock value is zero, the cirrusfb driver will round up
>> pixclock to get the derived frequency as close to maxclock as
>> possible.
>>
>> Syzkaller reported a divide error in cirrusfb_check_pixclock.
>>
>> divide error: 0000 [#1] SMP KASAN PTI
>> CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
>> RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
>>
>> Call Trace:
>>   fb_set_var+0x398/0xf90
>>   do_fb_ioctl+0x4b8/0x6f0
>>   fb_ioctl+0xeb/0x130
>>   __x64_sys_ioctl+0x19d/0x220
>>   do_syscall_64+0x3a/0x80
>>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>>
>> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

