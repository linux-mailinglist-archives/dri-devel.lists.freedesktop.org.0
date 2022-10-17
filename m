Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3626260125E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 17:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B643610E2E3;
	Mon, 17 Oct 2022 15:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1D410ED70
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 15:05:41 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HEkaVr007666;
 Mon, 17 Oct 2022 15:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 to : cc : from : subject : content-type : content-transfer-encoding :
 mime-version; s=corp-2022-7-12;
 bh=81FHj3sHELP4lHPjTIxa/QeutVoogwEP3wdYOuo0K+0=;
 b=BpH9CUIyWCcsk9ToodxZyWT/1jkvXOo77Bpozp+96og4tPyrUyIWBsHmItRglOaFLglM
 J8GRhBNO8LCnbM5gO7qTD1wZUZH8dDmJGsWko9EX/DRbJsyJqwCXEixhCiNz05HKbPG8
 cLqSppmj0+eKQLbWdPPEI9mePnLzy9UflHaYwqAqCXnboZOmO+R553cyNSN7IEK98Ojf
 5J4Ay6ZZ7KKP4qVZWglX5mGjDSaDP4uZZtB4/C2mVfggFHS4Rr0vMVu1zESY3bDWFt1x
 I9pVOsabm+VRpebOiWc6pq3uYTrUh+mJOXsn984mP2DQH5BKHq4UKjT77D7T6F3toEX0 BQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k7mw3bqyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 15:04:34 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29HCXRfp036466; Mon, 17 Oct 2022 15:03:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3k8hterkq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 15:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cP7IjVbvH6tAJ/1ZzpqtFvj2pP8khT6zZ19HUPQTfF5fIvAyW4fYzIs5thVmvTL71qAnS9PfcB9xOZsy0/KHbsxX16ykIjm1t/1aZUT9tnNV5CcnQ9Z/619vxrX7wA1bPvL1M4QuZEMys699AMVDO1PGRlCEORhu68qiIvg5h73TGbzprMieXX6dufOsAlZm6Ie6YmVKNnNhrmYnlwQGle7OHRim4J/nTybijQZgcPcJLgwgw/AkNCpJTtVgceyE5VqjxYs5qQj3HSP4ATUoyfb+509oy2n6OCQYHy+K2qqjKGUHUsNOb60XbvfP1bjhnFMrlSDbSNqRWLm7UWEFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81FHj3sHELP4lHPjTIxa/QeutVoogwEP3wdYOuo0K+0=;
 b=FtFE5lmLGWXbieFMUqF4xTD8KXprMP/UhvJ38BvbvMOkJPbG8VOP1iQ5jyXukz8AM7/s1+GwE2phQz9E04G8R5J4jpbwI3uQJX4Zg7z8RLX+3qmi90ZQJe3Kh1WsP2rWPoa5oGNLnXdJxZJL9MxADrnzGy5536pdXTpQaM84Y+nJAs8aT05lGrT2lrewZXoqAhkXeJTvMuYZcz2vwVaRse62VNyg17w+vGg1wohwXXNH0AKp7PPASxcLikQ2huDbs7BJRUpv+CpjIeVex4hYW83FSJ4jEFfWBMm/8JwyM4sdmm8e3KQoMPjb1AK9ifMsvr97KIWwgRyMx5Z3/9mdBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81FHj3sHELP4lHPjTIxa/QeutVoogwEP3wdYOuo0K+0=;
 b=gv62HStcx4C0sxzQTLrFZl2z6Pz5lwt+4sHFIfaJf1kopyn+VlcApB6niWgO4BL1dPRtcWlOEXU0yebpWZGb2HMRUrrOYRG/iXRa87tiDuAuiu9KVAG0cM+dt3ROwJOMXLm1jSqbsvquUXtxXu4rphCKM8fa9hRlBUUAZMCm32Y=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by BLAPR10MB4836.namprd10.prod.outlook.com (2603:10b6:208:326::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 15:03:47 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::452b:cff:c708:392d]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::452b:cff:c708:392d%9]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 15:03:46 +0000
Message-ID: <364c0959-c82f-a93c-df02-87a04e1c2cea@oracle.com>
Date: Mon, 17 Oct 2022 20:33:28 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Content-Language: en-US
To: macroalpha82@gmail.com, hjc@rock-chips.com, heiko@sntech.de
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [bug-report] Smatch warns unsigned comparison with zero in
 dw_mipi_dsi_rockchip_set_lcdsel()
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096::16) To
 PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|BLAPR10MB4836:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8f9b2d-6559-46a4-ecad-08dab050ca57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ryETIoef3wFpqXZtete8fRoNOPE4Q98nGpwqdNa4cNCn7z/ZKsGJyKzq5SsAS6Tb1Tb7dJ+AnMt+QuHu0QARS3yObOBpxyJaMvxLon7eQOxTWq3ETDbFTiA4zICYWlar5Z6OaxBa1W+/KZhAuGZqp9C8d9ULHtC54F0fsgRA0lfAdxTTHGHibUDOa1z4Hnu1+NslKPKfliKR58vimG7K6QHwB2f0ZjI33OpAMMmArQk4oYx0TLyIix5GRcM6/iuwYGB0iqj0iEg7EzWB06dgKE9NZxRblID7yEPJ5+wp00v5qkv3AMP+Kx8TAe/8l5Xru9XhYxYWW3YTNEFNdyCs2O5izxt+3wt6a7XCGJOhuNuievG1LqQ67w2bFt8aHvRpFp/qkWHFnoVOVyl+uIsWgOPdHh9Quor7A5RrDvct8JbjRa8FtDISaJHyIbrG2p8j3TZZrlA6/Ej4Vs1KutUbhQYYcldjqJcA5alEGdHlPLoWBV73X3T4qEJZa1rIJrGp8OmRGK1Aay2c7egUKUBpq6FGP60A0ka9vYIvhq9i5NaQg6IKWbIJWaxcIMsyGi1cHPN0yi12DPNRaxonMevAEA76ttxAJitq9B1z3AQfejRNwvuLRk1wZXHt2axfC6Km8IqcAVN55kOEpLgDGaWnhFscoDUBwejhdBZ7jkX26AqdGuf4QZioZQI14aiERNqqJOCIxb34oAtqJBx+T5lz7Rb8DPafkM4BzKW7KZkK6dc2va5UT6yUPNyGQzm0JL5h6YN4NeNsOlKpMXZbOCgfw/AfaFiUghIxRkz+qInAZI0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199015)(316002)(54906003)(186003)(36756003)(2616005)(6506007)(4326008)(2906002)(8936002)(26005)(4744005)(41300700001)(7416002)(86362001)(31696002)(6512007)(66556008)(66946007)(6666004)(66476007)(8676002)(5660300002)(38100700002)(31686004)(6486002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTYyUEVYMXN6MDF3Zk94MGtxcWZDeVZmUThBckdBWjMzNnRjR3BJSzF1dUM0?=
 =?utf-8?B?QnVCRncvMk5oY1RFcXNUVGtXVkt0UmMzVmhnZ2tqMVVhSEZBYmwvVytTYnVK?=
 =?utf-8?B?WEtPNlNzY1pSWDUvZFlmL1lXbzIzZVBFZ2dVOHhzVDdTVytucXpmQUFwM3V3?=
 =?utf-8?B?dDRyNWRFTC9ySlczbjY3ZzRKMTZXaGx2aURvU25yOThyeXVnbWJOU3c2aUVX?=
 =?utf-8?B?TStoQSsvQ1VYY01vSHJmQXU0ZGRHcUVGTUk0eDFLMURMUVBTd3c3R2lYMFkx?=
 =?utf-8?B?VVRxejhvd2FLdzJpTWd4eVkzOXh3RmNmcVYvd2o5WVppL2NXcUJSdGZmRGFj?=
 =?utf-8?B?aU1GK1haNVp2YlE1dzlRd1doWWNkdHBpb0EwUnhVRVBRSitjMmd2bENuQnhL?=
 =?utf-8?B?cEoyVldmbzBWTERoM21obmQ0SWxQWkhKZ2Z3dU9UZEx4N1c0Y2lFL3JmUHJU?=
 =?utf-8?B?OVJwNXBpa2NrRmprUkptS2RyT2t0elN5Qk83RkZLSTUrbkdGdlpaVWxXYkti?=
 =?utf-8?B?MGNEdkVLM25zTGdQZDlmbzFuaUwxSnVvc1BGd3VSY3FOeDQwc2FHYVRyODJQ?=
 =?utf-8?B?VDBHS3E4V3hjNzZGUERSaWtnT0ZzTE9zblB3K0dHVTRvNzhta2IwallOR2hQ?=
 =?utf-8?B?Tk5HVityZm1UUDA2aWhXODExVExSVHdWRDVhd1RaTVZPMlhJV0JFMnQxKzl6?=
 =?utf-8?B?QkNCSnp3R3RGaGVLczdTUUdLTUJJTUN0NzlFYXhKSUx5Sk9XUDZkN1R0WUdU?=
 =?utf-8?B?eWFBSmtiZUsvR1RCSlBZaTFYOVFuamh6ejk0em9ZeEZvbzNuSEp2YnlYOW1V?=
 =?utf-8?B?V3NXRC9lYjNrZ3c2NDB3S2hKSWFWZjFCTkZQVVVNZ0k4YS94aWpvTkJlc3J1?=
 =?utf-8?B?ZzRTQWM3VnNXZHloV1Zrek9ROEdjT1RQamRRLy9tZDZZMUViWnNXWFRQTXd2?=
 =?utf-8?B?QnExMit5aXFUV0Z4OVZEVDBvSmlpN0QwSU0vZHVFQmRTYnVodEE3Um9yZElR?=
 =?utf-8?B?c2FVMC9XZjhjSWN5ZUFUaWpsN1lzbjIvbllyUVlpdkRkL1JublBRWDNQaE81?=
 =?utf-8?B?dUlEeXdJdnhBL0hRYVlKcmVOUzdtL1hzRXh2cThsakpkWDVqeFpjRlhod0Y4?=
 =?utf-8?B?YThFalZKeWtIL3RGTWxtSkRRbERvVHc3U0JwYVJmd20wVDFUOWxvc0hLU2J0?=
 =?utf-8?B?bGN6dzN6U3EwWGRCeVVKYTQ4TDgvRXZxcXl3dlQ3cjFvOE1GZnVtRGlzVDNp?=
 =?utf-8?B?UUUxM0lKb3dIdTVkNnl5WUN1dnE2cDJyK3ZqUDl6Y1hFdXBhUEZUZURVWW1o?=
 =?utf-8?B?bjg2TEFCTjBvOUc0WW9wQjRSeUZkSkdqeVpBUDIyL014VW5QUVBMRzhxREpR?=
 =?utf-8?B?WCtuZ2ZlYklKY0JId05zUmVNT2pMOU5VZUNLV3B6TnJGeFBMYTRrM0hqWThm?=
 =?utf-8?B?Y3I5elVhVEpaVzBjZS9YWTFENlUydk5BRjA0SFR5S3BBbXRpNHFjRE9DNlRq?=
 =?utf-8?B?ZVVhbkw0MWorUEU3QUtnTHoxZ21jOXpQdktzeHYyR0h6R1lBeGhBd3dkUlc0?=
 =?utf-8?B?YnZ3d0ZjdGdLeGFyK1RHMUN3Ti80NWJPN1dGQy9GTTgxMW5hS3loMWEySTFs?=
 =?utf-8?B?Z0o0YkJsVjBRUTl6WkNDWmFZM2RsbzBlbGRJTUdsWGRtY0tLeEgyVFZialpo?=
 =?utf-8?B?ZEN5ZTdsOGRrNUd4K3A5WmVCNXZYelo2bm53NE9DNXM3UTdITlNITU9rTzll?=
 =?utf-8?B?N25xNkxlNVdqek9DYnBjaVN4RHRIWnZwSjNJYkdPQVhyY01TaDJsN2hEdkli?=
 =?utf-8?B?dXJXODZydmE5b2YxNzhzMnhCMnl3a0s2R3ZxMlhtU3MzVFJ3cXQrMW5xZUhM?=
 =?utf-8?B?WW9FL1RlU1dMRzM1Skl1d29rMU5keWQ3Wm1sUG03ZGh5ekF1UWQ0NEQ1R29k?=
 =?utf-8?B?TC9VZWNPQjUxTHNPd1FRZ3BOZ2FmNEY3ZnVML202RzhOdGwzSlV1OWtSdEFK?=
 =?utf-8?B?SlhVVzJjOUhlL0Z6N25jeUtGUUhlc3FJWlp2bUVCUHJXa2RSeGNKRlBKeklG?=
 =?utf-8?B?cEJiUFhPaGp0Y2x3MjRkaUdRd01PV3RleHhqQ3pld3ByaXpqaTBNS0J0c0RO?=
 =?utf-8?B?QnhveVlrUWlxNE5DUW0vZ1lHcC9QcUhyenN1VURZWmc5V21ITmwwMnllSXUy?=
 =?utf-8?Q?DoQuvaJvBj29Yk+nhnGoU1o=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8f9b2d-6559-46a4-ecad-08dab050ca57
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 15:03:46.8259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOrB5CWL6E8tUEFcBs5A+QBrMEo7oEWUu8hBR4eOS4ELVUgOJw/4bYS8rwunnOsTS5oA+xkmXFypqQGzWto0lFq7ag92sKTk5ScNrqCVj1VYIcrcGIlwXKuBI6JQrBxN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4836
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_12,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=952
 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170087
X-Proofpoint-ORIG-GUID: jOagjt46aW9lWEgsFU_k91uIGnGJVYAK
X-Proofpoint-GUID: jOagjt46aW9lWEgsFU_k91uIGnGJVYAK
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
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 harshit.m.mogalapalli@gmail.com, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Smatch warns:
drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c:755 
dw_mipi_dsi_rockchip_set_lcdsel() warn: unsigned 
'dsi->cdata->lcdsel_grf_reg'
is never less than zero.

static void dw_mipi_dsi_rockchip_set_lcdsel(struct dw_mipi_dsi_rockchip 
*dsi,
                                             int mux)
{
         if (dsi->cdata->lcdsel_grf_reg < 0)
                 regmap_write(dsi->grf_regmap, dsi->cdata->lcdsel_grf_reg,
                         mux ? dsi->cdata->lcdsel_lit : 
dsi->cdata->lcdsel_big);
}

'dsi->cdata->lcdsel_grf_reg' is of u32 type, it can never be less than zero.
So the above if condition is an impossible one.

Note: 'lcdsel_grf_reg' is set to -1 at other places.


Thanks,
Harshit
