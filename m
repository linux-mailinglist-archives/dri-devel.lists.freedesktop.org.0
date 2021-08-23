Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FA43F47E2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 11:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B66889B51;
	Mon, 23 Aug 2021 09:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE16889B51
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 09:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKN+9ZHw/C17Vam9XsGsfi3su+K9401OIA1uSwly7JGtJw+RERbQsPTzx+WQVk0gLNG2Y+EWqYdiKn+zp7iBvYiaYTN7bQub5P7bMvFp1j/K8UkCL3UohOWAS/r6XNtb5juvae4Ulsu20QLEOTV288e70z4bhfSivwY71etInv7pS4OK9XuOtbVPBvfLR3iU++axZTdkRt240zOypug14Q0wChfLT0PAXjguk3xKipG5mb4Wg93G0p2tFF2YWLz6W+r7Xfe6av89uhnaCpkJttIg5EOgfKXXd7O7YOK6t+eWG5kTMpMQ5VcR7+BNlxcWTj8QaldCzmI9lbQls+Wtmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZriJWtfojYPktbciGJr2WwwID39QgkWCUB72AkRe/Y=;
 b=eafxF/k+6TZHHzIbBoDpsZrkRol3Ze6hbzJVjgKDc5KbZWNm5hsqMl3Z9NRonTEuxzCJxH9MegoSrzGapEulTZWcKHLQBouNswJcbrWjPXQHsPTRlsTXkJIVRYJTUDaLnpI4rhMgCGTQor2EIUupXYqE+RfwQ552k0Q9NoBCohP4a2LSK8X3UiUBb0bzFqncyuZhHeML1WtRatLJ+r6TdeeZ5+FCpupTAFJ8sg/WnxPfBjEOTqswI86l/DjFmaiQSTDHaCiPOoCpCToA4l4ppR8bCCvkuxM4d4mvbXkqWPSZoKnRtSp10kNyAZ2f6hqiY2gOkw3CatWYIhCkkZbRFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZriJWtfojYPktbciGJr2WwwID39QgkWCUB72AkRe/Y=;
 b=WNLZGVVUEH/C2W+ca4N7HnGhlUwS8MbmSflX2HMF4YotoN1Kw5IqBt45CQXwIkLeam81l+8goEGV2CF2zvGPgMRt6dMoRg9d8l8OCV1/0311lHK3Pu97UTP08CwByfcoinaEssPyKIThba1Qh2qrImGuwu90l8Obobekebj28cE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 09:11:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 09:11:04 +0000
Subject: Re: Un-acked TTM patch
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <4da1794b868adf5de899c43bcc0780a6a10d492f.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6f7555b1-f533-4bb5-1d11-07228f55d145@amd.com>
Date: Mon, 23 Aug 2021 11:10:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <4da1794b868adf5de899c43bcc0780a6a10d492f.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0090.eurprd03.prod.outlook.com
 (2603:10a6:208:69::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR03CA0090.eurprd03.prod.outlook.com (2603:10a6:208:69::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 09:11:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac51c9e6-134e-4419-4ed7-08d96615eee4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4207:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4207D5E5C3E42EF47E1107AD83C49@MN2PR12MB4207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UhYQIz09pp15EttR845LmcuItweYLDQfl7wBq4AIWst6Uisjziu1O1hTTTlqnVT+v/DNkeNmWDDSIodXTWF/V/BiWJNeLfeeHA73E4XstsYSr8N0TKk5eX0R+3ntaFhsYu7D9JNYxW4Lj1B0rB7nlRF6iS9KF9/WRtw9pcZO1kASTpjMlVOwPUIHUSgxbESQFUWOP44vku+mA5KKs5MySrgD/pP1M9FCjadusyDnaDT1+aIeqVL/Xob61d2U7fhPZplmisEK9/5LEI+IxMQD5BA6HiTJQvYsnkGxY+Le/+Tam8BXMdqqdJ0LDmL3owlx0w+sDrcSXhnst3hBw4jjXGHsjLXkW7GQATO60IUXqKkdLQGfEYel7aGBajzulvEDiB4xvnQg/rAkFdy5GT8OTuzylSPpsmSstOiM+lM+cJxbPq2qGEN0LvFa3wSjhqvJej0ynlgYDu5PipVBc8ltdm1aKuuBYm2QIWzsAEs3JaAJUSUyyKvdgOJ3KGbMrnL3TfSrB0IcnnhnUe2h3uRV3bmkDHuBUh0K1+xxceTwVWA75CYc5gqJ44UQio/MFtyBm+/iVFjvzYo0Bp6BuRJxS4qgY6yU+ZGJa519kb8jYqDdD6doZI+dZ+U7pyLc5braw7QDJcD/aTiA5mQZcOMXFBqphPQ0O9kKriXfuDG90Lp53auhg6KtuJKb6xn5WyoQxdqLsxHA6s2IjWZKPpCu+5dVuGjAMuUo2d1Gvcnnv7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(956004)(83380400001)(2616005)(26005)(3480700007)(186003)(2906002)(45080400002)(6486002)(36756003)(38100700002)(316002)(66476007)(478600001)(16576012)(966005)(6666004)(66556008)(66946007)(31696002)(5660300002)(8676002)(8936002)(31686004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGtXdzdVOU5nUEJaR0RqbkJ6cElkSFV0NkdYczZhTmFaUlhlYmNlN2t6UUNS?=
 =?utf-8?B?THVLdmtSd3JzUThrY1Q4QW9rajFKVVlsbjR2cEE5bnlPejdmbzZpZ3ZHTkMy?=
 =?utf-8?B?UUtiWC9LL1RNWHJHaWExNDJHYkUwcmlJalVac3hjaG1aSWpDenRKYVdDZ01D?=
 =?utf-8?B?cm96RmVXZk5iTXFXWFJIalV0WVBtQ2FaT3h6ZnA0N0lmRCtxRHZSeE5EUit3?=
 =?utf-8?B?Z3cxL2R0NWFRc3ZjWWxQSmxKNjZoelBIUUc3ejdPZXlzazVKZmVJMUJKWVFu?=
 =?utf-8?B?QURNaTVpcXBJaFJvUlkvbHY5ZE8rT1pZb3JrV3kwc2hWcU9kVjJQZEgrdFEx?=
 =?utf-8?B?OXNIWEt5cDRUc1BjckJib2tMdHBYK2IrY001RVdITTJqbG0xNmd6Qnk3THkw?=
 =?utf-8?B?S2Y1TnFxQ205QlpYNTBKY04xTjJiMU10MjkzWTVpUDZXaTB4UVlKVzE4K05z?=
 =?utf-8?B?RUpVYXc3VUFxYXFLWis3ZmpCakJrb05jd2pLY0tnc2ZnNG5vbmhOOTF1d2dy?=
 =?utf-8?B?QU5Fd2U5dnZuMWFnOGUxMEo5S3dYbnVLUW9BMllHZUtXWVJ0TzhlOEgva2FW?=
 =?utf-8?B?bFUrNVBCMzZSYnZ4a2ZBbUtscGlRUmRhVnBic1lVRXRyVUFtSDFTTmlhRVBW?=
 =?utf-8?B?R0ZtZU5xcHgvQW9La3RjVFU0UjI1cTYwaDVZNEJQb1gyZTJ5SkpROVFBWE55?=
 =?utf-8?B?NW55U3JVRFBRalNrOFNUTzhKRVFQMnZpcWVHeDhLTXJReCtKbllCK0hkZk1p?=
 =?utf-8?B?Ti9ZOTFSV0NLcWJDcGZXYXBsSlF2bTNPelFOT0tsUEpuMGR4YUhzMC9YMFp4?=
 =?utf-8?B?TlllQlExM0VBK2lqRk9wRExWbm5hMzhjT1JtWDVjelB0TW1Qb2c3TzlrVlpm?=
 =?utf-8?B?UHl3WTBqcnBpaG5MSnVJMTVUS3gvZ05HS3ZVUkRVOVZ4b2M5aUUrOTFDNEoz?=
 =?utf-8?B?ZGdkS0dBTTVUQ1k1UWtSbVJBSHJrOWxtNldZSWRwNFIydjJGQ0hYZzVVdG9E?=
 =?utf-8?B?em1yWE5Cd1FLQTJVdHBYYjdWUUZEV21GajVmRXJ6VlJERDhSU0RSTHlMQlAx?=
 =?utf-8?B?UnFUWmlrRnBLZFI0Y29jTkNzcEkwZW9PcEphSDduK3pUUHFmeG9YSFdmeTVX?=
 =?utf-8?B?RDZNYm4vV3FpWTlmcHV4OTBBMlpDY0RpVklkSlhud1VTbFNXWm1sZlhuYkt1?=
 =?utf-8?B?QWFxM1pkbU1lUXFtS0pSb0hFR3ZzNFFoWnl6TjNET2VnbnNRRFhxVEZxWHVj?=
 =?utf-8?B?Z21WK2dla3hvcGhMUzF1TGFlVjhGMkxRVFdVT20vbXEzeml4anlZemxDalE3?=
 =?utf-8?B?SUFDbWxsNlhIR0JEMTloUjJsOTB1Q2EvQzMvUlorVVQxR3JJTnhwcXRZaGpM?=
 =?utf-8?B?ZmxzdW83T3ZnMkd2NW1NNmYvekI1QnN4VWhPRVNUc2oxR3loUUU1bVIveGQz?=
 =?utf-8?B?cTkrRmZ4YklhL05BWUtuaGJJRnVNbmJqVEd5RUhHakxUY2w0WldLaUQxMC9B?=
 =?utf-8?B?Z0RaQ0dOR3lnK3pzdmtVcFoyVnhLOUpTL0RnK2VhaG85c2JrZjQ1MytTbHZi?=
 =?utf-8?B?YlpLQUtDckMrN05YbTB5enRKdUFNcTMxRFZIbEk4QWhQbzl1RWIvVDB5N0Nm?=
 =?utf-8?B?cnUwalgxelB2dklKQVFKclBnQ21MenNHNHdaMjNiQk9IdjJtZWYrbUtKQm1l?=
 =?utf-8?B?NW0wemxaa3Z1Q1N5YVRVR0kzUDc2TFU5SWFuenprV2p5ZWVMeW9xSGxhNHFY?=
 =?utf-8?Q?Yh7IgGx3a08S513S0S5D6rn+iIdZDtdnSFZXQAI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac51c9e6-134e-4419-4ed7-08d96615eee4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 09:11:04.1779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZ46aJnWjqm9zp5asTXqmDk4loWK1FDQgZSQs3zxRIMiYbUIrdmk+4nrtI3C7Nfb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
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

Hi Thomas,

sorry for the delay. I was on vacation and still digging though everything.

Just added an rb to the second patch, but can't find the first one 
anywhere in my mailbox. Going to double check that on patchwork instead.

Did you had a chance taking a look at the patches about moving the LRU 
into the resources?

Thanks,
Christian.

Am 23.08.21 um 09:19 schrieb Thomas Hellström:
> Hi, Chrstian
>
> I wonder whether you could Review / ack the second patch in this
> series,
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F449868%2F%3Fseries%3D91893%26rev%3D3&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cf2189ead62d64738b76a08d966065980%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637653000178013534%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=l9SktN3yIsHv5FXcp20wuoAyuaBAAQpVa6pzEkWjh8Q%3D&amp;reserved=0
>
> And also ack merging that through drm-intel-gt-next,
>
> Thanks,
> Thomas
>
>

