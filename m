Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 214AD72790B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E71810E59C;
	Thu,  8 Jun 2023 07:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C376D10E549
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 20:53:30 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 357Eq4gn017987; Wed, 7 Jun 2023 20:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2023-03-30;
 bh=udAoJcq2QGDf9tztWKxUstSjlzObDVoLZNkP41tcv64=;
 b=tVVaMkPlpmmuJIsJF9sPTyYG10ec/Hh8ihmX/6hliT3/FnYBJ/VXfevLSa623/HK9Utl
 WxeYNS7WmvoIrnWkBUKPhEgQSfmh5uh+7nkKvFVWsZiTcmQbYxc8kr0ICT5cke+8AIsB
 oswX4EEC9J0i/npOlovgijO2pgK+ZASGWBhb/gp7YpGdZ1V+9UO9W3TI94ssKJ+sFmPj
 j6X4tXJDT5wO6RGrHZSMHpfdmdGVIixOqqHllsjeo60IE4dvLta0ea0xaQd/cpA+D8O3
 LrmcQ7vSIzmOqs9X/BdB85CyEwml2PNo5EudrI3COa/fjfkxRgN+6JsfsoRHuVHvml1e 3Q== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r2a6uapum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jun 2023 20:53:18 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 357KRWPS003069; Wed, 7 Jun 2023 20:53:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3r2a6ksh3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jun 2023 20:53:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ea/0iUMccqdzMfcP66SHGKGG6SR1KIfHWnIJ/8jZzTSMX6C5KIuS7iz4xLE/1tzwaf17oofs5T2XZM+hGKalGbx/NdY2R8DHtgbKy+QPRssCVVUVJPjKX2Dx8ElYwQuHwqH7lA82EBVgNuds/UGp/PhHIQEce2piCvbFxoFQTWunSsunSi03cZmqGHfSlz+j4CdX8zm8r4fBX7ShuCEKqgt2KpqxeNOhwsrj1jsdSbTNQtSLksELMUBLxV7DhdP+wmYIx+G9z+XR09hzr1cz+ttttBaZASzEfiVmOGES0mimshRK2nUgFjaAuvIwIWeFxPCHsoLYNTozvdSEeslttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udAoJcq2QGDf9tztWKxUstSjlzObDVoLZNkP41tcv64=;
 b=ETX6HT1wq9MIsDT5t7s67W52CWGzib4oXLHK5OKAW9EYncMnTrjPN2No7J5kR2sFq/wPjAl5/5kcUR4rWNtkZV6HzcjgKEW+XCv3Hf085u9sOR6CVNFW8q14ZJxCDYOu3xQVGRluk/RW5oxxBawec10txzNuVuBmyxe2l0LkzbjwS8D/CV1TECxRnVUDhnyIlLAJ8+k28Xr1HMIXONXe9YB+T75r88M1HoZ4tt1p/yBe7Dkq0uDXhJLbOss1qR36lKadPYvuGDsuNzW5L1fwswwfamSOzJzf8AhJLwKvNMBgEfTQE5Hk1qw2i2N8Ijg8kLbGmMBNIdzkIg84J6pz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udAoJcq2QGDf9tztWKxUstSjlzObDVoLZNkP41tcv64=;
 b=WGW/ApWT+VTB7so787mja6Kg+GNgraX+MNj8Ui1ZH/HcoggfM6c6ZSKCQa7dUBdirtDvEAdLuRufABxTVw93A/spUbxCXvYgR31XppTkAIaHilB53NsXBzGUKt7RlR91nR7zll8TyB8Dc5tRvDJkY1fzz0m0rFqeXIeDKM03rz4=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by SN7PR10MB7003.namprd10.prod.outlook.com (2603:10b6:806:34d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Wed, 7 Jun
 2023 20:53:14 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::4a17:13b0:2876:97f2]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::4a17:13b0:2876:97f2%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 20:53:14 +0000
Date: Wed, 7 Jun 2023 13:53:10 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm: fix hugetlb page unmap count balance issue
Message-ID: <20230607205310.GA4122@monkey>
References: <20230512072036.1027784-1-junxiao.chang@intel.com>
 <CADrL8HV25JyeaT=peaR7NWhUiaBz8LzpyFosYZ3_0ACt+twU6w@mail.gmail.com>
 <20230512232947.GA3927@monkey> <20230515170259.GA3848@monkey>
 <20230516223440.GA30624@monkey>
 <20230607120312.6da5cea7677ec1a3da35b92c@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230607120312.6da5cea7677ec1a3da35b92c@linux-foundation.org>
X-ClientProxiedBy: MW4PR04CA0062.namprd04.prod.outlook.com
 (2603:10b6:303:6b::7) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|SN7PR10MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5fa812-31b0-468b-aa6e-08db67993652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5lWCNlL3auYc61lIWXl/wfWI7J4Sr2V+2cRHvjkLbw/cE5oiVkgg5H8//VyrT9O+obAYi5iDGIpyekbq79LLPTD9duVkrMzXqnfDacIrAH8K8LdUSd3xQEO1+rXoyT9o1eSNCbBC08ciDKNrP4l7ERutWhIFumfttnyHj2t3MXhJu6/glLX7bq7WqbWN3YEbpDHSGvWTp1Rj4mMzkWTjT65msGsL7P1Ktx1xyJNGzkFjO69zynI94zGUu/we53OvmUnSI1JBoyj2e5b4uJOiElU+ushIDA/iON6kGVC5xGAXGmFsksGjqSLALT7rnMiSBnRCxs1EA33HYLbHx0jKhSTDElILRnJA2Bh+HteUMBHNmJ7nzSyJN9St9wGjUcpdVi2itIYgQt43yg/eeVoiqXNyMFgFpvsIfvcYqqIEg+BZWf1femVK2x7qYqJydE0BuSnaOZp+LeIxM9pvZkAUnb+gfMdoTt37e3GaxKRrt+W75e4/k8kU9xLBwYG7+dK2LVx8nwCh6YJetUE5/bOumH5bbsUEGFB2CnPYkL8tFus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB4196.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199021)(41300700001)(38100700002)(8676002)(8936002)(6916009)(33716001)(5660300002)(66556008)(66946007)(66476007)(4326008)(7416002)(44832011)(54906003)(316002)(478600001)(83380400001)(2906002)(966005)(86362001)(1076003)(6666004)(6512007)(33656002)(6486002)(26005)(186003)(6506007)(53546011)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sml0YWJsMHBEVnJWbVNseTBXOGg2d2N5Q2g2dXNKQ0hDWjRJandtR3pWQ3Jo?=
 =?utf-8?B?MTJYaUQzYVdVQlh6VUZ5eHAvSklCYS9qUmZwT3hQa0xydkplT3dWY3ZkbHBl?=
 =?utf-8?B?Y21mRjhRQlc2Uk04MWlzd2V6UDVuUXNOL2xpRkRrVG11SzRmci9jQWs5YXZB?=
 =?utf-8?B?ai9jSTk3Mk9lQVBXUVdVc1hudElXUEkveGJEZmpKR202SmhyZnZNdDBHTjgy?=
 =?utf-8?B?VHRiZzROQ3VnMWllcnZvWnB2NTFLTzR2TmhLOEEzUmJ0RkhqeUM2dVl2eERO?=
 =?utf-8?B?RnMrclRlUHkxTFNEZ2tQLytrRWszM1dVMGNkS1RGRUtWNkdLWW1SSDJvWmxa?=
 =?utf-8?B?YzJVbUltaXNTREY2SFlVSWZXZ0hzaDRQZ2haMWFYamlWdmxRTjNyaVBiTnd6?=
 =?utf-8?B?N2RxampjaTIvSXJsK3dGWFQxTkpCS1dsMmpjRkNDUy8vbXRZcWt0d0tONWZE?=
 =?utf-8?B?NDlrUGRKVlRqMURKUW8yR1MwMUNaUGlGUkZjMkhacjNrdGF1WHdFelNtRjJW?=
 =?utf-8?B?RjNhdjMraGZobFNDcnpLRFcwSWdkSmFkdXRuY1U5MERzZ0YwWTZ3WWNUYnU1?=
 =?utf-8?B?WHRMV1RoS0RIV1N1VndXajZPaEpJSEh6VTRlV044cFBOTmR1MHNtOGVobktT?=
 =?utf-8?B?L0x4Z092RnNacElWSjdldDNnK3hWc1lRVTZDVWYzbU9EcVpLdU5lU0ZBcDQ5?=
 =?utf-8?B?bkVIcGhTcVFkeEdXbTBMeU16czJsZzRuejFMWmxkbWN5MXB5eEFEYlBlQ09J?=
 =?utf-8?B?dzNDTnFkbmlHR0Q3aEpSU3BXUENQdXBnRzlCM2psZjNSZThES3QvcFhZTnJG?=
 =?utf-8?B?UWJsd0dncGFiTHZqRExtMDRuSU92Qk9YVlZ2dXo2VTc1Tmo4UVB0M3RyVFlS?=
 =?utf-8?B?b3B2M2w3QkdyakdXUFo0aVdTT2NtcHVoWFAxa3FudFJHTkNoVytDOTNrMENK?=
 =?utf-8?B?NXVOWDNPQnUwa2lLaEUxajlJVVZYREZmTzMyL283M1RvN2ZDZE0xY0RtOWZj?=
 =?utf-8?B?QU5XNkgra045WU9yU2tWRG4wNHNZUEV1amVZRUdyZklTTEFUeXdYVzc1VUJ0?=
 =?utf-8?B?dnNoRjV4TSsyVlZGblphRll4U0hBWjFPMzhxWGpGWk9pKzd5MVhwZkwrR202?=
 =?utf-8?B?b1dXQ01PMC9nVjBPbW1oY3ZyaUpXQmVUQ0JRSTFBbk5VVitzSy8ySzRLRTZV?=
 =?utf-8?B?d05LSlhBUzJiK2VWRlRiejQ4RkgrbS9EcmlOd1hmMEJUMmlsMk53UzYybzlQ?=
 =?utf-8?B?aGVYL21ZdDBYSXd4aEM3WUQ2QzhzVERWbFJWeHE0ZlZPMDJwZlYxRGNQMDJ0?=
 =?utf-8?B?dmhDV2ZmWWVxeXN0aDZTRlBjRmdHUlRMS1JTYllueitpRHZEKytXVzh6cGVs?=
 =?utf-8?B?dHVYek9qRkNyVDNkdmFBTWhtWnNkajZzYlRKOFJsRldRcS9JelhMMjJydk1v?=
 =?utf-8?B?SFQzTWhmM0I4UHpkeGF1MFk1emRWVlRRK3cyQllJUnhrRGtpRmpoUW5XaE41?=
 =?utf-8?B?Y3lrZnFHcU1pYUl6dk5XRmNNNkRQNDBmekR4aEhnNGtMaVFYOGNzYkpzR1pk?=
 =?utf-8?B?Q3psTHNXdHhFWXE1RXBrM3FRTjd5YmZtMXZnbkh1V00vR2krWmU5YnpuN2lG?=
 =?utf-8?B?T05XMHdBWUJEcU5YRVlTR0ZFcVhDTnhQZ1ptbEI1YjhoaDBCcUszVkE1ZENS?=
 =?utf-8?B?VS9WWkU1VFZYYnRTeDIvVndXbmJZa0ZoaUt5OFM4UTNFcmo3akxITmtsYnpC?=
 =?utf-8?B?N1BCcXNzMThibDVpMDR0OVRjUjhZQUUvQ1Zzem05Y1pYOFdqY05XQUJPRTZo?=
 =?utf-8?B?ekNIMnU3NW90MVlOcW5zaEdEQ3oyOWRzOWRGWDE3Vm1MQzg0cHNRK1ovVy9q?=
 =?utf-8?B?d1ZWOFpBV2ErWjl0RENWa2xBc1MwYUFLMVBuQk5BaDRWNzQ3V0g4RzUvSmV6?=
 =?utf-8?B?ektiVXBidWhUdWYxWTR3aXllMnk2ajg2ZVozVkVic0wrQ1Y5bjVCRlRWTC9J?=
 =?utf-8?B?OUROMVFyaXNvK3ZWTDBibGEwSXowdHJTNVRWK1AwYnd4Ykc5VWUwRUdMNUZl?=
 =?utf-8?B?cU9Gekdzckx1NFRuYSswVUNhYzRrNDAvdnZtSDdNNFVwOEM1V254VUtWcEpq?=
 =?utf-8?Q?N2ez0T8SWu/w/1kb8kCU/J0/L?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Y1JCOC8rNW1KOEZtMHljajRlQ1hrSy9kZk1yNFZuZUlseUxxR1dmTnZ4dmY5?=
 =?utf-8?B?RXZyS1hmdGtmZ1l3WnhYU2ZvMkpmeGQ0NDlFeVI5WkdlSkJxcS9zdXFhYzlv?=
 =?utf-8?B?THZuQUhhbkwrSloyRzhKVm9rUFNYUTJ5Z0REQ05FcngvbThBekg4a2FIbWFM?=
 =?utf-8?B?QUEzZ2pzT3hhNGxaMXN5ZXJnaktxM3Z4bng4eE0zUlljNHU3YlJhSFJFNmti?=
 =?utf-8?B?SjVTTmFWRFM5Q1NrOFlUMmJGcVlKaWNBUVhLeG5MQTNuZnJjNEc4Yi81dHNO?=
 =?utf-8?B?M2lPQTdRdHVBOXZkZ25zN0FCYUx1NHBYTmN4aXY3QzRHTnF1cnFSamgxZWpQ?=
 =?utf-8?B?RFI1NUpjcHVNNnBVVGJ5U01NaDdQZFJ2d2lLRjZsNXhkZzBMTlIrTEdYQmZh?=
 =?utf-8?B?RVhkNG1ZWnN2bS80OS8wZ3dVWC9Jd3BKYWlmZWQzTzRHWmJjN2tMcWNOaEFI?=
 =?utf-8?B?VXhBTFQrYU1PQWFWaWlFaWx3T21jejgyRUtyb01waTVNbFJub2owdWNpQUpO?=
 =?utf-8?B?UUJ1Z1FYSWNwWTd2a2E0NUZuMFNVaUppdy82Q0RSMzV3Smt3ZGZyNlZaN3Fa?=
 =?utf-8?B?enEzTEk3bjQwN0RVZ0IvYW5OY2VoZFhYOTZMbzJvZkdvbVRMaUhxcndPL2Ja?=
 =?utf-8?B?MUVYNzAwSXhMVGh5bjIxQVBnWjlQS0tVcXB1UmlBblJBZEZjSzFjWjMvY1ND?=
 =?utf-8?B?OENiOFVhd1NNL0k3UFlrSVNtTDBka2FFNmk3UUZXMjJYdWJYa2VBbHczekxw?=
 =?utf-8?B?T0xrbjVqNVh0WEI2S2xqUDhMZWVWSzVWakpTcWR4WHJaeWNybzRyQkJWdFdR?=
 =?utf-8?B?S0ZzV1NEN0lsZWVuYS8zMm5ENzAwMWdPTWI4VmozejJXeUphSjVIc1ZtTlhv?=
 =?utf-8?B?dnk0MzZNdFN2Y3NNNEY0K3ZVSlR0Z2pyTDZvYUtNZVVlNmVVSTNWYWdnRGF3?=
 =?utf-8?B?TGdVQ1pmUFp4c2krbzUweXQyeTcwNk9GSCs4SWI5UzVkOE1CS3J4d2U3L1VH?=
 =?utf-8?B?SHBGbWVZVlN5eCtJc1JDTytaTWtMdDd6QmdjZURUUUlQSUVhR1Ric2VyVkY5?=
 =?utf-8?B?T2Z6TFVuc1dlODVLcU1PTWh5UnR2dEZkUG0yaHJ5MnJwSWdVUEhqeEZnZHhS?=
 =?utf-8?B?aGUwNk81SmFnL1BBVlVEK0hLbmVKS01HUlBBR2RxRW0rVFFtdldkcFlyV3JO?=
 =?utf-8?B?T28zV01NTFZGbW9rTDJBMTVnSlVkWTlPMFkyRGd1aThDNGJXUXRPVk1ORWMx?=
 =?utf-8?B?QzNTd0dpTHhCc1paSTdqWFUxcmllbUt2dG1KcjVKeVp6TmZXNzFjb2ZOSGlI?=
 =?utf-8?B?Y1h5NmJqOFFDSWkxdUlHY1ZGZ0VsZ1VjcUphME9ERjdGS2FBekgwMnpRc201?=
 =?utf-8?B?MWFDcnZ0eUdpbE0vb2FJWUU5QkltemNjRDlQa1phcllNTDhWc1p1aUhkMTZW?=
 =?utf-8?B?U2Z6U1JYemJCODVHRkl5b0YvS09xalhaNVhydktBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5fa812-31b0-468b-aa6e-08db67993652
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 20:53:14.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GdCH0HhUiFx0yXczPCgZ8KinhT/Tw07G4hHjlxuyxBfOBpUdF3mLQ889QKANixLuLwTcyiaGhazhShTHxuvFMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7003
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_11,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306070181
X-Proofpoint-GUID: 6ZTmBt3e6C5d4jYZU7Gxi0wudqFqrOWL
X-Proofpoint-ORIG-GUID: 6ZTmBt3e6C5d4jYZU7Gxi0wudqFqrOWL
X-Mailman-Approved-At: Thu, 08 Jun 2023 07:44:49 +0000
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
 James Houghton <jthoughton@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kirill.shutemov@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/23 12:03, Andrew Morton wrote:
> On Tue, 16 May 2023 15:34:40 -0700 Mike Kravetz <mike.kravetz@oracle.com> wrote:
> 
> > On 05/15/23 10:04, Mike Kravetz wrote:
> > > On 05/12/23 16:29, Mike Kravetz wrote:
> > > > On 05/12/23 14:26, James Houghton wrote:
> > > > > On Fri, May 12, 2023 at 12:20 AM Junxiao Chang <junxiao.chang@intel.com> wrote:
> > > > > 
> > > > > This alone doesn't fix mapcounting for PTE-mapped HugeTLB pages. You
> > > > > need something like [1]. I can resend it if that's what we should be
> > > > > doing, but this mapcounting scheme doesn't work when the page structs
> > > > > have been freed.
> > > > > 
> > > > > It seems like it was a mistake to include support for hugetlb memfds in udmabuf.
> > > > 
> > > > IIUC, it was added with commit 16c243e99d33 udmabuf: Add support for mapping
> > > > hugepages (v4).  Looks like it was never sent to linux-mm?  That is unfortunate
> > > > as hugetlb vmemmap freeing went in at about the same time.  And, as you have
> > > > noted udmabuf will not work if hugetlb vmemmap freeing is enabled.
> > > > 
> > > > Sigh!
> > > > 
> > > > Trying to think of a way forward.
> > > > -- 
> > > > Mike Kravetz
> > > > 
> > > > > 
> > > > > [1]: https://lore.kernel.org/linux-mm/20230306230004.1387007-2-jthoughton@google.com/
> > > > > 
> > > > > - James
> > > 
> > > Adding people and list on Cc: involved with commit 16c243e99d33.
> > > 
> > > There are several issues with trying to map tail pages of hugetllb pages
> > > not taken into account with udmabuf.  James spent quite a bit of time trying
> > > to understand and address all the issues with the HGM code.  While using
> > > the scheme proposed by James, may be an approach to the mapcount issue there
> > > are also other issues that need attention.  For example, I do not see how
> > > the fault code checks the state of the hugetlb page (such as poison) as none
> > > of that state is carried in tail pages.
> > > 
> > > The more I think about it, the more I think udmabuf should treat hugetlb
> > > pages as hugetlb pages.  They should be mapped at the appropriate level
> > > in the page table.  Of course, this would impose new restrictions on the
> > > API (mmap and ioctl) that may break existing users.  I have no idea how
> > > extensively udmabuf is being used with hugetlb mappings.
> > 
> > Verified that using udmabug on a hugetlb mapping with vmemmap optimization will
> > BUG as:
> 
> BUGs aren't good.  Can we please find a way to push this along?
> 
> Have we heard anything from any udmabuf people?
> 

I have not heard anything.  When this issue popped up, it took me by surprise.

udmabuf maintainer (Gerd Hoffmann), the people who added hugetlb support and
the list where udmabuf was developed (dri-devel@lists.freedesktop.org) have
been on cc.

My 'gut reaction' would be to remove hugetlb support from udmabuf.  From a
quick look, if we really want this support then there will need to be some
API changes.  For example UDMABUF_CREATE should be hugetlb page aligned
and a multiple of hugetlb page size if using a hugetlb mapping.

It would be good to know about users of the driver.
-- 
Mike Kravetz
