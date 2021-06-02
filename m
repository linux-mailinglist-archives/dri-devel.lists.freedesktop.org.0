Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E53985A0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40736EC30;
	Wed,  2 Jun 2021 09:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE7D6EC2A;
 Wed,  2 Jun 2021 09:48:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmKZK3C69/8837esQ7m7Ed7CjTiwCY8yt2585nRoNPQVA7p4A0NRM5MYiDVGYYBu6SrGxUQhO+uc7bkcVDoYzZleY1CeXKpsU6ZzIj5NhGjQ6Qt7z0R1xhgncI8gbfNsFG2eKdfH9V9OBmPgBSLjfy2KS978zJ2H09Oh0ndgV0X4b4YW1/XNJdeDGURG19FDAaqzvtqA4v8TyUeKmythoyzzzThSAK7bVuv64Mn73H+t6wTGBwuJsEP4Omk3lxqdDX6ugth7wYT7B0CUcqfLQJwbyz3UDUb5ECsFzf8+MwDmjW1mgToa97PV2BDCff7sMlnDh8YzJ9oizt7e4E7EsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhPaXbPX08+iakB3xOheq46SMgx5/f/VSakvK4DHJBA=;
 b=BEHy1/yKs/g5uEbYcU9S3cJlw2yco76OdqYAAtpIfg7t1rjQBpb+j5DK8dVJ76rOD/Z23xx5Bzr/CJW/EPOMEyCMLVM7ATPCfUz8SbJC8XEwWIDG9Qe9lYG6+CmD91o5L1w1kglUDq5pVNT1EyTif2iCAoA+bKJlJmr2EYAtRDy5tixUK4nZqRtImkdJzz/LpIsu78VCrW6UW44z+RjnjsQn47i9ykuFOPc6nWzWCVxe0SnOma7AWxd9l4GSSrUsy5LbAMZF8jMPkonJNIr47315eMuUBRf4aoB4KUlQMpUDeIChz2lft4nYE8dPWcRPDDtZIEGFgxbc756sVThIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhPaXbPX08+iakB3xOheq46SMgx5/f/VSakvK4DHJBA=;
 b=U0nKisfFerAbl+PSekA73opFeTYRli6fGz+fPO4T6JWsCXE9bu5vBzZfq1R0+vOA+813q+B5dKcCC5R7AZDGPy0gfzwx2FzntXjZDV90uJ1sQrbm0AZtLPlyzt9oMg2WxMJ0PzB1YCWmVDy1Qe0XwQYs+q3W4PRLcwjKzU5+zqk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4930.namprd12.prod.outlook.com (2603:10b6:208:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 09:48:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.033; Wed, 2 Jun 2021
 09:48:47 +0000
Subject: Re: Merging TTM branches through the Intel tree?
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <a29eaef9-2457-1393-6757-40956811daf8@linux.intel.com>
 <a6965639-acf6-b5f5-482c-2715e7fa69d4@amd.com>
 <b4c18e45-98c9-ce7f-b22c-c00c795844c2@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <baf4f828-76c8-6b47-5bba-9b9c8e7b307b@amd.com>
Date: Wed, 2 Jun 2021 11:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <b4c18e45-98c9-ce7f-b22c-c00c795844c2@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:cd07:2759:3eec:1d00]
X-ClientProxiedBy: PR1PR01CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00]
 (2a02:908:1252:fb60:cd07:2759:3eec:1d00) by
 PR1PR01CA0034.eurprd01.prod.exchangelabs.com (2603:10a6:102::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24 via Frontend
 Transport; Wed, 2 Jun 2021 09:48:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7b91892-ca52-4166-8c4f-08d925ab9dd9
X-MS-TrafficTypeDiagnostic: BL0PR12MB4930:
X-Microsoft-Antispam-PRVS: <BL0PR12MB49300146984CE1B1DB131962833D9@BL0PR12MB4930.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UT1VLC9Xg9zupkQcUxYU979VCG4SwmIsBMMFyW0lMVTItcbwaABHgnNO0MARIxjZl33FwfU5PBU0/SYCeRbzF3ZydxWhjCQ9mmSIzWexDf8k4XeDyazDXSJUIdS325GyVM7i5E8FCAeuzyoAvbXAxuqV9GbO+1JEjUzhFmPXL9qxMDYF/WL2IVjvbl2ypdvRiYLI2vWf/j6logB8Sd3zdzoxkqZDHH19skuyQvvFGRZYMev4y/v38G5BPzpsYKrIvwrUfs+X/2n5iKF6pC0EiBCPibQCVRg291plFEOGx/WHrfKtUtri/ncrUTVd+AirOL6i/AQKyAnQ33AEtkH+Ko2fElXPfrG5H1cfChkQ/E+0XfgEsVCZB0wGk7zQVgaKneoa7gfd7aPy48HfrZJzobCtjTaogaYm6FCOHIStaS2B0g1oaOIkMFPCC8+KJZhI9G+pY6AjzICCO/8DgmuOgONnCHim7X7TpwViF2SB82gfKVxrEsbVDcbB4xIlaohS99xBxlKbmxdBTXRS1sdRa8wusPnClOTcM8/eXekkuEoGH/wgEjPw2aJjrYjA9HLc1V1b/2ItTKkQ8gfGSi460BjbA6/zDJ32XKsdCQW+reZM77fww8apWRRSR5Gl72HLWybPpTSa3vMwBzZJ7oGwSemUuuRrNM+rGMQDJ2R/T1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(2906002)(36756003)(316002)(66574015)(110136005)(5660300002)(66476007)(66556008)(31686004)(4744005)(66946007)(53546011)(6666004)(8676002)(186003)(6486002)(16526019)(8936002)(38100700002)(31696002)(2616005)(86362001)(478600001)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cUxoQUxhWjQxdUZmNlVXMzEzWVM1SFdYRnA2MDlOUkdJMWpkN3FsY3VweWJH?=
 =?utf-8?B?OEtHemsrb1RJTjBnK1kxZTN5c0tMQjJ6T29uYXBwS0tNdUQ4aitqc3IyejRl?=
 =?utf-8?B?N2xMSFBSUC8wbklCcEgyYTBDeGxHK2ROZ3Mya0EzQ1RqSDRrb2dweFZXQ0Zx?=
 =?utf-8?B?ZmwxTElxVnIvVk5nNFFkNUQ5amlkWThvZTJ6QXhHc1poQ1dEOU5QRkJZajha?=
 =?utf-8?B?Q01YZ2JvL3NqYlpCREdjQlVmVWZOZVl3L0s2eVArWnp2WVBZSWdVUzR4VFdq?=
 =?utf-8?B?cklWOGxXUnBneldEUEVwOW9yQ21zTFcyOXFJcE5FYms1UXg1cXE4N3lGUFN6?=
 =?utf-8?B?aXVRKy9iUU45bWNFMjBxMlM4TGtHQzl2U0ZyaG9zdjdyT1pMRGhVdWd2NmZy?=
 =?utf-8?B?eDBORjV1SStpRUJPNENIM1YzeE5NQ2dqRlg4ME10U3lLdXZES1NBNEhiSFY1?=
 =?utf-8?B?MjJaZklDaGdOZmVzeVhuQkNHdFFKYXI3R0lBSEQ0Z1RXZHJ0QW1nUzFRUTR3?=
 =?utf-8?B?eG9rTkc4Y3huMlhJSXVHT1Jtbnh1dTZnZkVEdGVPSkhqVjZhZE9YSWVCT2hO?=
 =?utf-8?B?a2hRY3k4RlMwcDlKZzBNa0NsTVlrTHJMbE1WUy9LYUVjSVRuOGpqQy9rdWJB?=
 =?utf-8?B?UTVKSnhKdk43ZmkzaGZkYjJnN0RlcnFJL01pRVZzZVB0THNXNkZjR3d5UlZS?=
 =?utf-8?B?cVU0eUREc0dZTkdaTXg2dGJkVjE0UGx6aHFJNlgwK3dWYTN0REFRVG9wU2ZC?=
 =?utf-8?B?VXcvWkpWVlpVeUQyRWJReldJTFFIb2tLbEdZZmlQYWNmN2F6aTllOWxwR0lS?=
 =?utf-8?B?Z1VSazk4SGc1OW01eXZQM1V2dGlYMlk4aS94dlM2NHI5NjMrVjJqNXFXaW5h?=
 =?utf-8?B?UHFFVzh3K3NmNkowL3UwczhIM0xnSVVENThBcGhsL0FtRHVhRzViSUlHZGpT?=
 =?utf-8?B?NEFlczdTNUJwb01scmRZMFdpcGkvZVVmVlVKb0dMSVplaWFuQjJQMzhQcnZ3?=
 =?utf-8?B?VVl5SFdqWTNCTzh2czZLZ0dWa1ZHVE5LeVhadkFNVytxdU9lMXhpQ0daMS9Q?=
 =?utf-8?B?ZWRSVzlOOEZ0WkF1M1RtOHVNUSt3MHU3RGFqdDcvVzkrSlRicHcrQVZ3dERM?=
 =?utf-8?B?Y0g5WXg5NTcvNE4wcVB0L3lVL1RMaTdsbEhVZ1FNTHN6ZThWUXlNVWJxeCtK?=
 =?utf-8?B?bThITlJUdThkZDY0a2I0THJqU2NUQVBmZk1RVG81MjdsN2xLdXpjRUNCcHcy?=
 =?utf-8?B?bmxsaC9LcjY3UHdFOVFrY1FXRFdDaEZzZnVsWlowR0UrbkJCTUVrOGV6eEsx?=
 =?utf-8?B?VVBHV202RWRMK2VHRzR5UEwrNG5nQzVlWHpkZ1R1KytDNkFkVDBOTlhmQUFv?=
 =?utf-8?B?Sm9PVGt5TjJnMU9JaXlObk5MODVvUnhXVW5hSXYvdWl3TVJhVFF0ZnVGQ0Rv?=
 =?utf-8?B?K1Z1NWFsWDVORjBJNFRRMjFYd1dSKzQ2QUNWRnFBUzNNZmlJeEhWTXM4NkNw?=
 =?utf-8?B?c2dZWHhicDVtTms1UE9VL2MyVHR1QVZweEM4SDB3WG1jUGlNY2JKSWFaRmI4?=
 =?utf-8?B?cU1VV3hpZVVtK2tWTkdzL2ZTUEFrVXRZMi9MQlViVGxDK25EYkk0OVB5cEgz?=
 =?utf-8?B?eG9hbXN1b2N4NnRjTDVzK3ZRN0Y4UFNvMXM1TGQyTWxCbjNNRDQ1OWRGallD?=
 =?utf-8?B?TmJuTHpMbzB5cVRSaVNZWmRlRzgyQWdINHpVRzA2Ykd3blVZKzhFZEh6a3hL?=
 =?utf-8?B?aStXcEJ2QktTby9ZaE9yME9mVTYxM3hOKzNacklZZmFzMktHYjBBUDlWRjlH?=
 =?utf-8?B?SFN6ZXNVcjlNSjVKQTdmM1BWNzA0TzFsQ1crOUltYnFBWVdRaTdEYVI5V1Ft?=
 =?utf-8?Q?mCumsiuCnPsA6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b91892-ca52-4166-8c4f-08d925ab9dd9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 09:48:47.0329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqN9NEoIlKpMfTRbduPozDia+um/PgxC6WfkYsLrEvY85XnjTK5PEhbbnzW6fj3V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4930
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.06.21 um 11:16 schrieb Thomas Hellström (Intel):
>
> On 6/2/21 10:32 AM, Christian König wrote:
>> Uff I'm just waiting for feedback from Philip to merge a large patch 
>> set for TTM through drm-misc-next.
>>
>> I'm pretty sure we will run into merge conflicts if you try to push 
>> your changes through the Intel tree.
>>
>> Christian.
>
> OK, so what would be the best approach here?, Adding the TTM patches 
> to drm-misc-next when your set has landed?

I think I will send out out my set to Matthew once more for review, then 
push the common TTM stuff to drm-misc-next as much as possible.

Then you should be able to land your stuff to drm-misc-next and rebase 
on the end result.

Just need to note to David that drm-misc-next should be merged to 
drm-next before the Intel patches depending on that stuff land as well.

Christian.

>
> Thanks,
>
> Thomas
>

