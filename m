Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA3D70465A
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12F910E310;
	Tue, 16 May 2023 07:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D078610E043
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 17:05:01 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FGn9De013024; Mon, 15 May 2023 17:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2023-03-30;
 bh=eRvq/c11smzl3R3QhCffwfLNH/SE1d7pqnC1VTcq2Ms=;
 b=I7EWmP8CVoz8DFYNeWVlqq0BNNQsYBtp81BgQWFzcuClWQ+5w+uW4Ba/dtCKj9kdO7TT
 GExGAZpmnZN1/qaVAOKX3LZWsn5PuwP7PPaEnLVfHG0nlYXLpqGUGE7gSh305vI1sRMN
 U8/ZTwWoChgnorwiEvqy22V8G04rL2Rp1upGZCW2gvvvP57gCgFni4POJCkXNchDbWGX
 ZTIH31MQ0yGUyAPtO7T67ADiMmXRipEJsqhsuukOuLtdkGvpn7C0rH99Idv4m8PkMnq7
 KmlK+oY3W6qLbAhZVqj94b8JVYBBvxdzI6e7hYuz8mtUFuWFTIihuVmwy+2cOKj35vCG BQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qj0ye0fmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 May 2023 17:04:49 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 34FGrYuc017862; Mon, 15 May 2023 17:04:48 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3qj103dtkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 May 2023 17:04:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqfi9Gr9ZEirFwvOxVMdoTw/6y/SCldBFIykBjCqz9J9VRiavMgGEhp+A7JuFnl4j6nLAjQdRQGCMwnxcjawoga+mplI+bPPSUZYzSknAwn9vAc7EE/OZO1v+jZa1mjs0LkT77kaTXCFl72An/8zVKbT3afPS1kFuHL9IzGI6fLbQ03RcUl6sDUYZkN5V8+Q2TRbJv+QMYrKTDW/drN8X+Py8aVdTd2yqZvsrqWK+I2kLzQ+loGvqZn3ZF4Xizlo9ZzZa1upgB9Hn+4BynqyXCqerAdbXsEza3zBktK4Z1GJ+K0aj50AxYpCQE8eT2t3n1/RdlHVKqgx7cDBZ6kMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRvq/c11smzl3R3QhCffwfLNH/SE1d7pqnC1VTcq2Ms=;
 b=V6K5kZLiEZd3athUGcPfdq9d9cFwRZXLJZhYzY+dWyVExX+tep5g/GNR2JME/YoAE03ybJ3YlKL6at9l71s5ckKHBFHu+Ph79N1Ea+dYdEiNTI3c0273aC2ja3h83Uw/+PR6vyDMs8rgEYtNH4U41iAHcg4nfC/K+obnz4puOKi1D14zX8NXj1lCKowI5+yBcI83Ha8a0t3imAaWzh2PcKZXtb3GkgL6YD0pFapJOI75AmyFQeCVayGEARLbdCcNfdDtOOTdyx0Jo5ZaqPDszsYjtEFsPuF/0Iv+lD/1UufXlQh4Cf3rUBxb4OigQu3nPzaEe25aDnOkXjf7x32DlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRvq/c11smzl3R3QhCffwfLNH/SE1d7pqnC1VTcq2Ms=;
 b=BKiqwj35j/2LzUe9PvSk3CFrwz8alYs2SzVrLJ8yvgA1+J5xpB24ncSmrMUJCjX1Krseznll6dKYOdvN60f+bvBHExxIltCy4oSl+4OBjMkFojGcs1+YJr42jSvvkvHDBhYTeMWCUTV8dUs1mwVuLssLr6iFFY3oBzNGtlfuizw=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by BN0PR10MB5288.namprd10.prod.outlook.com (2603:10b6:408:12c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 17:04:45 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::ffb:de39:b76b:52eb]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::ffb:de39:b76b:52eb%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 17:04:45 +0000
Date: Mon, 15 May 2023 10:04:42 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: James Houghton <jthoughton@google.com>
Subject: Re: [PATCH] mm: fix hugetlb page unmap count balance issue
Message-ID: <20230515170259.GA3848@monkey>
References: <20230512072036.1027784-1-junxiao.chang@intel.com>
 <CADrL8HV25JyeaT=peaR7NWhUiaBz8LzpyFosYZ3_0ACt+twU6w@mail.gmail.com>
 <20230512232947.GA3927@monkey>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230512232947.GA3927@monkey>
X-ClientProxiedBy: MW4PR04CA0053.namprd04.prod.outlook.com
 (2603:10b6:303:6a::28) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|BN0PR10MB5288:EE_
X-MS-Office365-Filtering-Correlation-Id: 76dda704-0b76-427a-6123-08db55667bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iM8eFFu4XahDKdy34GxBGaWEVEyJRf1eA7Klg9rL+05LI2d5qow/OK/9CksCUFcyJEGE815MPi/LvBVe/u3DS2mijKLpcPs7cQNSAzFhyL39CY3mBQ3kT2AWLCQ0IfIsFz/Ssm5T9apG0BMgiIWd1OfRU0lpUiSJP3N9TEZ9s/HcUtJ4Ingybip2GwFcjqNCIDdYdCEtxogGzzmXgNE6PH1VM61rjMen+YDEc+r6q8eUymXAhW2A3dWRVWlFnh55oFDjAsOPwYrReKn6EK8hWLCjIEj2FaFLI2zzE7dtFL+jgbdc4z7mifxhpx3LTuao0PLLGHkY+mmadfet8ifYGIW3IS2kP8aY/RjbflR4vHGJ4+FM+atzb5b3mJ1K9o2/MXl6ZOHc2YaBoZbIJQPu935eN2iuNAnbjzZQU2N4XdgHu62xG6vA0XE2SFEX16Whg2QYfAtIgglNcT4+VKmVzGnzOwoE8CfhwNkDr3JQqj18dnDJ2FXj1y9cZVYjr4fTwp6hpeI0Dj7SAtLPSWLJlZE8Hop1hDHCZE2vO20kMXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB4196.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(38100700002)(1076003)(186003)(26005)(83380400001)(9686003)(53546011)(33656002)(44832011)(6512007)(2906002)(41300700001)(6506007)(5660300002)(8936002)(8676002)(7416002)(6486002)(478600001)(966005)(6666004)(66556008)(66946007)(66476007)(4326008)(86362001)(6916009)(316002)(54906003)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHByUlRCTXNKOWtNZ2pPaHhTK01GZm5FdEdwNGVMa3Zyc0dTUzV4NE9qL1ZR?=
 =?utf-8?B?M2pNNndKZkpDMG1pOFlwekRBNXhBbnl4S3B6U2NWRUk0VlBaSlluM21OVTNI?=
 =?utf-8?B?MnkvN1lENHhQdlJDZUdkZS9DdW5KWFBlOEIxd0grb1UyNjB5dXJKMkZxeG01?=
 =?utf-8?B?YjNaRW5WRTRJTWx6dWpHSkZZb1dzNXk1L21XbllVaitibktVU3JMVnVmQ0lZ?=
 =?utf-8?B?VGV1R1hSZzExWEVsUzkvaFFNTGJ5QXZmU0EyVERKWHpLNjBVYUZocFNMWWRW?=
 =?utf-8?B?THBGNWJVQlNLa1NZdERyTDN1aVE0VU5vSFVpcDIvejVSaUhWb293a2xuMEtV?=
 =?utf-8?B?SDFEVW9JVDEzZlkwREdWZzg4dUhwR0Q4dC9ZUWJDMWhLZlZIY3JVUmNmZXNh?=
 =?utf-8?B?SDhMN004d0ZsOXVUdlErTUZBZFZqMG4xSzFGWFo1OS83TXpiYlp6NFJ2Qzl5?=
 =?utf-8?B?VUNNd0ZLT0krNWw0SGJRYnlMYXNWd0FxcjN4Q1pJRkNJRDBVN240MEdmOTZE?=
 =?utf-8?B?a2QzUDJHc3BBYkUrb09Uem5BUWZmR0FycWlJVkJRMXBPeDduWmVremMvNER5?=
 =?utf-8?B?STE2RElGNWNYOFkxeEJWL1VXVkRzYkZyZTJrbnRZb0tSOWs4aFhQUHRmeFNu?=
 =?utf-8?B?SGR5cy9aVzhjVWQxNHpuNkhHUUZlbVFtc1lGSlo2UEZOM2dlUEtrcDBmdGgx?=
 =?utf-8?B?ZkpYK2RheGpWUW5na1ZKeGtwNWlFc0lkc3NYSXZQUERJV0psaE42U0hXb3JQ?=
 =?utf-8?B?SFhUd0twMjEvYnZ4UjN4Q2pONm9uOEcyWElUZWZJMGpYdzRVTmJBaDhmV2dW?=
 =?utf-8?B?SFJMditjNDhrV3hKV0ZhdTEzUWpyL0pDNUVlY0JKMThVajB3UEgycHQwSG0z?=
 =?utf-8?B?N2owSDV5Q1psTXIwa3VTcVhVOWlQOHo2SmJmbmNCdE1YakpRV05NNG8yY2x2?=
 =?utf-8?B?K05TSDJ1eTc2MytnelhZZUs3NTRleXltS3dIV09SaUhjcXoxU3NYUERDdW0y?=
 =?utf-8?B?ZlhxM2sreG83MEU3dUxmb3VoQW1JVEttdkwzSDZ2YjJhY2orRkV5QlJoVlZx?=
 =?utf-8?B?Rm43YVRsaFZMdWtydzY0NDc0QU1NOUNNekFPRFpER01NZHlwSTBRb0Q1MEll?=
 =?utf-8?B?WU1ZckttVWhkZGpyQUN4TkRGbkhVaGdTaEhodHVZdXkrclUwaWZXNTExbFVw?=
 =?utf-8?B?cU5qcDhCdm4vUmFnWVQzWFdDZy9EVkxkVmpVNUhGMWl4bWxFLzZiOUJaZzQ4?=
 =?utf-8?B?cHJJQzIyenpkNXVDT0lxSTZxakpRUWs4eUkzdkZwWlgyVFVOejdXYmZRZXhB?=
 =?utf-8?B?K2FURG1xUUszelFnTld5NXBKenFiUTRGQVpPaHgxMlkvb2hZOWdiRmxWQ2Fu?=
 =?utf-8?B?VURsQ2M2b1lOVDBSNzFydmVmWmhPY2FjVUtYeE9ZQUZVZWxJYVVSYXFNMm4y?=
 =?utf-8?B?ZUFTdEFkOVhCYkE1b2VyQjlFcFp6UzhSY2RFNEMvSDYyNWZpS2tHT1FtOW9v?=
 =?utf-8?B?SWZhenIrdUZCcWdUV3g0OXZUQnM4QWFpVGFqdVVtdGpiOWRRaHphMzA3d1Jo?=
 =?utf-8?B?MUhVM1M1QXNzeEZ1RVgxNDZWRWduTHgyWnRPZWcycDJxQ3d5UlY5bmRxZTlj?=
 =?utf-8?B?SGhvZHY3K2VIdExrVEMzL1liVzRHQzVMZjUyUkRuV2xPNHI2UGliM0Z1c3hM?=
 =?utf-8?B?SlZVbU1FTHpuUmRVMWFhSUhCdkxscFhnSDYxWXA2ZDBRYWJMdUhnbjFaaW91?=
 =?utf-8?B?Ym1QNEFvMWJ6MU43aW13NTV5SE9qRC9qY3hiSDlhYUNOdVl3aWl2V0NCaEpk?=
 =?utf-8?B?K28wR3hwYlNPUS9ObkxWY3NWYVNPcHY5ZzhvOEVHUHVyZVVmN016TVZFU1A0?=
 =?utf-8?B?RW56YUhZQXRvajVLUTV0MS9kZVM4ZE9xcmdUOCs1UVd2YW5kR2RDVXY4enpO?=
 =?utf-8?B?Nkk0RDhpNjZ3YmR5b1RpK1lkdWZtZkFnL3VVSlRVT0VwOWpCdkFsNWVHRzdk?=
 =?utf-8?B?bUpFK2JvL2xQc2VFQ2dsU3BnSHJQNDhWclpzeGhtSFVvNG5xK2hHK1FhMUh3?=
 =?utf-8?B?aFR4UkZBOEtyMmM3cXdXUGZwMFM0RGVTckdOY2ZVbE1GZWt2bXloSjVPVm8w?=
 =?utf-8?Q?3CfIQBQss0IkRjXtuOcsXLqhf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?SDgrNzFNRmJYTjE2aGwzR1o1NytOcjgwLzdGbm9pN2pjOUQzYjNQZEZHZDI1?=
 =?utf-8?B?R1ZydjRXcFdJYVFqTUtUL2dTUXlJSHZhVENqRVZMcml5KzB4b3N0MlI1bktY?=
 =?utf-8?B?RFA2OWFjZnZ4eE5IU1BXYVU5UjNHVmFWUEpjOC9kNHJ2TG9HZHJkLy9oV2Iv?=
 =?utf-8?B?OENVRi9vVC91UmtMYi9jT2Fnalk5dGZLN3J6S0VmdmVVb3B0c2FZWFpuUUdQ?=
 =?utf-8?B?bEhRdjMvSWk0M1gzN2g0MTJHWHBHNVVEWTV2SFBPQTlGOWZZOS9vZmZEUUJB?=
 =?utf-8?B?K29xU1VzelVwbTVvVjQ4dXV4cWhpTkdDS3lqeXZqRTJyQmN3ZXFNM3JrZ1lx?=
 =?utf-8?B?MmxLeU9TaUg4V1RvQzdxemlYNkNkRDR0Si9NaGwwUHR5TmJINHRnckErMHkx?=
 =?utf-8?B?VkdxR21IYXA3aGVyTm9FMU5IWlkwT25VUFQraEYvUEFJTGIvWmkzQnRwQlNW?=
 =?utf-8?B?M2Z3ME1oeUw1U29JMVJvWkFyWk1DMklrTS9nZzNIbUNKQjV4VEExTUlFcXcw?=
 =?utf-8?B?UXQxaWtzQ2g4UDF1azN6engyQlBNM1JNSU9wM1V1SmVHR3Z2SWhSM21mcGE0?=
 =?utf-8?B?eFIwblZpbXQvWmZXMWZKNGNjOUJtMGJZbCtkcVlLUmdCeDBaeUJoZG55MlVl?=
 =?utf-8?B?UW05S3hPb1JUdXlUcUlEMk9hcFlQMWJ4ZTF4R3dVYjFjdnFRbU1iZGVxSzlO?=
 =?utf-8?B?a3RvcmxTS1Y2VXFhQTFJWTNKTnRudU1LQU9tT1hRQ1FqOU9MSmpsTDNZZERC?=
 =?utf-8?B?MXdaWk5PZTNocUN3bUJ2bnRnU1BHRU12M29vL2tISVhwVGtaU2JKYm1oRnlS?=
 =?utf-8?B?MG1TYXJCUmh0Wm82RS9aUnVBNDY5d0Jvdzk2SjFCZlBGTlUxcmFVZWZXeCsz?=
 =?utf-8?B?NUhlQXpTQlQ0ZEZKTi9xS3d5Nk1UcDZaNW1hSk5XekMxYm5MWmhneHd0Q3Bj?=
 =?utf-8?B?b1k4bGZHMlBKQVliWGdDUTc4OHU3YS9WR3F1emJ6OEIveFdJWlN1NjV5dyt4?=
 =?utf-8?B?N1UwWEVmYThZS1J4Y0NVTk5HTGZCVFdpM0dHbHljQm53VlFTbU50RE1HSEZV?=
 =?utf-8?B?OWdwTC9LVUh3aXUxMEJiOGdocXdjQXFYTys1SmRiWm9jQWlSQlZiWklGYlJ5?=
 =?utf-8?B?YzFTVjRrY2ZqNUxWc0JiMFlJcS81RGdvRlpzajNsRjNpYTJZMU5OV3B2b1BZ?=
 =?utf-8?B?d3kzcko2RE1SNjhXbDdmRVRnT2RJUUpWbi9MRFMrUmp4RytOUG9mTXhUeHNx?=
 =?utf-8?B?c0tmakVlWmJVNUlUQndOQ09FTWtybmMyYkZsck5rRDlyUnU2MVV6RGdNNEgr?=
 =?utf-8?B?SEpscU9IT0UvZ1gyckcxZGFrcGlFN2pGbm1hWFgzU2VpcEExUHpkYVJ6MFpW?=
 =?utf-8?B?OHhXVWpQQkljTTFvcCs1OVBkTXNsTmZNZ0IzcnJ5Y09LNXY3VmVPTGJYSXpI?=
 =?utf-8?B?YU9qekd1MXpnM2xlYmw1eDlzN3RKajFsS0FpT2F3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dda704-0b76-427a-6123-08db55667bab
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 17:04:45.5951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDEwF2qi/2s4lMwWYRkI6fGLr6N4zmsGzBAb9hXiGS0mKCzudlbl1ZxMNp2WkxlpgUSy+D+dbj2ubNuaklLusQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5288
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_15,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305150143
X-Proofpoint-ORIG-GUID: fyGno4xvYyZ4ILaCv2jdastJaHIl7e2L
X-Proofpoint-GUID: fyGno4xvYyZ4ILaCv2jdastJaHIl7e2L
X-Mailman-Approved-At: Tue, 16 May 2023 07:27:39 +0000
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
 Gerd Hoffmann <kraxel@redhat.com>, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/23 16:29, Mike Kravetz wrote:
> On 05/12/23 14:26, James Houghton wrote:
> > On Fri, May 12, 2023 at 12:20 AM Junxiao Chang <junxiao.chang@intel.com> wrote:
> > 
> > This alone doesn't fix mapcounting for PTE-mapped HugeTLB pages. You
> > need something like [1]. I can resend it if that's what we should be
> > doing, but this mapcounting scheme doesn't work when the page structs
> > have been freed.
> > 
> > It seems like it was a mistake to include support for hugetlb memfds in udmabuf.
> 
> IIUC, it was added with commit 16c243e99d33 udmabuf: Add support for mapping
> hugepages (v4).  Looks like it was never sent to linux-mm?  That is unfortunate
> as hugetlb vmemmap freeing went in at about the same time.  And, as you have
> noted udmabuf will not work if hugetlb vmemmap freeing is enabled.
> 
> Sigh!
> 
> Trying to think of a way forward.
> -- 
> Mike Kravetz
> 
> > 
> > [1]: https://lore.kernel.org/linux-mm/20230306230004.1387007-2-jthoughton@google.com/
> > 
> > - James

Adding people and list on Cc: involved with commit 16c243e99d33.

There are several issues with trying to map tail pages of hugetllb pages
not taken into account with udmabuf.  James spent quite a bit of time trying
to understand and address all the issues with the HGM code.  While using
the scheme proposed by James, may be an approach to the mapcount issue there
are also other issues that need attention.  For example, I do not see how
the fault code checks the state of the hugetlb page (such as poison) as none
of that state is carried in tail pages.

The more I think about it, the more I think udmabuf should treat hugetlb
pages as hugetlb pages.  They should be mapped at the appropriate level
in the page table.  Of course, this would impose new restrictions on the
API (mmap and ioctl) that may break existing users.  I have no idea how
extensively udmabuf is being used with hugetlb mappings.
-- 
Mike Kravetz
