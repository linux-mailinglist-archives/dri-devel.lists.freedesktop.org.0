Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D0B4B1755
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 22:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6290C10E960;
	Thu, 10 Feb 2022 21:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BA910E95F;
 Thu, 10 Feb 2022 21:00:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4Yn0P48LDPVpxEXarbiYbOAR2biKL14iA6p89sm/fLaCftymHAKDciJpmbJUBYCHh6BFgMGpBoFniRGL2BDR7+g5gG9BOd4xUnY+SNxIZJOWjazN7AdxAB3NCQum8LLevSAuO2vWPZeYmye5TAmhjU9c9kW0memp6MyFB2H7yUnSW7wQhrCu6VJEsKygQqIJYr2cxVC367j2clrzyI5XglAksqcP7rIqjRud/sztMQCgI1BqeNoBIhq/fVLcvemTSZ7lvRGrDibhtV5SMmOEnlRUcVTTkJmwKaU0BBfgHOv4X1/umJgQZlsUvVGRCl5AqsnP5suhx4S+aBco+X7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kh0oyrINn2OVM65Nb1n7oGmL5CszRuzAvwYJ3S3NkoA=;
 b=nkgQrOzpUsUgDrBj53LuhBnWzZycTLRIEQB/3nD5NmxF7fGfE6uhB1I0RZPPEcoXs+bkde0feU2LzZ156wifaiUcm6JHhQVO5AZWmV5UkFbo6Aeux8s5sGYkOQnTnf7oltgdeCuGz3tedszHs68fN4rRCrM1dHGmEOQ+CbhLAN8LMeEmR4DV0Bejb+WnUpvpRpD1h2n8XEOFXNV0cfMp4OP5WWUQMFnpq+fL1toDsatAp0BfBtxqJ/2Rd2TLO8wG0wBsPm3BPbN7WFKfXtgaDI3+k1ldiPdGBmhcZJ4Ngnd+agA3EBaBwrm2dAqVksm+Gj8R6+5bdwGxHJ2aqvTqZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kh0oyrINn2OVM65Nb1n7oGmL5CszRuzAvwYJ3S3NkoA=;
 b=y7sXMqt02HVWFfP+NJk6TmEM1qHYOetFOLEeivCiOZo7dSqyDVViz9kYoAhsdjsvrFTGgxEiDx+Jal1dHbZDR0vGpK4PftTWLdzIIqlVVJ/yLwuO9QFMMqv2uX7648dhi0cSPgum0ZigJK0tfFh7LPleUzfP28UomsPa/YAz72k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB4952.namprd12.prod.outlook.com (2603:10b6:a03:1d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 21:00:05 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4975.014; Thu, 10 Feb 2022
 21:00:04 +0000
Message-ID: <cbdd0347-c94c-49d5-37db-5a9b5d2591f3@amd.com>
Date: Thu, 10 Feb 2022 16:00:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/8] mm: don't include <linux/memremap.h> in <linux/mm.h>
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Alex Sierra <alex.sierra@amd.com>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-7-hch@lst.de>
 <3287da2f-defa-9adb-e21c-c498972e674d@amd.com>
 <20220209174836.GA24864@lst.de>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220209174836.GA24864@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::17) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 203699ff-8db8-4a18-3bff-08d9ecd84fb6
X-MS-TrafficTypeDiagnostic: BY5PR12MB4952:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB495293B611BF9858AA927605922F9@BY5PR12MB4952.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XFmay3rlhkSSagkkKcN+aNePki6eC7W1Rt7ca7d4TxTD2Vw7xteoZvNLZIwx+5c+I8zLIKO0FGe47Uqp1tFPKxB93RQf3zzFwTILBkMaO217/MdBNh1Gz7Qu+9LV8pd2U4g5wSz3ifC4nF1lsw7i53vy7k9U6xR8UD2yaK8QF0RWj3A0xz+Rry/5xRqy79CLmTXDslNVqhhBaOE6LHCzuSKoe5xiq5e9rhc5/wYhUVyjr4sY+qKQic6YpUP+p7ziAlk99mIb8YAjFhOBmJ8KecEy3dsf770IESS8X824UQ7/5uJArMzm+sGHZhNaqwKAEwi4splPy3/kzHc8dDTf6BKD6lRBVG5VHisPNxSpWLXMhbvr8Uolyfc5YJF1/z1uq8DBPxerKn16D3rpw6jA2oNjXN8iKal2GQliFq4uv/OivXUTdHtX3MwtFwvIipaD4szHkBYyJxL7rQ1hubOOCfUfyrvPbmO7YM/oS2WcjmXnSQbXSt4Z/HnHuaYFmPngzwWekp3GV69aQxLMtFOwW3DDr/M32Euo3tpHur4t5EWeptgMPXdIEZ3BFL6TblIUvXa808XdhSfetaYCkYmIaqo5S7qmhyNPvurv3cssqvYbveoG4+D0TvSS77usQAt7N7uJkeDE+igf1e+iWijyIxcq6EpvNEHqpjM4Jn0pTKfmqTqnYJpDDk2rKwDZGPCHPGVX2M4inLupbwN/vykpKG9PTbLHm4WVx1AR7k92ZSfTDTWkbitTg1AwxhSfabBB5PS8c//gTetcQuwcdFwIcdIvpD0yJ/T+Kh0Mk/6OexuehgR+Hjn3lUuRsHapx+D/ad+zZqHfHctrLnLwWROI0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(66946007)(6636002)(54906003)(110136005)(6486002)(316002)(26005)(186003)(2906002)(2616005)(31686004)(66476007)(44832011)(6506007)(6512007)(8676002)(86362001)(5660300002)(7416002)(38100700002)(36756003)(508600001)(4326008)(66556008)(31696002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzV3dS85b0ZrREk3eG11RC9GQ09reHZsazVNRzY0THBjcit3dy9LdTkxS0FW?=
 =?utf-8?B?aWRrQnFtUktpN2l4ZUlHR0pmSEJ0bHBmemdpazhNL1JGVWZJQWdhd1RQMUt6?=
 =?utf-8?B?QUhsckR0bVhiK2lwZXJOcWxQeTloRGNIcHROd1kvN0o3Yng1bW9QOUNxSmlh?=
 =?utf-8?B?T21kNGo3dmJOTzhSemhtUSs3ZVN4Y2tEVjBERG45SWdCZURXaVRLNHpLU2Rs?=
 =?utf-8?B?RmJLQkJTWmJGQ1ZSeEV0Y3JNSUpndStDR29TSUo1bXgyV25LSkNiS2RCNW1J?=
 =?utf-8?B?ejZnVXFtZncrcklxQ1A3Y0lrb3ptbWtXQzU3aGdGM0RWWElNeCtaeGhvc2xx?=
 =?utf-8?B?aEk1MlJ1aERVNkU0MGszZDB1VXUvTGhTM3N1MU1Jd2xqcnZOcDM0amRBb0F5?=
 =?utf-8?B?dHdhdWw2L3kra0ZxdW1jQzhPdTVZMWFwN1E4K2dPNXp6dXRwZGlYMm1jQVVj?=
 =?utf-8?B?WnNycElJelJmOXgxclp0TFI3MnZyK2tmdnUrSno2d3NQSkFDT0hTclRCQ3hm?=
 =?utf-8?B?MmIrNXZQSHhpNnd3Ui85TDg3a2hqdEJFWEhWTlZqblpPUGhkWVp3TVBGVjBs?=
 =?utf-8?B?MU01Y3RZcmtpL29KUDJHc2x2dGtuUzFHaSs5c0tQK2t4em9TOThuZkxUdlhN?=
 =?utf-8?B?MFJBditUeFhlRytkdE9BRS92eG5pNlBaWHhyYWNPWS9pRzJpOE5lZ0VxVVc0?=
 =?utf-8?B?bEhpWFk1VG93NTNJYnhOYTVraC8zVDZVdXFodjFUaG55STBEdmpyRHZoWXQx?=
 =?utf-8?B?dmgzeGFTZ1lPdDlBQzFyRVNPSmMxcVpKbDlvZ3Q4WEtId1A1ZTFrSHVLWmR0?=
 =?utf-8?B?dkZHVmpON29hVWdHNDVJckpObUhRTVBtZnZzNHlaSk9vZVJoOENKbEQ4cUFJ?=
 =?utf-8?B?WjQwSVJOQjJBMUdyQ3c5YytsRDlYcjAyeWprYVBkQS84S0o4YUVCNG4yTktB?=
 =?utf-8?B?WWZ5M01TcXBkYmltRFpMQjNpaEFWQmtLZEJvOEhXeHc3QkI4RUNlR2FlTVdW?=
 =?utf-8?B?NkpJakFCRlcwck0rQUpyS1lHL1Flem1ZS0FZMkxndmhNTFNTcTlFbmUvYlRP?=
 =?utf-8?B?MGp3bVR3cGRkN3hpSitkK3lFWUxNS2NWSFBuMEdRKzNPejZnbnFUUFd5V3lm?=
 =?utf-8?B?TWJ2TUk2a3J3TmFVNlkwZjNEazlxeFAvb3hyQnpRTkxaTTcvSk5rQ3RjNG9B?=
 =?utf-8?B?ZEZLWnBqc3BPYVk2NXl5ZGlXanlkblZSbUIvbHcxSEl6UXBEdXVzTGhoMGVF?=
 =?utf-8?B?MWIyM1ZaeVBDU3k4NVFmWnh2VmlYZ3QyOXpYbXZTS2VpUjFhWEdXc2VKdXd1?=
 =?utf-8?B?T1F6K215enV1QmJOSkNVTjN0a2kzRklqall1YkgzOVRZWVVBS1pjbHJtaU4v?=
 =?utf-8?B?d1llRlUySGI3SElVbjNrdW1hdm9ZcnBVQ01DZFdVMm9LL2dleEZJMUZJWkFQ?=
 =?utf-8?B?NDhTWnpOeENZL2d0NVc3U21KTHpiOURNbHliajYxT3pvbVJ6NFo1U1lmWjdO?=
 =?utf-8?B?ZmJscWRIb0tjckNOcWx6Ri9aUlVZUzNpWXVhSWoreWQ5NDNvK3VJbjBFcThP?=
 =?utf-8?B?dExTZjdBU1hNOGFKZi8vYmhyQVBRK2NkK0cxNW9MVCt6VDBzckdkSVpFV3Bi?=
 =?utf-8?B?ZEhtK2N0Sm1KVmZvM0h5U3l0OEExbGFmVUIyRWZPdExTY1luV085REhhSUFl?=
 =?utf-8?B?VXlyN1dKWUlGcEh2N2xnSE9MREY3cVZ0OEZPUEJidU5jb2FkNllYNzNKcFFM?=
 =?utf-8?B?MDBEL0daQ3dvYThaNkJmby9EdnVaR0FyZW54dGFUdnNxb1RHblNYUFkwU1VK?=
 =?utf-8?B?WGhZczMxaUlLVjJmbmhqc1QwSHNjMC9leW5LcUV4bXdMYUlGU2RjbUFSMktM?=
 =?utf-8?B?eE9BNnpVU0VGNlBRTHJJc1puVkd4OGErSlorTmVJOXV3NGhOZ2FINDlya0xT?=
 =?utf-8?B?Y0JFTHVXL01rWkJydE1JU3NuMGVuaXJRTmR5MmJ0VG02c0RvL2VyN2lMMFRv?=
 =?utf-8?B?L3doS1FIeU1HTlArMDIrZytWT1M4RmxzQjEvMHhHQ3dCSFYrUnA0OEcrS2R1?=
 =?utf-8?B?T3Z0b3JkVUJEbVdMVG8yUXVrcHg3S1FTaEFKM1pjMkFRanV4UmtIeXFuU0Y5?=
 =?utf-8?B?N2xsZ203ZjA4VUU1Z211OElpSlhCWlozMWQyU1ZCdWxWQktBY2xwTlVVa3E4?=
 =?utf-8?Q?DlOL6Dqg8fydGyw6QWV6jzI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203699ff-8db8-4a18-3bff-08d9ecd84fb6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 21:00:04.6569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bjfng+oG8E5l2vEP+4D3mIIRf9dklX251SSKa3/+gkIcVAVq49jgMuVdWU+c3+yU3396jotb7URETBHb8ojUCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4952
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-02-09 um 12:48 schrieb Christoph Hellwig:
> On Mon, Feb 07, 2022 at 04:19:29PM -0500, Felix Kuehling wrote:
>> Am 2022-02-07 um 01:32 schrieb Christoph Hellwig:
>>> Move the check for the actual pgmap types that need the free at refcount
>>> one behavior into the out of line helper, and thus avoid the need to
>>> pull memremap.h into mm.h.
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> The amdkfd part looks good to me.
>>
>> It looks like this patch is not based on Alex Sierra's coherent memory
>> series. He added two new helpers is_device_coherent_page and
>> is_dev_private_or_coherent_page that would need to be moved along with
>> is_device_private_page and is_pci_p2pdma_page.
> FYI, here is a branch that contains a rebase of the coherent memory
> related patches on top of this series:
>
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/pgmap-refcount
>
> I don't have a good way to test this, but I'll at least let the build bot
> finish before sending it out (probably tomorrow).

Thank you for taking care of this rebase! Alex tested it on one of our 
coherent memory systems and it passed our tests.

I see you also included these rebased patches in your latest 27-patch 
series. I'll try to review the changes in more detail over the weekend.

Regards,
   Felix


