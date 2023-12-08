Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11154809CA7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 07:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D18710E9DF;
	Fri,  8 Dec 2023 06:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC0710E9DF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 06:59:02 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B86sSiX025917; Fri, 8 Dec 2023 06:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=NjQF7MXdZjTExHqp/ZgNnorF+AQNF32ZumzNBeCTWEs=;
 b=bQcBUocDnklVxhNCkrqN2SHx1p0rDgUabRokEgqXwqKojE7Pn1fU8qqArb8lTemaRuxU
 Tow43a9lyym1uIpCk4KJXbQBThkO9TnIG8ZZEDGjFA3F12LM5ONX+MmVG4ydFFuCrkhF
 mMOrr05nqXNpvN+4zhwdLaEJtUwjOPDfsz8byYnx/QX9VMwK5An1U1x9ayfTEiBr4bky
 5BsOQ7xaD7KufC0OX0R59IUphgB+tj9Xx/t1JOKBvSQ+Ro7YaQVKf+4oud3DJnSy/A7j
 umnHT5J2XuZSCaJtNzPRGw7+k92uPDXz7/Iqe7nJHUQhWJbiUn6uJ5GJCur3+E3MIzfx fw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3utdrvnj2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Dec 2023 06:58:24 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 3B84MCuE016851; Fri, 8 Dec 2023 06:58:23 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3utan78uct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Dec 2023 06:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNUgQRtgqOQ+ypCpJVzN0laeYfCPaN+Hh4n4dOQv6fGWZBDlsYR2UHPAVa/mLHeK1SkxMCpgGjJlwEEpAsQ9VIK6FkGSA5JfhApJ8MdvUMkFwQvUJzD+xr+02iJU05cJZThi6oTl9oQYAdOUF1ipAtVDITAlLmNEZInXsOcCZjrGpQUfcozrWVPq4hzHFEhLPB/XuqO23PTt60t3Gw70txAem44QGUWdVq3to/dA0yvaWkP8jivZF2HGQ0XxvBca8nM+8MJsfRLkjeHXesr765KmsD6IWD3NbB483qUar+wo/LJMsA9swv6ChSKkYZNSxFZ8HfeGVh2VjrD4oH4KPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjQF7MXdZjTExHqp/ZgNnorF+AQNF32ZumzNBeCTWEs=;
 b=jjraEyMjO3kAALARIMIN3XQQGYEECcRGLtA1Yy/B0jqZZjnfiRcPZCO59Ue7u6XqnnDygYfNAChgba/JRswiSnphzaE2QAV/0Xv9EDvxVo3cHBxI18fBnNTS4ae/BKofRdnLqnXZcx4P6aKVFtGPpjLrzfThbMIk07g7+msU26c1SVHehcQywQFGqBAny1tc/W0HcFdANTFXiF7O/E7wfK0Ce+GPz6VP4Kgh6I2P6DRT/8AW6zGG/zcNPneSgZrA0iIzXkxJFqeogDdNXYUCEL2YxkG3niZy+iyDZTeaQyjOtFGRcM+ODZnzkb5tUnGC+B4kkumMEtefOnlZYvo9/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjQF7MXdZjTExHqp/ZgNnorF+AQNF32ZumzNBeCTWEs=;
 b=fqFODcOVouZCP10FBUsu/tH85ommcoRGsPJ9Za9yyY1qz75ss+jfB0JRkUCyBS5BhqpGRIVUqHaeMurvsF0Y8m+2Y1dNW9S/eO4I3e/+zSpAuxTy1cH43Wmzk9bEpw+lnLdGWfkwXAxfA/clgciRUbUVrREGv55fzVuRgoDzuEI=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by PH7PR10MB6986.namprd10.prod.outlook.com (2603:10b6:510:27e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 06:58:11 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::b7a9:b552:a623:84a4]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::b7a9:b552:a623:84a4%4]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 06:58:11 +0000
Message-ID: <5b12e656-65c4-4340-a714-9a4bc2980ebb@oracle.com>
Date: Fri, 8 Dec 2023 12:27:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/crtc: Fix uninit-value bug in drm_mode_setcrtc
Content-Language: en-US
To: Ziqi Zhao <astrajoan@yahoo.com>, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ivan.orlov0322@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 skhan@linuxfoundation.org, tzimmermann@suse.de
References: <20230716043411.4950-1-astrajoan@yahoo.com>
 <20230721161446.8602-1-astrajoan@yahoo.com>
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20230721161446.8602-1-astrajoan@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|PH7PR10MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 8501ef6e-9d44-47e9-f4ed-08dbf7bb0a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kb8NjkNbmVlKGjZetpbwTlZavUy6NY/F0qzUEJjzcnFPFkJSvxMP7mZsKsS6vLvcho5W1fkUVfZXqqlDv9yASbYDOm1NPq3cYDdXCyju+Fregs/AGxKZq2AcR5cPMM2dcAKxdnJNmxl0Qa19xcZfC+civ7Q3iJ/S4Hd4i3YMvNSCHCX56HuGDN7ibzxkHIy+1dCKkXT5P0AIpsZto1aSfDtPjQziQoqKibqM5SoAb/oI+zB8YL+2P8jWrp717vOJtwpkuzbysL1lOhWBD3amr88XuKTYLZ5jD4qQpipO+Kl1jcjhoV0VGNwUlkvHYwyhnEes4Rz9QkKNNsI4q87gO+x9+vNB9ECUJemZId5NuBYIS/mIQt0HcY9guWlSOlaNk+uowN9pyyGKF+uoiHPRfIrCNQPmJGeFgh5YY1vm0fGH+cSEZqbBd1GtPIHC283Ec8WMBkbGBycnx9htlVLfLCsn2C7RvKTQudQRcUz0pPMC5oIIo70uWFe1QAJiAbwD3Is6QWxiiyXZJlb8h7WnOc6PPyljev8Pcqc8joh96n2wbJn8DKtj0aKH9nu+zfnMr7YZOtj28F24zl8bgHh+8aIxkmxSq/gTrJVK+4LZnpuU6ABLDP/29OH/dSjqlkimprDMjMRweshfhWgJbsYTGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(26005)(2616005)(6666004)(6512007)(6506007)(107886003)(38100700002)(86362001)(31696002)(36756003)(66476007)(4326008)(41300700001)(8676002)(8936002)(83380400001)(53546011)(54906003)(5660300002)(7416002)(316002)(66556008)(66946007)(2906002)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHVpdWlEL1gzaXZVbXFHQ1dsT0VEYi8wdWQrT25iNzBhMnVjTUx2TlBUa0hy?=
 =?utf-8?B?Q0NCZnRNOGdJSGd1MVdrSFpicHJjeWNMQVBlM2dkMktENUJaWUpTVXF4cTNo?=
 =?utf-8?B?T1hZWDRhRFhMem9BZzUxdHhQSGJOQk8wRkNEcWlFRVBZUW9NR1U1YStQQlNX?=
 =?utf-8?B?eFdXa08rWm96d2xzTVRITkc1WDM3bUZyL21ieTFGSHlmWUdJTjg3YTZ1cHFm?=
 =?utf-8?B?aWptWVNkcjZ3SUVJbEZUdWw1NzVzbWx5WW1iTWZPOE5meDhpeWlRM1RuNk00?=
 =?utf-8?B?aHh0MERZSEUvOERzdWpBMkZIZHRnZG5QREdxa0xXK29uL1hzclhYZzVjRm9S?=
 =?utf-8?B?c2dydHl5c2JXT1hiSWgxY0FNSzgxR1VBL21IN0JkWXU5eTE4Wm9GQ3ErRXRx?=
 =?utf-8?B?a05GWjVmVFNQdnNQZ0xiRGRnNWpjODFEbTFiTlk2QzZ2M1B4UlRWK1JUeXBr?=
 =?utf-8?B?NUQ1MjdZSi9LYThMOUNnSkx1SGxsNG9rZExkalZVdktXT2lwcldzaTZBMndj?=
 =?utf-8?B?SmtpTEVsdGpFVzVEdlpJTEV3ak5aQkpoR2hFL0FVMmovVFdISVF0SUxYSExI?=
 =?utf-8?B?ZHVWQURGelVaZklEVHdqZngzWDZwRzNZQmlpRE42dHVDZHRSbmlqaHlPd3Rv?=
 =?utf-8?B?eWFERWYzcVBFL3JCckxTVndNaEFlbDZlWnhURTlPaVJiY05VMG9uQjZ5bncr?=
 =?utf-8?B?V0pvTVJOTmJCeERFL0JBMUh1cTc1WUNDU3JzeDlQMTlxQ2N4cnpZbllxNzNj?=
 =?utf-8?B?T2d5VmZkQXg3c1EwY2t3anQrSUlobmNOcU15cUhMMVBFOGUxeU1SZ0MwcUFF?=
 =?utf-8?B?aEhvSmkwYXFXSWhnaE02cGxUTFZQNHZEaVo5cURWWS93dUMvc1FjQUZXamxW?=
 =?utf-8?B?eXlpWUdmTGJseHZ3SFFRdkt5YTYwY1c0NUsrcnVwWWwwSktVQTl2UkZIZ01H?=
 =?utf-8?B?c0JuQW1Od01OVzNTeThGQWN2a0RLekVRVXE1Tm02elhoUDNpMENNK0dQRUgr?=
 =?utf-8?B?ZnBjTFEzUitWUWY2UUU1Nzl5WUsxbFdzRitINVNVK3JDRXBjZFY1N2Y0Wit6?=
 =?utf-8?B?OWN4NE9ESzFWMXhSUStmLy9FNENtMnY3V1c1Mkg1Qk9SZTdpSCtIQlFoZFpj?=
 =?utf-8?B?U2xoMWg2c2dlT1Y3WitlejZ2R3VHNXlvdzAvaHB6dDZTc1ZBM0lneEtJcnVo?=
 =?utf-8?B?WWFOdU92eCtoVEwvQUx4L04veldZM015MUx0NFlZamV2NXFyREcvbGd3MXlJ?=
 =?utf-8?B?bEhWVEFGWS91ZTNUczY5L25PQ3ZVOUI1aksyNzJhSTFxa0Y0UytubVVMSDYw?=
 =?utf-8?B?SldPbjd3WmFDQzFXL0VxY1djOFpWa2dORXFEeXdtSFFxbUljbVlnY1pHcUs0?=
 =?utf-8?B?UkZhYWU1SVVpYkEwNjVUODFSWnFzalBWM08wSWp3b0wvNTlSY1UvcjFVVjJr?=
 =?utf-8?B?M2hZTFVXenNQNUdqWm1TVHpXMmJ4K1lQdFdkb2NKbllPMTJjcWVhTUsvbzZT?=
 =?utf-8?B?N0wrZi9ZbHppd3lsUURuZUxlTkY2aVptT25tWGJyWnNWTElBN0dwdkpCTUVt?=
 =?utf-8?B?M1ZYdkNtL0xTb3REQ3pKeXJxWVBtRTEyVWNMMXAwSUdwN3dXcXJ6NGp1V2hj?=
 =?utf-8?B?QktKaFdwd1lMQ2IydmlUM0QyT29NZVJsNU9wTWdqV2RIRU4zdnRSZFc3K2Fa?=
 =?utf-8?B?a0pneWtRdHM5SnlhTlBNQXUwTFJzMkM0R3ZCUHIvL1RpS2xJalMvYU41SXhn?=
 =?utf-8?B?aFVzbmx2TVlYY2hNdDhKSXdNZFk2blMzTTZBT3haaWo1bWM4bVljaklSTksx?=
 =?utf-8?B?VE9KaXRFL3J0djVobEJldnpzZ2xVWlA4MGtRaWVUdFRac0l3RnJxRWJlcE5p?=
 =?utf-8?B?M0FzNDlnamF3bjYzZWJQaWM5Vy9WdVhvRmNWZTcyekE4TU1oTHExSE55ejlL?=
 =?utf-8?B?TG1LMjMzcm04QmJ5alRpV0dQSWRSRVNVT1JvRFV2aDB0eCtzRlhsdkp4bmg3?=
 =?utf-8?B?R1YraSswbEhVQUQxcTlRK1lNOU9TMm8zVnpCTFhCSlVWU3F1ODQ5Q1ZMUEJz?=
 =?utf-8?B?MWNDTmJhZTB6Q2tyV3pHeXFOTVlXdVg2VkliUXNyMmc0RmZueHpXbU8xUXEy?=
 =?utf-8?B?dzlsemM4czcvaG5PdlJ5S2JjcnNXRUZxUFpoNWcxS0VkVHVidi9VQkM1cGNx?=
 =?utf-8?Q?ScO2FHDo0+SHnxNgLnZX1dI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?WjBoc0tNWWVjSjRyWCttcmJQWkp2ZVZMQ1dnbzJ2T1hUdVBMSHFuL2ZPV2Jl?=
 =?utf-8?B?RjAyeUNzcDkrSUxncFBmNEFDR0p4KzYrS1NSVXk1UmE3ckZNMDlhQnROU2h2?=
 =?utf-8?B?WTNab1gwckhybXQ0Q2c0dW5FNURCS0F1aEg0ZTRwZmw3RmhUMEN2aExSNXV5?=
 =?utf-8?B?ZnBTR09BZDZEOHRjZXZ2ZGJtVzF1MCtHTEt1QkdhTlBHYUt2cGYzZ0JNNm05?=
 =?utf-8?B?TkZYL1k5N2pjS0lMTmJHWDVEUTFtb0FoOG1tYkYybG8yeWltWlFyc3Bwcm9q?=
 =?utf-8?B?NnZWcFhRd2pId3ErOUZqdVdXZ0NDa2Ztakc1Q29NNkwxSDhGQVBOUmt0RDdJ?=
 =?utf-8?B?TDM3STdYZko3Q3h0b3c1ZlhiVDUrR0JHWE5oWjNQSkU0OUFCdlJoYi9pMlBP?=
 =?utf-8?B?ZXR4ZkdwWGd5N3F5ZFcvR2dZQWdIaEhpRVB2SEJFRlNCY3o0d0V5bVJPY0I1?=
 =?utf-8?B?L0NaSUYxd3NRbm1kVW5nbHBNY0pKZWpnSzZtamh0Y0pmT2FTL09aSElQc3hS?=
 =?utf-8?B?L2daVEVEcE9EcTVVTUJ1MklMQTdBc2dkZlN3cmJISHBTR0I4TXp5M1hGUXdu?=
 =?utf-8?B?ZFkvNUpEZkdNZTYvY0FrK1FZNHRNRExVUERHaTR2TDQ5b0JtWEkxQzVDWGc4?=
 =?utf-8?B?bjJQUEsxQTg0TUNqYkZzclFRRFN5UTcrTDJ5OUMzb2RMWWhDQi9HRENvUnha?=
 =?utf-8?B?K1l4dUpadllnaEZOdmFjb0dvZUU0enpTTFQ1b1lKdlBhOGpJZjBlOVhlNitz?=
 =?utf-8?B?T0RnK3NEbS9kRXdxYVpuNVIvdHNHQyt2bm1CWnNEdFUzemE5ZUkwZjlVYy8y?=
 =?utf-8?B?R1dtQXQ4ZkFuRmEzai9LTnd3U045T3g3LzkxazVEUTFZbEdrTnlKK0NIbHV5?=
 =?utf-8?B?YkJmVWw2OFg0eEEzK0p1UVNyemhYYk91OFk3cmF0RWQyYTBhNmtNUTVhazV4?=
 =?utf-8?B?Rzhyd2FZcHpMUnVEQlppK0VqcWhzMXBwU1pFa3RNcWhZVEYrdmxGWW0rdE1y?=
 =?utf-8?B?cWdOeEF0bnNvZ0RFRXRnWGx4TDJYMjNmcmtFV3RZMWxWNW9hZzZhdlRLMHNp?=
 =?utf-8?B?S2VPYTMrd2FCMTRCcC9QeE9FRzU4NVpmQ2hwYWxtN1NRaHd4TEhEbEFaY1lj?=
 =?utf-8?B?OFNwOFVsSks1cnRBeDZlSmpxMDdaWFVFU3dnait6Wk9HRUMwK0NEcmU2VUVN?=
 =?utf-8?B?QzRjUU9oSkdOT2dtQkpsdTkyaUk0UHkvT01TT0FyTzhHZFlGMFdZWHJiV0F0?=
 =?utf-8?B?T0wzakQwbmRITXMwZXVZTnNKQkYxY2dkNDU2Zll6Q0pidVkyUUxIekpPamJk?=
 =?utf-8?B?aVkwWjQ1bWViRlMwakJyclpQRlpwYy9qWHI2b3AzaVJSYXpZTEF3Nk1lWUdC?=
 =?utf-8?B?d1FSTktEUFBWSDV4TXlIb2dZOU1Zc25GT0dsTjlEaCszbjlEZkFSb2ZqUi9n?=
 =?utf-8?B?a2gzc2RLRWV2bGJaT3Z3VkhMdmFOeVhJNTI1OXcvK05TSktHaWRtNk9CVEJm?=
 =?utf-8?B?dTdJQlkzUGIyOS9mVDE0YTA3WWZ0MXBXRStGNmZ3RDl4cUNUOTN5OWhiNDZZ?=
 =?utf-8?B?V1ZCdnNua3pCbDBOZU81SEh6TXZTK3dSRmRGUkRkRVBSOFJPOHB5RWppQWpV?=
 =?utf-8?B?YU8rSUFsNWtCK0lwZGNJdjMzNUFtc2tFR0licHdVRDE5TXIzcFA1WTlZVG1P?=
 =?utf-8?B?ejRFdGRxTWU3TXppLzZHU0hQUUgxQ0ZmbUU1Z1k3ZHcrZjZYRlBKajFRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8501ef6e-9d44-47e9-f4ed-08dbf7bb0a50
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:58:11.0314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYEV0b4fDQmk9fqtwTZ2hkYe5Q18v2CjfvcuDDycOiViUUteMPDHTf5MwFhss98TchdsQt+8Qv/hKOuEXKbI8DnTsmkoR51GZV5V0Iqnd3FFXxEgA8vwbJHnx4btt4cl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312080055
X-Proofpoint-GUID: bVGtuSk-hFcrU1MBYjupcVVD03tx_gfR
X-Proofpoint-ORIG-GUID: bVGtuSk-hFcrU1MBYjupcVVD03tx_gfR
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
Cc: Vegard Nossum <vegard.nossum@oracle.com>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, Darren Kenny <darren.kenny@oracle.com>,
 glider@google.com, sumit.semwal@linaro.org,
 syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On 21/07/23 9:44 pm, Ziqi Zhao wrote:
> The connector_set contains uninitialized values when allocated with
> kmalloc_array. However, in the "out" branch, the logic assumes that any
> element in connector_set would be equal to NULL if failed to
> initialize, which causes the bug reported by Syzbot. The fix is to use
> an extra variable to keep track of how many connectors are initialized
> indeed, and use that variable to decrease any refcounts in the "out"
> branch.
> 

This bug is reproducible on 6.7-rc3 on KASAN enabled kernel as wild 
memory access.

[  424.699429] general protection fault, probably for non-canonical 
address 0xfbf7c8b63d84d2a6: 0000 [#1] PREEMPT SMP KASAN PTI
[  424.727952] KASAN: maybe wild-memory-access in range 
[0xdfbe65b1ec269530-0xdfbe65b1ec269537]
[  424.743794] CPU: 3 PID: 9040 Comm: r Not tainted 6.7.0-rc3+ #1
[  424.758855] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
BIOS 1.11.0-2.el7 04/01/2014
[  424.774845] RIP: 0010:drm_mode_object_put+0x27/0x50
[  424.782854] Code: 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 fd e8 
ae 92 0b fd 48 8d 7d 18 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 
03 <80> 3c 02 00 75 1a 48 83 7d 18 00 74 0d e8 87 92 0b fd 48 89 ef e8
[  424.816805] RSP: 0018:ffff8881199b7ad0 EFLAGS: 00010a06
[  424.830847] RAX: dffffc0000000000 RBX: ffffed1023336fc3 RCX: 
0000000000000000
[  424.844180] RDX: 1bf7ccb63d84d2a6 RSI: 0000000000000000 RDI: 
dfbe65b1ec269530
[  424.854860] RBP: dfbe65b1ec269518 R08: 0000000000000000 R09: 
0000000000000000
[  424.870833] R10: 0000000000000000 R11: 0000000000000000 R12: 
dfbe65b1ec2694d8
[  424.886846] R13: dffffc0000000000 R14: ffff8881060731c0 R15: 
0000000000000001
[  424.901889] FS:  00007fecfc1ec740(0000) GS:ffff8881f3f80000(0000) 
knlGS:0000000000000000
[  424.910833] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  424.918929] CR2: 0000000000000000 CR3: 0000000117e7c000 CR4: 
00000000000006f0
[  424.936058] Call Trace:
[  424.936058]  <TASK>
[  424.936058]  ? show_regs+0x9b/0xb0
[  424.950853]  ? die_addr+0x55/0xe0
[  424.950853]  ? exc_general_protection+0x1a4/0x320
[  424.965905]  ? asm_exc_general_protection+0x26/0x30
[  424.974878]  ? drm_mode_object_put+0x27/0x50
[  424.982866]  drm_mode_setcrtc+0x7ec/0x1630
[  424.990875]  ? __pfx_drm_mode_setcrtc+0x10/0x10
[  424.998877]  ? ww_mutex_lock+0x9a/0x1c0
[  425.006852]  ? __pfx_ww_mutex_lock+0x10/0x10
[  425.014875]  ? __drm_dev_dbg+0xbd/0x1a0
[  425.014875]  ? __pfx___drm_dev_dbg+0x10/0x10
[  425.030321]  ? drm_lease_owner+0x44/0x60
[  425.030981]  drm_ioctl_kernel+0x2a0/0x500
[  425.040058]  ? __pfx_drm_mode_setcrtc+0x10/0x10
[  425.048128]  ? __pfx_drm_ioctl_kernel+0x10/0x10
[  425.055809]  drm_ioctl+0x58a/0xb60
[  425.062876]  ? __pfx_drm_mode_setcrtc+0x10/0x10
[  425.070875]  ? __pfx_drm_ioctl+0x10/0x10
[  425.078875]  ? __pfx_do_sys_openat2+0x10/0x10
[  425.086875]  ? selinux_file_ioctl+0x184/0x270
[  425.099093]  ? selinux_file_ioctl+0xba/0x270
[  425.102865]  ? __pfx_drm_ioctl+0x10/0x10
[  425.111092]  __x64_sys_ioctl+0x1b1/0x220
[  425.119055]  do_syscall_64+0x45/0x100
[  425.127106]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[  425.135102] RIP: 0033:0x7fecfb6f8289


After applying this patch, the bug is not reproducible.


Thanks,
Harshit




> Reported-by: syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com
> Signed-off-by: Ziqi Zhao <astrajoan@yahoo.com>
> ---
>   drivers/gpu/drm/drm_crtc.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index df9bf3c9206e..d718c17ab1e9 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -715,8 +715,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>   	struct drm_mode_set set;
>   	uint32_t __user *set_connectors_ptr;
>   	struct drm_modeset_acquire_ctx ctx;
> -	int ret;
> -	int i;
> +	int ret, i, num_connectors;
>   
>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>   		return -EOPNOTSUPP;
> @@ -851,6 +850,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>   			goto out;
>   		}
>   
> +		num_connectors = 0;
>   		for (i = 0; i < crtc_req->count_connectors; i++) {
>   			connector_set[i] = NULL;
>   			set_connectors_ptr = (uint32_t __user *)(unsigned long)crtc_req->set_connectors_ptr;
> @@ -871,6 +871,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>   					connector->name);
>   
>   			connector_set[i] = connector;
> +			num_connectors++;
>   		}
>   	}
>   
> @@ -879,7 +880,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>   	set.y = crtc_req->y;
>   	set.mode = mode;
>   	set.connectors = connector_set;
> -	set.num_connectors = crtc_req->count_connectors;
> +	set.num_connectors = num_connectors;
>   	set.fb = fb;
>   
>   	if (drm_drv_uses_atomic_modeset(dev))
> @@ -892,7 +893,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>   		drm_framebuffer_put(fb);
>   
>   	if (connector_set) {
> -		for (i = 0; i < crtc_req->count_connectors; i++) {
> +		for (i = 0; i < num_connectors; i++) {
>   			if (connector_set[i])
>   				drm_connector_put(connector_set[i]);
>   		}

