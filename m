Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 374A57060D5
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 09:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A3610E3CE;
	Wed, 17 May 2023 07:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426FC10E379
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 22:34:59 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34GJwv5c009521; Tue, 16 May 2023 22:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2023-03-30;
 bh=KszNgigIyXr6IGurj1a87gf10mjUh1WoLnmfpL53SCc=;
 b=ju8QUo5CZyPDSD9Pp5ycShUyKTR2uU7AzvJDLUMssEmRMq48m6K0GpWhhqx+6NgRo+21
 kO9Jhd4MhcEbwDpaT51VD4PFSlMO2gk+Tg1W2KmDVIdxdD2V9+W5kfpQ0KHcwu2B61mJ
 58+pXIjPeNiW1FeiGnCyLoCEyUYxmEEV2DODWUDgJvV0EtAN1/7wJKNSkAyXYpxvG1eX
 IdJxvTru71atviyuYkwqvGyttXZl18Q3Mvh4OociDx/3wmRmxcAp4MWM5QBPQ5J7bczZ
 TTSbk/3xn7uf8xjX+GratirKRwRT/Tzyu1yl7MLZhSgEKfuSCaSiXdu/c17xFicWa552 aQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qj25u49ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 May 2023 22:34:48 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 34GKe76B032195; Tue, 16 May 2023 22:34:47 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3qj10appkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 May 2023 22:34:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLtcOnio7IQ7hxrySSRxAi6ci20V8UoIsXR7It5oX5Leo6aUH1WVtnDQRwLJe1fJCiuG/j9tQcY1Bi5+KdN4ydQGBoNfQXwcuF4amoXTXFoRV+3fK5ljnMBDw1Q/5YSKIwWMATwZjZ+/EtbPBaSq9H4kTeQGU9BdIqK/TrXNJUab63vOTWFdSLT+8oYR2ZQkYMqqE67948k5airJ67pOCRn3rhfZN8GfpYhRqOYvlYid9xZXfcCwqRMK6wI5RyqEs6yoW8p/dLNvI5j55byswziN8LnEqmZnckjRcwOZwfwy89ImPVbye7A0rMNY7HF3Hj7DL2nGQmVWkYZ0J6Vv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KszNgigIyXr6IGurj1a87gf10mjUh1WoLnmfpL53SCc=;
 b=Bbw9F0Tz23LpkK8ibelj1RA7YLy/8XINXhLBbeyWOBrnHQFl4iOiuWTE4z6A+SRRc7iiT3vbSf/R3dk9l7VeIGyqTdCOdoydUrgVa7+WDkOwjO4bbFKjwwWztzBOqMdhcC6dE0Pvs3Hq+dNH2VQrncvv+2L35bYvIFbo/yPvQ7q77umERQ8PHpgtxCokPg9MbLtAcGbPBywvfSadMhTpfvoKBuhw/8YqSlNql08Z0fyaSLIhmTW3SgJbwx/VuglJ6wrm+YyNeqOgzttYMY5q2iL202Mj/zqX3QkM2qlD/dE7VPF8NcztHmhD7IQwadLyGPSDPpfEB2u8ADKQooF7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KszNgigIyXr6IGurj1a87gf10mjUh1WoLnmfpL53SCc=;
 b=e/sPXCfc4kQwwTs7U3oZOeWTZJEydA9fmMEya6iFeYmPt19ChM54iZITQZew+RRoBD/lJ4lVnS9UIWiPTcayOg5npFQGi7C7kvQMmky6Du54+lcqNF2Cqf++OWTUlMJWojNChVSqzu1z5ZwCHXRIGmP3bmckvrqd43YEegI88eI=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by BLAPR10MB5347.namprd10.prod.outlook.com (2603:10b6:208:328::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 22:34:43 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::ffb:de39:b76b:52eb]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::ffb:de39:b76b:52eb%3]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 22:34:43 +0000
Date: Tue, 16 May 2023 15:34:40 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] mm: fix hugetlb page unmap count balance issue
Message-ID: <20230516223440.GA30624@monkey>
References: <20230512072036.1027784-1-junxiao.chang@intel.com>
 <CADrL8HV25JyeaT=peaR7NWhUiaBz8LzpyFosYZ3_0ACt+twU6w@mail.gmail.com>
 <20230512232947.GA3927@monkey> <20230515170259.GA3848@monkey>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230515170259.GA3848@monkey>
X-ClientProxiedBy: MW4PR04CA0170.namprd04.prod.outlook.com
 (2603:10b6:303:85::25) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|BLAPR10MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: 45da6c16-e717-47e0-0726-08db565dbe6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HBmH2FmRiIrHbpajHP05fRrC0yZvpqHIR8Y8iil6rnfKAjz5EVY6HmnTXFLlNTXEqrgt+jXYUDODNGPnHTb/ZMeWIKOc8dPIdpEMy8fsYoqErVzzr7lu5SbyxwAAvA+MJrQ1coYPDVrPcXpWGjrFliBhna+2M1SReahqu6H6Y4RtLFINhVmNCVm15HlS2k+rSz31ZwcWqcPJ4C6UTubSCuP5ODfSIF9MiGWl8M5QxdsYD/4DO0KX1fw0BR+fxyLCanXlRSg1WWOAoIUNOwS9L/E75FmZwwtgSR4yHFy6yj6UVRwSAU1NmcIPX3kmivzOQHNLJJq+w3nfOaQ7Wt8uDZEvX5G/v07ZkpH8hCl/QjcjGHnb5S/hAtCwtwTajc9kuWoDceAtZFlL84NDRjUkfn49nSH72hHvgRl3//yd3DtcCvy9FLpdt8pNP7G2fgCPMUn0N3OfJ3FqCa7KlzBetFLR/OP0mhg+HMPIm6jIF81eQ8G6tKwRqo60zcn10GdKi6wMctdCJ5pKNDBHDj5GqVpx8xUeFMXmdNgjJ1ZZRlw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB4196.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199021)(186003)(5660300002)(66556008)(4326008)(66946007)(478600001)(66476007)(6916009)(54906003)(9686003)(53546011)(6506007)(6512007)(83380400001)(38100700002)(8936002)(8676002)(2906002)(6486002)(966005)(33656002)(316002)(33716001)(86362001)(7416002)(41300700001)(44832011)(1076003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk5ZMk8zbjNvcjBmb0xlZ2d3UnpkSmhFd25CTm5zUEFaZzh0VEhTTzUwOFF2?=
 =?utf-8?B?cSs2N2FxOTE3OUJhcHVQUWtEYjlHWWxXT245V3pKMEdUMWZyRWliRVY4UTJv?=
 =?utf-8?B?MFBsbkpSK0VKYjVRTlFDWVA1Ty8xLytlMWgxTk9mWERiMG5aeDVqZStlejB4?=
 =?utf-8?B?dmYrM2xFSjkzRDJTYnBwWWF0aEJpWXVDUUNZSGJnQ2NYTTcvODFaSzhYZGNa?=
 =?utf-8?B?MmZaR1FJRjN1Yy9rNFVoOUY0eEszVGZEeXdWZmVRMmhNa1l0TDhkOTA1aDZt?=
 =?utf-8?B?eGNxa290RHdDOGJNcUZGVTcrVWhRbFc2SGxwZ1hEYUVaYlo3YjF5bGl5ZUk3?=
 =?utf-8?B?NjE0eXFiRVZ1RVVuME8xMkluZkFWRTRNTFNtUHBRc3lIenVUN2pXWXlTRGVR?=
 =?utf-8?B?c3F0MmppNzJHS0FCY0tmYnpUTWpaWUlONHRJVTAxN0lhVzRtWSt0c1VESWZS?=
 =?utf-8?B?Zi9WMHZBamFKMkxBMlBHU09FbDNMeWlHK2pZeDVXTzdGelFVdUhOVVQrdkxl?=
 =?utf-8?B?Mmt3SmpCV2c4dlVUdWozUGVaS1orbFJWYzZkSWphWGJqUEtMRndQVndEaUFT?=
 =?utf-8?B?Zm1KcFQrOHVJWjhlY2hOME1pTm11d2xNK2E1cmU4M0pDa3JueDZUdjNtQnNh?=
 =?utf-8?B?QXZRTWExTldVMGU2dm9YbGo3c0FpK2wweUlENWJtWkxta296MGZvSTZRNUdq?=
 =?utf-8?B?dytxaHdmcVBZM3lxS2c0OElQNWZlNUF1Ry9jQXl5NUNjNE1MTTlZdmJMcHcx?=
 =?utf-8?B?b1BQbHhrN2c0K05vdnZicWR4aDFTMUdqcUtqUlF6RE1HbENyMU94OFBmZjM3?=
 =?utf-8?B?NWo5RkRPYlBkKzlvcWNoeHpZZi9sMk9TbTdsdWpPZ2piVTBkUUJ0RXEraWxt?=
 =?utf-8?B?Wm40c1o0U1F6YzZOMkFnWVJLcjU4NW5ZeEw5aGtQUFlPYXY5a2M3TFZJQ3hy?=
 =?utf-8?B?dlpBcEFzYmpCZW42YjJWMis2YnBOVGxvYUFWcGFvUzdlRDhFQnRBTGorNHo1?=
 =?utf-8?B?M2JrQ2dnaWh2VUxWSHJuYkc2cGl5T0V6ZHl4MldsWENwYVlFL2E1bkZRdWI4?=
 =?utf-8?B?OFNHWlNnQzdSa2Z5V1RKN3cwTEo5UTArdUhrdDd4T2d0bHNQeUFxZy9xdG1x?=
 =?utf-8?B?TjN6SVoyaTFBcmpXSEUzVjFwRVlXQUNaMi9wOFI3RDUvSEJRUis4eEpZdXZG?=
 =?utf-8?B?SzNxUXh4TzNLRzNBVHhUZ3RzWHVtZ04zWlZnaFdDQXErUkRVMTFTQnJhYjhG?=
 =?utf-8?B?TTl1RkxiRGRPTzlYcjFBbGhvajU2SVNRWWhZS2dpb1lBU0tFVFp6ajVaNnV3?=
 =?utf-8?B?UElyY0I1VS9iMXlCZzI3WHlLdlJnZzU2V0RiY2JPSE9zQTQva3dpR0Q0Ly9D?=
 =?utf-8?B?MVBJZGdCR3UzaHZnamliUEI3TGkzNFhaY0hZZXQxZitHUi9uSTdHa2M4eUNz?=
 =?utf-8?B?cFBWeGF3NU11a25HMDMvRFo1Tkw1NUFtRmFYVnNIMmwvejg4U3dwcWJobjlC?=
 =?utf-8?B?V2I1MXVyb1IzSmdBU3BFYVVPdjNZY2ZkckgzbHBTVk84U3hwNGRvY2p1UFI4?=
 =?utf-8?B?N29mZm52WFdSd09pTHF3TWxZSkY2SEpwaEgyV1I3UzNPTDV2UmlZZ00rZXdY?=
 =?utf-8?B?aEMvYkxsdGZEY1hnUnZpb3RmeXlxZGhqeS9kMzNCV3hqREszQzEwQSsvalJt?=
 =?utf-8?B?cWtvY3Zic0M3SkszcWduemJCcWREK1c4SE1NVmR3QTg3aTBtQ2xCVytvYXJI?=
 =?utf-8?B?SHE1NmRxRmVNMFJ5My9Bb2VvUmQzWldWZ3FUenhmZ3hCelhLVUN1bDdBeC95?=
 =?utf-8?B?eFpFZmJxNTZHTm5EQkhUeFl4Q1RqbjJkL0ZScEFzc2wwNkdZMGdjM09uejJ4?=
 =?utf-8?B?djNaVzhyNlZaUUZiWmNaZDBneVJLUW8rNXFWWldvYjRiM3h1VkIxUXhwMDdZ?=
 =?utf-8?B?T3FvM3JkZDR4VWQzZ1pnMFE5cnNVVkdBYktqVzEvSWtjM3I5NUw2aEE2bE9S?=
 =?utf-8?B?NDBvVEd4VUVZckFUZWVEN3hQWDYxMjBac0xGOS9GL21FREoyMzZUSG9SYUZn?=
 =?utf-8?B?R3N1R0RnRmFDcFlGNEc4bEw2bjlZdEE5aWVVSzhiYjltcmJXS09ycTIyV1lh?=
 =?utf-8?Q?SXsvvOjB78qtxh9oxElSSTj6c?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?U09peEhQWDE4OXVqTXdhYjlJa21xSXNmd21XelpqWmoxSnN5YkNIMU1DTTEv?=
 =?utf-8?B?TnNzd3dmQ0RrQlB1aldVOXNYTVVyVmRQSWJTd2tLcm9CNyt5T1J3bWFHZWFU?=
 =?utf-8?B?TVV5YWNOR2g1Q2xrQUV5YWo0VkU0eEY0emk3VGNMUGc2dzhEaXZtZFF5bUk0?=
 =?utf-8?B?b1BrNXFuOCtLNW9OeFA0TmN5aUF3VXhxM0ZOM2ZuZHBYNW1keVFMejhYQ3JK?=
 =?utf-8?B?MU13NGd5SjM2Y0tNbHFpUHhrNk9xbjJiUmFtakFzelpJbzFVdVFnVENiK2tZ?=
 =?utf-8?B?T2hWR0JTWHJoaWlPc2lSd1ErczdLVkRCSk5Td3FGUEVqYXNTL3M0RU9Sd09T?=
 =?utf-8?B?VVhQN2dkdmRMMWF2NEZYMUEybGNNeWs1aGtqR3dBWFFFUHdEQU1iUXhLNHk5?=
 =?utf-8?B?RnFURVUzS0hsYU1LbWVmOUVHbFNpMjFVL1E0WlkwcjhjZElwcXYxR0pMQW1D?=
 =?utf-8?B?WER5dS9LNWtOVktYb0hzU0RRdm9icFRKb1hVMmxRR3pNNG1Oby92ZU8zdE95?=
 =?utf-8?B?bmFzWERPamtOTEttS3BnS1JYMTBlS2kyTW5hTDV3UGhsdzlxSFViN1NneW5E?=
 =?utf-8?B?TGVYMUw4QUYyMisxRURFMDJZUTZYZGxGSmlqQmpBbVB1WmJCRFFFZlBhM3Iv?=
 =?utf-8?B?alFJN0I4VWJQbzNNRnlPSUlpV3dQS0FjRWZGeXBMRUozMng3K1hjUHpBR25k?=
 =?utf-8?B?VHpwY3NXWkxIaVFDY0N4NnNnVnpRUlNCQ0Z3THdhSVdkR0tBVWE3QmdXNkIv?=
 =?utf-8?B?MVNXUFhkazc0SFUydHF1Wm0wazBneWdBNGdWSlQ1UFV2YjZkQzB4ajJlVk12?=
 =?utf-8?B?QWhNVlU4dEZYV0lPSVdmV2dMNGczOHBxZWxyODVFaHE5OXJVekQzKzh5ZVZF?=
 =?utf-8?B?ZWpoMFdEaFYwTTQ0a1d1eEx0V285Zzc1aGpoMW4xSHl4ZVVlOVI4bmFJUlho?=
 =?utf-8?B?enEyVWI2azBxb3ZLL0Jsd1l2bkhvanRoRTBETUlHREtQRTFlVjJNK0dvVnF1?=
 =?utf-8?B?YmNzV0lBUnpGNnJPNnFTYVpoMnIxbUw2ek1LMnI5MVpGaUtzbU52bk12cU5s?=
 =?utf-8?B?K0xLZ2x5UlhuQkhYemxSWlQrdHBZOHdpRDhjVVVsSFhhSXlhSHM3elRuUjk4?=
 =?utf-8?B?TkVBcXQrZFlwMUF4ZjR2SGFhVi9keldnWTB6MFBid293cXBSdEh3Nmt0ZTJn?=
 =?utf-8?B?WVV1ZlBnb2xPY0QzSW9wTWNXYkhxR2Jmbjc5S1MrVTBRVWUrTFV2R1BpVGw5?=
 =?utf-8?B?RG5pQ3lwQUJxS09WWmU5cm9kZ210S3VaTjN1a3dMbE8yUS9vQUhtSlhMWm5k?=
 =?utf-8?B?T3BqeDQrWUxhRUlIMEdIRXNqK3R5TFduT3ppbHBGMGpiTXI5UjRoMmxNaGdo?=
 =?utf-8?B?Q0JxdVhCTUE2NnVxdTFXeUMzV0Jnc0pEanJaU1hwZUxjRmZVazd3OFljOXFh?=
 =?utf-8?B?L1hhWUpVZWZQZHpjRWE2dXhSTEpRNE5NbExVR2pBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45da6c16-e717-47e0-0726-08db565dbe6b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 22:34:43.3589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFXvYl9TtwWQGP0pLfRpvQliTekTAiwIuXtHw/DcbZMGaZg0yO6MuZSUcjypzierpTwtVhIQ9J7KX8raO7fJoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5347
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_12,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 malwarescore=0 mlxscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305160191
X-Proofpoint-ORIG-GUID: 8MxbqlCkclpuAuFZIZLhg-Recc0T8AJ7
X-Proofpoint-GUID: 8MxbqlCkclpuAuFZIZLhg-Recc0T8AJ7
X-Mailman-Approved-At: Wed, 17 May 2023 07:08:54 +0000
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
Cc: mhocko@suse.com, jmarchan@redhat.com, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-mm@kvack.org,
 James Houghton <jthoughton@google.com>, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/15/23 10:04, Mike Kravetz wrote:
> On 05/12/23 16:29, Mike Kravetz wrote:
> > On 05/12/23 14:26, James Houghton wrote:
> > > On Fri, May 12, 2023 at 12:20 AM Junxiao Chang <junxiao.chang@intel.com> wrote:
> > > 
> > > This alone doesn't fix mapcounting for PTE-mapped HugeTLB pages. You
> > > need something like [1]. I can resend it if that's what we should be
> > > doing, but this mapcounting scheme doesn't work when the page structs
> > > have been freed.
> > > 
> > > It seems like it was a mistake to include support for hugetlb memfds in udmabuf.
> > 
> > IIUC, it was added with commit 16c243e99d33 udmabuf: Add support for mapping
> > hugepages (v4).  Looks like it was never sent to linux-mm?  That is unfortunate
> > as hugetlb vmemmap freeing went in at about the same time.  And, as you have
> > noted udmabuf will not work if hugetlb vmemmap freeing is enabled.
> > 
> > Sigh!
> > 
> > Trying to think of a way forward.
> > -- 
> > Mike Kravetz
> > 
> > > 
> > > [1]: https://lore.kernel.org/linux-mm/20230306230004.1387007-2-jthoughton@google.com/
> > > 
> > > - James
> 
> Adding people and list on Cc: involved with commit 16c243e99d33.
> 
> There are several issues with trying to map tail pages of hugetllb pages
> not taken into account with udmabuf.  James spent quite a bit of time trying
> to understand and address all the issues with the HGM code.  While using
> the scheme proposed by James, may be an approach to the mapcount issue there
> are also other issues that need attention.  For example, I do not see how
> the fault code checks the state of the hugetlb page (such as poison) as none
> of that state is carried in tail pages.
> 
> The more I think about it, the more I think udmabuf should treat hugetlb
> pages as hugetlb pages.  They should be mapped at the appropriate level
> in the page table.  Of course, this would impose new restrictions on the
> API (mmap and ioctl) that may break existing users.  I have no idea how
> extensively udmabuf is being used with hugetlb mappings.

Verified that using udmabug on a hugetlb mapping with vmemmap optimization will
BUG as:

[14106.812312] BUG: unable to handle page fault for address: ffffea000a7c4030
[14106.813704] #PF: supervisor write access in kernel mode
[14106.814791] #PF: error_code(0x0003) - permissions violation
[14106.815921] PGD 27fff9067 P4D 27fff9067 PUD 27fff8067 PMD 17ec34067 PTE 8000000285dab021
[14106.818489] Oops: 0003 [#1] PREEMPT SMP PTI
[14106.819345] CPU: 2 PID: 2313 Comm: udmabuf Not tainted 6.4.0-rc1-next-20230508+ #44
[14106.820906] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-1.fc37 04/01/2014
[14106.822679] RIP: 0010:page_add_file_rmap+0x2e/0x270

I started looking more closely at the driver and I do not fully understand the
usage model.  I took clues from the selftest and driver.  It seems the first
step is to create a buffer via the UDMABUF_CREATE ioctl.  This will copy 4K
pages from the page cache to an array associated with a file.  I did note that
hugetlb and shm behavior is different here as the driver can not add missing
hugetlb pages to the cache as it does with shm.  However, what seems more
concerning is that there is nothing to prevent the pages from being replaced
in the cache before being added to a udmabuf mapping.  This means udmabuf
mapping and original memfd could be operating on a different set of pages.
Is this acceptable, or somehow prevented?

In my role, I am more interested in udmabuf handling of hugetlb pages.
Trying to use individual 4K pages of hugetlb pages is something that
should be avoided here.  Would it be acceptable to change code so that
only whole hugetlb pages are used by udmabuf?  If not, then perhaps the
existing hugetlb support can be removed?
-- 
Mike Kravetz
