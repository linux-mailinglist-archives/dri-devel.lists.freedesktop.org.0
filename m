Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3586E2F4766
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 10:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310756E311;
	Wed, 13 Jan 2021 09:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ACA6E30C;
 Wed, 13 Jan 2021 09:20:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+Zl4H1mK6QhhZ15emPd2ldGzP06fS+Ot3Rat9wqgW6PRRYb8f+LGb76/PyqYWO2Yg9q0BIGaDuSlaE+4ZfTNWucHcNBaaEo8J4B0avci7LqOHJJLAEUPL8k8TE6D/dFqr/rBMFMLPJ7vkRXiE27N+Y6qPbMVokq72DAzq5oaAgEAzVu0zEmvj9lO93dv2bj5Zvo6zKkQhbj8hAO6wSCYoktKM4RUKhbGDgoHzST9yY1uU9xwPQ4TR7LS1N2t2BCdw/0WmmxlIApjBq/83ALSB3rhK90LpcvhXbppe9ec9Qq6m5ZNI2RYoDsJko5etQ6HD+rbhfO8Pd8w0TBI6LCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AbDU+rB7tubO6Lr/B2b7ry6n60gtYL0fsD4M3MTdx0=;
 b=eOplW/ALK5cUPNhsvORm4EcaAw91KIIF2VZNUgaSCkOK7VQ1vBXEiCj/f2LK8VvChARys2v3C1fTDbGqP0IFk07/NwZZ5eeNkpqoUi1/aMPmi9SdrSah1AIXfff2kHp8azCeu3t1BEVaRRB14yVifGICcf2dza/59hhb4qvZK8L5ung0UEoZoZQ53io9T80iECuipjITuqtXCRun7owRK2POL9eBYRhUGn5WH0giC4kmXz6aKXdPJ7Yz6/CHKAlrOt7K0z+RnHK0PGt7hJ36tubIYSTOtN92ajelALoiZ2v41nMK6gy0WDjWVjQVRmDM3IfFHqD9MZaLXvJ3+W0eWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AbDU+rB7tubO6Lr/B2b7ry6n60gtYL0fsD4M3MTdx0=;
 b=CNAX33b3PxJCsNTsUV7VPmwDnxzOmjRoy4Zr5o7c/a9iNmQVjquvgCEjCiH5A/T+rDkEEvD8VoqGoaH25BQEDFur0ueXubTR3bVcR1JXiN/7mnE3q+OhsyqF8SBIxJQqGbgi+cRjUJcYQxmfTtzfN60fqByviXNBfBBj+HIrftU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB4770.namprd12.prod.outlook.com (2603:10b6:408:a1::30)
 by BN6PR12MB1650.namprd12.prod.outlook.com (2603:10b6:405:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 09:20:28 +0000
Received: from BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::a440:d0d:9875:252]) by BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::a440:d0d:9875:252%6]) with mapi id 15.20.3763.010; Wed, 13 Jan 2021
 09:20:28 +0000
Subject: Re: [PATCH v2 0/4] Revert "drm/amd/display: Expose new CRC window
 property" and changes associated with this commit
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
From: Wayne Lin <waynelin@amd.com>
Message-ID: <7ae0464e-29c7-c2dc-ad6c-ce12b6008250@amd.com>
Date: Wed, 13 Jan 2021 17:19:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
Content-Language: en-US
X-Originating-IP: [218.164.111.98]
X-ClientProxiedBy: HKAPR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:203:c9::9) To BN8PR12MB4770.namprd12.prod.outlook.com
 (2603:10b6:408:a1::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.141] (218.164.111.98) by
 HKAPR03CA0022.apcprd03.prod.outlook.com (2603:1096:203:c9::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Wed, 13 Jan 2021 09:20:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5cdb1a93-cdfc-4147-fb86-08d8b7a477c8
X-MS-TrafficTypeDiagnostic: BN6PR12MB1650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR12MB165052733824DBDA4BB43DB3FCA90@BN6PR12MB1650.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HU/pKJuO2+ezNEe/Rhp/kgx0u5vepXnvv2StVvlwDr4sBibzYU263eRzEH5NfmxeehTYRqemhDJHdr3uOsrZj34J4ahyLcUoF+Gt/Zpc/Nfl6gqG7wKr5/U8OjifNhtgwRsFwr3gtbUjx3muKK+C9xkZ07WR1+EfegVNQzoJssPtmSIB5DYFtRix+v2S8aV+R1MITR/Lh4WEwtjUBJpUjTfS/Nipm6dcFkVHaCswE0+WvGl7gWE5VeWLMYKKYtU5WtExRKNidM1grjvVkt5w4zocpVjd2PTVj++egD/psucn/W/VPvMyNzpU6dzI4AKpwo6s8L+sC18cRzLNql6/Jr2iJiK/3XKjDlX8Ne7DviZ1X2L/16+hgXyMsZW158KkLiPAhAFYdvH+AefRJQf7Oh81bA9ip6aoKyGYrQ3GtX6Rhiuugrqr9R2Y/NZFfJgMVZizyVZledtNbn4qUvMwFe0cCTTG2Z4/uRpTYCBOeMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB4770.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(2906002)(16576012)(66476007)(316002)(54906003)(8676002)(956004)(66556008)(36756003)(478600001)(2616005)(52116002)(83380400001)(8936002)(6666004)(16526019)(31696002)(6486002)(186003)(66946007)(53546011)(31686004)(5660300002)(4326008)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MThpWTNhMWtFYzNHbW9tZnlDOHM4R2dYNkhEZDZBR0hNbnlld281WGR0SVRC?=
 =?utf-8?B?dXlJOHNNU01Kd3F2elR0bkJZd0ZpME5SZ1pOdGV2aHp4KzdVYm5SOWdqTHc1?=
 =?utf-8?B?UW5Bb0tzVk1aenNVdUcwQkpSdFhjQzl6K3k1ajJqUTd1UmJSVXVOQkZETk9B?=
 =?utf-8?B?VUFyNkhiUGNTbmVBVmltakFBR0hraXlkUkhWd0hvUGZaZU5JczdjbVYvZ1Z0?=
 =?utf-8?B?dTJPamZpRzhMbWxKdVFNMDRnSTdqckt4NnBFVkUybW9oS3B1dlpqZStNeWdp?=
 =?utf-8?B?VFNjSEdrdG9GNzJGait1bm9yTkZjdWl4NHZYRk94SjZvYWk2TzcyZ0FjY0or?=
 =?utf-8?B?TDEvblI0NGR2ZWxIZ1QwbzVIS1JtY1BtbHhGd2NaUXc1ci9TQVpkSUoxeWtH?=
 =?utf-8?B?YzRibWtwWTFWRlFUc1ZsdnVMTkNKd0FwL0ZiWjV4V084Zi9aNmdsYlprRVZT?=
 =?utf-8?B?b3dERUdvckpodldnUWRoUnZCUmwxOVo5bjBlSzVmVjJmcVZsRzhyM29uVHFN?=
 =?utf-8?B?clFBeERjcXl6dWtOanEvMVQvQlY5d2lxdlFXREFETE1veE9tbThieWR3SXY3?=
 =?utf-8?B?UTJsL3NGUjkvWEdwNWtLZ01XdDk0RytCVUVxenZqdGFLK0xPRGR0NGt4OWJq?=
 =?utf-8?B?R0M0RThScnJidzJOdDMxUll6TDlIajZya1lXSU5lUUR1c0hSc1ZEckxwM2lz?=
 =?utf-8?B?aXJhdSt4UFlxVE8yLzEwbzI4aHRJYS9pNGdyaFFJSkFYeWNTZEVnU1REbTA0?=
 =?utf-8?B?TlhtY3BGZGJjazMzUENFc21MUGNMcUVyY2hlZStDSGVsWWlSWHNEY3pnUXI4?=
 =?utf-8?B?eFVOdFdLVFZ3UllIc29YaUVsaDJxcFZTbVJxQUJTY2VWS2JPdmozRy9xUjBm?=
 =?utf-8?B?eEtrcENJdVQrYUFBMDhydm1VN0ZCM3hLbVZ4L0NGdDNLd1E2VnV4TWhxd2Fj?=
 =?utf-8?B?bnhDakorUXI5aURRWXlPdUh2OEVCRDZkeDg2NGVFalcvTFpDbmUxSCt1SFVM?=
 =?utf-8?B?VDBlVTNXUWMzUDNVdGI4WWpodmYyTmxzaEZQN2tYTG9IZ3g2c1VhUGRkTXBr?=
 =?utf-8?B?ZWNVU2VqQ3NaWlI1L0VMam1DMThzbVVwMHF1Tk83NEEzTVc1YmcyU2lFNnJC?=
 =?utf-8?B?WlpZR0liSS9zL01JeVFKQk9kWHRCa0lOOXFJaEtKOUdqSEtEL0REaks0VnQ2?=
 =?utf-8?B?Y2tPS0R3QmlBcmxJSGVJbU5DZ09ORGNXektxd1lrRmhOUTBuUU43RERUak1Q?=
 =?utf-8?B?TXJ5UWtCTjlQSEl2cEFNazNjaFNISE5xV1BOZWU4OVhheUtxRFBxeGx6ZStS?=
 =?utf-8?Q?Roa6XZjcJP+exXnxmnp0tD5H31FUxVdduB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 09:20:28.3675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdb1a93-cdfc-4147-fb86-08d8b7a477c8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3elZHNZ1RSq6bi2fCmEFObDjDEWw/LP2hhXl/f80RxnFSnOzPMn1CgT6qXJlFdTHVJ0kjUNt33e7HK38XHbMqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1650
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
Cc: Roman Li <Roman.Li@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Bindu R <Bindu.R@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Siqueira.

Series is:
Reviewed-by: Wayne Lin<Wayne.Lin@amd.com>

On 1/12/21 10:55 PM, Rodrigo Siqueira wrote:
> Hi,
>
> In the V1, Wayne pointed out two problems:
>
> 1. The revert patch included one extra line that does not belong to it;
> 2. The original patch also had other fixes in the same commit;
>
> I removed the extra line from the reverted patch for tackling this
> issue, and I added one additional patch to this series that includes the
> other fix requested by Wayne.
>
> Thanks
>
> Original cover letter:
> A couple of weeks ago, Daniel highlighted  [1] some issue related to a
> patch entitle "drm/amd/display: Expose new CRC window property". After
> discussion, we realize that we can revert that patch because we will
> need to create a debugfs or full UAPI for CRC soon, which will make this
> code obsolete. We got two other patches related to this same code; for
> this reason, this patchset reverts all changes associated with that
> specific commit.
>
> Rodrigo Siqueira (3):
>    Revert "drm/amd/display: Fix unused variable warning"
>    Revert "drm/amdgpu/disply: fix documentation warnings in display
>      manager"
>    Revert "drm/amd/display: Expose new CRC window property"
>
> Wayne Lin (1):
>    drm/amd/display: Fix to be able to stop crc calculation
>
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 142 ++----------------
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  38 -----
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  54 +------
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |   5 +-
>   4 files changed, 11 insertions(+), 228 deletions(-)
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
